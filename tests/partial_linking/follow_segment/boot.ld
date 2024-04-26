SECTIONS
{
    . = 0x80000460;

    boot_TEXT_START = .;
    .text : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(.text*);
        build/src/libultra.o(.text*);
    }
    boot_TEXT_END = .;
    boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

    boot_DATA_START = .;
    .data : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(.data*);
        build/src/libultra.o(.data*);
    }
    boot_DATA_END = .;
    boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

    boot_RODATA_START = .;
    .rodata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(.rodata*);
        build/src/libultra.o(.rodata*);
    }
    boot_RODATA_END = .;
    boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

    boot_SDATA_START = .;
    .sdata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(.sdata*);
        build/src/libultra.o(.sdata*);
    }
    boot_SDATA_END = .;
    boot_SDATA_SIZE = ABSOLUTE(boot_SDATA_END - boot_SDATA_START);

    boot_SBSS_START = .;
    .sbss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(.sbss*);
        build/src/libultra.o(.sbss*);
    }
    boot_SBSS_END = .;
    boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

    boot_SCOMMON_START = .;
    .scommon (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(.scommon*);
        build/src/libultra.o(.scommon*);
    }
    boot_SCOMMON_END = .;
    boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

    boot_BSS_START = .;
    .bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(.bss*);
        build/src/libultra.o(.bss*);
    }
    boot_BSS_END = .;
    boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

    bootCOMMON_START = .;
    COMMON (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/boot_main.o(COMMON*);
        build/src/libultra.o(COMMON*);
    }
    bootCOMMON_END = .;
    bootCOMMON_SIZE = ABSOLUTE(bootCOMMON_END - bootCOMMON_START);

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
