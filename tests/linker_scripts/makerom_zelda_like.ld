SECTIONS
{
    __romPos = 0x0;

    _makeromSegmentRomStart = __romPos;
    _makeromSegmentStart = ADDR(.makerom);
    .makerom 0x80024C00 : AT(_makeromSegmentRomStart)
    {
        _makeromSegmentDataStart = .;
        build/makerom/header(.data*);
        build/makerom/ipl3(.data*);
        build/makerom/entry(.data*);
        _makeromSegmentDataEnd = .;
        _makeromSegmentDataSize = ABSOLUTE(_makeromSegmentDataEnd - _makeromSegmentDataStart);

        _makeromSegmentTextStart = .;
        build/makerom/header(.text*);
        build/makerom/ipl3(.text*);
        build/makerom/entry(.text*);
        _makeromSegmentTextEnd = .;
        _makeromSegmentTextSize = ABSOLUTE(_makeromSegmentTextEnd - _makeromSegmentTextStart);

        _makeromSegmentRoDataStart = .;
        build/makerom/header(.rodata*);
        build/makerom/ipl3(.rodata*);
        build/makerom/entry(.rodata*);
        _makeromSegmentRoDataEnd = .;
        _makeromSegmentRoDataSize = ABSOLUTE(_makeromSegmentRoDataEnd - _makeromSegmentRoDataStart);
    }
    __romPos += SIZEOF(.makerom);
    _makeromSegmentRomEnd = __romPos;
    .makerom.noload (NOLOAD) :
    {
        _makeromSegmentBssStart = .;
        build/makerom/header(.sbss*);
        build/makerom/ipl3(.sbss*);
        build/makerom/entry(.sbss*);

        build/makerom/header(.scommon*);
        build/makerom/ipl3(.scommon*);
        build/makerom/entry(.scommon*);

        build/makerom/header(.bss*);
        build/makerom/ipl3(.bss*);
        build/makerom/entry(.bss*);

        build/makerom/header(COMMON*);
        build/makerom/ipl3(COMMON*);
        build/makerom/entry(COMMON*);
        _makeromSegmentBssEnd = .;
        _makeromSegmentBssSize = ABSOLUTE(_makeromSegmentBssEnd - _makeromSegmentBssStart);
    }
    _makeromSegmentEnd = .;

    _bootSegmentRomStart = __romPos;
    _bootSegmentStart = ADDR(.boot);
    .boot : AT(_bootSegmentRomStart)
    {
        _bootSegmentTextStart = .;
        build/boot/boot_main(.text*);
        _bootSegmentTextEnd = .;
        _bootSegmentTextSize = ABSOLUTE(_bootSegmentTextEnd - _bootSegmentTextStart);

        _bootSegmentDataStart = .;
        build/boot/boot_main(.data*);
        _bootSegmentDataEnd = .;
        _bootSegmentDataSize = ABSOLUTE(_bootSegmentDataEnd - _bootSegmentDataStart);

        _bootSegmentRoDataStart = .;
        build/boot/boot_main(.rodata*);
        _bootSegmentRoDataEnd = .;
        _bootSegmentRoDataSize = ABSOLUTE(_bootSegmentRoDataEnd - _bootSegmentRoDataStart);

        _bootSegmentSdataStart = .;
        build/boot/boot_main(.sdata*);
        _bootSegmentSdataEnd = .;
        _bootSegmentSdataSize = ABSOLUTE(_bootSegmentSdataEnd - _bootSegmentSdataStart);
    }
    __romPos += SIZEOF(.boot);
    _bootSegmentRomEnd = __romPos;
    .boot.noload (NOLOAD) :
    {
        _bootSegmentBssStart = .;
        build/boot/boot_main(.sbss*);

        build/boot/boot_main(.scommon*);

        build/boot/boot_main(.bss*);

        build/boot/boot_main(COMMON*);
        _bootSegmentBssEnd = .;
        _bootSegmentBssSize = ABSOLUTE(_bootSegmentBssEnd - _bootSegmentBssStart);
    }
    _bootSegmentEnd = .;

}
