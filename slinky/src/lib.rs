/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

mod absent_nullable;
mod error;

mod linker_symbols_style;
mod settings;

mod file_info;
mod file_kind;
mod segment;

mod document;

mod linker_writer;

pub use error::SlinkyError;

pub use linker_symbols_style::LinkerSymbolsStyle;
pub use settings::Settings;

pub use file_info::FileInfo;
pub use file_kind::FileKind;
pub use segment::Segment;

pub use document::Document;

pub use linker_writer::LinkerWriter;

#[cfg(test)]
mod tests {
    use std::fs;
    use std::path::{Path, PathBuf};

    use rstest::rstest;

    use crate::Document;
    use crate::LinkerWriter;

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

    #[rstest]
    fn test_simple_linker_script_generation(#[files("../tests/input_files/*.yaml")] path: PathBuf) {
        let ld_path = get_target_path(&path, "linker_scripts", "ld");

        let document = Document::read_file(&path).expect("unable to read original file");

        let mut writer = LinkerWriter::new(&document.settings);
        writer.begin_sections();
        for segment in &document.segments {
            writer.add_segment(segment);
        }
        writer.end_sections();

        let expected_ld_contents =
            fs::read_to_string(ld_path).expect("unable to read expected ld file");

        assert_eq!(expected_ld_contents, writer.export_as_string());
    }
}
