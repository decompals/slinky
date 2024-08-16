# Vram classes

Vram classes aim to help reduce duplicated data across the segments and more
clearly organize the memory layout. This is not a common linker script concept.
It was designed for the ease of use with complex memory layouts between multiple
segments.

A vram class specifies a place in memory, which may be described in a somewhat
complex way, so one or more segments can point to this class instead of try to
describe the memory layout on the segment itself.

A vram class may describy a memory location by simply specifying a hardcoded
[`vram` (virtual RAM) location](#fixed_vram), the same address of an
[existing symbol](#fixed_symbol) or something more complex like the address of
a vram class starts where one or more other vram classes ends
([follow_classes](#follow_classes)).

A vram class is composed by two mandatory fields, the [`name`](#name) field and
exactly one of the fields that describe address memory locations. Specifying
more than one or not specifying any of them is invalid.

Linker symbols for start, end and size are emitted for vram classes, similarly
to how segments have linker symbols for their start, end and size. See
[`linker_symbols_style`](settings.md#linker_symbols_style).

- The start symbol is defined depending on the given field that describe a
  memory location.
- The end symbol is defined as equal to the end symbol of the largest segment
  that uses this vram class.
- The size symbol is defined by the subtraction of the end and the start
  symbols.

## Table of contents

- [Vram classes](#vram-classes)
  - [Table of contents](#table-of-contents)
  - [`name`](#name)
    - [Example](#example)
    - [Valid values](#valid-values)
  - [`fixed_vram`](#fixed_vram)
    - [Example](#example-1)
    - [Valid values](#valid-values-1)
  - [`fixed_symbol`](#fixed_symbol)
    - [Example](#example-2)
    - [Valid values](#valid-values-2)
  - [`follow_classes`](#follow_classes)
    - [Example](#example-3)
    - [Valid values](#valid-values-3)
  - [`keep_sections`](#keep_sections)
    - [Example](#example-4)
    - [Valid values](#valid-values-4)
    - [Default](#default)

## `name`

This field is **required**.

The name of the corresponding vram class.

The name of a vram class must be unique between all the vram classes.

### Example

```yaml
vram_classes:
  - { name: battle_partner, fixed_vram: 0x80238000 }
```

### Valid values

Non empty string.

## `fixed_vram`

Forces the given vram class to be at a fixed `vram` address.

The start symbol for this vram classs will be hardcoded to the given value.

### Example

```yaml
vram_classes:
  - { name: segment_05, fixed_vram: 0x05000000 }

segments:
  - name: assets1
    vram_class: segment_05
    files:
      - { path: src/assets/assets1/texture.o }
      - { path: src/assets/assets1/dlist.o }

  - name: assets2
    vram_class: segment_05
    files:
      - { path: src/assets/assets2/texture.o }
      - { path: src/assets/assets2/dlist.o }

  - name: assets3
    vram_class: segment_05
    files:
      - { path: src/assets/assets3/texture.o }
      - { path: src/assets/assets3/dlist.o }
```

### Valid values

Any unsigned integer.

## `fixed_symbol`

Forces the given vram class to have the same address as the given symbol.

The start symbol for this vram classs will be hardcoded to the given symbol.

### Example

```yaml
vram_classes:
  - { name: battle_area2, fixed_symbol: Vine1Base }

segments:
  - name: omo2_1
    vram_class: battle_area2
    files:
      - { path: actor/shy_squad.o }

  - name: omo2_2
    vram_class: battle_area2
    files:
      - { path: actor/stilt_guy.o }

  - name: omo2_3
    vram_class: battle_area2
    files:
      - { path: actor/shy_stack.o }
```

### Valid values

Non empty string.

## `follow_classes`

A list of names of other vram classes.

Specifies that this vram class must follow the end of the largest vram class of
the given list.

The start symbol for this vram classs will be equal to the largest end of the
given vram classes.

### Example

```yaml
vram_classes:
  - { name: battle_partner, fixed_vram: 0x80238000 }
  - { name: battle_code, follows_classes: [battle_partner] }

  - { name: heaps2, fixed_vram: 0x80267FF0 }
  - { name: world_script_api, follows_classes: [heaps2] }

  - { name: texture_memory, follows_classes: [battle_partner, world_script_api] }

segments:
  - name: battle_partner_goompa
    vram_class: battle_partner
    files:
      - { path: src/battle_partner/goompa.o }
  - name: battle_partner_goombario
    vram_class: battle_partner
    files:
      - { path: src/battle_partner/goombario.o }

  - name: battle_code
    vram_class: battle_code
    files:
      - { path: src/battle_code/btl_states_actions.o }
      - { path: src/battle_code/camera.o }

  - name: heaps2
    vram_class: heaps2
    files:
      - { path: src/heaps2/heaps2.o }

  - name: world_script_api
    vram_class: world_script_api
    files:
      - { path: src/world/script_api/shops.o }
      - { path: src/world/script_api/rooms.o }

  - name: texture_memory
    vram_class: texture_memory
    files:
      - { path: src/texture_memory/texture_memory.o }
```

This example describes the following interactions between segments and vram
classes:

- The `battle_partner_goompa` and `battle_partner_goombario` segments will have
  the same `vram` address as the `battle_partner` vram class, which has a fixed
  `vram` address of `0x80238000`.
- `battle_partner`'s end symbol will be set to the end symbol of either
  `battle_partner_goompa` or `battle_partner_goombario`. If the
  `battle_partner_goompa` segment is bigger then its end symbol will be used,
  otherwise the end symbol of `battle_partner_goombario` will be used.
- The `battle_code` segment will have the same `vram` address as the
  `battle_code` vram class.
- The vram address of the `battle_code` vram class will be the same as the end
  address of the `battle_partner` vram class (which is defined depending on the
  corresponding segments that use that vram class).
- The `heaps2` segment will have the same `vram` address as the `heaps2` vram
  class which has a hardcoded address of `0x80267FF0`.
- The `world_script_api` segment will have the `vram` address of the
  `world_script_api` vram class, which its `vram` address is the same as the end
  address of the `heaps2` vram class.
- The `texture_memory` segment has the same `vram` as the `texture_memory` vram
  class. The vram address of the `texture_memory` vram class will be the same as
  the end symbol of the largest vram class between `battle_partner` and
  `world_script_api`.

TODO: Add images to explain this memory layout visually.

### Valid values

A list of strings. The strings must be names of existing vram classes.

## `keep_sections`

Wraps the file entries from the segments that reference this vram class with
`KEEP` attributes.

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

Every segment referencing a vram class will inherit its `keep_sections`
attribute, propagating this setting to all those segments and allowing the user
to avoid unnecessary duplication. This setting may be overriden for specific
segments that still want to reference the given vram class. See specifying a
[`keep_sections` attribute on the `segments` document](segments.md#keep_sections)
for more information.

GNU LD documentation for
[`KEEP`](https://sourceware.org/binutils/docs/ld/Input-Section-Keep.html#index-KEEP).

### Example

```yaml
vram_classes:
  - { name: battle_partner, fixed_vram: 0x80238000, keep_sections: [.text] }
  - { name: segment_05, fixed_vram: 0x05000000, keep_sections: True }

segments:
  - name: battle_partner_goompa
    vram_class: battle_partner
    files:
      - { path: src/battle_partner/goompa.o }
  - name: battle_partner_goombario
    vram_class: battle_partner
    keep_sections: False
    files:
      - { path: src/battle_partner/goombario.o }

  - name: assets1
    vram_class: segment_05
    files:
      - { path: src/assets/texture.o }
      - { path: src/assets/dlist.o }
```

The above example defines two vram classes, `battle_partner` which defines
`keep_sections` to keep only the `.text` section of the files of the segments
that will reference thise vram class, and `segment_05` which will keep _every_
section of every segment referencing it.

The `battle_partner_goompa` segment references the `battle_partner` vram class
and neither the segment itself or the files within the segment specify their own
`keep_sections`, meaning all the `.text` sections of all the files of this
segment will be wrapped with `KEEP`s.

On the other hand, the `battle_partner_goombario` segment (which references the
`battle_partner` vram class too) sets its `keep_sections` attribute to `False`,
meaning that no file of this segment should be wrapped with `KEEP`s, overriding
the configuration of the `battle_partner` vram class for this specific segment.

Finally the `assets1` segment will emit `KEEP`s for all the sections of every
file on the segment since the `segment_05` vram class did set `True` to the
`keep_sections` attribute.

### Valid values

Either a boolean or a list of sections (list of strings).

### Default

`False`
