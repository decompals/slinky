#!/bin/bash

# SPDX-FileCopyrightText: © 2024 decompals
# SPDX-License-Identifier: MIT

set -e
set -o pipefail

# This file should be run from the root of the repo

# Remove generated files in case any path has changed
find tests/ -name '*.ld' -delete
find tests/ -name '*.d' -delete
find tests/ -name '*.h' -delete

for filepath in tests/test_cases/*.yaml; do
    filename=$(basename -- "$filepath")
    stem="${filename%.*}"
    output=tests/test_cases/$stem.ld
    echo Generating $output
    cargo run --release -- $filepath -o $output --omit-version-comment --custom-options version=us -c compiler=modern_gcc
done

for filepath in tests/partial_linking/*.yaml; do
    filename=$(basename -- "$filepath")
    stem="${filename%.*}"
    output=tests/partial_linking/$stem.ld
    echo Generating $output
    cargo run --release -- $filepath -o $output --omit-version-comment --partial-linking -c version=us -c compiler=modern_gcc
done
