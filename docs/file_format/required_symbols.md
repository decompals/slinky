# Required symbols

This entry is used to tell the linker that a symbol should be linked into the
build, even if it isn't refenced in any code.

This behavior is usually used when linking static libraries (`.a`) into the
build, since the default linking behavior for those archives is to only pull
symbols that are refenced on the rest of the build.

Every attribute listed is optional unless explicitly stated.

## Table of contents

- [Required symbols](#required-symbols)
  - [Table of contents](#table-of-contents)
  - [`name`](#name)
    - [Example](#example)
    - [Valid values](#valid-values)
  - [`include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`](#include_if_any-include_if_all-exclude_if_any-and-exclude_if_all)

## `name`

This field is **required**.

The name of the corresponding symbol to be required.

### Example

```yaml
required_symbols:
  - name: guMtxCatL
```

### Valid values

Non empty string.

TODO: Impose rules for valid names?

## `include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`

These fields allow to conditionally include or exclude a given segment depending
on the current [custom options](custom_options.md).

Their syntax is the same as their [`file`](file.md#include_if_any) counterparts.
