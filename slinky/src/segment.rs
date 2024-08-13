/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{borrow::Cow, collections::HashMap, path::PathBuf};

use serde::Deserialize;

use crate::{
    absent_nullable::AbsentNullable,
    file_info::{FileInfo, FileInfoSerial},
    gp_info::{GpInfo, GpInfoSerial},
    traits::Serial,
    EscapedPath, RuntimeSettings, Settings, SlinkyError,
};

#[derive(PartialEq, Debug, Clone)]
pub struct Segment {
    /// Name of the segment
    pub name: String,

    /// List of files corresponding to this segment
    pub files: Vec<FileInfo>,

    /// If not None then forces the segment to have a fixed vram address instead of following the previous segment.
    /// Not compatible with `fixed_symbol`, `follows_segment` or `vram_class`.
    pub fixed_vram: Option<u32>,

    /// If not None then forces the segment's vram address to be same as the address of the given symbol instead of following the previous segment.
    /// Not compatible with `fixed_vram`, `follows_segment` or `vram_class`.
    pub fixed_symbol: Option<String>,

    /// If not None then forces the segment's vram address to be after the specified segment instead of following the previous one.
    /// Not compatible with `fixed_vram`, `fixed_symbol` or `vram_class`.
    pub follows_segment: Option<String>,

    /// If not None then forces the segment's vram address to be same as the specified vram class instead of following the previous one.
    /// Not compatible with `fixed_vram`, `fixed_symbol` or `follows_segment`.
    pub vram_class: Option<String>,

    /// Used as a prefix for all the files emitted for this Segment.
    pub dir: PathBuf,

    pub gp_info: Option<GpInfo>,

    pub include_if_any: Vec<(String, String)>,
    pub include_if_all: Vec<(String, String)>,
    pub exclude_if_any: Vec<(String, String)>,
    pub exclude_if_all: Vec<(String, String)>,

    // The default value of the following members come from Settings
    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    pub subalign: Option<u32>,
    pub segment_start_align: Option<u32>,
    pub segment_end_align: Option<u32>,
    pub section_start_align: Option<u32>,
    pub section_end_align: Option<u32>,
    pub sections_start_alignment: HashMap<String, u32>,
    pub sections_end_alignment: HashMap<String, u32>,

    pub wildcard_sections: bool,

    pub fill_value: Option<u32>,
}

impl Segment {
    pub fn clone_with_new_files(&self, new_files: Vec<FileInfo>) -> Self {
        Self {
            name: self.name.clone(),
            files: new_files,
            fixed_vram: self.fixed_vram,
            fixed_symbol: self.fixed_symbol.clone(),
            follows_segment: self.follows_segment.clone(),
            vram_class: self.vram_class.clone(),
            dir: self.dir.clone(),
            gp_info: self.gp_info.clone(),
            include_if_any: self.include_if_any.clone(),
            include_if_all: self.include_if_all.clone(),
            exclude_if_any: self.exclude_if_any.clone(),
            exclude_if_all: self.exclude_if_all.clone(),
            alloc_sections: self.alloc_sections.clone(),
            noload_sections: self.noload_sections.clone(),
            subalign: self.subalign,
            segment_start_align: self.segment_start_align,
            segment_end_align: self.segment_end_align,
            section_start_align: self.section_start_align,
            section_end_align: self.section_end_align,
            sections_start_alignment: self.sections_start_alignment.clone(),
            sections_end_alignment: self.sections_end_alignment.clone(),
            wildcard_sections: self.wildcard_sections,
            fill_value: self.fill_value,
        }
    }

    pub fn dir_escaped(&self, rs: &RuntimeSettings) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.dir)
    }
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct SegmentSerial {
    pub name: String,
    pub files: Vec<FileInfoSerial>,

    #[serde(default)]
    pub fixed_vram: AbsentNullable<u32>,

    #[serde(default)]
    pub fixed_symbol: AbsentNullable<String>,

    #[serde(default)]
    pub follows_segment: AbsentNullable<String>,

    #[serde(default)]
    pub vram_class: AbsentNullable<String>,

    #[serde(default)]
    pub dir: AbsentNullable<PathBuf>,

    #[serde(default)]
    pub gp_info: AbsentNullable<GpInfoSerial>,

    #[serde(default)]
    pub include_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub include_if_all: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_all: AbsentNullable<Vec<(String, String)>>,

    // The default of the following come from Options
    #[serde(default)]
    pub alloc_sections: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub noload_sections: AbsentNullable<Vec<String>>,

    #[serde(default)]
    pub subalign: AbsentNullable<u32>,
    #[serde(default)]
    pub segment_start_align: AbsentNullable<u32>,
    #[serde(default)]
    pub segment_end_align: AbsentNullable<u32>,
    #[serde(default)]
    pub section_start_align: AbsentNullable<u32>,
    #[serde(default)]
    pub section_end_align: AbsentNullable<u32>,
    #[serde(default)]
    pub sections_start_alignment: AbsentNullable<HashMap<String, u32>>,
    #[serde(default)]
    pub sections_end_alignment: AbsentNullable<HashMap<String, u32>>,

    #[serde(default)]
    pub wildcard_sections: AbsentNullable<bool>,

    #[serde(default)]
    pub fill_value: AbsentNullable<u32>,
}

impl Serial for SegmentSerial {
    type Output = Segment;

    fn unserialize(self, settings: &Settings) -> Result<Self::Output, SlinkyError> {
        if self.name.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "name".to_string(),
            });
        }
        let name = self.name;

        if self.files.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "files".to_string(),
            });
        }

        let files = self.files.unserialize(settings)?;

        let fixed_vram = self.fixed_vram.get_non_null_no_default("fixed_vram")?;

        let fixed_symbol = self.fixed_symbol.get_non_null_no_default("fixed_symbol")?;

        let follows_segment = self
            .follows_segment
            .get_non_null_no_default("follows_segment")?;

        let vram_class = self.vram_class.get_non_null_no_default("vram_class")?;

        // TODO: there must be a simpler way to check for all these combinations

        if fixed_vram.is_some() {
            if fixed_symbol.is_some() {
                return Err(SlinkyError::InvalidFieldCombo {
                    field1: "fixed_vram".to_string(),
                    field2: "fixed_symbol".to_string(),
                });
            }

            if follows_segment.is_some() {
                return Err(SlinkyError::InvalidFieldCombo {
                    field1: "fixed_vram".to_string(),
                    field2: "follows_segment".to_string(),
                });
            }

            if vram_class.is_some() {
                return Err(SlinkyError::InvalidFieldCombo {
                    field1: "fixed_vram".to_string(),
                    field2: "vram_class".to_string(),
                });
            }
        }

        if fixed_symbol.is_some() {
            if follows_segment.is_some() {
                return Err(SlinkyError::InvalidFieldCombo {
                    field1: "fixed_symbol".to_string(),
                    field2: "follows_segment".to_string(),
                });
            }

            if vram_class.is_some() {
                return Err(SlinkyError::InvalidFieldCombo {
                    field1: "fixed_symbol".to_string(),
                    field2: "vram_class".to_string(),
                });
            }
        }

        if follows_segment.is_some() && vram_class.is_some() {
            return Err(SlinkyError::InvalidFieldCombo {
                field1: "follows_segment".to_string(),
                field2: "vram_class".to_string(),
            });
        }

        let dir = self.dir.get_non_null("dir", PathBuf::new)?;

        let gp_info = self
            .gp_info
            .get_non_null_no_default("gp_info")?
            .unserialize(settings)?;
        if gp_info.is_some() && settings.hardcoded_gp_value.is_some() {
            return Err(SlinkyError::InvalidFieldCombo {
                field1: "segment.gp_info".to_string(),
                field2: "settings.hardcoded_gp_value".to_string(),
            });
        }

        let include_if_any = self
            .include_if_any
            .get_non_null_not_empty("include_if_any", Vec::new)?;
        let include_if_all = self
            .include_if_all
            .get_non_null_not_empty("include_if_all", Vec::new)?;
        let exclude_if_any = self
            .exclude_if_any
            .get_non_null_not_empty("exclude_if_any", Vec::new)?;
        let exclude_if_all = self
            .exclude_if_all
            .get_non_null_not_empty("exclude_if_all", Vec::new)?;

        let alloc_sections = self
            .alloc_sections
            .get_non_null("alloc_sections", || settings.alloc_sections.clone())?;
        let noload_sections = self
            .noload_sections
            .get_non_null("noload_sections", || settings.noload_sections.clone())?;

        if let Some(gp) = &gp_info {
            if !alloc_sections.contains(&gp.section) && !noload_sections.contains(&gp.section) {
                return Err(SlinkyError::MissingSectionForSegment {
                    field_name: Cow::from("gp_info"),
                    section: Cow::from(gp_info.unwrap().section),
                    segment: Cow::from(name),
                });
            }
        }

        let subalign = self
            .subalign
            .get_optional_nullable("subalign", || settings.subalign)?;

        let segment_start_align = self
            .segment_start_align
            .get_optional_nullable("segment_start_align", || settings.segment_start_align)?;

        let segment_end_align = self
            .segment_end_align
            .get_optional_nullable("segment_end_align", || settings.segment_end_align)?;

        let section_start_align = self
            .section_start_align
            .get_optional_nullable("section_start_align", || settings.section_start_align)?;

        let section_end_align = self
            .section_end_align
            .get_optional_nullable("section_end_align", || settings.section_end_align)?;

        let sections_start_alignment = self
            .sections_start_alignment
            .get_non_null("sections_start_alignment", || {
                settings.sections_start_alignment.clone()
            })?;

        let sections_end_alignment = self
            .sections_end_alignment
            .get_non_null("sections_end_alignment", || {
                settings.sections_end_alignment.clone()
            })?;

        let wildcard_sections = self
            .wildcard_sections
            .get_non_null("wildcard_sections", || settings.wildcard_sections)?;

        let fill_value = self
            .fill_value
            .get_optional_nullable("fill_value", || settings.fill_value)?;

        Ok(Self::Output {
            name,
            files,
            fixed_vram,
            fixed_symbol,
            follows_segment,
            vram_class,
            dir,
            gp_info,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
            alloc_sections,
            noload_sections,
            subalign,
            segment_start_align,
            segment_end_align,
            section_start_align,
            section_end_align,
            sections_start_alignment,
            sections_end_alignment,
            wildcard_sections,
            fill_value,
        })
    }
}
