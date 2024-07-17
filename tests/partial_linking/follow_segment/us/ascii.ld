SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/alphabets/ascii.o(COMMON*);
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
