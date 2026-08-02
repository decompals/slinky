/* SPDX-FileCopyrightText: © 2024-2026 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::utils::{traits::Serial, AbsentNullable};
use crate::SlinkyError;

use super::{Predicate, PredicateSerial, Settings};

#[derive(Debug, Clone, PartialEq)]
#[non_exhaustive]
pub struct SymbolAssignment {
    /// Name of the symbol
    pub name: String,

    /// Value or expression to assign to this symbol
    pub value: String,

    /// Signals if this assignment should be wrapped in a `PROVIDE` statement.
    /// Can be used with `hidden`.
    pub provide: bool,
    /// Signals if this assignment should be wrapped in a `HIDDEN` statement.
    /// Can be used with `provide`.
    pub hidden: bool,
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct SymbolAssignmentSerial {
    pub name: String,
    pub value: String,

    #[serde(default)]
    pub provide: AbsentNullable<bool>,
    #[serde(default)]
    pub hidden: AbsentNullable<bool>,

    #[serde(default)]
    pub include_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub include_if_all: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    pub exclude_if_all: AbsentNullable<Vec<(String, String)>>,
}

impl Serial for SymbolAssignmentSerial {
    type Output = SymbolAssignment;

    fn unserialize(self, _settings: &Settings) -> Result<Predicate<Self::Output>, SlinkyError> {
        let Self {
            name,
            value,
            provide,
            hidden,
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

        if value.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "value".to_string(),
            });
        }

        let provide = provide.get_non_null("provide", || false)?;
        let hidden = hidden.get_non_null("hidden", || false)?;

        let out = Self::Output {
            name,
            value,
            provide,
            hidden,
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
