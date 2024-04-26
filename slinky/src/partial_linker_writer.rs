/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    collections::HashMap,
    path::{Path, PathBuf},
};

use crate::{FileInfo, FileKind, LinkerWriter, Segment, Settings, SlinkyError};

pub struct PartialLinkerWriter<'a> {
    main_writer: LinkerWriter<'a>,

    partial_writers: Vec<(LinkerWriter<'a>, String)>,

    settings: &'a Settings,
}

impl<'a> PartialLinkerWriter<'a> {
    pub fn new(settings: &'a Settings) -> Self {
        Self {
            main_writer: LinkerWriter::new(settings),

            partial_writers: Vec::new(),

            settings,
        }
    }

    pub fn add_all_segments(&mut self, segments: &[Segment]) {
        self.main_writer.begin_sections();

        self.partial_writers.reserve(segments.len());
        for segment in segments {
            let mut partial_writer = LinkerWriter::new(self.settings);

            partial_writer.add_single_segment(segment);

            self.partial_writers
                .push((partial_writer, segment.name.clone()));

            let mut p = PathBuf::new();

            p.push(&self.settings.partial_build_segments_folder);
            p.push(&format!("{}.o", segment.name));

            let mut reference_segment = segment.clone();
            reference_segment.files = vec![FileInfo {
                path: p,
                kind: FileKind::Object,
                subfile: "".into(),
                pad_amount: 0,
                section: "".into(),
                linker_offset_name: "".into(),
                section_order: HashMap::new(),
                files: Vec::new(),
                dir: PathBuf::new(),
            }];
            self.main_writer.add_segment(&reference_segment);
        }

        self.main_writer.end_sections();
    }

    pub fn save_linker_scripts(&self, path: &Path) -> Result<(), SlinkyError> {
        self.main_writer.save_linker_script(path)?;

        for (partial, name) in &self.partial_writers {
            let mut p = PathBuf::new();

            p.push(&self.settings.partial_scripts_folder);
            p.push(&format!("{}.ld", name));

            partial.save_linker_script(&p)?;
        }

        Ok(())
    }

    pub fn write_other_files(&self) -> Result<(), SlinkyError> {
        self.main_writer.write_other_files()?;

        //for (partial, _name) in &self.partial_writers {
        //    partial.write_other_files()?;
        //}

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
