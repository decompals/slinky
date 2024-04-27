/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::{absent_nullable::AbsentNullable, Settings, SlinkyError};

#[derive(PartialEq, Debug)]
pub struct VramClass {
    pub name: String,

    pub fixed_vram: Option<u32>,

    pub follows_classes: Vec<String>,
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct VramClassSerial {
    pub name: String,

    #[serde(default)]
    pub fixed_vram: AbsentNullable<u32>,

    #[serde(default)]
    pub follows_classes: AbsentNullable<Vec<String>>,
}

impl VramClassSerial {
    pub fn unserialize(self, _settings: &Settings) -> Result<VramClass, SlinkyError> {
        if self.name.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "name".to_string(),
            });
        }
        let name = self.name;

        let fixed_vram = self
            .fixed_vram
            .get_optional_nullable("fixed_vram", || None)?;

        let follows_classes = self.follows_classes.get_non_null("follows_classes", || Vec::new())?;

        if fixed_vram.is_some() && !follows_classes.is_empty() {
            return Err(SlinkyError::InvalidFieldCombo {
                field1: "fixed_vram".into(),
                field2: "follows_classes".into(),
            });
        }

        if fixed_vram.is_none() && follows_classes.is_empty() {
            return Err(SlinkyError::MissingAnyOfOptionalFields { fields: "'fixed_vram', 'follows_classes'".into() })
        }

        Ok(VramClass {
            name,
            fixed_vram,
            follows_classes,
        })
    }
}
