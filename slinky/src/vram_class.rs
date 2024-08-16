/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::{absent_nullable::AbsentNullable, traits::Serial, KeepSections, Settings, SlinkyError};

#[derive(PartialEq, Debug, Clone)]
pub struct VramClass {
    pub name: String,

    pub fixed_vram: Option<u32>,

    pub fixed_symbol: Option<String>,

    pub follows_classes: Vec<String>,

    pub keep_sections: KeepSections,

    // Settings from below do not come from the document.
    pub emitted: bool,
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct VramClassSerial {
    pub name: String,

    #[serde(default)]
    pub fixed_vram: AbsentNullable<u32>,

    #[serde(default)]
    pub fixed_symbol: AbsentNullable<String>,

    #[serde(default)]
    pub follows_classes: AbsentNullable<Vec<String>>,

    #[serde(default)]
    pub keep_sections: KeepSections,
}

impl Serial for VramClassSerial {
    type Output = VramClass;

    fn unserialize(self, _settings: &Settings) -> Result<Self::Output, SlinkyError> {
        if self.name.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "name".to_string(),
            });
        }
        let name = self.name;

        let fixed_vram = self.fixed_vram.get_non_null_no_default("fixed_vram")?;

        let fixed_symbol = self.fixed_symbol.get_non_null_no_default("fixed_symbol")?;

        let follows_classes = self
            .follows_classes
            .get_non_null("follows_classes", Vec::new)?;

        if fixed_vram.is_some() {
            if fixed_symbol.is_some() {
                return Err(SlinkyError::InvalidFieldCombo {
                    field1: "fixed_vram".into(),
                    field2: "fixed_symbol".into(),
                });
            }

            if !follows_classes.is_empty() {
                return Err(SlinkyError::InvalidFieldCombo {
                    field1: "fixed_vram".into(),
                    field2: "follows_classes".into(),
                });
            }
        }

        if fixed_symbol.is_some() && !follows_classes.is_empty() {
            return Err(SlinkyError::InvalidFieldCombo {
                field1: "fixed_symbol".into(),
                field2: "follows_classes".into(),
            });
        }

        if fixed_vram.is_none() && fixed_symbol.is_none() && follows_classes.is_empty() {
            return Err(SlinkyError::MissingAnyOfOptionalFields {
                fields: "'fixed_vram', 'fixed_symbol', 'follows_classes'".into(),
            });
        }

        let keep_sections = self.keep_sections;

        Ok(Self::Output {
            name,
            fixed_vram,
            fixed_symbol,
            follows_classes,
            keep_sections,

            emitted: false,
        })
    }
}
