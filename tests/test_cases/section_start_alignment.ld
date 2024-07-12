SECTIONS
{
    . = 0x00100000;

    cod_alloc_VRAM = .;

    . = ALIGN(., 0x80);
    cod_TEXT_START = .;
    .text :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.text*);
        build/us_2003_07_10/src/cod/main.o(.text*);
        build/us_2003_07_10/src/cod/graphics.o(.text*);
        build/us_2003_07_10/src/cod/sounds.o(.text*);
        build/us_2003_07_10/src/cod/yada.o(.text*);
        build/us_2003_07_10/src/cod/movies.o(.text*);
        build/us_2003_07_10/src/cod/capybara.o(.text*);
    }
    . = ALIGN(., 0x4);
    cod_TEXT_END = .;
    cod_TEXT_SIZE = ABSOLUTE(cod_TEXT_END - cod_TEXT_START);

    cod_VUTEXT_START = .;
    .vutext :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.vutext*);
        build/us_2003_07_10/src/cod/main.o(.vutext*);
        build/us_2003_07_10/src/cod/graphics.o(.vutext*);
        build/us_2003_07_10/src/cod/sounds.o(.vutext*);
        build/us_2003_07_10/src/cod/yada.o(.vutext*);
        build/us_2003_07_10/src/cod/movies.o(.vutext*);
        build/us_2003_07_10/src/cod/capybara.o(.vutext*);
    }
    . = ALIGN(., 0x4);
    cod_VUTEXT_END = .;
    cod_VUTEXT_SIZE = ABSOLUTE(cod_VUTEXT_END - cod_VUTEXT_START);

    cod_DATA_START = .;
    .data :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.data*);
        build/us_2003_07_10/src/cod/main.o(.data*);
        build/us_2003_07_10/src/cod/graphics.o(.data*);
        build/us_2003_07_10/src/cod/sounds.o(.data*);
        build/us_2003_07_10/src/cod/yada.o(.data*);
        build/us_2003_07_10/src/cod/movies.o(.data*);
        build/us_2003_07_10/src/cod/capybara.o(.data*);
    }
    . = ALIGN(., 0x4);
    cod_DATA_END = .;
    cod_DATA_SIZE = ABSOLUTE(cod_DATA_END - cod_DATA_START);

    cod_VUDATA_START = .;
    .vudata :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.vudata*);
        build/us_2003_07_10/src/cod/main.o(.vudata*);
        build/us_2003_07_10/src/cod/graphics.o(.vudata*);
        build/us_2003_07_10/src/cod/sounds.o(.vudata*);
        build/us_2003_07_10/src/cod/yada.o(.vudata*);
        build/us_2003_07_10/src/cod/movies.o(.vudata*);
        build/us_2003_07_10/src/cod/capybara.o(.vudata*);
    }
    . = ALIGN(., 0x4);
    cod_VUDATA_END = .;
    cod_VUDATA_SIZE = ABSOLUTE(cod_VUDATA_END - cod_VUDATA_START);

    . = ALIGN(., 0x40);
    cod_RODATA_START = .;
    .rodata :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.rodata*);
        build/us_2003_07_10/src/cod/main.o(.rodata*);
        build/us_2003_07_10/src/cod/graphics.o(.rodata*);
        build/us_2003_07_10/src/cod/sounds.o(.rodata*);
        build/us_2003_07_10/src/cod/yada.o(.rodata*);
        build/us_2003_07_10/src/cod/movies.o(.rodata*);
        build/us_2003_07_10/src/cod/capybara.o(.rodata*);
    }
    . = ALIGN(., 0x4);
    cod_RODATA_END = .;
    cod_RODATA_SIZE = ABSOLUTE(cod_RODATA_END - cod_RODATA_START);

    cod_GCC_EXCEPT_TABLE_START = .;
    .gcc_except_table :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.gcc_except_table*);
        build/us_2003_07_10/src/cod/main.o(.gcc_except_table*);
        build/us_2003_07_10/src/cod/graphics.o(.gcc_except_table*);
        build/us_2003_07_10/src/cod/sounds.o(.gcc_except_table*);
        build/us_2003_07_10/src/cod/yada.o(.gcc_except_table*);
        build/us_2003_07_10/src/cod/movies.o(.gcc_except_table*);
        build/us_2003_07_10/src/cod/capybara.o(.gcc_except_table*);
    }
    . = ALIGN(., 0x4);
    cod_GCC_EXCEPT_TABLE_END = .;
    cod_GCC_EXCEPT_TABLE_SIZE = ABSOLUTE(cod_GCC_EXCEPT_TABLE_END - cod_GCC_EXCEPT_TABLE_START);

    . = ALIGN(., 0x8);
    cod_SDATA_START = .;
    .sdata :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.sdata*);
        build/us_2003_07_10/src/cod/main.o(.sdata*);
        build/us_2003_07_10/src/cod/graphics.o(.sdata*);
        build/us_2003_07_10/src/cod/sounds.o(.sdata*);
        build/us_2003_07_10/src/cod/yada.o(.sdata*);
        build/us_2003_07_10/src/cod/movies.o(.sdata*);
        build/us_2003_07_10/src/cod/capybara.o(.sdata*);
    }
    . = ALIGN(., 0x4);
    cod_SDATA_END = .;
    cod_SDATA_SIZE = ABSOLUTE(cod_SDATA_END - cod_SDATA_START);

    cod_alloc_VRAM_END = .;
    cod_alloc_VRAM_SIZE = ABSOLUTE(cod_alloc_VRAM_END - cod_alloc_VRAM);

    cod_noload_VRAM = .;

    cod_SCOMMON_START = .;
    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.scommon*);
        build/us_2003_07_10/src/cod/main.o(.scommon*);
        build/us_2003_07_10/src/cod/graphics.o(.scommon*);
        build/us_2003_07_10/src/cod/sounds.o(.scommon*);
        build/us_2003_07_10/src/cod/yada.o(.scommon*);
        build/us_2003_07_10/src/cod/movies.o(.scommon*);
        build/us_2003_07_10/src/cod/capybara.o(.scommon*);
    }
    . = ALIGN(., 0x4);
    cod_SCOMMON_END = .;
    cod_SCOMMON_SIZE = ABSOLUTE(cod_SCOMMON_END - cod_SCOMMON_START);

    cod_SBSS_START = .;
    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.sbss*);
        build/us_2003_07_10/src/cod/main.o(.sbss*);
        build/us_2003_07_10/src/cod/graphics.o(.sbss*);
        build/us_2003_07_10/src/cod/sounds.o(.sbss*);
        build/us_2003_07_10/src/cod/yada.o(.sbss*);
        build/us_2003_07_10/src/cod/movies.o(.sbss*);
        build/us_2003_07_10/src/cod/capybara.o(.sbss*);
    }
    . = ALIGN(., 0x4);
    cod_SBSS_END = .;
    cod_SBSS_SIZE = ABSOLUTE(cod_SBSS_END - cod_SBSS_START);

    cod_BSS_START = .;
    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.bss*);
        build/us_2003_07_10/src/cod/main.o(.bss*);
        build/us_2003_07_10/src/cod/graphics.o(.bss*);
        build/us_2003_07_10/src/cod/sounds.o(.bss*);
        build/us_2003_07_10/src/cod/yada.o(.bss*);
        build/us_2003_07_10/src/cod/movies.o(.bss*);
        build/us_2003_07_10/src/cod/capybara.o(.bss*);
    }
    . = ALIGN(., 0x4);
    cod_BSS_END = .;
    cod_BSS_SIZE = ABSOLUTE(cod_BSS_END - cod_BSS_START);

    cod_VUBSS_START = .;
    .vubss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us_2003_07_10/src/crt0/crt0.o(.vubss*);
        build/us_2003_07_10/src/cod/main.o(.vubss*);
        build/us_2003_07_10/src/cod/graphics.o(.vubss*);
        build/us_2003_07_10/src/cod/sounds.o(.vubss*);
        build/us_2003_07_10/src/cod/yada.o(.vubss*);
        build/us_2003_07_10/src/cod/movies.o(.vubss*);
        build/us_2003_07_10/src/cod/capybara.o(.vubss*);
    }
    . = ALIGN(., 0x4);
    cod_VUBSS_END = .;
    cod_VUBSS_SIZE = ABSOLUTE(cod_VUBSS_END - cod_VUBSS_START);

    cod_noload_VRAM_END = .;
    cod_noload_VRAM_SIZE = ABSOLUTE(cod_noload_VRAM_END - cod_noload_VRAM);

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
