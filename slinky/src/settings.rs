/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::{collections::HashMap, path::PathBuf};

use crate::{
    absent_nullable::AbsentNullable, linker_symbols_style::LinkerSymbolsStyle, SlinkyError,
};

#[derive(PartialEq, Debug)]
pub struct Settings {
    pub base_path: PathBuf,
    pub linker_symbols_style: LinkerSymbolsStyle,

    pub hardcoded_gp_value: Option<u32>,

    pub d_path: Option<PathBuf>,
    pub target_path: Option<PathBuf>,

    pub symbols_header_path: Option<PathBuf>,
    pub symbols_header_type: String,
    pub symbols_header_as_array: bool,

    pub sections_allowlist: Vec<String>,
    pub sections_allowlist_extra: Vec<String>,
    pub sections_denylist: Vec<String>,
    pub discard_wildcard_section: bool,

    pub single_segment_mode: bool,

    pub partial_scripts_folder: PathBuf,
    pub partial_build_segments_folder: PathBuf,

    // Options passed down to each segment
    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    pub subalign: Option<u32>,
    pub segment_start_align: Option<u32>,
    pub section_end_align: Option<u32>,
    pub sections_start_alignment: HashMap<String, u32>,

    pub wildcard_sections: bool,

    pub fill_value: Option<u32>,
}

// TODO: consider changing the defaults before 1.0.0

fn settings_default_base_path() -> PathBuf {
    PathBuf::new()
}

const fn settings_default_linker_symbols_style() -> LinkerSymbolsStyle {
    LinkerSymbolsStyle::Splat
}

const fn settings_default_d_path() -> Option<PathBuf> {
    None
}

const fn settings_default_target_path() -> Option<PathBuf> {
    None
}

const fn settings_default_symbols_header_path() -> Option<PathBuf> {
    None
}

fn settings_default_symbols_header_type() -> String {
    "char".to_string()
}

const fn settings_default_symbols_header_as_array() -> bool {
    true
}

const fn settings_default_hardcoded_gp_value() -> Option<u32> {
    None
}

const fn settings_default_sections_allowlist() -> Vec<String> {
    vec![]
}

fn settings_default_sections_allowlist_extra() -> Vec<String> {
    vec![".shstrtab".into()]
}

fn settings_default_sections_denylist() -> Vec<String> {
    vec![
        ".reginfo".into(),
        ".MIPS.abiflags".into(),
        ".MIPS.options".into(),
        ".note.gnu.build-id".into(),
        ".interp".into(),
        ".eh_frame".into(),
    ]
}

const fn settings_default_discard_wildcard_section() -> bool {
    true
}

const fn settings_default_single_segment_mode() -> bool {
    false
}

fn settings_default_partial_scripts_folder() -> PathBuf {
    PathBuf::new()
}

fn settings_default_partial_build_segments_folder() -> PathBuf {
    PathBuf::new()
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

const fn settings_default_subalign() -> Option<u32> {
    Some(0x10)
}

const fn settings_default_segment_start_align() -> Option<u32> {
    None
}

const fn settings_default_section_end_align() -> Option<u32> {
    Some(0x10)
}

fn settings_default_sections_start_alignment() -> HashMap<String, u32> {
    HashMap::new()
}

const fn settings_default_wildcard_sections() -> bool {
    true
}

const fn settings_default_fill_value() -> Option<u32> {
    Some(0)
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            base_path: settings_default_base_path(),
            linker_symbols_style: settings_default_linker_symbols_style(),

            hardcoded_gp_value: settings_default_hardcoded_gp_value(),

            d_path: settings_default_d_path(),
            target_path: settings_default_target_path(),

            symbols_header_path: settings_default_symbols_header_path(),
            symbols_header_type: settings_default_symbols_header_type(),
            symbols_header_as_array: settings_default_symbols_header_as_array(),

            sections_allowlist: settings_default_sections_allowlist(),
            sections_allowlist_extra: settings_default_sections_allowlist_extra(),
            sections_denylist: settings_default_sections_denylist(),
            discard_wildcard_section: settings_default_discard_wildcard_section(),

            single_segment_mode: settings_default_single_segment_mode(),

            partial_scripts_folder: settings_default_partial_scripts_folder(),
            partial_build_segments_folder: settings_default_partial_build_segments_folder(),

            alloc_sections: settings_default_alloc_sections(),
            noload_sections: settings_default_noload_sections(),

            subalign: settings_default_subalign(),
            segment_start_align: settings_default_segment_start_align(),
            section_end_align: settings_default_section_end_align(),
            sections_start_alignment: settings_default_sections_start_alignment(),

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
    pub d_path: AbsentNullable<PathBuf>,
    #[serde(default)]
    pub target_path: AbsentNullable<PathBuf>,

    #[serde(default)]
    pub symbols_header_path: AbsentNullable<PathBuf>,
    #[serde(default)]
    pub symbols_header_type: AbsentNullable<String>,
    #[serde(default)]
    pub symbols_header_as_array: AbsentNullable<bool>,

    #[serde(default)]
    pub sections_allowlist: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub sections_allowlist_extra: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub sections_denylist: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub discard_wildcard_section: AbsentNullable<bool>,

    #[serde(default)]
    pub single_segment_mode: AbsentNullable<bool>,

    #[serde(default)]
    pub partial_scripts_folder: AbsentNullable<PathBuf>,
    #[serde(default)]
    pub partial_build_segments_folder: AbsentNullable<PathBuf>,

    // Options passed down to each Segment
    #[serde(default)]
    pub alloc_sections: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub noload_sections: AbsentNullable<Vec<String>>,

    #[serde(default)]
    pub subalign: AbsentNullable<u32>,
    #[serde(default)]
    pub segment_start_align: AbsentNullable<u32>,
    #[serde(default)]
    pub section_end_align: AbsentNullable<u32>,
    #[serde(default)]
    pub sections_start_alignment: AbsentNullable<HashMap<String, u32>>,

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

        let d_path = self
            .d_path
            .get_optional_nullable("d_path", settings_default_d_path)?;
        let target_path = self
            .target_path
            .get_optional_nullable("target_path", settings_default_target_path)?;

        let symbols_header_path = self
            .symbols_header_path
            .get_optional_nullable("symbols_header_path", settings_default_symbols_header_path)?;
        let symbols_header_type = self
            .symbols_header_type
            .get_non_null("symbols_header_type", settings_default_symbols_header_type)?;
        let symbols_header_as_array = self.symbols_header_as_array.get_non_null(
            "symbols_header_as_array",
            settings_default_symbols_header_as_array,
        )?;

        let sections_allowlist = self
            .sections_allowlist
            .get_non_null("sections_allowlist", settings_default_sections_allowlist)?;
        let sections_allowlist_extra = self.sections_allowlist_extra.get_non_null(
            "sections_allowlist_extra",
            settings_default_sections_allowlist_extra,
        )?;
        let sections_denylist = self
            .sections_denylist
            .get_non_null("sections_denylist", settings_default_sections_denylist)?;
        let discard_wildcard_section = self.discard_wildcard_section.get_non_null(
            "discard_wildcard_section",
            settings_default_discard_wildcard_section,
        )?;

        let single_segment_mode = self
            .single_segment_mode
            .get_non_null("single_segment_mode", settings_default_single_segment_mode)?;

        let partial_scripts_folder = self.partial_scripts_folder.get_non_null(
            "partial_scripts_folder",
            settings_default_partial_scripts_folder,
        )?;
        let partial_build_segments_folder = self.partial_build_segments_folder.get_non_null(
            "partial_build_segments_folder",
            settings_default_partial_build_segments_folder,
        )?;

        if d_path.is_some() && target_path.is_none() {
            return Err(SlinkyError::MissingRequiredFieldCombo {
                required: "target_path".to_string(),
                other: "d_path".to_string(),
            });
        }

        let alloc_sections = self
            .alloc_sections
            .get_non_null("alloc_sections", settings_default_alloc_sections)?;
        let noload_sections = self
            .noload_sections
            .get_non_null("noload_sections", settings_default_noload_sections)?;

        let subalign = self
            .subalign
            .get_optional_nullable("subalign", settings_default_subalign)?;

        let segment_start_align = self
            .segment_start_align
            .get_optional_nullable("segment_start_align", settings_default_segment_start_align)?;

        let section_end_align = self
            .section_end_align
            .get_optional_nullable("section_end_align", settings_default_section_end_align)?;

        let sections_start_alignment = self.sections_start_alignment.get_non_null(
            "sections_start_alignment",
            settings_default_sections_start_alignment,
        )?;

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

            d_path,
            target_path,

            symbols_header_path,
            symbols_header_type,
            symbols_header_as_array,

            sections_allowlist,
            sections_allowlist_extra,
            sections_denylist,
            discard_wildcard_section,

            single_segment_mode,

            partial_scripts_folder,
            partial_build_segments_folder,

            alloc_sections,
            noload_sections,
            subalign,
            segment_start_align,
            section_end_align,
            sections_start_alignment,
            wildcard_sections,
            fill_value,
        })
    }
}
