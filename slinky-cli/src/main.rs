/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{error::Error, path::PathBuf};

use clap::Parser;
use regex::Regex;
use slinky::{RuntimeSettings, ScriptGenerator};

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

    #[arg(short = 'c', long, value_parser = parse_key_val::<String, String>, value_delimiter = ',')]
    custom_options: Vec<(String, String)>,

    /// Disables the version comment emitted on linker scripts
    #[arg(long)]
    omit_version_comment: bool,
}

// Taken from https://github.com/clap-rs/clap/blob/f5965e586292d31b2a2cbd83f19d145180471012/examples/typed-derive.rs#L48
/// Parse a single key-value pair
fn parse_key_val<T, U>(s: &str) -> Result<(T, U), Box<dyn Error + Send + Sync + 'static>>
where
    T: std::str::FromStr,
    T::Err: Error + Send + Sync + 'static,
    U: std::str::FromStr,
    U::Err: Error + Send + Sync + 'static,
{
    let pos = s
        .find('=')
        .ok_or_else(|| format!("invalid KEY=value: no `=` found in `{s}`"))?;
    Ok((s[..pos].parse()?, s[pos + 1..].parse()?))
}

fn create_runtime_settings(cli: &Cli) -> slinky::RuntimeSettings {
    let mut rs = slinky::RuntimeSettings::new();

    let regex_identifier = Regex::new(r"[a-zA-Z_][a-zA-Z0-9_]*").unwrap();

    for (key, _value) in &cli.custom_options {
        if !regex_identifier.is_match(key) {
            // TODO: is there a better alternative than a plain panic?
            panic!("Invalid key for custom option: '{}'", key);
        }
    }

    rs.add_custom_options(cli.custom_options.iter().cloned());

    rs.set_emit_version_comment(!cli.omit_version_comment);

    rs
}

fn write_script(
    writer: &mut impl ScriptGenerator,
    document: &slinky::Document,
    rs: &RuntimeSettings,
    output: &Option<PathBuf>,
) {
    writer.add_whole_document(document).expect("ah?");

    if let Some(output_path) = output {
        writer
            .export_linker_script_to_file(
                &rs.escape_path(output_path).expect("Error escaping path"),
            )
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

fn main() {
    let cli = Cli::parse();

    // TODO: don't use expect?
    let document = slinky::Document::read_file(&cli.input).expect("Error while parsing input file");

    // println!("settings {:#?}", document.settings);

    let rs = create_runtime_settings(&cli);

    if cli.partial_linking {
        let mut writer = slinky::PartialLinkerWriter::new(&document, &rs);

        write_script(&mut writer, &document, &rs, &cli.output);
    } else {
        let mut writer = slinky::LinkerWriter::new(&document, &rs);

        write_script(&mut writer, &document, &rs, &cli.output);
    }
}
