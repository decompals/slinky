# File

A file entry describes information about a file that should be linked in a
segment.

Every attribute listed is optional unless explicitly stated.

## `path`

Path to the file.

The `base_path` from settings is used as a base for the emitted path.

This field is not compatible with the [`kind`](#kind) `pad`.

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
bytes after the the `boot_main.o` file, but only for the `.text` pad_section.

```yaml
segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
      - { kind: pad, pad_amount: 0x10, pad_section: .text }
      - { path: src/boot/dmadata.o }
```

### Valid values

- `object`: The path points to a relocatable object file. The [`path`](#path) is
  required.
- `pad`: Do not link any file but increment the position of the
  [`pad_section`](#pad_section) in the linker script by
  [`pad_amount`](#pad_amount) bytes. Both [`pad_section`](#pad_section) and
  [`pad_amount`](#pad_amount) are required.

### Default value

Guessed from `path` using the following file extensions:

- `.o`: `Object`.
- Anything else: `Object`.

## `pad_amount`

The amount of bytes to increment the position in the linker script used on `pad`
[`kind`](#kind)s.

### Example

```yaml
segments:
  - name: boot
    files:
      - { kind: pad, pad_amount: 0x10, pad_section: .text }
```

### Valid values

Positive integers.

## `pad_section`

This field have different meanings depending on the file [`kind`](#kind):

- `object`: This field is invalid.
- `pad`: The position of the linker script will advance only for this
  pad_section.

### Valid values

Non empty string.
