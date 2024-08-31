SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/ipl3.o(COMMON*);
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
