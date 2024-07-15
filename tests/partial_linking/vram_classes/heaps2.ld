SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/heaps2/heaps2.o(COMMON*);
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
