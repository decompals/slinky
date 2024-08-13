/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::{absent_nullable::AbsentNullable, traits::Serial, Settings, SlinkyError};

#[derive(Clone, Debug, Eq, PartialEq, Hash, Ord, PartialOrd)]
pub struct GpInfo {
    // The relative section to emit the `_gp` symbol
    pub section: String,
    // An offset into the small data section, used to maximize the range of small data.
    pub offset: i32,

    /// Signals if the `_gp` symbol should be wrapped in a `PROVIDE` statement.
    /// Can be used with `hidden`.
    pub provide: bool,
    /// Signals if the `_gp` symbol should be wrapped in a `HIDDEN` statement.
    /// Can be used with `provide`.
    pub hidden: bool,

    pub include_if_any: Vec<(String, String)>,
    pub include_if_all: Vec<(String, String)>,
    pub exclude_if_any: Vec<(String, String)>,
    pub exclude_if_all: Vec<(String, String)>,
}

fn gp_info_default_section() -> String {
    ".sdata".to_string()
}

const fn gp_info_default_offset() -> i32 {
    0x7FF0
}

const fn gp_info_default_provide() -> bool {
    false
}

const fn gp_info_default_hidden() -> bool {
    false
}

#[derive(Deserialize, PartialEq, Debug)]
#[serde(deny_unknown_fields)]
pub(crate) struct GpInfoSerial {
    #[serde(default)]
    pub section: AbsentNullable<String>,
    #[serde(default)]
    pub offset: AbsentNullable<i32>,

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

impl Serial for GpInfoSerial {
    type Output = GpInfo;

    fn unserialize(self, _settings: &Settings) -> Result<Self::Output, SlinkyError> {
        let section = {
            let s = self
                .section
                .get_non_null("section", gp_info_default_section)?;
            if s.is_empty() {
                return Err(SlinkyError::EmptyValue {
                    name: "section".to_string(),
                });
            }
            s
        };

        let offset = self.offset.get_non_null("offset", gp_info_default_offset)?;

        let provide = self
            .provide
            .get_non_null("provide", gp_info_default_provide)?;
        let hidden = self.hidden.get_non_null("hidden", gp_info_default_hidden)?;

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
            section,
            offset,
            provide,
            hidden,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        })
    }
}
