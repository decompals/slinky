build/us/segments/boot.o: \
    build/us/src/boot/boot_main.o \
    build/us/src/libultra.o

build/us/src/boot/boot_main.o:
build/us/src/libultra.o:

-include build/us/src/boot/boot_main.d
-include build/us/src/libultra.d
