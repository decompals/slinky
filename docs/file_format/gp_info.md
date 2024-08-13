# Gp info


Every attribute listed is optional unless explicitly stated.

## Table of contents

- [Gp info](#gp-info)
  - [Table of contents](#table-of-contents)
  - [`section`](#section)
    - [Example](#example)
    - [Valid values](#valid-values)
    - [Default value](#default-value)
  - [`offset`](#offset)
    - [Example](#example-1)
    - [Valid values](#valid-values-1)
    - [Default value](#default-value-1)
  - [`provide`](#provide)
    - [Valid values](#valid-values-2)
    - [Default value](#default-value-2)
  - [`hidden`](#hidden)
    - [Valid values](#valid-values-3)
    - [Default value](#default-value-3)
  - [`include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`](#include_if_any-include_if_all-exclude_if_any-and-exclude_if_all)

## `section`

The `_gp` symbol will be emitted just before this section.

### Example

```yaml
segments:
  - name: main
    gp_info:
      section: .sdata
```

### Valid values

Non-empty string.

### Default value

`.sdata`

## `offset`

An offset into the the section, allowing the `_gp` value to not point to the
start of the section, maximizing the available accessable range using the `$gp`
register.

### Example

```yaml
segments:
  - name: main
    gp_info:
      offset: 0x8000
```

### Valid values

Integers.

### Default value

`0x7FF0`

## `provide`

If `provide` is enabled then the `_gp` symbol will only be set if it is
referenced by any linked code but is not defined in any object included in the
link.

See GNU LD documentation for
[`PROVIDE`](https://sourceware.org/binutils/docs/ld/PROVIDE.html).

This option can be combined with [`hidden`](#hidden). For more info see the GNU
LD documentation for
[`PROVIDE_HIDDEN`](https://sourceware.org/binutils/docs/ld/PROVIDE_005fHIDDEN.html).

### Valid values

Bool.

### Default value

`False`

## `hidden`

Allows defining the `_gp` symbol to be hidden and won't be exported.

On a more technical sense, the binding of the generated symbol on the elf will
be marked as `LOCAL` instead of `GLOBAL`.

See GNU LD documentation for
[`HIDDEN`](https://sourceware.org/binutils/docs/ld/HIDDEN.html).

This option can be combined with [`provide`](#provide). For more info see the
GNU LD documentation for
[`PROVIDE_HIDDEN`](https://sourceware.org/binutils/docs/ld/PROVIDE_005fHIDDEN.html).

### Valid values

Bool.

### Default value

`False`

## `include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`

These fields allow to conditionally include or exclude a given segment depending
on the current [custom options](custom_options.md).

Their syntax is the same as their [`file`](file.md#include_if_any) counterparts.
