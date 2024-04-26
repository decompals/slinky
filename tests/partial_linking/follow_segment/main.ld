SECTIONS
{
    main_TEXT_START = .;
    .text : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.text*);
        build/src/main/dmadata.o(.text*);
        build/asm/main/util.o(.text*);
        . = ALIGN(., 0x20);
    }
    main_TEXT_END = .;
    main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

    main_DATA_START = .;
    .data : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.data*);
        build/src/main/dmadata.o(.data*);
        build/asm/main/util.o(.data*);
        . = ALIGN(., 0x20);
    }
    main_DATA_END = .;
    main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

    main_RODATA_START = .;
    .rodata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.rodata*);
        build/src/main/dmadata.o(.rodata*);
        build/asm/main/util.o(.rodata*);
        . = ALIGN(., 0x20);
    }
    main_RODATA_END = .;
    main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

    main_SDATA_START = .;
    .sdata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.sdata*);
        build/src/main/dmadata.o(.sdata*);
        build/asm/main/util.o(.sdata*);
        . = ALIGN(., 0x20);
    }
    main_SDATA_END = .;
    main_SDATA_SIZE = ABSOLUTE(main_SDATA_END - main_SDATA_START);

    main_SBSS_START = .;
    .sbss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.sbss*);
        build/src/main/dmadata.o(.sbss*);
        build/asm/main/util.o(.sbss*);
        . = ALIGN(., 0x20);
    }
    main_SBSS_END = .;
    main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

    main_SCOMMON_START = .;
    .scommon (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.scommon*);
        build/src/main/dmadata.o(.scommon*);
        build/asm/main/util.o(.scommon*);
        . = ALIGN(., 0x20);
    }
    main_SCOMMON_END = .;
    main_SCOMMON_SIZE = ABSOLUTE(main_SCOMMON_END - main_SCOMMON_START);

    main_BSS_START = .;
    .bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.bss*);
        build/src/main/dmadata.o(.bss*);
        build/asm/main/util.o(.bss*);
        . = ALIGN(., 0x20);
    }
    main_BSS_END = .;
    main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);

    mainCOMMON_START = .;
    COMMON (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(COMMON*);
        build/src/main/dmadata.o(COMMON*);
        build/asm/main/util.o(COMMON*);
        . = ALIGN(., 0x20);
    }
    mainCOMMON_END = .;
    mainCOMMON_SIZE = ABSOLUTE(mainCOMMON_END - mainCOMMON_START);

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
