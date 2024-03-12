/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::fs;
use std::path::{Path, PathBuf};

use rstest::rstest;

// Is there a better way to do this?
// Converts "tests/input_files/test_case.yaml" to "tests/`folder_name`/test_case.`extension`"
fn get_target_path(original: &Path, folder_name: &str, extension: &str) -> PathBuf {
    let ancestors: Vec<_> = original.ancestors().collect();
    let mut test_path = ancestors[2].to_path_buf();

    let extension_temp = original.with_extension(extension);
    let ld_name = extension_temp
        .file_name()
        .unwrap()
        .to_os_string()
        .into_string()
        .unwrap();

    test_path.extend(Path::new(folder_name));
    test_path.extend(Path::new(&ld_name));

    test_path
}

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

    let expected_ld_contents =
        fs::read_to_string(ld_path).expect("unable to read expected ld file");

    let target_path = document.settings.target_path.as_ref().unwrap();
    assert_eq!(
        expected_ld_contents,
        dependencies_writer.export_as_string(target_path)
    );
}

#[rstest]
fn test_simple_linker_script_generation(#[files("../tests/input_files/*.yaml")] path: PathBuf) {
    let ld_path = get_target_path(&path, "linker_scripts", "ld");

    check_ld_generation(&path, &ld_path);
}

#[rstest]
fn test_dependency_ld_generation(#[files("../tests/d_inputs/*.yaml")] path: PathBuf) {
    let ld_path = get_target_path(&path, "d_outputs", "ld");

    check_ld_generation(&path, &ld_path);
}

#[rstest]
fn test_dependency_d_generation(#[files("../tests/d_inputs/*.yaml")] path: PathBuf) {
    let ld_path = get_target_path(&path, "d_outputs", "d");

    check_d_generation(&path, &ld_path);
}

#[rstest]
#[should_panic]
fn test_panic_invalid_yamls(#[files("../tests/panics/*.yaml")] path: PathBuf) {
    slinky::Document::read_file(&path).unwrap();
}
