# Segments

This is a list that describes all the segments of the final executable.

The order of the list implies the order on which the segments will be emitted.

By default the `vram` address of a segment is the same as the end address of
the previous segment. This behavior can be changed with certain options.

Every attribute listed is optional unless explicitly stated.

## `name`

This is **required**.

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

## `section_end_align`

Force aligning the end of each section for this segment to the specified value.

If the value is `null` then no alignment will be forced on the end of the
sections of this segment.

This option overrides the global setting, see
[settings.md#section_end_align](settings.md#section_end_align) for more info.

### Example

```yaml
segments:
  - name: main
    section_end_align: null
```

### Valid values

Positive integers or `null`.

### Default value

The value specified for
[settings.md#section_end_align](settings.md#section_end_align)

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
