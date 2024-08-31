SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(.text*);
        build/src/world/script_api/rooms.o(.text*);
        build/src/world/script_api/push_blocks.o(.text*);
        build/src/world/script_api/enter_exit.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(.data*);
        build/src/world/script_api/rooms.o(.data*);
        build/src/world/script_api/push_blocks.o(.data*);
        build/src/world/script_api/enter_exit.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(.rodata*);
        build/src/world/script_api/rooms.o(.rodata*);
        build/src/world/script_api/push_blocks.o(.rodata*);
        build/src/world/script_api/enter_exit.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(.sdata*);
        build/src/world/script_api/rooms.o(.sdata*);
        build/src/world/script_api/push_blocks.o(.sdata*);
        build/src/world/script_api/enter_exit.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(.sbss*);
        build/src/world/script_api/rooms.o(.sbss*);
        build/src/world/script_api/push_blocks.o(.sbss*);
        build/src/world/script_api/enter_exit.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(.scommon*);
        build/src/world/script_api/rooms.o(.scommon*);
        build/src/world/script_api/push_blocks.o(.scommon*);
        build/src/world/script_api/enter_exit.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(.bss*);
        build/src/world/script_api/rooms.o(.bss*);
        build/src/world/script_api/push_blocks.o(.bss*);
        build/src/world/script_api/enter_exit.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/world/script_api/shops.o(COMMON*);
        build/src/world/script_api/rooms.o(COMMON*);
        build/src/world/script_api/push_blocks.o(COMMON*);
        build/src/world/script_api/enter_exit.o(COMMON*);
    }

    .symtab 0 : { *(.symtab); }
    .strtab 0 : { *(.strtab); }
    .shstrtab 0 : { *(.shstrtab); }

    /DISCARD/ :
    {
        *(.reginfo);
        *(.MIPS.abiflags);
        *(.MIPS.options);
        *(.note.gnu.build-id);
        *(.interp);
        *(.eh_frame);
        *(.got);
        *(*);
    }
}
