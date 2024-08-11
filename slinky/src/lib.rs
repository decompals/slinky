/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

mod absent_nullable;
mod error;
mod utils;

mod linker_symbols_style;
mod settings;

mod file_info;
mod file_kind;
mod segment;
mod symbol_assignment;

mod vram_class;

mod document;

mod script_buffer;

mod linker_writer;
mod partial_linker_writer;

mod runtime_settings;

pub mod version;

pub use error::SlinkyError;

pub use linker_symbols_style::LinkerSymbolsStyle;
pub use settings::Settings;

pub use file_info::FileInfo;
pub use file_kind::FileKind;
pub use segment::Segment;
pub use symbol_assignment::SymbolAssignment;

pub use vram_class::VramClass;

pub use document::Document;

pub use linker_writer::LinkerWriter;
pub use partial_linker_writer::PartialLinkerWriter;

pub use runtime_settings::RuntimeSettings;
