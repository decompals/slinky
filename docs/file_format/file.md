# File

A file entry describes information about a file that should be linked in a
segment.

Every attribute listed is optional unless explicitly stated.

## `path`

This is **required**.

Path to the file.

The `base_path` from settings is used as a base for the emitted path.

### Example

```yaml
segments:
  - name: boot
    files:
      - { path: src/boot/boot_main.o }
```

### Valid values

Any valid path.

## `kind`

Specifies the type of file entry.

### Example

```yaml
segments:
  - name: boot
    files:
      - { path: src/boot/utils.o, kind: object }
```

### Valid values

- `object`: The path points to a relocatable object file.

### Default value

Guessed from `path` using the following file extensions:

- `.o`: `Object`.
- Anything else: `Object`.
