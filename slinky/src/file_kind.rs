/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

#[derive(Deserialize, PartialEq, Debug)]
pub enum FileKind {
    Object,
    Archive,
}
