/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::Path;

use crate::{Document, Segment, SlinkyError, SymbolAssignment};

mod private {
    use crate::{LinkerWriter, PartialLinkerWriter};

    pub trait Sealed {}

    impl Sealed for LinkerWriter<'_> {}
    impl Sealed for PartialLinkerWriter<'_> {}
}

pub trait ScriptImporter: private::Sealed {
    fn add_all_segments(&mut self, segments: &[Segment]) -> Result<(), SlinkyError>;
    fn add_all_symbol_assignments(
        &mut self,
        symbol_assignments: &[SymbolAssignment],
    ) -> Result<(), SlinkyError>;

    fn add_whole_document(&mut self, document: &Document) -> Result<(), SlinkyError> {
        self.add_all_segments(&document.segments)?;
        self.add_all_symbol_assignments(&document.symbol_assignments)?;

        Ok(())
    }
}

pub trait ScriptExporter: private::Sealed {
    fn export_linker_script_to_file(&self, path: &Path) -> Result<(), SlinkyError>;
    fn export_linker_script_to_string(&self) -> Result<String, SlinkyError>;

    fn save_other_files(&self) -> Result<(), SlinkyError>;
}

pub trait ScriptGenerator: ScriptImporter + ScriptExporter {}
