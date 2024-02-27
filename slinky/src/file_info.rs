/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::path::{Path, PathBuf};

use crate::{absent_nullable::AbsentNullable, file_kind::FileKind, Settings, SlinkyError};

#[derive(PartialEq, Debug)]
pub struct FileInfo {
    pub path: PathBuf,

    pub kind: FileKind,

    pub pad_amount: u32,
    pub pad_section: String,
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct FileInfoSerial {
    #[serde(default)]
    pub path: AbsentNullable<PathBuf>,

    #[serde(default)]
    pub kind: AbsentNullable<FileKind>,

    #[serde(default)]
    pub pad_amount: AbsentNullable<u32>,
    #[serde(default)]
    pub pad_section: AbsentNullable<String>,
}

impl FileInfoSerial {
    pub(crate) fn unserialize(self, _settings: &Settings) -> Result<FileInfo, SlinkyError> {
        // Since a `kind` can be deduced from a `path` (which requires a `path`) then we need to do both simultaneously
        let (path, kind) = match self.kind.get_non_null_no_default("kind")? {
            Some(k) => match k {
                FileKind::Object => {
                    let p = self.path.get("path")?;

                    if p == Path::new("") {
                        return Err(SlinkyError::EmptyValue {
                            name: "path".to_string(),
                        });
                    }

                    (p, k)
                }
                FileKind::Pad => {
                    // pad doesn't allow for paths
                    if self.path.has_value() {
                        return Err(SlinkyError::InvalidFieldCombo {
                            field1: "kind: pad".into(),
                            field2: "path".into(),
                        });
                    }

                    (PathBuf::new(), k)
                }
            },
            None => {
                let p = self.path.get("path")?;

                if p == Path::new("") {
                    return Err(SlinkyError::EmptyValue {
                        name: "path".to_string(),
                    });
                }

                let k = FileKind::from_path(&p);
                (p, k)
            }
        };

        let pad_amount = match kind {
            FileKind::Object => {
                if self.pad_amount.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "pad_amount".into(),
                        field2: "non `kind: pad`".into(),
                    });
                }
                0
            }
            FileKind::Pad => self.pad_amount.get("pad_amount")?,
        };

        let pad_section = match kind {
            FileKind::Object => {
                if self.pad_section.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "pad_section".into(),
                        field2: "non `kind: pad`".into(),
                    });
                }
                "".into()
            }
            FileKind::Pad => self.pad_section.get("pad_section")?,
        };

        Ok(FileInfo {
            path,
            kind,
            pad_amount,
            pad_section,
        })
    }
}
