SECTIONS
{
    __romPos = 0x0;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;
    .boot 0x80000460 : AT(boot_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        boot_TEXT_START = .;
        build/segments/boot.o(.text*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/segments/boot.o(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/segments/boot.o(.rodata*);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/segments/boot.o(.sdata*);
        boot_SDATA_END = .;
        boot_SDATA_SIZE = ABSOLUTE(boot_SDATA_END - boot_SDATA_START);
    }
    boot_alloc_VRAM_END = .;
    boot_alloc_VRAM_SIZE = ABSOLUTE(boot_alloc_VRAM_END - boot_alloc_VRAM);

    boot_noload_VRAM = .;
    .boot.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        boot_SBSS_START = .;
        build/segments/boot.o(.sbss*);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/segments/boot.o(.scommon*);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/segments/boot.o(.bss*);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/segments/boot.o(COMMON*);
        bootCOMMON_END = .;
        bootCOMMON_SIZE = ABSOLUTE(bootCOMMON_END - bootCOMMON_START);
    }
    boot_noload_VRAM_END = .;
    boot_noload_VRAM_SIZE = ABSOLUTE(boot_noload_VRAM_END - boot_noload_VRAM);
    boot_VRAM_END = .;
    boot_VRAM_SIZE = ABSOLUTE(boot_VRAM_END - boot_VRAM);
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    boot_ROM_SIZE = ABSOLUTE(boot_ROM_END - boot_ROM_START);

    kanji_ROM_START = __romPos;
    kanji_VRAM = ADDR(.kanji);
    kanji_alloc_VRAM = .;
    .kanji : AT(kanji_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        kanji_TEXT_START = .;
        build/segments/kanji.o(.text*);
        kanji_TEXT_END = .;
        kanji_TEXT_SIZE = ABSOLUTE(kanji_TEXT_END - kanji_TEXT_START);

        kanji_DATA_START = .;
        build/segments/kanji.o(.data*);
        kanji_DATA_END = .;
        kanji_DATA_SIZE = ABSOLUTE(kanji_DATA_END - kanji_DATA_START);

        kanji_RODATA_START = .;
        build/segments/kanji.o(.rodata*);
        kanji_RODATA_END = .;
        kanji_RODATA_SIZE = ABSOLUTE(kanji_RODATA_END - kanji_RODATA_START);

        kanji_SDATA_START = .;
        build/segments/kanji.o(.sdata*);
        kanji_SDATA_END = .;
        kanji_SDATA_SIZE = ABSOLUTE(kanji_SDATA_END - kanji_SDATA_START);
    }
    kanji_alloc_VRAM_END = .;
    kanji_alloc_VRAM_SIZE = ABSOLUTE(kanji_alloc_VRAM_END - kanji_alloc_VRAM);

    kanji_noload_VRAM = .;
    .kanji.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        kanji_SBSS_START = .;
        build/segments/kanji.o(.sbss*);
        kanji_SBSS_END = .;
        kanji_SBSS_SIZE = ABSOLUTE(kanji_SBSS_END - kanji_SBSS_START);

        kanji_SCOMMON_START = .;
        build/segments/kanji.o(.scommon*);
        kanji_SCOMMON_END = .;
        kanji_SCOMMON_SIZE = ABSOLUTE(kanji_SCOMMON_END - kanji_SCOMMON_START);

        kanji_BSS_START = .;
        build/segments/kanji.o(.bss*);
        kanji_BSS_END = .;
        kanji_BSS_SIZE = ABSOLUTE(kanji_BSS_END - kanji_BSS_START);

        kanjiCOMMON_START = .;
        build/segments/kanji.o(COMMON*);
        kanjiCOMMON_END = .;
        kanjiCOMMON_SIZE = ABSOLUTE(kanjiCOMMON_END - kanjiCOMMON_START);
    }
    kanji_noload_VRAM_END = .;
    kanji_noload_VRAM_SIZE = ABSOLUTE(kanji_noload_VRAM_END - kanji_noload_VRAM);
    kanji_VRAM_END = .;
    kanji_VRAM_SIZE = ABSOLUTE(kanji_VRAM_END - kanji_VRAM);
    __romPos += SIZEOF(.kanji);
    kanji_ROM_END = __romPos;
    kanji_ROM_SIZE = ABSOLUTE(kanji_ROM_END - kanji_ROM_START);

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    main_alloc_VRAM = .;
    .main boot_VRAM_END : AT(main_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        main_TEXT_START = .;
        build/segments/main.o(.text*);
        . = ALIGN(., 0x20);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

        main_DATA_START = .;
        build/segments/main.o(.data*);
        . = ALIGN(., 0x20);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

        main_RODATA_START = .;
        build/segments/main.o(.rodata*);
        . = ALIGN(., 0x20);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

        main_SDATA_START = .;
        build/segments/main.o(.sdata*);
        . = ALIGN(., 0x20);
        main_SDATA_END = .;
        main_SDATA_SIZE = ABSOLUTE(main_SDATA_END - main_SDATA_START);
    }
    main_alloc_VRAM_END = .;
    main_alloc_VRAM_SIZE = ABSOLUTE(main_alloc_VRAM_END - main_alloc_VRAM);

    main_noload_VRAM = .;
    .main.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        main_SBSS_START = .;
        build/segments/main.o(.sbss*);
        . = ALIGN(., 0x20);
        main_SBSS_END = .;
        main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

        main_SCOMMON_START = .;
        build/segments/main.o(.scommon*);
        . = ALIGN(., 0x20);
        main_SCOMMON_END = .;
        main_SCOMMON_SIZE = ABSOLUTE(main_SCOMMON_END - main_SCOMMON_START);

        main_BSS_START = .;
        build/segments/main.o(.bss*);
        . = ALIGN(., 0x20);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);

        mainCOMMON_START = .;
        build/segments/main.o(COMMON*);
        . = ALIGN(., 0x20);
        mainCOMMON_END = .;
        mainCOMMON_SIZE = ABSOLUTE(mainCOMMON_END - mainCOMMON_START);
    }
    main_noload_VRAM_END = .;
    main_noload_VRAM_SIZE = ABSOLUTE(main_noload_VRAM_END - main_noload_VRAM);
    main_VRAM_END = .;
    main_VRAM_SIZE = ABSOLUTE(main_VRAM_END - main_VRAM);
    __romPos += SIZEOF(.main);
    main_ROM_END = __romPos;
    main_ROM_SIZE = ABSOLUTE(main_ROM_END - main_ROM_START);

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
