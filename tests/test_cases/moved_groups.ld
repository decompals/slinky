SECTIONS
{
    HIDDEN(__romPos = 0x0);

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    main_alloc_VRAM = .;

    .main 0x80000400 : AT(main_ROM_START)
    {
        FILL(0x00000000);
        main_TEXT_START = .;
        build/src/main_segment/main.o(.text*);
        build/src/main_segment/nnsched.o(.text*);
        build/src/main_segment/joy.o(.text*);
        build/src/libmus/player.o(.text*);
        build/src/libmus/player_fx.o(.text*);
        build/src/libmus/aud_dma.o(.text*);
        build/src/libmus/aud_sched.o(.text*);
        build/src/libmus/aud_thread.o(.text*);
        build/src/libmus/lib_memory.o(.text*);
        build/src/libmus/aud_samples.o(.text*);
        KEEP(build/src/stufsh/thingy1.o(.text*));
        build/src/stufsh/thingy2.o(.text*);
        build/src/stufsh/thonga3.o(.text*);
        build/src/stufsh/capy4.o(.text*);
        build/src/stufsh/placeholder5.o(.text*);
        build/src/stufsh/idk6.o(.text*);
        build/src/stufsh/another7.o(.text*);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);

        main_DATA_START = .;
        build/src/main_segment/main.o(.data*);
        build/src/main_segment/nnsched.o(.data*);
        build/src/main_segment/joy.o(.data*);
        build/src/libmus/player.o(.data*);
        build/src/libmus/player_fx.o(.data*);
        build/src/libmus/aud_dma.o(.data*);
        build/src/libmus/aud_sched.o(.data*);
        build/src/libmus/aud_thread.o(.data*);
        build/src/libmus/lib_memory.o(.data*);
        build/src/libmus/aud_samples.o(.data*);
        build/src/libmus/player.o(.rodata*);
        build/src/libmus/player_fx.o(.rodata*);
        build/src/libmus/aud_dma.o(.rodata*);
        build/src/libmus/aud_sched.o(.rodata*);
        build/src/libmus/aud_thread.o(.rodata*);
        build/src/libmus/lib_memory.o(.rodata*);
        build/src/libmus/aud_samples.o(.rodata*);
        build/src/main_segment/main.o(.rodata*);
        build/src/main_segment/nnsched.o(.rodata*);
        build/src/main_segment/joy.o(.rodata*);
        build/src/stufsh/thingy1.o(.data*);
        KEEP(build/src/stufsh/thingy2.o(.data*));
        KEEP(build/src/stufsh/thonga3.o(.data*));
        KEEP(build/src/stufsh/capy4.o(.data*));
        build/src/stufsh/placeholder5.o(.data*);
        build/src/stufsh/idk6.o(.data*);
        KEEP(build/src/stufsh/another7.o(.data*));
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);

        main_RODATA_START = .;
        build/src/stufsh/thingy1.o(.rodata*);
        build/src/stufsh/thingy2.o(.rodata*);
        KEEP(build/src/stufsh/thonga3.o(.rodata*));
        KEEP(build/src/stufsh/capy4.o(.rodata*));
        build/src/stufsh/placeholder5.o(.rodata*);
        build/src/stufsh/idk6.o(.rodata*);
        build/src/stufsh/another7.o(.rodata*);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);

        main_SDATA_START = .;
        build/src/main_segment/main.o(.sdata*);
        build/src/main_segment/nnsched.o(.sdata*);
        build/src/main_segment/joy.o(.sdata*);
        build/src/libmus/player.o(.sdata*);
        build/src/libmus/player_fx.o(.sdata*);
        build/src/libmus/aud_dma.o(.sdata*);
        build/src/libmus/aud_sched.o(.sdata*);
        build/src/libmus/aud_thread.o(.sdata*);
        build/src/libmus/lib_memory.o(.sdata*);
        build/src/libmus/aud_samples.o(.sdata*);
        build/src/stufsh/thingy1.o(.sdata*);
        build/src/stufsh/thingy2.o(.sdata*);
        build/src/stufsh/thonga3.o(.sdata*);
        build/src/stufsh/capy4.o(.sdata*);
        build/src/stufsh/placeholder5.o(.sdata*);
        build/src/stufsh/idk6.o(.sdata*);
        build/src/stufsh/another7.o(.sdata*);
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
        build/src/main_segment/main.o(.sbss*);
        build/src/main_segment/nnsched.o(.sbss*);
        build/src/main_segment/joy.o(.sbss*);
        build/src/libmus/player.o(.sbss*);
        build/src/libmus/player_fx.o(.sbss*);
        build/src/libmus/aud_dma.o(.sbss*);
        build/src/libmus/aud_sched.o(.sbss*);
        build/src/libmus/aud_thread.o(.sbss*);
        build/src/libmus/lib_memory.o(.sbss*);
        build/src/libmus/aud_samples.o(.sbss*);
        build/src/stufsh/thingy1.o(.sbss*);
        build/src/stufsh/thingy2.o(.sbss*);
        build/src/stufsh/thonga3.o(.sbss*);
        build/src/stufsh/capy4.o(.sbss*);
        build/src/stufsh/placeholder5.o(.sbss*);
        build/src/stufsh/idk6.o(.sbss*);
        build/src/stufsh/another7.o(.sbss*);
        main_SBSS_END = .;
        main_SBSS_SIZE = ABSOLUTE(main_SBSS_END - main_SBSS_START);

        main_SCOMMON_START = .;
        build/src/main_segment/main.o(.scommon*);
        build/src/main_segment/nnsched.o(.scommon*);
        build/src/main_segment/joy.o(.scommon*);
        build/src/libmus/player.o(.scommon*);
        build/src/libmus/player_fx.o(.scommon*);
        build/src/libmus/aud_dma.o(.scommon*);
        build/src/libmus/aud_sched.o(.scommon*);
        build/src/libmus/aud_thread.o(.scommon*);
        build/src/libmus/lib_memory.o(.scommon*);
        build/src/libmus/aud_samples.o(.scommon*);
        build/src/stufsh/thingy1.o(.scommon*);
        build/src/stufsh/thingy2.o(.scommon*);
        build/src/stufsh/thonga3.o(.scommon*);
        build/src/stufsh/capy4.o(.scommon*);
        build/src/stufsh/placeholder5.o(.scommon*);
        build/src/stufsh/idk6.o(.scommon*);
        build/src/stufsh/another7.o(.scommon*);
        main_SCOMMON_END = .;
        main_SCOMMON_SIZE = ABSOLUTE(main_SCOMMON_END - main_SCOMMON_START);

        main_BSS_START = .;
        build/src/main_segment/main.o(.bss*);
        build/src/main_segment/nnsched.o(.bss*);
        build/src/main_segment/joy.o(.bss*);
        build/src/libmus/player.o(.bss*);
        build/src/libmus/player_fx.o(.bss*);
        build/src/libmus/aud_dma.o(.bss*);
        build/src/libmus/aud_sched.o(.bss*);
        build/src/libmus/aud_thread.o(.bss*);
        build/src/libmus/lib_memory.o(.bss*);
        build/src/libmus/aud_samples.o(.bss*);
        build/src/stufsh/thingy1.o(.bss*);
        build/src/stufsh/thingy2.o(.bss*);
        build/src/stufsh/thonga3.o(.bss*);
        build/src/stufsh/capy4.o(.bss*);
        KEEP(build/src/stufsh/placeholder5.o(.bss*));
        KEEP(build/src/stufsh/idk6.o(.bss*));
        build/src/stufsh/another7.o(.bss*);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);

        mainCOMMON_START = .;
        build/src/main_segment/main.o(COMMON*);
        build/src/main_segment/nnsched.o(COMMON*);
        build/src/main_segment/joy.o(COMMON*);
        build/src/libmus/player.o(COMMON*);
        build/src/libmus/player_fx.o(COMMON*);
        build/src/libmus/aud_dma.o(COMMON*);
        build/src/libmus/aud_sched.o(COMMON*);
        build/src/libmus/aud_thread.o(COMMON*);
        build/src/libmus/lib_memory.o(COMMON*);
        build/src/libmus/aud_samples.o(COMMON*);
        build/src/stufsh/thingy1.o(COMMON*);
        build/src/stufsh/thingy2.o(COMMON*);
        build/src/stufsh/thonga3.o(COMMON*);
        build/src/stufsh/capy4.o(COMMON*);
        build/src/stufsh/placeholder5.o(COMMON*);
        build/src/stufsh/idk6.o(COMMON*);
        build/src/stufsh/another7.o(COMMON*);
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
