build/us/segments/main.o: \
    build/us/src/main/main.o \
    build/us/src/main/dmadata.o \
    build/us/asm/main/util.o

build/us/src/main/main.o:
build/us/src/main/dmadata.o:
build/us/asm/main/util.o:

-include build/us/src/main/main.d
-include build/us/src/main/dmadata.d
-include build/us/asm/main/util.d
