/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use crate::{
    Document, EscapedPath, FileInfo, LinkerWriter, RequiredSymbol, RuntimeSettings, ScriptExporter,
    ScriptGenerator, ScriptImporter, Segment, SlinkyError, SymbolAssignment,
};

pub struct PartialLinkerWriter<'a> {
    main_writer: LinkerWriter<'a>,

    partial_writers: Vec<(LinkerWriter<'a>, String)>,

    d: &'a Document,
    rs: &'a RuntimeSettings,
}

impl<'a> PartialLinkerWriter<'a> {
    pub fn new(d: &'a Document, rs: &'a RuntimeSettings) -> Self {
        Self {
            main_writer: LinkerWriter::new_reference_partial_objects(d, rs),

            partial_writers: Vec::new(),

            d,
            rs,
        }
    }
}

impl ScriptImporter for PartialLinkerWriter<'_> {
    fn add_all_segments(&mut self, segments: &[Segment]) -> Result<(), SlinkyError> {
        let partial_build_segments_folder = match &self.d.settings.partial_build_segments_folder {
            Some(p) => p,
            None => {
                return Err(SlinkyError::MissingRequiredField {
                    name: "partial_build_segments_folder".to_string(),
                })
            }
        };

        self.main_writer.begin_sections()?;

        self.partial_writers.reserve(segments.len());
        for segment in segments {
            if !self.rs.should_emit_entry(
                &segment.exclude_if_any,
                &segment.exclude_if_all,
                &segment.include_if_any,
                &segment.include_if_all,
            ) {
                continue;
            }

            let mut partial_writer = LinkerWriter::new(self.d, self.rs);

            partial_writer.set_emit_sections_kind_symbols(false);
            partial_writer.set_emit_section_symbols(false);

            partial_writer.add_single_segment(segment)?;

            self.partial_writers
                .push((partial_writer, segment.name.clone()));

            let mut p = partial_build_segments_folder.clone();

            p.push(&format!("{}.o", segment.name));

            self.main_writer
                .add_segment(&segment.clone_with_new_files(vec![FileInfo::new_object(p)]))?;
        }

        self.main_writer.end_sections()?;

        Ok(())
    }

    fn add_entry(&mut self, entry: &str) -> Result<(), SlinkyError> {
        self.main_writer.add_entry(entry)
    }

    fn add_all_symbol_assignments(
        &mut self,
        symbol_assignments: &[SymbolAssignment],
    ) -> Result<(), SlinkyError> {
        self.main_writer
            .add_all_symbol_assignments(symbol_assignments)
    }

    fn add_all_required_symbols(
        &mut self,
        required_symbols: &[RequiredSymbol],
    ) -> Result<(), SlinkyError> {
        self.main_writer.add_all_required_symbols(required_symbols)
    }
}

impl ScriptExporter for PartialLinkerWriter<'_> {
    fn export_linker_script_to_file(&self, path: &EscapedPath) -> Result<(), SlinkyError> {
        let partial_scripts_folder =
            match self.d.settings.partial_scripts_folder_escaped(self.rs)? {
                Some(p) => p,
                None => {
                    return Err(SlinkyError::MissingRequiredField {
                        name: "partial_scripts_folder".to_string(),
                    })
                }
            };

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
        let partial_build_segments_folder = match self
            .d
            .settings
            .partial_build_segments_folder_escaped(self.rs)?
        {
            Some(p) => p,
            None => {
                return Err(SlinkyError::MissingRequiredField {
                    name: "partial_build_segments_folder".to_string(),
                })
            }
        };
        let partial_scripts_folder =
            match self.d.settings.partial_scripts_folder_escaped(self.rs)? {
                Some(p) => p,
                None => {
                    return Err(SlinkyError::MissingRequiredField {
                        name: "partial_scripts_folder".to_string(),
                    })
                }
            };

        self.main_writer.save_other_files()?;

        if self.d.settings.d_path.is_some() {
            for (partial, name) in &self.partial_writers {
                let mut target_path = base_path.clone();

                target_path.extend(&partial_build_segments_folder);
                target_path.push(EscapedPath::from(format!("{}.o", name)));

                let mut d_path = partial_scripts_folder.clone();

                d_path.push(EscapedPath::from(format!("{}.d", name)));

                partial.export_dependencies_file_to_file(&d_path, &target_path)?;
            }
        }

        Ok(())
    }
}

impl ScriptGenerator for PartialLinkerWriter<'_> {}

// Getters / Setters
impl PartialLinkerWriter<'_> {
    #[must_use]
    pub fn get_main_writer(&self) -> &LinkerWriter {
        &self.main_writer
    }

    #[must_use]
    pub fn get_partial_writers(&self) -> &Vec<(LinkerWriter, String)> {
        &self.partial_writers
    }
}
