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
        build/us/src/boot/boot_main.o(.text*);
        build/us/src/boot/file1.o(.text*);
        build/us/src/boot/file3.o(.text*);
        build/us/src/boot/file4.o(.text*);
        build/us/src/boot/file8.o(.text*);
        build/us/src/boot/file9.o(.text*);
        build/us/src/boot/dmadata.o(.text*);
        build/us/src/boot/file12.o(.text*);
        build/us/src/boot/file15.o(.text*);
        build/us/src/boot/file16.o(.text*);
        build/us/src/boot/file17.o(.text*);
        build/us/src/boot/util.o(.text*);
        build/us/src/boot/file21.o(.text*);
        build/us/src/boot/file24.o(.text*);
        build/us/src/boot/file28.o(.text*);
        build/us/src/boot/file29.o(.text*);
        . = ALIGN(., 0x10);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/us/src/boot/boot_main.o(.data*);
        build/us/src/boot/file1.o(.data*);
        build/us/src/boot/file3.o(.data*);
        build/us/src/boot/file4.o(.data*);
        build/us/src/boot/file8.o(.data*);
        build/us/src/boot/file9.o(.data*);
        build/us/src/boot/dmadata.o(.data*);
        build/us/src/boot/file12.o(.data*);
        build/us/src/boot/file15.o(.data*);
        build/us/src/boot/file16.o(.data*);
        build/us/src/boot/file17.o(.data*);
        build/us/src/boot/util.o(.data*);
        build/us/src/boot/file21.o(.data*);
        build/us/src/boot/file24.o(.data*);
        build/us/src/boot/file28.o(.data*);
        build/us/src/boot/file29.o(.data*);
        . = ALIGN(., 0x10);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/us/src/boot/boot_main.o(.rodata*);
        build/us/src/boot/file1.o(.rodata*);
        build/us/src/boot/file3.o(.rodata*);
        build/us/src/boot/file4.o(.rodata*);
        build/us/src/boot/file8.o(.rodata*);
        build/us/src/boot/file9.o(.rodata*);
        build/us/src/boot/dmadata.o(.rodata*);
        build/us/src/boot/file12.o(.rodata*);
        build/us/src/boot/file15.o(.rodata*);
        build/us/src/boot/file16.o(.rodata*);
        build/us/src/boot/file17.o(.rodata*);
        build/us/src/boot/util.o(.rodata*);
        build/us/src/boot/file21.o(.rodata*);
        build/us/src/boot/file24.o(.rodata*);
        build/us/src/boot/file28.o(.rodata*);
        build/us/src/boot/file29.o(.rodata*);
        . = ALIGN(., 0x10);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/us/src/boot/boot_main.o(.sdata*);
        build/us/src/boot/file1.o(.sdata*);
        build/us/src/boot/file3.o(.sdata*);
        build/us/src/boot/file4.o(.sdata*);
        build/us/src/boot/file8.o(.sdata*);
        build/us/src/boot/file9.o(.sdata*);
        build/us/src/boot/dmadata.o(.sdata*);
        build/us/src/boot/file12.o(.sdata*);
        build/us/src/boot/file15.o(.sdata*);
        build/us/src/boot/file16.o(.sdata*);
        build/us/src/boot/file17.o(.sdata*);
        build/us/src/boot/util.o(.sdata*);
        build/us/src/boot/file21.o(.sdata*);
        build/us/src/boot/file24.o(.sdata*);
        build/us/src/boot/file28.o(.sdata*);
        build/us/src/boot/file29.o(.sdata*);
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
        build/us/src/boot/boot_main.o(.sbss*);
        build/us/src/boot/file1.o(.sbss*);
        build/us/src/boot/file3.o(.sbss*);
        build/us/src/boot/file4.o(.sbss*);
        build/us/src/boot/file8.o(.sbss*);
        build/us/src/boot/file9.o(.sbss*);
        build/us/src/boot/dmadata.o(.sbss*);
        build/us/src/boot/file12.o(.sbss*);
        build/us/src/boot/file15.o(.sbss*);
        build/us/src/boot/file16.o(.sbss*);
        build/us/src/boot/file17.o(.sbss*);
        build/us/src/boot/util.o(.sbss*);
        build/us/src/boot/file21.o(.sbss*);
        build/us/src/boot/file24.o(.sbss*);
        build/us/src/boot/file28.o(.sbss*);
        build/us/src/boot/file29.o(.sbss*);
        . = ALIGN(., 0x10);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/us/src/boot/boot_main.o(.scommon*);
        build/us/src/boot/file1.o(.scommon*);
        build/us/src/boot/file3.o(.scommon*);
        build/us/src/boot/file4.o(.scommon*);
        build/us/src/boot/file8.o(.scommon*);
        build/us/src/boot/file9.o(.scommon*);
        build/us/src/boot/dmadata.o(.scommon*);
        build/us/src/boot/file12.o(.scommon*);
        build/us/src/boot/file15.o(.scommon*);
        build/us/src/boot/file16.o(.scommon*);
        build/us/src/boot/file17.o(.scommon*);
        build/us/src/boot/util.o(.scommon*);
        build/us/src/boot/file21.o(.scommon*);
        build/us/src/boot/file24.o(.scommon*);
        build/us/src/boot/file28.o(.scommon*);
        build/us/src/boot/file29.o(.scommon*);
        . = ALIGN(., 0x10);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/us/src/boot/boot_main.o(.bss*);
        build/us/src/boot/file1.o(.bss*);
        build/us/src/boot/file3.o(.bss*);
        build/us/src/boot/file4.o(.bss*);
        build/us/src/boot/file8.o(.bss*);
        build/us/src/boot/file9.o(.bss*);
        build/us/src/boot/dmadata.o(.bss*);
        build/us/src/boot/file12.o(.bss*);
        build/us/src/boot/file15.o(.bss*);
        build/us/src/boot/file16.o(.bss*);
        build/us/src/boot/file17.o(.bss*);
        build/us/src/boot/util.o(.bss*);
        build/us/src/boot/file21.o(.bss*);
        build/us/src/boot/file24.o(.bss*);
        build/us/src/boot/file28.o(.bss*);
        build/us/src/boot/file29.o(.bss*);
        . = ALIGN(., 0x10);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/us/src/boot/boot_main.o(COMMON*);
        build/us/src/boot/file1.o(COMMON*);
        build/us/src/boot/file3.o(COMMON*);
        build/us/src/boot/file4.o(COMMON*);
        build/us/src/boot/file8.o(COMMON*);
        build/us/src/boot/file9.o(COMMON*);
        build/us/src/boot/dmadata.o(COMMON*);
        build/us/src/boot/file12.o(COMMON*);
        build/us/src/boot/file15.o(COMMON*);
        build/us/src/boot/file16.o(COMMON*);
        build/us/src/boot/file17.o(COMMON*);
        build/us/src/boot/util.o(COMMON*);
        build/us/src/boot/file21.o(COMMON*);
        build/us/src/boot/file24.o(COMMON*);
        build/us/src/boot/file28.o(COMMON*);
        build/us/src/boot/file29.o(COMMON*);
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
