# Partial

Information for generating partial linker scripts.

This setting is only used when generating partial linker scripts for incremental
linking, thus being ignored during normal linker script generation.

Partial linking allows incremental builds by partially linking each individual
segment (usually with the
[`--relocatable`](https://sourceware.org/binutils/docs/ld/Options.html#index-partial-link)
flag from `ld`) and then linking those together.
This approach can produce faster rebuilds since there's less work for the
linker to do on each final link, with the caveat a clean build may be slower.

To enable partial linker script generation on the CLI use the
`--partial-linking` flag.

Every attribute listed is optional unless explicitly stated.

## Table of contents

- [Partial](#partial)
  - [Table of contents](#table-of-contents)
  - [`build_segments_folder`](#build_segments_folder)
    - [Example](#example)
    - [Valid values](#valid-values)
  - [`scripts_folder`](#scripts_folder)
    - [Example](#example-1)
    - [Valid values](#valid-values-1)
  - [`segment_extension`](#segment_extension)
    - [Example](#example-2)
    - [Valid values](#valid-values-2)
    - [Default value](#default-value)

## `build_segments_folder`

This field is **required**.

This field holds a path to a folder where each built partial segment will be
placed by the build system. Each built partial segment is expected to be named
after the corresponding segment and have the file extension specified by
[`segment_extension`](#segment_extension).

This path will be prefixed by the [`base_path`](settings.md#base_path) field
during the scripts generation.

### Example

```yaml
settings:
  base_path: build/us/

  partial:
    build_segments_folder: segments/
    scripts_folder: linker_scripts/partial/
```

The above example indicates the built partial segments will be placed in the
`build/us/segments/` folder.

### Valid values

Non-empty path.

## `scripts_folder`

This field is **required**.

This field holds a path to a folder where the generated partial linker scripts
will be written to.

Each partial script will be named like the segment's name with a `.ld` file
extension.

If [dependency generation](settings.md#d_path) is enabled, dependency files will
be generated in this folder for each segment, using the segment's name and `.d`
as the file extension.

If [path lists generation](settings.md#paths_list_path) is enabled, path lists
for each individual object will be generated in this folder for each segment,
using the segment's name and `.list` as the file extension.

### Example

```yaml
settings:
  partial:
    build_segments_folder: segments/
    scripts_folder: linker_scripts/partial/
```

### Valid values

Non-empty path.

## `segment_extension`

Specify the extension used for partially linked segments.

It does not include a leading dot.

### Example

```yaml
settings:
  partial:
    scripts_folder: linker_scripts/partial/
    build_segments_folder: segments/
    segment_extension: o
```

### Valid values

Non empty string.

### Default value

`plf` (short for "partially linked file")
