/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::Path;

use serde::Deserialize;

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash, Deserialize)]
#[serde(rename_all = "snake_case")]
#[non_exhaustive]
pub enum FileKind {
    Object,
    Archive,
    Pad,
    LinkerOffset,
    Group,
    MovedGroup,
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
