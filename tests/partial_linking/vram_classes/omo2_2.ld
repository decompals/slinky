SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_2/actor/stilt_guy.o(COMMON*);
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
