SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle/area/omo2_3/actor/shy_stack.o(COMMON*);
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
