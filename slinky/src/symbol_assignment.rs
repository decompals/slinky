/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::{absent_nullable::AbsentNullable, Settings, SlinkyError};

#[derive(PartialEq, Debug, Clone)]
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

    pub include_if_any: Vec<(String, String)>,
    pub include_if_all: Vec<(String, String)>,
    pub exclude_if_any: Vec<(String, String)>,
    pub exclude_if_all: Vec<(String, String)>,
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

impl SymbolAssignmentSerial {
    pub fn unserialize(self, _settings: &Settings) -> Result<SymbolAssignment, SlinkyError> {
        if self.name.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "name".to_string(),
            });
        }
        let name = self.name;

        if self.value.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "value".to_string(),
            });
        }
        let value = self.value;

        let provide = self.provide.get_non_null("provide", || false)?;
        let hidden = self.hidden.get_non_null("hidden", || false)?;

        let include_if_any = self
            .include_if_any
            .get_non_null_not_empty("include_if_any", Vec::new)?;
        let include_if_all = self
            .include_if_all
            .get_non_null_not_empty("include_if_all", Vec::new)?;
        let exclude_if_any = self
            .exclude_if_any
            .get_non_null_not_empty("exclude_if_any", Vec::new)?;
        let exclude_if_all = self
            .exclude_if_all
            .get_non_null_not_empty("exclude_if_all", Vec::new)?;

        Ok(SymbolAssignment {
            name,
            value,
            provide,
            hidden,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        })
    }
}
