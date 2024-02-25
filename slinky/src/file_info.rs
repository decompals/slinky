/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::path::{Path, PathBuf};

use crate::{absent_nullable::AbsentNullable, file_kind::FileKind, Settings, SlinkyError};

#[derive(PartialEq, Debug)]
pub struct FileInfo {
    pub path: PathBuf,

    pub kind: FileKind,
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct FileInfoSerial {
    pub path: PathBuf,

    #[serde(default)]
    pub kind: AbsentNullable<FileKind>,
}

impl FileInfoSerial {
    pub(crate) fn unserialize(self, _settings: &Settings) -> Result<FileInfo, SlinkyError> {
        if self.path == Path::new("") {
            return Err(SlinkyError::EmptyValue {
                name: "path".to_string(),
            });
        }

        let path = self.path;
        let kind = self
            .kind
            .get_non_null("kind", || FileKind::from_path(&path))?;

        Ok(FileInfo { path, kind })
    }
}
