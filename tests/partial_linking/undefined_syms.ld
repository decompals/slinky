SECTIONS
{
    __romPos = 0x0;

    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    header_alloc_VRAM = .;

    .header : AT(header_ROM_START)
    {
        FILL(0x00000000);
        header_TEXT_START = .;
        build/segments/header.o(.text*);
        header_TEXT_END = .;
        header_TEXT_SIZE = ABSOLUTE(header_TEXT_END - header_TEXT_START);

        header_DATA_START = .;
        build/segments/header.o(.data*);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);

        header_RODATA_START = .;
        build/segments/header.o(.rodata*);
        header_RODATA_END = .;
        header_RODATA_SIZE = ABSOLUTE(header_RODATA_END - header_RODATA_START);

        header_SDATA_START = .;
        build/segments/header.o(.sdata*);
        header_SDATA_END = .;
        header_SDATA_SIZE = ABSOLUTE(header_SDATA_END - header_SDATA_START);
    }

    header_alloc_VRAM_END = .;
    header_alloc_VRAM_SIZE = ABSOLUTE(header_alloc_VRAM_END - header_alloc_VRAM);

    header_noload_VRAM = .;

    .header.noload (NOLOAD) :
    {
        FILL(0x00000000);
        header_SBSS_START = .;
        build/segments/header.o(.sbss*);
        header_SBSS_END = .;
        header_SBSS_SIZE = ABSOLUTE(header_SBSS_END - header_SBSS_START);

        header_SCOMMON_START = .;
        build/segments/header.o(.scommon*);
        header_SCOMMON_END = .;
        header_SCOMMON_SIZE = ABSOLUTE(header_SCOMMON_END - header_SCOMMON_START);

        header_BSS_START = .;
        build/segments/header.o(.bss*);
        header_BSS_END = .;
        header_BSS_SIZE = ABSOLUTE(header_BSS_END - header_BSS_START);

        headerCOMMON_START = .;
        build/segments/header.o(COMMON*);
        headerCOMMON_END = .;
        headerCOMMON_SIZE = ABSOLUTE(headerCOMMON_END - headerCOMMON_START);
    }

    header_noload_VRAM_END = .;
    header_noload_VRAM_SIZE = ABSOLUTE(header_noload_VRAM_END - header_noload_VRAM);

    __romPos += SIZEOF(.header);
    header_VRAM_END = .;
    header_VRAM_SIZE = ABSOLUTE(header_VRAM_END - header_VRAM);
    header_ROM_END = __romPos;
    header_ROM_SIZE = ABSOLUTE(header_ROM_END - header_ROM_START);

    ipl3_ROM_START = __romPos;
    ipl3_VRAM = ADDR(.ipl3);
    ipl3_alloc_VRAM = .;

    .ipl3 : AT(ipl3_ROM_START)
    {
        FILL(0x00000000);
        ipl3_TEXT_START = .;
        build/segments/ipl3.o(.text*);
        ipl3_TEXT_END = .;
        ipl3_TEXT_SIZE = ABSOLUTE(ipl3_TEXT_END - ipl3_TEXT_START);

        ipl3_DATA_START = .;
        build/segments/ipl3.o(.data*);
        ipl3_DATA_END = .;
        ipl3_DATA_SIZE = ABSOLUTE(ipl3_DATA_END - ipl3_DATA_START);

        ipl3_RODATA_START = .;
        build/segments/ipl3.o(.rodata*);
        ipl3_RODATA_END = .;
        ipl3_RODATA_SIZE = ABSOLUTE(ipl3_RODATA_END - ipl3_RODATA_START);

        ipl3_SDATA_START = .;
        build/segments/ipl3.o(.sdata*);
        ipl3_SDATA_END = .;
        ipl3_SDATA_SIZE = ABSOLUTE(ipl3_SDATA_END - ipl3_SDATA_START);
    }

    ipl3_alloc_VRAM_END = .;
    ipl3_alloc_VRAM_SIZE = ABSOLUTE(ipl3_alloc_VRAM_END - ipl3_alloc_VRAM);

    ipl3_noload_VRAM = .;

    .ipl3.noload (NOLOAD) :
    {
        FILL(0x00000000);
        ipl3_SBSS_START = .;
        build/segments/ipl3.o(.sbss*);
        ipl3_SBSS_END = .;
        ipl3_SBSS_SIZE = ABSOLUTE(ipl3_SBSS_END - ipl3_SBSS_START);

        ipl3_SCOMMON_START = .;
        build/segments/ipl3.o(.scommon*);
        ipl3_SCOMMON_END = .;
        ipl3_SCOMMON_SIZE = ABSOLUTE(ipl3_SCOMMON_END - ipl3_SCOMMON_START);

        ipl3_BSS_START = .;
        build/segments/ipl3.o(.bss*);
        ipl3_BSS_END = .;
        ipl3_BSS_SIZE = ABSOLUTE(ipl3_BSS_END - ipl3_BSS_START);

        ipl3COMMON_START = .;
        build/segments/ipl3.o(COMMON*);
        ipl3COMMON_END = .;
        ipl3COMMON_SIZE = ABSOLUTE(ipl3COMMON_END - ipl3COMMON_START);
    }

    ipl3_noload_VRAM_END = .;
    ipl3_noload_VRAM_SIZE = ABSOLUTE(ipl3_noload_VRAM_END - ipl3_noload_VRAM);

    __romPos += SIZEOF(.ipl3);
    ipl3_VRAM_END = .;
    ipl3_VRAM_SIZE = ABSOLUTE(ipl3_VRAM_END - ipl3_VRAM);
    ipl3_ROM_END = __romPos;
    ipl3_ROM_SIZE = ABSOLUTE(ipl3_ROM_END - ipl3_ROM_START);

    entry_ROM_START = __romPos;
    entry_VRAM = ADDR(.entry);
    entry_alloc_VRAM = .;

    .entry 0x80000400 : AT(entry_ROM_START)
    {
        FILL(0x00000000);
        entry_TEXT_START = .;
        build/segments/entry.o(.text*);
        entry_TEXT_END = .;
        entry_TEXT_SIZE = ABSOLUTE(entry_TEXT_END - entry_TEXT_START);

        entry_DATA_START = .;
        build/segments/entry.o(.data*);
        entry_DATA_END = .;
        entry_DATA_SIZE = ABSOLUTE(entry_DATA_END - entry_DATA_START);

        entry_RODATA_START = .;
        build/segments/entry.o(.rodata*);
        entry_RODATA_END = .;
        entry_RODATA_SIZE = ABSOLUTE(entry_RODATA_END - entry_RODATA_START);

        entry_SDATA_START = .;
        build/segments/entry.o(.sdata*);
        entry_SDATA_END = .;
        entry_SDATA_SIZE = ABSOLUTE(entry_SDATA_END - entry_SDATA_START);
    }

    entry_alloc_VRAM_END = .;
    entry_alloc_VRAM_SIZE = ABSOLUTE(entry_alloc_VRAM_END - entry_alloc_VRAM);

    entry_noload_VRAM = .;

    .entry.noload (NOLOAD) :
    {
        FILL(0x00000000);
        entry_SBSS_START = .;
        build/segments/entry.o(.sbss*);
        entry_SBSS_END = .;
        entry_SBSS_SIZE = ABSOLUTE(entry_SBSS_END - entry_SBSS_START);

        entry_SCOMMON_START = .;
        build/segments/entry.o(.scommon*);
        entry_SCOMMON_END = .;
        entry_SCOMMON_SIZE = ABSOLUTE(entry_SCOMMON_END - entry_SCOMMON_START);

        entry_BSS_START = .;
        build/segments/entry.o(.bss*);
        entry_BSS_END = .;
        entry_BSS_SIZE = ABSOLUTE(entry_BSS_END - entry_BSS_START);

        entryCOMMON_START = .;
        build/segments/entry.o(COMMON*);
        entryCOMMON_END = .;
        entryCOMMON_SIZE = ABSOLUTE(entryCOMMON_END - entryCOMMON_START);
    }

    entry_noload_VRAM_END = .;
    entry_noload_VRAM_SIZE = ABSOLUTE(entry_noload_VRAM_END - entry_noload_VRAM);

    __romPos += SIZEOF(.entry);
    entry_VRAM_END = .;
    entry_VRAM_SIZE = ABSOLUTE(entry_VRAM_END - entry_VRAM);
    entry_ROM_END = __romPos;
    entry_ROM_SIZE = ABSOLUTE(entry_ROM_END - entry_ROM_START);

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;

    .boot : AT(boot_ROM_START)
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

    .boot.noload (NOLOAD) :
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

    __romPos += SIZEOF(.boot);
    boot_VRAM_END = .;
    boot_VRAM_SIZE = ABSOLUTE(boot_VRAM_END - boot_VRAM);
    boot_ROM_END = __romPos;
    boot_ROM_SIZE = ABSOLUTE(boot_ROM_END - boot_ROM_START);

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

MI_MODE_REG = 0xA4300000;
MI_VERSION_REG = 0xA4300004;
MI_INTR_REG = 0xA4300008;
MI_INTR_MASK_REG = 0xA430000C;
leoBootID = 0x800001A0;
osTvType = 0x80000300;
osRomType = 0x80000304;
osRomBase = 0x80000308;
osResetType = 0x8000030C;
osCicId = 0x80000310;
osVersion = 0x80000314;
osMemSize = 0x80000318;
osAppNMIBuffer = 0x8000031C;
dummy_test = 0x80801234;
HIDDEN(_gp = boot_SCOMMON_START + 0x7FF0);
PROVIDE(provided_sym = 0x1234);
PROVIDE_HIDDEN(provided_and_hidden_sym = 0x1234);
