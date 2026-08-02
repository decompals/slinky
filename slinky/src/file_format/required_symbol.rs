/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::utils::{traits::Serial, AbsentNullable};
use crate::SlinkyError;

use super::{Predicate, PredicateSerial, Settings};

#[derive(Clone, Debug, Eq, PartialEq, Hash, Ord, PartialOrd)]
#[non_exhaustive]
pub struct RequiredSymbol {
    /// Name of the symbol
    pub name: String,
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct RequiredSymbolSerial {
    pub name: String,

    #[serde(default)]
    pub include_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub include_if_all: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_all: AbsentNullable<Vec<(String, String)>>,
}

impl Serial for RequiredSymbolSerial {
    type Output = RequiredSymbol;

    fn unserialize(self, _settings: &Settings) -> Result<Predicate<Self::Output>, SlinkyError> {
        let Self {
            name,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        } = self;

        if name.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "name".to_string(),
            });
        }

        let out = Self::Output { name };
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
