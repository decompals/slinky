SECTIONS
{
    . = 0x80000460;

    .text :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.text*);
        build/src/libultra.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.data*);
        build/src/libultra.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.rodata*);
        build/src/libultra.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.sdata*);
        build/src/libultra.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.sbss*);
        build/src/libultra.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.scommon*);
        build/src/libultra.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.bss*);
        build/src/libultra.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(COMMON*);
        build/src/libultra.o(COMMON*);
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
