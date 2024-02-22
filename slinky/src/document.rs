/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::{fs, path::Path};

use serde::Deserialize;

use crate::{Options, Segment};

#[derive(Deserialize, PartialEq, Debug)]
pub struct Document {
    #[serde(default)]
    pub options: Options,

    pub segments: Vec<Segment>,
}

impl Document {
    pub fn read(path: &Path) -> Self {
        let f = fs::File::open(path).expect("asdfasdf");
        let mut document: Document = serde_yaml::from_reader(f).expect("");

        for segment in &mut document.segments {
            segment.use_subalign = Some(document.options.use_subalign);
            segment.subalign = Some(document.options.subalign);

            segment.wildcard_sections = Some(document.options.wildcard_sections);
        }

        document
    }
}
