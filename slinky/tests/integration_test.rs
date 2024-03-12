/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::fs;
use std::path::{Path, PathBuf};

use rstest::rstest;

fn check_ld_generation(yaml_path: &Path, ld_path: &Path) {
    let document = slinky::Document::read_file(yaml_path).expect("unable to read original file");

    let mut writer = slinky::LinkerWriter::new(&document.settings);
    writer.begin_sections();
    for segment in &document.segments {
        writer.add_segment(segment);
    }
    writer.end_sections();

    let expected_ld_contents =
        fs::read_to_string(ld_path).expect("unable to read expected ld file");

    assert_eq!(expected_ld_contents, writer.export_as_string());
}

fn check_d_generation(yaml_path: &Path, ld_path: &Path) {
    let document = slinky::Document::read_file(yaml_path).expect("unable to read original file");

    let mut dependencies_writer = slinky::DependenciesWriter::new(&document.settings);
    for segment in &document.segments {
        dependencies_writer.add_segment(segment);
    }

    let expected_d_contents = fs::read_to_string(ld_path).expect("unable to read expected d file");

    let target_path = document.settings.target_path.as_ref().unwrap();
    assert_eq!(
        expected_d_contents,
        dependencies_writer.export_as_string(target_path)
    );
}

fn check_symbols_header_generation(yaml_path: &Path, ld_path: &Path) {
    let document = slinky::Document::read_file(yaml_path).expect("unable to read original file");

    let mut writer = slinky::LinkerWriter::new(&document.settings);
    writer.begin_sections();
    for segment in &document.segments {
        writer.add_segment(segment);
    }
    writer.end_sections();

    let expected_h_contents = fs::read_to_string(ld_path).expect("unable to read expected h file");

    assert_eq!(expected_h_contents, writer.export_symbol_header_as_string());
}

#[rstest]
fn test_simple_linker_script_generation(#[files("../tests/test_cases/*.ld")] ld_path: PathBuf) {
    let yaml_path = ld_path.with_extension("yaml");

    check_ld_generation(&yaml_path, &ld_path);
}

#[rstest]
fn test_dependency_d_generation(#[files("../tests/test_cases/*.d")] d_path: PathBuf) {
    let yaml_path = d_path.with_extension("yaml");

    check_d_generation(&yaml_path, &d_path);
}

#[rstest]
fn test_symbols_header_generation(#[files("../tests/test_cases/*.h")] h_path: PathBuf) {
    let yaml_path = h_path.with_extension("yaml");

    check_symbols_header_generation(&yaml_path, &h_path);
}

#[rstest]
#[should_panic]
fn test_panic_invalid_yamls(#[files("../tests/panics/*.yaml")] path: PathBuf) {
    slinky::Document::read_file(&path).unwrap();
}
