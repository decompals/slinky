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

- Segment's rom start, end and size.
- Segment's vram start, end and size.
- Segment's allocatable vram start, end and size.
- Segment's noload vram start, end and size.
- Section's vram start, end and size.

### Example

```yaml
settings:
  linker_symbols_style: makerom
```

### Valid values

- `splat`: Produces SCREAMING_CASE symbols. Given a segment named `boot`:
  - Segment rom: `boot_ROM_START`, `boot_ROM_END` and `boot_ROM_SIZE`.
  - Segment vram: `boot_VRAM`, `boot_VRAM_END` and `boot_VRAM_SIZE`.
  - Segment allocatable: `boot_alloc_VRAM`, `boot_alloc_VRAM_END` and `boot_alloc_VRAM_SIZE`.
  - Segment noload: `boot_noload_VRAM`, `boot_noload_VRAM_END` and `boot_noload_VRAM_SIZE`.
  - Section vram (not limited to the foloowing examples):
    - `.text`: `boot_TEXT_START`, `boot_TEXT_END` and `boot_TEXT_SIZE`.
    - `.data`: `boot_DATA_START`, `boot_DATA_END` and `boot_DATA_SIZE`.
    - `.bss`: `boot_BSS_START`, `boot_BSS_END` and `boot_BSS_SIZE`.
  - File [`linker_offset_name`](file.md#linker_offset_name): `{name}_OFFSET`

- `makerom`: Produces _camelCase symbols. Given a segment named `boot`:
  - Segment rom: `_bootSegmentRomStart`, `_bootSegmentRomEnd` and `_bootSegmentRomSize`.
  - Segment vram: `_bootSegmentStart`, `_bootSegmentEnd` and `_bootSegmentSize`.
  - Section vram (not limited to the foloowing examples):
    - `.text`: `_bootSegmentTextStart`, `_bootSegmentTextEnd` and `_bootSegmentTextSize`.
    - `.data`: `_bootSegmentDataStart`, `_bootSegmentDataEnd` and `_bootSegmentDataSize`.
    - `.bss`: `_bootSegmentBssStart`, `_bootSegmentBssEnd` and `_bootSegmentBssSize`.
  - File [`linker_offset_name`](file.md#linker_offset_name): `_{name}Offset`

### Default value

`splat`

## `hardcoded_gp_value`

Emits a `_gp` symbol with the specified value, essentially hardcoding the value.

`_gp` is requiered for initializing the `$gp` register.

This can be useful for decomp projects on the discovering step, but it would be
problematic on shiftable builds.

<!-- TODO: recommend the non-hardcoding alternative once it is implemented -->

### Example

```yaml
settings:
  hardcoded_gp_value: 0x800E4090
```

### Valid values

A positive integer or `null`.

### Default value

`null`

## `sections_allowlist`

A list of sections to that should be preserved during linking.

Usually used to avoid discarding debugging sections.

### Example

```yaml
settings:
  sections_allowlist: [.mdebug, .note, .comment]
```

### Valid values

List of strings.

### Default value

`[]`

## `sections_allowlist_extra`

A list of sections to that should be preserved during linking.

This setting works the same as same as
[`sections_allowlist`](#sections_allowlist). This option exists as a way to have
a default list of sections to be preserved that won't be overrided if the user
wants to specify their own allow list by setting `sections_allowlist`.

These defaults exists because some linkers (like clang's `lld`) complain if the
`.shstrtab` is not listed explicitly if a wildcard was used on the `/DISCARD/`
section (see [`discard_wildcard_section`](#discard_wildcard_section)), so to
avoid issues when wanting to use other linkers we emit the section by default.

### Example

```yaml
settings:
  sections_allowlist_extra:
    - .shstrtab
    - .strtab
    - .symtab
```

### Valid values

List of strings.

### Default value

`[.shstrtab]`

## `sections_denylist`

List of sections to be discarded.

This option work independently from `discard_wildcard_section`.

### Example

```yaml
settings:
  sections_denylist: [.reginfo, .got]
```

### Valid values

List of strings.

### Default value

`[.reginfo, .MIPS.abiflags, .MIPS.options, .note.gnu.build-id, .interp, .eh_frame]`

## `discard_wildcard_section`

Toggles emitting a discard section with a wildcard (`*`) entry, essentially
discarding every section and file that is not explicitly listed on the linker
script.

This option work independently from `sections_denylist`.

GNU LD docs for `/DISCARD/`: <https://sourceware.org/binutils/docs/ld/Output-Section-Discarding.html#index-_002fDISCARD_002f>

### Example

```yaml
settings:
  discard_wildcard_section: False
```

### Valid values

Boolean.

### Default value

`True`

## `alloc_sections`

List of allocatable sections (the ones that take ROM space).

The sections from this list will be emitted for each file in the specified
order.

This option can be overriden per segment, see
[segments.md#alloc_sections](segments.md#alloc_sections) for more info.

### Example

```yaml
settings:
  alloc_sections: [.rodata, .text, .data]
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
  noload_sections: [.bss]
```

### Valid values

List of strings.

### Default value

`[.sbss, .scommon, .bss, COMMON]`

## `subalign`

The value to use in the `SUBALIGN` directives.

If the value is `null` then disables using `SUBALIGN` directives.

GNU LD docs for `SUBALIGN`: <https://sourceware.org/binutils/docs/ld/Forced-Input-Alignment.html#index-SUBALIGN_0028subsection_005falign_0029>

This option can be overriden per segment, see
[segments.md#subalign](segments.md#subalign) for more info.

### Example

```yaml
settings:
  subalign: 4
```

### Valid values

Positive integers or `null`.

### Default value

`0x10`

## `segment_start_align`

Force aligning the beginning of the segment to the specified value.

If the value is `null` then no alignment will be forced.

This option can be overriden per segment, see
[segments.md#segment_start_align](segments.md#segment_start_align) for more info.

### Example

```yaml
settings:
  segment_start_align: 0x10
```

### Valid values

Positive integers or `null`.

### Default value

`null`

## `section_end_align`

Force aligning the end of each section to the specified value.

If the value is `null` then no alignment will be forced on the end of the
sections.

This option can be overriden per segment, see
[segments.md#section_end_align](segments.md#section_end_align) for more info.

### Example

```yaml
settings:
  section_end_align: 0x10
```

### Valid values

Positive integers or `null`.

### Default value

`0x10`

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

## `fill_value`

Allows to specify the value of the `FILL` statement emitted for every segment of
the linker script.

If the value is `null` then no `FILL` statements will be emitted.

GNU LD docs for `FILL`: <https://sourceware.org/binutils/docs/ld/Output-Section-Data.html#index-FILL_0028expression_0029>

This option can be overriden per segment, see
[segments.md#fill_value](segments.md#fill_value) for more info.

### Example

```yaml
settings:
  fill_value: 0xA1F
```

Which emits the following `FILL` statement:

```ld
FILL(0x00000A1F);
```

### Valid values

Positive integers or `null`.

### Default value

`0`
