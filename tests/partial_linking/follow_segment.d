build/us/rom.elf: \
    build/us/segments/boot.o \
    build/us/segments/kanji.o \
    build/us/segments/ascii.o \
    build/us/segments/main.o

build/us/segments/boot.o:
build/us/segments/kanji.o:
build/us/segments/ascii.o:
build/us/segments/main.o:

-include build/us/segments/boot.d
-include build/us/segments/kanji.d
-include build/us/segments/ascii.d
-include build/us/segments/main.d
