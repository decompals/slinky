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
        let (path, kind) = match self.path.get_non_null_no_default("path")? {
            None => {
                // Empty path may be okay for some `FileKind`s.
                // Check if we have one of those.

                match self.kind.get_non_null_no_default("kind")? {
                    Some(FileKind::Pad) => (PathBuf::new(), FileKind::Pad),
                    None | Some(FileKind::Object) => {
                        return Err(SlinkyError::EmptyValue {
                            name: "path".to_string(),
                        });
                    }
                }
            }

            Some(p) => {
                if p == Path::new("") {
                    return Err(SlinkyError::EmptyValue {
                        name: "path".to_string(),
                    });
                }

                // Parse the kind. If none was specified then try to guess it from the path
                let kind = self.kind.get_non_null("kind", || FileKind::from_path(&p))?;

                // Check the kind we got is fine to be combined with a `path`
                match kind {
                    FileKind::Object => (),
                    FileKind::Pad => {
                        return Err(SlinkyError::InvalidFieldCombo {
                            field1: "kind: pad".into(),
                            field2: "non empty path".into(),
                        })
                    }
                }

                (p, kind)
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
