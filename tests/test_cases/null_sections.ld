SECTIONS
{
    __romPos = 0x0;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;

    .boot : AT(boot_ROM_START)
    {
        FILL(0x00000000);
        boot_TEXT_START = .;
        build/src/boot_main.o(.text*);
        build/src/dmadata.o(.text*);
        build/asm/util.o(.text*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/src/boot_main.o(.data*);
        build/src/dmadata.o(.data*);
        build/asm/util.o(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/src/boot_main.o(.rodata*);
        build/src/dmadata.o(.rodata*);
        build/asm/util.o(.rodata*);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/src/boot_main.o(.sdata*);
        build/src/dmadata.o(.sdata*);
        build/asm/util.o(.sdata*);
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
        build/src/boot_main.o(.sbss*);
        build/src/dmadata.o(.sbss*);
        build/asm/util.o(.sbss*);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/src/boot_main.o(.scommon*);
        build/src/dmadata.o(.scommon*);
        build/asm/util.o(.scommon*);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/src/boot_main.o(.bss*);
        build/src/dmadata.o(.bss*);
        build/asm/util.o(.bss*);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/src/boot_main.o(COMMON*);
        build/src/dmadata.o(COMMON*);
        build/asm/util.o(COMMON*);
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

    buffers_ROM_START = __romPos;
    buffers_VRAM = ADDR(.buffers);

    buffers_noload_VRAM = .;

    .buffers.noload (NOLOAD) :
    {
        FILL(0x00000000);
        buffers_SBSS_START = .;
        build/src/arenabuffer.o(.sbss*);
        build/src/scratchpad.o(.sbss*);
        build/src/framebuffer.o(.sbss*);
        buffers_SBSS_END = .;
        buffers_SBSS_SIZE = ABSOLUTE(buffers_SBSS_END - buffers_SBSS_START);

        buffers_SCOMMON_START = .;
        build/src/arenabuffer.o(.scommon*);
        build/src/scratchpad.o(.scommon*);
        build/src/framebuffer.o(.scommon*);
        buffers_SCOMMON_END = .;
        buffers_SCOMMON_SIZE = ABSOLUTE(buffers_SCOMMON_END - buffers_SCOMMON_START);

        buffers_BSS_START = .;
        build/src/arenabuffer.o(.bss*);
        build/src/scratchpad.o(.bss*);
        build/src/framebuffer.o(.bss*);
        buffers_BSS_END = .;
        buffers_BSS_SIZE = ABSOLUTE(buffers_BSS_END - buffers_BSS_START);

        buffersCOMMON_START = .;
        build/src/arenabuffer.o(COMMON*);
        build/src/scratchpad.o(COMMON*);
        build/src/framebuffer.o(COMMON*);
        buffersCOMMON_END = .;
        buffersCOMMON_SIZE = ABSOLUTE(buffersCOMMON_END - buffersCOMMON_START);
    }

    buffers_noload_VRAM_END = .;
    buffers_noload_VRAM_SIZE = ABSOLUTE(buffers_noload_VRAM_END - buffers_noload_VRAM);

    __romPos += SIZEOF(.buffers);
    buffers_VRAM_END = .;
    buffers_VRAM_SIZE = ABSOLUTE(buffers_VRAM_END - buffers_VRAM);
    buffers_ROM_END = __romPos;
    buffers_ROM_SIZE = ABSOLUTE(buffers_ROM_END - buffers_ROM_START);

    assets_ROM_START = __romPos;
    assets_VRAM = ADDR(.assets);
    assets_alloc_VRAM = .;

    .assets : AT(assets_ROM_START)
    {
        FILL(0x00000000);
        assets_TEXT_START = .;
        build/src/font.o(.text*);
        build/src/music.o(.text*);
        build/src/videos.o(.text*);
        assets_TEXT_END = .;
        assets_TEXT_SIZE = ABSOLUTE(assets_TEXT_END - assets_TEXT_START);

        assets_DATA_START = .;
        build/src/font.o(.data*);
        build/src/music.o(.data*);
        build/src/videos.o(.data*);
        assets_DATA_END = .;
        assets_DATA_SIZE = ABSOLUTE(assets_DATA_END - assets_DATA_START);

        assets_RODATA_START = .;
        build/src/font.o(.rodata*);
        build/src/music.o(.rodata*);
        build/src/videos.o(.rodata*);
        assets_RODATA_END = .;
        assets_RODATA_SIZE = ABSOLUTE(assets_RODATA_END - assets_RODATA_START);

        assets_SDATA_START = .;
        build/src/font.o(.sdata*);
        build/src/music.o(.sdata*);
        build/src/videos.o(.sdata*);
        assets_SDATA_END = .;
        assets_SDATA_SIZE = ABSOLUTE(assets_SDATA_END - assets_SDATA_START);
    }

    assets_alloc_VRAM_END = .;
    assets_alloc_VRAM_SIZE = ABSOLUTE(assets_alloc_VRAM_END - assets_alloc_VRAM);


    __romPos += SIZEOF(.assets);
    assets_VRAM_END = .;
    assets_VRAM_SIZE = ABSOLUTE(assets_VRAM_END - assets_VRAM);
    assets_ROM_END = __romPos;
    assets_ROM_SIZE = ABSOLUTE(assets_ROM_END - assets_ROM_START);

    .symtab 0 : { *(.symtab); }
    .strtab 0 : { *(.strtab); }
    .shstrtab 0 : { *(.shstrtab); }

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
