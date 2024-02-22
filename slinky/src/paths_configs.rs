/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;
use std::path::PathBuf;

#[derive(Deserialize, PartialEq, Debug)]
#[serde(default)]
#[derive(Default)]
pub struct PathsConfigs {
    pub base_path: Option<PathBuf>,
}
