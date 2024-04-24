/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use crate::{LinkerWriter, Segment, Settings};

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

    pub fn add_segment(&mut self, _segment: &Segment) {
        let partial_writer = LinkerWriter::new(self.settings);

        self.partial_writers.push(partial_writer);
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
