SECTIONS
{
    __romPos = 0x0;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;

    .boot : AT(boot_ROM_START)
    {
        FILL(0x00000000);
        boot_TEXT_START = .;
        build/src/boot/boot_main.o(.text*);
        build/src/libultra.o(.text*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/src/boot/boot_main.o(.data*);
        build/src/libultra.o(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/src/boot/boot_main.o(.rodata*);
        build/src/libultra.o(.rodata*);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/src/boot/boot_main.o(.sdata*);
        build/src/libultra.o(.sdata*);
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
        build/src/boot/boot_main.o(.sbss*);
        build/src/libultra.o(.sbss*);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/src/boot/boot_main.o(.scommon*);
        build/src/libultra.o(.scommon*);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/src/boot/boot_main.o(.bss*);
        build/src/libultra.o(.bss*);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/src/boot/boot_main.o(COMMON*);
        build/src/libultra.o(COMMON*);
        bootCOMMON_END = .;
        bootCOMMON_SIZE = ABSOLUTE(bootCOMMON_END - bootCOMMON_START);
    }

    boot_noload_VRAM_END = .;
    boot_noload_VRAM_SIZE = ABSOLUTE(boot_noload_VRAM_END - boot_noload_VRAM);

    __romPos += SIZEOF(.boot);
    boot_VRAM_END = .;
    boot_VRAM_SIZE = ABSOLUTE(boot_VRAM_END - boot_VRAM);
    boot_ROM_END = __romPos;
    boot_ROM_SIZE = ABSOLUTE(boot_ROM_END - boot_ROM_START);

    kanji_ROM_START = __romPos;
    kanji_VRAM = ADDR(.kanji);
    kanji_alloc_VRAM = .;

    .kanji : AT(kanji_ROM_START)
    {
        FILL(0x00000000);
        kanji_TEXT_START = .;
        build/src/kanji/kanji.o(.text*);
        kanji_TEXT_END = .;
        kanji_TEXT_SIZE = ABSOLUTE(kanji_TEXT_END - kanji_TEXT_START);

        kanji_DATA_START = .;
        build/src/kanji/kanji.o(.data*);
        kanji_DATA_END = .;
        kanji_DATA_SIZE = ABSOLUTE(kanji_DATA_END - kanji_DATA_START);

        kanji_RODATA_START = .;
        build/src/kanji/kanji.o(.rodata*);
        kanji_RODATA_END = .;
        kanji_RODATA_SIZE = ABSOLUTE(kanji_RODATA_END - kanji_RODATA_START);

        kanji_SDATA_START = .;
        build/src/kanji/kanji.o(.sdata*);
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
        build/src/kanji/kanji.o(.sbss*);
        kanji_SBSS_END = .;
        kanji_SBSS_SIZE = ABSOLUTE(kanji_SBSS_END - kanji_SBSS_START);

        kanji_SCOMMON_START = .;
        build/src/kanji/kanji.o(.scommon*);
        kanji_SCOMMON_END = .;
        kanji_SCOMMON_SIZE = ABSOLUTE(kanji_SCOMMON_END - kanji_SCOMMON_START);

        kanji_BSS_START = .;
        build/src/kanji/kanji.o(.bss*);
        kanji_BSS_END = .;
        kanji_BSS_SIZE = ABSOLUTE(kanji_BSS_END - kanji_BSS_START);

        kanjiCOMMON_START = .;
        build/src/kanji/kanji.o(COMMON*);
        kanjiCOMMON_END = .;
        kanjiCOMMON_SIZE = ABSOLUTE(kanjiCOMMON_END - kanjiCOMMON_START);
    }

    kanji_noload_VRAM_END = .;
    kanji_noload_VRAM_SIZE = ABSOLUTE(kanji_noload_VRAM_END - kanji_noload_VRAM);

    __romPos += SIZEOF(.kanji);
    kanji_VRAM_END = .;
    kanji_VRAM_SIZE = ABSOLUTE(kanji_VRAM_END - kanji_VRAM);
    kanji_ROM_END = __romPos;
    kanji_ROM_SIZE = ABSOLUTE(kanji_ROM_END - kanji_ROM_START);

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    main_alloc_VRAM = .;

    .main boot_VRAM_END : AT(main_ROM_START)
    {
        FILL(0x00000000);
        main_TEXT_START = .;
        build/src/main/main.o(.text*);
        build/src/main/dmadata.o(.text*);
        build/asm/main/util.o(.text*);
        . = ALIGN(., 0x20);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

        main_DATA_START = .;
        build/src/main/main.o(.data*);
        build/src/main/dmadata.o(.data*);
        build/asm/main/util.o(.data*);
        . = ALIGN(., 0x20);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

        main_RODATA_START = .;
        build/src/main/main.o(.rodata*);
        build/src/main/dmadata.o(.rodata*);
        build/asm/main/util.o(.rodata*);
        . = ALIGN(., 0x20);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

        main_SDATA_START = .;
        build/src/main/main.o(.sdata*);
        build/src/main/dmadata.o(.sdata*);
        build/asm/main/util.o(.sdata*);
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
        main_SBSS_START = .;
        build/src/main/main.o(.sbss*);
        build/src/main/dmadata.o(.sbss*);
        build/asm/main/util.o(.sbss*);
        . = ALIGN(., 0x20);
        main_SBSS_END = .;
        main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

        main_SCOMMON_START = .;
        build/src/main/main.o(.scommon*);
        build/src/main/dmadata.o(.scommon*);
        build/asm/main/util.o(.scommon*);
        . = ALIGN(., 0x20);
        main_SCOMMON_END = .;
        main_SCOMMON_SIZE = ABSOLUTE(main_SCOMMON_END - main_SCOMMON_START);

        main_BSS_START = .;
        build/src/main/main.o(.bss*);
        build/src/main/dmadata.o(.bss*);
        build/asm/main/util.o(.bss*);
        . = ALIGN(., 0x20);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);

        mainCOMMON_START = .;
        build/src/main/main.o(COMMON*);
        build/src/main/dmadata.o(COMMON*);
        build/asm/main/util.o(COMMON*);
        . = ALIGN(., 0x20);
        mainCOMMON_END = .;
        mainCOMMON_SIZE = ABSOLUTE(mainCOMMON_END - mainCOMMON_START);
    }

    main_noload_VRAM_END = .;
    main_noload_VRAM_SIZE = ABSOLUTE(main_noload_VRAM_END - main_noload_VRAM);

    __romPos += SIZEOF(.main);
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
