/* SPDX-FileCopyrightText: © 2026 decompals */
/* SPDX-License-Identifier: MIT */

use serde::Deserialize;

use crate::utils::AbsentNullable;
use crate::{RuntimeSettings, SlinkyError};

#[derive(Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash)]
#[non_exhaustive]
#[must_use]
pub struct Predicate<T> {
    pub(super) value: T,

    pub include_if_any: Vec<(String, String)>,
    pub include_if_all: Vec<(String, String)>,
    pub exclude_if_any: Vec<(String, String)>,
    pub exclude_if_all: Vec<(String, String)>,
}

impl<T> Predicate<T> {
    #[must_use]
    pub fn get(&self, rs: &RuntimeSettings) -> Option<&T> {
        if self.should_emit_entry(rs) {
            Some(&self.value)
        } else {
            None
        }
    }

    pub(crate) fn should_emit_entry(&self, rs: &RuntimeSettings) -> bool {
        let custom_options = rs.custom_options();

        if self
            .exclude_if_any
            .iter()
            .any(|(key, value)| custom_options.get(key) == Some(value))
        {
            return false;
        }

        if !self.exclude_if_all.is_empty()
            && self
                .exclude_if_all
                .iter()
                .all(|(key, value)| custom_options.get(key) == Some(value))
        {
            return false;
        }

        if !self.include_if_any.is_empty() || !self.include_if_all.is_empty() {
            // If neither include fields match the options then we do not emit this entry

            let mut exit = false;
            if !self.include_if_any.is_empty() {
                exit = !self
                    .include_if_any
                    .iter()
                    .any(|(key, value)| custom_options.get(key) == Some(value));
            }
            if (exit || self.include_if_any.is_empty()) && !self.include_if_all.is_empty() {
                exit = !self
                    .include_if_all
                    .iter()
                    .all(|(key, value)| custom_options.get(key) == Some(value));
            }
            if exit {
                return false;
            }
        }

        true
    }

    pub(crate) fn new_no_conditions(value: T) -> Self {
        Self {
            value,
            include_if_any: Vec::new(),
            include_if_all: Vec::new(),
            exclude_if_any: Vec::new(),
            exclude_if_all: Vec::new(),
        }
    }
}

#[derive(Debug, PartialEq, Deserialize)]
#[serde(deny_unknown_fields)]
pub(crate) struct PredicateSerial {
    #[serde(default)]
    include_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    include_if_all: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    exclude_if_any: AbsentNullable<Vec<(String, String)>>,
    #[serde(default)]
    exclude_if_all: AbsentNullable<Vec<(String, String)>>,
}

impl PredicateSerial {
    pub(crate) fn new(
        include_if_any: AbsentNullable<Vec<(String, String)>>,
        include_if_all: AbsentNullable<Vec<(String, String)>>,
        exclude_if_any: AbsentNullable<Vec<(String, String)>>,
        exclude_if_all: AbsentNullable<Vec<(String, String)>>,
    ) -> Self {
        Self {
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        }
    }

    pub(crate) fn unserialize<T>(self, value: T) -> Result<Predicate<T>, SlinkyError> {
        let Self {
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        } = self;

        let include_if_any = include_if_any.get_non_null_not_empty("include_if_any", Vec::new)?;
        let include_if_all = include_if_all.get_non_null_not_empty("include_if_all", Vec::new)?;
        let exclude_if_any = exclude_if_any.get_non_null_not_empty("exclude_if_any", Vec::new)?;
        let exclude_if_all = exclude_if_all.get_non_null_not_empty("exclude_if_all", Vec::new)?;

        Ok(Predicate {
            value,
            include_if_any,
            include_if_all,
            exclude_if_any,
            exclude_if_all,
        })
    }
}
