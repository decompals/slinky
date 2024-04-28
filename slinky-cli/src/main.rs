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
    /// Requires both `partial_scripts_folder` and `partial_build_segments_folder` YAML settings to be set.
    #[arg(short, long, default_value_t = false)]
    partial_linking: bool,
}

fn main() {
    let cli = Cli::parse();

    // TODO: don't use expect?
    let document = slinky::Document::read_file(&cli.input).expect("Error while parsing input file");

    // println!("settings {:#?}", document.settings);

    if cli.partial_linking {
        let mut writer = slinky::PartialLinkerWriter::new(&document);

        writer.add_all_segments(&document.segments);

        let output_path = cli
            .output
            .expect("output path is required for partial linking");
        writer
            .export_linker_script_to_files(&output_path)
            .expect("Error writing the linker scripts");
        writer
            .save_other_files()
            .expect("Error writing other files listed on the document");
    } else {
        let mut writer = slinky::LinkerWriter::new(&document);

        writer.add_all_segments(&document.segments);

        if let Some(output_path) = cli.output {
            writer
                .export_linker_script_to_file(&output_path)
                .expect("Error writing the linker script");
        } else {
            println!(
                "{}",
                writer
                    .export_linker_script_to_string()
                    .expect("Error exporting script to string")
            );
        }

        writer
            .save_other_files()
            .expect("Error writing other files listed on the document");
    }
}
