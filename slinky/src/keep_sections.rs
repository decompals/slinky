/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::collections::HashSet;

use serde::Deserialize;

// use crate::{absent_nullable::AbsentNullable, traits::Serial, Settings, SlinkyError};

#[derive(Clone, Debug, Eq, PartialEq, Deserialize)]
#[serde(deny_unknown_fields)]
#[serde(untagged)]
pub enum KeepSections {
    #[serde(skip)]
    Absent,
    All(bool),
    WhichOnes(HashSet<String>),
}

impl Default for KeepSections {
    fn default() -> Self {
        Self::Absent
    }
}
