/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::PathBuf;
use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
pub enum FileKind {
    Object,
    Archive,
}

#[derive(Deserialize, PartialEq, Debug)]
pub struct FileInfo {
    pub path: PathBuf,

    #[serde(default="default_fileinfo_kind")]
    pub kind: FileKind,
}

fn default_fileinfo_kind() -> FileKind {
    FileKind::Object
}

#[derive(Deserialize, PartialEq, Debug)]
pub struct Segment {
    pub name: String,
    pub files: Vec<FileInfo>,

    pub fixed_vram: Option<u64>,

    // The default of the following come from Options

    // TODO: section_order (both alloc and noload)
    pub use_subalign: Option<bool>,
    pub subalign: Option<u64>,

    pub wildcard_sections: Option<bool>,
}

