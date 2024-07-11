SECTIONS
{
    __romPos = 0x0;

    _makeromSegmentRomStart = __romPos;
    _makeromSegmentStart = ADDR(.makerom);
    _makerom_allocSegmentStart = .;

    .makerom 0x80024C00 : AT(_makeromSegmentRomStart)
    {
        FILL(0x00000000);
        _makeromSegmentDataStart = .;
        build/us/makerom/header.o(.data*);
        build/us/makerom/ipl3.o(.data*);
        build/us/makerom/entry.o(.data*);
        . = ALIGN(., 0x10);
        _makeromSegmentDataEnd = .;
        _makeromSegmentDataSize = ABSOLUTE(_makeromSegmentDataEnd - _makeromSegmentDataStart);

        _makeromSegmentTextStart = .;
        build/us/makerom/header.o(.text*);
        build/us/makerom/ipl3.o(.text*);
        build/us/makerom/entry.o(.text*);
        . = ALIGN(., 0x10);
        _makeromSegmentTextEnd = .;
        _makeromSegmentTextSize = ABSOLUTE(_makeromSegmentTextEnd - _makeromSegmentTextStart);

        _makeromSegmentRoDataStart = .;
        build/us/makerom/header.o(.rodata*);
        build/us/makerom/ipl3.o(.rodata*);
        build/us/makerom/entry.o(.rodata*);
        . = ALIGN(., 0x10);
        _makeromSegmentRoDataEnd = .;
        _makeromSegmentRoDataSize = ABSOLUTE(_makeromSegmentRoDataEnd - _makeromSegmentRoDataStart);
    }

    _makerom_allocSegmentEnd = .;
    _makerom_allocSegmentSize = ABSOLUTE(_makerom_allocSegmentEnd - _makerom_allocSegmentStart);

    _makerom_noloadSegmentStart = .;

    .makerom.noload (NOLOAD) :
    {
        FILL(0x00000000);
        _makeromSegmentSbssStart = .;
        build/us/makerom/header.o(.sbss*);
        build/us/makerom/ipl3.o(.sbss*);
        build/us/makerom/entry.o(.sbss*);
        . = ALIGN(., 0x10);
        _makeromSegmentSbssEnd = .;
        _makeromSegmentSbssSize = ABSOLUTE(_makeromSegmentSbssEnd - _makeromSegmentSbssStart);

        _makeromSegmentScommonStart = .;
        build/us/makerom/header.o(.scommon*);
        build/us/makerom/ipl3.o(.scommon*);
        build/us/makerom/entry.o(.scommon*);
        . = ALIGN(., 0x10);
        _makeromSegmentScommonEnd = .;
        _makeromSegmentScommonSize = ABSOLUTE(_makeromSegmentScommonEnd - _makeromSegmentScommonStart);

        _makeromSegmentBssStart = .;
        build/us/makerom/header.o(.bss*);
        build/us/makerom/ipl3.o(.bss*);
        build/us/makerom/entry.o(.bss*);
        . = ALIGN(., 0x10);
        _makeromSegmentBssEnd = .;
        _makeromSegmentBssSize = ABSOLUTE(_makeromSegmentBssEnd - _makeromSegmentBssStart);

        _makeromSegmentCOMMONStart = .;
        build/us/makerom/header.o(COMMON*);
        build/us/makerom/ipl3.o(COMMON*);
        build/us/makerom/entry.o(COMMON*);
        . = ALIGN(., 0x10);
        _makeromSegmentCOMMONEnd = .;
        _makeromSegmentCOMMONSize = ABSOLUTE(_makeromSegmentCOMMONEnd - _makeromSegmentCOMMONStart);
    }

    _makerom_noloadSegmentEnd = .;
    _makerom_noloadSegmentSize = ABSOLUTE(_makerom_noloadSegmentEnd - _makerom_noloadSegmentStart);
    _makeromSegmentEnd = .;
    _makeromSegmentSize = ABSOLUTE(_makeromSegmentEnd - _makeromSegmentStart);
    __romPos += SIZEOF(.makerom);
    _makeromSegmentRomEnd = __romPos;
    _makeromSegmentRomSize = ABSOLUTE(_makeromSegmentRomEnd - _makeromSegmentRomStart);

    _bootSegmentRomStart = __romPos;
    _bootSegmentStart = ADDR(.boot);
    _boot_allocSegmentStart = .;

    .boot : AT(_bootSegmentRomStart)
    {
        FILL(0x00000000);
        _bootSegmentTextStart = .;
        build/us/boot/boot_main.o(.text*);
        . = ALIGN(., 0x10);
        _bootSegmentTextEnd = .;
        _bootSegmentTextSize = ABSOLUTE(_bootSegmentTextEnd - _bootSegmentTextStart);

        _bootSegmentDataStart = .;
        build/us/boot/boot_main.o(.data*);
        . = ALIGN(., 0x10);
        _bootSegmentDataEnd = .;
        _bootSegmentDataSize = ABSOLUTE(_bootSegmentDataEnd - _bootSegmentDataStart);

        _bootSegmentRoDataStart = .;
        build/us/boot/boot_main.o(.rodata*);
        . = ALIGN(., 0x10);
        _bootSegmentRoDataEnd = .;
        _bootSegmentRoDataSize = ABSOLUTE(_bootSegmentRoDataEnd - _bootSegmentRoDataStart);

        _bootSegmentSdataStart = .;
        build/us/boot/boot_main.o(.sdata*);
        . = ALIGN(., 0x10);
        _bootSegmentSdataEnd = .;
        _bootSegmentSdataSize = ABSOLUTE(_bootSegmentSdataEnd - _bootSegmentSdataStart);
    }

    _boot_allocSegmentEnd = .;
    _boot_allocSegmentSize = ABSOLUTE(_boot_allocSegmentEnd - _boot_allocSegmentStart);

    _boot_noloadSegmentStart = .;

    .boot.noload (NOLOAD) :
    {
        FILL(0x00000000);
        _bootSegmentSbssStart = .;
        build/us/boot/boot_main.o(.sbss*);
        . = ALIGN(., 0x10);
        _bootSegmentSbssEnd = .;
        _bootSegmentSbssSize = ABSOLUTE(_bootSegmentSbssEnd - _bootSegmentSbssStart);

        _bootSegmentScommonStart = .;
        build/us/boot/boot_main.o(.scommon*);
        . = ALIGN(., 0x10);
        _bootSegmentScommonEnd = .;
        _bootSegmentScommonSize = ABSOLUTE(_bootSegmentScommonEnd - _bootSegmentScommonStart);

        _bootSegmentBssStart = .;
        build/us/boot/boot_main.o(.bss*);
        . = ALIGN(., 0x10);
        _bootSegmentBssEnd = .;
        _bootSegmentBssSize = ABSOLUTE(_bootSegmentBssEnd - _bootSegmentBssStart);

        _bootSegmentCOMMONStart = .;
        build/us/boot/boot_main.o(COMMON*);
        . = ALIGN(., 0x10);
        _bootSegmentCOMMONEnd = .;
        _bootSegmentCOMMONSize = ABSOLUTE(_bootSegmentCOMMONEnd - _bootSegmentCOMMONStart);
    }

    _boot_noloadSegmentEnd = .;
    _boot_noloadSegmentSize = ABSOLUTE(_boot_noloadSegmentEnd - _boot_noloadSegmentStart);
    _bootSegmentEnd = .;
    _bootSegmentSize = ABSOLUTE(_bootSegmentEnd - _bootSegmentStart);
    __romPos += SIZEOF(.boot);
    _bootSegmentRomEnd = __romPos;
    _bootSegmentRomSize = ABSOLUTE(_bootSegmentRomEnd - _bootSegmentRomStart);

    _codeSegmentRomStart = __romPos;
    _codeSegmentStart = ADDR(.code);
    _code_allocSegmentStart = .;

    .code : AT(_codeSegmentRomStart)
    {
        FILL(0x00000000);
        _codeSegmentTextStart = .;
        build/us/src/code/main.o(.text*);
        build/us/src/code/z_game_over.o(.text*);
        build/us/src/code/z_message_PAL.o(.text*);
        . = ALIGN(., 0x10);
        _codeSegmentTextEnd = .;
        _codeSegmentTextSize = ABSOLUTE(_codeSegmentTextEnd - _codeSegmentTextStart);

        _codeSegmentDataStart = .;
        build/us/src/code/main.o(.data*);
        . = ALIGN(., 0x10);
        _codeSegmentDataEnd = .;
        _codeSegmentDataSize = ABSOLUTE(_codeSegmentDataEnd - _codeSegmentDataStart);

        _codeSegmentRoDataStart = .;
        build/us/src/code/main.o(.rodata*);
        build/us/src/code/z_game_over.o(.data*);
        build/us/src/code/z_game_over.o(.rodata*);
        build/us/src/code/z_message_PAL.o(.data*);
        build/us/src/code/z_message_PAL.o(.rodata*);
        . = ALIGN(., 0x10);
        _codeSegmentRoDataEnd = .;
        _codeSegmentRoDataSize = ABSOLUTE(_codeSegmentRoDataEnd - _codeSegmentRoDataStart);

        _codeSegmentSdataStart = .;
        build/us/src/code/main.o(.sdata*);
        build/us/src/code/z_game_over.o(.sdata*);
        build/us/src/code/z_message_PAL.o(.sdata*);
        . = ALIGN(., 0x10);
        _codeSegmentSdataEnd = .;
        _codeSegmentSdataSize = ABSOLUTE(_codeSegmentSdataEnd - _codeSegmentSdataStart);
    }

    _code_allocSegmentEnd = .;
    _code_allocSegmentSize = ABSOLUTE(_code_allocSegmentEnd - _code_allocSegmentStart);

    _code_noloadSegmentStart = .;

    .code.noload (NOLOAD) :
    {
        FILL(0x00000000);
        _codeSegmentSbssStart = .;
        build/us/src/code/main.o(.sbss*);
        build/us/src/code/z_game_over.o(.sbss*);
        build/us/src/code/z_message_PAL.o(.sbss*);
        . = ALIGN(., 0x10);
        _codeSegmentSbssEnd = .;
        _codeSegmentSbssSize = ABSOLUTE(_codeSegmentSbssEnd - _codeSegmentSbssStart);

        _codeSegmentScommonStart = .;
        build/us/src/code/main.o(.scommon*);
        build/us/src/code/z_game_over.o(.scommon*);
        build/us/src/code/z_message_PAL.o(.scommon*);
        . = ALIGN(., 0x10);
        _codeSegmentScommonEnd = .;
        _codeSegmentScommonSize = ABSOLUTE(_codeSegmentScommonEnd - _codeSegmentScommonStart);

        _codeSegmentBssStart = .;
        build/us/src/code/main.o(.bss*);
        build/us/src/code/z_game_over.o(.bss*);
        build/us/src/code/z_message_PAL.o(.bss*);
        . = ALIGN(., 0x10);
        _codeSegmentBssEnd = .;
        _codeSegmentBssSize = ABSOLUTE(_codeSegmentBssEnd - _codeSegmentBssStart);

        _codeSegmentCOMMONStart = .;
        build/us/src/code/main.o(COMMON*);
        build/us/src/code/z_game_over.o(COMMON*);
        build/us/src/code/z_message_PAL.o(COMMON*);
        . = ALIGN(., 0x10);
        _codeSegmentCOMMONEnd = .;
        _codeSegmentCOMMONSize = ABSOLUTE(_codeSegmentCOMMONEnd - _codeSegmentCOMMONStart);
    }

    _code_noloadSegmentEnd = .;
    _code_noloadSegmentSize = ABSOLUTE(_code_noloadSegmentEnd - _code_noloadSegmentStart);
    _codeSegmentEnd = .;
    _codeSegmentSize = ABSOLUTE(_codeSegmentEnd - _codeSegmentStart);
    __romPos += SIZEOF(.code);
    _codeSegmentRomEnd = __romPos;
    _codeSegmentRomSize = ABSOLUTE(_codeSegmentRomEnd - _codeSegmentRomStart);

    __romPos = ALIGN(__romPos, 0x1000);
    . = ALIGN(., 0x1000);
    _gameplay_keepSegmentRomStart = __romPos;
    _gameplay_keepSegmentStart = ADDR(.gameplay_keep);
    _gameplay_keep_allocSegmentStart = .;

    .gameplay_keep 0x04000000 : AT(_gameplay_keepSegmentRomStart)
    {
        FILL(0x00000000);
        _gameplay_keepSegmentTextStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(.text*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentTextEnd = .;
        _gameplay_keepSegmentTextSize = ABSOLUTE(_gameplay_keepSegmentTextEnd - _gameplay_keepSegmentTextStart);

        _gameplay_keepSegmentDataStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(.data*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentDataEnd = .;
        _gameplay_keepSegmentDataSize = ABSOLUTE(_gameplay_keepSegmentDataEnd - _gameplay_keepSegmentDataStart);

        _gameplay_keepSegmentRoDataStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(.rodata*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentRoDataEnd = .;
        _gameplay_keepSegmentRoDataSize = ABSOLUTE(_gameplay_keepSegmentRoDataEnd - _gameplay_keepSegmentRoDataStart);

        _gameplay_keepSegmentSdataStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(.sdata*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentSdataEnd = .;
        _gameplay_keepSegmentSdataSize = ABSOLUTE(_gameplay_keepSegmentSdataEnd - _gameplay_keepSegmentSdataStart);
    }

    _gameplay_keep_allocSegmentEnd = .;
    _gameplay_keep_allocSegmentSize = ABSOLUTE(_gameplay_keep_allocSegmentEnd - _gameplay_keep_allocSegmentStart);

    _gameplay_keep_noloadSegmentStart = .;

    .gameplay_keep.noload (NOLOAD) :
    {
        FILL(0x00000000);
        _gameplay_keepSegmentSbssStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(.sbss*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentSbssEnd = .;
        _gameplay_keepSegmentSbssSize = ABSOLUTE(_gameplay_keepSegmentSbssEnd - _gameplay_keepSegmentSbssStart);

        _gameplay_keepSegmentScommonStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(.scommon*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentScommonEnd = .;
        _gameplay_keepSegmentScommonSize = ABSOLUTE(_gameplay_keepSegmentScommonEnd - _gameplay_keepSegmentScommonStart);

        _gameplay_keepSegmentBssStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(.bss*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentBssEnd = .;
        _gameplay_keepSegmentBssSize = ABSOLUTE(_gameplay_keepSegmentBssEnd - _gameplay_keepSegmentBssStart);

        _gameplay_keepSegmentCOMMONStart = .;
        build/us/assets/objects/gameplay_keep/gameplay_keep.o(COMMON*);
        . = ALIGN(., 0x10);
        _gameplay_keepSegmentCOMMONEnd = .;
        _gameplay_keepSegmentCOMMONSize = ABSOLUTE(_gameplay_keepSegmentCOMMONEnd - _gameplay_keepSegmentCOMMONStart);
    }

    _gameplay_keep_noloadSegmentEnd = .;
    _gameplay_keep_noloadSegmentSize = ABSOLUTE(_gameplay_keep_noloadSegmentEnd - _gameplay_keep_noloadSegmentStart);
    _gameplay_keepSegmentEnd = .;
    _gameplay_keepSegmentSize = ABSOLUTE(_gameplay_keepSegmentEnd - _gameplay_keepSegmentStart);
    __romPos += SIZEOF(.gameplay_keep);
    _gameplay_keepSegmentRomEnd = __romPos;
    _gameplay_keepSegmentRomSize = ABSOLUTE(_gameplay_keepSegmentRomEnd - _gameplay_keepSegmentRomStart);

    __romPos = ALIGN(__romPos, 0x1000);
    . = ALIGN(., 0x1000);
    _gameplay_dangeon_keepSegmentRomStart = __romPos;
    _gameplay_dangeon_keepSegmentStart = ADDR(.gameplay_dangeon_keep);
    _gameplay_dangeon_keep_allocSegmentStart = .;

    .gameplay_dangeon_keep 0x05000000 : AT(_gameplay_dangeon_keepSegmentRomStart)
    {
        FILL(0x00000000);
        _gameplay_dangeon_keepSegmentTextStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.text*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentTextEnd = .;
        _gameplay_dangeon_keepSegmentTextSize = ABSOLUTE(_gameplay_dangeon_keepSegmentTextEnd - _gameplay_dangeon_keepSegmentTextStart);

        _gameplay_dangeon_keepSegmentDataStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.data*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentDataEnd = .;
        _gameplay_dangeon_keepSegmentDataSize = ABSOLUTE(_gameplay_dangeon_keepSegmentDataEnd - _gameplay_dangeon_keepSegmentDataStart);

        _gameplay_dangeon_keepSegmentRoDataStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.rodata*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentRoDataEnd = .;
        _gameplay_dangeon_keepSegmentRoDataSize = ABSOLUTE(_gameplay_dangeon_keepSegmentRoDataEnd - _gameplay_dangeon_keepSegmentRoDataStart);

        _gameplay_dangeon_keepSegmentSdataStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.sdata*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentSdataEnd = .;
        _gameplay_dangeon_keepSegmentSdataSize = ABSOLUTE(_gameplay_dangeon_keepSegmentSdataEnd - _gameplay_dangeon_keepSegmentSdataStart);
    }

    _gameplay_dangeon_keep_allocSegmentEnd = .;
    _gameplay_dangeon_keep_allocSegmentSize = ABSOLUTE(_gameplay_dangeon_keep_allocSegmentEnd - _gameplay_dangeon_keep_allocSegmentStart);

    _gameplay_dangeon_keep_noloadSegmentStart = .;

    .gameplay_dangeon_keep.noload (NOLOAD) :
    {
        FILL(0x00000000);
        _gameplay_dangeon_keepSegmentSbssStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.sbss*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentSbssEnd = .;
        _gameplay_dangeon_keepSegmentSbssSize = ABSOLUTE(_gameplay_dangeon_keepSegmentSbssEnd - _gameplay_dangeon_keepSegmentSbssStart);

        _gameplay_dangeon_keepSegmentScommonStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.scommon*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentScommonEnd = .;
        _gameplay_dangeon_keepSegmentScommonSize = ABSOLUTE(_gameplay_dangeon_keepSegmentScommonEnd - _gameplay_dangeon_keepSegmentScommonStart);

        _gameplay_dangeon_keepSegmentBssStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.bss*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentBssEnd = .;
        _gameplay_dangeon_keepSegmentBssSize = ABSOLUTE(_gameplay_dangeon_keepSegmentBssEnd - _gameplay_dangeon_keepSegmentBssStart);

        _gameplay_dangeon_keepSegmentCOMMONStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(COMMON*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentCOMMONEnd = .;
        _gameplay_dangeon_keepSegmentCOMMONSize = ABSOLUTE(_gameplay_dangeon_keepSegmentCOMMONEnd - _gameplay_dangeon_keepSegmentCOMMONStart);
    }

    _gameplay_dangeon_keep_noloadSegmentEnd = .;
    _gameplay_dangeon_keep_noloadSegmentSize = ABSOLUTE(_gameplay_dangeon_keep_noloadSegmentEnd - _gameplay_dangeon_keep_noloadSegmentStart);
    _gameplay_dangeon_keepSegmentEnd = .;
    _gameplay_dangeon_keepSegmentSize = ABSOLUTE(_gameplay_dangeon_keepSegmentEnd - _gameplay_dangeon_keepSegmentStart);
    __romPos += SIZEOF(.gameplay_dangeon_keep);
    _gameplay_dangeon_keepSegmentRomEnd = __romPos;
    _gameplay_dangeon_keepSegmentRomSize = ABSOLUTE(_gameplay_dangeon_keepSegmentRomEnd - _gameplay_dangeon_keepSegmentRomStart);

    __romPos = ALIGN(__romPos, 0x1000);
    . = ALIGN(., 0x1000);
    _gameplay_dangeon_keepSegmentRomStart = __romPos;
    _gameplay_dangeon_keepSegmentStart = ADDR(.gameplay_dangeon_keep);
    _gameplay_dangeon_keep_allocSegmentStart = .;

    .gameplay_dangeon_keep 0x05000000 : AT(_gameplay_dangeon_keepSegmentRomStart)
    {
        FILL(0x00000000);
        _gameplay_dangeon_keepSegmentTextStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.text*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentTextEnd = .;
        _gameplay_dangeon_keepSegmentTextSize = ABSOLUTE(_gameplay_dangeon_keepSegmentTextEnd - _gameplay_dangeon_keepSegmentTextStart);

        _gameplay_dangeon_keepSegmentDataStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.data*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentDataEnd = .;
        _gameplay_dangeon_keepSegmentDataSize = ABSOLUTE(_gameplay_dangeon_keepSegmentDataEnd - _gameplay_dangeon_keepSegmentDataStart);

        _gameplay_dangeon_keepSegmentRoDataStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.rodata*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentRoDataEnd = .;
        _gameplay_dangeon_keepSegmentRoDataSize = ABSOLUTE(_gameplay_dangeon_keepSegmentRoDataEnd - _gameplay_dangeon_keepSegmentRoDataStart);

        _gameplay_dangeon_keepSegmentSdataStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.sdata*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentSdataEnd = .;
        _gameplay_dangeon_keepSegmentSdataSize = ABSOLUTE(_gameplay_dangeon_keepSegmentSdataEnd - _gameplay_dangeon_keepSegmentSdataStart);
    }

    _gameplay_dangeon_keep_allocSegmentEnd = .;
    _gameplay_dangeon_keep_allocSegmentSize = ABSOLUTE(_gameplay_dangeon_keep_allocSegmentEnd - _gameplay_dangeon_keep_allocSegmentStart);

    _gameplay_dangeon_keep_noloadSegmentStart = .;

    .gameplay_dangeon_keep.noload (NOLOAD) :
    {
        FILL(0x00000000);
        _gameplay_dangeon_keepSegmentSbssStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.sbss*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentSbssEnd = .;
        _gameplay_dangeon_keepSegmentSbssSize = ABSOLUTE(_gameplay_dangeon_keepSegmentSbssEnd - _gameplay_dangeon_keepSegmentSbssStart);

        _gameplay_dangeon_keepSegmentScommonStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.scommon*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentScommonEnd = .;
        _gameplay_dangeon_keepSegmentScommonSize = ABSOLUTE(_gameplay_dangeon_keepSegmentScommonEnd - _gameplay_dangeon_keepSegmentScommonStart);

        _gameplay_dangeon_keepSegmentBssStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(.bss*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentBssEnd = .;
        _gameplay_dangeon_keepSegmentBssSize = ABSOLUTE(_gameplay_dangeon_keepSegmentBssEnd - _gameplay_dangeon_keepSegmentBssStart);

        _gameplay_dangeon_keepSegmentCOMMONStart = .;
        build/us/assets/objects/gameplay_dangeon_keep/gameplay_dangeon_keep.o(COMMON*);
        . = ALIGN(., 0x10);
        _gameplay_dangeon_keepSegmentCOMMONEnd = .;
        _gameplay_dangeon_keepSegmentCOMMONSize = ABSOLUTE(_gameplay_dangeon_keepSegmentCOMMONEnd - _gameplay_dangeon_keepSegmentCOMMONStart);
    }

    _gameplay_dangeon_keep_noloadSegmentEnd = .;
    _gameplay_dangeon_keep_noloadSegmentSize = ABSOLUTE(_gameplay_dangeon_keep_noloadSegmentEnd - _gameplay_dangeon_keep_noloadSegmentStart);
    _gameplay_dangeon_keepSegmentEnd = .;
    _gameplay_dangeon_keepSegmentSize = ABSOLUTE(_gameplay_dangeon_keepSegmentEnd - _gameplay_dangeon_keepSegmentStart);
    __romPos += SIZEOF(.gameplay_dangeon_keep);
    _gameplay_dangeon_keepSegmentRomEnd = __romPos;
    _gameplay_dangeon_keepSegmentRomSize = ABSOLUTE(_gameplay_dangeon_keepSegmentRomEnd - _gameplay_dangeon_keepSegmentRomStart);

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
