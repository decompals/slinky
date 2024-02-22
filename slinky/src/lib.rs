/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

mod error;

mod paths_configs;
mod segment_symbols_style;
mod options;

mod file_kind;
mod file_info;
mod segment;

mod document;

mod linker_writer;


pub use error::SlinkyError;

pub use paths_configs::PathsConfigs;
pub use segment_symbols_style::SegmentSymbolsStyle;
pub use options::Options;

pub use file_kind::FileKind;
pub use file_info::FileInfo;
pub use segment::Segment;

pub use document::Document;

pub use linker_writer::LinkerWriter;
