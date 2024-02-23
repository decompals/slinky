/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::file_info::FileInfo;

#[derive(Deserialize, PartialEq, Debug)]
pub struct Segment {
    pub name: String,
    pub files: Vec<FileInfo>,

    pub fixed_vram: Option<u64>,

    // The default of the following come from Options

    // TODO: section_order (both alloc and noload)
    pub use_subalign: Option<bool>,
    pub subalign: Option<u32>,

    pub wildcard_sections: Option<bool>,
}
