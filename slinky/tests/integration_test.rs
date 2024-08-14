/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::fs;
use std::path::{Path, PathBuf};

use rstest::rstest;
use slinky::{RuntimeSettings, ScriptExporter, ScriptImporter, SlinkyError};

fn compare_multiline_strings(expected: &str, generated: &str) {
    // We manually strip the CARRIAGE RETURN (`\r`/`U+000D`) character only from
    // expected because it may get included into the test files when cloning this
    // repository on Windows with a git configured with its default settings.
    //
    // Rust never writes a `\r` character using the `writeln!` macro, so it is
    // not like this character would get added automatically on Windows builds
    // of slinky, so the simplest solution is to just strip this character from
    // `expected`.
    //
    // What can go wrong?
    let expected_cleaned = expected.replace('\r', "");

    if expected_cleaned == generated {
        return;
    }

    // both strings are not the same, try to figure out where the issue is.
    println!("Not equal strings :c");
    println!();

    let mut expected_splitted = expected_cleaned.split("\n");
    let mut generated_splitted = generated.split("\n");

    // https://stackoverflow.com/a/38168890/6292472
    loop {
        match (expected_splitted.next(), generated_splitted.next()) {
            (Some(l), Some(r)) => {
                if l != r {
                    println!("  Different lines:");
                    println!("    expected:  {:?}", l);
                    println!("    generated: {:?}", r);
                    println!();
                }
            }
            (Some(l), None) => {
                println!("  Only one line:");
                println!("    expected:  {:?}", l);
                println!();
            }
            (None, Some(r)) => {
                println!("  Only one line:");
                println!("    generated: {:?}", r);
                println!();
            }
            (None, None) => break,
        }
    }

    println!();
    println!("full inequality:");
    println!();

    assert_eq!(expected_cleaned, generated);
}

fn create_runtime_settings() -> RuntimeSettings {
    let mut rs = RuntimeSettings::new();

    // We are lazy and use the same version for every test case
    rs.add_custom_options([
        ("version".into(), "us".into()),
        ("compiler".into(), "modern_gcc".into()),
    ]);

    rs.set_emit_version_comment(false);

    rs
}

fn check_ld_generation(yaml_path: &Path, ld_path: &Path) -> Result<(), SlinkyError> {
    let document = slinky::Document::read_file(yaml_path).expect("unable to read original file");
    let rs = create_runtime_settings();

    let mut writer = slinky::LinkerWriter::new(&document, &rs);
    writer.add_whole_document(&document)?;

    let expected_ld_contents =
        fs::read_to_string(ld_path).expect("unable to read expected ld file");

    compare_multiline_strings(
        &expected_ld_contents,
        &writer.export_linker_script_to_string().unwrap(),
    );

    Ok(())
}

fn check_d_generation(yaml_path: &Path, ld_path: &Path) -> Result<(), SlinkyError> {
    let document = slinky::Document::read_file(yaml_path).expect("unable to read original file");
    let rs = create_runtime_settings();

    let mut writer = slinky::LinkerWriter::new(&document, &rs);
    writer.add_whole_document(&document)?;

    let expected_d_contents = fs::read_to_string(ld_path).expect("unable to read expected d file");

    let target_path = &document.settings.target_path_escaped(&rs)?.unwrap();
    compare_multiline_strings(
        &expected_d_contents,
        &writer
            .export_dependencies_file_to_string(target_path)
            .unwrap(),
    );

    Ok(())
}

fn check_symbols_header_generation(yaml_path: &Path, ld_path: &Path) -> Result<(), SlinkyError> {
    let document = slinky::Document::read_file(yaml_path).expect("unable to read original file");
    let rs = create_runtime_settings();

    let mut writer = slinky::LinkerWriter::new(&document, &rs);
    writer.add_whole_document(&document)?;

    let expected_h_contents = fs::read_to_string(ld_path).expect("unable to read expected h file");

    compare_multiline_strings(
        &expected_h_contents,
        &writer.export_symbol_header_to_string().unwrap(),
    );

    Ok(())
}

#[rstest]
fn test_simple_linker_script_generation(#[files("../tests/test_cases/*.ld")] ld_path: PathBuf) {
    let yaml_path = ld_path.with_extension("yaml");

    check_ld_generation(&yaml_path, &ld_path).expect("");
}

#[rstest]
fn test_dependency_d_generation(#[files("../tests/test_cases/*.d")] d_path: PathBuf) {
    let yaml_path = d_path.with_extension("yaml");

    check_d_generation(&yaml_path, &d_path).expect("");
}

#[rstest]
fn test_symbols_header_generation(#[files("../tests/test_cases/*.h")] h_path: PathBuf) {
    let yaml_path = h_path.with_extension("yaml");

    check_symbols_header_generation(&yaml_path, &h_path).expect("");
}

#[rstest]
#[should_panic]
fn test_panic_invalid_yamls(#[files("../tests/panics/*.yaml")] path: PathBuf) {
    slinky::Document::read_file(&path).unwrap();
}

#[rstest]
fn test_partial_linking_script_generation(
    #[files("../tests/partial_linking/*.ld")] ld_path: PathBuf,
) {
    let yaml_path = ld_path.with_extension("yaml");

    let document = slinky::Document::read_file(&yaml_path).expect("unable to read original file");
    let rs = create_runtime_settings();

    let mut writer = slinky::PartialLinkerWriter::new(&document, &rs);
    writer.add_whole_document(&document).expect("");

    let expected_ld_contents =
        fs::read_to_string(ld_path).expect("unable to read expected ld file");

    compare_multiline_strings(
        &expected_ld_contents,
        &writer
            .get_main_writer()
            .export_linker_script_to_string()
            .unwrap(),
    );

    for (partial, name) in writer.get_partial_writers() {
        let mut p = PathBuf::new();

        p.push("..");
        p.push(
            document
                .settings
                .partial_scripts_folder_escaped(&rs)
                .expect("Not able to escape path")
                .unwrap(),
        );
        p.push(&format!("{}.ld", name));

        let expected_partial_ld_contents =
            fs::read_to_string(p).expect("unable to read expected ld file");

        compare_multiline_strings(
            &expected_partial_ld_contents,
            &partial.export_linker_script_to_string().unwrap(),
        );
    }
}

#[rstest]
fn test_partial_linking_d_generation(#[files("../tests/partial_linking/*.d")] d_path: PathBuf) {
    use slinky::EscapedPath;

    let yaml_path = d_path.with_extension("yaml");

    let document = slinky::Document::read_file(&yaml_path).expect("unable to read original file");
    let rs = create_runtime_settings();

    let mut writer = slinky::PartialLinkerWriter::new(&document, &rs);
    writer.add_whole_document(&document).expect("");

    let expected_d_contents = fs::read_to_string(d_path).expect("unable to read expected d file");

    let target_path = &document.settings.target_path_escaped(&rs).unwrap().unwrap();
    compare_multiline_strings(
        &expected_d_contents,
        &writer
            .get_main_writer()
            .export_dependencies_file_to_string(target_path)
            .unwrap(),
    );

    for (partial, name) in writer.get_partial_writers() {
        let mut p = PathBuf::new();

        p.push("..");
        p.push(
            document
                .settings
                .partial_scripts_folder_escaped(&rs)
                .expect("Unable to escape path")
                .unwrap(),
        );
        p.push(&format!("{}.d", name));

        let expected_partial_ld_contents =
            fs::read_to_string(p).expect("unable to read expected d file");

        let mut partial_target = document
            .settings
            .base_path_escaped(&rs)
            .expect("Failed to escape path");

        partial_target.push(
            document
                .settings
                .partial_build_segments_folder_escaped(&rs)
                .expect("Failed to escape path")
                .unwrap(),
        );
        partial_target.push(EscapedPath::from(format!("{}.o", name)));

        compare_multiline_strings(
            &expected_partial_ld_contents,
            &partial
                .export_dependencies_file_to_string(&partial_target)
                .unwrap(),
        );
    }
}

#[rstest]
fn test_partial_linking_symbols_header_generation(
    #[files("../tests/partial_linking/*.h")] h_path: PathBuf,
) {
    let yaml_path = h_path.with_extension("yaml");
    let document = slinky::Document::read_file(&yaml_path).expect("unable to read original file");
    let rs = create_runtime_settings();

    let mut writer = slinky::PartialLinkerWriter::new(&document, &rs);
    writer.add_whole_document(&document).expect("");

    let expected_h_contents = fs::read_to_string(h_path).expect("unable to read expected h file");

    compare_multiline_strings(
        &expected_h_contents,
        &writer
            .get_main_writer()
            .export_symbol_header_to_string()
            .unwrap(),
    );
}
