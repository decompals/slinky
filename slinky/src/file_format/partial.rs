/* SPDX-FileCopyrightText: © 2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::PathBuf;

use serde::Deserialize;

use crate::utils::{AbsentNullable, EscapedPath};
use crate::{RuntimeSettings, SlinkyError};

#[derive(Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash)]
#[non_exhaustive]
pub struct Partial {
    pub scripts_folder: PathBuf,
    pub build_segments_folder: PathBuf,

    pub segment_extension: String,
}

fn partial_default_segment_extension() -> String {
    "plf".into()
}

impl Partial {
    pub fn scripts_folder_escaped(&self, rs: &RuntimeSettings) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.scripts_folder)
    }

    pub fn build_segments_folder_escaped(
        &self,
        rs: &RuntimeSettings,
    ) -> Result<EscapedPath, SlinkyError> {
        rs.escape_path(&self.build_segments_folder)
    }
}

#[derive(Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash, Deserialize)]
#[serde(deny_unknown_fields)]
#[non_exhaustive]
pub(crate) struct PartialSerial {
    pub scripts_folder: PathBuf,
    pub build_segments_folder: PathBuf,

    #[serde(default)]
    pub segment_extension: AbsentNullable<String>,
}

impl PartialSerial {
    pub fn unserialize(self) -> Result<Partial, SlinkyError> {
        let Self {
            scripts_folder,
            build_segments_folder,
            segment_extension,
        } = self;

        let scripts_folder = scripts_folder;
        let build_segments_folder = build_segments_folder;

        let segment_extension = segment_extension
            .get_non_null("segment_extension", partial_default_segment_extension)?;

        if segment_extension.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "segment_extension".to_string(),
            });
        }

        Ok(Partial {
            scripts_folder,
            build_segments_folder,

            segment_extension,
        })
    }
}
