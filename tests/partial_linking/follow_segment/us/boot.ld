SECTIONS
{
    . = 0x80000460;

    .text :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(.text*);
        build/us/src/libultra.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(.data*);
        build/us/src/libultra.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(.rodata*);
        build/us/src/libultra.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(.sdata*);
        build/us/src/libultra.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(.sbss*);
        build/us/src/libultra.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(.scommon*);
        build/us/src/libultra.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(.bss*);
        build/us/src/libultra.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/boot/boot_main.o(COMMON*);
        build/us/src/libultra.o(COMMON*);
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
