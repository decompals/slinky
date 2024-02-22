/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::{paths_configs::PathsConfigs, segment_symbols_style::SegmentSymbolsStyle};

#[derive(Deserialize, PartialEq, Debug)]
#[serde(default)]
pub struct Options {
    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    pub segment_symbols_style: SegmentSymbolsStyle,
    pub paths: PathsConfigs,

    // Options passed down to each segment
    pub use_subalign: bool,
    pub subalign: u64,

    pub wildcard_sections: bool,
}

impl Default for Options {
    fn default() -> Self {
        Self {
            alloc_sections: vec![
                ".text".into(),
                ".data".into(),
                ".rodata".into(),
                ".sdata".into(),
            ],
            noload_sections: vec![
                ".sbss".into(),
                ".scommon".into(),
                ".bss".into(),
                "COMMON".into(),
            ],
            segment_symbols_style: SegmentSymbolsStyle::Splat,
            paths: PathsConfigs::default(),

            use_subalign: true,
            subalign: 16,

            wildcard_sections: true,
        }
    }
}
