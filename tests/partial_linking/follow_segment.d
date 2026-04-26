build/us/rom.elf: \
    build/us/segments/boot.plf \
    build/us/segments/kanji.plf \
    build/us/segments/ascii.plf \
    build/us/segments/main.plf

build/us/segments/boot.plf:
build/us/segments/kanji.plf:
build/us/segments/ascii.plf:
build/us/segments/main.plf:

-include build/us/segments/boot.d
-include build/us/segments/kanji.d
-include build/us/segments/ascii.d
-include build/us/segments/main.d
