#!/bin/bash

# SPDX-FileCopyrightText: © 2024 decompals
# SPDX-License-Identifier: MIT

set -e
set -o pipefail

# This file should be run from the root of the repo

for filepath in tests/test_cases/*.yaml; do
    filename=$(basename -- "$filepath")
    stem="${filename%.*}"
    output=tests/test_cases/$stem.ld
    echo Generating $output
    cargo run --release -- $filepath -o $output
done

for filepath in tests/partial_linking/*.yaml; do
    filename=$(basename -- "$filepath")
    stem="${filename%.*}"
    output=tests/partial_linking/$stem.ld
    echo Generating $output
    cargo run --release -- $filepath -o $output --partial-linking
done
