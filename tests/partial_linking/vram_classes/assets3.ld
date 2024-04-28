SECTIONS
{
    .text : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(.text*);
        build/src/assets/assets3/dlist.o(.text*);
    }

    .data : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(.data*);
        build/src/assets/assets3/dlist.o(.data*);
    }

    .rodata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(.rodata*);
        build/src/assets/assets3/dlist.o(.rodata*);
    }

    .sdata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(.sdata*);
        build/src/assets/assets3/dlist.o(.sdata*);
    }

    .sbss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(.sbss*);
        build/src/assets/assets3/dlist.o(.sbss*);
    }

    .scommon (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(.scommon*);
        build/src/assets/assets3/dlist.o(.scommon*);
    }

    .bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(.bss*);
        build/src/assets/assets3/dlist.o(.bss*);
    }

    COMMON (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/assets/assets3/texture.o(COMMON*);
        build/src/assets/assets3/dlist.o(COMMON*);
    }

    .shstrtab 0 :
    {
        *(.shstrtab);
    }

    /DISCARD/ :
    {
        *(.reginfo);
        *(.MIPS.abiflags);
        *(.MIPS.options);
        *(.note.gnu.build-id);
        *(.interp);
        *(.eh_frame);
        *(*);
    }
}
