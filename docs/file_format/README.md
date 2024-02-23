# File format

The input file format is composed by two top-level attributes, the
[`settings`](settings.md) and the [`segments`](segments.md).

## Example

```yaml
settings:
  paths:
    base_path: build
  subalign: 32

segments:
  - name: header
    files:
      - { path: asm/data/rom_header.o }

  - name: ipl3
    files:
      - { path: asm/data/ipl3.o }

  - name: entry
    fixed_vram: 0x80000400
    files:
      - { path: asm/entry.o }

  - name: boot
    use_subalign: False
    files:
      - { path: src/boot/boot_main.o }
      - { path: src/boot/dmadata.o }
      - { path: asm/util.o }
```

This example lists 4 segments.

The `header` segment is composed by only one file, `rom_header.o`. The full
path for every file is computed by joining the `base_path` (from `settings`)
with the file's path, meaining the full path of this file is
`build/asm/data/rom_header.o`. By default `base_path` is an empty string.

The `entry` segment is the first segment to specify a fixed `vram` address.
This will force this segment to be put at this specific address.

Since the `boot` segment does not specify a fixed `vram` address then its
address will be the end vram address of the previous segment (`entry`).

The `boot` segment specified `use_subalign` to be `False`, so a`SUBALIGN`
directive should not be used for this segment. This means sections from every
file will be aligned using the alignment from the elf files.

The same sections of each file are put together in the order specified by the
`settings`. Since no order was specified in this example then the default order
and sections are used.

For every listed segment there will be emitted two segments. One for the
allocatable sections (which has the same name of the segment with a `.` prefix)
and another for the `noload` (a.k.a. `bss` and family) sections (with the name
of the segment with a `.` prefix and `.noload` suffix).

The section listing for the `.boot` segment would look like the following:

```ld
build/src/boot/boot_main.o(.text*)
build/src/boot/dmadata.o(.text*)
build/asm/util.o(.text*)

build/src/boot/boot_main.o(.data*)
build/src/boot/dmadata.o(.data*)
build/asm/util.o(.data*)

build/src/boot/boot_main.o(.rodata*)
build/src/boot/dmadata.o(.rodata*)
build/asm/util.o(.rodata*)

build/src/boot/boot_main.o(.sdata*)
build/src/boot/dmadata.o(.sdata*)
build/asm/util.o(.sdata*)
```

The section listing for the `.boot.noload` segment would look like this:

```ld
build/src/boot/boot_main.o(.sbss*)
build/src/boot/dmadata.o(.sbss*)
build/asm/util.o(.sbss*)

build/src/boot/boot_main.o(.scommon*)
build/src/boot/dmadata.o(.scommon*)
build/asm/util.o(.scommon*)

build/src/boot/boot_main.o(.bss*)
build/src/boot/dmadata.o(.bss*)
build/asm/util.o(.bss*)

build/src/boot/boot_main.o(COMMON*)
build/src/boot/dmadata.o(COMMON*)
build/asm/util.o(COMMON*)
```
