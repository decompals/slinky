# Settings

The top-level `settings` attribute specifies many options to customize the
generated linker script. Note that many of these options can be customized per
segment too.

All the settings are optional. Unspecified options will use the default value
for it. Note that using certain settings may require specifying other options
as well.

## Table of Contents

- [Settings](#settings)
  - [Table of Contents](#table-of-contents)
  - [`base_path`](#base_path)
    - [Example](#example)
    - [Valid values](#valid-values)
    - [Default value](#default-value)
  - [`linker_symbols_style`](#linker_symbols_style)
    - [Example](#example-1)
    - [Valid values](#valid-values-1)
    - [Default value](#default-value-1)
  - [`hardcoded_gp_value`](#hardcoded_gp_value)
    - [Example](#example-2)
    - [Valid values](#valid-values-2)
    - [Default value](#default-value-2)
  - [`d_path`](#d_path)
    - [Example](#example-3)
    - [Valid values](#valid-values-3)
  - [`target_path`](#target_path)
    - [Example](#example-4)
    - [Valid values](#valid-values-4)
  - [`symbols_header_path`](#symbols_header_path)
    - [Example](#example-5)
    - [Valid values](#valid-values-5)
  - [`symbols_header_type`](#symbols_header_type)
    - [Example](#example-6)
    - [Valid values](#valid-values-6)
    - [Default value](#default-value-3)
  - [`symbols_header_as_array`](#symbols_header_as_array)
    - [Example](#example-7)
    - [Valid values](#valid-values-7)
    - [Default value](#default-value-4)
  - [`sections_allowlist`](#sections_allowlist)
    - [Example](#example-8)
    - [Valid values](#valid-values-8)
    - [Default value](#default-value-5)
  - [`sections_allowlist_extra`](#sections_allowlist_extra)
    - [Example](#example-9)
    - [Valid values](#valid-values-9)
    - [Default value](#default-value-6)
  - [`sections_denylist`](#sections_denylist)
    - [Example](#example-10)
    - [Valid values](#valid-values-10)
    - [Default value](#default-value-7)
  - [`discard_wildcard_section`](#discard_wildcard_section)
    - [Example](#example-11)
    - [Valid values](#valid-values-11)
    - [Default value](#default-value-8)
  - [`single_segment_mode`](#single_segment_mode)
    - [Example](#example-12)
    - [Valid values](#valid-values-12)
    - [Default value](#default-value-9)
  - [`partial_scripts_folder`](#partial_scripts_folder)
    - [Example](#example-13)
    - [Valid values](#valid-values-13)
  - [`partial_build_segments_folder`](#partial_build_segments_folder)
    - [Example](#example-14)
    - [Valid values](#valid-values-14)
  - [`alloc_sections`](#alloc_sections)
    - [Example](#example-15)
    - [Valid values](#valid-values-15)
    - [Default value](#default-value-10)
  - [`noload_sections`](#noload_sections)
    - [Example](#example-16)
    - [Valid values](#valid-values-16)
    - [Default value](#default-value-11)
  - [`subalign`](#subalign)
    - [Example](#example-17)
    - [Valid values](#valid-values-17)
    - [Default value](#default-value-12)
  - [`segment_start_align`](#segment_start_align)
    - [Example](#example-18)
    - [Valid values](#valid-values-18)
    - [Default value](#default-value-13)
  - [`section_end_align`](#section_end_align)
    - [Example](#example-19)
    - [Valid values](#valid-values-19)
    - [Default value](#default-value-14)
  - [`sections_start_alignment`](#sections_start_alignment)
    - [Example](#example-20)
    - [Valid values](#valid-values-20)
    - [Default value](#default-value-15)
  - [`wildcard_sections`](#wildcard_sections)
    - [Example](#example-21)
    - [Valid values](#valid-values-21)
    - [Default value](#default-value-16)
  - [`fill_value`](#fill_value)
    - [Example](#example-22)
    - [Valid values](#valid-values-22)
    - [Default value](#default-value-17)

## `base_path`

All the emitted paths are relative to this path. Useful when all the files are
relative to the same directory, like a `build` folder.

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
- File's [linker offset](file.md#linker_offset_name).
- [Vram's class](vram_classes.md)'s start, end and size.

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
  - File [`linker_offset_name`](file.md#linker_offset_name): `{name}_OFFSET`.
  - [Vram class](vram_classes.md): `{name}_VRAM_CLASS_START`,
    `{name}_VRAM_CLASS_END` and `{name}_VRAM_CLASS_SIZE`.

- `makerom`: Produces _camelCase symbols. Given a segment named `boot`:
  - Segment rom: `_bootSegmentRomStart`, `_bootSegmentRomEnd` and `_bootSegmentRomSize`.
  - Segment vram: `_bootSegmentStart`, `_bootSegmentEnd` and `_bootSegmentSize`.
  - Section vram (not limited to the foloowing examples):
    - `.text`: `_bootSegmentTextStart`, `_bootSegmentTextEnd` and `_bootSegmentTextSize`.
    - `.data`: `_bootSegmentDataStart`, `_bootSegmentDataEnd` and `_bootSegmentDataSize`.
    - `.bss`: `_bootSegmentBssStart`, `_bootSegmentBssEnd` and `_bootSegmentBssSize`.
  - File [`linker_offset_name`](file.md#linker_offset_name): `_{name}Offset`.
  - [Vram class](vram_classes.md): `_{name}VramClassStart`, `_{name}VramClassEnd`
    and `_{name}VramClassSize`.

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

## `d_path`

Output path for the `.d` (dependencies) file.

A dependencies file consists on a file that lists required files to build a
given file. This kind of dependency files can be consumed by build systems like
`make` or `ninja`.

The generated `.d` file will list all the paths listed by every segment as
required to build a given [`target_path`](#target_path).

This file is generated only if `d_path` is specified.

This option requires [`target_path`](#target_path).

### Example

```yaml
settings:
  d_path: linker_scripts/game.d
  target_path: build/game.elf
```

### Valid values

Non-empty path.

## `target_path`

The path to the file that will result of linking, usually an `.elf` file.

Currently only used by the [`d_path`](#d_path) setting.

### Example

```yaml
settings:
  d_path: linker_scripts/game.d
  target_path: build/game.elf
```

### Valid values

Non-empty path.

## `symbols_header_path`

Path to output a C header containing the generated linker symbols.

The symbols are declared as `extern` and their type can be customized with
[`symbols_header_type`](#symbols_header_type) and
[`symbols_header_as_array`](#symbols_header_as_array).

This file is generated only if `symbols_header_path` is specified.

### Example

```yaml
settings:
  symbols_header_path: include/linker_symbols.h
```

### Valid values

Non-empty path.

## `symbols_header_type`

The type used for every linker symbol on the generated header.

This option is ignored if [`symbols_header_path`](#symbols_header_path) was not
set.

### Example

```yaml
settings:
  symbols_header_path: include/linker_symbols.h
  symbols_header_type: u32
```

Generates entries like:

```c
extern u32 main_BSS_START[];
```

### Valid values

String

### Default value

`char`

## `symbols_header_as_array`

Allows customizing if the entries from the generated symbols header should be
declared as arrays or not.

This option is ignored if [`symbols_header_path`](#symbols_header_path) was not
set.

### Example

```yaml
settings:
  symbols_header_path: include/linker_symbols.h
  symbols_header_type: Addr
  symbols_header_as_array: False
```

Generates entries like:

```c
extern Addr main_BSS_START;
```

### Valid values

Boolean

### Default value

`True`

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

## `single_segment_mode`

Change linker script generation to be more similar to an standard linker script,
removing the multi-segment handling logic that is used mainly for N64 projects.

With this mode active the emitted sections will correspond directly to
[`alloc_sections`](#alloc_sections) and [`noload_sectionss`](#noload_sections).

This requires the YAML document to have exactly 1 segment under the
`[segments.md#segments](segments.md#segments)` section.

The [segments.md#fixed_vram](segments.md#fixed_vram) property is used to specify
the vram for the first section, then the following sections' vram grow
accordingly.

### Example

```yaml
settings:
  single_segment_mode: True
```

### Valid values

Boolean.

### Default value

`False`

## `partial_scripts_folder`

This setting is used when generating partial linker scripts for incremental
linking, thus being ignored during normal linker script generation.

This field holds a path to a folder where the generated partial linker scripts
will be written to.

Each partial script will be named like the segment's name with a `.ld` file
extension. If dependency generation is enabled then dependency files will be
generated in this folder for each partial linker script, named like the
segment's name and `.d` as the file extension.

### Example

```yaml
settings:
  partial_scripts_folder: linker_scripts/partial/
```

### Valid values

Non-empty path.

## `partial_build_segments_folder`

This setting is used when generating partial linker scripts for incremental
linking, thus being ignored during normal linker script generation.

This field holds a path to a folder where each built partial segment will be
placed by the build system in use. Each built partial segment is expected to be
named after the corresponding segment and use a `.o` file extension.

This path will be prefixed by the [`base_path`](#base_path) field during
generation the scripts generation.

### Example

```yaml
settings:
  base_path: build/us
  partial_scripts_folder: segments/
```

The above example indicates the built partial segments will be in the
`build/us/segments/`

### Valid values

Non-empty path.

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

## `sections_start_alignment`

Allows to specify different alignments for the start of every section.

If a specific section is not pressent on this mapping then no alignment will be
forced on the given section.

This option can be overriden per segment, see
[segments.md#sections_start_alignment](segments.md#sections_start_alignment) for
more info.

### Example

```yaml
settings:
  section_start_alignment: { .text: 128, .rodata: 0x40, .sdata: 0x8 }
```

### Valid values

A mapping of strings as keys and positive numbers as values.

### Default value

Empty mapping.

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
