/* SPDX-FileCopyrightText: © 2026 decompals */
/* SPDX-License-Identifier: MIT */

pub(crate) mod linker_symbols_style;
pub(crate) mod partial;
pub(crate) mod predicate;
pub(crate) mod settings;

pub(crate) mod assert_entry;
pub(crate) mod file_info;
pub(crate) mod file_kind;
pub(crate) mod gp_info;
pub(crate) mod keep_sections;
pub(crate) mod required_symbol;
pub(crate) mod segment;
pub(crate) mod symbol_assignment;

pub(crate) mod vram_class;

pub(crate) mod document;

pub use linker_symbols_style::LinkerSymbolsStyle;
pub use partial::Partial;
pub use predicate::Predicate;
pub(crate) use predicate::PredicateSerial;
pub use settings::Settings;

pub use assert_entry::AssertEntry;
pub use file_info::FileInfo;
pub use file_kind::{
    FileKind, FileKindArchive, FileKindGroup, FileKindLinkerOffset, FileKindMovedGroup,
    FileKindObject, FileKindPad,
};
pub use gp_info::GpInfo;
pub use keep_sections::KeepSections;
pub use required_symbol::RequiredSymbol;
pub use segment::Segment;
pub use symbol_assignment::SymbolAssignment;

pub use vram_class::VramClass;

pub use document::Document;
