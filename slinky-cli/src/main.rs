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
    let mut dependencies_writer = slinky::DependenciesWriter::new(&document.settings);
    writer.begin_sections();
    for segment in &document.segments {
        writer.add_segment(segment);
        dependencies_writer.add_segment(segment);
    }
    writer.end_sections();

    if let Some(output_path) = cli.output {
        writer
            .save_linker_script(&output_path)
            .expect("Error writing the linker script");
    } else {
        println!("{}", writer.export_as_string());
    }

    if let Some(d_path) = &document.settings.d_path {
        if let Some(target_path) = &document.settings.target_path {
            dependencies_writer
                .save_dependencies_file(d_path, target_path)
                .expect("Error writing dependencies file");
        }
    }

    if let Some(symbols_header_path) = &document.settings.symbols_header_path {
        writer.save_symbol_header(symbols_header_path).expect("Error writing symbol header file");
    }
}
