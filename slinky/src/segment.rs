/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::{
    absent_nullable::AbsentNullable,
    file_info::{FileInfo, FileInfoSerial},
    Settings, SlinkyError,
};

#[derive(PartialEq, Debug)]
pub struct Segment {
    /// Name of the segment
    pub name: String,

    /// List of files corresponding to this segment
    pub files: Vec<FileInfo>,

    /// If not None then forces the segment to have a fixed vram address instead of following the previous segment.
    /// Not compatible with `follows_segment`.
    pub fixed_vram: Option<u32>,

    /// If not None then forces the segment's vram address to be after the specified segment instead of following the previous one.
    /// Not compatible with `fixed_vram`.
    pub follows_segment: Option<String>,

    // The default value of the following members come from Settings
    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    pub subalign: Option<u32>,
    pub section_end_align: Option<u32>,

    pub wildcard_sections: bool,

    pub fill_value: Option<u32>,
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct SegmentSerial {
    pub name: String,
    pub files: Vec<FileInfoSerial>,

    pub fixed_vram: AbsentNullable<u32>,

    pub follows_segment: AbsentNullable<String>,

    // The default of the following come from Options
    #[serde(default)]
    pub alloc_sections: AbsentNullable<Vec<String>>,
    #[serde(default)]
    pub noload_sections: AbsentNullable<Vec<String>>,

    #[serde(default)]
    pub subalign: AbsentNullable<u32>,
    #[serde(default)]
    pub section_end_align: AbsentNullable<u32>,

    #[serde(default)]
    pub wildcard_sections: AbsentNullable<bool>,

    #[serde(default)]
    pub fill_value: AbsentNullable<u32>,
}

impl SegmentSerial {
    pub fn unserialize(self, settings: &Settings) -> Result<Segment, SlinkyError> {
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

        let mut files = Vec::with_capacity(self.files.len());
        for file in self.files {
            files.push(file.unserialize(settings)?);
        }

        let fixed_vram = self
            .fixed_vram
            .get_optional_nullable("fixed_vram", || None)?;

        let follows_segment = self
            .follows_segment
            .get_optional_nullable("follows_segment", || None)?;

        if fixed_vram.is_some() && follows_segment.is_some() {
            return Err(SlinkyError::InvalidFieldCombo {
                field1: "fixed_vram".to_string(),
                field2: "follows_segment".to_string(),
            });
        }

        let alloc_sections = self
            .alloc_sections
            .get_non_null("alloc_sections", || settings.alloc_sections.clone())?;
        let noload_sections = self
            .noload_sections
            .get_non_null("noload_sections", || settings.noload_sections.clone())?;

        let subalign = self
            .subalign
            .get_optional_nullable("subalign", || settings.subalign)?;

        let section_end_align = self
            .section_end_align
            .get_optional_nullable("section_end_align", || settings.section_end_align)?;

        let wildcard_sections = self
            .wildcard_sections
            .get_non_null("wildcard_sections", || settings.wildcard_sections)?;

        let fill_value = self
            .fill_value
            .get_optional_nullable("fill_value", || settings.fill_value)?;

        Ok(Segment {
            name,
            files,
            fixed_vram,
            follows_segment,
            alloc_sections,
            noload_sections,
            subalign,
            section_end_align,
            wildcard_sections,
            fill_value,
        })
    }
}
