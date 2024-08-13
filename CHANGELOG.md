# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

### Changed

- Produce an error if the user specifies an empty conditional
  inclusion/exclusion for any entry.

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

[unreleased]: https://github.com/decompals/slinky/compare/0.2.5...main

[0.2.5]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.4...0.2.5
[0.2.4]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.3...0.2.4
[0.2.3]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.2...0.2.3
[0.2.2]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.1...0.2.2
[0.2.1]: https://github.com/Decompollaborate/spimdisasm/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/decompals/slinky/releases/tag/0.2.0
