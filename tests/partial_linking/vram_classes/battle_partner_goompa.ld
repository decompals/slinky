SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goompa.o(COMMON*);
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
