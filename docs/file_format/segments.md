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

String.

TODO: Impose rules for valid names?

## `files`

This is **required**.

List of files belonging to this segment.

The order of the list implies the order on which the files will be emitted.

To see customization options for each file check the [files.md](files.md)
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

## `use_subalign`

Toggle using the `SUBALIGN` directive on this segment.

This option overrides the global setting, see
[settings.md#use_subalign](settings.md#use_subalign) for more info.

### Example

```yaml
segments:
  - name: boot
    use_subalign: False
```

### Valid values

Boolean

### Default value

The value specified for [settings.md#use_subalign](settings.md#use_subalign)

## `subalign`

The value to use in the `SUBALIGN` directive for this segment.

The [`use_subalign`](#use_subalign) option controls if this directive is
emitted or not.

This option overrides the global setting, see
[settings.md#subalign](settings.md#subalign) for more info.

### Example

```yaml
segments:
  - name: main
    subalign: 4
```

### Valid values

Positive integers

### Default value

The value specified for [settings.md#subalign](settings.md#subalign)

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
