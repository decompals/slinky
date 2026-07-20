/* SPDX-FileCopyrightText: © 2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::collections::HashMap;

use crate::file_format::{FileInfo, FileKind, Segment};

#[derive(Debug, Clone, PartialEq, Eq)]
pub(crate) struct SegmentWriteContext<'seg> {
    pub(crate) groups_by_name: HashMap<&'seg str, &'seg FileInfo>,
    pub(crate) moved_groups_by_name: HashMap<&'seg str, &'seg FileInfo>,
}

impl<'seg> SegmentWriteContext<'seg> {
    pub fn new(segment: &'seg Segment) -> Self {
        let mut groups_by_name = HashMap::new();
        let mut moved_groups_by_name = HashMap::new();

        for file in &segment.files {
            if let Some(group_name) = &file.group_name {
                // Map to find groups by name
                match file.kind {
                    FileKind::Group => {
                        groups_by_name.insert(group_name.as_str(), file);
                    }
                    FileKind::MovedGroup => {
                        moved_groups_by_name.insert(group_name.as_str(), file);
                    }
                    FileKind::Object
                    | FileKind::Archive
                    | FileKind::Pad
                    | FileKind::LinkerOffset => {}
                }
            }
        }

        Self {
            groups_by_name,
            moved_groups_by_name,
        }
    }
}
