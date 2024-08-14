# Asserts

An assert ensures that a given condition is satified by the linking process,
otherwise fail the link.

GNU LD documentation for
[`ASSERT`](https://sourceware.org/binutils/docs/ld/Miscellaneous-Commands.html#index-ASSERT)

Every attribute listed is optional unless explicitly stated.

## Table of contents

- [Asserts](#asserts)
  - [Table of contents](#table-of-contents)
  - [`check`](#check)
    - [Example](#example)
    - [Valid values](#valid-values)
  - [error\_message](#error_message)
    - [Example](#example-1)
    - [Valid values](#valid-values-1)
  - [`include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`](#include_if_any-include_if_all-exclude_if_any-and-exclude_if_all)

## `check`

This field is **required**.

The actual condition to check. If this check evaluates to zero then the linker
exits with an error code and prints [`error_message`](#error_message).

### Example

```yaml
asserts:
  - check: boot_ROM_END <= 0x101000
    error_message: boot segment is larger than 1 MiB
```

### Valid values

Non empty string.

## error_message

The error message to show if [`check`](#check) is not satisfied.

### Example

```yaml
asserts:
  - check: boot_VRAM_END <= 0x80400000
    error_message: VRAM is larger than 4 MiB
    include_if_any: [[ram_size, 4]]
```

### Valid values

Non empty string.

## `include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`

These fields allow to conditionally include or exclude a given segment depending
on the current [custom options](custom_options.md).

Their syntax is the same as their [`file`](file.md#include_if_any) counterparts.
