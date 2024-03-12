/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    fs::{self, File},
    path::Path,
};

use crate::SlinkyError;

pub(crate) fn capitalize(s: &str) -> String {
    // TODO: there must be a better way to Capitalize a string

    if s.is_empty() {
        return "".to_string();
    }

    s.chars().next().expect("").to_uppercase().to_string() + &s[1..]
}

pub(crate) fn create_file_and_parents(path: &Path) -> Result<File, SlinkyError> {
    // First we make the parents
    if let Some(parent) = path.parent() {
        if let Err(e) = fs::create_dir_all(parent) {
            return Err(SlinkyError::FailedDirCreate {
                path: parent.to_path_buf(),
                description: e.to_string(),
            });
        }
    }

    match File::create(path) {
        Ok(f) => Ok(f),
        Err(e) => Err(SlinkyError::FailedFileOpen {
            path: path.to_path_buf(),
            description: e.to_string(),
        }),
    }
}
