SECTIONS
{
    __romPos = 0x0;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;

    .boot : AT(boot_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        boot_TEXT_START = .;
        build/src/boot/boot_main.o(.text*);
        build/src/libultra.o(.text*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        boot_DATA_START = .;
        build/src/boot/boot_main.o(.data*);
        build/src/libultra.o(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        . = ALIGN(., 0x40);
        boot_RODATA_START = .;
        build/src/boot/boot_main.o(.rodata*);
        build/src/libultra.o(.rodata*);
        . = ALIGN(., 0x80);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        . = ALIGN(., 0x40);
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
        . = ALIGN(., 0x40);
        boot_SBSS_START = .;
        build/src/boot/boot_main.o(.sbss*);
        build/src/libultra.o(.sbss*);
        . = ALIGN(., 0x20);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        . = ALIGN(., 0x40);
        boot_SCOMMON_START = .;
        build/src/boot/boot_main.o(.scommon*);
        build/src/libultra.o(.scommon*);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        boot_BSS_START = .;
        build/src/boot/boot_main.o(.bss*);
        build/src/libultra.o(.bss*);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        . = ALIGN(., 0x40);
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
        . = ALIGN(., 0x40);
        kanji_TEXT_START = .;
        build/src/kanji/kanji.o(.text*);
        kanji_TEXT_END = .;
        kanji_TEXT_SIZE = ABSOLUTE(kanji_TEXT_END - kanji_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        kanji_DATA_START = .;
        build/src/kanji/kanji.o(.data*);
        kanji_DATA_END = .;
        kanji_DATA_SIZE = ABSOLUTE(kanji_DATA_END - kanji_DATA_START);

        . = ALIGN(., 0x40);
        kanji_RODATA_START = .;
        build/src/kanji/kanji.o(.rodata*);
        . = ALIGN(., 0x80);
        kanji_RODATA_END = .;
        kanji_RODATA_SIZE = ABSOLUTE(kanji_RODATA_END - kanji_RODATA_START);

        . = ALIGN(., 0x40);
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
        . = ALIGN(., 0x40);
        kanji_SBSS_START = .;
        build/src/kanji/kanji.o(.sbss*);
        . = ALIGN(., 0x20);
        kanji_SBSS_END = .;
        kanji_SBSS_SIZE = ABSOLUTE(kanji_SBSS_END - kanji_SBSS_START);

        . = ALIGN(., 0x40);
        kanji_SCOMMON_START = .;
        build/src/kanji/kanji.o(.scommon*);
        kanji_SCOMMON_END = .;
        kanji_SCOMMON_SIZE = ABSOLUTE(kanji_SCOMMON_END - kanji_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        kanji_BSS_START = .;
        build/src/kanji/kanji.o(.bss*);
        kanji_BSS_END = .;
        kanji_BSS_SIZE = ABSOLUTE(kanji_BSS_END - kanji_BSS_START);

        . = ALIGN(., 0x40);
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
        . = ALIGN(., 0x40);
        main_TEXT_START = .;
        build/src/main/main.o(.text*);
        build/src/main/dmadata.o(.text*);
        build/asm/main/util.o(.text*);
        . = ALIGN(., 0x20);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        main_DATA_START = .;
        build/src/main/main.o(.data*);
        build/src/main/dmadata.o(.data*);
        build/asm/main/util.o(.data*);
        . = ALIGN(., 0x20);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

        . = ALIGN(., 0x40);
        main_RODATA_START = .;
        build/src/main/main.o(.rodata*);
        build/src/main/dmadata.o(.rodata*);
        build/asm/main/util.o(.rodata*);
        . = ALIGN(., 0x20);
        . = ALIGN(., 0x80);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

        . = ALIGN(., 0x40);
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
        . = ALIGN(., 0x40);
        main_SBSS_START = .;
        build/src/main/main.o(.sbss*);
        build/src/main/dmadata.o(.sbss*);
        build/asm/main/util.o(.sbss*);
        . = ALIGN(., 0x20);
        . = ALIGN(., 0x20);
        main_SBSS_END = .;
        main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

        . = ALIGN(., 0x40);
        main_SCOMMON_START = .;
        build/src/main/main.o(.scommon*);
        build/src/main/dmadata.o(.scommon*);
        build/asm/main/util.o(.scommon*);
        . = ALIGN(., 0x20);
        main_SCOMMON_END = .;
        main_SCOMMON_SIZE = ABSOLUTE(main_SCOMMON_END - main_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        main_BSS_START = .;
        build/src/main/main.o(.bss*);
        build/src/main/dmadata.o(.bss*);
        build/asm/main/util.o(.bss*);
        . = ALIGN(., 0x20);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);

        . = ALIGN(., 0x40);
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

    engine_ROM_START = __romPos;
    engine_VRAM = ADDR(.engine);
    engine_alloc_VRAM = .;

    .engine : AT(engine_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        engine_TEXT_START = .;
        build/src/engine/engine_cod.o(.text*);
        build/src/engine/engine_buffers.o(.text*);
        engine_TEXT_END = .;
        engine_TEXT_SIZE = ABSOLUTE(engine_TEXT_END - engine_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        engine_DATA_START = .;
        build/src/engine/engine_cod.o(.data*);
        build/src/engine/engine_buffers.o(.data*);
        engine_DATA_END = .;
        engine_DATA_SIZE = ABSOLUTE(engine_DATA_END - engine_DATA_START);

        . = ALIGN(., 0x40);
        engine_RODATA_START = .;
        build/src/engine/engine_cod.o(.rodata*);
        build/src/engine/engine_buffers.o(.rodata*);
        . = ALIGN(., 0x80);
        engine_RODATA_END = .;
        engine_RODATA_SIZE = ABSOLUTE(engine_RODATA_END - engine_RODATA_START);

        . = ALIGN(., 0x40);
        engine_SDATA_START = .;
        build/src/engine/engine_cod.o(.sdata*);
        build/src/engine/engine_buffers.o(.sdata*);
        engine_SDATA_END = .;
        engine_SDATA_SIZE = ABSOLUTE(engine_SDATA_END - engine_SDATA_START);
    }

    engine_alloc_VRAM_END = .;
    engine_alloc_VRAM_SIZE = ABSOLUTE(engine_alloc_VRAM_END - engine_alloc_VRAM);

    engine_noload_VRAM = .;

    .engine.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        engine_SBSS_START = .;
        build/src/engine/engine_cod.o(.sbss*);
        build/src/engine/engine_buffers.o(.sbss*);
        . = ALIGN(., 0x20);
        engine_SBSS_END = .;
        engine_SBSS_SIZE = ABSOLUTE(engine_SBSS_END - engine_SBSS_START);

        . = ALIGN(., 0x40);
        engine_SCOMMON_START = .;
        build/src/engine/engine_cod.o(.scommon*);
        build/src/engine/engine_buffers.o(.scommon*);
        engine_SCOMMON_END = .;
        engine_SCOMMON_SIZE = ABSOLUTE(engine_SCOMMON_END - engine_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        engine_BSS_START = .;
        build/src/engine/engine_cod.o(.bss*);
        build/src/engine/engine_buffers.o(.bss*);
        engine_BSS_END = .;
        engine_BSS_SIZE = ABSOLUTE(engine_BSS_END - engine_BSS_START);

        . = ALIGN(., 0x40);
        engineCOMMON_START = .;
        build/src/engine/engine_cod.o(COMMON*);
        build/src/engine/engine_buffers.o(COMMON*);
        engineCOMMON_END = .;
        engineCOMMON_SIZE = ABSOLUTE(engineCOMMON_END - engineCOMMON_START);
    }

    engine_noload_VRAM_END = .;
    engine_noload_VRAM_SIZE = ABSOLUTE(engine_noload_VRAM_END - engine_noload_VRAM);

    __romPos += SIZEOF(.engine);
    engine_VRAM_END = .;
    engine_VRAM_SIZE = ABSOLUTE(engine_VRAM_END - engine_VRAM);
    engine_ROM_END = __romPos;
    engine_ROM_SIZE = ABSOLUTE(engine_ROM_END - engine_ROM_START);

    engine2_ROM_START = __romPos;
    engine2_VRAM = ADDR(.engine2);
    engine2_alloc_VRAM = .;

    .engine2 : AT(engine2_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        engine2_TEXT_START = .;
        build/src/engine2/engine_the_sequel.o(.text*);
        engine2_TEXT_END = .;
        engine2_TEXT_SIZE = ABSOLUTE(engine2_TEXT_END - engine2_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        engine2_DATA_START = .;
        build/src/engine2/engine_the_sequel.o(.data*);
        engine2_DATA_END = .;
        engine2_DATA_SIZE = ABSOLUTE(engine2_DATA_END - engine2_DATA_START);

        . = ALIGN(., 0x40);
        engine2_RODATA_START = .;
        build/src/engine2/engine_the_sequel.o(.rodata*);
        . = ALIGN(., 0x80);
        engine2_RODATA_END = .;
        engine2_RODATA_SIZE = ABSOLUTE(engine2_RODATA_END - engine2_RODATA_START);

        . = ALIGN(., 0x40);
        engine2_SDATA_START = .;
        build/src/engine2/engine_the_sequel.o(.sdata*);
        engine2_SDATA_END = .;
        engine2_SDATA_SIZE = ABSOLUTE(engine2_SDATA_END - engine2_SDATA_START);
    }

    engine2_alloc_VRAM_END = .;
    engine2_alloc_VRAM_SIZE = ABSOLUTE(engine2_alloc_VRAM_END - engine2_alloc_VRAM);

    engine2_noload_VRAM = .;

    .engine2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        engine2_SBSS_START = .;
        build/src/engine2/engine_the_sequel.o(.sbss*);
        . = ALIGN(., 0x20);
        engine2_SBSS_END = .;
        engine2_SBSS_SIZE = ABSOLUTE(engine2_SBSS_END - engine2_SBSS_START);

        . = ALIGN(., 0x40);
        engine2_SCOMMON_START = .;
        build/src/engine2/engine_the_sequel.o(.scommon*);
        engine2_SCOMMON_END = .;
        engine2_SCOMMON_SIZE = ABSOLUTE(engine2_SCOMMON_END - engine2_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        engine2_BSS_START = .;
        build/src/engine2/engine_the_sequel.o(.bss*);
        engine2_BSS_END = .;
        engine2_BSS_SIZE = ABSOLUTE(engine2_BSS_END - engine2_BSS_START);

        . = ALIGN(., 0x40);
        engine2COMMON_START = .;
        build/src/engine2/engine_the_sequel.o(COMMON*);
        engine2COMMON_END = .;
        engine2COMMON_SIZE = ABSOLUTE(engine2COMMON_END - engine2COMMON_START);
    }

    engine2_noload_VRAM_END = .;
    engine2_noload_VRAM_SIZE = ABSOLUTE(engine2_noload_VRAM_END - engine2_noload_VRAM);

    __romPos += SIZEOF(.engine2);
    engine2_VRAM_END = .;
    engine2_VRAM_SIZE = ABSOLUTE(engine2_VRAM_END - engine2_VRAM);
    engine2_ROM_END = __romPos;
    engine2_ROM_SIZE = ABSOLUTE(engine2_ROM_END - engine2_ROM_START);

    enemy_1_ROM_START = __romPos;
    enemy_1_VRAM = ADDR(.enemy_1);
    enemy_1_alloc_VRAM = .;

    .enemy_1 gBufferEnemy : AT(enemy_1_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        enemy_1_TEXT_START = .;
        build/src/enemy_1/enemy_1.o(.text*);
        enemy_1_TEXT_END = .;
        enemy_1_TEXT_SIZE = ABSOLUTE(enemy_1_TEXT_END - enemy_1_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        enemy_1_DATA_START = .;
        build/src/enemy_1/enemy_1.o(.data*);
        enemy_1_DATA_END = .;
        enemy_1_DATA_SIZE = ABSOLUTE(enemy_1_DATA_END - enemy_1_DATA_START);

        . = ALIGN(., 0x40);
        enemy_1_RODATA_START = .;
        build/src/enemy_1/enemy_1.o(.rodata*);
        . = ALIGN(., 0x80);
        enemy_1_RODATA_END = .;
        enemy_1_RODATA_SIZE = ABSOLUTE(enemy_1_RODATA_END - enemy_1_RODATA_START);

        . = ALIGN(., 0x40);
        enemy_1_SDATA_START = .;
        build/src/enemy_1/enemy_1.o(.sdata*);
        enemy_1_SDATA_END = .;
        enemy_1_SDATA_SIZE = ABSOLUTE(enemy_1_SDATA_END - enemy_1_SDATA_START);
    }

    enemy_1_alloc_VRAM_END = .;
    enemy_1_alloc_VRAM_SIZE = ABSOLUTE(enemy_1_alloc_VRAM_END - enemy_1_alloc_VRAM);

    enemy_1_noload_VRAM = .;

    .enemy_1.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        enemy_1_SBSS_START = .;
        build/src/enemy_1/enemy_1.o(.sbss*);
        . = ALIGN(., 0x20);
        enemy_1_SBSS_END = .;
        enemy_1_SBSS_SIZE = ABSOLUTE(enemy_1_SBSS_END - enemy_1_SBSS_START);

        . = ALIGN(., 0x40);
        enemy_1_SCOMMON_START = .;
        build/src/enemy_1/enemy_1.o(.scommon*);
        enemy_1_SCOMMON_END = .;
        enemy_1_SCOMMON_SIZE = ABSOLUTE(enemy_1_SCOMMON_END - enemy_1_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        enemy_1_BSS_START = .;
        build/src/enemy_1/enemy_1.o(.bss*);
        enemy_1_BSS_END = .;
        enemy_1_BSS_SIZE = ABSOLUTE(enemy_1_BSS_END - enemy_1_BSS_START);

        . = ALIGN(., 0x40);
        enemy_1COMMON_START = .;
        build/src/enemy_1/enemy_1.o(COMMON*);
        enemy_1COMMON_END = .;
        enemy_1COMMON_SIZE = ABSOLUTE(enemy_1COMMON_END - enemy_1COMMON_START);
    }

    enemy_1_noload_VRAM_END = .;
    enemy_1_noload_VRAM_SIZE = ABSOLUTE(enemy_1_noload_VRAM_END - enemy_1_noload_VRAM);

    __romPos += SIZEOF(.enemy_1);
    enemy_1_VRAM_END = .;
    enemy_1_VRAM_SIZE = ABSOLUTE(enemy_1_VRAM_END - enemy_1_VRAM);
    enemy_1_ROM_END = __romPos;
    enemy_1_ROM_SIZE = ABSOLUTE(enemy_1_ROM_END - enemy_1_ROM_START);

    enemy_2_ROM_START = __romPos;
    enemy_2_VRAM = ADDR(.enemy_2);
    enemy_2_alloc_VRAM = .;

    .enemy_2 gBufferEnemy : AT(enemy_2_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        enemy_2_TEXT_START = .;
        build/src/enemy_2/enemy_2.o(.text*);
        enemy_2_TEXT_END = .;
        enemy_2_TEXT_SIZE = ABSOLUTE(enemy_2_TEXT_END - enemy_2_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        enemy_2_DATA_START = .;
        build/src/enemy_2/enemy_2.o(.data*);
        enemy_2_DATA_END = .;
        enemy_2_DATA_SIZE = ABSOLUTE(enemy_2_DATA_END - enemy_2_DATA_START);

        . = ALIGN(., 0x40);
        enemy_2_RODATA_START = .;
        build/src/enemy_2/enemy_2.o(.rodata*);
        . = ALIGN(., 0x80);
        enemy_2_RODATA_END = .;
        enemy_2_RODATA_SIZE = ABSOLUTE(enemy_2_RODATA_END - enemy_2_RODATA_START);

        . = ALIGN(., 0x40);
        enemy_2_SDATA_START = .;
        build/src/enemy_2/enemy_2.o(.sdata*);
        enemy_2_SDATA_END = .;
        enemy_2_SDATA_SIZE = ABSOLUTE(enemy_2_SDATA_END - enemy_2_SDATA_START);
    }

    enemy_2_alloc_VRAM_END = .;
    enemy_2_alloc_VRAM_SIZE = ABSOLUTE(enemy_2_alloc_VRAM_END - enemy_2_alloc_VRAM);

    enemy_2_noload_VRAM = .;

    .enemy_2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        enemy_2_SBSS_START = .;
        build/src/enemy_2/enemy_2.o(.sbss*);
        . = ALIGN(., 0x20);
        enemy_2_SBSS_END = .;
        enemy_2_SBSS_SIZE = ABSOLUTE(enemy_2_SBSS_END - enemy_2_SBSS_START);

        . = ALIGN(., 0x40);
        enemy_2_SCOMMON_START = .;
        build/src/enemy_2/enemy_2.o(.scommon*);
        enemy_2_SCOMMON_END = .;
        enemy_2_SCOMMON_SIZE = ABSOLUTE(enemy_2_SCOMMON_END - enemy_2_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        enemy_2_BSS_START = .;
        build/src/enemy_2/enemy_2.o(.bss*);
        enemy_2_BSS_END = .;
        enemy_2_BSS_SIZE = ABSOLUTE(enemy_2_BSS_END - enemy_2_BSS_START);

        . = ALIGN(., 0x40);
        enemy_2COMMON_START = .;
        build/src/enemy_2/enemy_2.o(COMMON*);
        enemy_2COMMON_END = .;
        enemy_2COMMON_SIZE = ABSOLUTE(enemy_2COMMON_END - enemy_2COMMON_START);
    }

    enemy_2_noload_VRAM_END = .;
    enemy_2_noload_VRAM_SIZE = ABSOLUTE(enemy_2_noload_VRAM_END - enemy_2_noload_VRAM);

    __romPos += SIZEOF(.enemy_2);
    enemy_2_VRAM_END = .;
    enemy_2_VRAM_SIZE = ABSOLUTE(enemy_2_VRAM_END - enemy_2_VRAM);
    enemy_2_ROM_END = __romPos;
    enemy_2_ROM_SIZE = ABSOLUTE(enemy_2_ROM_END - enemy_2_ROM_START);

    enemy_3_ROM_START = __romPos;
    enemy_3_VRAM = ADDR(.enemy_3);
    enemy_3_alloc_VRAM = .;

    .enemy_3 gBufferEnemy : AT(enemy_3_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        enemy_3_TEXT_START = .;
        build/src/enemy_2/enemy_2.o(.text*);
        enemy_3_TEXT_END = .;
        enemy_3_TEXT_SIZE = ABSOLUTE(enemy_3_TEXT_END - enemy_3_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        enemy_3_DATA_START = .;
        build/src/enemy_2/enemy_2.o(.data*);
        enemy_3_DATA_END = .;
        enemy_3_DATA_SIZE = ABSOLUTE(enemy_3_DATA_END - enemy_3_DATA_START);

        . = ALIGN(., 0x40);
        enemy_3_RODATA_START = .;
        build/src/enemy_2/enemy_2.o(.rodata*);
        . = ALIGN(., 0x80);
        enemy_3_RODATA_END = .;
        enemy_3_RODATA_SIZE = ABSOLUTE(enemy_3_RODATA_END - enemy_3_RODATA_START);

        . = ALIGN(., 0x40);
        enemy_3_SDATA_START = .;
        build/src/enemy_2/enemy_2.o(.sdata*);
        enemy_3_SDATA_END = .;
        enemy_3_SDATA_SIZE = ABSOLUTE(enemy_3_SDATA_END - enemy_3_SDATA_START);
    }

    enemy_3_alloc_VRAM_END = .;
    enemy_3_alloc_VRAM_SIZE = ABSOLUTE(enemy_3_alloc_VRAM_END - enemy_3_alloc_VRAM);

    enemy_3_noload_VRAM = .;

    .enemy_3.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        enemy_3_SBSS_START = .;
        build/src/enemy_2/enemy_2.o(.sbss*);
        . = ALIGN(., 0x20);
        enemy_3_SBSS_END = .;
        enemy_3_SBSS_SIZE = ABSOLUTE(enemy_3_SBSS_END - enemy_3_SBSS_START);

        . = ALIGN(., 0x40);
        enemy_3_SCOMMON_START = .;
        build/src/enemy_2/enemy_2.o(.scommon*);
        enemy_3_SCOMMON_END = .;
        enemy_3_SCOMMON_SIZE = ABSOLUTE(enemy_3_SCOMMON_END - enemy_3_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        enemy_3_BSS_START = .;
        build/src/enemy_2/enemy_2.o(.bss*);
        enemy_3_BSS_END = .;
        enemy_3_BSS_SIZE = ABSOLUTE(enemy_3_BSS_END - enemy_3_BSS_START);

        . = ALIGN(., 0x40);
        enemy_3COMMON_START = .;
        build/src/enemy_2/enemy_2.o(COMMON*);
        enemy_3COMMON_END = .;
        enemy_3COMMON_SIZE = ABSOLUTE(enemy_3COMMON_END - enemy_3COMMON_START);
    }

    enemy_3_noload_VRAM_END = .;
    enemy_3_noload_VRAM_SIZE = ABSOLUTE(enemy_3_noload_VRAM_END - enemy_3_noload_VRAM);

    __romPos += SIZEOF(.enemy_3);
    enemy_3_VRAM_END = .;
    enemy_3_VRAM_SIZE = ABSOLUTE(enemy_3_VRAM_END - enemy_3_VRAM);
    enemy_3_ROM_END = __romPos;
    enemy_3_ROM_SIZE = ABSOLUTE(enemy_3_ROM_END - enemy_3_ROM_START);

    stage_1_ROM_START = __romPos;
    stage_1_VRAM = ADDR(.stage_1);
    stage_1_alloc_VRAM = .;

    .stage_1 gBufferStage : AT(stage_1_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        stage_1_TEXT_START = .;
        build/src/stage_1/stage_1.o(.text*);
        stage_1_TEXT_END = .;
        stage_1_TEXT_SIZE = ABSOLUTE(stage_1_TEXT_END - stage_1_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        stage_1_DATA_START = .;
        build/src/stage_1/stage_1.o(.data*);
        stage_1_DATA_END = .;
        stage_1_DATA_SIZE = ABSOLUTE(stage_1_DATA_END - stage_1_DATA_START);

        . = ALIGN(., 0x40);
        stage_1_RODATA_START = .;
        build/src/stage_1/stage_1.o(.rodata*);
        . = ALIGN(., 0x80);
        stage_1_RODATA_END = .;
        stage_1_RODATA_SIZE = ABSOLUTE(stage_1_RODATA_END - stage_1_RODATA_START);

        . = ALIGN(., 0x40);
        stage_1_SDATA_START = .;
        build/src/stage_1/stage_1.o(.sdata*);
        stage_1_SDATA_END = .;
        stage_1_SDATA_SIZE = ABSOLUTE(stage_1_SDATA_END - stage_1_SDATA_START);
    }

    stage_1_alloc_VRAM_END = .;
    stage_1_alloc_VRAM_SIZE = ABSOLUTE(stage_1_alloc_VRAM_END - stage_1_alloc_VRAM);

    stage_1_noload_VRAM = .;

    .stage_1.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        stage_1_SBSS_START = .;
        build/src/stage_1/stage_1.o(.sbss*);
        . = ALIGN(., 0x20);
        stage_1_SBSS_END = .;
        stage_1_SBSS_SIZE = ABSOLUTE(stage_1_SBSS_END - stage_1_SBSS_START);

        . = ALIGN(., 0x40);
        stage_1_SCOMMON_START = .;
        build/src/stage_1/stage_1.o(.scommon*);
        stage_1_SCOMMON_END = .;
        stage_1_SCOMMON_SIZE = ABSOLUTE(stage_1_SCOMMON_END - stage_1_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        stage_1_BSS_START = .;
        build/src/stage_1/stage_1.o(.bss*);
        stage_1_BSS_END = .;
        stage_1_BSS_SIZE = ABSOLUTE(stage_1_BSS_END - stage_1_BSS_START);

        . = ALIGN(., 0x40);
        stage_1COMMON_START = .;
        build/src/stage_1/stage_1.o(COMMON*);
        stage_1COMMON_END = .;
        stage_1COMMON_SIZE = ABSOLUTE(stage_1COMMON_END - stage_1COMMON_START);
    }

    stage_1_noload_VRAM_END = .;
    stage_1_noload_VRAM_SIZE = ABSOLUTE(stage_1_noload_VRAM_END - stage_1_noload_VRAM);

    __romPos += SIZEOF(.stage_1);
    stage_1_VRAM_END = .;
    stage_1_VRAM_SIZE = ABSOLUTE(stage_1_VRAM_END - stage_1_VRAM);
    stage_1_ROM_END = __romPos;
    stage_1_ROM_SIZE = ABSOLUTE(stage_1_ROM_END - stage_1_ROM_START);

    stage_2_ROM_START = __romPos;
    stage_2_VRAM = ADDR(.stage_2);
    stage_2_alloc_VRAM = .;

    .stage_2 gBufferStage : AT(stage_2_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        stage_2_TEXT_START = .;
        build/src/stage_2/stage_2.o(.text*);
        stage_2_TEXT_END = .;
        stage_2_TEXT_SIZE = ABSOLUTE(stage_2_TEXT_END - stage_2_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        stage_2_DATA_START = .;
        build/src/stage_2/stage_2.o(.data*);
        stage_2_DATA_END = .;
        stage_2_DATA_SIZE = ABSOLUTE(stage_2_DATA_END - stage_2_DATA_START);

        . = ALIGN(., 0x40);
        stage_2_RODATA_START = .;
        build/src/stage_2/stage_2.o(.rodata*);
        . = ALIGN(., 0x80);
        stage_2_RODATA_END = .;
        stage_2_RODATA_SIZE = ABSOLUTE(stage_2_RODATA_END - stage_2_RODATA_START);

        . = ALIGN(., 0x40);
        stage_2_SDATA_START = .;
        build/src/stage_2/stage_2.o(.sdata*);
        stage_2_SDATA_END = .;
        stage_2_SDATA_SIZE = ABSOLUTE(stage_2_SDATA_END - stage_2_SDATA_START);
    }

    stage_2_alloc_VRAM_END = .;
    stage_2_alloc_VRAM_SIZE = ABSOLUTE(stage_2_alloc_VRAM_END - stage_2_alloc_VRAM);

    stage_2_noload_VRAM = .;

    .stage_2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        stage_2_SBSS_START = .;
        build/src/stage_2/stage_2.o(.sbss*);
        . = ALIGN(., 0x20);
        stage_2_SBSS_END = .;
        stage_2_SBSS_SIZE = ABSOLUTE(stage_2_SBSS_END - stage_2_SBSS_START);

        . = ALIGN(., 0x40);
        stage_2_SCOMMON_START = .;
        build/src/stage_2/stage_2.o(.scommon*);
        stage_2_SCOMMON_END = .;
        stage_2_SCOMMON_SIZE = ABSOLUTE(stage_2_SCOMMON_END - stage_2_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        stage_2_BSS_START = .;
        build/src/stage_2/stage_2.o(.bss*);
        stage_2_BSS_END = .;
        stage_2_BSS_SIZE = ABSOLUTE(stage_2_BSS_END - stage_2_BSS_START);

        . = ALIGN(., 0x40);
        stage_2COMMON_START = .;
        build/src/stage_2/stage_2.o(COMMON*);
        stage_2COMMON_END = .;
        stage_2COMMON_SIZE = ABSOLUTE(stage_2COMMON_END - stage_2COMMON_START);
    }

    stage_2_noload_VRAM_END = .;
    stage_2_noload_VRAM_SIZE = ABSOLUTE(stage_2_noload_VRAM_END - stage_2_noload_VRAM);

    __romPos += SIZEOF(.stage_2);
    stage_2_VRAM_END = .;
    stage_2_VRAM_SIZE = ABSOLUTE(stage_2_VRAM_END - stage_2_VRAM);
    stage_2_ROM_END = __romPos;
    stage_2_ROM_SIZE = ABSOLUTE(stage_2_ROM_END - stage_2_ROM_START);

    stage_3_ROM_START = __romPos;
    stage_3_VRAM = ADDR(.stage_3);
    stage_3_alloc_VRAM = .;

    .stage_3 gBufferStage : AT(stage_3_ROM_START)
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        stage_3_TEXT_START = .;
        build/src/stage_2/stage_2.o(.text*);
        stage_3_TEXT_END = .;
        stage_3_TEXT_SIZE = ABSOLUTE(stage_3_TEXT_END - stage_3_TEXT_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x400);
        stage_3_DATA_START = .;
        build/src/stage_2/stage_2.o(.data*);
        stage_3_DATA_END = .;
        stage_3_DATA_SIZE = ABSOLUTE(stage_3_DATA_END - stage_3_DATA_START);

        . = ALIGN(., 0x40);
        stage_3_RODATA_START = .;
        build/src/stage_2/stage_2.o(.rodata*);
        . = ALIGN(., 0x80);
        stage_3_RODATA_END = .;
        stage_3_RODATA_SIZE = ABSOLUTE(stage_3_RODATA_END - stage_3_RODATA_START);

        . = ALIGN(., 0x40);
        stage_3_SDATA_START = .;
        build/src/stage_2/stage_2.o(.sdata*);
        stage_3_SDATA_END = .;
        stage_3_SDATA_SIZE = ABSOLUTE(stage_3_SDATA_END - stage_3_SDATA_START);
    }

    stage_3_alloc_VRAM_END = .;
    stage_3_alloc_VRAM_SIZE = ABSOLUTE(stage_3_alloc_VRAM_END - stage_3_alloc_VRAM);

    stage_3_noload_VRAM = .;

    .stage_3.noload (NOLOAD) :
    {
        FILL(0x00000000);
        . = ALIGN(., 0x40);
        stage_3_SBSS_START = .;
        build/src/stage_2/stage_2.o(.sbss*);
        . = ALIGN(., 0x20);
        stage_3_SBSS_END = .;
        stage_3_SBSS_SIZE = ABSOLUTE(stage_3_SBSS_END - stage_3_SBSS_START);

        . = ALIGN(., 0x40);
        stage_3_SCOMMON_START = .;
        build/src/stage_2/stage_2.o(.scommon*);
        stage_3_SCOMMON_END = .;
        stage_3_SCOMMON_SIZE = ABSOLUTE(stage_3_SCOMMON_END - stage_3_SCOMMON_START);

        . = ALIGN(., 0x40);
        . = ALIGN(., 0x8000);
        stage_3_BSS_START = .;
        build/src/stage_2/stage_2.o(.bss*);
        stage_3_BSS_END = .;
        stage_3_BSS_SIZE = ABSOLUTE(stage_3_BSS_END - stage_3_BSS_START);

        . = ALIGN(., 0x40);
        stage_3COMMON_START = .;
        build/src/stage_2/stage_2.o(COMMON*);
        stage_3COMMON_END = .;
        stage_3COMMON_SIZE = ABSOLUTE(stage_3COMMON_END - stage_3COMMON_START);
    }

    stage_3_noload_VRAM_END = .;
    stage_3_noload_VRAM_SIZE = ABSOLUTE(stage_3_noload_VRAM_END - stage_3_noload_VRAM);

    __romPos += SIZEOF(.stage_3);
    stage_3_VRAM_END = .;
    stage_3_VRAM_SIZE = ABSOLUTE(stage_3_VRAM_END - stage_3_VRAM);
    stage_3_ROM_END = __romPos;
    stage_3_ROM_SIZE = ABSOLUTE(stage_3_ROM_END - stage_3_ROM_START);

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
