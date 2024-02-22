/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

#[derive(Clone, Debug, PartialEq, Eq, Hash, thiserror::Error)]
pub enum SlinkyError {
    #[error("Unable to open file: {description}")]
    FailedFileOpen { description: String },
    #[error("Unable parse yaml: {description}")]
    FailedYamlParsing { description: String },
}
