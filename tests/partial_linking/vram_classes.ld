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
        . = ALIGN(., 0x10);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/segments/boot.o(.data*);
        . = ALIGN(., 0x10);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/segments/boot.o(.rodata*);
        . = ALIGN(., 0x10);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/segments/boot.o(.sdata*);
        . = ALIGN(., 0x10);
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
        . = ALIGN(., 0x10);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/segments/boot.o(.scommon*);
        . = ALIGN(., 0x10);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/segments/boot.o(.bss*);
        . = ALIGN(., 0x10);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/segments/boot.o(COMMON*);
        . = ALIGN(., 0x10);
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

    battle_area2_VRAM_CLASS_START = Vine1Base;
    battle_area2_VRAM_CLASS_END = 0x00000000;

    omo2_1_ROM_START = __romPos;
    omo2_1_VRAM = ADDR(.omo2_1);
    omo2_1_alloc_VRAM = .;

    .omo2_1 battle_area2_VRAM_CLASS_START : AT(omo2_1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        omo2_1_TEXT_START = .;
        build/segments/omo2_1.o(.text*);
        . = ALIGN(., 0x10);
        omo2_1_TEXT_END = .;
        omo2_1_TEXT_SIZE = ABSOLUTE(omo2_1_TEXT_END - omo2_1_TEXT_START);

        omo2_1_DATA_START = .;
        build/segments/omo2_1.o(.data*);
        . = ALIGN(., 0x10);
        omo2_1_DATA_END = .;
        omo2_1_DATA_SIZE = ABSOLUTE(omo2_1_DATA_END - omo2_1_DATA_START);

        omo2_1_RODATA_START = .;
        build/segments/omo2_1.o(.rodata*);
        . = ALIGN(., 0x10);
        omo2_1_RODATA_END = .;
        omo2_1_RODATA_SIZE = ABSOLUTE(omo2_1_RODATA_END - omo2_1_RODATA_START);

        omo2_1_SDATA_START = .;
        build/segments/omo2_1.o(.sdata*);
        . = ALIGN(., 0x10);
        omo2_1_SDATA_END = .;
        omo2_1_SDATA_SIZE = ABSOLUTE(omo2_1_SDATA_END - omo2_1_SDATA_START);
    }

    omo2_1_alloc_VRAM_END = .;
    omo2_1_alloc_VRAM_SIZE = ABSOLUTE(omo2_1_alloc_VRAM_END - omo2_1_alloc_VRAM);

    omo2_1_noload_VRAM = .;

    .omo2_1.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        omo2_1_SBSS_START = .;
        build/segments/omo2_1.o(.sbss*);
        . = ALIGN(., 0x10);
        omo2_1_SBSS_END = .;
        omo2_1_SBSS_SIZE = ABSOLUTE(omo2_1_SBSS_END - omo2_1_SBSS_START);

        omo2_1_SCOMMON_START = .;
        build/segments/omo2_1.o(.scommon*);
        . = ALIGN(., 0x10);
        omo2_1_SCOMMON_END = .;
        omo2_1_SCOMMON_SIZE = ABSOLUTE(omo2_1_SCOMMON_END - omo2_1_SCOMMON_START);

        omo2_1_BSS_START = .;
        build/segments/omo2_1.o(.bss*);
        . = ALIGN(., 0x10);
        omo2_1_BSS_END = .;
        omo2_1_BSS_SIZE = ABSOLUTE(omo2_1_BSS_END - omo2_1_BSS_START);

        omo2_1COMMON_START = .;
        build/segments/omo2_1.o(COMMON*);
        . = ALIGN(., 0x10);
        omo2_1COMMON_END = .;
        omo2_1COMMON_SIZE = ABSOLUTE(omo2_1COMMON_END - omo2_1COMMON_START);
    }

    omo2_1_noload_VRAM_END = .;
    omo2_1_noload_VRAM_SIZE = ABSOLUTE(omo2_1_noload_VRAM_END - omo2_1_noload_VRAM);
    omo2_1_VRAM_END = .;
    omo2_1_VRAM_SIZE = ABSOLUTE(omo2_1_VRAM_END - omo2_1_VRAM);
    __romPos += SIZEOF(.omo2_1);
    omo2_1_ROM_END = __romPos;
    omo2_1_ROM_SIZE = ABSOLUTE(omo2_1_ROM_END - omo2_1_ROM_START);

    battle_area2_VRAM_CLASS_END = MAX(battle_area2_VRAM_CLASS_END, omo2_1_VRAM_END);

    omo2_2_ROM_START = __romPos;
    omo2_2_VRAM = ADDR(.omo2_2);
    omo2_2_alloc_VRAM = .;

    .omo2_2 battle_area2_VRAM_CLASS_START : AT(omo2_2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        omo2_2_TEXT_START = .;
        build/segments/omo2_2.o(.text*);
        . = ALIGN(., 0x10);
        omo2_2_TEXT_END = .;
        omo2_2_TEXT_SIZE = ABSOLUTE(omo2_2_TEXT_END - omo2_2_TEXT_START);

        omo2_2_DATA_START = .;
        build/segments/omo2_2.o(.data*);
        . = ALIGN(., 0x10);
        omo2_2_DATA_END = .;
        omo2_2_DATA_SIZE = ABSOLUTE(omo2_2_DATA_END - omo2_2_DATA_START);

        omo2_2_RODATA_START = .;
        build/segments/omo2_2.o(.rodata*);
        . = ALIGN(., 0x10);
        omo2_2_RODATA_END = .;
        omo2_2_RODATA_SIZE = ABSOLUTE(omo2_2_RODATA_END - omo2_2_RODATA_START);

        omo2_2_SDATA_START = .;
        build/segments/omo2_2.o(.sdata*);
        . = ALIGN(., 0x10);
        omo2_2_SDATA_END = .;
        omo2_2_SDATA_SIZE = ABSOLUTE(omo2_2_SDATA_END - omo2_2_SDATA_START);
    }

    omo2_2_alloc_VRAM_END = .;
    omo2_2_alloc_VRAM_SIZE = ABSOLUTE(omo2_2_alloc_VRAM_END - omo2_2_alloc_VRAM);

    omo2_2_noload_VRAM = .;

    .omo2_2.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        omo2_2_SBSS_START = .;
        build/segments/omo2_2.o(.sbss*);
        . = ALIGN(., 0x10);
        omo2_2_SBSS_END = .;
        omo2_2_SBSS_SIZE = ABSOLUTE(omo2_2_SBSS_END - omo2_2_SBSS_START);

        omo2_2_SCOMMON_START = .;
        build/segments/omo2_2.o(.scommon*);
        . = ALIGN(., 0x10);
        omo2_2_SCOMMON_END = .;
        omo2_2_SCOMMON_SIZE = ABSOLUTE(omo2_2_SCOMMON_END - omo2_2_SCOMMON_START);

        omo2_2_BSS_START = .;
        build/segments/omo2_2.o(.bss*);
        . = ALIGN(., 0x10);
        omo2_2_BSS_END = .;
        omo2_2_BSS_SIZE = ABSOLUTE(omo2_2_BSS_END - omo2_2_BSS_START);

        omo2_2COMMON_START = .;
        build/segments/omo2_2.o(COMMON*);
        . = ALIGN(., 0x10);
        omo2_2COMMON_END = .;
        omo2_2COMMON_SIZE = ABSOLUTE(omo2_2COMMON_END - omo2_2COMMON_START);
    }

    omo2_2_noload_VRAM_END = .;
    omo2_2_noload_VRAM_SIZE = ABSOLUTE(omo2_2_noload_VRAM_END - omo2_2_noload_VRAM);
    omo2_2_VRAM_END = .;
    omo2_2_VRAM_SIZE = ABSOLUTE(omo2_2_VRAM_END - omo2_2_VRAM);
    __romPos += SIZEOF(.omo2_2);
    omo2_2_ROM_END = __romPos;
    omo2_2_ROM_SIZE = ABSOLUTE(omo2_2_ROM_END - omo2_2_ROM_START);

    battle_area2_VRAM_CLASS_END = MAX(battle_area2_VRAM_CLASS_END, omo2_2_VRAM_END);

    omo2_3_ROM_START = __romPos;
    omo2_3_VRAM = ADDR(.omo2_3);
    omo2_3_alloc_VRAM = .;

    .omo2_3 battle_area2_VRAM_CLASS_START : AT(omo2_3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        omo2_3_TEXT_START = .;
        build/segments/omo2_3.o(.text*);
        . = ALIGN(., 0x10);
        omo2_3_TEXT_END = .;
        omo2_3_TEXT_SIZE = ABSOLUTE(omo2_3_TEXT_END - omo2_3_TEXT_START);

        omo2_3_DATA_START = .;
        build/segments/omo2_3.o(.data*);
        . = ALIGN(., 0x10);
        omo2_3_DATA_END = .;
        omo2_3_DATA_SIZE = ABSOLUTE(omo2_3_DATA_END - omo2_3_DATA_START);

        omo2_3_RODATA_START = .;
        build/segments/omo2_3.o(.rodata*);
        . = ALIGN(., 0x10);
        omo2_3_RODATA_END = .;
        omo2_3_RODATA_SIZE = ABSOLUTE(omo2_3_RODATA_END - omo2_3_RODATA_START);

        omo2_3_SDATA_START = .;
        build/segments/omo2_3.o(.sdata*);
        . = ALIGN(., 0x10);
        omo2_3_SDATA_END = .;
        omo2_3_SDATA_SIZE = ABSOLUTE(omo2_3_SDATA_END - omo2_3_SDATA_START);
    }

    omo2_3_alloc_VRAM_END = .;
    omo2_3_alloc_VRAM_SIZE = ABSOLUTE(omo2_3_alloc_VRAM_END - omo2_3_alloc_VRAM);

    omo2_3_noload_VRAM = .;

    .omo2_3.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        omo2_3_SBSS_START = .;
        build/segments/omo2_3.o(.sbss*);
        . = ALIGN(., 0x10);
        omo2_3_SBSS_END = .;
        omo2_3_SBSS_SIZE = ABSOLUTE(omo2_3_SBSS_END - omo2_3_SBSS_START);

        omo2_3_SCOMMON_START = .;
        build/segments/omo2_3.o(.scommon*);
        . = ALIGN(., 0x10);
        omo2_3_SCOMMON_END = .;
        omo2_3_SCOMMON_SIZE = ABSOLUTE(omo2_3_SCOMMON_END - omo2_3_SCOMMON_START);

        omo2_3_BSS_START = .;
        build/segments/omo2_3.o(.bss*);
        . = ALIGN(., 0x10);
        omo2_3_BSS_END = .;
        omo2_3_BSS_SIZE = ABSOLUTE(omo2_3_BSS_END - omo2_3_BSS_START);

        omo2_3COMMON_START = .;
        build/segments/omo2_3.o(COMMON*);
        . = ALIGN(., 0x10);
        omo2_3COMMON_END = .;
        omo2_3COMMON_SIZE = ABSOLUTE(omo2_3COMMON_END - omo2_3COMMON_START);
    }

    omo2_3_noload_VRAM_END = .;
    omo2_3_noload_VRAM_SIZE = ABSOLUTE(omo2_3_noload_VRAM_END - omo2_3_noload_VRAM);
    omo2_3_VRAM_END = .;
    omo2_3_VRAM_SIZE = ABSOLUTE(omo2_3_VRAM_END - omo2_3_VRAM);
    __romPos += SIZEOF(.omo2_3);
    omo2_3_ROM_END = __romPos;
    omo2_3_ROM_SIZE = ABSOLUTE(omo2_3_ROM_END - omo2_3_ROM_START);

    battle_area2_VRAM_CLASS_END = MAX(battle_area2_VRAM_CLASS_END, omo2_3_VRAM_END);

    battle_partner_VRAM_CLASS_START = 0x80238000;
    battle_partner_VRAM_CLASS_END = 0x00000000;

    battle_partner_goompa_ROM_START = __romPos;
    battle_partner_goompa_VRAM = ADDR(.battle_partner_goompa);
    battle_partner_goompa_alloc_VRAM = .;

    .battle_partner_goompa battle_partner_VRAM_CLASS_START : AT(battle_partner_goompa_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_partner_goompa_TEXT_START = .;
        build/segments/battle_partner_goompa.o(.text*);
        . = ALIGN(., 0x10);
        battle_partner_goompa_TEXT_END = .;
        battle_partner_goompa_TEXT_SIZE = ABSOLUTE(battle_partner_goompa_TEXT_END - battle_partner_goompa_TEXT_START);

        battle_partner_goompa_DATA_START = .;
        build/segments/battle_partner_goompa.o(.data*);
        . = ALIGN(., 0x10);
        battle_partner_goompa_DATA_END = .;
        battle_partner_goompa_DATA_SIZE = ABSOLUTE(battle_partner_goompa_DATA_END - battle_partner_goompa_DATA_START);

        battle_partner_goompa_RODATA_START = .;
        build/segments/battle_partner_goompa.o(.rodata*);
        . = ALIGN(., 0x10);
        battle_partner_goompa_RODATA_END = .;
        battle_partner_goompa_RODATA_SIZE = ABSOLUTE(battle_partner_goompa_RODATA_END - battle_partner_goompa_RODATA_START);

        battle_partner_goompa_SDATA_START = .;
        build/segments/battle_partner_goompa.o(.sdata*);
        . = ALIGN(., 0x10);
        battle_partner_goompa_SDATA_END = .;
        battle_partner_goompa_SDATA_SIZE = ABSOLUTE(battle_partner_goompa_SDATA_END - battle_partner_goompa_SDATA_START);
    }

    battle_partner_goompa_alloc_VRAM_END = .;
    battle_partner_goompa_alloc_VRAM_SIZE = ABSOLUTE(battle_partner_goompa_alloc_VRAM_END - battle_partner_goompa_alloc_VRAM);

    battle_partner_goompa_noload_VRAM = .;

    .battle_partner_goompa.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_partner_goompa_SBSS_START = .;
        build/segments/battle_partner_goompa.o(.sbss*);
        . = ALIGN(., 0x10);
        battle_partner_goompa_SBSS_END = .;
        battle_partner_goompa_SBSS_SIZE = ABSOLUTE(battle_partner_goompa_SBSS_END - battle_partner_goompa_SBSS_START);

        battle_partner_goompa_SCOMMON_START = .;
        build/segments/battle_partner_goompa.o(.scommon*);
        . = ALIGN(., 0x10);
        battle_partner_goompa_SCOMMON_END = .;
        battle_partner_goompa_SCOMMON_SIZE = ABSOLUTE(battle_partner_goompa_SCOMMON_END - battle_partner_goompa_SCOMMON_START);

        battle_partner_goompa_BSS_START = .;
        build/segments/battle_partner_goompa.o(.bss*);
        . = ALIGN(., 0x10);
        battle_partner_goompa_BSS_END = .;
        battle_partner_goompa_BSS_SIZE = ABSOLUTE(battle_partner_goompa_BSS_END - battle_partner_goompa_BSS_START);

        battle_partner_goompaCOMMON_START = .;
        build/segments/battle_partner_goompa.o(COMMON*);
        . = ALIGN(., 0x10);
        battle_partner_goompaCOMMON_END = .;
        battle_partner_goompaCOMMON_SIZE = ABSOLUTE(battle_partner_goompaCOMMON_END - battle_partner_goompaCOMMON_START);
    }

    battle_partner_goompa_noload_VRAM_END = .;
    battle_partner_goompa_noload_VRAM_SIZE = ABSOLUTE(battle_partner_goompa_noload_VRAM_END - battle_partner_goompa_noload_VRAM);
    battle_partner_goompa_VRAM_END = .;
    battle_partner_goompa_VRAM_SIZE = ABSOLUTE(battle_partner_goompa_VRAM_END - battle_partner_goompa_VRAM);
    __romPos += SIZEOF(.battle_partner_goompa);
    battle_partner_goompa_ROM_END = __romPos;
    battle_partner_goompa_ROM_SIZE = ABSOLUTE(battle_partner_goompa_ROM_END - battle_partner_goompa_ROM_START);

    battle_partner_VRAM_CLASS_END = MAX(battle_partner_VRAM_CLASS_END, battle_partner_goompa_VRAM_END);

    battle_partner_goombario_ROM_START = __romPos;
    battle_partner_goombario_VRAM = ADDR(.battle_partner_goombario);
    battle_partner_goombario_alloc_VRAM = .;

    .battle_partner_goombario battle_partner_VRAM_CLASS_START : AT(battle_partner_goombario_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_partner_goombario_TEXT_START = .;
        build/segments/battle_partner_goombario.o(.text*);
        . = ALIGN(., 0x10);
        battle_partner_goombario_TEXT_END = .;
        battle_partner_goombario_TEXT_SIZE = ABSOLUTE(battle_partner_goombario_TEXT_END - battle_partner_goombario_TEXT_START);

        battle_partner_goombario_DATA_START = .;
        build/segments/battle_partner_goombario.o(.data*);
        . = ALIGN(., 0x10);
        battle_partner_goombario_DATA_END = .;
        battle_partner_goombario_DATA_SIZE = ABSOLUTE(battle_partner_goombario_DATA_END - battle_partner_goombario_DATA_START);

        battle_partner_goombario_RODATA_START = .;
        build/segments/battle_partner_goombario.o(.rodata*);
        . = ALIGN(., 0x10);
        battle_partner_goombario_RODATA_END = .;
        battle_partner_goombario_RODATA_SIZE = ABSOLUTE(battle_partner_goombario_RODATA_END - battle_partner_goombario_RODATA_START);

        battle_partner_goombario_SDATA_START = .;
        build/segments/battle_partner_goombario.o(.sdata*);
        . = ALIGN(., 0x10);
        battle_partner_goombario_SDATA_END = .;
        battle_partner_goombario_SDATA_SIZE = ABSOLUTE(battle_partner_goombario_SDATA_END - battle_partner_goombario_SDATA_START);
    }

    battle_partner_goombario_alloc_VRAM_END = .;
    battle_partner_goombario_alloc_VRAM_SIZE = ABSOLUTE(battle_partner_goombario_alloc_VRAM_END - battle_partner_goombario_alloc_VRAM);

    battle_partner_goombario_noload_VRAM = .;

    .battle_partner_goombario.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_partner_goombario_SBSS_START = .;
        build/segments/battle_partner_goombario.o(.sbss*);
        . = ALIGN(., 0x10);
        battle_partner_goombario_SBSS_END = .;
        battle_partner_goombario_SBSS_SIZE = ABSOLUTE(battle_partner_goombario_SBSS_END - battle_partner_goombario_SBSS_START);

        battle_partner_goombario_SCOMMON_START = .;
        build/segments/battle_partner_goombario.o(.scommon*);
        . = ALIGN(., 0x10);
        battle_partner_goombario_SCOMMON_END = .;
        battle_partner_goombario_SCOMMON_SIZE = ABSOLUTE(battle_partner_goombario_SCOMMON_END - battle_partner_goombario_SCOMMON_START);

        battle_partner_goombario_BSS_START = .;
        build/segments/battle_partner_goombario.o(.bss*);
        . = ALIGN(., 0x10);
        battle_partner_goombario_BSS_END = .;
        battle_partner_goombario_BSS_SIZE = ABSOLUTE(battle_partner_goombario_BSS_END - battle_partner_goombario_BSS_START);

        battle_partner_goombarioCOMMON_START = .;
        build/segments/battle_partner_goombario.o(COMMON*);
        . = ALIGN(., 0x10);
        battle_partner_goombarioCOMMON_END = .;
        battle_partner_goombarioCOMMON_SIZE = ABSOLUTE(battle_partner_goombarioCOMMON_END - battle_partner_goombarioCOMMON_START);
    }

    battle_partner_goombario_noload_VRAM_END = .;
    battle_partner_goombario_noload_VRAM_SIZE = ABSOLUTE(battle_partner_goombario_noload_VRAM_END - battle_partner_goombario_noload_VRAM);
    battle_partner_goombario_VRAM_END = .;
    battle_partner_goombario_VRAM_SIZE = ABSOLUTE(battle_partner_goombario_VRAM_END - battle_partner_goombario_VRAM);
    __romPos += SIZEOF(.battle_partner_goombario);
    battle_partner_goombario_ROM_END = __romPos;
    battle_partner_goombario_ROM_SIZE = ABSOLUTE(battle_partner_goombario_ROM_END - battle_partner_goombario_ROM_START);

    battle_partner_VRAM_CLASS_END = MAX(battle_partner_VRAM_CLASS_END, battle_partner_goombario_VRAM_END);

    battle_partner_kooper_ROM_START = __romPos;
    battle_partner_kooper_VRAM = ADDR(.battle_partner_kooper);
    battle_partner_kooper_alloc_VRAM = .;

    .battle_partner_kooper battle_partner_VRAM_CLASS_START : AT(battle_partner_kooper_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_partner_kooper_TEXT_START = .;
        build/segments/battle_partner_kooper.o(.text*);
        . = ALIGN(., 0x10);
        battle_partner_kooper_TEXT_END = .;
        battle_partner_kooper_TEXT_SIZE = ABSOLUTE(battle_partner_kooper_TEXT_END - battle_partner_kooper_TEXT_START);

        battle_partner_kooper_DATA_START = .;
        build/segments/battle_partner_kooper.o(.data*);
        . = ALIGN(., 0x10);
        battle_partner_kooper_DATA_END = .;
        battle_partner_kooper_DATA_SIZE = ABSOLUTE(battle_partner_kooper_DATA_END - battle_partner_kooper_DATA_START);

        battle_partner_kooper_RODATA_START = .;
        build/segments/battle_partner_kooper.o(.rodata*);
        . = ALIGN(., 0x10);
        battle_partner_kooper_RODATA_END = .;
        battle_partner_kooper_RODATA_SIZE = ABSOLUTE(battle_partner_kooper_RODATA_END - battle_partner_kooper_RODATA_START);

        battle_partner_kooper_SDATA_START = .;
        build/segments/battle_partner_kooper.o(.sdata*);
        . = ALIGN(., 0x10);
        battle_partner_kooper_SDATA_END = .;
        battle_partner_kooper_SDATA_SIZE = ABSOLUTE(battle_partner_kooper_SDATA_END - battle_partner_kooper_SDATA_START);
    }

    battle_partner_kooper_alloc_VRAM_END = .;
    battle_partner_kooper_alloc_VRAM_SIZE = ABSOLUTE(battle_partner_kooper_alloc_VRAM_END - battle_partner_kooper_alloc_VRAM);

    battle_partner_kooper_noload_VRAM = .;

    .battle_partner_kooper.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_partner_kooper_SBSS_START = .;
        build/segments/battle_partner_kooper.o(.sbss*);
        . = ALIGN(., 0x10);
        battle_partner_kooper_SBSS_END = .;
        battle_partner_kooper_SBSS_SIZE = ABSOLUTE(battle_partner_kooper_SBSS_END - battle_partner_kooper_SBSS_START);

        battle_partner_kooper_SCOMMON_START = .;
        build/segments/battle_partner_kooper.o(.scommon*);
        . = ALIGN(., 0x10);
        battle_partner_kooper_SCOMMON_END = .;
        battle_partner_kooper_SCOMMON_SIZE = ABSOLUTE(battle_partner_kooper_SCOMMON_END - battle_partner_kooper_SCOMMON_START);

        battle_partner_kooper_BSS_START = .;
        build/segments/battle_partner_kooper.o(.bss*);
        . = ALIGN(., 0x10);
        battle_partner_kooper_BSS_END = .;
        battle_partner_kooper_BSS_SIZE = ABSOLUTE(battle_partner_kooper_BSS_END - battle_partner_kooper_BSS_START);

        battle_partner_kooperCOMMON_START = .;
        build/segments/battle_partner_kooper.o(COMMON*);
        . = ALIGN(., 0x10);
        battle_partner_kooperCOMMON_END = .;
        battle_partner_kooperCOMMON_SIZE = ABSOLUTE(battle_partner_kooperCOMMON_END - battle_partner_kooperCOMMON_START);
    }

    battle_partner_kooper_noload_VRAM_END = .;
    battle_partner_kooper_noload_VRAM_SIZE = ABSOLUTE(battle_partner_kooper_noload_VRAM_END - battle_partner_kooper_noload_VRAM);
    battle_partner_kooper_VRAM_END = .;
    battle_partner_kooper_VRAM_SIZE = ABSOLUTE(battle_partner_kooper_VRAM_END - battle_partner_kooper_VRAM);
    __romPos += SIZEOF(.battle_partner_kooper);
    battle_partner_kooper_ROM_END = __romPos;
    battle_partner_kooper_ROM_SIZE = ABSOLUTE(battle_partner_kooper_ROM_END - battle_partner_kooper_ROM_START);

    battle_partner_VRAM_CLASS_END = MAX(battle_partner_VRAM_CLASS_END, battle_partner_kooper_VRAM_END);

    battle_code_VRAM_CLASS_START = 0x00000000;
    battle_code_VRAM_CLASS_START = MAX(battle_code_VRAM_CLASS_START, battle_partner_VRAM_CLASS_END);
    battle_code_VRAM_CLASS_END = 0x00000000;

    battle_code_ROM_START = __romPos;
    battle_code_VRAM = ADDR(.battle_code);
    battle_code_alloc_VRAM = .;

    .battle_code battle_code_VRAM_CLASS_START : AT(battle_code_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_code_TEXT_START = .;
        build/segments/battle_code.o(.text*);
        . = ALIGN(., 0x10);
        battle_code_TEXT_END = .;
        battle_code_TEXT_SIZE = ABSOLUTE(battle_code_TEXT_END - battle_code_TEXT_START);

        battle_code_DATA_START = .;
        build/segments/battle_code.o(.data*);
        . = ALIGN(., 0x10);
        battle_code_DATA_END = .;
        battle_code_DATA_SIZE = ABSOLUTE(battle_code_DATA_END - battle_code_DATA_START);

        battle_code_RODATA_START = .;
        build/segments/battle_code.o(.rodata*);
        . = ALIGN(., 0x10);
        battle_code_RODATA_END = .;
        battle_code_RODATA_SIZE = ABSOLUTE(battle_code_RODATA_END - battle_code_RODATA_START);

        battle_code_SDATA_START = .;
        build/segments/battle_code.o(.sdata*);
        . = ALIGN(., 0x10);
        battle_code_SDATA_END = .;
        battle_code_SDATA_SIZE = ABSOLUTE(battle_code_SDATA_END - battle_code_SDATA_START);
    }

    battle_code_alloc_VRAM_END = .;
    battle_code_alloc_VRAM_SIZE = ABSOLUTE(battle_code_alloc_VRAM_END - battle_code_alloc_VRAM);

    battle_code_noload_VRAM = .;

    .battle_code.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        battle_code_SBSS_START = .;
        build/segments/battle_code.o(.sbss*);
        . = ALIGN(., 0x10);
        battle_code_SBSS_END = .;
        battle_code_SBSS_SIZE = ABSOLUTE(battle_code_SBSS_END - battle_code_SBSS_START);

        battle_code_SCOMMON_START = .;
        build/segments/battle_code.o(.scommon*);
        . = ALIGN(., 0x10);
        battle_code_SCOMMON_END = .;
        battle_code_SCOMMON_SIZE = ABSOLUTE(battle_code_SCOMMON_END - battle_code_SCOMMON_START);

        battle_code_BSS_START = .;
        build/segments/battle_code.o(.bss*);
        . = ALIGN(., 0x10);
        battle_code_BSS_END = .;
        battle_code_BSS_SIZE = ABSOLUTE(battle_code_BSS_END - battle_code_BSS_START);

        battle_codeCOMMON_START = .;
        build/segments/battle_code.o(COMMON*);
        . = ALIGN(., 0x10);
        battle_codeCOMMON_END = .;
        battle_codeCOMMON_SIZE = ABSOLUTE(battle_codeCOMMON_END - battle_codeCOMMON_START);
    }

    battle_code_noload_VRAM_END = .;
    battle_code_noload_VRAM_SIZE = ABSOLUTE(battle_code_noload_VRAM_END - battle_code_noload_VRAM);
    battle_code_VRAM_END = .;
    battle_code_VRAM_SIZE = ABSOLUTE(battle_code_VRAM_END - battle_code_VRAM);
    __romPos += SIZEOF(.battle_code);
    battle_code_ROM_END = __romPos;
    battle_code_ROM_SIZE = ABSOLUTE(battle_code_ROM_END - battle_code_ROM_START);

    battle_code_VRAM_CLASS_END = MAX(battle_code_VRAM_CLASS_END, battle_code_VRAM_END);

    heaps2_VRAM_CLASS_START = 0x80267FF0;
    heaps2_VRAM_CLASS_END = 0x00000000;

    heaps2_ROM_START = __romPos;
    heaps2_VRAM = ADDR(.heaps2);
    heaps2_alloc_VRAM = .;

    .heaps2 heaps2_VRAM_CLASS_START : AT(heaps2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        heaps2_TEXT_START = .;
        build/segments/heaps2.o(.text*);
        . = ALIGN(., 0x10);
        heaps2_TEXT_END = .;
        heaps2_TEXT_SIZE = ABSOLUTE(heaps2_TEXT_END - heaps2_TEXT_START);

        heaps2_DATA_START = .;
        build/segments/heaps2.o(.data*);
        . = ALIGN(., 0x10);
        heaps2_DATA_END = .;
        heaps2_DATA_SIZE = ABSOLUTE(heaps2_DATA_END - heaps2_DATA_START);

        heaps2_RODATA_START = .;
        build/segments/heaps2.o(.rodata*);
        . = ALIGN(., 0x10);
        heaps2_RODATA_END = .;
        heaps2_RODATA_SIZE = ABSOLUTE(heaps2_RODATA_END - heaps2_RODATA_START);

        heaps2_SDATA_START = .;
        build/segments/heaps2.o(.sdata*);
        . = ALIGN(., 0x10);
        heaps2_SDATA_END = .;
        heaps2_SDATA_SIZE = ABSOLUTE(heaps2_SDATA_END - heaps2_SDATA_START);
    }

    heaps2_alloc_VRAM_END = .;
    heaps2_alloc_VRAM_SIZE = ABSOLUTE(heaps2_alloc_VRAM_END - heaps2_alloc_VRAM);

    heaps2_noload_VRAM = .;

    .heaps2.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        heaps2_SBSS_START = .;
        build/segments/heaps2.o(.sbss*);
        . = ALIGN(., 0x10);
        heaps2_SBSS_END = .;
        heaps2_SBSS_SIZE = ABSOLUTE(heaps2_SBSS_END - heaps2_SBSS_START);

        heaps2_SCOMMON_START = .;
        build/segments/heaps2.o(.scommon*);
        . = ALIGN(., 0x10);
        heaps2_SCOMMON_END = .;
        heaps2_SCOMMON_SIZE = ABSOLUTE(heaps2_SCOMMON_END - heaps2_SCOMMON_START);

        heaps2_BSS_START = .;
        build/segments/heaps2.o(.bss*);
        . = ALIGN(., 0x10);
        heaps2_BSS_END = .;
        heaps2_BSS_SIZE = ABSOLUTE(heaps2_BSS_END - heaps2_BSS_START);

        heaps2COMMON_START = .;
        build/segments/heaps2.o(COMMON*);
        . = ALIGN(., 0x10);
        heaps2COMMON_END = .;
        heaps2COMMON_SIZE = ABSOLUTE(heaps2COMMON_END - heaps2COMMON_START);
    }

    heaps2_noload_VRAM_END = .;
    heaps2_noload_VRAM_SIZE = ABSOLUTE(heaps2_noload_VRAM_END - heaps2_noload_VRAM);
    heaps2_VRAM_END = .;
    heaps2_VRAM_SIZE = ABSOLUTE(heaps2_VRAM_END - heaps2_VRAM);
    __romPos += SIZEOF(.heaps2);
    heaps2_ROM_END = __romPos;
    heaps2_ROM_SIZE = ABSOLUTE(heaps2_ROM_END - heaps2_ROM_START);

    heaps2_VRAM_CLASS_END = MAX(heaps2_VRAM_CLASS_END, heaps2_VRAM_END);

    world_script_api_VRAM_CLASS_START = 0x00000000;
    world_script_api_VRAM_CLASS_START = MAX(world_script_api_VRAM_CLASS_START, heaps2_VRAM_CLASS_END);
    world_script_api_VRAM_CLASS_END = 0x00000000;

    world_script_api_ROM_START = __romPos;
    world_script_api_VRAM = ADDR(.world_script_api);
    world_script_api_alloc_VRAM = .;

    .world_script_api world_script_api_VRAM_CLASS_START : AT(world_script_api_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        world_script_api_TEXT_START = .;
        build/segments/world_script_api.o(.text*);
        . = ALIGN(., 0x10);
        world_script_api_TEXT_END = .;
        world_script_api_TEXT_SIZE = ABSOLUTE(world_script_api_TEXT_END - world_script_api_TEXT_START);

        world_script_api_DATA_START = .;
        build/segments/world_script_api.o(.data*);
        . = ALIGN(., 0x10);
        world_script_api_DATA_END = .;
        world_script_api_DATA_SIZE = ABSOLUTE(world_script_api_DATA_END - world_script_api_DATA_START);

        world_script_api_RODATA_START = .;
        build/segments/world_script_api.o(.rodata*);
        . = ALIGN(., 0x10);
        world_script_api_RODATA_END = .;
        world_script_api_RODATA_SIZE = ABSOLUTE(world_script_api_RODATA_END - world_script_api_RODATA_START);

        world_script_api_SDATA_START = .;
        build/segments/world_script_api.o(.sdata*);
        . = ALIGN(., 0x10);
        world_script_api_SDATA_END = .;
        world_script_api_SDATA_SIZE = ABSOLUTE(world_script_api_SDATA_END - world_script_api_SDATA_START);
    }

    world_script_api_alloc_VRAM_END = .;
    world_script_api_alloc_VRAM_SIZE = ABSOLUTE(world_script_api_alloc_VRAM_END - world_script_api_alloc_VRAM);

    world_script_api_noload_VRAM = .;

    .world_script_api.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        world_script_api_SBSS_START = .;
        build/segments/world_script_api.o(.sbss*);
        . = ALIGN(., 0x10);
        world_script_api_SBSS_END = .;
        world_script_api_SBSS_SIZE = ABSOLUTE(world_script_api_SBSS_END - world_script_api_SBSS_START);

        world_script_api_SCOMMON_START = .;
        build/segments/world_script_api.o(.scommon*);
        . = ALIGN(., 0x10);
        world_script_api_SCOMMON_END = .;
        world_script_api_SCOMMON_SIZE = ABSOLUTE(world_script_api_SCOMMON_END - world_script_api_SCOMMON_START);

        world_script_api_BSS_START = .;
        build/segments/world_script_api.o(.bss*);
        . = ALIGN(., 0x10);
        world_script_api_BSS_END = .;
        world_script_api_BSS_SIZE = ABSOLUTE(world_script_api_BSS_END - world_script_api_BSS_START);

        world_script_apiCOMMON_START = .;
        build/segments/world_script_api.o(COMMON*);
        . = ALIGN(., 0x10);
        world_script_apiCOMMON_END = .;
        world_script_apiCOMMON_SIZE = ABSOLUTE(world_script_apiCOMMON_END - world_script_apiCOMMON_START);
    }

    world_script_api_noload_VRAM_END = .;
    world_script_api_noload_VRAM_SIZE = ABSOLUTE(world_script_api_noload_VRAM_END - world_script_api_noload_VRAM);
    world_script_api_VRAM_END = .;
    world_script_api_VRAM_SIZE = ABSOLUTE(world_script_api_VRAM_END - world_script_api_VRAM);
    __romPos += SIZEOF(.world_script_api);
    world_script_api_ROM_END = __romPos;
    world_script_api_ROM_SIZE = ABSOLUTE(world_script_api_ROM_END - world_script_api_ROM_START);

    world_script_api_VRAM_CLASS_END = MAX(world_script_api_VRAM_CLASS_END, world_script_api_VRAM_END);

    texture_memory_VRAM_CLASS_START = 0x00000000;
    texture_memory_VRAM_CLASS_START = MAX(texture_memory_VRAM_CLASS_START, battle_code_VRAM_CLASS_END);
    texture_memory_VRAM_CLASS_START = MAX(texture_memory_VRAM_CLASS_START, world_script_api_VRAM_CLASS_END);
    texture_memory_VRAM_CLASS_END = 0x00000000;

    texture_memory_ROM_START = __romPos;
    texture_memory_VRAM = ADDR(.texture_memory);
    texture_memory_alloc_VRAM = .;

    .texture_memory texture_memory_VRAM_CLASS_START : AT(texture_memory_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        texture_memory_TEXT_START = .;
        build/segments/texture_memory.o(.text*);
        . = ALIGN(., 0x10);
        texture_memory_TEXT_END = .;
        texture_memory_TEXT_SIZE = ABSOLUTE(texture_memory_TEXT_END - texture_memory_TEXT_START);

        texture_memory_DATA_START = .;
        build/segments/texture_memory.o(.data*);
        . = ALIGN(., 0x10);
        texture_memory_DATA_END = .;
        texture_memory_DATA_SIZE = ABSOLUTE(texture_memory_DATA_END - texture_memory_DATA_START);

        texture_memory_RODATA_START = .;
        build/segments/texture_memory.o(.rodata*);
        . = ALIGN(., 0x10);
        texture_memory_RODATA_END = .;
        texture_memory_RODATA_SIZE = ABSOLUTE(texture_memory_RODATA_END - texture_memory_RODATA_START);

        texture_memory_SDATA_START = .;
        build/segments/texture_memory.o(.sdata*);
        . = ALIGN(., 0x10);
        texture_memory_SDATA_END = .;
        texture_memory_SDATA_SIZE = ABSOLUTE(texture_memory_SDATA_END - texture_memory_SDATA_START);
    }

    texture_memory_alloc_VRAM_END = .;
    texture_memory_alloc_VRAM_SIZE = ABSOLUTE(texture_memory_alloc_VRAM_END - texture_memory_alloc_VRAM);

    texture_memory_noload_VRAM = .;

    .texture_memory.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        texture_memory_SBSS_START = .;
        build/segments/texture_memory.o(.sbss*);
        . = ALIGN(., 0x10);
        texture_memory_SBSS_END = .;
        texture_memory_SBSS_SIZE = ABSOLUTE(texture_memory_SBSS_END - texture_memory_SBSS_START);

        texture_memory_SCOMMON_START = .;
        build/segments/texture_memory.o(.scommon*);
        . = ALIGN(., 0x10);
        texture_memory_SCOMMON_END = .;
        texture_memory_SCOMMON_SIZE = ABSOLUTE(texture_memory_SCOMMON_END - texture_memory_SCOMMON_START);

        texture_memory_BSS_START = .;
        build/segments/texture_memory.o(.bss*);
        . = ALIGN(., 0x10);
        texture_memory_BSS_END = .;
        texture_memory_BSS_SIZE = ABSOLUTE(texture_memory_BSS_END - texture_memory_BSS_START);

        texture_memoryCOMMON_START = .;
        build/segments/texture_memory.o(COMMON*);
        . = ALIGN(., 0x10);
        texture_memoryCOMMON_END = .;
        texture_memoryCOMMON_SIZE = ABSOLUTE(texture_memoryCOMMON_END - texture_memoryCOMMON_START);
    }

    texture_memory_noload_VRAM_END = .;
    texture_memory_noload_VRAM_SIZE = ABSOLUTE(texture_memory_noload_VRAM_END - texture_memory_noload_VRAM);
    texture_memory_VRAM_END = .;
    texture_memory_VRAM_SIZE = ABSOLUTE(texture_memory_VRAM_END - texture_memory_VRAM);
    __romPos += SIZEOF(.texture_memory);
    texture_memory_ROM_END = __romPos;
    texture_memory_ROM_SIZE = ABSOLUTE(texture_memory_ROM_END - texture_memory_ROM_START);

    texture_memory_VRAM_CLASS_END = MAX(texture_memory_VRAM_CLASS_END, texture_memory_VRAM_END);

    segment_05_VRAM_CLASS_START = 0x05000000;
    segment_05_VRAM_CLASS_END = 0x00000000;

    assets1_ROM_START = __romPos;
    assets1_VRAM = ADDR(.assets1);
    assets1_alloc_VRAM = .;

    .assets1 segment_05_VRAM_CLASS_START : AT(assets1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        assets1_TEXT_START = .;
        build/segments/assets1.o(.text*);
        . = ALIGN(., 0x10);
        assets1_TEXT_END = .;
        assets1_TEXT_SIZE = ABSOLUTE(assets1_TEXT_END - assets1_TEXT_START);

        assets1_DATA_START = .;
        build/segments/assets1.o(.data*);
        . = ALIGN(., 0x10);
        assets1_DATA_END = .;
        assets1_DATA_SIZE = ABSOLUTE(assets1_DATA_END - assets1_DATA_START);

        assets1_RODATA_START = .;
        build/segments/assets1.o(.rodata*);
        . = ALIGN(., 0x10);
        assets1_RODATA_END = .;
        assets1_RODATA_SIZE = ABSOLUTE(assets1_RODATA_END - assets1_RODATA_START);

        assets1_SDATA_START = .;
        build/segments/assets1.o(.sdata*);
        . = ALIGN(., 0x10);
        assets1_SDATA_END = .;
        assets1_SDATA_SIZE = ABSOLUTE(assets1_SDATA_END - assets1_SDATA_START);
    }

    assets1_alloc_VRAM_END = .;
    assets1_alloc_VRAM_SIZE = ABSOLUTE(assets1_alloc_VRAM_END - assets1_alloc_VRAM);

    assets1_noload_VRAM = .;

    .assets1.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        assets1_SBSS_START = .;
        build/segments/assets1.o(.sbss*);
        . = ALIGN(., 0x10);
        assets1_SBSS_END = .;
        assets1_SBSS_SIZE = ABSOLUTE(assets1_SBSS_END - assets1_SBSS_START);

        assets1_SCOMMON_START = .;
        build/segments/assets1.o(.scommon*);
        . = ALIGN(., 0x10);
        assets1_SCOMMON_END = .;
        assets1_SCOMMON_SIZE = ABSOLUTE(assets1_SCOMMON_END - assets1_SCOMMON_START);

        assets1_BSS_START = .;
        build/segments/assets1.o(.bss*);
        . = ALIGN(., 0x10);
        assets1_BSS_END = .;
        assets1_BSS_SIZE = ABSOLUTE(assets1_BSS_END - assets1_BSS_START);

        assets1COMMON_START = .;
        build/segments/assets1.o(COMMON*);
        . = ALIGN(., 0x10);
        assets1COMMON_END = .;
        assets1COMMON_SIZE = ABSOLUTE(assets1COMMON_END - assets1COMMON_START);
    }

    assets1_noload_VRAM_END = .;
    assets1_noload_VRAM_SIZE = ABSOLUTE(assets1_noload_VRAM_END - assets1_noload_VRAM);
    assets1_VRAM_END = .;
    assets1_VRAM_SIZE = ABSOLUTE(assets1_VRAM_END - assets1_VRAM);
    __romPos += SIZEOF(.assets1);
    assets1_ROM_END = __romPos;
    assets1_ROM_SIZE = ABSOLUTE(assets1_ROM_END - assets1_ROM_START);

    segment_05_VRAM_CLASS_END = MAX(segment_05_VRAM_CLASS_END, assets1_VRAM_END);

    assets2_ROM_START = __romPos;
    assets2_VRAM = ADDR(.assets2);
    assets2_alloc_VRAM = .;

    .assets2 segment_05_VRAM_CLASS_START : AT(assets2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        assets2_TEXT_START = .;
        build/segments/assets2.o(.text*);
        . = ALIGN(., 0x10);
        assets2_TEXT_END = .;
        assets2_TEXT_SIZE = ABSOLUTE(assets2_TEXT_END - assets2_TEXT_START);

        assets2_DATA_START = .;
        build/segments/assets2.o(.data*);
        . = ALIGN(., 0x10);
        assets2_DATA_END = .;
        assets2_DATA_SIZE = ABSOLUTE(assets2_DATA_END - assets2_DATA_START);

        assets2_RODATA_START = .;
        build/segments/assets2.o(.rodata*);
        . = ALIGN(., 0x10);
        assets2_RODATA_END = .;
        assets2_RODATA_SIZE = ABSOLUTE(assets2_RODATA_END - assets2_RODATA_START);

        assets2_SDATA_START = .;
        build/segments/assets2.o(.sdata*);
        . = ALIGN(., 0x10);
        assets2_SDATA_END = .;
        assets2_SDATA_SIZE = ABSOLUTE(assets2_SDATA_END - assets2_SDATA_START);
    }

    assets2_alloc_VRAM_END = .;
    assets2_alloc_VRAM_SIZE = ABSOLUTE(assets2_alloc_VRAM_END - assets2_alloc_VRAM);

    assets2_noload_VRAM = .;

    .assets2.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        assets2_SBSS_START = .;
        build/segments/assets2.o(.sbss*);
        . = ALIGN(., 0x10);
        assets2_SBSS_END = .;
        assets2_SBSS_SIZE = ABSOLUTE(assets2_SBSS_END - assets2_SBSS_START);

        assets2_SCOMMON_START = .;
        build/segments/assets2.o(.scommon*);
        . = ALIGN(., 0x10);
        assets2_SCOMMON_END = .;
        assets2_SCOMMON_SIZE = ABSOLUTE(assets2_SCOMMON_END - assets2_SCOMMON_START);

        assets2_BSS_START = .;
        build/segments/assets2.o(.bss*);
        . = ALIGN(., 0x10);
        assets2_BSS_END = .;
        assets2_BSS_SIZE = ABSOLUTE(assets2_BSS_END - assets2_BSS_START);

        assets2COMMON_START = .;
        build/segments/assets2.o(COMMON*);
        . = ALIGN(., 0x10);
        assets2COMMON_END = .;
        assets2COMMON_SIZE = ABSOLUTE(assets2COMMON_END - assets2COMMON_START);
    }

    assets2_noload_VRAM_END = .;
    assets2_noload_VRAM_SIZE = ABSOLUTE(assets2_noload_VRAM_END - assets2_noload_VRAM);
    assets2_VRAM_END = .;
    assets2_VRAM_SIZE = ABSOLUTE(assets2_VRAM_END - assets2_VRAM);
    __romPos += SIZEOF(.assets2);
    assets2_ROM_END = __romPos;
    assets2_ROM_SIZE = ABSOLUTE(assets2_ROM_END - assets2_ROM_START);

    segment_05_VRAM_CLASS_END = MAX(segment_05_VRAM_CLASS_END, assets2_VRAM_END);

    assets3_ROM_START = __romPos;
    assets3_VRAM = ADDR(.assets3);
    assets3_alloc_VRAM = .;

    .assets3 segment_05_VRAM_CLASS_START : AT(assets3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        assets3_TEXT_START = .;
        build/segments/assets3.o(.text*);
        . = ALIGN(., 0x10);
        assets3_TEXT_END = .;
        assets3_TEXT_SIZE = ABSOLUTE(assets3_TEXT_END - assets3_TEXT_START);

        assets3_DATA_START = .;
        build/segments/assets3.o(.data*);
        . = ALIGN(., 0x10);
        assets3_DATA_END = .;
        assets3_DATA_SIZE = ABSOLUTE(assets3_DATA_END - assets3_DATA_START);

        assets3_RODATA_START = .;
        build/segments/assets3.o(.rodata*);
        . = ALIGN(., 0x10);
        assets3_RODATA_END = .;
        assets3_RODATA_SIZE = ABSOLUTE(assets3_RODATA_END - assets3_RODATA_START);

        assets3_SDATA_START = .;
        build/segments/assets3.o(.sdata*);
        . = ALIGN(., 0x10);
        assets3_SDATA_END = .;
        assets3_SDATA_SIZE = ABSOLUTE(assets3_SDATA_END - assets3_SDATA_START);
    }

    assets3_alloc_VRAM_END = .;
    assets3_alloc_VRAM_SIZE = ABSOLUTE(assets3_alloc_VRAM_END - assets3_alloc_VRAM);

    assets3_noload_VRAM = .;

    .assets3.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        assets3_SBSS_START = .;
        build/segments/assets3.o(.sbss*);
        . = ALIGN(., 0x10);
        assets3_SBSS_END = .;
        assets3_SBSS_SIZE = ABSOLUTE(assets3_SBSS_END - assets3_SBSS_START);

        assets3_SCOMMON_START = .;
        build/segments/assets3.o(.scommon*);
        . = ALIGN(., 0x10);
        assets3_SCOMMON_END = .;
        assets3_SCOMMON_SIZE = ABSOLUTE(assets3_SCOMMON_END - assets3_SCOMMON_START);

        assets3_BSS_START = .;
        build/segments/assets3.o(.bss*);
        . = ALIGN(., 0x10);
        assets3_BSS_END = .;
        assets3_BSS_SIZE = ABSOLUTE(assets3_BSS_END - assets3_BSS_START);

        assets3COMMON_START = .;
        build/segments/assets3.o(COMMON*);
        . = ALIGN(., 0x10);
        assets3COMMON_END = .;
        assets3COMMON_SIZE = ABSOLUTE(assets3COMMON_END - assets3COMMON_START);
    }

    assets3_noload_VRAM_END = .;
    assets3_noload_VRAM_SIZE = ABSOLUTE(assets3_noload_VRAM_END - assets3_noload_VRAM);
    assets3_VRAM_END = .;
    assets3_VRAM_SIZE = ABSOLUTE(assets3_VRAM_END - assets3_VRAM);
    __romPos += SIZEOF(.assets3);
    assets3_ROM_END = __romPos;
    assets3_ROM_SIZE = ABSOLUTE(assets3_ROM_END - assets3_ROM_START);

    segment_05_VRAM_CLASS_END = MAX(segment_05_VRAM_CLASS_END, assets3_VRAM_END);

    segment_06_VRAM_CLASS_START = 0x06000000;
    segment_06_VRAM_CLASS_END = 0x00000000;

    assets4_ROM_START = __romPos;
    assets4_VRAM = ADDR(.assets4);
    assets4_alloc_VRAM = .;

    .assets4 segment_06_VRAM_CLASS_START : AT(assets4_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        assets4_TEXT_START = .;
        build/segments/assets4.o(.text*);
        . = ALIGN(., 0x10);
        assets4_TEXT_END = .;
        assets4_TEXT_SIZE = ABSOLUTE(assets4_TEXT_END - assets4_TEXT_START);

        assets4_DATA_START = .;
        build/segments/assets4.o(.data*);
        . = ALIGN(., 0x10);
        assets4_DATA_END = .;
        assets4_DATA_SIZE = ABSOLUTE(assets4_DATA_END - assets4_DATA_START);

        assets4_RODATA_START = .;
        build/segments/assets4.o(.rodata*);
        . = ALIGN(., 0x10);
        assets4_RODATA_END = .;
        assets4_RODATA_SIZE = ABSOLUTE(assets4_RODATA_END - assets4_RODATA_START);

        assets4_SDATA_START = .;
        build/segments/assets4.o(.sdata*);
        . = ALIGN(., 0x10);
        assets4_SDATA_END = .;
        assets4_SDATA_SIZE = ABSOLUTE(assets4_SDATA_END - assets4_SDATA_START);
    }

    assets4_alloc_VRAM_END = .;
    assets4_alloc_VRAM_SIZE = ABSOLUTE(assets4_alloc_VRAM_END - assets4_alloc_VRAM);

    assets4_noload_VRAM = .;

    .assets4.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        assets4_SBSS_START = .;
        build/segments/assets4.o(.sbss*);
        . = ALIGN(., 0x10);
        assets4_SBSS_END = .;
        assets4_SBSS_SIZE = ABSOLUTE(assets4_SBSS_END - assets4_SBSS_START);

        assets4_SCOMMON_START = .;
        build/segments/assets4.o(.scommon*);
        . = ALIGN(., 0x10);
        assets4_SCOMMON_END = .;
        assets4_SCOMMON_SIZE = ABSOLUTE(assets4_SCOMMON_END - assets4_SCOMMON_START);

        assets4_BSS_START = .;
        build/segments/assets4.o(.bss*);
        . = ALIGN(., 0x10);
        assets4_BSS_END = .;
        assets4_BSS_SIZE = ABSOLUTE(assets4_BSS_END - assets4_BSS_START);

        assets4COMMON_START = .;
        build/segments/assets4.o(COMMON*);
        . = ALIGN(., 0x10);
        assets4COMMON_END = .;
        assets4COMMON_SIZE = ABSOLUTE(assets4COMMON_END - assets4COMMON_START);
    }

    assets4_noload_VRAM_END = .;
    assets4_noload_VRAM_SIZE = ABSOLUTE(assets4_noload_VRAM_END - assets4_noload_VRAM);
    assets4_VRAM_END = .;
    assets4_VRAM_SIZE = ABSOLUTE(assets4_VRAM_END - assets4_VRAM);
    __romPos += SIZEOF(.assets4);
    assets4_ROM_END = __romPos;
    assets4_ROM_SIZE = ABSOLUTE(assets4_ROM_END - assets4_ROM_START);

    segment_06_VRAM_CLASS_END = MAX(segment_06_VRAM_CLASS_END, assets4_VRAM_END);

    battle_area2_VRAM_CLASS_SIZE = battle_area2_VRAM_CLASS_END - battle_area2_VRAM_CLASS_START;
    battle_partner_VRAM_CLASS_SIZE = battle_partner_VRAM_CLASS_END - battle_partner_VRAM_CLASS_START;
    battle_code_VRAM_CLASS_SIZE = battle_code_VRAM_CLASS_END - battle_code_VRAM_CLASS_START;
    heaps2_VRAM_CLASS_SIZE = heaps2_VRAM_CLASS_END - heaps2_VRAM_CLASS_START;
    world_script_api_VRAM_CLASS_SIZE = world_script_api_VRAM_CLASS_END - world_script_api_VRAM_CLASS_START;
    texture_memory_VRAM_CLASS_SIZE = texture_memory_VRAM_CLASS_END - texture_memory_VRAM_CLASS_START;
    segment_05_VRAM_CLASS_SIZE = segment_05_VRAM_CLASS_END - segment_05_VRAM_CLASS_START;
    segment_06_VRAM_CLASS_SIZE = segment_06_VRAM_CLASS_END - segment_06_VRAM_CLASS_START;

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
