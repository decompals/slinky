/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::Path;

use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
#[serde(rename_all = "snake_case")]
pub enum FileKind {
    Object,
    Archive,
    Pad,
    LinkerOffset,
}

impl FileKind {
    pub fn from_path(path: &Path) -> Self {
        match path.extension() {
            None => Self::Object,
            Some(ext) => match ext.to_str() {
                None => Self::Object,
                Some("o") => Self::Object,
                Some("a") => Self::Archive,
                Some(&_) => Self::Object,
            },
        }
    }
}
