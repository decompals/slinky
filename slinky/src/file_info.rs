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
    pub section: String,

    pub linker_offset_name: String,
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
    pub section: AbsentNullable<String>,

    #[serde(default)]
    pub linker_offset_name: AbsentNullable<String>,
}

impl FileInfoSerial {
    pub(crate) fn unserialize(self, _settings: &Settings) -> Result<FileInfo, SlinkyError> {
        // Since a `kind` can be deduced from a `path` (which requires a `path`) then we need to do both simultaneously
        let (path, kind) = match self.kind.get_non_null_no_default("kind")? {
            Some(k) => match k {
                FileKind::Object | FileKind::Archive => {
                    let p = self.path.get("path")?;

                    if p == Path::new("") {
                        return Err(SlinkyError::EmptyValue {
                            name: "path".to_string(),
                        });
                    }

                    (p, k)
                }
                FileKind::Pad | FileKind::LinkerOffset => {
                    // pad doesn't allow for paths
                    if self.path.has_value() {
                        return Err(SlinkyError::InvalidFieldCombo {
                            field1: "kind: pad or kind: linker_offset".into(),
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
            FileKind::Object | FileKind::LinkerOffset | FileKind::Archive => {
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

        let section = match kind {
            FileKind::Object | FileKind::Archive => {
                if self.section.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "section".into(),
                        field2: "non `kind: pad`".into(),
                    });
                }
                "".into()
            }
            FileKind::Pad | FileKind::LinkerOffset => self.section.get("section")?,
        };

        let linker_offset_name = match kind {
            FileKind::Object | FileKind::Pad | FileKind::Archive => {
                if self.linker_offset_name.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "linker_offset_name".into(),
                        field2: "non `kind: linker_offset`".into(),
                    });
                }
                "".into()
            }
            FileKind::LinkerOffset => self.linker_offset_name.get("linker_offset_name")?,
        };

        Ok(FileInfo {
            path,
            kind,
            pad_amount,
            section,
            linker_offset_name,
        })
    }
}
