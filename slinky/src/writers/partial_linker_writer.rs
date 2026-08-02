/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use crate::file_format::{
    AssertEntry, Document, FileInfo, Partial, Predicate, RequiredSymbol, Segment, SymbolAssignment,
};
use crate::utils::{EscapedPath, ScriptExporter, ScriptGenerator, ScriptImporter};
use crate::{RuntimeSettings, SlinkyError};

use super::LinkerWriter;

pub struct PartialLinkerWriter<'d, 'rs> {
    main_writer: LinkerWriter<'d, 'rs>,

    partial_writers: Vec<(LinkerWriter<'d, 'rs>, String)>,

    d: &'d Document,
    rs: &'rs RuntimeSettings,

    partial: &'d Partial,
}

impl<'d, 'rs> PartialLinkerWriter<'d, 'rs> {
    pub fn new(d: &'d Document, rs: &'rs RuntimeSettings) -> Result<Self, SlinkyError> {
        let main_writer = LinkerWriter::new_reference_partial_objects(d, rs)?;
        let partial_writers = Vec::new();
        let partial =
            d.settings
                .partial
                .as_ref()
                .ok_or_else(|| SlinkyError::MissingRequiredField {
                    name: "partial".to_string(),
                })?;

        Ok(Self {
            main_writer,

            partial_writers,

            d,
            rs,

            partial,
        })
    }
}

impl ScriptImporter for PartialLinkerWriter<'_, '_> {
    fn add_all_segments(&mut self, segments: &[Predicate<Segment>]) -> Result<(), SlinkyError> {
        let partial_build_segments_folder = &self.partial.build_segments_folder;
        let partial_segment_extension = &self.partial.segment_extension;

        self.main_writer.begin_sections()?;

        self.partial_writers.reserve(segments.len());
        for segment in segments {
            let Some(segment) = segment.get(self.rs) else {
                continue;
            };

            let mut partial_writer = LinkerWriter::new(self.d, self.rs)?;

            partial_writer.set_emit_sections_kind_symbols(false);
            partial_writer.set_emit_section_symbols(false);

            partial_writer.add_single_segment(segment)?;

            self.partial_writers
                .push((partial_writer, segment.name.clone()));

            let mut p = partial_build_segments_folder.clone();

            p.push(format!("{}.{}", segment.name, partial_segment_extension));

            // we use no_conditions because we already checked them at the
            // beginning of the loop
            let new_files_vec = vec![Predicate::new_no_conditions(FileInfo::new_object(p))];
            let generated_partial_segment = segment.clone_with_new_files(new_files_vec);
            self.main_writer.add_segment(&generated_partial_segment)?;
        }

        self.main_writer.end_sections()?;

        Ok(())
    }

    fn add_entry(&mut self, entry: &str) -> Result<(), SlinkyError> {
        self.main_writer.add_entry(entry)
    }

    fn add_all_symbol_assignments(
        &mut self,
        symbol_assignments: &[Predicate<SymbolAssignment>],
    ) -> Result<(), SlinkyError> {
        self.main_writer
            .add_all_symbol_assignments(symbol_assignments)
    }

    fn add_all_required_symbols(
        &mut self,
        required_symbols: &[Predicate<RequiredSymbol>],
    ) -> Result<(), SlinkyError> {
        self.main_writer.add_all_required_symbols(required_symbols)
    }

    fn add_all_asserts(&mut self, asserts: &[Predicate<AssertEntry>]) -> Result<(), SlinkyError> {
        self.main_writer.add_all_asserts(asserts)
    }
}

impl ScriptExporter for PartialLinkerWriter<'_, '_> {
    fn export_linker_script_to_file(&self, path: &EscapedPath) -> Result<(), SlinkyError> {
        let partial_scripts_folder = self.partial.scripts_folder_escaped(self.rs)?;

        self.main_writer.export_linker_script_to_file(path)?;

        for (partial, name) in &self.partial_writers {
            let mut p = partial_scripts_folder.clone();

            p.push(EscapedPath::from(format!("{}.ld", name)));

            partial.export_linker_script_to_file(&p)?;
        }

        Ok(())
    }

    fn export_linker_script_to_string(&self) -> Result<String, SlinkyError> {
        let mut out = Vec::new();

        out.push(self.main_writer.export_linker_script_to_string()?);

        for (partial, _name) in &self.partial_writers {
            out.push(partial.export_linker_script_to_string()?);
        }

        Ok(out.join("\n"))
    }

    fn save_other_files(&self) -> Result<(), SlinkyError> {
        let base_path = self.d.settings.base_path_escaped(self.rs)?;
        let partial_build_segments_folder = self.partial.build_segments_folder_escaped(self.rs)?;
        let partial_scripts_folder = self.partial.scripts_folder_escaped(self.rs)?;
        let partial_segment_extension = &self.partial.segment_extension;

        self.main_writer.save_other_files()?;

        if self.d.settings.d_path.is_some() {
            for (partial, name) in &self.partial_writers {
                let mut target_path = base_path.clone();

                target_path.extend(&partial_build_segments_folder);
                let segment_filename = format!("{name}.{partial_segment_extension}");
                target_path.push(EscapedPath::from(segment_filename));

                let mut d_path = partial_scripts_folder.clone();

                d_path.push(EscapedPath::from(format!("{}.d", name)));

                partial.export_dependencies_file_to_file(&d_path, &target_path)?;
            }
        }

        if self.d.settings.paths_list_path.is_some() {
            for (partial, name) in &self.partial_writers {
                let mut paths_list_path = partial_scripts_folder.clone();

                paths_list_path.push(EscapedPath::from(format!("{}.list", name)));

                partial.export_paths_list_to_file(&paths_list_path)?;
            }
        }

        Ok(())
    }
}

impl ScriptGenerator for PartialLinkerWriter<'_, '_> {}

// Getters / Setters
impl PartialLinkerWriter<'_, '_> {
    #[must_use]
    pub fn get_main_writer(&self) -> &LinkerWriter<'_, '_> {
        &self.main_writer
    }

    #[must_use]
    pub fn get_partial_writers(&self) -> &Vec<(LinkerWriter<'_, '_>, String)> {
        &self.partial_writers
    }
}
