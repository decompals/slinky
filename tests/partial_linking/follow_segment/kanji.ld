SECTIONS
{
    kanji_TEXT_START = .;
    .text : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.text*);
    }
    kanji_TEXT_END = .;
    kanji_TEXT_SIZE = ABSOLUTE(kanji_TEXT_END - kanji_TEXT_START);

    kanji_DATA_START = .;
    .data : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.data*);
    }
    kanji_DATA_END = .;
    kanji_DATA_SIZE = ABSOLUTE(kanji_DATA_END - kanji_DATA_START);

    kanji_RODATA_START = .;
    .rodata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.rodata*);
    }
    kanji_RODATA_END = .;
    kanji_RODATA_SIZE = ABSOLUTE(kanji_RODATA_END - kanji_RODATA_START);

    kanji_SDATA_START = .;
    .sdata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.sdata*);
    }
    kanji_SDATA_END = .;
    kanji_SDATA_SIZE = ABSOLUTE(kanji_SDATA_END - kanji_SDATA_START);

    kanji_SBSS_START = .;
    .sbss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.sbss*);
    }
    kanji_SBSS_END = .;
    kanji_SBSS_SIZE = ABSOLUTE(kanji_SBSS_END - kanji_SBSS_START);

    kanji_SCOMMON_START = .;
    .scommon (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.scommon*);
    }
    kanji_SCOMMON_END = .;
    kanji_SCOMMON_SIZE = ABSOLUTE(kanji_SCOMMON_END - kanji_SCOMMON_START);

    kanji_BSS_START = .;
    .bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(.bss*);
    }
    kanji_BSS_END = .;
    kanji_BSS_SIZE = ABSOLUTE(kanji_BSS_END - kanji_BSS_START);

    kanjiCOMMON_START = .;
    COMMON (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/kanji/kanji.o(COMMON*);
    }
    kanjiCOMMON_END = .;
    kanjiCOMMON_SIZE = ABSOLUTE(kanjiCOMMON_END - kanjiCOMMON_START);

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
