/* SPDX-FileCopyrightText: © 2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::collections::HashMap;

use crate::{
    file_format::{FileInfo, FileKind, FileKindMovedGroup, Segment},
    RuntimeSettings,
};

#[derive(Debug, Clone, PartialEq, Eq)]
pub(crate) struct SegmentWriteContext<'seg> {
    pub(crate) groups_by_name: HashMap<&'seg str, &'seg FileInfo>,
    pub(crate) moved_groups_by_name: HashMap<&'seg str, &'seg FileKindMovedGroup>,
}

impl<'seg> SegmentWriteContext<'seg> {
    pub fn new(segment: &'seg Segment, rs: &RuntimeSettings) -> Self {
        let mut groups_by_name = HashMap::new();
        let mut moved_groups_by_name = HashMap::new();

        for file in &segment.files {
            let Some(file) = file.get(rs) else {
                continue;
            };
            // Map to find groups by name
            match &file.kind {
                FileKind::Group(group) => {
                    if let Some(group_name) = &group.group_name {
                        groups_by_name.insert(group_name.as_str(), file);
                    }
                }
                FileKind::MovedGroup(moved_group) => {
                    moved_groups_by_name.insert(moved_group.group_name.as_str(), moved_group);
                }
                FileKind::Object(..)
                | FileKind::Archive(..)
                | FileKind::Pad(..)
                | FileKind::LinkerOffset(..) => {}
            }
        }

        Self {
            groups_by_name,
            moved_groups_by_name,
        }
    }
}
