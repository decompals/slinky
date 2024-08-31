SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/kooper.o(COMMON*);
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
