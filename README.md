# slinky

![Crates.io Version](https://img.shields.io/crates/v/slinky)
![Crates.io Downloads (recent)](https://img.shields.io/crates/dr/slinky)
![Crates.io MSRV](https://img.shields.io/crates/msrv/slinky)
![GitHub](https://img.shields.io/github/license/decompals/slinky)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/decompals/slinky)
![GitHub contributors](https://img.shields.io/github/contributors/decompals/slinky?logo=purple)

splat link yutility

Linker script generator

## Table of contents

- [slinky](#slinky)
  - [Table of contents](#table-of-contents)
  - [What is slinky?](#what-is-slinky)
    - [Why use slinky instead of other linker scripts generators?](#why-use-slinky-instead-of-other-linker-scripts-generators)
  - [Features](#features)
    - [Planned features](#planned-features)
  - [Installing](#installing)
  - [Versioning and changelog](#versioning-and-changelog)

## What is slinky?

slinky is a linker script generator for modern GNU (`ld`) and LLVM (`lld`)
linkers. It aims to be resuable and general enough so it can be used in a
variety of projects

Its main purpose is to generate linker scripts for matching
decompilation projects that use either of those linkers, allowing to still
generate matching binary output but adding extra quality of life features.

### Why use slinky instead of other linker scripts generators?

Other linker script generators are functional and do their job, but can be
rather limited or lack some features due to a number of reasons.

Two notable linker script generators on this context are [`splat`](https://github.com/ethteck/splat)
and `mkldscript` (which lives inside the [OoT decompilation repo](https://github.com/zeldaret/oot/blob/main/tools/mkldscript.c)
and the [MM decompilation repo](https://github.com/zeldaret/mm/blob/main/tools/buildtools/mkldscript.c)).
These two are great at their job but can be a bit annoying to work with when you
use them for their intended matching mindset. For example, `mkldscript` doesn't
have many customization options besides what has been needed to produce matching
builds of the Zelda64 games, it uses a non-standard and non-documented file
format as input to describe the layout of the built ROM, and since it lives
inside the game's repo then other projects using it can get out of date quite
easily. `splat` on the other side is a lot much more customizable and is a
Python library so it can be used by many different projects, but its main
purpose is as a binary splitting tool, meaning its input file describes the
binary blob that's meant to be splitted, making it hard to produce builds with
modified contents (add or remove files, move the memory layout, etc).

slinky aims to provide extra quality of life features on top of the features
that other linker scripts offer, like a better modding support experience or
extra shiftability features not present on other tools.

## Features

- Linker script generation for modern GNU `ld` and LLVM `lld`.
- Reusable library.
  - A CLI is also available.
- Support for conditional including/excluding of file entries.
  - Allows to decide which entries should (or shouldn't) be emitted by slinky.
  - Useful for multiversion support.
- Support for replacement strings in paths.
- Allow specifying multiple "segments" required for N64 games.
  - Support for partial linking, allowing to partially link each individual
    segment, improving build times.
- "Single segment" support.
  - Generated linker script will resemble more a traditional linker script, each
    elf section mapping a normal section.
- Allow specifying custom sections and customizing the order of the sections.
  - Sections can be changed globally and/or per segment.
  - Sections of specific file entries can be changed too.
- [Documented](docs/file_format/) custom file format.
- Multiple alignment options: `SUBALIGN`, align segments start and end, align
  individual sections, etc.
- Generation of Makefile dependency (`.d`) files.
- Emit linker script symbols to allow referencing the individual segments and
  sections from the final built elf.
  - Two customization options for linker symbols, the `splat` format and the
    `Makerom` format.
  - Generation of C header file containing all the generated linker symbols. The
    types of these symbols on this header can be customized too.
- Support for custom list of allowed and denied elf sections.
  - Useful to cherry pick which debugging sections should be allowed.
- Archive (`.a`) libraries support.
  - Support for both listing a library and letting the linker grab any used file
    or to specify which speicific files should be linked by the linker.
- Support splat's "vram classes" for better memory layout management.
- Support emitting custom symbols and requiring some symbols to be defined on
  during linking.
- Support for defining a shiftable `_gp` for small data support.
- Support for defining the entrypoint of the executable.
- Support for defining asserts to ensure the sanity of the build.
- Support emitting `KEEP`s attributes for file entries, allowing for a more
  flexible link time garbage collection.

### Planned features

All the planned features are added to the issue tracker. A full list can be seen
[here](https://github.com/decompals/slinky/issues?q=is%3Aopen+is%3Aissue+label%3A%22planned+feature%22)

## Installing

Prebuilt binaries for the latest version of the CLI are available at the
[releases page on Github](https://github.com/decompals/slinky/releases/latest).

The CLI can also be installed system-wide using Rust's `cargo`.

```bash
cargo install slinky-cli
```

To use the library itself as part of a Rust project then simply add it to your
project with `cargo`.

## Versioning and changelog

This library follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
We try to always keep backwards compatibility, so no breaking changes should
happen until a major release (i.e. jumping from 1.X.X to 2.0.0).

To see what changed on each release check either the [CHANGELOG.md](CHANGELOG.md)
file or check the [releases page on Github](https://github.com/decompals/slinky/releases).
You can also use [this link](https://github.com/decompals/slinky/releases/latest)
to check the latest release.
