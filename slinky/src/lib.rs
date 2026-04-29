/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

#![warn(clippy::exhaustive_enums)]
#![warn(clippy::exhaustive_structs)]

mod error;
mod utils;

pub mod file_format;

pub mod writers;

mod runtime_settings;

pub mod version;

pub use error::SlinkyError;

pub use utils::EscapedPath;
pub use utils::ScriptExporter;
pub use utils::ScriptGenerator;
pub use utils::ScriptImporter;

pub use file_format::Document;

pub use writers::LinkerWriter;
pub use writers::PartialLinkerWriter;

pub use runtime_settings::RuntimeSettings;
