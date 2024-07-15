SECTIONS
{
    __romPos = 0x0;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;

    .boot 0x80000460 : AT(boot_ROM_START)
    {
        FILL(0x00000000);
        boot_TEXT_START = .;
        build/us/src/boot/boot_main.o(.text*);
        build/us/src/boot/file1.o(.text*);
        build/us/src/boot/file3.o(.text*);
        build/us/src/boot/file4.o(.text*);
        build/us/src/boot/file8.o(.text*);
        build/us/src/boot/file9.o(.text*);
        build/us/src/boot/dmadata.o(.text*);
        build/us/src/boot/file12.o(.text*);
        build/us/src/boot/file15.o(.text*);
        build/us/src/boot/file16.o(.text*);
        build/us/src/boot/file17.o(.text*);
        build/us/src/boot/util.o(.text*);
        build/us/src/boot/file21.o(.text*);
        build/us/src/boot/file24.o(.text*);
        build/us/src/boot/file28.o(.text*);
        build/us/src/boot/file29.o(.text*);
        build/us/lib/libgcc.a:*(.text*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/us/src/boot/boot_main.o(.data*);
        build/us/src/boot/file1.o(.data*);
        build/us/src/boot/file3.o(.data*);
        build/us/src/boot/file4.o(.data*);
        build/us/src/boot/file8.o(.data*);
        build/us/src/boot/file9.o(.data*);
        build/us/src/boot/dmadata.o(.data*);
        build/us/src/boot/file12.o(.data*);
        build/us/src/boot/file15.o(.data*);
        build/us/src/boot/file16.o(.data*);
        build/us/src/boot/file17.o(.data*);
        build/us/src/boot/util.o(.data*);
        build/us/src/boot/file21.o(.data*);
        build/us/src/boot/file24.o(.data*);
        build/us/src/boot/file28.o(.data*);
        build/us/src/boot/file29.o(.data*);
        build/us/lib/libgcc.a:*(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/us/src/boot/boot_main.o(.rodata*);
        build/us/src/boot/file1.o(.rodata*);
        build/us/src/boot/file3.o(.rodata*);
        build/us/src/boot/file4.o(.rodata*);
        build/us/src/boot/file8.o(.rodata*);
        build/us/src/boot/file9.o(.rodata*);
        build/us/src/boot/dmadata.o(.rodata*);
        build/us/src/boot/file12.o(.rodata*);
        build/us/src/boot/file15.o(.rodata*);
        build/us/src/boot/file16.o(.rodata*);
        build/us/src/boot/file17.o(.rodata*);
        build/us/src/boot/util.o(.rodata*);
        build/us/src/boot/file21.o(.rodata*);
        build/us/src/boot/file24.o(.rodata*);
        build/us/src/boot/file28.o(.rodata*);
        build/us/src/boot/file29.o(.rodata*);
        build/us/lib/libgcc.a:*(.rodata*);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/us/src/boot/boot_main.o(.sdata*);
        build/us/src/boot/file1.o(.sdata*);
        build/us/src/boot/file3.o(.sdata*);
        build/us/src/boot/file4.o(.sdata*);
        build/us/src/boot/file8.o(.sdata*);
        build/us/src/boot/file9.o(.sdata*);
        build/us/src/boot/dmadata.o(.sdata*);
        build/us/src/boot/file12.o(.sdata*);
        build/us/src/boot/file15.o(.sdata*);
        build/us/src/boot/file16.o(.sdata*);
        build/us/src/boot/file17.o(.sdata*);
        build/us/src/boot/util.o(.sdata*);
        build/us/src/boot/file21.o(.sdata*);
        build/us/src/boot/file24.o(.sdata*);
        build/us/src/boot/file28.o(.sdata*);
        build/us/src/boot/file29.o(.sdata*);
        build/us/lib/libgcc.a:*(.sdata*);
        boot_SDATA_END = .;
        boot_SDATA_SIZE = ABSOLUTE(boot_SDATA_END - boot_SDATA_START);
    }

    boot_alloc_VRAM_END = .;
    boot_alloc_VRAM_SIZE = ABSOLUTE(boot_alloc_VRAM_END - boot_alloc_VRAM);

    boot_noload_VRAM = .;

    .boot.noload (NOLOAD) :
    {
        FILL(0x00000000);
        boot_SBSS_START = .;
        build/us/src/boot/boot_main.o(.sbss*);
        build/us/src/boot/file1.o(.sbss*);
        build/us/src/boot/file3.o(.sbss*);
        build/us/src/boot/file4.o(.sbss*);
        build/us/src/boot/file8.o(.sbss*);
        build/us/src/boot/file9.o(.sbss*);
        build/us/src/boot/dmadata.o(.sbss*);
        build/us/src/boot/file12.o(.sbss*);
        build/us/src/boot/file15.o(.sbss*);
        build/us/src/boot/file16.o(.sbss*);
        build/us/src/boot/file17.o(.sbss*);
        build/us/src/boot/util.o(.sbss*);
        build/us/src/boot/file21.o(.sbss*);
        build/us/src/boot/file24.o(.sbss*);
        build/us/src/boot/file28.o(.sbss*);
        build/us/src/boot/file29.o(.sbss*);
        build/us/lib/libgcc.a:*(.sbss*);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/us/src/boot/boot_main.o(.scommon*);
        build/us/src/boot/file1.o(.scommon*);
        build/us/src/boot/file3.o(.scommon*);
        build/us/src/boot/file4.o(.scommon*);
        build/us/src/boot/file8.o(.scommon*);
        build/us/src/boot/file9.o(.scommon*);
        build/us/src/boot/dmadata.o(.scommon*);
        build/us/src/boot/file12.o(.scommon*);
        build/us/src/boot/file15.o(.scommon*);
        build/us/src/boot/file16.o(.scommon*);
        build/us/src/boot/file17.o(.scommon*);
        build/us/src/boot/util.o(.scommon*);
        build/us/src/boot/file21.o(.scommon*);
        build/us/src/boot/file24.o(.scommon*);
        build/us/src/boot/file28.o(.scommon*);
        build/us/src/boot/file29.o(.scommon*);
        build/us/lib/libgcc.a:*(.scommon*);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/us/src/boot/boot_main.o(.bss*);
        build/us/src/boot/file1.o(.bss*);
        build/us/src/boot/file3.o(.bss*);
        build/us/src/boot/file4.o(.bss*);
        build/us/src/boot/file8.o(.bss*);
        build/us/src/boot/file9.o(.bss*);
        build/us/src/boot/dmadata.o(.bss*);
        build/us/src/boot/file12.o(.bss*);
        build/us/src/boot/file15.o(.bss*);
        build/us/src/boot/file16.o(.bss*);
        build/us/src/boot/file17.o(.bss*);
        build/us/src/boot/util.o(.bss*);
        build/us/src/boot/file21.o(.bss*);
        build/us/src/boot/file24.o(.bss*);
        build/us/src/boot/file28.o(.bss*);
        build/us/src/boot/file29.o(.bss*);
        build/us/lib/libgcc.a:*(.bss*);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/us/src/boot/boot_main.o(COMMON*);
        build/us/src/boot/file1.o(COMMON*);
        build/us/src/boot/file3.o(COMMON*);
        build/us/src/boot/file4.o(COMMON*);
        build/us/src/boot/file8.o(COMMON*);
        build/us/src/boot/file9.o(COMMON*);
        build/us/src/boot/dmadata.o(COMMON*);
        build/us/src/boot/file12.o(COMMON*);
        build/us/src/boot/file15.o(COMMON*);
        build/us/src/boot/file16.o(COMMON*);
        build/us/src/boot/file17.o(COMMON*);
        build/us/src/boot/util.o(COMMON*);
        build/us/src/boot/file21.o(COMMON*);
        build/us/src/boot/file24.o(COMMON*);
        build/us/src/boot/file28.o(COMMON*);
        build/us/src/boot/file29.o(COMMON*);
        build/us/lib/libgcc.a:*(COMMON*);
        bootCOMMON_END = .;
        bootCOMMON_SIZE = ABSOLUTE(bootCOMMON_END - bootCOMMON_START);
    }

    boot_noload_VRAM_END = .;
    boot_noload_VRAM_SIZE = ABSOLUTE(boot_noload_VRAM_END - boot_noload_VRAM);
    boot_VRAM_END = .;
    boot_VRAM_SIZE = ABSOLUTE(boot_VRAM_END - boot_VRAM);
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    boot_ROM_SIZE = ABSOLUTE(boot_ROM_END - boot_ROM_START);

    kanji_ROM_START = __romPos;
    kanji_VRAM = ADDR(.kanji);
    kanji_alloc_VRAM = .;

    .kanji 0x01000000 : AT(kanji_ROM_START)
    {
        FILL(0x00000000);
        kanji_TEXT_START = .;
        build/us/src/language/kanji.o(.text*);
        kanji_TEXT_END = .;
        kanji_TEXT_SIZE = ABSOLUTE(kanji_TEXT_END - kanji_TEXT_START);

        kanji_DATA_START = .;
        build/us/src/language/kanji.o(.data*);
        kanji_DATA_END = .;
        kanji_DATA_SIZE = ABSOLUTE(kanji_DATA_END - kanji_DATA_START);

        kanji_RODATA_START = .;
        build/us/src/language/kanji.o(.rodata*);
        kanji_RODATA_END = .;
        kanji_RODATA_SIZE = ABSOLUTE(kanji_RODATA_END - kanji_RODATA_START);

        kanji_SDATA_START = .;
        build/us/src/language/kanji.o(.sdata*);
        kanji_SDATA_END = .;
        kanji_SDATA_SIZE = ABSOLUTE(kanji_SDATA_END - kanji_SDATA_START);
    }

    kanji_alloc_VRAM_END = .;
    kanji_alloc_VRAM_SIZE = ABSOLUTE(kanji_alloc_VRAM_END - kanji_alloc_VRAM);

    kanji_noload_VRAM = .;

    .kanji.noload (NOLOAD) :
    {
        FILL(0x00000000);
        kanji_SBSS_START = .;
        build/us/src/language/kanji.o(.sbss*);
        kanji_SBSS_END = .;
        kanji_SBSS_SIZE = ABSOLUTE(kanji_SBSS_END - kanji_SBSS_START);

        kanji_SCOMMON_START = .;
        build/us/src/language/kanji.o(.scommon*);
        kanji_SCOMMON_END = .;
        kanji_SCOMMON_SIZE = ABSOLUTE(kanji_SCOMMON_END - kanji_SCOMMON_START);

        kanji_BSS_START = .;
        build/us/src/language/kanji.o(.bss*);
        kanji_BSS_END = .;
        kanji_BSS_SIZE = ABSOLUTE(kanji_BSS_END - kanji_BSS_START);

        kanjiCOMMON_START = .;
        build/us/src/language/kanji.o(COMMON*);
        kanjiCOMMON_END = .;
        kanjiCOMMON_SIZE = ABSOLUTE(kanjiCOMMON_END - kanjiCOMMON_START);
    }

    kanji_noload_VRAM_END = .;
    kanji_noload_VRAM_SIZE = ABSOLUTE(kanji_noload_VRAM_END - kanji_noload_VRAM);
    kanji_VRAM_END = .;
    kanji_VRAM_SIZE = ABSOLUTE(kanji_VRAM_END - kanji_VRAM);
    __romPos += SIZEOF(.kanji);
    kanji_ROM_END = __romPos;
    kanji_ROM_SIZE = ABSOLUTE(kanji_ROM_END - kanji_ROM_START);

    latin_alphabet_ROM_START = __romPos;
    latin_alphabet_VRAM = ADDR(.latin_alphabet);
    latin_alphabet_alloc_VRAM = .;

    .latin_alphabet 0x01000000 : AT(latin_alphabet_ROM_START)
    {
        FILL(0x00000000);
        latin_alphabet_TEXT_START = .;
        build/us/src/language/latin_alphabet.o(.text*);
        latin_alphabet_TEXT_END = .;
        latin_alphabet_TEXT_SIZE = ABSOLUTE(latin_alphabet_TEXT_END - latin_alphabet_TEXT_START);

        latin_alphabet_DATA_START = .;
        build/us/src/language/latin_alphabet.o(.data*);
        latin_alphabet_DATA_END = .;
        latin_alphabet_DATA_SIZE = ABSOLUTE(latin_alphabet_DATA_END - latin_alphabet_DATA_START);

        latin_alphabet_RODATA_START = .;
        build/us/src/language/latin_alphabet.o(.rodata*);
        latin_alphabet_RODATA_END = .;
        latin_alphabet_RODATA_SIZE = ABSOLUTE(latin_alphabet_RODATA_END - latin_alphabet_RODATA_START);

        latin_alphabet_SDATA_START = .;
        build/us/src/language/latin_alphabet.o(.sdata*);
        latin_alphabet_SDATA_END = .;
        latin_alphabet_SDATA_SIZE = ABSOLUTE(latin_alphabet_SDATA_END - latin_alphabet_SDATA_START);
    }

    latin_alphabet_alloc_VRAM_END = .;
    latin_alphabet_alloc_VRAM_SIZE = ABSOLUTE(latin_alphabet_alloc_VRAM_END - latin_alphabet_alloc_VRAM);

    latin_alphabet_noload_VRAM = .;

    .latin_alphabet.noload (NOLOAD) :
    {
        FILL(0x00000000);
        latin_alphabet_SBSS_START = .;
        build/us/src/language/latin_alphabet.o(.sbss*);
        latin_alphabet_SBSS_END = .;
        latin_alphabet_SBSS_SIZE = ABSOLUTE(latin_alphabet_SBSS_END - latin_alphabet_SBSS_START);

        latin_alphabet_SCOMMON_START = .;
        build/us/src/language/latin_alphabet.o(.scommon*);
        latin_alphabet_SCOMMON_END = .;
        latin_alphabet_SCOMMON_SIZE = ABSOLUTE(latin_alphabet_SCOMMON_END - latin_alphabet_SCOMMON_START);

        latin_alphabet_BSS_START = .;
        build/us/src/language/latin_alphabet.o(.bss*);
        latin_alphabet_BSS_END = .;
        latin_alphabet_BSS_SIZE = ABSOLUTE(latin_alphabet_BSS_END - latin_alphabet_BSS_START);

        latin_alphabetCOMMON_START = .;
        build/us/src/language/latin_alphabet.o(COMMON*);
        latin_alphabetCOMMON_END = .;
        latin_alphabetCOMMON_SIZE = ABSOLUTE(latin_alphabetCOMMON_END - latin_alphabetCOMMON_START);
    }

    latin_alphabet_noload_VRAM_END = .;
    latin_alphabet_noload_VRAM_SIZE = ABSOLUTE(latin_alphabet_noload_VRAM_END - latin_alphabet_noload_VRAM);
    latin_alphabet_VRAM_END = .;
    latin_alphabet_VRAM_SIZE = ABSOLUTE(latin_alphabet_VRAM_END - latin_alphabet_VRAM);
    __romPos += SIZEOF(.latin_alphabet);
    latin_alphabet_ROM_END = __romPos;
    latin_alphabet_ROM_SIZE = ABSOLUTE(latin_alphabet_ROM_END - latin_alphabet_ROM_START);

    player_model_ROM_START = __romPos;
    player_model_VRAM = ADDR(.player_model);
    player_model_alloc_VRAM = .;

    .player_model 0x05000000 : AT(player_model_ROM_START)
    {
        FILL(0x00000000);
        player_model_TEXT_START = .;
        build/us/src/assets/player_model.o(.text*);
        player_model_TEXT_END = .;
        player_model_TEXT_SIZE = ABSOLUTE(player_model_TEXT_END - player_model_TEXT_START);

        player_model_DATA_START = .;
        build/us/src/assets/player_model.o(.data*);
        player_model_DATA_END = .;
        player_model_DATA_SIZE = ABSOLUTE(player_model_DATA_END - player_model_DATA_START);

        player_model_RODATA_START = .;
        build/us/src/assets/player_model.o(.rodata*);
        player_model_RODATA_END = .;
        player_model_RODATA_SIZE = ABSOLUTE(player_model_RODATA_END - player_model_RODATA_START);

        player_model_SDATA_START = .;
        build/us/src/assets/player_model.o(.sdata*);
        player_model_SDATA_END = .;
        player_model_SDATA_SIZE = ABSOLUTE(player_model_SDATA_END - player_model_SDATA_START);
    }

    player_model_alloc_VRAM_END = .;
    player_model_alloc_VRAM_SIZE = ABSOLUTE(player_model_alloc_VRAM_END - player_model_alloc_VRAM);

    player_model_noload_VRAM = .;

    .player_model.noload (NOLOAD) :
    {
        FILL(0x00000000);
        player_model_SBSS_START = .;
        build/us/src/assets/player_model.o(.sbss*);
        player_model_SBSS_END = .;
        player_model_SBSS_SIZE = ABSOLUTE(player_model_SBSS_END - player_model_SBSS_START);

        player_model_SCOMMON_START = .;
        build/us/src/assets/player_model.o(.scommon*);
        player_model_SCOMMON_END = .;
        player_model_SCOMMON_SIZE = ABSOLUTE(player_model_SCOMMON_END - player_model_SCOMMON_START);

        player_model_BSS_START = .;
        build/us/src/assets/player_model.o(.bss*);
        player_model_BSS_END = .;
        player_model_BSS_SIZE = ABSOLUTE(player_model_BSS_END - player_model_BSS_START);

        player_modelCOMMON_START = .;
        build/us/src/assets/player_model.o(COMMON*);
        player_modelCOMMON_END = .;
        player_modelCOMMON_SIZE = ABSOLUTE(player_modelCOMMON_END - player_modelCOMMON_START);
    }

    player_model_noload_VRAM_END = .;
    player_model_noload_VRAM_SIZE = ABSOLUTE(player_model_noload_VRAM_END - player_model_noload_VRAM);
    player_model_VRAM_END = .;
    player_model_VRAM_SIZE = ABSOLUTE(player_model_VRAM_END - player_model_VRAM);
    __romPos += SIZEOF(.player_model);
    player_model_ROM_END = __romPos;
    player_model_ROM_SIZE = ABSOLUTE(player_model_ROM_END - player_model_ROM_START);

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
