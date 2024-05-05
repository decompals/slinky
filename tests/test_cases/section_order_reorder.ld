SECTIONS
{
    __romPos = 0x0;

    code_ROM_START = __romPos;
    code_VRAM = ADDR(.code);
    code_alloc_VRAM = .;

    .code 0x80024C00 : AT(code_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        code_TEXT_START = .;
        build/src/code/main.o(.text*);
        build/src/code/engine.o(.sdata*);
        build/src/code/entities.o(.text*);
        build/src/code/background.o(.text*);
        build/src/code/music.o(.text*);
        build/src/code/music.o(.data*);
        build/src/code/music.o(.rodata*);
        build/src/code/music.o(.sdata*);
        . = ALIGN(., 0x10);
        code_TEXT_END = .;
        code_TEXT_SIZE = ABSOLUTE(code_TEXT_END - code_TEXT_START);

        code_DATA_START = .;
        build/src/code/main.o(.data*);
        build/src/code/engine.o(.text*);
        build/src/code/background.o(.data*);
        build/src/code/background.o(.rodata*);
        . = ALIGN(., 0x10);
        code_DATA_END = .;
        code_DATA_SIZE = ABSOLUTE(code_DATA_END - code_DATA_START);

        code_RODATA_START = .;
        build/src/code/main.o(.rodata*);
        build/src/code/engine.o(.data*);
        build/src/code/entities.o(.data*);
        build/src/code/entities.o(.rodata*);
        build/src/code/sfx.o(.text*);
        build/src/code/sfx.o(.data*);
        build/src/code/sfx.o(.rodata*);
        build/src/code/sfx.o(.sdata*);
        . = ALIGN(., 0x10);
        code_RODATA_END = .;
        code_RODATA_SIZE = ABSOLUTE(code_RODATA_END - code_RODATA_START);

        code_SDATA_START = .;
        build/src/code/main.o(.sdata*);
        build/src/code/engine.o(.rodata*);
        build/src/code/entities.o(.sdata*);
        build/src/code/background.o(.sdata*);
        . = ALIGN(., 0x10);
        code_SDATA_END = .;
        code_SDATA_SIZE = ABSOLUTE(code_SDATA_END - code_SDATA_START);
    }

    code_alloc_VRAM_END = .;
    code_alloc_VRAM_SIZE = ABSOLUTE(code_alloc_VRAM_END - code_alloc_VRAM);

    code_noload_VRAM = .;

    .code.noload (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        code_SBSS_START = .;
        build/src/code/main.o(.sbss*);
        build/src/code/engine.o(.sbss*);
        build/src/code/entities.o(.sbss*);
        build/src/code/background.o(.sbss*);
        build/src/code/music.o(.sbss*);
        build/src/code/sfx.o(.sbss*);
        . = ALIGN(., 0x10);
        code_SBSS_END = .;
        code_SBSS_SIZE = ABSOLUTE(code_SBSS_END - code_SBSS_START);

        code_SCOMMON_START = .;
        build/src/code/main.o(.scommon*);
        build/src/code/engine.o(.scommon*);
        build/src/code/entities.o(.scommon*);
        build/src/code/background.o(.scommon*);
        build/src/code/music.o(.scommon*);
        build/src/code/sfx.o(.scommon*);
        . = ALIGN(., 0x10);
        code_SCOMMON_END = .;
        code_SCOMMON_SIZE = ABSOLUTE(code_SCOMMON_END - code_SCOMMON_START);

        code_BSS_START = .;
        build/src/code/main.o(.bss*);
        build/src/code/engine.o(.bss*);
        build/src/code/entities.o(.bss*);
        build/src/code/background.o(.bss*);
        build/src/code/music.o(.bss*);
        build/src/code/sfx.o(.bss*);
        . = ALIGN(., 0x10);
        code_BSS_END = .;
        code_BSS_SIZE = ABSOLUTE(code_BSS_END - code_BSS_START);

        codeCOMMON_START = .;
        build/src/code/main.o(COMMON*);
        build/src/code/engine.o(COMMON*);
        build/src/code/entities.o(COMMON*);
        build/src/code/background.o(COMMON*);
        build/src/code/music.o(COMMON*);
        build/src/code/sfx.o(COMMON*);
        . = ALIGN(., 0x10);
        codeCOMMON_END = .;
        codeCOMMON_SIZE = ABSOLUTE(codeCOMMON_END - codeCOMMON_START);
    }

    code_noload_VRAM_END = .;
    code_noload_VRAM_SIZE = ABSOLUTE(code_noload_VRAM_END - code_noload_VRAM);
    code_VRAM_END = .;
    code_VRAM_SIZE = ABSOLUTE(code_VRAM_END - code_VRAM);
    __romPos += SIZEOF(.code);
    code_ROM_END = __romPos;
    code_ROM_SIZE = ABSOLUTE(code_ROM_END - code_ROM_START);

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
