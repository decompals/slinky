/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{collections::HashMap, path::{Path, PathBuf}};

use crate::{FileInfo, FileKind, LinkerWriter, Segment, Settings, SlinkyError};

pub struct PartialLinkerWriter<'a> {
    main_writer: LinkerWriter<'a>,
    partial_writers: Vec<LinkerWriter<'a>>,

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

    pub fn add_all_segment(&mut self, segments: &[Segment]) {
        self.main_writer.begin_sections();

        for segment in segments {
            let mut partial_writer = LinkerWriter::new(self.settings);

            partial_writer.add_single_segment(segment);

            self.partial_writers.push(partial_writer);

            let mut p = PathBuf::new();

            p.push(&self.settings.partial_build_segments_path);
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

    pub fn save_linker_scripts(&self, _path: &Path) -> Result<(), SlinkyError> {
        Ok(())
    }

    pub fn write_other_files(&self) -> Result<(), SlinkyError> {
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
    pub fn get_partial_writers(&self) -> &Vec<LinkerWriter> {
        &self.partial_writers
    }
}
