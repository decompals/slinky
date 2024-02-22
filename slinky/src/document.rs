/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{fs, path::Path};

use serde::Deserialize;

use crate::{Options, Segment, SlinkyError};

#[derive(Deserialize, PartialEq, Debug)]
pub struct Document {
    #[serde(default)]
    pub options: Options,

    pub segments: Vec<Segment>,
}

impl Document {
    pub fn read_file(path: &Path) -> Result<Self, SlinkyError> {
        let f = match fs::File::open(path) {
            Ok(f) => f,
            Err(e) => {
                return Err(SlinkyError::FailedFileOpen {
                    description: e.to_string(),
                })
            }
        };
        let mut document: Document = match serde_yaml::from_reader(f) {
            Ok(d) => d,
            Err(e) => {
                return Err(SlinkyError::FailedYamlParsing {
                    description: e.to_string(),
                })
            }
        };

        for segment in &mut document.segments {
            segment.use_subalign = Some(document.options.use_subalign);
            segment.subalign = Some(document.options.subalign);

            segment.wildcard_sections = Some(document.options.wildcard_sections);
        }

        Ok(document)
    }
}
