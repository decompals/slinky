/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::PathBuf;

use clap::Parser;

// TODO: Add program description to cli

#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Cli {
    /// Input file
    input: PathBuf,

    /// Output file. Print to stdout if missing
    #[arg(short, long)]
    output: Option<PathBuf>,
}

fn main() {
    let cli = Cli::parse();

    // TODO: don't use expect?
    let document = slinky::Document::read_file(&cli.input).expect("Error while parsing input file");

    // println!("settings {:#?}", document.settings);

    let mut writer = slinky::LinkerWriter::new(&document.settings);
    writer.begin_sections();
    for segment in &document.segments {
        writer.add_segment(segment);
    }
    writer.end_sections();

    if let Some(output_path) = cli.output {
        writer
            .save_linker_script(&output_path)
            .expect("Error writing the linker script");
    } else {
        println!("{}", writer.export_as_string());
    }

    //{
    //    let mut writer_test = slinky::LinkerWriter::new(&document.settings);
    //    writer_test.add_single_segment(&document.segments[3]);
    //    writer_test.save_linker_script(Path::new("test.ld")).expect("idk");
    //}

    writer
        .write_other_files()
        .expect("Error writing other files listed on the document");
}
