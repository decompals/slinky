/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use crate::{Document, EscapedPath, Segment, Settings, SlinkyError, SymbolAssignment};

mod private {
    use crate::{
        file_info::FileInfoSerial, segment::SegmentSerial,
        symbol_assignment::SymbolAssignmentSerial, vram_class::VramClassSerial, LinkerWriter,
        PartialLinkerWriter,
    };

    pub trait Sealed {}

    impl Sealed for LinkerWriter<'_> {}
    impl Sealed for PartialLinkerWriter<'_> {}

    impl Sealed for SegmentSerial {}
    impl Sealed for FileInfoSerial {}
    impl Sealed for VramClassSerial {}
    impl Sealed for SymbolAssignmentSerial {}

    impl<T> Sealed for Vec<T> {}
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
