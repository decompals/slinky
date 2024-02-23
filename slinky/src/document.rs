/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{fs, path::Path};

use serde::Deserialize;

use crate::{
    absent_nullable::AbsentNullable, segment::SegmentSerial, settings::SettingsSerial, Segment,
    Settings, SlinkyError,
};

#[derive(PartialEq, Debug, Default)]
pub struct Document {
    pub settings: Settings,

    pub segments: Vec<Segment>,
}

impl Document {
    pub fn read_file(path: &Path) -> Result<Self, SlinkyError> {
        let f = match fs::File::open(path) {
            Ok(f) => f,
            Err(e) => {
                return Err(SlinkyError::FailedFileOpen {
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

        Ok(document_serial.unserialize()?)
    }
}

#[derive(Deserialize, PartialEq, Debug)]
pub(crate) struct DocumentSerial {
    #[serde(default)]
    pub settings: AbsentNullable<SettingsSerial>,

    pub segments: Vec<SegmentSerial>,
}

impl DocumentSerial {
    pub fn unserialize(self) -> Result<Document, SlinkyError> {
        let mut ret = Document::default();

        ret.settings = match self.settings.get_non_null_no_default("settings")? {
            None => ret.settings,
            Some(v) => v.unserialize()?,
        };

        ret.segments.reserve(self.segments.len());
        for seg in self.segments {
            ret.segments.push(seg.unserialize(&ret.settings)?);
        }

        Ok(ret)
    }
}
