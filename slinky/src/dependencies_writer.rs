/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::io::Write;
use std::path::{Path, PathBuf};

use crate::{utils, FileInfo, FileKind, Segment, Settings, SlinkyError};

pub struct DependenciesWriter<'a> {
    required_files: Vec<PathBuf>,

    settings: &'a Settings,
}

impl<'a> DependenciesWriter<'a> {
    pub fn new(settings: &'a Settings) -> Self {
        Self {
            required_files: Vec::new(),
            settings,
        }
    }

    pub fn add_segment(&mut self, segment: &Segment) {
        for file in &segment.files {
            self.emit_file(file, segment, &self.settings.base_path);
        }
    }

    pub fn save_dependencies_file(
        &mut self,
        path: &Path,
        target_path: &Path,
    ) -> Result<(), SlinkyError> {
        let mut f = utils::create_file_and_parents(path)?;

        if let Err(e) = write!(f, "{}:", target_path.display()) {
            return Err(SlinkyError::FailedFileWrite {
                path: path.to_path_buf(),
                description: e.to_string(),
                contents: target_path.display().to_string(),
            });
        }

        for p in &self.required_files {
            if let Err(e) = write!(f, " \\\n    {}", p.display()) {
                return Err(SlinkyError::FailedFileWrite {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                    contents: p.display().to_string(),
                });
            }
        }

        if let Err(e) = write!(f, "\n\n") {
            return Err(SlinkyError::FailedFileWrite {
                path: path.to_path_buf(),
                description: e.to_string(),
                contents: "".to_string(),
            });
        }

        for p in &self.required_files {
            if let Err(e) = writeln!(f, "{}:", p.display()) {
                return Err(SlinkyError::FailedFileWrite {
                    path: path.to_path_buf(),
                    description: e.to_string(),
                    contents: p.display().to_string(),
                });
            }
        }

        Ok(())
    }

    #[must_use]
    pub fn export_as_string(&self, target_path: &Path) -> String {
        let mut ret = String::new();

        ret += &format!("{}:", target_path.display());

        for p in &self.required_files {
            ret += &format!(" \\\n    {}", p.display());
        }

        ret += "\n\n";

        for p in &self.required_files {
            ret += &format!("{}:\n", p.display());
        }

        ret
    }
}

// internal functions
impl<'a> DependenciesWriter<'a> {
    fn emit_file(&mut self, file: &FileInfo, segment: &Segment, base_path: &Path) {
        // TODO: figure out glob support
        match file.kind {
            FileKind::Object | FileKind::Archive => {
                let mut path = base_path.to_path_buf();
                path.extend(&file.path);

                self.required_files.push(path);
            }
            FileKind::Pad | FileKind::LinkerOffset => (),
            FileKind::Group => {
                let mut new_base_path = base_path.to_path_buf();

                new_base_path.extend(&file.dir);

                for file_of_group in &file.files {
                    self.emit_file(file_of_group, segment, &new_base_path);
                }
            }
        }
    }
}
