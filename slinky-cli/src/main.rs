/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::Path;

use slinky::{Document, LinkerWriter};

fn main() {
    // TODO: don't use expect?
    let document = Document::read_file(Path::new("tests/input_files/test_case.yaml"))
        .expect("Error while parsing input file");

    // println!("settings {:#?}", document.settings);

    let mut writer = LinkerWriter::new(&document.settings);
    writer.begin_sections();
    for segment in &document.segments {
        writer.add_segment(segment);
    }
    writer.end_sections();

    writer
        .save_linker_script(Path::new("tests/linker_scripts/test_case.ld"))
        .expect("Error writing the linker script");
}
