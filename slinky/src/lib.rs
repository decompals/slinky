/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

mod absent_nullable;
mod error;
mod escaped_path;
mod traits;
mod utils;

mod linker_symbols_style;
mod settings;

mod assert_entry;
mod file_info;
mod file_kind;
mod gp_info;
mod keep_sections;
mod required_symbol;
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
pub use escaped_path::EscapedPath;

pub use linker_symbols_style::LinkerSymbolsStyle;
pub use settings::Settings;

pub use assert_entry::AssertEntry;
pub use file_info::FileInfo;
pub use file_kind::FileKind;
pub use keep_sections::KeepSections;
pub use required_symbol::RequiredSymbol;
pub use segment::Segment;
pub use symbol_assignment::SymbolAssignment;

pub use vram_class::VramClass;

pub use document::Document;

pub use traits::ScriptExporter;
pub use traits::ScriptGenerator;
pub use traits::ScriptImporter;

pub use linker_writer::LinkerWriter;
pub use partial_linker_writer::PartialLinkerWriter;

pub use runtime_settings::RuntimeSettings;
