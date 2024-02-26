/* SPDX-FileCopyrightText: © 2024 decompals */
/* SPDX-License-Identifier: MIT */

pub(crate) fn capitalize(s: &str) -> String {
    // TODO: there must be a better way to Capitalize a string

    if s.is_empty() {
        return "".to_string();
    }

    s.chars().next().expect("").to_uppercase().to_string() + &s[1..]
}
