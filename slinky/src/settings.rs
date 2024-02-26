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

    pub hardcoded_gp_value: Option<u32>,

    pub discard_wildcard_section: bool,

    // Options passed down to each segment
    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    pub subalign: Option<u32>,

    pub wildcard_sections: bool,

    pub fill_value: Option<u32>,
}

// TODO: consider changing the defaults before 1.0.0

fn settings_default_base_path() -> PathBuf {
    PathBuf::new()
}

fn settings_default_linker_symbols_style() -> LinkerSymbolsStyle {
    LinkerSymbolsStyle::Splat
}

fn settings_default_hardcoded_gp_value() -> Option<u32> {
    None
}

fn settings_default_discard_wildcard_section() -> bool {
    true
}

fn settings_default_alloc_sections() -> Vec<String> {
    vec![
        ".text".into(),
        ".data".into(),
        ".rodata".into(),
        ".sdata".into(),
    ]
}

fn settings_default_noload_sections() -> Vec<String> {
    vec![
        ".sbss".into(),
        ".scommon".into(),
        ".bss".into(),
        "COMMON".into(),
    ]
}

fn settings_default_subalign() -> Option<u32> {
    Some(16)
}

fn settings_default_wildcard_sections() -> bool {
    true
}

fn settings_default_fill_value() -> Option<u32> {
    Some(0)
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            base_path: settings_default_base_path(),
            linker_symbols_style: settings_default_linker_symbols_style(),

            hardcoded_gp_value: settings_default_hardcoded_gp_value(),

            discard_wildcard_section: settings_default_discard_wildcard_section(),

            alloc_sections: settings_default_alloc_sections(),
            noload_sections: settings_default_noload_sections(),

            subalign: settings_default_subalign(),

            wildcard_sections: settings_default_wildcard_sections(),

            fill_value: settings_default_fill_value(),
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
    pub hardcoded_gp_value: AbsentNullable<u32>,

    #[serde(default)]
    pub discard_wildcard_section: AbsentNullable<bool>,

    #[serde(default)]
    pub alloc_sections: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub noload_sections: AbsentNullable<Vec<String>>,

    // Options passed down to each Segment
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
            .get_non_null("base_path", settings_default_base_path)?;
        let linker_symbols_style = self.linker_symbols_style.get_non_null(
            "linker_symbols_style",
            settings_default_linker_symbols_style,
        )?;

        let hardcoded_gp_value = self
            .hardcoded_gp_value
            .get_optional_nullable("hardcoded_gp_value", settings_default_hardcoded_gp_value)?;

        let discard_wildcard_section = self.discard_wildcard_section.get_non_null(
            "discard_wildcard_section",
            settings_default_discard_wildcard_section,
        )?;

        let alloc_sections = self
            .alloc_sections
            .get_non_null("alloc_sections", settings_default_alloc_sections)?;
        let noload_sections = self
            .noload_sections
            .get_non_null("noload_sections", settings_default_noload_sections)?;

        let subalign = self
            .subalign
            .get_optional_nullable("subalign", settings_default_subalign)?;

        let wildcard_sections = self
            .wildcard_sections
            .get_non_null("wildcard_sections", settings_default_wildcard_sections)?;

        let fill_value = self
            .fill_value
            .get_optional_nullable("fill_value", settings_default_fill_value)?;

        Ok(Settings {
            base_path,
            linker_symbols_style,
            hardcoded_gp_value,
            discard_wildcard_section,
            alloc_sections,
            noload_sections,
            subalign,
            wildcard_sections,
            fill_value,
        })
    }
}
