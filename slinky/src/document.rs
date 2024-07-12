/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    collections::HashMap,
    fs,
    path::{Path, PathBuf},
};

use serde::Deserialize;

use crate::{
    absent_nullable::AbsentNullable, segment::SegmentSerial, settings::SettingsSerial,
    vram_class::VramClassSerial, Segment, Settings, SlinkyError, VramClass,
};

#[derive(PartialEq, Debug)]
pub struct Document {
    pub settings: Settings,

    pub vram_classes: Vec<VramClass>,

    pub segments: Vec<Segment>,

    pub custom_options: HashMap<String, String>,
}

impl Document {
    pub fn read_file(path: &Path) -> Result<Self, SlinkyError> {
        let f = match fs::File::open(path) {
            Ok(f) => f,
            Err(e) => {
                return Err(SlinkyError::FailedFileOpen {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                })
            }
        };
        let document_serial: DocumentSerial = match serde_yaml::from_reader(f) {
            Ok(d) => d,
            Err(e) => {
                return Err(SlinkyError::FailedYamlParsing {
                    description: e.to_string(),
                })
            }
        };

        document_serial.unserialize()
    }

    fn get_custom_option_value(
        &self,
        custom_option: &str,
        original_path: &Path,
    ) -> Result<&str, SlinkyError> {
        match self.custom_options.get(custom_option) {
            None => Err(SlinkyError::CustomOptionInPathNotProvided {
                path: original_path.into(),
                custom_option: custom_option.into(),
            }),
            Some(val) => Ok(val),
        }
    }

    /// Replace all the `{key}` instances on the `path` argument with the corresponding value specified on the global `custom_options`.
    ///
    /// If the `key` is not present on the custom options then it returns an error.
    pub(crate) fn escape_path(&self, path: &Path) -> Result<PathBuf, SlinkyError> {
        let mut new_path = PathBuf::new();

        for component in path.iter() {
            // &OsStr is dumb so we convert each component into &str, hopefully the conversion isn't noticeable on runtime
            if let Some(c) = component.to_str() {
                if c.starts_with('{') && c.ends_with('}') {
                    // left/{thingy}/right

                    let custom_option = &c[1..c.len() - 1];

                    new_path.push(self.get_custom_option_value(custom_option, path)?);
                } else if !c.contains('{') || !c.contains('}') {
                    // No replacement at all
                    new_path.push(component);
                } else {
                    // There may be one or more replacements, so we need to look for all of them.

                    let mut new_component = String::new();
                    let mut within_replacment = false;
                    let mut custom_option = String::new();

                    for character in c.chars() {
                        if within_replacment {
                            if character == '}' {
                                new_component +=
                                    self.get_custom_option_value(&custom_option, path)?;

                                within_replacment = false;
                                custom_option.clear();
                            } else {
                                custom_option.push(character);
                            }
                        } else {
                            // Haven't found a replacement yet, continue searching
                            if character == '{' {
                                within_replacment = true;
                            } else {
                                new_component.push(character);
                            }
                        }
                    }

                    new_path.push(new_component)
                }
            } else {
                new_path.push(component);
            }
        }

        Ok(new_path)
    }

    pub(crate) fn should_emit_entry(&self, exclude_if_any: &[(String, String)], exclude_if_all: &[(String, String)], include_if_any: &[(String, String)], include_if_all: &[(String, String)]) -> bool {
        if exclude_if_any
            .iter()
            .any(|(key, value)| self.custom_options.get(key) == Some(value))
        {
            return false;
        }

        if !exclude_if_all.is_empty()
            && exclude_if_all
                .iter()
                .all(|(key, value)| self.custom_options.get(key) == Some(value))
        {
            return false;
        }

        if !include_if_any.is_empty() || !include_if_all.is_empty() {
            // If neither include fields match the options then we do not emit this entry

            let mut exit = false;
            if !include_if_any.is_empty() {
                exit = !include_if_any
                    .iter()
                    .any(|(key, value)| self.custom_options.get(key) == Some(value));
            }
            if (exit || include_if_any.is_empty()) && !include_if_all.is_empty() {
                exit = !include_if_all
                    .iter()
                    .all(|(key, value)| self.custom_options.get(key) == Some(value));
            }
            if exit {
                return false;
            }
        }

        true
    }
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct DocumentSerial {
    #[serde(default)]
    pub settings: AbsentNullable<SettingsSerial>,

    #[serde(default)]
    pub vram_classes: AbsentNullable<Vec<VramClassSerial>>,

    pub segments: Vec<SegmentSerial>,
}

impl DocumentSerial {
    pub fn unserialize(self) -> Result<Document, SlinkyError> {
        let settings = match self.settings.get_non_null_no_default("settings")? {
            None => Settings::default(),
            Some(v) => v.unserialize()?,
        };

        if self.segments.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "segments".to_string(),
            });
        }

        let mut vram_classes = Vec::new();
        match self.vram_classes.get_non_null_no_default("vram_classes")? {
            None => (),
            Some(v) => {
                for c in v {
                    vram_classes.push(c.unserialize(&settings)?);
                }
            }
        }

        let mut segments = Vec::with_capacity(self.segments.len());
        for seg in self.segments {
            segments.push(seg.unserialize(&settings)?);
        }

        Ok(Document {
            settings,
            vram_classes,
            segments,
            custom_options: HashMap::new(),
        })
    }
}
