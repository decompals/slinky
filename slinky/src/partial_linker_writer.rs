/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::{Path, PathBuf};

use crate::{Document, FileInfo, LinkerWriter, RuntimeSettings, Segment, SlinkyError};

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

    pub fn add_all_segments(&mut self, segments: &[Segment]) -> Result<(), SlinkyError> {
        self.main_writer.begin_sections();

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

            let mut p = PathBuf::new();

            p.push(
                &self
                    .rs
                    .escape_path(&self.d.settings.partial_build_segments_folder)?,
            );
            p.push(&format!("{}.o", segment.name));

            let mut reference_segment = segment.clone();
            reference_segment.files = vec![FileInfo::new_object(p)];
            self.main_writer.add_segment(&reference_segment)?;
        }

        self.main_writer.end_sections();

        Ok(())
    }

    pub fn export_linker_script_to_files(&self, path: &Path) -> Result<(), SlinkyError> {
        self.main_writer.export_linker_script_to_file(path)?;

        for (partial, name) in &self.partial_writers {
            let mut p = PathBuf::new();

            p.push(
                &self
                    .rs
                    .escape_path(&self.d.settings.partial_scripts_folder)?,
            );
            p.push(&format!("{}.ld", name));

            partial.export_linker_script_to_file(&p)?;
        }

        Ok(())
    }

    pub fn save_other_files(&self) -> Result<(), SlinkyError> {
        self.main_writer.save_other_files()?;

        if self.d.settings.d_path.is_some() {
            for (partial, name) in &self.partial_writers {
                let mut target_path = PathBuf::new();

                target_path.push(&self.rs.escape_path(&self.d.settings.base_path)?);
                target_path.push(
                    &self
                        .rs
                        .escape_path(&self.d.settings.partial_build_segments_folder)?,
                );
                target_path.push(&format!("{}.o", name));

                let mut d_path = PathBuf::new();

                d_path.push(
                    &self
                        .rs
                        .escape_path(&self.d.settings.partial_scripts_folder)?,
                );
                d_path.push(&format!("{}.d", name));

                partial.export_dependencies_file_to_file(&d_path, &target_path)?;
            }
        }

        Ok(())
    }
}

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
