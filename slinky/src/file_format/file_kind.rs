/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    collections::HashMap,
    path::{Path, PathBuf},
};

use serde::Deserialize;

use crate::utils::{traits::SerialVec, AbsentNullable};
use crate::{EscapedPath, RuntimeSettings, SlinkyError};

use super::{file_info::FileInfoSerial, FileInfo, KeepSections, Predicate, Settings};

#[derive(Debug, Clone, PartialEq, Eq)]
#[non_exhaustive]
pub enum FileKind {
    Object(FileKindObject),
    Archive(FileKindArchive),
    Pad(FileKindPad),
    LinkerOffset(FileKindLinkerOffset),
    Group(FileKindGroup),
    MovedGroup(FileKindMovedGroup),
}

impl FileKind {
    pub(crate) fn pass_down_keep_sections(&mut self, keep_sections: &KeepSections) {
        match self {
            Self::Object(object) => {
                if object.keep_sections == KeepSections::Absent {
                    object.keep_sections.clone_from(keep_sections);
                }
            }
            Self::Archive(archive) => {
                if archive.keep_sections == KeepSections::Absent {
                    archive.keep_sections.clone_from(keep_sections);
                }
            }
            Self::Pad(_pad) => {}
            Self::LinkerOffset(_linker_offset) => {}
            Self::Group(group) => group
                .files
                .iter_mut()
                .for_each(|f| f.value.pass_down_keep_sections(keep_sections)),
            Self::MovedGroup(_moved_group) => {}
        }
    }

    pub(crate) fn section_order(&self) -> Option<&HashMap<String, String>> {
        match self {
            Self::Object(object) => {
                if !object.section_order.is_empty() {
                    Some(&object.section_order)
                } else {
                    None
                }
            }
            Self::Archive(archive) => {
                if !archive.section_order.is_empty() {
                    Some(&archive.section_order)
                } else {
                    None
                }
            }
            Self::Pad(_pad) => None,
            Self::LinkerOffset(_linker_offset) => None,
            Self::Group(_group) => None,
            Self::MovedGroup(_moved_group) => None,
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FileKindObject {
    pub(crate) path: PathBuf,
    pub(crate) section_order: HashMap<String, String>,

    // The default value of the following members come from Segment
    // (or the upper FileKind if this file is part of a group)
    pub keep_sections: KeepSections,
}
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FileKindArchive {
    pub(crate) path: PathBuf,
    pub(crate) subfile: String,
    pub(crate) section_order: HashMap<String, String>,

    // The default value of the following members come from Segment
    // (or the upper FileKind if this file is part of a group)
    pub keep_sections: KeepSections,
}
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FileKindPad {
    pub(crate) pad_amount: u32,
    pub(crate) section: String,
}
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FileKindLinkerOffset {
    pub(crate) section: String,
    pub(crate) linker_offset_name: String,
}
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FileKindGroup {
    pub(crate) files: Vec<Predicate<FileInfo>>,
    pub(crate) dir: PathBuf,
    pub(crate) group_name: Option<String>,
}
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FileKindMovedGroup {
    pub(crate) group_name: String,
    pub(crate) moved_sections: HashMap<String, String>,
}

impl FileKindObject {
    pub fn path_escaped(&self, rs: &RuntimeSettings) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.path)
    }
}
impl FileKindArchive {
    pub fn path_escaped(&self, rs: &RuntimeSettings) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.path)
    }
}
impl FileKindGroup {
    pub fn dir_escaped(&self, rs: &RuntimeSettings) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.dir)
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash, Deserialize)]
#[serde(rename_all = "snake_case")]
#[non_exhaustive]
pub(crate) enum FileKindSerial {
    Object,
    Archive,
    Pad,
    LinkerOffset,
    Group,
    MovedGroup,
}

impl FileKindSerial {
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

impl FileKindSerial {
    #[allow(clippy::too_many_arguments)]
    pub fn unserialize(
        settings: &Settings,
        path: AbsentNullable<PathBuf>,
        kind: AbsentNullable<Self>,
        subfile: AbsentNullable<String>,
        pad_amount: AbsentNullable<u32>,
        section: AbsentNullable<String>,
        linker_offset_name: AbsentNullable<String>,
        section_order: AbsentNullable<HashMap<String, String>>,
        files: AbsentNullable<Vec<FileInfoSerial>>,
        dir: AbsentNullable<PathBuf>,
        group_name: AbsentNullable<String>,
        moved_sections: AbsentNullable<HashMap<String, String>>,
        keep_sections: KeepSections,
    ) -> Result<FileKind, SlinkyError> {
        // Since a `kind` can be deduced from a `path` (which requires a `path`) then we need to do both simultaneously
        let (path, kind) = match kind.get_non_null_no_default("kind")? {
            Some(k) => match k {
                Self::Object | Self::Archive => {
                    let p = path.get("path")?;

                    if p == Path::new("") {
                        return Err(SlinkyError::EmptyValue {
                            name: "path".to_string(),
                        });
                    }

                    (p, k)
                }
                Self::Pad | Self::LinkerOffset | Self::Group | Self::MovedGroup => {
                    // doesn't allow paths
                    if path.has_value() {
                        return Err(SlinkyError::InvalidFieldCombo {
                            field1: "`kind: pad`, `kind: linker_offset` or `kind: group`".into(),
                            field2: "path".into(),
                        });
                    }

                    (PathBuf::new(), k)
                }
            },
            None => {
                let p = path.get("path")?;

                if p == Path::new("") {
                    return Err(SlinkyError::EmptyValue {
                        name: "path".to_string(),
                    });
                }

                let k = Self::from_path(&p);
                (p, k)
            }
        };

        let subfile = match kind {
            Self::Object | Self::LinkerOffset | Self::Pad | Self::Group | Self::MovedGroup => {
                if subfile.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "subfile".into(),
                        field2: "non `kind: archive`".into(),
                    });
                }
                "*".to_string()
            }
            Self::Archive => subfile.get_non_null("subfile", || "*".to_string())?,
        };

        let pad_amount = match kind {
            Self::Object | Self::LinkerOffset | Self::Archive | Self::Group | Self::MovedGroup => {
                if pad_amount.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "pad_amount".into(),
                        field2: "non `kind: pad`".into(),
                    });
                }
                0
            }
            Self::Pad => pad_amount.get("pad_amount")?,
        };

        let section = match kind {
            Self::Object | Self::Archive | Self::Group | Self::MovedGroup => {
                if section.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "section".into(),
                        field2: "non `kind: pad or kind: linker_offset`".into(),
                    });
                }
                "".into()
            }
            Self::Pad | Self::LinkerOffset => section.get("section")?,
        };

        let linker_offset_name = match kind {
            Self::Object | Self::Pad | Self::Archive | Self::Group | Self::MovedGroup => {
                if linker_offset_name.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "linker_offset_name".into(),
                        field2: "non `kind: linker_offset`".into(),
                    });
                }
                "".into()
            }
            Self::LinkerOffset => linker_offset_name.get("linker_offset_name")?,
        };

        let section_order = match kind {
            Self::Pad | Self::LinkerOffset | Self::Group | Self::MovedGroup => {
                if section_order.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "section_order".into(),
                        field2: "non `kind: object` or `kind: archive`".into(),
                    });
                }
                HashMap::default()
            }
            Self::Object | Self::Archive => {
                section_order.get_non_null("section_order", HashMap::default)?
            }
        };

        let mut files = match kind {
            Self::Object | Self::Archive | Self::Pad | Self::LinkerOffset | Self::MovedGroup => {
                if files.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "files".into(),
                        field2: "non `kind: group`".into(),
                    });
                }
                Vec::default()
            }
            Self::Group => files.get("files")?.unserialize(settings)?,
        };

        let dir = match kind {
            Self::Object | Self::Archive | Self::Pad | Self::LinkerOffset | Self::MovedGroup => {
                if dir.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "dir".into(),
                        field2: "non `kind: group`".into(),
                    });
                }
                PathBuf::default()
            }
            Self::Group => dir.get_non_null("dir", PathBuf::default)?,
        };

        let group_name = match kind {
            Self::Object | Self::Archive | Self::Pad | Self::LinkerOffset => {
                if group_name.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "group_name".into(),
                        field2: "non `kind: moved_group` or `kind: group`".into(),
                    });
                }
                None
            }
            Self::Group => {
                // Groups may or may not have a name.
                // This is only required if we want to link this group to a
                // moved group block.
                group_name.get_non_null_no_default("group_name")?
            }
            Self::MovedGroup => {
                // Moved groups require a name, otherwise we don't know what group they are refering to.
                Some(group_name.get("group_name")?)
            }
        };

        let moved_sections = match kind {
            Self::Object | Self::Archive | Self::Pad | Self::LinkerOffset | Self::Group => {
                if moved_sections.has_value() {
                    return Err(SlinkyError::InvalidFieldCombo {
                        field1: "moved_sections".into(),
                        field2: "non `kind: moved_group`".into(),
                    });
                }
                HashMap::default()
            }
            Self::MovedGroup => moved_sections.get_non_null("moved_sections", HashMap::default)?,
        };

        let ret = match kind {
            Self::Object => FileKind::Object(FileKindObject {
                path,
                section_order,
                keep_sections,
            }),
            Self::Archive => FileKind::Archive(FileKindArchive {
                path,
                subfile,
                section_order,
                keep_sections,
            }),
            Self::Pad => FileKind::Pad(FileKindPad {
                pad_amount,
                section,
            }),
            Self::LinkerOffset => FileKind::LinkerOffset(FileKindLinkerOffset {
                section,
                linker_offset_name,
            }),
            Self::Group => {
                // Pass down the current `keep_sections` to any file of this group that may not have defined it
                files
                    .iter_mut()
                    .for_each(|f| f.value.pass_down_keep_sections(&keep_sections));
                FileKind::Group(FileKindGroup {
                    files,
                    dir,
                    group_name,
                })
            }

            Self::MovedGroup => FileKind::MovedGroup(FileKindMovedGroup {
                group_name: group_name.expect("It is always Some when kind is equal to MovedGroup"),
                moved_sections,
            }),
        };

        Ok(ret)
    }
}
