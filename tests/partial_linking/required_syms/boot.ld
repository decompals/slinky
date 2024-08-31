SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/boot/boot_main.o(COMMON*);
    }

    .symtab 0 : { *(.symtab); }
    .strtab 0 : { *(.strtab); }
    .shstrtab 0 : { *(.shstrtab); }

    /DISCARD/ :
    {
        *(.reginfo);
        *(.MIPS.abiflags);
        *(.MIPS.options);
        *(.note.gnu.build-id);
        *(.interp);
        *(.eh_frame);
        *(.got);
        *(*);
    }
}
