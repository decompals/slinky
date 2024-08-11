# Symbols assignments

A "symbol assignment" entry describes extra symbol assignments to define on the
generated linker script.

These are usually used for defining "undefined symbols", but this system also
allows for more complex expressions.

Symbols defined in this way do not have a corresponding elf section assigned to
them, in other words they look like `*ABS*` symbols on the linked elf.

Every attribute listed is optional unless explicitly stated.

## Table of contents

- [Symbols assignments](#symbols-assignments)
  - [Table of contents](#table-of-contents)
  - [`name`](#name)
    - [Example](#example)
    - [Valid values](#valid-values)
  - [`value`](#value)
    - [Example](#example-1)
    - [Valid values](#valid-values-1)
  - [`provide`](#provide)
    - [Valid values](#valid-values-2)
    - [Default value](#default-value)
  - [`hidden`](#hidden)
    - [Valid values](#valid-values-3)
    - [Default value](#default-value-1)
  - [`include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`](#include_if_any-include_if_all-exclude_if_any-and-exclude_if_all)

## `name`

This field is **required**.

The name of the corresponding symbol to be declared.

### Example

```yaml
symbol_assignments:
  - name: osMemSize
    value: 0x80000318
```

### Valid values

Non empty string.

TODO: Impose rules for valid names?

## `value`

This field is **required**.

The value or expression to assign to this symbol.

Usually raw addresses are used as values for a given symbol, but more complex
expressions are allowed too.
See the GNU LD documentation for [Expressions in Linker Scripts](https://sourceware.org/binutils/docs/ld/Expressions.html)
for documentation on what is allowed on those expressions.

### Example

```yaml
symbol_assignments:
  - name: _gp
    value: boot_SCOMMON_START + 0x7FF0
```

### Valid values

Non empty string.

## `provide`

If `provide` is enabled for an entry then this symbol assignment will only be
applied if the given symbol is referenced but is not defined in any object
included in the link.

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

Allows defining the symbol that will be hidden and won't be exported.

On a more technical sense, the binding of the generated symbol on the elf will
be marked as `LOCAL` instead of `GLOBAL.`

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
