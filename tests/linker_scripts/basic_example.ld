SECTIONS
{
    __romPos = 0x0;

    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    header_alloc_VRAM = .;
    .header : AT(header_ROM_START) SUBALIGN(32)
    {
        header_text_START = .;
        build/asm/data/rom_header.o(.text*);
        header_text_END = .;
        header_text_SIZE = ABSOLUTE(header_text_END - header_text_START);

        header_data_START = .;
        build/asm/data/rom_header.o(.data*);
        header_data_END = .;
        header_data_SIZE = ABSOLUTE(header_data_END - header_data_START);

        header_rodata_START = .;
        build/asm/data/rom_header.o(.rodata*);
        header_rodata_END = .;
        header_rodata_SIZE = ABSOLUTE(header_rodata_END - header_rodata_START);

        header_sdata_START = .;
        build/asm/data/rom_header.o(.sdata*);
        header_sdata_END = .;
        header_sdata_SIZE = ABSOLUTE(header_sdata_END - header_sdata_START);
    }
    header_alloc_VRAM_END = .;
    header_alloc_VRAM_SIZE = ABSOLUTE(header_alloc_VRAM_END - header_alloc_VRAM);

    header_noload_VRAM = .;
    .header.noload (NOLOAD) : SUBALIGN(32)
    {
        header_sbss_START = .;
        build/asm/data/rom_header.o(.sbss*);
        header_sbss_END = .;
        header_sbss_SIZE = ABSOLUTE(header_sbss_END - header_sbss_START);

        header_scommon_START = .;
        build/asm/data/rom_header.o(.scommon*);
        header_scommon_END = .;
        header_scommon_SIZE = ABSOLUTE(header_scommon_END - header_scommon_START);

        header_bss_START = .;
        build/asm/data/rom_header.o(.bss*);
        header_bss_END = .;
        header_bss_SIZE = ABSOLUTE(header_bss_END - header_bss_START);

        headerCOMMON_START = .;
        build/asm/data/rom_header.o(COMMON*);
        headerCOMMON_END = .;
        headerCOMMON_SIZE = ABSOLUTE(headerCOMMON_END - headerCOMMON_START);
    }
    header_noload_VRAM_END = .;
    header_noload_VRAM_SIZE = ABSOLUTE(header_noload_VRAM_END - header_noload_VRAM);
    header_VRAM_END = .;
    header_VRAM_SIZE = ABSOLUTE(header_VRAM_END - header_VRAM);
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_ROM_SIZE = ABSOLUTE(header_ROM_END - header_ROM_START);

    ipl3_ROM_START = __romPos;
    ipl3_VRAM = ADDR(.ipl3);
    ipl3_alloc_VRAM = .;
    .ipl3 : AT(ipl3_ROM_START) SUBALIGN(32)
    {
        ipl3_text_START = .;
        build/asm/data/ipl3.o(.text*);
        ipl3_text_END = .;
        ipl3_text_SIZE = ABSOLUTE(ipl3_text_END - ipl3_text_START);

        ipl3_data_START = .;
        build/asm/data/ipl3.o(.data*);
        ipl3_data_END = .;
        ipl3_data_SIZE = ABSOLUTE(ipl3_data_END - ipl3_data_START);

        ipl3_rodata_START = .;
        build/asm/data/ipl3.o(.rodata*);
        ipl3_rodata_END = .;
        ipl3_rodata_SIZE = ABSOLUTE(ipl3_rodata_END - ipl3_rodata_START);

        ipl3_sdata_START = .;
        build/asm/data/ipl3.o(.sdata*);
        ipl3_sdata_END = .;
        ipl3_sdata_SIZE = ABSOLUTE(ipl3_sdata_END - ipl3_sdata_START);
    }
    ipl3_alloc_VRAM_END = .;
    ipl3_alloc_VRAM_SIZE = ABSOLUTE(ipl3_alloc_VRAM_END - ipl3_alloc_VRAM);

    ipl3_noload_VRAM = .;
    .ipl3.noload (NOLOAD) : SUBALIGN(32)
    {
        ipl3_sbss_START = .;
        build/asm/data/ipl3.o(.sbss*);
        ipl3_sbss_END = .;
        ipl3_sbss_SIZE = ABSOLUTE(ipl3_sbss_END - ipl3_sbss_START);

        ipl3_scommon_START = .;
        build/asm/data/ipl3.o(.scommon*);
        ipl3_scommon_END = .;
        ipl3_scommon_SIZE = ABSOLUTE(ipl3_scommon_END - ipl3_scommon_START);

        ipl3_bss_START = .;
        build/asm/data/ipl3.o(.bss*);
        ipl3_bss_END = .;
        ipl3_bss_SIZE = ABSOLUTE(ipl3_bss_END - ipl3_bss_START);

        ipl3COMMON_START = .;
        build/asm/data/ipl3.o(COMMON*);
        ipl3COMMON_END = .;
        ipl3COMMON_SIZE = ABSOLUTE(ipl3COMMON_END - ipl3COMMON_START);
    }
    ipl3_noload_VRAM_END = .;
    ipl3_noload_VRAM_SIZE = ABSOLUTE(ipl3_noload_VRAM_END - ipl3_noload_VRAM);
    ipl3_VRAM_END = .;
    ipl3_VRAM_SIZE = ABSOLUTE(ipl3_VRAM_END - ipl3_VRAM);
    __romPos += SIZEOF(.ipl3);
    ipl3_ROM_END = __romPos;
    ipl3_ROM_SIZE = ABSOLUTE(ipl3_ROM_END - ipl3_ROM_START);

    entry_ROM_START = __romPos;
    entry_VRAM = ADDR(.entry);
    entry_alloc_VRAM = .;
    .entry 0x80000400 : AT(entry_ROM_START) SUBALIGN(32)
    {
        entry_text_START = .;
        build/asm/entry.o(.text*);
        entry_text_END = .;
        entry_text_SIZE = ABSOLUTE(entry_text_END - entry_text_START);

        entry_data_START = .;
        build/asm/entry.o(.data*);
        entry_data_END = .;
        entry_data_SIZE = ABSOLUTE(entry_data_END - entry_data_START);

        entry_rodata_START = .;
        build/asm/entry.o(.rodata*);
        entry_rodata_END = .;
        entry_rodata_SIZE = ABSOLUTE(entry_rodata_END - entry_rodata_START);

        entry_sdata_START = .;
        build/asm/entry.o(.sdata*);
        entry_sdata_END = .;
        entry_sdata_SIZE = ABSOLUTE(entry_sdata_END - entry_sdata_START);
    }
    entry_alloc_VRAM_END = .;
    entry_alloc_VRAM_SIZE = ABSOLUTE(entry_alloc_VRAM_END - entry_alloc_VRAM);

    entry_noload_VRAM = .;
    .entry.noload (NOLOAD) : SUBALIGN(32)
    {
        entry_sbss_START = .;
        build/asm/entry.o(.sbss*);
        entry_sbss_END = .;
        entry_sbss_SIZE = ABSOLUTE(entry_sbss_END - entry_sbss_START);

        entry_scommon_START = .;
        build/asm/entry.o(.scommon*);
        entry_scommon_END = .;
        entry_scommon_SIZE = ABSOLUTE(entry_scommon_END - entry_scommon_START);

        entry_bss_START = .;
        build/asm/entry.o(.bss*);
        entry_bss_END = .;
        entry_bss_SIZE = ABSOLUTE(entry_bss_END - entry_bss_START);

        entryCOMMON_START = .;
        build/asm/entry.o(COMMON*);
        entryCOMMON_END = .;
        entryCOMMON_SIZE = ABSOLUTE(entryCOMMON_END - entryCOMMON_START);
    }
    entry_noload_VRAM_END = .;
    entry_noload_VRAM_SIZE = ABSOLUTE(entry_noload_VRAM_END - entry_noload_VRAM);
    entry_VRAM_END = .;
    entry_VRAM_SIZE = ABSOLUTE(entry_VRAM_END - entry_VRAM);
    __romPos += SIZEOF(.entry);
    entry_ROM_END = __romPos;
    entry_ROM_SIZE = ABSOLUTE(entry_ROM_END - entry_ROM_START);

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;
    .boot : AT(boot_ROM_START)
    {
        boot_text_START = .;
        build/src/boot/boot_main.o(.text*);
        build/src/boot/dmadata.o(.text*);
        build/asm/util.o(.text*);
        boot_text_END = .;
        boot_text_SIZE = ABSOLUTE(boot_text_END - boot_text_START);

        boot_data_START = .;
        build/src/boot/boot_main.o(.data*);
        build/src/boot/dmadata.o(.data*);
        build/asm/util.o(.data*);
        boot_data_END = .;
        boot_data_SIZE = ABSOLUTE(boot_data_END - boot_data_START);

        boot_rodata_START = .;
        build/src/boot/boot_main.o(.rodata*);
        build/src/boot/dmadata.o(.rodata*);
        build/asm/util.o(.rodata*);
        boot_rodata_END = .;
        boot_rodata_SIZE = ABSOLUTE(boot_rodata_END - boot_rodata_START);

        boot_sdata_START = .;
        build/src/boot/boot_main.o(.sdata*);
        build/src/boot/dmadata.o(.sdata*);
        build/asm/util.o(.sdata*);
        boot_sdata_END = .;
        boot_sdata_SIZE = ABSOLUTE(boot_sdata_END - boot_sdata_START);
    }
    boot_alloc_VRAM_END = .;
    boot_alloc_VRAM_SIZE = ABSOLUTE(boot_alloc_VRAM_END - boot_alloc_VRAM);

    boot_noload_VRAM = .;
    .boot.noload (NOLOAD) :
    {
        boot_sbss_START = .;
        build/src/boot/boot_main.o(.sbss*);
        build/src/boot/dmadata.o(.sbss*);
        build/asm/util.o(.sbss*);
        boot_sbss_END = .;
        boot_sbss_SIZE = ABSOLUTE(boot_sbss_END - boot_sbss_START);

        boot_scommon_START = .;
        build/src/boot/boot_main.o(.scommon*);
        build/src/boot/dmadata.o(.scommon*);
        build/asm/util.o(.scommon*);
        boot_scommon_END = .;
        boot_scommon_SIZE = ABSOLUTE(boot_scommon_END - boot_scommon_START);

        boot_bss_START = .;
        build/src/boot/boot_main.o(.bss*);
        build/src/boot/dmadata.o(.bss*);
        build/asm/util.o(.bss*);
        boot_bss_END = .;
        boot_bss_SIZE = ABSOLUTE(boot_bss_END - boot_bss_START);

        bootCOMMON_START = .;
        build/src/boot/boot_main.o(COMMON*);
        build/src/boot/dmadata.o(COMMON*);
        build/asm/util.o(COMMON*);
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

}
