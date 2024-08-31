SECTIONS
{
    __romPos = 0x0;

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    main_alloc_VRAM = .;

    .main : AT(main_ROM_START)
    {
        FILL(0x00000000);
        main_TEXT_START = .;
        build/src/main/boot_main.o(.text*);
        build/src/main/dmadata.o(.text*);
        build/asm/main/util.o(.text*);
        libultra_start_OFFSET = .;
        build/src/libultra/libc/bzero.o(.text*);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

        main_DATA_START = .;
        main_data_start_OFFSET = .;
        build/src/main/boot_main.o(.data*);
        build/src/main/dmadata.o(.data*);
        build/asm/main/util.o(.data*);
        build/src/libultra/libc/bzero.o(.data*);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

        main_RODATA_START = .;
        build/src/main/boot_main.o(.rodata*);
        build/src/main/dmadata.o(.rodata*);
        build/asm/main/util.o(.rodata*);
        build/src/libultra/libc/bzero.o(.rodata*);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

        main_SDATA_START = .;
        build/src/main/boot_main.o(.sdata*);
        build/src/main/dmadata.o(.sdata*);
        build/asm/main/util.o(.sdata*);
        build/src/libultra/libc/bzero.o(.sdata*);
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
        build/src/main/boot_main.o(.sbss*);
        build/src/main/dmadata.o(.sbss*);
        build/asm/main/util.o(.sbss*);
        build/src/libultra/libc/bzero.o(.sbss*);
        main_SBSS_END = .;
        main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

        main_SCOMMON_START = .;
        build/src/main/boot_main.o(.scommon*);
        build/src/main/dmadata.o(.scommon*);
        build/asm/main/util.o(.scommon*);
        build/src/libultra/libc/bzero.o(.scommon*);
        main_SCOMMON_END = .;
        main_SCOMMON_SIZE = ABSOLUTE(main_SCOMMON_END - main_SCOMMON_START);

        main_BSS_START = .;
        build/src/main/boot_main.o(.bss*);
        build/src/main/dmadata.o(.bss*);
        build/asm/main/util.o(.bss*);
        build/src/libultra/libc/bzero.o(.bss*);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);

        mainCOMMON_START = .;
        build/src/main/boot_main.o(COMMON*);
        build/src/main/dmadata.o(COMMON*);
        build/asm/main/util.o(COMMON*);
        build/src/libultra/libc/bzero.o(COMMON*);
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

    .symtab 0 :
    {
        *(.symtab);
    }
    .strtab 0 :
    {
        *(.strtab);
    }
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
        *(.got);
        *(*);
    }
}
