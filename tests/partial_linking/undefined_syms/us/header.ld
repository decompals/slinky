SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/data/rom_header.o(COMMON*);
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
        *(*);
    }
}
