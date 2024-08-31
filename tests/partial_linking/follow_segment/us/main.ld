SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.text*);
        KEEP(build/us/src/main/dmadata.o(.text*));
        KEEP(build/us/asm/main/util.o(.text*));
    }

    .data :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.data*);
        KEEP(build/us/src/main/dmadata.o(.data*));
        KEEP(build/us/asm/main/util.o(.data*));
    }

    .rodata :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.rodata*);
        build/us/src/main/dmadata.o(.rodata*);
        KEEP(build/us/asm/main/util.o(.rodata*));
    }

    .sdata :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.sdata*);
        build/us/src/main/dmadata.o(.sdata*);
        KEEP(build/us/asm/main/util.o(.sdata*));
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.sbss*);
        build/us/src/main/dmadata.o(.sbss*);
        KEEP(build/us/asm/main/util.o(.sbss*));
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.scommon*);
        build/us/src/main/dmadata.o(.scommon*);
        KEEP(build/us/asm/main/util.o(.scommon*));
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(.bss*);
        build/us/src/main/dmadata.o(.bss*);
        KEEP(build/us/asm/main/util.o(.bss*));
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/us/src/main/main.o(COMMON*);
        build/us/src/main/dmadata.o(COMMON*);
        KEEP(build/us/asm/main/util.o(COMMON*));
    }

    .symtab 0 :
    {
        *(.symtab);
    }
    .strtab 0 :
    {
        *(.strtab);
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
        *(.got);
        *(*);
    }
}
