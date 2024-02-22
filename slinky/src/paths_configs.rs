/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::path::PathBuf;

#[derive(Deserialize, PartialEq, Debug)]
#[serde(default)]
pub struct PathsConfigs {
    pub base_path: Option<PathBuf>,
}

impl Default for PathsConfigs {
    fn default() -> Self {
        Self { base_path: None }
    }
}
