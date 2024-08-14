/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{fs, path::Path};

use serde::Deserialize;

use crate::{
    absent_nullable::AbsentNullable, required_symbol::RequiredSymbolSerial, segment::SegmentSerial,
    settings::SettingsSerial, symbol_assignment::SymbolAssignmentSerial, traits::Serial,
    vram_class::VramClassSerial, RequiredSymbol, Segment, Settings, SlinkyError, SymbolAssignment,
    VramClass,
};

#[derive(PartialEq, Debug)]
pub struct Document {
    pub settings: Settings,

    pub vram_classes: Vec<VramClass>,

    pub segments: Vec<Segment>,

    pub entry: Option<String>,
    pub symbol_assignments: Vec<SymbolAssignment>,
    pub required_symbols: Vec<RequiredSymbol>,
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

    #[serde(default)]
    pub entry: AbsentNullable<String>,
    #[serde(default)]
    pub symbol_assignments: AbsentNullable<Vec<SymbolAssignmentSerial>>,
    #[serde(default)]
    pub required_symbols: AbsentNullable<Vec<RequiredSymbolSerial>>,
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

        let vram_classes = self
            .vram_classes
            .get_non_null("vram_classes", Vec::new)?
            .unserialize(&settings)?;

        let segments = self.segments.unserialize(&settings)?;

        let entry = self.entry.get_non_null_no_default("entry")?;

        let symbol_assignments = self
            .symbol_assignments
            .get_non_null("symbol_assignments", Vec::new)?
            .unserialize(&settings)?;

        let required_symbols = self
            .required_symbols
            .get_non_null("required_symbols", Vec::new)?
            .unserialize(&settings)?;

        Ok(Document {
            settings,
            vram_classes,
            segments,
            entry,
            symbol_assignments,
            required_symbols,
        })
    }
}
