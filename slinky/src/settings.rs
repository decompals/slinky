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

    // Options passed down to each segment
    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    pub subalign: Option<u32>,

    pub wildcard_sections: bool,

    pub fill_value: Option<u32>,
}

// TODO: consider changing the defaults before 1.0.0

fn settings_base_path_default() -> PathBuf {
    PathBuf::new()
}

fn settings_linker_symbols_style_default() -> LinkerSymbolsStyle {
    LinkerSymbolsStyle::Splat
}

fn settings_alloc_sections_default() -> Vec<String> {
    vec![
        ".text".into(),
        ".data".into(),
        ".rodata".into(),
        ".sdata".into(),
    ]
}

fn settings_noload_sections_default() -> Vec<String> {
    vec![
        ".sbss".into(),
        ".scommon".into(),
        ".bss".into(),
        "COMMON".into(),
    ]
}

fn settings_subalign_default() -> Option<u32> {
    Some(16)
}

fn settings_wildcard_sections_default() -> bool {
    true
}

fn settings_fill_value_default() -> Option<u32> {
    Some(0)
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            base_path: settings_base_path_default(),
            linker_symbols_style: settings_linker_symbols_style_default(),

            alloc_sections: settings_alloc_sections_default(),
            noload_sections: settings_noload_sections_default(),

            subalign: settings_subalign_default(),

            wildcard_sections: settings_wildcard_sections_default(),

            fill_value: settings_fill_value_default(),
        }
    }
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
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

    #[serde(default)]
    pub fill_value: AbsentNullable<u32>,
}

impl SettingsSerial {
    pub fn unserialize(self) -> Result<Settings, SlinkyError> {
        let base_path = self
            .base_path
            .get_non_null("base_path", settings_base_path_default)?;
        let linker_symbols_style = self.linker_symbols_style.get_non_null(
            "linker_symbols_style",
            settings_linker_symbols_style_default,
        )?;

        let alloc_sections = self
            .alloc_sections
            .get_non_null("alloc_sections", settings_alloc_sections_default)?;
        let noload_sections = self
            .noload_sections
            .get_non_null("noload_sections", settings_noload_sections_default)?;

        let subalign = self
            .subalign
            .get_optional_nullable("subalign", settings_subalign_default)?;

        let wildcard_sections = self
            .wildcard_sections
            .get_non_null("wildcard_sections", settings_wildcard_sections_default)?;

        let fill_value = self
            .fill_value
            .get_optional_nullable("fill_value", settings_fill_value_default)?;

        Ok(Settings {
            base_path,
            linker_symbols_style,
            alloc_sections,
            noload_sections,
            subalign,
            wildcard_sections,
            fill_value,
        })
    }
}
