SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(.text*);
        build/src/assets/assets2/dlist.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(.data*);
        build/src/assets/assets2/dlist.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(.rodata*);
        build/src/assets/assets2/dlist.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(.sdata*);
        build/src/assets/assets2/dlist.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(.sbss*);
        build/src/assets/assets2/dlist.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(.scommon*);
        build/src/assets/assets2/dlist.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(.bss*);
        build/src/assets/assets2/dlist.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/assets/assets2/texture.o(COMMON*);
        build/src/assets/assets2/dlist.o(COMMON*);
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
