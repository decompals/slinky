SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_1/actor/shy_squad.o(COMMON*);
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
