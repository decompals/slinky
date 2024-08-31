SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/texture_memory/texture_memory.o(COMMON*);
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
