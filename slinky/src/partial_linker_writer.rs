/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::{Path, PathBuf};

use crate::{Document, FileInfo, LinkerWriter, Segment, SlinkyError};

pub struct PartialLinkerWriter<'a> {
    main_writer: LinkerWriter<'a>,

    partial_writers: Vec<(LinkerWriter<'a>, String)>,

    d: &'a Document,
}

impl<'a> PartialLinkerWriter<'a> {
    pub fn new(d: &'a Document) -> Self {
        Self {
            main_writer: LinkerWriter::new_reference_partial_objects(d),

            partial_writers: Vec::new(),

            d,
        }
    }

    pub fn add_all_segments(&mut self, segments: &[Segment]) -> Result<(), SlinkyError> {
        self.main_writer.begin_sections();

        self.partial_writers.reserve(segments.len());
        for segment in segments {
            let mut partial_writer = LinkerWriter::new(self.d);

            partial_writer.set_emit_sections_kind_symbols(false);
            partial_writer.set_emit_section_symbols(false);

            partial_writer.add_single_segment(segment)?;

            self.partial_writers
                .push((partial_writer, segment.name.clone()));

            let mut p = PathBuf::new();

            p.push(&self.d.settings.partial_build_segments_folder);
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

            p.push(&self.d.settings.partial_scripts_folder);
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

                target_path.push(&self.d.settings.partial_build_segments_folder);
                target_path.push(&format!("{}.o", name));

                let mut d_path = PathBuf::new();

                d_path.push(&self.d.settings.partial_scripts_folder);
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
