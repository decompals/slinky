# File

A file entry describes information about a file that should be linked in a
segment.

Every attribute listed is optional unless explicitly stated.

## Table of contents

- [File](#file)
  - [Table of contents](#table-of-contents)
  - [`path`](#path)
    - [Example](#example)
    - [Valid values](#valid-values)
  - [`kind`](#kind)
    - [Example](#example-1)
    - [Valid values](#valid-values-1)
    - [Default value](#default-value)
  - [`subfile`](#subfile)
    - [Example](#example-2)
    - [Valid values](#valid-values-2)
    - [Default](#default)
  - [`pad_amount`](#pad_amount)
    - [Example](#example-3)
    - [Valid values](#valid-values-3)
  - [`section`](#section)
    - [Valid values](#valid-values-4)
  - [`linker_offset_name`](#linker_offset_name)
    - [Valid values](#valid-values-5)
  - [`section_order`](#section_order)
    - [Example](#example-4)
    - [Valid values](#valid-values-6)
  - [`files`](#files)
    - [Example](#example-5)
  - [`dir`](#dir)
    - [Example](#example-6)
  - [`group_name`](#group_name)
    - [Example](#example-7)
  - [`moved_sections`](#moved_sections)
    - [Example](#example-8)
  - [`include_if_any`](#include_if_any)
    - [Example](#example-9)
    - [Valid values](#valid-values-7)
  - [`include_if_all`](#include_if_all)
    - [Example](#example-10)
    - [Valid values](#valid-values-8)
  - [`exclude_if_any`](#exclude_if_any)
    - [Example](#example-11)
    - [Valid values](#valid-values-9)
  - [`exclude_if_all`](#exclude_if_all)
    - [Example](#example-12)
    - [Valid values](#valid-values-10)
  - [`keep_sections`](#keep_sections)
    - [Example](#example-13)
    - [Valid values](#valid-values-11)
    - [Default](#default-1)

## `path`

Path to the file.

The `base_path` from settings is used as a base for the emitted path.

This field is only compatible with the [`kind`](#kind)s `object` and `archive`.

### Example

```yaml
segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
```

### Valid values

Any valid non-empty path.

## `kind`

Specifies the type of file entry.

### Example

The following example forces the position of the linker script to advance 0x10
bytes after the the `boot_main.o` file, but only for the `.text` section.

```yaml
segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { kind: pad, pad_amount: 0x10, section: .text }
      - { path: src/boot/dmadata.o }
```

### Valid values

- `object`: The path points to a relocatable object file. The [`path`](#path) is
  required.
- `archive`: The path points to an `.a` archive file. The [`path`](#path) is
  required. A [`subfile`](#subfile) may be specified to only link a
  specific file instead of the full archive.
- `pad`: Do not link any file but increment the position of the
  [`section`](#section) in the linker script by [`pad_amount`](#pad_amount)
  bytes. Both [`section`](#section) and [`pad_amount`](#pad_amount) are required.
- `linker_offset`: Emit a symbol between the files at a given
  [`section`](#section). Both [`section`](#section) and
  [`linker_offset_name`](#linker_offset_name) are required.
- `group`: Allows grouping multiple files for better organization. A group may
  also have a [`dir`](#dir) field that prefixes the path of all the files from
  this group. The [`files`](#files) field is required.
- `moved_group`: Allows to move some sections of a group so they can be placed
  within a different section and far from the original block would be placed.
  Requires a [`group_name`](#group_name) and a
  [`moved_sections`](#moved_sections) fields. Useful when it is required to have
  one or more sections of a block files in a non-standard order.

### Default value

Guessed from `path` using the following file extensions:

- `.o`: `object`.
- `.a`: `archive`.
- Anything else: `object`.

## `subfile`

A specific file within an `.a` archive file, instead of using the whole archive.

### Example

```yaml
segments:
  - name: boot
    files:
      - { path: lib/libmus.a, subfile: aud_samples.o }
```

### Valid values

Non empty strings.

### Default

`*`

This tells the linker to use all the files it needs from the archive.

## `pad_amount`

The amount of bytes to increment the position in the linker script used on `pad`
[`kind`](#kind)s.

### Example

```yaml
segments:
  - name: boot
    files:
      - { kind: pad, pad_amount: 0x10, section: .text }
```

### Valid values

Positive integers.

## `section`

This field have different meanings depending on the file [`kind`](#kind):

- `object`: This field is invalid.
- `pad`: The position of the linker script will advance only for this section.
- `linker_offset`: The section where the linker offset symbol will be emitted.

### Valid values

Non empty string.

## `linker_offset_name`

The name to be used for the generated `linker offset` [`kind`](#kind).

This name is not used as-is, instead it is controlled by the global
[`linker_symbols_style`](settings.md#linker_symbols_style) setting

### Valid values

Non empty string.

## `section_order`

Allows to specify that one or more sections of this file should be put within
other specific sections.

Each key represents a section to be placed elsewhere and its key represent the
section where it should be put on.

This is accepted only by the `object` and `archive` [`kind`](#kind)s.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: code
    files:
      - { path: src/code/main.o }
      - { path: src/code/message.o, section_order: { .data: .rodata } }
      - { path: src/code/collisions.o }
```

The above example would produce an ordering like the following:

```bash
build/src/code/main.o(.data*);
build/src/code/collisions.o(.data*); # Notice no entry for message(.data)

# snip

build/src/code/main.o(.rodata*);
build/src/code/message.o(.data*);
build/src/code/message.o(.rodata*);
build/src/code/collisions.o(.rodata*);
```

### Valid values

A dictionary (map) of non empty string as keys and values.

## `files`

Can only be used with the `group` [`kind`](#kind).

Allows to specify a list of files.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/util.o }

      - kind: group
        files:
          - { path: src/libkmc/fmod.o }
          - { path: src/libkmc/memmove.o }
          - { path: src/libkmc/memset.o }
          - { path: src/libkmc/modf.o }

      - { path: src/gzip/unzip.o }
```

## `dir`

Can only be used with the `group` [`kind`](#kind).

Specifies a directory that will be used as a prefix for the files listed by this
entry.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/util.o }

      - kind: group
        dir: src/libultra
        files:
          - { path: io/conteepprobe.o }
          - { path: io/conteeplongwrite.o }
          - { path: io/conteeplongread.o }

      - kind: group
        dir: src/libmus
        files:
          - { path: player.o }
          - { path: player_fx.o }
          - { path: aud_dma.o }
          - { path: aud_sched.o }
          - { path: aud_thread.o }
          - { path: lib_memory.o }
          - { path: aud_samples.o }
```

## `group_name`

Can only be used with the `moved_group` and `group` [`kind`](#kind)s.

Allows pairing a `moved_group` block to a `group` block.

This field is optional in `group`s, but required on `moved_group`s. The name
used on a `moved_group` must match the same `group_name` of an existing `group`.

A `group_name` must be unique between `group`s.
A `group_name` must be unique between `moved_group`s.

See also [`moved_sections`](#moved_sections).

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - kind: group
        group_name: start_code
        files:
          - { path: src/main_segment/main.o }

      - kind: group
        dir: src/libmus
        group_name: libmus
        files:
          - { path: player.o }

      # Put rodata within data and move the whole block the original libmus block.
      - kind: moved_group
        group_name: libmus
        moved_sections: { .rodata: .data }

      # Put rodata within data and move the whole block the second libmus block.
      - kind: moved_group
        group_name: start_code
        moved_sections: { .rodata: .data }
```

## `moved_sections`

Can only be used with the `moved_group` [`kind`](#kind).

Allows to move a number of sections from a given `group` block to be placed
within a different section and on a different order than the standard one.

Each key represents a section to be placed elsewhere and its key represent the
section where it should be put on.

Useful when a section of a number of files are sequential between a block, but
not between the general normal order.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - kind: group
        group_name: start_code
        files:
          - { path: src/main_segment/main.o }
          - { path: src/main_segment/joy.o }

      - kind: group
        dir: src/libmus
        group_name: libmus
        files:
          - { path: player.o }
          - { path: player_fx.o }
          - { path: aud_dma.o }

      # Put rodata within data and move the whole block the original libmus block.
      - kind: moved_group
        group_name: libmus
        moved_sections: { .rodata: .data }

      # Put rodata within data and move the whole block the second libmus block.
      - kind: moved_group
        group_name: start_code
        moved_sections: { .rodata: .data }

      - kind: group
        dir: src/engine
        files:
          - { path: actor.o }
          - { path: background.o }
          - { path: props.o }
          - { path: credits.o }
```

The above example would produce an ordering like the following:

```bash
        boot_DATA_START = .;
        build/src/main_segment/main.o(.data*);
        build/src/main_segment/joy.o(.data*);
        build/src/libmus/player.o(.data*);
        build/src/libmus/player_fx.o(.data*);
        build/src/libmus/aud_dma.o(.data*);
        build/src/libmus/player.o(.rodata*); # the 3 libmus rodata sections next to the 3 libmus data sections
        build/src/libmus/player_fx.o(.rodata*);
        build/src/libmus/aud_dma.o(.rodata*);
        build/src/main_segment/main.o(.rodata*); # the 2 start_code rodata sections after the libmus files
        build/src/main_segment/joy.o(.rodata*);
        build/src/engine/actor.o(.data*); # The remaining filefiless in normal order
        build/src/engine/background.o(.data*);
        build/src/engine/props.o(.data*);
        build/src/engine/credits.o(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/src/engine/actor.o(.rodata*);
        build/src/engine/background.o(.rodata*);
        build/src/engine/props.o(.rodata*);
        build/src/engine/credits.o(.rodata*);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);
```

## `include_if_any`

Allows to conditionally include this entry depending on the current [custom
options](custom_options.md).

Expects a list of key-value tuples. This entry will be emitted into the
generated files only if at least one of the given tuples matches the current
custom options. If none of the elements of this list matches any custom option
then this whole entry will be omitted.

This conditional behavior is only applied if this field is present and not empty.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/util.o }

      # This entry will be emitted only if `version` is `jpn1.0`
      - { path: src/boot/expansion_required.o, include_if_any: [[version, jpn1.0]] }

      # This entry will be emitted only if `version` is either `pal1.0`, `pal1.1` or `pal1.2`
      - { path: src/boot/language_selector.o, include_if_any: [[version, pal1.0], [version, pal1.1], [version, pal1.2]] }

      # This whole group will be emitted only if `compiler` is `kmc`
      - kind: group
        dir: lib/libkmc
        include_if_any: [[compiler, kmc]]
        files:
          - { path: memmove.o }
          - { path: memset.o }
          - { path: strcpy.o }
          - { path: mmuldi3.o }

      # This whole group will be emitted only if `compiler` is `modern_gcc`
      - kind: group
        dir: lib
        include_if_any: [[compiler, modern_gcc]]
        files:
          - { path: libgcc.{abi}.a }
```

### Valid values

A non-empty list of two-tuples of strings.

## `include_if_all`

Allows to conditionally include this entry depending on the current [custom
options](custom_options.md).

Expects a list of key-value tuples. This entry will be emitted into the
generated files only if all the given tuples matches the current custom options.
If at least one of the elements of this list does not matches any custom option
then this whole entry will be omitted.

This conditional behavior is only applied if this field is present and not empty.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/util.o }

      # This entry will be emitted only if `compiler` is `modern_gcc` and `modding` is `true`
      - { path: src/boot/is_viewer.o, include_if_all: [[compiler, modern_gcc], [modding, true]] }
```

### Valid values

A non-empty list of two-tuples of strings.

## `exclude_if_any`

Allows to conditionally exclude this entry depending on the current [custom
options](custom_options.md).

Expects a list of key-value tuples. This entry won't be emitted into the
generated files only if at least one of the given tuples matches the current
custom options. If none of the elements of this list matches any custom option
then this entry will be normally emitted.

This conditional behavior is only applied if this field is present and not empty.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/util.o }

      # This entry will be emitted only if `compiler` is not `modern_gcc` and `compiler` is not `kmc`
      - { path: src/libultra/libc/ll.o, exclude_if_any: [[compiler, modern_gcc], [compiler, kmc]] }
```

### Valid values

A non-empty list of two-tuples of strings.

## `exclude_if_all`

Allows to conditionally exclude this entry depending on the current [custom
options](custom_options.md).

Expects a list of key-value tuples. This entry will not be emitted into the
generated files only if all the given tuples matches the current custom options.
If at least one of the elements of this list does match any custom option then
this whole entry will be normally emitted.

This conditional behavior is only applied if this field is present and not empty.

### Example

```yaml
settings:
  base_path: build

segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/util.o }

      # This entry won't be emitted only if `compiler` is `modern_gcc` and `modding` is `true`
      - { path: src/boot/is_viewer.o, exclude_if_all: [[compiler, modern_gcc], [modding, true]] }
```

### Valid values

A non-empty list of two-tuples of strings.

## `keep_sections`

Wraps the sections of this file with `KEEP` attributes.

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

If this entry happen to be a [group `kind`](#kind) then all the files listed on
this group that do not specify their own `keep_sections` will inherit it from
this entry instead, propagating this setting to all those file entries and
allowing the user to avoid unnecessary duplication.

If no `keep_sections` is specified for the current file entry, then the entry
will inherit it from `keep_section` of the [segment](segments.md) or
[file group](#kind) which contains this entry.

GNU LD documentation for
[`KEEP`](https://sourceware.org/binutils/docs/ld/Input-Section-Keep.html#index-KEEP).

### Example

```yaml
segments:
  - name: main_segment
    keep_sections: [.text]
    files:
      - kind: group
        dir: src/rsp
        keep_sections: True
        files:
          # Will `KEEP` every section
          - { path: rspboot.o }
          - { path: aspMain.o }
          - { path: f3dex2.o }

      - kind: group
        dir: src/stufsh
        keep_sections: [.data]
        files:
          - kind: group
            files:
              - { path: thingy1.o, keep_sections: [.text] } # Only `KEEP`s `.text`
              - { path: thingy2.o } # Only `KEEP`s `.data`
          - kind: group
            keep_sections: [.rodata, .data]
            files:
              - kind: group
                files:
                  - { path: thonga3.o } # `KEEP`s `.data` and `.rodata`
                  - { path: capy4.o } # `KEEP`s `.data` and `.rodata`
                  - { path: placeholder5.o, keep_sections: [.bss] } # Only `KEEP`s `.bss`
                  - { path: idk6.o, keep_sections: [.bss] } # Only `KEEP`s `.bss`
          - { path: another7.o } # Only `KEEP`s `.data`
```

### Valid values

Either a boolean or a list of sections (list of strings).

### Default

The [`keep_sections` of the `segment` holding this entry](segments.md#keep_sections)
or the [`keep_sections` of the group `file` entry holding this entry](file.md#keep_sections)
or `False` if no inheritable property is found.
