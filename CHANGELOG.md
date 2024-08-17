# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2024-08-17

### Added

- Add new top-level attribute for the file format: `symbol_assignments`.
  - Allows to define symbols directly on the generated linker script.
  - Symbols created this way can be defined with raw addresses, reference other
    symbols or more complex expressions.
  - These generated symbols do not have a corresponding section (defined as
    `ABS` symbols on the elf).
  - If a symbol assignment is emitted or not can be controlled with the same
    conditional inclussion/exclussion mechanism used by the custom options.
  - These definitions can be wrapped in `PROVIDE`, `HIDDEN` or `PROVIDE_HIDDEN`.
- Add new top-level attribute for the file format: `required_symbols`.
  - Allows to specify a list of symbols that should be forced to be linked into
    the build, even if they are not refenced by any other linked code.
  - Useful for making sure a symbol from an static library is being linked.
  - If a symbol assignment is emitted or not can be controlled with the same
    conditional inclussion/exclussion mechanism used by the custom options.
- Add way to define a non hardcoded `_gp` symbol for a given segment.
  - Used by defining the `gp_info` field on a segment.
  - Can't be combined with the global `hardcoded_gp_value`.
- Add new top-level attribute for the file format: `entry`.
  - Specifies the entrypoint for the build.
- Add new top-level attribute for the file format: `asserts`.
  - Allows to define multiple assertions that should be satisfied for the link
    to success.
- New `keep_sections` attribute for `vram_classes`, `segments` and `files`.
  - Allows to specify which sections of a files should be `KEEP` during link
    time garbage collection, even of those are not referenced at al by anything
    else.
  - Allows to configure for everything referencing a given vram class or as
    fine grained as a single file entry.
- New `sections_subgroups` attribute for `settings` and `segments`.
  - Allows to specify one or multiple sections that should be emitted alongside
    another section for each file, instead of getting their own "proper"
    section.

### Changed

- Produce an error if the user specifies an empty conditional
  inclusion/exclusion for any entry.
- Make sure all platforms use forward slashes when emitting file paths.
- Tests now strip the `\r` character from the expected files before compaing
  them.
  - This is done to normalize the tests files accross all platforms, including
    the ones where git may add `\r` characters when cloning the repository
    (like Windows).
- Github Actions:
  - Change CI to run tests on all platforms we generate builds artifacts for.
  - Use the ARM Mac Github runner to build and test the ARM Mac builds.
  - Merge `run_tests` and `release` jobs to try to improve CI times.

## [0.2.5] - 2024-07-17

### Fixed

- Fix partial linking related paths not being properly escaped.
- Fix `partial_build_segments_folder` not being properly prefixed on some places.
- Fix `section_order` not being applied to files inside of `group`s.
- Avoid generating sub-scripts of conditionally excluded segments during partial
  linking scripts generation.

## [0.2.4] - 2024-07-15

### Fixed

- Fix crate version not updated.

## [0.2.3] - 2024-07-15 [YANKED]

### Fixed

- Fix CI not uploading build artifacts to Github release.
- Fix README badge.

## [0.2.2] - 2024-07-15

### Fixed

- Fix release.

## [0.2.1] - 2024-07-15 [YANKED]

### Fixed

- Fix MSRV.

## [0.2.0] - 2024-07-15 [YANKED]

### Added

- Initial release.

[unreleased]: https://github.com/decompals/slinky/compare/0.3.0...main

[0.3.0]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.5...0.3.0
[0.2.5]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.4...0.2.5
[0.2.4]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.3...0.2.4
[0.2.3]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.2...0.2.3
[0.2.2]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.1...0.2.2
[0.2.1]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/decompals/slinky/releases/tag/0.2.0
