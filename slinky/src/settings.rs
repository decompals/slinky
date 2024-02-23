/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::path::PathBuf;

use crate::{
    absent_nullable::AbsentNullable, linker_symbols_style::LinkerSymbolsStyle, SlinkyError,
};

#[derive(PartialEq, Debug)]
pub struct Settings {
    pub base_path: PathBuf,
    pub linker_symbols_style: LinkerSymbolsStyle,

    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    // Options passed down to each segment
    pub subalign: Option<u32>,

    pub wildcard_sections: bool,
    //pub fill_value: Option<u32>,
}

// TODO: consider changing the defaults before 1.0.0
impl Default for Settings {
    fn default() -> Self {
        Self {
            base_path: PathBuf::new(),
            linker_symbols_style: LinkerSymbolsStyle::Splat,

            alloc_sections: vec![
                ".text".into(),
                ".data".into(),
                ".rodata".into(),
                ".sdata".into(),
            ],
            noload_sections: vec![
                ".sbss".into(),
                ".scommon".into(),
                ".bss".into(),
                "COMMON".into(),
            ],

            subalign: Some(16),

            wildcard_sections: true,
            // fill_value: Some(Some(0)),
        }
    }
}

#[derive(Deserialize, PartialEq, Debug)]
pub(crate) struct SettingsSerial {
    #[serde(default)]
    pub base_path: AbsentNullable<PathBuf>,
    #[serde(default)]
    pub linker_symbols_style: AbsentNullable<LinkerSymbolsStyle>,

    #[serde(default)]
    pub alloc_sections: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub noload_sections: AbsentNullable<Vec<String>>,

    // Options passed down to each segment
    #[serde(default)]
    pub subalign: AbsentNullable<u32>,

    #[serde(default)]
    pub wildcard_sections: AbsentNullable<bool>,
    //#[serde(default)]
    //pub fill_value: AbsentNullable<u32>,
}

impl SettingsSerial {
    pub fn unserialize(self) -> Result<Settings, SlinkyError> {
        let mut ret = Settings::default();

        ret.base_path = self.base_path.get_non_null("base_path", || ret.base_path)?;
        ret.linker_symbols_style = self
            .linker_symbols_style
            .get_non_null("linker_symbols_style", || ret.linker_symbols_style)?;

        ret.alloc_sections = self
            .alloc_sections
            .get_non_null("alloc_sections", || ret.alloc_sections)?;
        ret.noload_sections = self
            .noload_sections
            .get_non_null("noload_sections", || ret.noload_sections)?;

        ret.subalign = self
            .subalign
            .get_optional_nullable("subalign", || ret.subalign)?;

        ret.wildcard_sections = self
            .wildcard_sections
            .get_non_null("wildcard_sections", || ret.wildcard_sections)?;

        Ok(ret)
    }
}
