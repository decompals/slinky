/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

use std::path::PathBuf;

#[derive(Clone, Debug, PartialEq, Eq, Hash, thiserror::Error)]
pub enum SlinkyError {
    #[error("Unable to open file '{path}', because '{description}'")]
    FailedFileOpen { path: PathBuf, description: String },

    #[error("Fail while writing to file '{path}', because '{description}'.\n Contents were: '{contents}'")]
    FailedFileWrite {
        path: PathBuf,
        description: String,
        contents: String,
    },

    #[error("Unable to create dir '{path}', because '{description}")]
    FailedDirCreate { path: PathBuf, description: String },

    #[error("Unable parse yaml: {description}")]
    FailedYamlParsing { description: String },

    #[error("Non-nullable attribute '{name}' was null")]
    NullValueOnNonNull { name: String },

    #[error("The attribute '{name}' should not be empty")]
    EmptyValue { name: String },

    #[error("Field '{field1}' can't be combined with '{field2}'")]
    InvalidFieldCombo { field1: String, field2: String },

    #[error("Field '{name}' is required")]
    MissingRequiredField { name: String },

    #[error("Field '{required}' is required if field '{other}' is given")]
    MissingRequiredFieldCombo { required: String, other: String },

    #[error("At least one of the following options should be provided: {fields}")]
    MissingAnyOfOptionalFields { fields: String },
}
