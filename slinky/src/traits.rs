/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use crate::{
    AssertEntry, Document, EscapedPath, RequiredSymbol, Segment, Settings, SlinkyError,
    SymbolAssignment,
};

mod private {
    use crate::{
        assert_entry::AssertEntrySerial, file_info::FileInfoSerial, gp_info::GpInfoSerial,
        required_symbol::RequiredSymbolSerial, segment::SegmentSerial,
        symbol_assignment::SymbolAssignmentSerial, vram_class::VramClassSerial, LinkerWriter,
        PartialLinkerWriter,
    };

    pub trait Sealed {}

    impl Sealed for LinkerWriter<'_> {}
    impl Sealed for PartialLinkerWriter<'_> {}

    impl Sealed for SegmentSerial {}
    impl Sealed for GpInfoSerial {}
    impl Sealed for FileInfoSerial {}
    impl Sealed for VramClassSerial {}
    impl Sealed for SymbolAssignmentSerial {}
    impl Sealed for RequiredSymbolSerial {}
    impl Sealed for AssertEntrySerial {}

    impl<T> Sealed for Vec<T> {}
    impl<T> Sealed for Option<T> {}
}

pub trait ScriptImporter: private::Sealed {
    fn add_all_segments(&mut self, segments: &[Segment]) -> Result<(), SlinkyError>;
    fn add_entry(&mut self, entry: &str) -> Result<(), SlinkyError>;
    fn add_all_symbol_assignments(
        &mut self,
        symbol_assignments: &[SymbolAssignment],
    ) -> Result<(), SlinkyError>;
    fn add_all_required_symbols(
        &mut self,
        required_symbols: &[RequiredSymbol],
    ) -> Result<(), SlinkyError>;
    fn add_all_asserts(&mut self, asserts: &[AssertEntry]) -> Result<(), SlinkyError>;

    fn add_whole_document(&mut self, document: &Document) -> Result<(), SlinkyError> {
        self.add_all_segments(&document.segments)?;
        if let Some(entry) = &document.entry {
            self.add_entry(entry)?;
        }
        self.add_all_symbol_assignments(&document.symbol_assignments)?;
        self.add_all_required_symbols(&document.required_symbols)?;
        self.add_all_asserts(&document.asserts)?;

        Ok(())
    }
}

pub trait ScriptExporter: private::Sealed {
    fn export_linker_script_to_file(&self, path: &EscapedPath) -> Result<(), SlinkyError>;
    fn export_linker_script_to_string(&self) -> Result<String, SlinkyError>;

    fn save_other_files(&self) -> Result<(), SlinkyError>;
}

pub trait ScriptGenerator: ScriptImporter + ScriptExporter {}

pub(crate) trait Serial: private::Sealed {
    type Output;

    fn unserialize(self, settings: &Settings) -> Result<Self::Output, SlinkyError>;
}

impl<T> Serial for Vec<T>
where
    T: Serial,
{
    type Output = Vec<T::Output>;

    fn unserialize(self, settings: &Settings) -> Result<Self::Output, SlinkyError> {
        self.into_iter().map(|x| x.unserialize(settings)).collect()
    }
}

impl<T> Serial for Option<T>
where
    T: Serial,
{
    type Output = Option<T::Output>;

    fn unserialize(self, settings: &Settings) -> Result<Self::Output, SlinkyError> {
        match self {
            Some(v) => v.unserialize(settings).map(Some),
            None => Ok(None),
        }
    }
}
