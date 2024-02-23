/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

#[derive(Clone, Debug, PartialEq, Eq, Hash, thiserror::Error)]
pub enum SlinkyError {
    #[error("Unable to open file: {description}")]
    FailedFileOpen { description: String },
    #[error("Unable parse yaml: {description}")]
    FailedYamlParsing { description: String },
    #[error("Non-nullable attribute '{name}' was null")]
    NullValueOnNonNull { name: String },
    #[error("The attribute '{name}' should not be empty")]
    EmptyValue { name: String },
}
