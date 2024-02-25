SECTIONS
{
    __romPos = 0x0;

    _makeromSegmentRomStart = __romPos;
    _makeromSegmentStart = ADDR(.makerom);
    .makerom 0x80024C00 : AT(_makeromSegmentRomStart)
    {
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
    __romPos += SIZEOF(.makerom);
    _makeromSegmentRomEnd = __romPos;
    .makerom.noload (NOLOAD) :
    {
        _makeromSegmentBssStart = .;
        build/makerom/header.o(.sbss*);
        build/makerom/ipl3.o(.sbss*);
        build/makerom/entry.o(.sbss*);

        build/makerom/header.o(.scommon*);
        build/makerom/ipl3.o(.scommon*);
        build/makerom/entry.o(.scommon*);

        build/makerom/header.o(.bss*);
        build/makerom/ipl3.o(.bss*);
        build/makerom/entry.o(.bss*);

        build/makerom/header.o(COMMON*);
        build/makerom/ipl3.o(COMMON*);
        build/makerom/entry.o(COMMON*);
        _makeromSegmentBssEnd = .;
        _makeromSegmentBssSize = ABSOLUTE(_makeromSegmentBssEnd - _makeromSegmentBssStart);
    }
    _makeromSegmentEnd = .;

    _bootSegmentRomStart = __romPos;
    _bootSegmentStart = ADDR(.boot);
    .boot : AT(_bootSegmentRomStart)
    {
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
    __romPos += SIZEOF(.boot);
    _bootSegmentRomEnd = __romPos;
    .boot.noload (NOLOAD) :
    {
        _bootSegmentBssStart = .;
        build/boot/boot_main.o(.sbss*);

        build/boot/boot_main.o(.scommon*);

        build/boot/boot_main.o(.bss*);

        build/boot/boot_main.o(COMMON*);
        _bootSegmentBssEnd = .;
        _bootSegmentBssSize = ABSOLUTE(_bootSegmentBssEnd - _bootSegmentBssStart);
    }
    _bootSegmentEnd = .;

}
