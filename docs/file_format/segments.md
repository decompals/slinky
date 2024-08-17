# Segments

This is a list that describes all the segments of the final executable.

The order of the list implies the order on which the segments will be emitted.

By default the `vram` address of a segment is the same as the end address of
the previous segment. This behavior can be changed with certain options.

Every attribute listed is optional unless explicitly stated.

## Table of contents

- [Segments](#segments)
  - [Table of contents](#table-of-contents)
  - [`name`](#name)
    - [Example](#example)
    - [Valid values](#valid-values)
  - [`files`](#files)
    - [Example](#example-1)
  - [`fixed_vram`](#fixed_vram)
    - [Example](#example-2)
    - [Valid values](#valid-values-1)
    - [Default value](#default-value)
  - [`fixed_symbol`](#fixed_symbol)
    - [Example](#example-3)
    - [Valid values](#valid-values-2)
    - [Default value](#default-value-1)
  - [`follows_segment`](#follows_segment)
    - [Example](#example-4)
    - [Valid values](#valid-values-3)
    - [Default value](#default-value-2)
  - [`vram_class`](#vram_class)
    - [Example](#example-5)
    - [Valid values](#valid-values-4)
    - [Default value](#default-value-3)
  - [`dir`](#dir)
    - [Example](#example-6)
    - [Valid values](#valid-values-5)
    - [Default value](#default-value-4)
  - [`gp_info`](#gp_info)
    - [Example](#example-7)
  - [`include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`](#include_if_any-include_if_all-exclude_if_any-and-exclude_if_all)
  - [`alloc_sections`](#alloc_sections)
    - [Example](#example-8)
    - [Valid values](#valid-values-6)
    - [Default value](#default-value-5)
  - [`noload_sections`](#noload_sections)
    - [Example](#example-9)
    - [Valid values](#valid-values-7)
    - [Default value](#default-value-6)
  - [`subalign`](#subalign)
    - [Example](#example-10)
    - [Valid values](#valid-values-8)
    - [Default value](#default-value-7)
  - [`segment_start_align`](#segment_start_align)
    - [Example](#example-11)
    - [Valid values](#valid-values-9)
    - [Default value](#default-value-8)
  - [`segment_end_align`](#segment_end_align)
    - [Example](#example-12)
    - [Valid values](#valid-values-10)
    - [Default value](#default-value-9)
  - [`section_start_align`](#section_start_align)
    - [Example](#example-13)
    - [Valid values](#valid-values-11)
    - [Default value](#default-value-10)
  - [`section_end_align`](#section_end_align)
    - [Example](#example-14)
    - [Valid values](#valid-values-12)
    - [Default value](#default-value-11)
  - [`sections_start_alignment`](#sections_start_alignment)
    - [Example](#example-15)
    - [Valid values](#valid-values-13)
    - [Default value](#default-value-12)
  - [`sections_end_alignment`](#sections_end_alignment)
    - [Example](#example-16)
    - [Valid values](#valid-values-14)
    - [Default value](#default-value-13)
  - [`wildcard_sections`](#wildcard_sections)
    - [Example](#example-17)
    - [Valid values](#valid-values-15)
    - [Default value](#default-value-14)
  - [`fill_value`](#fill_value)
    - [Example](#example-18)
    - [Valid values](#valid-values-16)
    - [Default value](#default-value-15)
  - [`sections_subgroups`](#sections_subgroups)
    - [Example](#example-19)
    - [Valid values](#valid-values-17)
    - [Default value](#default-value-16)
  - [`keep_sections`](#keep_sections)
    - [Example](#example-20)
    - [Valid values](#valid-values-18)
    - [Default](#default)

## `name`

This field is **required**.

The name of the corresponding segment.

### Example

```yaml
segments:
  - name: boot
```

### Valid values

Non empty string.

TODO: Impose rules for valid names?

## `files`

This is **required**.

List of files belonging to this segment.

The order of the list implies the order on which the files will be emitted.

To see customization options for each file check the [file.md](file.md)
document.

### Example

```yaml
segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/dmadata.o }
      - { path: asm/util.o }
```

## `fixed_vram`

If used then force putting the segment at the specified address.

It can't be used in combination with [`fixed_symbol`](#fixed_symbol),
[`follows_segment`](#follows_segment) or [`vram_class`](#vram_class).

### Example

```yaml
segments:
  - name: entry
    fixed_vram: 0x80000400
```

### Valid values

Any unsigned integer.

### Default value

`null`

## `fixed_symbol`

If used then force putting the segment at the same address than the address of
the given symbol.

It can't be used in combination with [`fixed_vram`](#fixed_vram),
[`follows_segment`](#follows_segment) or [`vram_class`](#vram_class).

### Example

```yaml
segments:
  - name: enemy_1
    fixed_symbol: gBufferEnemy
```

### Valid values

Non empty string.

### Default value

`null`

## `follows_segment`

If used then force putting the segment after the end of the specified segment.

It can't be used in combination with [`fixed_vram`](#fixed_vram),
[`fixed_symbol`](#fixed_symbol) or [`vram_class`](#vram_class).

### Example

```yaml
segments:
  - name: boot

  - name: kanji

  - name: main
    follows_segment: boot
```

### Valid values

The name of another segment.

### Default value

`null`

## `vram_class`

If used then force putting the segment at address of the given vram class.

See the [`vram_classes`](vram_classes.md) docs for more info.

It can't be used in combination with [`fixed_vram`](#fixed_vram),
[`fixed_symbol`](#fixed_symbol) or [`follows_segment`](#follows_segment).

### Example

```yaml
vram_classes:
  - { name: battle_partner, fixed_vram: 0x80238000 }

segments:
  - name: battle_partner_goompa
    vram_class: battle_partner
```

### Valid values

The name of an existing [`vram_class`](vram_class.md).

### Default value

`null`

## `dir`

Used as a prefix for all the files emitted for this Segment.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: omo2_1
    dir: src/battle/area/omo2_1
    files:
      - { path: actor/shy_squad.o }
```

Emits the `build/src/battle/area/omo2_1/actor/shy_squad.o` file path.

### Valid values

Any valid path.

### Default value

Empty path.

## `gp_info`

Emits a `_gp` symbol for this segment.

For more information about this field see the dedicated
[`gp_info.md`](gp_info.md) document.

### Example

```yaml
segments:
  - name: main
    gp_info:
      section: .sdata
```

## `include_if_any`, `include_if_all`, `exclude_if_any` and `exclude_if_all`

These fields allow to conditionally include or exclude a given segment depending
on the current [custom options](custom_options.md).

Their syntax is the same as their [`file`](file.md#include_if_any) counterparts.

## `alloc_sections`

List of allocatable sections (the ones that take ROM space) for this specific
segment.

The sections from this list will be emitted for each file in the specified
order.

This allows to override the global settings in case a specific segment has
an order different than the global one. See
[settings.md#alloc_sections](settings.md#alloc_sections) for more info.

### Example

```yaml
settings:
  alloc_sections: [.text, .data, .rodata]
```

### Valid values

List of strings.

### Default value

The value specified for [settings.md#alloc_sections](settings.md#alloc_sections)

## `noload_sections`

List of noload sections (the ones that don't take ROM space) for this specific
segment.

The sections from this list will be emitted for each file in the specified
order.

This allows to override the global settings in case a specific segment has
an order different than the global one. See
[settings.md#noload_sections](settings.md#noload_sections) for more info.

### Example

```yaml
settings:
  noload_sections: [.bss]
```

### Valid values

List of strings.

### Default value

The value specified for [settings.md#noload_sections](settings.md#noload_sections)

## `subalign`

The value to use in the `SUBALIGN` directive for this segment.

If `null` is specified then no `SUBALIGN` directive is used for this segment.

If an integer is used then the `SUBALIGN` will be emitted for this segment,
regarding the global setting.

GNU LD docs for `SUBALIGN`: <https://sourceware.org/binutils/docs/ld/Forced-Input-Alignment.html#index-SUBALIGN_0028subsection_005falign_0029>

This option overrides the global setting, see
[settings.md#subalign](settings.md#subalign) for more info.

### Example

```yaml
segments:
  - name: main
    subalign: null
```

### Valid values

Positive integers or `null`.

### Default value

The value specified for [settings.md#subalign](settings.md#subalign)

## `segment_start_align`

Force aligning the beginning of this specific segment to the specified value.

If the value is `null` then no alignment will be forced at the start of this
specific segment.

This option overrides the global setting, see
[settings.md#segment_start_align](settings.md#segment_start_align) for more info.

### Example

```yaml
segments:
  - name: gameplay_keep
    segment_start_align: 0x1000
```

### Valid values

Positive integers or `null`.

### Default value

The value specified for
[settings.md#segment_start_align](settings.md#segment_start_align)

## `segment_end_align`

Force aligning the end of this specific segment to the specified value.

If the value is `null` then no alignment will be forced at the end of this
specific segment.

This option overrides the global setting, see
[settings.md#segment_end_align](settings.md#segment_end_align) for more info.

### Example

```yaml
segments:
  - name: test
    segment_end_align: 0x800
```

### Valid values

Positive integers or `null`.

### Default value

The value specified for
[settings.md#segment_end_align](settings.md#segment_end_align)

## `section_start_align`

Force aligning the start of each section for this segment to the specified value.

If the value is `null` then no alignment will be forced on the start of the
sections of this segment.

Note that this field and [`sections_start_alignment`](#sections_start_alignment)
does not override each other, meaning that if this field is non-`null` and a
section is specified in [`sections_start_alignment`](#sections_start_alignment)
then both alignments will be applied to given section.

This option overrides the global setting, see
[settings.md#section_start_align](settings.md#section_start_align) for more info.

### Example

```yaml
segments:
  - name: main
    section_start_align: 0x20
```

### Valid values

Positive integers or `null`.

### Default value

The value specified for
[settings.md#section_start_align](settings.md#section_start_align)

## `section_end_align`

Force aligning the end of each section for this segment to the specified value.

If the value is `null` then no alignment will be forced on the end of the
sections of this segment.

Note that this field and [`sections_end_alignment`](#sections_end_alignment)
does not override each other, meaning that if this field is non-`null` and a
section is specified in [`sections_end_alignment`](#sections_end_alignment)
then both alignments will be applied to given section.

This option overrides the global setting, see
[settings.md#section_end_align](settings.md#section_end_align) for more info.

### Example

```yaml
segments:
  - name: main
    section_end_align: 0x10
```

### Valid values

Positive integers or `null`.

### Default value

The value specified for
[settings.md#section_end_align](settings.md#section_end_align)

## `sections_start_alignment`

Allows to specify different alignment values for the start of each section of
this specific segment.

If a specific section is not pressent on this mapping then no alignment will be
forced on the given section.

This option overrides the global setting, see
[settings.md#sections_start_alignment](settings.md#sections_start_alignment) for
more info.

### Example

```yaml
segments:
  - name: main
    sections_start_alignment: { .text: 4, .rodata: 0x10, .data: 0x20 }
```

### Valid values

A mapping of strings as keys and positive numbers as values.

### Default value

The value specified for
[settings.md#sections_start_alignment](settings.md#sections_start_alignment)

## `sections_end_alignment`

Allows to specify different alignment values for the end of each section of this
specific segment.

If a specific section is not pressent on this mapping then no alignment will be
forced on the given section.

Note that this field and [`section_start_align`](#section_start_align) does not
override each other, meaning that if a section is specified in this field and
[`section_start_align`](#section_start_align) is non-`null` then both alignments
will be applied to the section.

This option overrides the global setting, see
[settings.md#sections_end_alignment](settings.md#sections_end_alignment) for
more info.

### Example

```yaml
segments:
  - name: main
    sections_end_alignment: { .text: 4, .rodata: 0x10, .data: 0x20 }
```

### Valid values

A mapping of strings as keys and positive numbers as values.

### Default value

The value specified for
[settings.md#sections_end_alignment](settings.md#sections_end_alignment)

## `wildcard_sections`

Toggles using wildcards (`*`) as suffix in the emitted sections for this
segment.

For example the `.rodata` section would be emitted as `.rodata*` if this option
is enabled.

This option overrides the global setting, see
[settings.md#wildcard_sections](settings.md#wildcard_sections) for more info.

### Example

```yaml
segments:
  - name: main
    wildcard_sections: False
```

### Valid values

Boolean

### Default value

The value specified for [settings.md#wildcard_sections](settings.md#wildcard_sections)

## `fill_value`

Allows to specify the value of the `FILL` statement emitted for this segment.

If the value is `null` then no `FILL` statements will be emitted for this
specific segment.

GNU LD docs for `FILL`: <https://sourceware.org/binutils/docs/ld/Output-Section-Data.html#index-FILL_0028expression_0029>

This option overrides the global setting, see
[settings.md#fill_value](settings.md#fill_value) for more info.

### Example

```yaml
settings:
  fill_value: null
```

Which emits the following `FILL` statement:

```ld
FILL(0x00000A1F);
```

### Valid values

Positive integers or `null`.

### Default value

The value specified for [settings.md#fill_value](settings.md#fill_value)

## `sections_subgroups`

Allows to specify one or multiple sections that should be emitted alongside
another section for each file, instead of getting their own "proper" section.

This setting overrides the global option set on the `settings`. See the
corresponding [`sections_subgroups`](settings.md#sections_subgroups)
documentation for more information.

### Example

```yaml
segments:
  - name: boot
    sections_subgroups: { .text: [.init, .fini] }
    files:
      - { path: boot_main.o }
      - { path: utils.o }
```

The above example produces output like the following (stripped a bit for
demostrative reasons):

```ld
        /* -- SNIP -- */

        boot_TEXT_START = .;
        boot_main.o(.text*);
        boot_main.o(.init*);
        boot_main.o(.fini*);
        utils.o(.text*);
        utils.o(.init*);
        utils.o(.fini*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        /* -- SNIP -- */
```

Note how `.init` and `.fini` sections are emitted alongside the `.text` sections
and they are emitted within the `TEXT` group.

### Valid values

A mapping of sections (strings) as keys and a list of sections (strings) as
values.

### Default value

Empty mapping.

## `keep_sections`

Wraps the file entries from this current segment with `KEEP` attributes.

`KEEP` is only relevant when link time garbage collection is enabled (the
[`--gc-sections`](https://sourceware.org/binutils/docs/ld/Options.html#index-garbage-collection)
flag of GNU LD), since wrapping a section with a `KEEP` attribute tells the
linker that this section should not be garbage collected, even if none of the
symbols on that section is referenced by anything else that is actually used.

If link time garbage collection is enabled then it is recommended to set the
entrypoint of this program by setting the slinky top-level attribute `entry`.

The `keep_sections` attribute allow specify if _all_ the input sections (say
`.text`, `.data`, etc) of a given file entry should be wrapped by `KEEP` or not.
Alternatively a list of strings may be provided instead to specify which
specific sections should be wrapped with `KEEP`, allowing for a more fine
grained customization of this behavior.

Every file entry of the current segment will inherit its `keep_sections`
attribute, propagating this setting to all those file entries and allowing the
user to avoid unnecessary duplication. This setting may be overriden for
specific file entries of this segment. See specifying a
[`keep_sections` attribute on the `file` document](file.md#keep_sections)
for more information.

If no `keep_sections` is specified for the current segment, then the
`keep_section` of the corresponding [`vram class`](#vram_class) referenced by
this segment will be inherited automatically if any vram class was specified
for this segment.

GNU LD documentation for
[`KEEP`](https://sourceware.org/binutils/docs/ld/Input-Section-Keep.html#index-KEEP).

### Example

```yaml
segments:
  - name: boot
    keep_sections: [.data, .text]
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/util.o, keep_sections: [.text, .rodata] }

  - name: assets1
    keep_sections: True
    files:
      - { path: src/assets/texture.o }
      - { path: src/assets/dlist.o }
```

In the above example the `boot` segment says that the `.text` and `.data`
sections of the files within itself should be wrapped in `KEEP`s, which will be
true for the `boot_main.o` file. But for `util.o` the `.text` and `.rodata`
sections will be `KEEP`'d, not the `.data` section, completely overriding the
attribute set at the segment level.

The `assets1` segment sets every section of every of its files to be `KEEP`'d.

### Valid values

Either a boolean or a list of sections (list of strings).

### Default

The [`keep_sections` attribute of the corresponding `vram class`](vram_classes.md#keep_sections)
or `False` if this segment references no vram class.
