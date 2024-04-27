SECTIONS
{
    .text : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.text*);
    }

    .data : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.data*);
    }

    .rodata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.rodata*);
    }

    .sdata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.sdata*);
    }

    .sbss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.sbss*);
    }

    .scommon (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.scommon*);
    }

    .bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.bss*);
    }

    COMMON (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(COMMON*);
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
