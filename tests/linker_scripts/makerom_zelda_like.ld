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
        build/makerom/header.o(.data*);
        build/makerom/ipl3.o(.data*);
        build/makerom/entry.o(.data*);
        _makeromSegmentDataEnd = .;
        _makeromSegmentDataSize = ABSOLUTE(_makeromSegmentDataEnd - _makeromSegmentDataStart);

        _makeromSegmentTextStart = .;
        build/makerom/header.o(.text*);
        build/makerom/ipl3.o(.text*);
        build/makerom/entry.o(.text*);
        _makeromSegmentTextEnd = .;
        _makeromSegmentTextSize = ABSOLUTE(_makeromSegmentTextEnd - _makeromSegmentTextStart);

        _makeromSegmentRoDataStart = .;
        build/makerom/header.o(.rodata*);
        build/makerom/ipl3.o(.rodata*);
        build/makerom/entry.o(.rodata*);
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
        build/makerom/header.o(.sbss*);
        build/makerom/ipl3.o(.sbss*);
        build/makerom/entry.o(.sbss*);
        _makeromSegmentSbssEnd = .;
        _makeromSegmentSbssSize = ABSOLUTE(_makeromSegmentSbssEnd - _makeromSegmentSbssStart);

        _makeromSegmentScommonStart = .;
        build/makerom/header.o(.scommon*);
        build/makerom/ipl3.o(.scommon*);
        build/makerom/entry.o(.scommon*);
        _makeromSegmentScommonEnd = .;
        _makeromSegmentScommonSize = ABSOLUTE(_makeromSegmentScommonEnd - _makeromSegmentScommonStart);

        _makeromSegmentBssStart = .;
        build/makerom/header.o(.bss*);
        build/makerom/ipl3.o(.bss*);
        build/makerom/entry.o(.bss*);
        _makeromSegmentBssEnd = .;
        _makeromSegmentBssSize = ABSOLUTE(_makeromSegmentBssEnd - _makeromSegmentBssStart);

        _makeromSegmentCOMMONStart = .;
        build/makerom/header.o(COMMON*);
        build/makerom/ipl3.o(COMMON*);
        build/makerom/entry.o(COMMON*);
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
        build/boot/boot_main.o(.text*);
        _bootSegmentTextEnd = .;
        _bootSegmentTextSize = ABSOLUTE(_bootSegmentTextEnd - _bootSegmentTextStart);

        _bootSegmentDataStart = .;
        build/boot/boot_main.o(.data*);
        _bootSegmentDataEnd = .;
        _bootSegmentDataSize = ABSOLUTE(_bootSegmentDataEnd - _bootSegmentDataStart);

        _bootSegmentRoDataStart = .;
        build/boot/boot_main.o(.rodata*);
        _bootSegmentRoDataEnd = .;
        _bootSegmentRoDataSize = ABSOLUTE(_bootSegmentRoDataEnd - _bootSegmentRoDataStart);

        _bootSegmentSdataStart = .;
        build/boot/boot_main.o(.sdata*);
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
        build/boot/boot_main.o(.sbss*);
        _bootSegmentSbssEnd = .;
        _bootSegmentSbssSize = ABSOLUTE(_bootSegmentSbssEnd - _bootSegmentSbssStart);

        _bootSegmentScommonStart = .;
        build/boot/boot_main.o(.scommon*);
        _bootSegmentScommonEnd = .;
        _bootSegmentScommonSize = ABSOLUTE(_bootSegmentScommonEnd - _bootSegmentScommonStart);

        _bootSegmentBssStart = .;
        build/boot/boot_main.o(.bss*);
        _bootSegmentBssEnd = .;
        _bootSegmentBssSize = ABSOLUTE(_bootSegmentBssEnd - _bootSegmentBssStart);

        _bootSegmentCOMMONStart = .;
        build/boot/boot_main.o(COMMON*);
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

}
