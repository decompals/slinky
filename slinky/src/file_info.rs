/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::{
    collections::HashMap,
    path::{Path, PathBuf},
};

use crate::{
    absent_nullable::AbsentNullable, file_kind::FileKind, traits::Serial, EscapedPath,
    KeepSections, RuntimeSettings, Settings, SlinkyError,
};

#[derive(PartialEq, Debug, Clone)]
pub struct FileInfo {
    pub path: PathBuf,

    pub kind: FileKind,

    // Used for archives
    pub subfile: String,

    pub pad_amount: u32,
    pub section: String,

    pub linker_offset_name: String,

    pub section_order: HashMap<String, String>,

    // Used for groups
    pub files: Vec<FileInfo>,
    pub dir: PathBuf,

    pub include_if_any: Vec<(String, String)>,
    pub include_if_all: Vec<(String, String)>,
    pub exclude_if_any: Vec<(String, String)>,
    pub exclude_if_all: Vec<(String, String)>,

    // The default value of the following members come from Segment
    // (or the upper FileInfo if this file is part of a group)
    pub keep_sections: KeepSections,
}

impl FileInfo {
    pub fn new_object(p: PathBuf) -> Self {
        Self {
            path: p,
            kind: FileKind::Object,
            subfile: "".into(),
            pad_amount: 0,
            section: "".into(),
            linker_offset_name: "".into(),
            section_order: HashMap::new(),
            files: Vec::new(),
            dir: PathBuf::new(),
            include_if_any: Vec::new(),
            include_if_all: Vec::new(),
            exclude_if_any: Vec::new(),
            exclude_if_all: Vec::new(),
            keep_sections: KeepSections::default(),
        }
    }

    pub fn pass_down_keep_sections(&mut self, keep_sections: &KeepSections) {
        if *keep_sections == KeepSections::Absent {
            return;
        }

        if self.keep_sections == KeepSections::Absent {
            self.keep_sections.clone_from(keep_sections);

            if self.kind == FileKind::Group {
                self.files
                    .iter_mut()
                    .for_each(|f| f.pass_down_keep_sections(keep_sections));
            }
        }
    }
}

impl FileInfo {
    pub fn path_escaped(&self, rs: &RuntimeSettings) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.path)
    }

    pub fn dir_escaped(&self, rs: &RuntimeSettings) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.dir)
    }
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct FileInfoSerial {
    #[serde(default)]
    pub path: AbsentNullable<PathBuf>,

    #[serde(default)]
    pub kind: AbsentNullable<FileKind>,

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
                FileKind::Pad | FileKind::LinkerOffset | FileKind::Group => {
                    // doesn't allow paths
                    if self.path.has_value() {
                        return Err(SlinkyError::InvalidFieldCombo {
                            field1: "`kind: pad`, `kind: linker_offset` or `kind: group`".into(),
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

        let subfile = match kind {
            FileKind::Object | FileKind::LinkerOffset | FileKind::Pad | FileKind::Group => {
                if self.subfile.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "subfile".into(),
                        field2: "non `kind: archive`".into(),
                    });
                }
                "*".to_string()
            }
            FileKind::Archive => self.subfile.get_non_null("subfile", || "*".to_string())?,
        };

        let pad_amount = match kind {
            FileKind::Object | FileKind::LinkerOffset | FileKind::Archive | FileKind::Group => {
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
            FileKind::Object | FileKind::Archive | FileKind::Group => {
                if self.section.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "section".into(),
                        field2: "non `kind: pad or kind: linker_offset`".into(),
                    });
                }
                "".into()
            }
            FileKind::Pad | FileKind::LinkerOffset => self.section.get("section")?,
        };

        let linker_offset_name = match kind {
            FileKind::Object | FileKind::Pad | FileKind::Archive | FileKind::Group => {
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

        let section_order = match kind {
            FileKind::Pad | FileKind::LinkerOffset | FileKind::Group => {
                if self.section_order.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "section_order".into(),
                        field2: "non `kind: object` or `kind: archive`".into(),
                    });
                }
                HashMap::default()
            }
            FileKind::Object | FileKind::Archive => self
                .section_order
                .get_non_null("section_order", HashMap::default)?,
        };

        let mut files = match kind {
            FileKind::Object | FileKind::Archive | FileKind::Pad | FileKind::LinkerOffset => {
                if self.files.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "files".into(),
                        field2: "non `kind: group`".into(),
                    });
                }
                Vec::default()
            }
            FileKind::Group => self.files.get("files")?.unserialize(settings)?,
        };

        let dir = match kind {
            FileKind::Object | FileKind::Archive | FileKind::Pad | FileKind::LinkerOffset => {
                if self.dir.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "dir".into(),
                        field2: "non `kind: group`".into(),
                    });
                }
                PathBuf::default()
            }
            FileKind::Group => self.dir.get_non_null("dir", PathBuf::default)?,
        };

        let include_if_any = self
            .include_if_any
            .get_non_null_not_empty("include_if_any", Vec::new)?;
        let include_if_all = self
            .include_if_all
            .get_non_null_not_empty("include_if_all", Vec::new)?;
        let exclude_if_any = self
            .exclude_if_any
            .get_non_null_not_empty("exclude_if_any", Vec::new)?;
        let exclude_if_all = self
            .exclude_if_all
            .get_non_null_not_empty("exclude_if_all", Vec::new)?;

        let keep_sections = self.keep_sections;

        // Pass down the current `keep_sections` to any file of this group that may not have defined it
        if kind == FileKind::Group && keep_sections != KeepSections::Absent {
            files
                .iter_mut()
                .for_each(|f| f.pass_down_keep_sections(&keep_sections));
        }

        Ok(Self::Output {
            path,
            kind,
            subfile,
            pad_amount,
            section,
            linker_offset_name,
            section_order,
            files,
            dir,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
            keep_sections,
        })
    }
}
