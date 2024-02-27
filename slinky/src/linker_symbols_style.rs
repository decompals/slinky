/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::utils;

#[derive(Deserialize, PartialEq, Debug)]
#[serde(rename_all = "snake_case")]
pub enum LinkerSymbolsStyle {
    Splat,
    Makerom,
}

impl LinkerSymbolsStyle {
    pub fn segment_rom_start(&self, seg_name: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => format!("{}_ROM_START", seg_name),
            LinkerSymbolsStyle::Makerom => format!("_{}SegmentRomStart", seg_name),
        }
    }

    pub fn segment_rom_end(&self, seg_name: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => format!("{}_ROM_END", seg_name),
            LinkerSymbolsStyle::Makerom => format!("_{}SegmentRomEnd", seg_name),
        }
    }

    pub fn segment_rom_size(&self, seg_name: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => format!("{}_ROM_SIZE", seg_name),
            LinkerSymbolsStyle::Makerom => format!("_{}SegmentRomSize", seg_name),
        }
    }

    pub fn segment_vram_start(&self, seg_name: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => format!("{}_VRAM", seg_name),
            LinkerSymbolsStyle::Makerom => format!("_{}SegmentStart", seg_name),
        }
    }

    pub fn segment_vram_end(&self, seg_name: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => format!("{}_VRAM_END", seg_name),
            LinkerSymbolsStyle::Makerom => format!("_{}SegmentEnd", seg_name),
        }
    }

    pub fn segment_vram_size(&self, seg_name: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => format!("{}_VRAM_SIZE", seg_name),
            LinkerSymbolsStyle::Makerom => format!("_{}SegmentSize", seg_name),
        }
    }

    fn convert_section_name_to_linker_format(&self, section_type: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => section_type.replace('.', "_").to_uppercase(),
            LinkerSymbolsStyle::Makerom => {
                // TODO: yeet RoData?
                if section_type == ".rodata" {
                    "RoData".to_string()
                } else if section_type.chars().nth(0) == Some('.') {
                    utils::capitalize(&section_type[1..])
                } else {
                    utils::capitalize(section_type)
                }
            }
        }
    }

    pub fn segment_section_start(&self, seg_name: &str, section_type: &str) -> String {
        let sec = self.convert_section_name_to_linker_format(section_type);

        match self {
            LinkerSymbolsStyle::Splat => format!("{}{}_START", seg_name, sec),
            LinkerSymbolsStyle::Makerom => format!("_{}Segment{}Start", seg_name, sec),
        }
    }

    pub fn segment_section_end(&self, seg_name: &str, section_type: &str) -> String {
        let sec = self.convert_section_name_to_linker_format(section_type);

        match self {
            LinkerSymbolsStyle::Splat => format!("{}{}_END", seg_name, sec),
            LinkerSymbolsStyle::Makerom => format!("_{}Segment{}End", seg_name, sec),
        }
    }

    pub fn segment_section_size(&self, seg_name: &str, section_type: &str) -> String {
        let sec = self.convert_section_name_to_linker_format(section_type);

        match self {
            LinkerSymbolsStyle::Splat => format!("{}{}_SIZE", seg_name, sec),
            LinkerSymbolsStyle::Makerom => format!("_{}Segment{}Size", seg_name, sec),
        }
    }

    pub fn linker_offset(&self, name: &str) -> String {
        match self {
            LinkerSymbolsStyle::Splat => format!("{}_OFFSET", name),
            LinkerSymbolsStyle::Makerom => format!("_{}Offset", name),
        }
    }
}
