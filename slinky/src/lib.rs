/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

mod error;

mod linker_symbols_style;
mod settings;

mod file_info;
mod file_kind;
mod segment;

mod document;

mod linker_writer;

pub use error::SlinkyError;

pub use linker_symbols_style::LinkerSymbolsStyle;
pub use settings::Settings;

pub use file_info::FileInfo;
pub use file_kind::FileKind;
pub use segment::Segment;

pub use document::Document;

pub use linker_writer::LinkerWriter;
