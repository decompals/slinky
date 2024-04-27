/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{fs, path::Path};

use serde::Deserialize;

use crate::{
    absent_nullable::AbsentNullable, segment::SegmentSerial, settings::SettingsSerial, vram_class::VramClassSerial, Segment, Settings, SlinkyError, VramClass
};

#[derive(PartialEq, Debug)]
pub struct Document {
    pub settings: Settings,

    pub vram_classes: Vec<VramClass>,

    pub segments: Vec<Segment>,
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
            },
        }

        let mut segments = Vec::with_capacity(self.segments.len());
        for seg in self.segments {
            segments.push(seg.unserialize(&settings)?);
        }

        Ok(Document { settings, vram_classes, segments })
    }
}
