/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::collections::HashSet;

use serde::Deserialize;

#[derive(Debug, Clone, PartialEq, Eq, Default, Deserialize)]
#[serde(deny_unknown_fields)]
#[serde(untagged)]
#[non_exhaustive]
pub enum KeepSections {
    #[default]
    #[serde(skip)]
    Absent,
    All(bool),
    WhichOnes(HashSet<String>),
}
