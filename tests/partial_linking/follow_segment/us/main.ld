SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.text*);
        build/us/src/main/dmadata.o(.text*);
        build/us/asm/main/util.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.data*);
        build/us/src/main/dmadata.o(.data*);
        build/us/asm/main/util.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.rodata*);
        build/us/src/main/dmadata.o(.rodata*);
        build/us/asm/main/util.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.sdata*);
        build/us/src/main/dmadata.o(.sdata*);
        build/us/asm/main/util.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.sbss*);
        build/us/src/main/dmadata.o(.sbss*);
        build/us/asm/main/util.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.scommon*);
        build/us/src/main/dmadata.o(.scommon*);
        build/us/asm/main/util.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.bss*);
        build/us/src/main/dmadata.o(.bss*);
        build/us/asm/main/util.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(COMMON*);
        build/us/src/main/dmadata.o(COMMON*);
        build/us/asm/main/util.o(COMMON*);
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
