/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use serde::{Deserialize, Deserializer};

use crate::SlinkyError;

// https://stackoverflow.com/a/44332837/6292472

#[derive(Debug, PartialEq, Default)]
pub(crate) enum AbsentNullable<T> {
    #[default]
    Absent,
    Null,
    Value(T),
}

impl<T> From<Option<T>> for AbsentNullable<T> {
    fn from(opt: Option<T>) -> AbsentNullable<T> {
        match opt {
            Some(v) => AbsentNullable::Value(v),
            None => AbsentNullable::Null,
        }
    }
}

impl<'de, T> Deserialize<'de> for AbsentNullable<T>
where
    T: Deserialize<'de>,
{
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: Deserializer<'de>,
    {
        Option::deserialize(deserializer).map(Into::into)
    }
}

impl<T> AbsentNullable<T> {
    pub fn get_non_null<F>(self, name: &str, default: F) -> Result<T, SlinkyError>
    where
        F: FnOnce() -> T,
    {
        match self {
            AbsentNullable::Absent => Ok(default()),
            AbsentNullable::Null => Err(SlinkyError::NullValueOnNonNull {
                name: name.to_string(),
            }),
            AbsentNullable::Value(v) => Ok(v),
        }
    }

    pub fn get_non_null_no_default(self, name: &str) -> Result<Option<T>, SlinkyError> {
        match self {
            AbsentNullable::Absent => Ok(None),
            AbsentNullable::Null => Err(SlinkyError::NullValueOnNonNull {
                name: name.to_string(),
            }),
            AbsentNullable::Value(v) => Ok(Some(v)),
        }
    }

    pub fn get_optional_nullable<F>(self, _name: &str, default: F) -> Result<Option<T>, SlinkyError>
    where
        F: FnOnce() -> Option<T>,
    {
        match self {
            AbsentNullable::Absent => Ok(default()),
            AbsentNullable::Null => Ok(None),
            AbsentNullable::Value(v) => Ok(Some(v)),
        }
    }

    pub fn get(self, name: &str) -> Result<T, SlinkyError> {
        match self {
            AbsentNullable::Absent | AbsentNullable::Null => {
                Err(SlinkyError::MissingRequiredField {
                    name: name.to_string(),
                })
            }
            AbsentNullable::Value(v) => Ok(v),
        }
    }

    pub fn has_value(self) -> bool {
        match self {
            AbsentNullable::Absent | AbsentNullable::Null => false,
            AbsentNullable::Value(_v) => true,
        }
    }
}
