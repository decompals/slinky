SECTIONS
{
    __romPos = 0x0;

    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
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
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    .header.noload (NOLOAD) : SUBALIGN(32)
    {
        header_bss_START = .;
        build/asm/data/rom_header.o(.sbss*);

        build/asm/data/rom_header.o(.scommon*);

        build/asm/data/rom_header.o(.bss*);

        build/asm/data/rom_header.o(COMMON*);
        header_bss_END = .;
        header_bss_SIZE = ABSOLUTE(header_bss_END - header_bss_START);
    }
    header_VRAM_END = .;

    ipl3_ROM_START = __romPos;
    ipl3_VRAM = ADDR(.ipl3);
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
    __romPos += SIZEOF(.ipl3);
    ipl3_ROM_END = __romPos;
    .ipl3.noload (NOLOAD) : SUBALIGN(32)
    {
        ipl3_bss_START = .;
        build/asm/data/ipl3.o(.sbss*);

        build/asm/data/ipl3.o(.scommon*);

        build/asm/data/ipl3.o(.bss*);

        build/asm/data/ipl3.o(COMMON*);
        ipl3_bss_END = .;
        ipl3_bss_SIZE = ABSOLUTE(ipl3_bss_END - ipl3_bss_START);
    }
    ipl3_VRAM_END = .;

    entry_ROM_START = __romPos;
    entry_VRAM = ADDR(.entry);
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
    __romPos += SIZEOF(.entry);
    entry_ROM_END = __romPos;
    .entry.noload (NOLOAD) : SUBALIGN(32)
    {
        entry_bss_START = .;
        build/asm/entry.o(.sbss*);

        build/asm/entry.o(.scommon*);

        build/asm/entry.o(.bss*);

        build/asm/entry.o(COMMON*);
        entry_bss_END = .;
        entry_bss_SIZE = ABSOLUTE(entry_bss_END - entry_bss_START);
    }
    entry_VRAM_END = .;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
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
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    .boot.noload (NOLOAD) :
    {
        boot_bss_START = .;
        build/src/boot/boot_main.o(.sbss*);
        build/src/boot/dmadata.o(.sbss*);
        build/asm/util.o(.sbss*);

        build/src/boot/boot_main.o(.scommon*);
        build/src/boot/dmadata.o(.scommon*);
        build/asm/util.o(.scommon*);

        build/src/boot/boot_main.o(.bss*);
        build/src/boot/dmadata.o(.bss*);
        build/asm/util.o(.bss*);

        build/src/boot/boot_main.o(COMMON*);
        build/src/boot/dmadata.o(COMMON*);
        build/asm/util.o(COMMON*);
        boot_bss_END = .;
        boot_bss_SIZE = ABSOLUTE(boot_bss_END - boot_bss_START);
    }
    boot_VRAM_END = .;

}
