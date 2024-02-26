SECTIONS
{
    __romPos = 0x0;
    _gp = 0x800E4090;

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    main_alloc_VRAM = .;
    .main 0x80010200 : AT(main_ROM_START)
    {
        FILL(0x00000000);
        main_RODATA_START = .;
        build/src/main/file1.o(.rodata*);
        build/src/main/file2.o(.rodata*);
        build/src/main/file3.o(.rodata*);
        build/src/main/file4.o(.rodata*);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

        main_TEXT_START = .;
        build/src/main/file1.o(.text*);
        build/src/main/file2.o(.text*);
        build/src/main/file3.o(.text*);
        build/src/main/file4.o(.text*);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

        main_DATA_START = .;
        build/src/main/file1.o(.data*);
        build/src/main/file2.o(.data*);
        build/src/main/file3.o(.data*);
        build/src/main/file4.o(.data*);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

        main_SDATA_START = .;
        build/src/main/file1.o(.sdata*);
        build/src/main/file2.o(.sdata*);
        build/src/main/file3.o(.sdata*);
        build/src/main/file4.o(.sdata*);
        main_SDATA_END = .;
        main_SDATA_SIZE = ABSOLUTE(main_SDATA_END - main_SDATA_START);

        main_SBSS_START = .;
        build/src/main/file1.o(.sbss*);
        build/src/main/file2.o(.sbss*);
        build/src/main/file3.o(.sbss*);
        build/src/main/file4.o(.sbss*);
        main_SBSS_END = .;
        main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

        main_BSS_START = .;
        build/src/main/file1.o(.bss*);
        build/src/main/file2.o(.bss*);
        build/src/main/file3.o(.bss*);
        build/src/main/file4.o(.bss*);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);
    }
    main_alloc_VRAM_END = .;
    main_alloc_VRAM_SIZE = ABSOLUTE(main_alloc_VRAM_END - main_alloc_VRAM);

    main_noload_VRAM = .;
    .main.noload (NOLOAD) :
    {
        FILL(0x00000000);
    }
    main_noload_VRAM_END = .;
    main_noload_VRAM_SIZE = ABSOLUTE(main_noload_VRAM_END - main_noload_VRAM);
    main_VRAM_END = .;
    main_VRAM_SIZE = ABSOLUTE(main_VRAM_END - main_VRAM);
    __romPos += SIZEOF(.main);
    main_ROM_END = __romPos;
    main_ROM_SIZE = ABSOLUTE(main_ROM_END - main_ROM_START);

    /DISCARD/ :
    {
        *(.reginfo);
        *(.MIPS.abiflags);
        *(.MIPS.options);
        *(.note.gnu.build-id);
        *(.interp);
        *(.eh_frame);
    }
}
