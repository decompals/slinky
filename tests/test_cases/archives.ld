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
        build/src/boot/boot_main.o(.text*);
        build/src/boot/dmadata.o(.text*);
        build/asm/util.o(.text*);
        build/lib/libgultra_rom.a:*(.text*);
        build/lib/libmus.a:player.o(.text*);
        build/lib/libmus.a:player_fx.o(.text*);
        build/lib/libmus.a:aud_dma.o(.text*);
        build/lib/libmus.a:aud_sched.o(.text*);
        build/lib/libmus.a:aud_thread.o(.text*);
        build/lib/libmus.a:lib_memory.o(.text*);
        build/lib/libmus.a:aud_samples.o(.text*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/src/boot/boot_main.o(.data*);
        build/src/boot/dmadata.o(.data*);
        build/asm/util.o(.data*);
        build/lib/libgultra_rom.a:*(.data*);
        build/lib/libmus.a:player.o(.data*);
        build/lib/libmus.a:player_fx.o(.data*);
        build/lib/libmus.a:aud_dma.o(.data*);
        build/lib/libmus.a:aud_sched.o(.data*);
        build/lib/libmus.a:aud_thread.o(.data*);
        build/lib/libmus.a:lib_memory.o(.data*);
        build/lib/libmus.a:aud_samples.o(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/src/boot/boot_main.o(.rodata*);
        build/src/boot/dmadata.o(.rodata*);
        build/asm/util.o(.rodata*);
        build/lib/libgultra_rom.a:*(.rodata*);
        build/lib/libmus.a:player.o(.rodata*);
        build/lib/libmus.a:player_fx.o(.rodata*);
        build/lib/libmus.a:aud_dma.o(.rodata*);
        build/lib/libmus.a:aud_sched.o(.rodata*);
        build/lib/libmus.a:aud_thread.o(.rodata*);
        build/lib/libmus.a:lib_memory.o(.rodata*);
        build/lib/libmus.a:aud_samples.o(.rodata*);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/src/boot/boot_main.o(.sdata*);
        build/src/boot/dmadata.o(.sdata*);
        build/asm/util.o(.sdata*);
        build/lib/libgultra_rom.a:*(.sdata*);
        build/lib/libmus.a:player.o(.sdata*);
        build/lib/libmus.a:player_fx.o(.sdata*);
        build/lib/libmus.a:aud_dma.o(.sdata*);
        build/lib/libmus.a:aud_sched.o(.sdata*);
        build/lib/libmus.a:aud_thread.o(.sdata*);
        build/lib/libmus.a:lib_memory.o(.sdata*);
        build/lib/libmus.a:aud_samples.o(.sdata*);
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
        build/src/boot/boot_main.o(.sbss*);
        build/src/boot/dmadata.o(.sbss*);
        build/asm/util.o(.sbss*);
        build/lib/libgultra_rom.a:*(.sbss*);
        build/lib/libmus.a:player.o(.sbss*);
        build/lib/libmus.a:player_fx.o(.sbss*);
        build/lib/libmus.a:aud_dma.o(.sbss*);
        build/lib/libmus.a:aud_sched.o(.sbss*);
        build/lib/libmus.a:aud_thread.o(.sbss*);
        build/lib/libmus.a:lib_memory.o(.sbss*);
        build/lib/libmus.a:aud_samples.o(.sbss*);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/src/boot/boot_main.o(.scommon*);
        build/src/boot/dmadata.o(.scommon*);
        build/asm/util.o(.scommon*);
        build/lib/libgultra_rom.a:*(.scommon*);
        build/lib/libmus.a:player.o(.scommon*);
        build/lib/libmus.a:player_fx.o(.scommon*);
        build/lib/libmus.a:aud_dma.o(.scommon*);
        build/lib/libmus.a:aud_sched.o(.scommon*);
        build/lib/libmus.a:aud_thread.o(.scommon*);
        build/lib/libmus.a:lib_memory.o(.scommon*);
        build/lib/libmus.a:aud_samples.o(.scommon*);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/src/boot/boot_main.o(.bss*);
        build/src/boot/dmadata.o(.bss*);
        build/asm/util.o(.bss*);
        build/lib/libgultra_rom.a:*(.bss*);
        build/lib/libmus.a:player.o(.bss*);
        build/lib/libmus.a:player_fx.o(.bss*);
        build/lib/libmus.a:aud_dma.o(.bss*);
        build/lib/libmus.a:aud_sched.o(.bss*);
        build/lib/libmus.a:aud_thread.o(.bss*);
        build/lib/libmus.a:lib_memory.o(.bss*);
        build/lib/libmus.a:aud_samples.o(.bss*);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/src/boot/boot_main.o(COMMON*);
        build/src/boot/dmadata.o(COMMON*);
        build/asm/util.o(COMMON*);
        build/lib/libgultra_rom.a:*(COMMON*);
        build/lib/libmus.a:player.o(COMMON*);
        build/lib/libmus.a:player_fx.o(COMMON*);
        build/lib/libmus.a:aud_dma.o(COMMON*);
        build/lib/libmus.a:aud_sched.o(COMMON*);
        build/lib/libmus.a:aud_thread.o(COMMON*);
        build/lib/libmus.a:lib_memory.o(COMMON*);
        build/lib/libmus.a:aud_samples.o(COMMON*);
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
