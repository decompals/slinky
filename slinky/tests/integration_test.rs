/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::fs;
use std::path::{Path, PathBuf};

use rstest::rstest;
use slinky::{Document, SlinkyError};

fn set_custom_options(document: &mut Document) {
    // We are lazy and use the same version for every test case
    document
        .custom_options
        .insert("version".into(), "us".into());
    document
        .custom_options
        .insert("compiler".into(), "modern_gcc".into());
}

fn check_ld_generation(yaml_path: &Path, ld_path: &Path) -> Result<(), SlinkyError> {
    let mut document =
        slinky::Document::read_file(yaml_path).expect("unable to read original file");
    set_custom_options(&mut document);

    let mut writer = slinky::LinkerWriter::new(&document);
    writer.add_all_segments(&document.segments)?;

    let expected_ld_contents =
        fs::read_to_string(ld_path).expect("unable to read expected ld file");

    assert_eq!(
        expected_ld_contents,
        writer.export_linker_script_to_string().unwrap()
    );

    Ok(())
}

fn check_d_generation(yaml_path: &Path, ld_path: &Path) -> Result<(), SlinkyError> {
    let mut document =
        slinky::Document::read_file(yaml_path).expect("unable to read original file");
    set_custom_options(&mut document);

    let mut writer = slinky::LinkerWriter::new(&document);
    writer.add_all_segments(&document.segments)?;

    let expected_d_contents = fs::read_to_string(ld_path).expect("unable to read expected d file");

    let target_path = document.settings.target_path.as_ref().unwrap();
    assert_eq!(
        expected_d_contents,
        writer
            .export_dependencies_file_to_string(target_path)
            .unwrap()
    );

    Ok(())
}

fn check_symbols_header_generation(yaml_path: &Path, ld_path: &Path) -> Result<(), SlinkyError> {
    let mut document =
        slinky::Document::read_file(yaml_path).expect("unable to read original file");
    set_custom_options(&mut document);

    let mut writer = slinky::LinkerWriter::new(&document);
    writer.add_all_segments(&document.segments)?;

    let expected_h_contents = fs::read_to_string(ld_path).expect("unable to read expected h file");

    assert_eq!(
        expected_h_contents,
        writer.export_symbol_header_to_string().unwrap()
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

    let mut writer = slinky::PartialLinkerWriter::new(&document);
    writer.add_all_segments(&document.segments).expect("");

    let expected_ld_contents =
        fs::read_to_string(ld_path).expect("unable to read expected ld file");

    assert_eq!(
        expected_ld_contents,
        writer
            .get_main_writer()
            .export_linker_script_to_string()
            .unwrap()
    );

    for (partial, name) in writer.get_partial_writers() {
        let mut p = PathBuf::new();

        p.push("..");
        p.push(&document.settings.partial_scripts_folder);
        p.push(&format!("{}.ld", name));

        let expected_partial_ld_contents =
            fs::read_to_string(p).expect("unable to read expected ld file");

        assert_eq!(
            expected_partial_ld_contents,
            partial.export_linker_script_to_string().unwrap()
        );
    }
}

#[rstest]
fn test_partial_linking_d_generation(#[files("../tests/partial_linking/*.d")] d_path: PathBuf) {
    let yaml_path = d_path.with_extension("yaml");

    let document = slinky::Document::read_file(&yaml_path).expect("unable to read original file");

    let mut writer = slinky::PartialLinkerWriter::new(&document);
    writer.add_all_segments(&document.segments).expect("");

    let expected_d_contents = fs::read_to_string(d_path).expect("unable to read expected d file");

    let target_path = document.settings.target_path.as_ref().unwrap();
    assert_eq!(
        expected_d_contents,
        writer
            .get_main_writer()
            .export_dependencies_file_to_string(target_path)
            .unwrap()
    );

    for (partial, name) in writer.get_partial_writers() {
        let mut p = PathBuf::new();

        p.push("..");
        p.push(&document.settings.partial_scripts_folder);
        p.push(&format!("{}.d", name));

        let expected_partial_ld_contents =
            fs::read_to_string(p).expect("unable to read expected d file");

        let mut partial_target = PathBuf::new();
        partial_target.push(&document.settings.partial_build_segments_folder);
        partial_target.push(&format!("{}.o", name));
        assert_eq!(
            expected_partial_ld_contents,
            partial
                .export_dependencies_file_to_string(&partial_target)
                .unwrap()
        );
    }
}

#[rstest]
fn test_partial_linking_symbols_header_generation(
    #[files("../tests/partial_linking/*.h")] h_path: PathBuf,
) {
    let yaml_path = h_path.with_extension("yaml");
    let document = slinky::Document::read_file(&yaml_path).expect("unable to read original file");

    let mut writer = slinky::PartialLinkerWriter::new(&document);
    writer.add_all_segments(&document.segments).expect("");

    let expected_h_contents = fs::read_to_string(h_path).expect("unable to read expected h file");

    assert_eq!(
        expected_h_contents,
        writer
            .get_main_writer()
            .export_symbol_header_to_string()
            .unwrap()
    );
}
