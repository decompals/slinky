/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::PathBuf;
use serde::Deserialize;

use crate::file_kind::FileKind;

#[derive(Deserialize, PartialEq, Debug)]
pub struct FileInfo {
    pub path: PathBuf,

    #[serde(default="default_fileinfo_kind")]
    pub kind: FileKind,
}

fn default_fileinfo_kind() -> FileKind {
    FileKind::Object
}