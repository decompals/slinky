SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_partner/goombario.o(COMMON*);
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
