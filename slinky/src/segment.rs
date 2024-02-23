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
    pub name: String,
    pub files: Vec<FileInfo>,

    pub fixed_vram: Option<u64>,

    // The default of the following come from Options

    // TODO: section_order (both alloc and noload)
    pub subalign: Option<u32>,

    pub wildcard_sections: bool,
}

impl Default for Segment {
    fn default() -> Self {
        Self {
            name: "".to_string(),
            files: Vec::new(),

            fixed_vram: None,

            subalign: None,

            wildcard_sections: false,
        }
    }
}

#[derive(Deserialize, PartialEq, Debug)]
pub(crate) struct SegmentSerial {
    pub name: String,
    pub files: Vec<FileInfoSerial>,

    pub fixed_vram: Option<u64>,

    // The default of the following come from Options

    // TODO: section_order (both alloc and noload)
    #[serde(default)]
    pub subalign: AbsentNullable<u32>,

    #[serde(default)]
    pub wildcard_sections: AbsentNullable<bool>,
}

impl SegmentSerial {
    pub fn unserialize(self, settings: &Settings) -> Result<Segment, SlinkyError> {
        let mut ret = Segment::default();

        if self.name.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "name".to_string(),
            });
        }
        ret.name = self.name;

        ret.files.reserve(self.files.len());
        for file in self.files {
            ret.files.push(file.unserialize(settings)?);
        }

        ret.fixed_vram = self.fixed_vram;

        ret.subalign = self
            .subalign
            .get_optional_nullable("subalign", || settings.subalign)?;

        ret.wildcard_sections = self
            .wildcard_sections
            .get_non_null("wildcard_sections", || settings.wildcard_sections)?;

        Ok(ret)
    }
}
