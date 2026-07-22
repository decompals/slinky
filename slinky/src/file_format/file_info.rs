/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::{collections::HashMap, path::PathBuf};

use serde::Deserialize;

use crate::utils::{traits::Serial, AbsentNullable};
use crate::SlinkyError;

use super::{file_kind::FileKindSerial, FileKind, FileKindObject, KeepSections, Settings};

#[derive(Debug, Clone, PartialEq, Eq)]
#[non_exhaustive]
pub struct FileInfo {
    pub kind: FileKind,

    pub include_if_any: Vec<(String, String)>,
    pub include_if_all: Vec<(String, String)>,
    pub exclude_if_any: Vec<(String, String)>,
    pub exclude_if_all: Vec<(String, String)>,
}

impl FileInfo {
    pub(crate) fn new_object(p: PathBuf) -> Self {
        Self {
            kind: FileKind::Object(FileKindObject {
                path: p,
                section_order: HashMap::new(),
                keep_sections: KeepSections::default(),
            }),
            include_if_any: Vec::new(),
            include_if_all: Vec::new(),
            exclude_if_any: Vec::new(),
            exclude_if_all: Vec::new(),
        }
    }

    pub(crate) fn pass_down_keep_sections(&mut self, keep_sections: &KeepSections) {
        if *keep_sections == KeepSections::Absent {
            return;
        }

        self.kind.pass_down_keep_sections(keep_sections);
    }
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct FileInfoSerial {
    #[serde(default)]
    pub path: AbsentNullable<PathBuf>,

    #[serde(default)]
    pub kind: AbsentNullable<FileKindSerial>,

    #[serde(default)]
    pub subfile: AbsentNullable<String>,

    #[serde(default)]
    pub pad_amount: AbsentNullable<u32>,
    #[serde(default)]
    pub section: AbsentNullable<String>,

    #[serde(default)]
    pub linker_offset_name: AbsentNullable<String>,

    #[serde(default)]
    pub section_order: AbsentNullable<HashMap<String, String>>,

    #[serde(default)]
    pub files: AbsentNullable<Vec<FileInfoSerial>>,
    #[serde(default)]
    pub dir: AbsentNullable<PathBuf>,
    #[serde(default)]
    pub group_name: AbsentNullable<String>,

    #[serde(default)]
    pub moved_sections: AbsentNullable<HashMap<String, String>>,

    #[serde(default)]
    pub include_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub include_if_all: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_all: AbsentNullable<Vec<(String, String)>>,

    #[serde(default)]
    pub keep_sections: KeepSections,
}

impl Serial for FileInfoSerial {
    type Output = FileInfo;

    fn unserialize(self, settings: &Settings) -> Result<Self::Output, SlinkyError> {
        let Self {
            path,
            kind,
            subfile,
            pad_amount,
            section,
            linker_offset_name,
            section_order,
            files,
            dir,
            group_name,
            moved_sections,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
            keep_sections,
        } = self;

        let kind = FileKindSerial::unserialize(
            settings,
            path,
            kind,
            subfile,
            pad_amount,
            section,
            linker_offset_name,
            section_order,
            files,
            dir,
            group_name,
            moved_sections,
            keep_sections,
        )?;

        let include_if_any = include_if_any.get_non_null_not_empty("include_if_any", Vec::new)?;
        let include_if_all = include_if_all.get_non_null_not_empty("include_if_all", Vec::new)?;
        let exclude_if_any = exclude_if_any.get_non_null_not_empty("exclude_if_any", Vec::new)?;
        let exclude_if_all = exclude_if_all.get_non_null_not_empty("exclude_if_all", Vec::new)?;

        Ok(Self::Output {
            kind,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        })
    }
}
