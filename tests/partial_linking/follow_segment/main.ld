SECTIONS
{
    .text : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.text*);
        build/src/main/dmadata.o(.text*);
        build/asm/main/util.o(.text*);
    }

    .data : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.data*);
        build/src/main/dmadata.o(.data*);
        build/asm/main/util.o(.data*);
    }

    .rodata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.rodata*);
        build/src/main/dmadata.o(.rodata*);
        build/asm/main/util.o(.rodata*);
    }

    .sdata : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.sdata*);
        build/src/main/dmadata.o(.sdata*);
        build/asm/main/util.o(.sdata*);
    }

    .sbss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.sbss*);
        build/src/main/dmadata.o(.sbss*);
        build/asm/main/util.o(.sbss*);
    }

    .scommon (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.scommon*);
        build/src/main/dmadata.o(.scommon*);
        build/asm/main/util.o(.scommon*);
    }

    .bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(.bss*);
        build/src/main/dmadata.o(.bss*);
        build/asm/main/util.o(.bss*);
    }

    COMMON (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        build/src/main/main.o(COMMON*);
        build/src/main/dmadata.o(COMMON*);
        build/asm/main/util.o(COMMON*);
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
