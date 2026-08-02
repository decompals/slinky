/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::utils::{traits::Serial, AbsentNullable};
use crate::SlinkyError;

use super::{Predicate, PredicateSerial, Settings};

#[derive(Clone, Debug, Eq, PartialEq, Hash, Ord, PartialOrd)]
#[non_exhaustive]
pub struct AssertEntry {
    pub check: String,
    pub error_message: String,
}

#[derive(Clone, Debug, Eq, PartialEq, Hash, Ord, PartialOrd, Deserialize)]
#[serde(deny_unknown_fields)]
pub(crate) struct AssertEntrySerial {
    pub check: String,
    pub error_message: String,

    #[serde(default)]
    pub include_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub include_if_all: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_all: AbsentNullable<Vec<(String, String)>>,
}

impl Serial for AssertEntrySerial {
    type Output = AssertEntry;

    fn unserialize(self, _settings: &Settings) -> Result<Predicate<Self::Output>, SlinkyError> {
        let Self {
            check,
            error_message,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        } = self;

        if check.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "check".to_string(),
            });
        }

        if error_message.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "error_message".to_string(),
            });
        }

        let out = Self::Output {
            check,
            error_message,
        };
        let predicate = PredicateSerial::new(
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        )
        .unserialize(out)?;

        Ok(predicate)
    }
}
