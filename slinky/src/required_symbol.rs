/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::{absent_nullable::AbsentNullable, traits::Serial, Settings, SlinkyError};

#[derive(Clone, Debug, Eq, PartialEq, Hash, Ord, PartialOrd)]
pub struct RequiredSymbol {
    /// Name of the symbol
    pub name: String,

    pub include_if_any: Vec<(String, String)>,
    pub include_if_all: Vec<(String, String)>,
    pub exclude_if_any: Vec<(String, String)>,
    pub exclude_if_all: Vec<(String, String)>,
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

    fn unserialize(self, _settings: &Settings) -> Result<Self::Output, SlinkyError> {
        if self.name.is_empty() {
            return Err(SlinkyError::EmptyValue {
                name: "name".to_string(),
            });
        }
        let name = self.name;

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

        Ok(Self::Output {
            name,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        })
    }
}
