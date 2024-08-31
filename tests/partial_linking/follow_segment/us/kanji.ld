SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/kanji.o(COMMON*);
    }

    .symtab 0 :
    {
        *(.symtab);
    }
    .strtab 0 :
    {
        *(.strtab);
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
        *(.got);
        *(*);
    }
}
