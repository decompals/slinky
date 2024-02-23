# Settings

The top-level `settings` attribute specifies many options to customize the
generated linker script. Note that many of these options can be customized per
segment too.

All the settings are optional. Unspecified options will use the default value
for it. Note that using certain settings may require specifying other options
as well.

## `base_path`

All the emitted paths are relative to this path. Useful when all the files are
relative to the same path, like a `build` folder.

### Example

```yaml
settings:
  base_path: build/us
```

### Valid values

Any valid path.

### Default value

Defaults to empty path.

## `linker_symbols_style`

The styling used for the automatically generated linker symbols.

These symbols correspond to the vram and rom address of the segments and the
vram address of the sections of the corresponding segment.

To be precise, symbols are generated for the following:

- Segment's rom start and end.
- Segment's vram start and end.
- Section's vram start, end and size.

### Example

```yaml
settings:
  linker_symbols_style: makerom
```

### Valid values

- `splat`: Produces SCREAMING_CASE symbols. Given a segment named `boot`:
  - Segment rom: `boot_ROM_START` and `boot_ROM_END`.
  - Segment vram: `boot_VRAM` and `boot_VRAM_END`.
  - Section vram (not limited to the foloowing examples):
    - `.text`: `boot_text_START`, `boot_text_END` and `boot_text_SIZE`.
    - `.data`: `boot_data_START`, `boot_data_END` and `boot_data_SIZE`.
    - `.bss`: `boot_bss_START`, `boot_bss_END` and `boot_bss_SIZE`.

- `makerom`: Produces _camelCase symbols. Given a segment named `boot`:
  - Segment rom: `_bootSegmentRomStart` and `_bootSegmentRomEnd`.
  - Segment vram: `_bootSegmentStart` and `_bootSegmentEnd`.
  - Section vram (not limited to the foloowing examples):
    - `.text`: `_bootSegmentTextStart`, `_bootSegmentTextEnd` and `_bootSegmentTextSize`.
    - `.data`: `_bootSegmentDataStart`, `_bootSegmentDataEnd` and `_bootSegmentDataSize`.
    - `.bss`: `_bootSegmentBssStart`, `_bootSegmentBssEnd` and `_bootSegmentBssSize`.

### Default value

`splat`

## `alloc_sections`

List of allocatable sections (the ones that take ROM space).

The sections from this list will be emitted for each file in the specified
order.

This option can be overriden per segment, see
[segments.md#alloc_sections](segments.md#alloc_sections) for more info.

### Example

```yaml
settings:
  alloc_sections: `[.rodata, .text, .data]`
```

### Valid values

List of strings.

### Default value

`[.text, .data, .rodata, .sdata]`

## `noload_sections`

List of noload sections (the ones that don't take ROM space).

The sections from this list will be emitted for each file in the specified
order.

This option can be overriden per segment, see
[segments.md#noload_sections](segments.md#noload_sections) for more info.

### Example

```yaml
settings:
  alloc_sections: `[.bss]`
```

### Valid values

List of strings.

### Default value

`[.sbss, .scommon, .bss, COMMON]`

## `use_subalign`

Toggle using `SUBALIGN` directives on the segments.

This option can be overriden per segment, see
[segments.md#use_subalign](segments.md#use_subalign) for more info.

### Example

```yaml
settings:
  use_subalign: False
```

### Valid values

Boolean

### Default value

`True`

## `subalign`

The value to use in the `SUBALIGN` directives.

The [`use_subalign`](#use_subalign) option controls if this directive is
emitted or not.

This option can be overriden per segment, see
[segments.md#subalign](segments.md#subalign) for more info.

### Example

```yaml
settings:
  subalign: 4
```

### Valid values

Positive integers

### Default value

`16`

## `wildcard_sections`

Toggles using wildcards (`*`) as suffix in the emitted sections.

For example the `.rodata` section would be emitted as `.rodata*` if this option
is enabled.

This option can be overriden per segment, see
[segments.md#wildcard_sections](segments.md#wildcard_sections) for more info.

### Example

```yaml
settings:
  wildcard_sections: False
```

### Valid values

Boolean

### Default value

`True`
