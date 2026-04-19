/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use std::collections::HashSet;

use serde::Deserialize;

// use crate::{absent_nullable::AbsentNullable, traits::Serial, Settings, SlinkyError};

#[derive(Debug, Clone, PartialEq, Eq, Default, Deserialize)]
#[serde(deny_unknown_fields)]
#[serde(untagged)]
pub enum KeepSections {
    #[default]
    #[serde(skip)]
    Absent,
    All(bool),
    WhichOnes(HashSet<String>),
}
