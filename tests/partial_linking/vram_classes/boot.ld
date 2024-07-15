SECTIONS
{
    . = 0x80000460;

    .text :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.text*);
        build/src/boot/dmadata.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.data*);
        build/src/boot/dmadata.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.rodata*);
        build/src/boot/dmadata.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.sdata*);
        build/src/boot/dmadata.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.sbss*);
        build/src/boot/dmadata.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.scommon*);
        build/src/boot/dmadata.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.bss*);
        build/src/boot/dmadata.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(COMMON*);
        build/src/boot/dmadata.o(COMMON*);
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
