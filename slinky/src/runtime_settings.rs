/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    collections::HashMap,
    path::{Path, PathBuf},
};

use crate::SlinkyError;

#[derive(PartialEq, Debug)]
pub struct RuntimeSettings {
    custom_options: HashMap<String, String>,

    emit_version_comment: bool,
}

impl Default for RuntimeSettings {
    fn default() -> Self {
        Self::new()
    }
}

impl RuntimeSettings {
    pub fn new() -> Self {
        Self {
            custom_options: HashMap::new(),

            emit_version_comment: true,
        }
    }

    pub fn custom_options(&self) -> &HashMap<String, String> {
        &self.custom_options
    }

    pub fn add_custom_options<I>(&mut self, others: I)
    where
        I: IntoIterator<Item = (String, String)>,
    {
        self.custom_options.extend(others);
    }

    pub fn emit_version_comment(&self) -> bool {
        self.emit_version_comment
    }

    pub fn set_emit_version_comment(&mut self, emit: bool) {
        self.emit_version_comment = emit;
    }
}

impl RuntimeSettings {
    fn get_custom_option_value_for_path(
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

                    new_path.push(self.get_custom_option_value_for_path(custom_option, path)?);
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
                                    self.get_custom_option_value_for_path(&custom_option, path)?;

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

    pub(crate) fn should_emit_entry(
        &self,
        exclude_if_any: &[(String, String)],
        exclude_if_all: &[(String, String)],
        include_if_any: &[(String, String)],
        include_if_all: &[(String, String)],
    ) -> bool {
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
