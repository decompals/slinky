#!/bin/bash

# SPDX-FileCopyrightText: © 2024 decompals
# SPDX-License-Identifier: MIT

set -e
set -o pipefail

# This file should be run from the root of the repo

for filepath in tests/input_files/*.yaml; do
    filename=$(basename -- "$filepath")
    stem="${filename%.*}"
    output=tests/linker_scripts/$stem.ld
    echo Generating $output
    cargo run -- $filepath -o $output
    #for ((i=0; i<=3; i++)); do
    #    ./MyProgram.exe "$filename" "Logs/$(basename "$filename" .txt)_Log$i.txt"
    #done
done
