SECTIONS
{
    . = 0x80000400;

    .text :
    {
        FILL(0x00000000);
        build/asm/entry.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/asm/entry.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/asm/entry.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/asm/entry.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/entry.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/entry.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/entry.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/asm/entry.o(COMMON*);
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
