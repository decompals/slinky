SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/kanji/kanji.o(COMMON*);
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
