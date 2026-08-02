/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use crate::file_format::{
    AssertEntry, Document, Predicate, RequiredSymbol, Segment, Settings, SymbolAssignment,
};
use crate::SlinkyError;

use super::EscapedPath;

mod private {
    use crate::file_format::{
        assert_entry::AssertEntrySerial, file_info::FileInfoSerial, gp_info::GpInfoSerial,
        required_symbol::RequiredSymbolSerial, segment::SegmentSerial,
        symbol_assignment::SymbolAssignmentSerial, vram_class::VramClassSerial,
    };

    use crate::writers::{LinkerWriter, PartialLinkerWriter};

    pub trait Sealed {}

    impl Sealed for LinkerWriter<'_, '_> {}
    impl Sealed for PartialLinkerWriter<'_, '_> {}

    impl Sealed for SegmentSerial {}
    impl Sealed for GpInfoSerial {}
    impl Sealed for FileInfoSerial {}
    impl Sealed for VramClassSerial {}
    impl Sealed for SymbolAssignmentSerial {}
    impl Sealed for RequiredSymbolSerial {}
    impl Sealed for AssertEntrySerial {}

    impl<T> Sealed for Vec<T> where T: Sealed {}
    impl<T> Sealed for Option<T> where T: Sealed {}
}

pub trait ScriptImporter: private::Sealed {
    fn add_all_segments(&mut self, segments: &[Predicate<Segment>]) -> Result<(), SlinkyError>;
    fn add_entry(&mut self, entry: &str) -> Result<(), SlinkyError>;
    fn add_all_symbol_assignments(
        &mut self,
        symbol_assignments: &[Predicate<SymbolAssignment>],
    ) -> Result<(), SlinkyError>;
    fn add_all_required_symbols(
        &mut self,
        required_symbols: &[Predicate<RequiredSymbol>],
    ) -> Result<(), SlinkyError>;
    fn add_all_asserts(&mut self, asserts: &[Predicate<AssertEntry>]) -> Result<(), SlinkyError>;

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

    fn unserialize(self, settings: &Settings) -> Result<Predicate<Self::Output>, SlinkyError>;
}

pub(crate) trait SerialVec: private::Sealed {
    type Output;

    fn unserialize(self, settings: &Settings) -> Result<Vec<Predicate<Self::Output>>, SlinkyError>;
}

pub(crate) trait SerialOpt: private::Sealed {
    type Output;

    fn unserialize(
        self,
        settings: &Settings,
    ) -> Result<Option<Predicate<Self::Output>>, SlinkyError>;
}

impl<T> SerialVec for Vec<T>
where
    T: Serial,
{
    type Output = T::Output;

    fn unserialize(self, settings: &Settings) -> Result<Vec<Predicate<Self::Output>>, SlinkyError> {
        self.into_iter().map(|x| x.unserialize(settings)).collect()
    }
}

impl<T> SerialOpt for Option<T>
where
    T: Serial,
{
    type Output = T::Output;

    fn unserialize(
        self,
        settings: &Settings,
    ) -> Result<Option<Predicate<Self::Output>>, SlinkyError> {
        match self {
            Some(v) => v.unserialize(settings).map(Some),
            None => Ok(None),
        }
    }
}
