/* SPDX-FileCopyrightText: © 2025 decompals */
/* SPDX-License-Identifier: MIT */

use std::collections::HashSet;

use serde::Deserialize;

// use crate::{absent_nullable::AbsentNullable, traits::Serial, Settings, SlinkyError};

#[derive(Clone, Debug, Eq, PartialEq, Deserialize)]
#[serde(deny_unknown_fields)]
#[serde(untagged)]
#[derive(Default)]
pub enum KeepSections {
    #[serde(skip)]
    #[default]
    Absent,
    All(bool),
    WhichOnes(HashSet<String>),
}
