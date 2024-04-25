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

    /// Generate linker script for partial linking multiple segments.
    /// Requires both `partial_scripts_path` and `partial_build_segments_path` YAML settings to be set.
    #[arg(short, long, default_value_t = false)]
    partial_linking: bool,
}

fn main() {
    let cli = Cli::parse();

    // TODO: don't use expect?
    let document = slinky::Document::read_file(&cli.input).expect("Error while parsing input file");

    // println!("settings {:#?}", document.settings);

    if cli.partial_linking {
        let mut writer = slinky::PartialLinkerWriter::new(&document.settings);

        writer.add_all_segment(&document.segments);

        let output_path = cli.output.expect("output path is required for partial linking");
        writer.save_linker_scripts(&output_path).expect("Error writing the linker scripts");
        writer
            .write_other_files()
            .expect("Error writing other files listed on the document");
    } else {
        let mut writer = slinky::LinkerWriter::new(&document.settings);

        writer.add_all_segments(&document.segments);

        if let Some(output_path) = cli.output {
            writer
                .save_linker_script(&output_path)
                .expect("Error writing the linker script");
        } else {
            println!("{}", writer.export_as_string());
        }

        writer
            .write_other_files()
            .expect("Error writing other files listed on the document");
    }

    //{
    //    let mut writer_test = slinky::LinkerWriter::new(&document.settings);
    //    writer_test.add_single_segment(&document.segments[3]);
    //    writer_test.save_linker_script(Path::new("test.ld")).expect("idk");
    //}
}
