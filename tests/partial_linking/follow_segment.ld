SECTIONS
{
    __romPos = 0x0;

    __romPos = ALIGN(__romPos, 0x8);
    . = ALIGN(., 0x8);
    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;

    .boot 0x80000460 : AT(boot_ROM_START)
    {
        FILL(0x00000000);
        boot_TEXT_START = .;
        build/us/segments/boot.o(.text*);
        . = ALIGN(., 0x8);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/us/segments/boot.o(.data*);
        . = ALIGN(., 0x8);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/us/segments/boot.o(.rodata*);
        . = ALIGN(., 0x8);
        . = ALIGN(., 0x80);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/us/segments/boot.o(.sdata*);
        . = ALIGN(., 0x8);
        boot_SDATA_END = .;
        boot_SDATA_SIZE = ABSOLUTE(boot_SDATA_END - boot_SDATA_START);
    }

    boot_alloc_VRAM_END = .;
    boot_alloc_VRAM_SIZE = ABSOLUTE(boot_alloc_VRAM_END - boot_alloc_VRAM);

    boot_noload_VRAM = .;

    .boot.noload (NOLOAD) :
    {
        FILL(0x00000000);
        boot_SBSS_START = .;
        build/us/segments/boot.o(.sbss*);
        . = ALIGN(., 0x8);
        . = ALIGN(., 0x20);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/us/segments/boot.o(.scommon*);
        . = ALIGN(., 0x8);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/us/segments/boot.o(.bss*);
        . = ALIGN(., 0x8);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/us/segments/boot.o(COMMON*);
        . = ALIGN(., 0x8);
        bootCOMMON_END = .;
        bootCOMMON_SIZE = ABSOLUTE(bootCOMMON_END - bootCOMMON_START);
    }

    boot_noload_VRAM_END = .;
    boot_noload_VRAM_SIZE = ABSOLUTE(boot_noload_VRAM_END - boot_noload_VRAM);

    __romPos += SIZEOF(.boot);
    __romPos = ALIGN(__romPos, 0x40);
    . = ALIGN(., 0x40);
    boot_VRAM_END = .;
    boot_VRAM_SIZE = ABSOLUTE(boot_VRAM_END - boot_VRAM);
    boot_ROM_END = __romPos;
    boot_ROM_SIZE = ABSOLUTE(boot_ROM_END - boot_ROM_START);

    __romPos = ALIGN(__romPos, 0x8);
    . = ALIGN(., 0x8);
    kanji_ROM_START = __romPos;
    kanji_VRAM = ADDR(.kanji);
    kanji_alloc_VRAM = .;

    .kanji : AT(kanji_ROM_START)
    {
        FILL(0x00000000);
        kanji_TEXT_START = .;
        build/us/segments/kanji.o(.text*);
        . = ALIGN(., 0x8);
        kanji_TEXT_END = .;
        kanji_TEXT_SIZE = ABSOLUTE(kanji_TEXT_END - kanji_TEXT_START);

        kanji_DATA_START = .;
        build/us/segments/kanji.o(.data*);
        . = ALIGN(., 0x8);
        kanji_DATA_END = .;
        kanji_DATA_SIZE = ABSOLUTE(kanji_DATA_END - kanji_DATA_START);

        kanji_RODATA_START = .;
        build/us/segments/kanji.o(.rodata*);
        . = ALIGN(., 0x8);
        . = ALIGN(., 0x80);
        kanji_RODATA_END = .;
        kanji_RODATA_SIZE = ABSOLUTE(kanji_RODATA_END - kanji_RODATA_START);

        kanji_SDATA_START = .;
        build/us/segments/kanji.o(.sdata*);
        . = ALIGN(., 0x8);
        kanji_SDATA_END = .;
        kanji_SDATA_SIZE = ABSOLUTE(kanji_SDATA_END - kanji_SDATA_START);
    }

    kanji_alloc_VRAM_END = .;
    kanji_alloc_VRAM_SIZE = ABSOLUTE(kanji_alloc_VRAM_END - kanji_alloc_VRAM);

    kanji_noload_VRAM = .;

    .kanji.noload (NOLOAD) :
    {
        FILL(0x00000000);
        kanji_SBSS_START = .;
        build/us/segments/kanji.o(.sbss*);
        . = ALIGN(., 0x8);
        . = ALIGN(., 0x20);
        kanji_SBSS_END = .;
        kanji_SBSS_SIZE = ABSOLUTE(kanji_SBSS_END - kanji_SBSS_START);

        kanji_SCOMMON_START = .;
        build/us/segments/kanji.o(.scommon*);
        . = ALIGN(., 0x8);
        kanji_SCOMMON_END = .;
        kanji_SCOMMON_SIZE = ABSOLUTE(kanji_SCOMMON_END - kanji_SCOMMON_START);

        kanji_BSS_START = .;
        build/us/segments/kanji.o(.bss*);
        . = ALIGN(., 0x8);
        kanji_BSS_END = .;
        kanji_BSS_SIZE = ABSOLUTE(kanji_BSS_END - kanji_BSS_START);

        kanjiCOMMON_START = .;
        build/us/segments/kanji.o(COMMON*);
        . = ALIGN(., 0x8);
        kanjiCOMMON_END = .;
        kanjiCOMMON_SIZE = ABSOLUTE(kanjiCOMMON_END - kanjiCOMMON_START);
    }

    kanji_noload_VRAM_END = .;
    kanji_noload_VRAM_SIZE = ABSOLUTE(kanji_noload_VRAM_END - kanji_noload_VRAM);

    __romPos += SIZEOF(.kanji);
    __romPos = ALIGN(__romPos, 0x40);
    . = ALIGN(., 0x40);
    kanji_VRAM_END = .;
    kanji_VRAM_SIZE = ABSOLUTE(kanji_VRAM_END - kanji_VRAM);
    kanji_ROM_END = __romPos;
    kanji_ROM_SIZE = ABSOLUTE(kanji_ROM_END - kanji_ROM_START);

    __romPos = ALIGN(__romPos, 0x8);
    . = ALIGN(., 0x8);
    ascii_ROM_START = __romPos;
    ascii_VRAM = ADDR(.ascii);
    ascii_alloc_VRAM = .;

    .ascii : AT(ascii_ROM_START)
    {
        FILL(0x00000000);
        ascii_TEXT_START = .;
        build/us/segments/ascii.o(.text*);
        . = ALIGN(., 0x8);
        ascii_TEXT_END = .;
        ascii_TEXT_SIZE = ABSOLUTE(ascii_TEXT_END - ascii_TEXT_START);

        ascii_DATA_START = .;
        build/us/segments/ascii.o(.data*);
        . = ALIGN(., 0x8);
        ascii_DATA_END = .;
        ascii_DATA_SIZE = ABSOLUTE(ascii_DATA_END - ascii_DATA_START);

        ascii_RODATA_START = .;
        build/us/segments/ascii.o(.rodata*);
        . = ALIGN(., 0x8);
        . = ALIGN(., 0x80);
        ascii_RODATA_END = .;
        ascii_RODATA_SIZE = ABSOLUTE(ascii_RODATA_END - ascii_RODATA_START);

        ascii_SDATA_START = .;
        build/us/segments/ascii.o(.sdata*);
        . = ALIGN(., 0x8);
        ascii_SDATA_END = .;
        ascii_SDATA_SIZE = ABSOLUTE(ascii_SDATA_END - ascii_SDATA_START);
    }

    ascii_alloc_VRAM_END = .;
    ascii_alloc_VRAM_SIZE = ABSOLUTE(ascii_alloc_VRAM_END - ascii_alloc_VRAM);

    ascii_noload_VRAM = .;

    .ascii.noload (NOLOAD) :
    {
        FILL(0x00000000);
        ascii_SBSS_START = .;
        build/us/segments/ascii.o(.sbss*);
        . = ALIGN(., 0x8);
        . = ALIGN(., 0x20);
        ascii_SBSS_END = .;
        ascii_SBSS_SIZE = ABSOLUTE(ascii_SBSS_END - ascii_SBSS_START);

        ascii_SCOMMON_START = .;
        build/us/segments/ascii.o(.scommon*);
        . = ALIGN(., 0x8);
        ascii_SCOMMON_END = .;
        ascii_SCOMMON_SIZE = ABSOLUTE(ascii_SCOMMON_END - ascii_SCOMMON_START);

        ascii_BSS_START = .;
        build/us/segments/ascii.o(.bss*);
        . = ALIGN(., 0x8);
        ascii_BSS_END = .;
        ascii_BSS_SIZE = ABSOLUTE(ascii_BSS_END - ascii_BSS_START);

        asciiCOMMON_START = .;
        build/us/segments/ascii.o(COMMON*);
        . = ALIGN(., 0x8);
        asciiCOMMON_END = .;
        asciiCOMMON_SIZE = ABSOLUTE(asciiCOMMON_END - asciiCOMMON_START);
    }

    ascii_noload_VRAM_END = .;
    ascii_noload_VRAM_SIZE = ABSOLUTE(ascii_noload_VRAM_END - ascii_noload_VRAM);

    __romPos += SIZEOF(.ascii);
    __romPos = ALIGN(__romPos, 0x40);
    . = ALIGN(., 0x40);
    ascii_VRAM_END = .;
    ascii_VRAM_SIZE = ABSOLUTE(ascii_VRAM_END - ascii_VRAM);
    ascii_ROM_END = __romPos;
    ascii_ROM_SIZE = ABSOLUTE(ascii_ROM_END - ascii_ROM_START);

    __romPos = ALIGN(__romPos, 0x8);
    . = ALIGN(., 0x8);
    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    main_alloc_VRAM = .;

    .main boot_VRAM_END : AT(main_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        main_TEXT_START = .;
        build/us/segments/main.o(.text*);
        . = ALIGN(., 0x20);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

        . = ALIGN(., 0x40);
        main_DATA_START = .;
        build/us/segments/main.o(.data*);
        . = ALIGN(., 0x20);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

        . = ALIGN(., 0x40);
        main_RODATA_START = .;
        build/us/segments/main.o(.rodata*);
        . = ALIGN(., 0x20);
        . = ALIGN(., 0x80);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

        . = ALIGN(., 0x40);
        main_SDATA_START = .;
        build/us/segments/main.o(.sdata*);
        . = ALIGN(., 0x20);
        main_SDATA_END = .;
        main_SDATA_SIZE = ABSOLUTE(main_SDATA_END - main_SDATA_START);
    }

    main_alloc_VRAM_END = .;
    main_alloc_VRAM_SIZE = ABSOLUTE(main_alloc_VRAM_END - main_alloc_VRAM);

    main_noload_VRAM = .;

    .main.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        main_SBSS_START = .;
        build/us/segments/main.o(.sbss*);
        . = ALIGN(., 0x20);
        . = ALIGN(., 0x20);
        main_SBSS_END = .;
        main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

        . = ALIGN(., 0x40);
        main_SCOMMON_START = .;
        build/us/segments/main.o(.scommon*);
        . = ALIGN(., 0x20);
        main_SCOMMON_END = .;
        main_SCOMMON_SIZE = ABSOLUTE(main_SCOMMON_END - main_SCOMMON_START);

        . = ALIGN(., 0x40);
        main_BSS_START = .;
        build/us/segments/main.o(.bss*);
        . = ALIGN(., 0x20);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);

        . = ALIGN(., 0x40);
        mainCOMMON_START = .;
        build/us/segments/main.o(COMMON*);
        . = ALIGN(., 0x20);
        mainCOMMON_END = .;
        mainCOMMON_SIZE = ABSOLUTE(mainCOMMON_END - mainCOMMON_START);
    }

    main_noload_VRAM_END = .;
    main_noload_VRAM_SIZE = ABSOLUTE(main_noload_VRAM_END - main_noload_VRAM);

    __romPos += SIZEOF(.main);
    __romPos = ALIGN(__romPos, 0x40);
    . = ALIGN(., 0x40);
    main_VRAM_END = .;
    main_VRAM_SIZE = ABSOLUTE(main_VRAM_END - main_VRAM);
    main_ROM_END = __romPos;
    main_ROM_SIZE = ABSOLUTE(main_ROM_END - main_ROM_START);

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

ENTRY(ENTRYPOINT);

ASSERT((main_VRAM_END <= 0x80400000), "Error: VRAM is larger than 4 MiB");
