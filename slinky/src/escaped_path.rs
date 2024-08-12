/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::{Path, PathBuf};

#[derive(Clone, Debug, Eq, PartialEq, Hash, Ord, PartialOrd)]
pub struct EscapedPath(pub PathBuf);

impl AsRef<PathBuf> for EscapedPath {
    fn as_ref(&self) -> &PathBuf {
        &self.0
    }
}

impl AsRef<Path> for EscapedPath {
    fn as_ref(&self) -> &Path {
        &self.0
    }
}

impl AsMut<PathBuf> for EscapedPath {
    fn as_mut(&mut self) -> &mut PathBuf {
        &mut self.0
    }
}

impl From<String> for EscapedPath {
    fn from(value: String) -> Self {
        Self(PathBuf::from(value))
    }
}

impl Default for EscapedPath {
    fn default() -> Self {
        Self::new()
    }
}

impl EscapedPath {
    pub fn new() -> Self {
        Self(PathBuf::new())
    }

    pub fn push(&mut self, path: EscapedPath) {
        self.0.push(path.0)
    }

    pub fn display(&self) -> std::path::Display {
        self.0.display()
    }
}
