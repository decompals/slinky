SECTIONS
{
    .text :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(.text*);
        build/src/battle_code/camera.o(.text*);
        build/src/battle_code/actors.o(.text*);
        build/src/battle_code/popup_messages.o(.text*);
    }

    .data :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(.data*);
        build/src/battle_code/camera.o(.data*);
        build/src/battle_code/actors.o(.data*);
        build/src/battle_code/popup_messages.o(.data*);
    }

    .rodata :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(.rodata*);
        build/src/battle_code/camera.o(.rodata*);
        build/src/battle_code/actors.o(.rodata*);
        build/src/battle_code/popup_messages.o(.rodata*);
    }

    .sdata :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(.sdata*);
        build/src/battle_code/camera.o(.sdata*);
        build/src/battle_code/actors.o(.sdata*);
        build/src/battle_code/popup_messages.o(.sdata*);
    }

    .sbss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(.sbss*);
        build/src/battle_code/camera.o(.sbss*);
        build/src/battle_code/actors.o(.sbss*);
        build/src/battle_code/popup_messages.o(.sbss*);
    }

    .scommon (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(.scommon*);
        build/src/battle_code/camera.o(.scommon*);
        build/src/battle_code/actors.o(.scommon*);
        build/src/battle_code/popup_messages.o(.scommon*);
    }

    .bss (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(.bss*);
        build/src/battle_code/camera.o(.bss*);
        build/src/battle_code/actors.o(.bss*);
        build/src/battle_code/popup_messages.o(.bss*);
    }

    COMMON (NOLOAD) :
    {
        FILL(0x00000000);
        build/src/battle_code/btl_states_actions.o(COMMON*);
        build/src/battle_code/camera.o(COMMON*);
        build/src/battle_code/actors.o(COMMON*);
        build/src/battle_code/popup_messages.o(COMMON*);
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
