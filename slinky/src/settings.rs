/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::path::PathBuf;

use crate::linker_symbols_style::LinkerSymbolsStyle;

#[derive(Deserialize, PartialEq, Debug)]
#[serde(default)]
pub struct Settings {
    pub base_path: PathBuf,
    pub linker_symbols_style: LinkerSymbolsStyle,

    pub alloc_sections: Vec<String>,
    pub noload_sections: Vec<String>,

    // Options passed down to each segment
    pub use_subalign: bool,
    pub subalign: u32,

    pub wildcard_sections: bool,
}

// TODO: consider changing the defaults before 1.0.0
impl Default for Settings {
    fn default() -> Self {
        Self {
            base_path: PathBuf::new(),
            linker_symbols_style: LinkerSymbolsStyle::Splat,

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

            use_subalign: true,
            subalign: 16,

            wildcard_sections: true,
        }
    }
}
