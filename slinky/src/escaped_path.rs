/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{
    fmt::Display,
    path::{Path, PathBuf},
};

#[derive(Clone, Debug, Eq, PartialEq, Hash, Ord, PartialOrd)]
pub struct EscapedPath(pub(crate) PathBuf);

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

impl<P: AsRef<Path>> Extend<P> for EscapedPath {
    fn extend<I: IntoIterator<Item = P>>(&mut self, iter: I) {
        self.0.extend(iter);
    }
}

impl<'a> IntoIterator for &'a EscapedPath {
    type Item = &'a std::ffi::OsStr;
    type IntoIter = std::path::Iter<'a>;

    fn into_iter(self) -> std::path::Iter<'a> {
        self.0.iter()
    }
}

impl Display for EscapedPath {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let mut is_first = true;

        for x in self.0.components() {
            if !is_first {
                write!(f, "/")?;
            }
            is_first = false;
            write!(f, "{}", x.as_os_str().to_string_lossy())?;
        }
        Ok(())
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

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.0.as_os_str().is_empty()
    }

    pub fn push(&mut self, path: EscapedPath) {
        self.0.push(path.0)
    }
}
