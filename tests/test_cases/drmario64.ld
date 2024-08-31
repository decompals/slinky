SECTIONS
{
    __romPos = 0x0;

    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    header_alloc_VRAM = .;

    .header 0x8F000000 : AT(header_ROM_START)
    {
        FILL(0x00000000);
        header_TEXT_START = .;
        build/us/src/rom_header/rom_header.o(.text*);
        header_TEXT_END = .;
        header_TEXT_SIZE = ABSOLUTE(header_TEXT_END - header_TEXT_START);

        header_DATA_START = .;
        build/us/src/rom_header/rom_header.o(.data*);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);

        header_RODATA_START = .;
        build/us/src/rom_header/rom_header.o(.rodata*);
        header_RODATA_END = .;
        header_RODATA_SIZE = ABSOLUTE(header_RODATA_END - header_RODATA_START);

        header_SDATA_START = .;
        build/us/src/rom_header/rom_header.o(.sdata*);
        header_SDATA_END = .;
        header_SDATA_SIZE = ABSOLUTE(header_SDATA_END - header_SDATA_START);
    }

    header_alloc_VRAM_END = .;
    header_alloc_VRAM_SIZE = ABSOLUTE(header_alloc_VRAM_END - header_alloc_VRAM);

    header_noload_VRAM = .;

    .header.noload (NOLOAD) :
    {
        FILL(0x00000000);
        header_SBSS_START = .;
        build/us/src/rom_header/rom_header.o(.sbss*);
        header_SBSS_END = .;
        header_SBSS_SIZE = ABSOLUTE(header_SBSS_END - header_SBSS_START);

        header_SCOMMON_START = .;
        build/us/src/rom_header/rom_header.o(.scommon*);
        header_SCOMMON_END = .;
        header_SCOMMON_SIZE = ABSOLUTE(header_SCOMMON_END - header_SCOMMON_START);

        header_BSS_START = .;
        build/us/src/rom_header/rom_header.o(.bss*);
        header_BSS_END = .;
        header_BSS_SIZE = ABSOLUTE(header_BSS_END - header_BSS_START);

        headerCOMMON_START = .;
        build/us/src/rom_header/rom_header.o(COMMON*);
        headerCOMMON_END = .;
        headerCOMMON_SIZE = ABSOLUTE(headerCOMMON_END - headerCOMMON_START);
    }

    header_noload_VRAM_END = .;
    header_noload_VRAM_SIZE = ABSOLUTE(header_noload_VRAM_END - header_noload_VRAM);

    __romPos += SIZEOF(.header);
    header_VRAM_END = .;
    header_VRAM_SIZE = ABSOLUTE(header_VRAM_END - header_VRAM);
    header_ROM_END = __romPos;
    header_ROM_SIZE = ABSOLUTE(header_ROM_END - header_ROM_START);

    ipl3_ROM_START = __romPos;
    ipl3_VRAM = ADDR(.ipl3);
    ipl3_alloc_VRAM = .;

    .ipl3 : AT(ipl3_ROM_START)
    {
        FILL(0x00000000);
        ipl3_TEXT_START = .;
        build/us/asm/us/data/ipl3.o(.text*);
        ipl3_TEXT_END = .;
        ipl3_TEXT_SIZE = ABSOLUTE(ipl3_TEXT_END - ipl3_TEXT_START);

        ipl3_DATA_START = .;
        build/us/asm/us/data/ipl3.o(.data*);
        ipl3_DATA_END = .;
        ipl3_DATA_SIZE = ABSOLUTE(ipl3_DATA_END - ipl3_DATA_START);

        ipl3_RODATA_START = .;
        build/us/asm/us/data/ipl3.o(.rodata*);
        ipl3_RODATA_END = .;
        ipl3_RODATA_SIZE = ABSOLUTE(ipl3_RODATA_END - ipl3_RODATA_START);

        ipl3_SDATA_START = .;
        build/us/asm/us/data/ipl3.o(.sdata*);
        ipl3_SDATA_END = .;
        ipl3_SDATA_SIZE = ABSOLUTE(ipl3_SDATA_END - ipl3_SDATA_START);
    }

    ipl3_alloc_VRAM_END = .;
    ipl3_alloc_VRAM_SIZE = ABSOLUTE(ipl3_alloc_VRAM_END - ipl3_alloc_VRAM);

    ipl3_noload_VRAM = .;

    .ipl3.noload (NOLOAD) :
    {
        FILL(0x00000000);
        ipl3_SBSS_START = .;
        build/us/asm/us/data/ipl3.o(.sbss*);
        ipl3_SBSS_END = .;
        ipl3_SBSS_SIZE = ABSOLUTE(ipl3_SBSS_END - ipl3_SBSS_START);

        ipl3_SCOMMON_START = .;
        build/us/asm/us/data/ipl3.o(.scommon*);
        ipl3_SCOMMON_END = .;
        ipl3_SCOMMON_SIZE = ABSOLUTE(ipl3_SCOMMON_END - ipl3_SCOMMON_START);

        ipl3_BSS_START = .;
        build/us/asm/us/data/ipl3.o(.bss*);
        ipl3_BSS_END = .;
        ipl3_BSS_SIZE = ABSOLUTE(ipl3_BSS_END - ipl3_BSS_START);

        ipl3COMMON_START = .;
        build/us/asm/us/data/ipl3.o(COMMON*);
        ipl3COMMON_END = .;
        ipl3COMMON_SIZE = ABSOLUTE(ipl3COMMON_END - ipl3COMMON_START);
    }

    ipl3_noload_VRAM_END = .;
    ipl3_noload_VRAM_SIZE = ABSOLUTE(ipl3_noload_VRAM_END - ipl3_noload_VRAM);

    __romPos += SIZEOF(.ipl3);
    ipl3_VRAM_END = .;
    ipl3_VRAM_SIZE = ABSOLUTE(ipl3_VRAM_END - ipl3_VRAM);
    ipl3_ROM_END = __romPos;
    ipl3_ROM_SIZE = ABSOLUTE(ipl3_ROM_END - ipl3_ROM_START);

    entry_ROM_START = __romPos;
    entry_VRAM = ADDR(.entry);
    entry_alloc_VRAM = .;

    .entry 0x80000400 : AT(entry_ROM_START)
    {
        FILL(0x00000000);
        entry_TEXT_START = .;
        build/us/src/entry/entry.o(.text*);
        entry_TEXT_END = .;
        entry_TEXT_SIZE = ABSOLUTE(entry_TEXT_END - entry_TEXT_START);

        entry_DATA_START = .;
        build/us/src/entry/entry.o(.data*);
        entry_DATA_END = .;
        entry_DATA_SIZE = ABSOLUTE(entry_DATA_END - entry_DATA_START);

        entry_RODATA_START = .;
        build/us/src/entry/entry.o(.rodata*);
        entry_RODATA_END = .;
        entry_RODATA_SIZE = ABSOLUTE(entry_RODATA_END - entry_RODATA_START);

        entry_SDATA_START = .;
        build/us/src/entry/entry.o(.sdata*);
        entry_SDATA_END = .;
        entry_SDATA_SIZE = ABSOLUTE(entry_SDATA_END - entry_SDATA_START);
    }

    entry_alloc_VRAM_END = .;
    entry_alloc_VRAM_SIZE = ABSOLUTE(entry_alloc_VRAM_END - entry_alloc_VRAM);

    entry_noload_VRAM = .;

    .entry.noload (NOLOAD) :
    {
        FILL(0x00000000);
        entry_SBSS_START = .;
        build/us/src/entry/entry.o(.sbss*);
        entry_SBSS_END = .;
        entry_SBSS_SIZE = ABSOLUTE(entry_SBSS_END - entry_SBSS_START);

        entry_SCOMMON_START = .;
        build/us/src/entry/entry.o(.scommon*);
        entry_SCOMMON_END = .;
        entry_SCOMMON_SIZE = ABSOLUTE(entry_SCOMMON_END - entry_SCOMMON_START);

        entry_BSS_START = .;
        build/us/src/entry/entry.o(.bss*);
        entry_BSS_END = .;
        entry_BSS_SIZE = ABSOLUTE(entry_BSS_END - entry_BSS_START);

        entryCOMMON_START = .;
        build/us/src/entry/entry.o(COMMON*);
        entryCOMMON_END = .;
        entryCOMMON_SIZE = ABSOLUTE(entryCOMMON_END - entryCOMMON_START);
    }

    entry_noload_VRAM_END = .;
    entry_noload_VRAM_SIZE = ABSOLUTE(entry_noload_VRAM_END - entry_noload_VRAM);

    __romPos += SIZEOF(.entry);
    entry_VRAM_END = .;
    entry_VRAM_SIZE = ABSOLUTE(entry_VRAM_END - entry_VRAM);
    entry_ROM_END = __romPos;
    entry_ROM_SIZE = ABSOLUTE(entry_ROM_END - entry_ROM_START);

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    boot_alloc_VRAM = .;

    .boot : AT(boot_ROM_START)
    {
        FILL(0x00000000);
        boot_TEXT_START = .;
        build/us/src/boot/boot_main.o(.text*);
        build/us/src/boot/dmadata.o(.text*);
        build/us/src/gzip/inflate.o(.text*);
        build/us/src/gzip/unzip.o(.text*);
        build/us/src/boot/util.o(.text*);
        build/us/src/boot/rom_offsets.o(.text*);
        build/us/lib/ultralib/src/io/conteepprobe.o(.text*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.text*);
        build/us/lib/ultralib/src/io/conteeplongread.o(.text*);
        build/us/lib/ultralib/src/io/pimgr.o(.text*);
        build/us/lib/ultralib/src/io/epirawdma.o(.text*);
        build/us/lib/ultralib/src/io/epidma.o(.text*);
        build/us/lib/ultralib/src/io/cartrominit.o(.text*);
        build/us/lib/ultralib/src/io/devmgr.o(.text*);
        build/us/lib/ultralib/src/io/piacs.o(.text*);
        build/us/lib/ultralib/src/io/pidma.o(.text*);
        build/us/lib/ultralib/src/io/aigetlen.o(.text*);
        build/us/lib/ultralib/src/io/aigetstat.o(.text*);
        build/us/lib/ultralib/src/io/aisetfreq.o(.text*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.text*);
        build/us/lib/ultralib/src/audio/env.o(.text*);
        build/us/lib/ultralib/src/audio/sl.o(.text*);
        build/us/lib/ultralib/src/audio/heapinit.o(.text*);
        build/us/lib/ultralib/src/audio/synthesizer.o(.text*);
        build/us/lib/ultralib/src/audio/syndelete.o(.text*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.text*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.text*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.text*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.text*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.text*);
        build/us/lib/ultralib/src/audio/synsetvol.o(.text*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.text*);
        build/us/lib/ultralib/src/audio/synsetpan.o(.text*);
        build/us/lib/ultralib/src/audio/synallocfx.o(.text*);
        build/us/lib/ultralib/src/os/invaldcache.o(.text*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.text*);
        build/us/lib/ultralib/src/io/contquery.o(.text*);
        build/us/lib/ultralib/src/io/contreaddata.o(.text*);
        build/us/lib/ultralib/src/io/controller.o(.text*);
        build/us/lib/ultralib/src/io/contsetch.o(.text*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.text*);
        build/us/lib/ultralib/src/gu/sqrtf.o(.text*);
        build/us/lib/ultralib/src/gu/cosf.o(.text*);
        build/us/lib/ultralib/src/gu/ortho.o(.text*);
        build/us/lib/ultralib/src/gu/perspective.o(.text*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.text*);
        build/us/lib/ultralib/src/gu/sinf.o(.text*);
        build/us/lib/ultralib/src/gu/sins.o(.text*);
        build/us/lib/ultralib/src/libc/bcmp.o(.text*);
        build/us/lib/ultralib/src/libc/bcopy.o(.text*);
        build/us/lib/ultralib/src/libc/bzero.o(.text*);
        build/us/lib/ultralib/src/libc/string.o(.text*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.text*);
        build/us/lib/ultralib/src/os/jammesg.o(.text*);
        build/us/lib/ultralib/src/os/recvmesg.o(.text*);
        build/us/lib/ultralib/src/os/sendmesg.o(.text*);
        build/us/lib/ultralib/src/os/seteventmesg.o(.text*);
        build/us/lib/ultralib/src/io/sptask.o(.text*);
        build/us/lib/ultralib/src/io/sptaskyield.o(.text*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.text*);
        build/us/lib/ultralib/src/sched/sched.o(.text*);
        build/us/lib/ultralib/src/io/sirawdma.o(.text*);
        build/us/lib/ultralib/src/io/siacs.o(.text*);
        build/us/lib/ultralib/src/os/createthread.o(.text*);
        build/us/lib/ultralib/src/os/getthreadpri.o(.text*);
        build/us/lib/ultralib/src/os/setthreadpri.o(.text*);
        build/us/lib/ultralib/src/os/startthread.o(.text*);
        build/us/lib/ultralib/src/os/stopthread.o(.text*);
        build/us/lib/ultralib/src/os/thread.o(.text*);
        build/us/lib/ultralib/src/os/yieldthread.o(.text*);
        build/us/lib/ultralib/src/os/gettime.o(.text*);
        build/us/lib/ultralib/src/os/settime.o(.text*);
        build/us/lib/ultralib/src/os/settimer.o(.text*);
        build/us/lib/ultralib/src/os/timerintr.o(.text*);
        build/us/lib/ultralib/src/os/probetlb.o(.text*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.text*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.text*);
        build/us/lib/ultralib/src/io/vimgr.o(.text*);
        build/us/lib/ultralib/src/io/vitbl.o(.text*);
        build/us/lib/ultralib/src/io/visetevent.o(.text*);
        build/us/lib/ultralib/src/io/visetmode.o(.text*);
        build/us/lib/ultralib/src/io/visetspecial.o(.text*);
        build/us/lib/ultralib/src/io/visetyscale.o(.text*);
        build/us/lib/ultralib/src/io/viswapbuf.o(.text*);
        build/us/lib/ultralib/src/io/viswapcontext.o(.text*);
        build/us/lib/ultralib/src/io/viblack.o(.text*);
        build/us/lib/ultralib/src/mgu/mtxident.o(.text*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.text*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.text*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.text*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.text*);
        build/us/lib/ultralib/src/mgu/scale.o(.text*);
        build/us/lib/ultralib/src/mgu/scalef.o(.text*);
        build/us/lib/ultralib/src/mgu/translate.o(.text*);
        build/us/lib/ultralib/src/mgu/translatef.o(.text*);
        build/us/lib/ultralib/src/os/initialize.o(.text*);
        build/us/lib/ultralib/src/io/conteepread.o(.text*);
        build/us/lib/ultralib/src/io/conteepwrite.o(.text*);
        build/us/lib/ultralib/src/os/exceptasm.o(.text*);
        build/us/lib/ultralib/src/os/interrupt.o(.text*);
        build/us/lib/ultralib/src/os/setintmask.o(.text*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.text*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.text*);
        build/us/lib/ultralib/src/io/pirawdma.o(.text*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.text*);
        build/us/lib/ultralib/src/io/epirawread.o(.text*);
        build/us/lib/ultralib/src/io/epirawwrite.o(.text*);
        build/us/lib/ultralib/src/io/ai.o(.text*);
        build/us/lib/ultralib/src/audio/drvrnew.o(.text*);
        build/us/lib/ultralib/src/audio/load.o(.text*);
        build/us/lib/ultralib/src/audio/auxbus.o(.text*);
        build/us/lib/ultralib/src/audio/filter.o(.text*);
        build/us/lib/ultralib/src/audio/mainbus.o(.text*);
        build/us/lib/ultralib/src/audio/resample.o(.text*);
        build/us/lib/ultralib/src/audio/reverb.o(.text*);
        build/us/lib/ultralib/src/audio/save.o(.text*);
        build/us/lib/ultralib/src/audio/heapalloc.o(.text*);
        build/us/lib/ultralib/src/audio/copy.o(.text*);
        build/us/lib/ultralib/src/os/invalicache.o(.text*);
        build/us/lib/ultralib/src/os/writebackdcache.o(.text*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.text*);
        build/us/lib/ultralib/src/os/getcause.o(.text*);
        build/us/lib/ultralib/src/os/getcount.o(.text*);
        build/us/lib/ultralib/src/os/getsr.o(.text*);
        build/us/lib/ultralib/src/os/setcompare.o(.text*);
        build/us/lib/ultralib/src/os/setfpccsr.o(.text*);
        build/us/lib/ultralib/src/os/setsr.o(.text*);
        build/us/lib/ultralib/src/os/setwatchlo.o(.text*);
        build/us/lib/ultralib/src/io/sp.o(.text*);
        build/us/lib/ultralib/src/io/spgetstat.o(.text*);
        build/us/lib/ultralib/src/io/spsetstat.o(.text*);
        build/us/lib/ultralib/src/io/spsetpc.o(.text*);
        build/us/lib/ultralib/src/io/sprawdma.o(.text*);
        build/us/lib/ultralib/src/io/sirawread.o(.text*);
        build/us/lib/ultralib/src/io/sirawwrite.o(.text*);
        build/us/lib/ultralib/src/os/destroythread.o(.text*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.text*);
        build/us/lib/ultralib/src/os/unmaptlball.o(.text*);
        build/us/lib/ultralib/src/io/vi.o(.text*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.text*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.text*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.text*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.text*);
        build/us/lib/ultralib/src/os/parameters.o(.text*);
        build/us/lib/ultralib/src/gu/libm_vals.o(.text*);
        build/us/lib/ultralib/src/io/dp.o(.text*);
        build/us/lib/ultralib/src/io/si.o(.text*);
        build/us/src/libkmc/fmod.o(.text*);
        build/us/src/libkmc/memmove.o(.text*);
        build/us/src/libkmc/memset.o(.text*);
        build/us/src/libkmc/modf.o(.text*);
        build/us/src/libkmc/rand.o(.text*);
        build/us/src/libkmc/strcpy.o(.text*);
        build/us/src/libkmc/mmuldi3.o(.text*);
        build/us/src/libkmc/ctype.o(.text*);
        build/us/asm/us/data/boot/8001B640.bss.o(.text*);
        boot_TEXT_END = .;
        boot_TEXT_SIZE = ABSOLUTE(boot_TEXT_END - boot_TEXT_START);

        boot_DATA_START = .;
        build/us/src/boot/boot_main.o(.data*);
        build/us/src/boot/dmadata.o(.data*);
        build/us/src/gzip/inflate.o(.data*);
        build/us/src/gzip/unzip.o(.data*);
        build/us/src/boot/util.o(.data*);
        build/us/src/boot/rom_offsets.o(.data*);
        build/us/lib/ultralib/src/io/conteepprobe.o(.data*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.data*);
        build/us/lib/ultralib/src/io/conteeplongread.o(.data*);
        build/us/lib/ultralib/src/io/pimgr.o(.data*);
        build/us/lib/ultralib/src/io/epirawdma.o(.data*);
        build/us/lib/ultralib/src/io/epidma.o(.data*);
        build/us/lib/ultralib/src/io/cartrominit.o(.data*);
        build/us/lib/ultralib/src/io/devmgr.o(.data*);
        build/us/lib/ultralib/src/io/piacs.o(.data*);
        build/us/lib/ultralib/src/io/pidma.o(.data*);
        build/us/lib/ultralib/src/io/aigetlen.o(.data*);
        build/us/lib/ultralib/src/io/aigetstat.o(.data*);
        build/us/lib/ultralib/src/io/aisetfreq.o(.data*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.data*);
        build/us/lib/ultralib/src/audio/env.o(.data*);
        build/us/lib/ultralib/src/audio/sl.o(.data*);
        build/us/lib/ultralib/src/audio/heapinit.o(.data*);
        build/us/lib/ultralib/src/audio/synthesizer.o(.data*);
        build/us/lib/ultralib/src/audio/syndelete.o(.data*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.data*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.data*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.data*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.data*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.data*);
        build/us/lib/ultralib/src/audio/synsetvol.o(.data*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.data*);
        build/us/lib/ultralib/src/audio/synsetpan.o(.data*);
        build/us/lib/ultralib/src/audio/synallocfx.o(.data*);
        build/us/lib/ultralib/src/os/invaldcache.o(.data*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.data*);
        build/us/lib/ultralib/src/io/contquery.o(.data*);
        build/us/lib/ultralib/src/io/contreaddata.o(.data*);
        build/us/lib/ultralib/src/io/controller.o(.data*);
        build/us/lib/ultralib/src/io/contsetch.o(.data*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.data*);
        build/us/lib/ultralib/src/gu/sqrtf.o(.data*);
        build/us/lib/ultralib/src/gu/cosf.o(.data*);
        build/us/lib/ultralib/src/gu/ortho.o(.data*);
        build/us/lib/ultralib/src/gu/perspective.o(.data*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.data*);
        build/us/lib/ultralib/src/gu/sinf.o(.data*);
        build/us/lib/ultralib/src/gu/sins.o(.data*);
        build/us/lib/ultralib/src/libc/bcmp.o(.data*);
        build/us/lib/ultralib/src/libc/bcopy.o(.data*);
        build/us/lib/ultralib/src/libc/bzero.o(.data*);
        build/us/lib/ultralib/src/libc/string.o(.data*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.data*);
        build/us/lib/ultralib/src/os/jammesg.o(.data*);
        build/us/lib/ultralib/src/os/recvmesg.o(.data*);
        build/us/lib/ultralib/src/os/sendmesg.o(.data*);
        build/us/lib/ultralib/src/os/seteventmesg.o(.data*);
        build/us/lib/ultralib/src/io/sptask.o(.data*);
        build/us/lib/ultralib/src/io/sptaskyield.o(.data*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.data*);
        build/us/lib/ultralib/src/sched/sched.o(.data*);
        build/us/lib/ultralib/src/io/sirawdma.o(.data*);
        build/us/lib/ultralib/src/io/siacs.o(.data*);
        build/us/lib/ultralib/src/os/createthread.o(.data*);
        build/us/lib/ultralib/src/os/getthreadpri.o(.data*);
        build/us/lib/ultralib/src/os/setthreadpri.o(.data*);
        build/us/lib/ultralib/src/os/startthread.o(.data*);
        build/us/lib/ultralib/src/os/stopthread.o(.data*);
        build/us/lib/ultralib/src/os/thread.o(.data*);
        build/us/lib/ultralib/src/os/yieldthread.o(.data*);
        build/us/lib/ultralib/src/os/gettime.o(.data*);
        build/us/lib/ultralib/src/os/settime.o(.data*);
        build/us/lib/ultralib/src/os/settimer.o(.data*);
        build/us/lib/ultralib/src/os/timerintr.o(.data*);
        build/us/lib/ultralib/src/os/probetlb.o(.data*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.data*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.data*);
        build/us/lib/ultralib/src/io/vimgr.o(.data*);
        build/us/lib/ultralib/src/io/vitbl.o(.data*);
        build/us/lib/ultralib/src/io/visetevent.o(.data*);
        build/us/lib/ultralib/src/io/visetmode.o(.data*);
        build/us/lib/ultralib/src/io/visetspecial.o(.data*);
        build/us/lib/ultralib/src/io/visetyscale.o(.data*);
        build/us/lib/ultralib/src/io/viswapbuf.o(.data*);
        build/us/lib/ultralib/src/io/viswapcontext.o(.data*);
        build/us/lib/ultralib/src/io/viblack.o(.data*);
        build/us/lib/ultralib/src/mgu/mtxident.o(.data*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.data*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.data*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.data*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.data*);
        build/us/lib/ultralib/src/mgu/scale.o(.data*);
        build/us/lib/ultralib/src/mgu/scalef.o(.data*);
        build/us/lib/ultralib/src/mgu/translate.o(.data*);
        build/us/lib/ultralib/src/mgu/translatef.o(.data*);
        build/us/lib/ultralib/src/os/initialize.o(.data*);
        build/us/lib/ultralib/src/io/conteepread.o(.data*);
        build/us/lib/ultralib/src/io/conteepwrite.o(.data*);
        build/us/lib/ultralib/src/os/exceptasm.o(.data*);
        build/us/lib/ultralib/src/os/interrupt.o(.data*);
        build/us/lib/ultralib/src/os/setintmask.o(.data*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.data*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.data*);
        build/us/lib/ultralib/src/io/pirawdma.o(.data*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.data*);
        build/us/lib/ultralib/src/io/epirawread.o(.data*);
        build/us/lib/ultralib/src/io/epirawwrite.o(.data*);
        build/us/lib/ultralib/src/io/ai.o(.data*);
        build/us/lib/ultralib/src/audio/drvrnew.o(.data*);
        build/us/lib/ultralib/src/audio/load.o(.data*);
        build/us/lib/ultralib/src/audio/auxbus.o(.data*);
        build/us/lib/ultralib/src/audio/filter.o(.data*);
        build/us/lib/ultralib/src/audio/mainbus.o(.data*);
        build/us/lib/ultralib/src/audio/resample.o(.data*);
        build/us/lib/ultralib/src/audio/reverb.o(.data*);
        build/us/lib/ultralib/src/audio/save.o(.data*);
        build/us/lib/ultralib/src/audio/heapalloc.o(.data*);
        build/us/lib/ultralib/src/audio/copy.o(.data*);
        build/us/lib/ultralib/src/os/invalicache.o(.data*);
        build/us/lib/ultralib/src/os/writebackdcache.o(.data*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.data*);
        build/us/lib/ultralib/src/os/getcause.o(.data*);
        build/us/lib/ultralib/src/os/getcount.o(.data*);
        build/us/lib/ultralib/src/os/getsr.o(.data*);
        build/us/lib/ultralib/src/os/setcompare.o(.data*);
        build/us/lib/ultralib/src/os/setfpccsr.o(.data*);
        build/us/lib/ultralib/src/os/setsr.o(.data*);
        build/us/lib/ultralib/src/os/setwatchlo.o(.data*);
        build/us/lib/ultralib/src/io/sp.o(.data*);
        build/us/lib/ultralib/src/io/spgetstat.o(.data*);
        build/us/lib/ultralib/src/io/spsetstat.o(.data*);
        build/us/lib/ultralib/src/io/spsetpc.o(.data*);
        build/us/lib/ultralib/src/io/sprawdma.o(.data*);
        build/us/lib/ultralib/src/io/sirawread.o(.data*);
        build/us/lib/ultralib/src/io/sirawwrite.o(.data*);
        build/us/lib/ultralib/src/os/destroythread.o(.data*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.data*);
        build/us/lib/ultralib/src/os/unmaptlball.o(.data*);
        build/us/lib/ultralib/src/io/vi.o(.data*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.data*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.data*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.data*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.data*);
        build/us/lib/ultralib/src/os/parameters.o(.data*);
        build/us/lib/ultralib/src/gu/libm_vals.o(.data*);
        build/us/lib/ultralib/src/io/dp.o(.data*);
        build/us/lib/ultralib/src/io/si.o(.data*);
        build/us/src/libkmc/fmod.o(.data*);
        build/us/src/libkmc/memmove.o(.data*);
        build/us/src/libkmc/memset.o(.data*);
        build/us/src/libkmc/modf.o(.data*);
        build/us/src/libkmc/rand.o(.data*);
        build/us/src/libkmc/strcpy.o(.data*);
        build/us/src/libkmc/mmuldi3.o(.data*);
        build/us/src/libkmc/ctype.o(.data*);
        build/us/asm/us/data/boot/8001B640.bss.o(.data*);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);

        boot_RODATA_START = .;
        build/us/src/boot/boot_main.o(.rodata*);
        build/us/src/boot/dmadata.o(.rodata*);
        build/us/src/gzip/inflate.o(.rodata*);
        build/us/src/gzip/unzip.o(.rodata*);
        build/us/src/boot/util.o(.rodata*);
        build/us/src/boot/rom_offsets.o(.rodata*);
        build/us/lib/ultralib/src/io/conteepprobe.o(.rodata*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.rodata*);
        build/us/lib/ultralib/src/io/conteeplongread.o(.rodata*);
        build/us/lib/ultralib/src/io/pimgr.o(.rodata*);
        build/us/lib/ultralib/src/io/epirawdma.o(.rodata*);
        build/us/lib/ultralib/src/io/epidma.o(.rodata*);
        build/us/lib/ultralib/src/io/cartrominit.o(.rodata*);
        build/us/lib/ultralib/src/io/devmgr.o(.rodata*);
        build/us/lib/ultralib/src/io/piacs.o(.rodata*);
        build/us/lib/ultralib/src/io/pidma.o(.rodata*);
        build/us/lib/ultralib/src/io/aigetlen.o(.rodata*);
        build/us/lib/ultralib/src/io/aigetstat.o(.rodata*);
        build/us/lib/ultralib/src/io/aisetfreq.o(.rodata*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.rodata*);
        build/us/lib/ultralib/src/audio/env.o(.rodata*);
        build/us/lib/ultralib/src/audio/sl.o(.rodata*);
        build/us/lib/ultralib/src/audio/heapinit.o(.rodata*);
        build/us/lib/ultralib/src/audio/synthesizer.o(.rodata*);
        build/us/lib/ultralib/src/audio/syndelete.o(.rodata*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.rodata*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.rodata*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.rodata*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.rodata*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.rodata*);
        build/us/lib/ultralib/src/audio/synsetvol.o(.rodata*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.rodata*);
        build/us/lib/ultralib/src/audio/synsetpan.o(.rodata*);
        build/us/lib/ultralib/src/audio/synallocfx.o(.rodata*);
        build/us/lib/ultralib/src/os/invaldcache.o(.rodata*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.rodata*);
        build/us/lib/ultralib/src/io/contquery.o(.rodata*);
        build/us/lib/ultralib/src/io/contreaddata.o(.rodata*);
        build/us/lib/ultralib/src/io/controller.o(.rodata*);
        build/us/lib/ultralib/src/io/contsetch.o(.rodata*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.rodata*);
        build/us/lib/ultralib/src/gu/sqrtf.o(.rodata*);
        build/us/lib/ultralib/src/gu/cosf.o(.rodata*);
        build/us/lib/ultralib/src/gu/ortho.o(.rodata*);
        build/us/lib/ultralib/src/gu/perspective.o(.rodata*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.rodata*);
        build/us/lib/ultralib/src/gu/sinf.o(.rodata*);
        build/us/lib/ultralib/src/gu/sins.o(.rodata*);
        build/us/lib/ultralib/src/libc/bcmp.o(.rodata*);
        build/us/lib/ultralib/src/libc/bcopy.o(.rodata*);
        build/us/lib/ultralib/src/libc/bzero.o(.rodata*);
        build/us/lib/ultralib/src/libc/string.o(.rodata*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.rodata*);
        build/us/lib/ultralib/src/os/jammesg.o(.rodata*);
        build/us/lib/ultralib/src/os/recvmesg.o(.rodata*);
        build/us/lib/ultralib/src/os/sendmesg.o(.rodata*);
        build/us/lib/ultralib/src/os/seteventmesg.o(.rodata*);
        build/us/lib/ultralib/src/io/sptask.o(.rodata*);
        build/us/lib/ultralib/src/io/sptaskyield.o(.rodata*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.rodata*);
        build/us/lib/ultralib/src/sched/sched.o(.rodata*);
        build/us/lib/ultralib/src/io/sirawdma.o(.rodata*);
        build/us/lib/ultralib/src/io/siacs.o(.rodata*);
        build/us/lib/ultralib/src/os/createthread.o(.rodata*);
        build/us/lib/ultralib/src/os/getthreadpri.o(.rodata*);
        build/us/lib/ultralib/src/os/setthreadpri.o(.rodata*);
        build/us/lib/ultralib/src/os/startthread.o(.rodata*);
        build/us/lib/ultralib/src/os/stopthread.o(.rodata*);
        build/us/lib/ultralib/src/os/thread.o(.rodata*);
        build/us/lib/ultralib/src/os/yieldthread.o(.rodata*);
        build/us/lib/ultralib/src/os/gettime.o(.rodata*);
        build/us/lib/ultralib/src/os/settime.o(.rodata*);
        build/us/lib/ultralib/src/os/settimer.o(.rodata*);
        build/us/lib/ultralib/src/os/timerintr.o(.rodata*);
        build/us/lib/ultralib/src/os/probetlb.o(.rodata*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.rodata*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.rodata*);
        build/us/lib/ultralib/src/io/vimgr.o(.rodata*);
        build/us/lib/ultralib/src/io/vitbl.o(.rodata*);
        build/us/lib/ultralib/src/io/visetevent.o(.rodata*);
        build/us/lib/ultralib/src/io/visetmode.o(.rodata*);
        build/us/lib/ultralib/src/io/visetspecial.o(.rodata*);
        build/us/lib/ultralib/src/io/visetyscale.o(.rodata*);
        build/us/lib/ultralib/src/io/viswapbuf.o(.rodata*);
        build/us/lib/ultralib/src/io/viswapcontext.o(.rodata*);
        build/us/lib/ultralib/src/io/viblack.o(.rodata*);
        build/us/lib/ultralib/src/mgu/mtxident.o(.rodata*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.rodata*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.rodata*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.rodata*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.rodata*);
        build/us/lib/ultralib/src/mgu/scale.o(.rodata*);
        build/us/lib/ultralib/src/mgu/scalef.o(.rodata*);
        build/us/lib/ultralib/src/mgu/translate.o(.rodata*);
        build/us/lib/ultralib/src/mgu/translatef.o(.rodata*);
        build/us/lib/ultralib/src/os/initialize.o(.rodata*);
        build/us/lib/ultralib/src/io/conteepread.o(.rodata*);
        build/us/lib/ultralib/src/io/conteepwrite.o(.rodata*);
        build/us/lib/ultralib/src/os/exceptasm.o(.rodata*);
        build/us/lib/ultralib/src/os/interrupt.o(.rodata*);
        build/us/lib/ultralib/src/os/setintmask.o(.rodata*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.rodata*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.rodata*);
        build/us/lib/ultralib/src/io/pirawdma.o(.rodata*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.rodata*);
        build/us/lib/ultralib/src/io/epirawread.o(.rodata*);
        build/us/lib/ultralib/src/io/epirawwrite.o(.rodata*);
        build/us/lib/ultralib/src/io/ai.o(.rodata*);
        build/us/lib/ultralib/src/audio/drvrnew.o(.rodata*);
        build/us/lib/ultralib/src/audio/load.o(.rodata*);
        build/us/lib/ultralib/src/audio/auxbus.o(.rodata*);
        build/us/lib/ultralib/src/audio/filter.o(.rodata*);
        build/us/lib/ultralib/src/audio/mainbus.o(.rodata*);
        build/us/lib/ultralib/src/audio/resample.o(.rodata*);
        build/us/lib/ultralib/src/audio/reverb.o(.rodata*);
        build/us/lib/ultralib/src/audio/save.o(.rodata*);
        build/us/lib/ultralib/src/audio/heapalloc.o(.rodata*);
        build/us/lib/ultralib/src/audio/copy.o(.rodata*);
        build/us/lib/ultralib/src/os/invalicache.o(.rodata*);
        build/us/lib/ultralib/src/os/writebackdcache.o(.rodata*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.rodata*);
        build/us/lib/ultralib/src/os/getcause.o(.rodata*);
        build/us/lib/ultralib/src/os/getcount.o(.rodata*);
        build/us/lib/ultralib/src/os/getsr.o(.rodata*);
        build/us/lib/ultralib/src/os/setcompare.o(.rodata*);
        build/us/lib/ultralib/src/os/setfpccsr.o(.rodata*);
        build/us/lib/ultralib/src/os/setsr.o(.rodata*);
        build/us/lib/ultralib/src/os/setwatchlo.o(.rodata*);
        build/us/lib/ultralib/src/io/sp.o(.rodata*);
        build/us/lib/ultralib/src/io/spgetstat.o(.rodata*);
        build/us/lib/ultralib/src/io/spsetstat.o(.rodata*);
        build/us/lib/ultralib/src/io/spsetpc.o(.rodata*);
        build/us/lib/ultralib/src/io/sprawdma.o(.rodata*);
        build/us/lib/ultralib/src/io/sirawread.o(.rodata*);
        build/us/lib/ultralib/src/io/sirawwrite.o(.rodata*);
        build/us/lib/ultralib/src/os/destroythread.o(.rodata*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.rodata*);
        build/us/lib/ultralib/src/os/unmaptlball.o(.rodata*);
        build/us/lib/ultralib/src/io/vi.o(.rodata*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.rodata*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.rodata*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.rodata*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.rodata*);
        build/us/lib/ultralib/src/os/parameters.o(.rodata*);
        build/us/lib/ultralib/src/gu/libm_vals.o(.rodata*);
        build/us/lib/ultralib/src/io/dp.o(.rodata*);
        build/us/lib/ultralib/src/io/si.o(.rodata*);
        build/us/src/libkmc/fmod.o(.rodata*);
        build/us/src/libkmc/memmove.o(.rodata*);
        build/us/src/libkmc/memset.o(.rodata*);
        build/us/src/libkmc/modf.o(.rodata*);
        build/us/src/libkmc/rand.o(.rodata*);
        build/us/src/libkmc/strcpy.o(.rodata*);
        build/us/src/libkmc/mmuldi3.o(.rodata*);
        build/us/src/libkmc/ctype.o(.rodata*);
        build/us/asm/us/data/boot/8001B640.bss.o(.rodata*);
        boot_RODATA_END = .;
        boot_RODATA_SIZE = ABSOLUTE(boot_RODATA_END - boot_RODATA_START);

        boot_SDATA_START = .;
        build/us/src/boot/boot_main.o(.sdata*);
        build/us/src/boot/dmadata.o(.sdata*);
        build/us/src/gzip/inflate.o(.sdata*);
        build/us/src/gzip/unzip.o(.sdata*);
        build/us/src/boot/util.o(.sdata*);
        build/us/src/boot/rom_offsets.o(.sdata*);
        build/us/lib/ultralib/src/io/conteepprobe.o(.sdata*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.sdata*);
        build/us/lib/ultralib/src/io/conteeplongread.o(.sdata*);
        build/us/lib/ultralib/src/io/pimgr.o(.sdata*);
        build/us/lib/ultralib/src/io/epirawdma.o(.sdata*);
        build/us/lib/ultralib/src/io/epidma.o(.sdata*);
        build/us/lib/ultralib/src/io/cartrominit.o(.sdata*);
        build/us/lib/ultralib/src/io/devmgr.o(.sdata*);
        build/us/lib/ultralib/src/io/piacs.o(.sdata*);
        build/us/lib/ultralib/src/io/pidma.o(.sdata*);
        build/us/lib/ultralib/src/io/aigetlen.o(.sdata*);
        build/us/lib/ultralib/src/io/aigetstat.o(.sdata*);
        build/us/lib/ultralib/src/io/aisetfreq.o(.sdata*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.sdata*);
        build/us/lib/ultralib/src/audio/env.o(.sdata*);
        build/us/lib/ultralib/src/audio/sl.o(.sdata*);
        build/us/lib/ultralib/src/audio/heapinit.o(.sdata*);
        build/us/lib/ultralib/src/audio/synthesizer.o(.sdata*);
        build/us/lib/ultralib/src/audio/syndelete.o(.sdata*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.sdata*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.sdata*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.sdata*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.sdata*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.sdata*);
        build/us/lib/ultralib/src/audio/synsetvol.o(.sdata*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.sdata*);
        build/us/lib/ultralib/src/audio/synsetpan.o(.sdata*);
        build/us/lib/ultralib/src/audio/synallocfx.o(.sdata*);
        build/us/lib/ultralib/src/os/invaldcache.o(.sdata*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.sdata*);
        build/us/lib/ultralib/src/io/contquery.o(.sdata*);
        build/us/lib/ultralib/src/io/contreaddata.o(.sdata*);
        build/us/lib/ultralib/src/io/controller.o(.sdata*);
        build/us/lib/ultralib/src/io/contsetch.o(.sdata*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.sdata*);
        build/us/lib/ultralib/src/gu/sqrtf.o(.sdata*);
        build/us/lib/ultralib/src/gu/cosf.o(.sdata*);
        build/us/lib/ultralib/src/gu/ortho.o(.sdata*);
        build/us/lib/ultralib/src/gu/perspective.o(.sdata*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.sdata*);
        build/us/lib/ultralib/src/gu/sinf.o(.sdata*);
        build/us/lib/ultralib/src/gu/sins.o(.sdata*);
        build/us/lib/ultralib/src/libc/bcmp.o(.sdata*);
        build/us/lib/ultralib/src/libc/bcopy.o(.sdata*);
        build/us/lib/ultralib/src/libc/bzero.o(.sdata*);
        build/us/lib/ultralib/src/libc/string.o(.sdata*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.sdata*);
        build/us/lib/ultralib/src/os/jammesg.o(.sdata*);
        build/us/lib/ultralib/src/os/recvmesg.o(.sdata*);
        build/us/lib/ultralib/src/os/sendmesg.o(.sdata*);
        build/us/lib/ultralib/src/os/seteventmesg.o(.sdata*);
        build/us/lib/ultralib/src/io/sptask.o(.sdata*);
        build/us/lib/ultralib/src/io/sptaskyield.o(.sdata*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.sdata*);
        build/us/lib/ultralib/src/sched/sched.o(.sdata*);
        build/us/lib/ultralib/src/io/sirawdma.o(.sdata*);
        build/us/lib/ultralib/src/io/siacs.o(.sdata*);
        build/us/lib/ultralib/src/os/createthread.o(.sdata*);
        build/us/lib/ultralib/src/os/getthreadpri.o(.sdata*);
        build/us/lib/ultralib/src/os/setthreadpri.o(.sdata*);
        build/us/lib/ultralib/src/os/startthread.o(.sdata*);
        build/us/lib/ultralib/src/os/stopthread.o(.sdata*);
        build/us/lib/ultralib/src/os/thread.o(.sdata*);
        build/us/lib/ultralib/src/os/yieldthread.o(.sdata*);
        build/us/lib/ultralib/src/os/gettime.o(.sdata*);
        build/us/lib/ultralib/src/os/settime.o(.sdata*);
        build/us/lib/ultralib/src/os/settimer.o(.sdata*);
        build/us/lib/ultralib/src/os/timerintr.o(.sdata*);
        build/us/lib/ultralib/src/os/probetlb.o(.sdata*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.sdata*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.sdata*);
        build/us/lib/ultralib/src/io/vimgr.o(.sdata*);
        build/us/lib/ultralib/src/io/vitbl.o(.sdata*);
        build/us/lib/ultralib/src/io/visetevent.o(.sdata*);
        build/us/lib/ultralib/src/io/visetmode.o(.sdata*);
        build/us/lib/ultralib/src/io/visetspecial.o(.sdata*);
        build/us/lib/ultralib/src/io/visetyscale.o(.sdata*);
        build/us/lib/ultralib/src/io/viswapbuf.o(.sdata*);
        build/us/lib/ultralib/src/io/viswapcontext.o(.sdata*);
        build/us/lib/ultralib/src/io/viblack.o(.sdata*);
        build/us/lib/ultralib/src/mgu/mtxident.o(.sdata*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.sdata*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.sdata*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.sdata*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.sdata*);
        build/us/lib/ultralib/src/mgu/scale.o(.sdata*);
        build/us/lib/ultralib/src/mgu/scalef.o(.sdata*);
        build/us/lib/ultralib/src/mgu/translate.o(.sdata*);
        build/us/lib/ultralib/src/mgu/translatef.o(.sdata*);
        build/us/lib/ultralib/src/os/initialize.o(.sdata*);
        build/us/lib/ultralib/src/io/conteepread.o(.sdata*);
        build/us/lib/ultralib/src/io/conteepwrite.o(.sdata*);
        build/us/lib/ultralib/src/os/exceptasm.o(.sdata*);
        build/us/lib/ultralib/src/os/interrupt.o(.sdata*);
        build/us/lib/ultralib/src/os/setintmask.o(.sdata*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.sdata*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.sdata*);
        build/us/lib/ultralib/src/io/pirawdma.o(.sdata*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.sdata*);
        build/us/lib/ultralib/src/io/epirawread.o(.sdata*);
        build/us/lib/ultralib/src/io/epirawwrite.o(.sdata*);
        build/us/lib/ultralib/src/io/ai.o(.sdata*);
        build/us/lib/ultralib/src/audio/drvrnew.o(.sdata*);
        build/us/lib/ultralib/src/audio/load.o(.sdata*);
        build/us/lib/ultralib/src/audio/auxbus.o(.sdata*);
        build/us/lib/ultralib/src/audio/filter.o(.sdata*);
        build/us/lib/ultralib/src/audio/mainbus.o(.sdata*);
        build/us/lib/ultralib/src/audio/resample.o(.sdata*);
        build/us/lib/ultralib/src/audio/reverb.o(.sdata*);
        build/us/lib/ultralib/src/audio/save.o(.sdata*);
        build/us/lib/ultralib/src/audio/heapalloc.o(.sdata*);
        build/us/lib/ultralib/src/audio/copy.o(.sdata*);
        build/us/lib/ultralib/src/os/invalicache.o(.sdata*);
        build/us/lib/ultralib/src/os/writebackdcache.o(.sdata*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.sdata*);
        build/us/lib/ultralib/src/os/getcause.o(.sdata*);
        build/us/lib/ultralib/src/os/getcount.o(.sdata*);
        build/us/lib/ultralib/src/os/getsr.o(.sdata*);
        build/us/lib/ultralib/src/os/setcompare.o(.sdata*);
        build/us/lib/ultralib/src/os/setfpccsr.o(.sdata*);
        build/us/lib/ultralib/src/os/setsr.o(.sdata*);
        build/us/lib/ultralib/src/os/setwatchlo.o(.sdata*);
        build/us/lib/ultralib/src/io/sp.o(.sdata*);
        build/us/lib/ultralib/src/io/spgetstat.o(.sdata*);
        build/us/lib/ultralib/src/io/spsetstat.o(.sdata*);
        build/us/lib/ultralib/src/io/spsetpc.o(.sdata*);
        build/us/lib/ultralib/src/io/sprawdma.o(.sdata*);
        build/us/lib/ultralib/src/io/sirawread.o(.sdata*);
        build/us/lib/ultralib/src/io/sirawwrite.o(.sdata*);
        build/us/lib/ultralib/src/os/destroythread.o(.sdata*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.sdata*);
        build/us/lib/ultralib/src/os/unmaptlball.o(.sdata*);
        build/us/lib/ultralib/src/io/vi.o(.sdata*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.sdata*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.sdata*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.sdata*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.sdata*);
        build/us/lib/ultralib/src/os/parameters.o(.sdata*);
        build/us/lib/ultralib/src/gu/libm_vals.o(.sdata*);
        build/us/lib/ultralib/src/io/dp.o(.sdata*);
        build/us/lib/ultralib/src/io/si.o(.sdata*);
        build/us/src/libkmc/fmod.o(.sdata*);
        build/us/src/libkmc/memmove.o(.sdata*);
        build/us/src/libkmc/memset.o(.sdata*);
        build/us/src/libkmc/modf.o(.sdata*);
        build/us/src/libkmc/rand.o(.sdata*);
        build/us/src/libkmc/strcpy.o(.sdata*);
        build/us/src/libkmc/mmuldi3.o(.sdata*);
        build/us/src/libkmc/ctype.o(.sdata*);
        build/us/asm/us/data/boot/8001B640.bss.o(.sdata*);
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
        build/us/src/boot/dmadata.o(.sbss*);
        build/us/src/gzip/inflate.o(.sbss*);
        build/us/src/gzip/unzip.o(.sbss*);
        build/us/src/boot/util.o(.sbss*);
        build/us/src/boot/rom_offsets.o(.sbss*);
        build/us/lib/ultralib/src/io/conteepprobe.o(.sbss*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.sbss*);
        build/us/lib/ultralib/src/io/conteeplongread.o(.sbss*);
        build/us/lib/ultralib/src/io/pimgr.o(.sbss*);
        build/us/lib/ultralib/src/io/epirawdma.o(.sbss*);
        build/us/lib/ultralib/src/io/epidma.o(.sbss*);
        build/us/lib/ultralib/src/io/cartrominit.o(.sbss*);
        build/us/lib/ultralib/src/io/devmgr.o(.sbss*);
        build/us/lib/ultralib/src/io/piacs.o(.sbss*);
        build/us/lib/ultralib/src/io/pidma.o(.sbss*);
        build/us/lib/ultralib/src/io/aigetlen.o(.sbss*);
        build/us/lib/ultralib/src/io/aigetstat.o(.sbss*);
        build/us/lib/ultralib/src/io/aisetfreq.o(.sbss*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.sbss*);
        build/us/lib/ultralib/src/audio/env.o(.sbss*);
        build/us/lib/ultralib/src/audio/sl.o(.sbss*);
        build/us/lib/ultralib/src/audio/heapinit.o(.sbss*);
        build/us/lib/ultralib/src/audio/synthesizer.o(.sbss*);
        build/us/lib/ultralib/src/audio/syndelete.o(.sbss*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.sbss*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.sbss*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.sbss*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.sbss*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.sbss*);
        build/us/lib/ultralib/src/audio/synsetvol.o(.sbss*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.sbss*);
        build/us/lib/ultralib/src/audio/synsetpan.o(.sbss*);
        build/us/lib/ultralib/src/audio/synallocfx.o(.sbss*);
        build/us/lib/ultralib/src/os/invaldcache.o(.sbss*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.sbss*);
        build/us/lib/ultralib/src/io/contquery.o(.sbss*);
        build/us/lib/ultralib/src/io/contreaddata.o(.sbss*);
        build/us/lib/ultralib/src/io/controller.o(.sbss*);
        build/us/lib/ultralib/src/io/contsetch.o(.sbss*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.sbss*);
        build/us/lib/ultralib/src/gu/sqrtf.o(.sbss*);
        build/us/lib/ultralib/src/gu/cosf.o(.sbss*);
        build/us/lib/ultralib/src/gu/ortho.o(.sbss*);
        build/us/lib/ultralib/src/gu/perspective.o(.sbss*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.sbss*);
        build/us/lib/ultralib/src/gu/sinf.o(.sbss*);
        build/us/lib/ultralib/src/gu/sins.o(.sbss*);
        build/us/lib/ultralib/src/libc/bcmp.o(.sbss*);
        build/us/lib/ultralib/src/libc/bcopy.o(.sbss*);
        build/us/lib/ultralib/src/libc/bzero.o(.sbss*);
        build/us/lib/ultralib/src/libc/string.o(.sbss*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.sbss*);
        build/us/lib/ultralib/src/os/jammesg.o(.sbss*);
        build/us/lib/ultralib/src/os/recvmesg.o(.sbss*);
        build/us/lib/ultralib/src/os/sendmesg.o(.sbss*);
        build/us/lib/ultralib/src/os/seteventmesg.o(.sbss*);
        build/us/lib/ultralib/src/io/sptask.o(.sbss*);
        build/us/lib/ultralib/src/io/sptaskyield.o(.sbss*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.sbss*);
        build/us/lib/ultralib/src/sched/sched.o(.sbss*);
        build/us/lib/ultralib/src/io/sirawdma.o(.sbss*);
        build/us/lib/ultralib/src/io/siacs.o(.sbss*);
        build/us/lib/ultralib/src/os/createthread.o(.sbss*);
        build/us/lib/ultralib/src/os/getthreadpri.o(.sbss*);
        build/us/lib/ultralib/src/os/setthreadpri.o(.sbss*);
        build/us/lib/ultralib/src/os/startthread.o(.sbss*);
        build/us/lib/ultralib/src/os/stopthread.o(.sbss*);
        build/us/lib/ultralib/src/os/thread.o(.sbss*);
        build/us/lib/ultralib/src/os/yieldthread.o(.sbss*);
        build/us/lib/ultralib/src/os/gettime.o(.sbss*);
        build/us/lib/ultralib/src/os/settime.o(.sbss*);
        build/us/lib/ultralib/src/os/settimer.o(.sbss*);
        build/us/lib/ultralib/src/os/timerintr.o(.sbss*);
        build/us/lib/ultralib/src/os/probetlb.o(.sbss*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.sbss*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.sbss*);
        build/us/lib/ultralib/src/io/vimgr.o(.sbss*);
        build/us/lib/ultralib/src/io/vitbl.o(.sbss*);
        build/us/lib/ultralib/src/io/visetevent.o(.sbss*);
        build/us/lib/ultralib/src/io/visetmode.o(.sbss*);
        build/us/lib/ultralib/src/io/visetspecial.o(.sbss*);
        build/us/lib/ultralib/src/io/visetyscale.o(.sbss*);
        build/us/lib/ultralib/src/io/viswapbuf.o(.sbss*);
        build/us/lib/ultralib/src/io/viswapcontext.o(.sbss*);
        build/us/lib/ultralib/src/io/viblack.o(.sbss*);
        build/us/lib/ultralib/src/mgu/mtxident.o(.sbss*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.sbss*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.sbss*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.sbss*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.sbss*);
        build/us/lib/ultralib/src/mgu/scale.o(.sbss*);
        build/us/lib/ultralib/src/mgu/scalef.o(.sbss*);
        build/us/lib/ultralib/src/mgu/translate.o(.sbss*);
        build/us/lib/ultralib/src/mgu/translatef.o(.sbss*);
        build/us/lib/ultralib/src/os/initialize.o(.sbss*);
        build/us/lib/ultralib/src/io/conteepread.o(.sbss*);
        build/us/lib/ultralib/src/io/conteepwrite.o(.sbss*);
        build/us/lib/ultralib/src/os/exceptasm.o(.sbss*);
        build/us/lib/ultralib/src/os/interrupt.o(.sbss*);
        build/us/lib/ultralib/src/os/setintmask.o(.sbss*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.sbss*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.sbss*);
        build/us/lib/ultralib/src/io/pirawdma.o(.sbss*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.sbss*);
        build/us/lib/ultralib/src/io/epirawread.o(.sbss*);
        build/us/lib/ultralib/src/io/epirawwrite.o(.sbss*);
        build/us/lib/ultralib/src/io/ai.o(.sbss*);
        build/us/lib/ultralib/src/audio/drvrnew.o(.sbss*);
        build/us/lib/ultralib/src/audio/load.o(.sbss*);
        build/us/lib/ultralib/src/audio/auxbus.o(.sbss*);
        build/us/lib/ultralib/src/audio/filter.o(.sbss*);
        build/us/lib/ultralib/src/audio/mainbus.o(.sbss*);
        build/us/lib/ultralib/src/audio/resample.o(.sbss*);
        build/us/lib/ultralib/src/audio/reverb.o(.sbss*);
        build/us/lib/ultralib/src/audio/save.o(.sbss*);
        build/us/lib/ultralib/src/audio/heapalloc.o(.sbss*);
        build/us/lib/ultralib/src/audio/copy.o(.sbss*);
        build/us/lib/ultralib/src/os/invalicache.o(.sbss*);
        build/us/lib/ultralib/src/os/writebackdcache.o(.sbss*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.sbss*);
        build/us/lib/ultralib/src/os/getcause.o(.sbss*);
        build/us/lib/ultralib/src/os/getcount.o(.sbss*);
        build/us/lib/ultralib/src/os/getsr.o(.sbss*);
        build/us/lib/ultralib/src/os/setcompare.o(.sbss*);
        build/us/lib/ultralib/src/os/setfpccsr.o(.sbss*);
        build/us/lib/ultralib/src/os/setsr.o(.sbss*);
        build/us/lib/ultralib/src/os/setwatchlo.o(.sbss*);
        build/us/lib/ultralib/src/io/sp.o(.sbss*);
        build/us/lib/ultralib/src/io/spgetstat.o(.sbss*);
        build/us/lib/ultralib/src/io/spsetstat.o(.sbss*);
        build/us/lib/ultralib/src/io/spsetpc.o(.sbss*);
        build/us/lib/ultralib/src/io/sprawdma.o(.sbss*);
        build/us/lib/ultralib/src/io/sirawread.o(.sbss*);
        build/us/lib/ultralib/src/io/sirawwrite.o(.sbss*);
        build/us/lib/ultralib/src/os/destroythread.o(.sbss*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.sbss*);
        build/us/lib/ultralib/src/os/unmaptlball.o(.sbss*);
        build/us/lib/ultralib/src/io/vi.o(.sbss*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.sbss*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.sbss*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.sbss*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.sbss*);
        build/us/lib/ultralib/src/os/parameters.o(.sbss*);
        build/us/lib/ultralib/src/gu/libm_vals.o(.sbss*);
        build/us/lib/ultralib/src/io/dp.o(.sbss*);
        build/us/lib/ultralib/src/io/si.o(.sbss*);
        build/us/src/libkmc/fmod.o(.sbss*);
        build/us/src/libkmc/memmove.o(.sbss*);
        build/us/src/libkmc/memset.o(.sbss*);
        build/us/src/libkmc/modf.o(.sbss*);
        build/us/src/libkmc/rand.o(.sbss*);
        build/us/src/libkmc/strcpy.o(.sbss*);
        build/us/src/libkmc/mmuldi3.o(.sbss*);
        build/us/src/libkmc/ctype.o(.sbss*);
        build/us/asm/us/data/boot/8001B640.bss.o(.sbss*);
        boot_SBSS_END = .;
        boot_SBSS_SIZE = ABSOLUTE(boot_SBSS_END - boot_SBSS_START);

        boot_SCOMMON_START = .;
        build/us/src/boot/boot_main.o(.scommon*);
        build/us/src/boot/dmadata.o(.scommon*);
        build/us/src/gzip/inflate.o(.scommon*);
        build/us/src/gzip/unzip.o(.scommon*);
        build/us/src/boot/util.o(.scommon*);
        build/us/src/boot/rom_offsets.o(.scommon*);
        build/us/lib/ultralib/src/io/conteepprobe.o(.scommon*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.scommon*);
        build/us/lib/ultralib/src/io/conteeplongread.o(.scommon*);
        build/us/lib/ultralib/src/io/pimgr.o(.scommon*);
        build/us/lib/ultralib/src/io/epirawdma.o(.scommon*);
        build/us/lib/ultralib/src/io/epidma.o(.scommon*);
        build/us/lib/ultralib/src/io/cartrominit.o(.scommon*);
        build/us/lib/ultralib/src/io/devmgr.o(.scommon*);
        build/us/lib/ultralib/src/io/piacs.o(.scommon*);
        build/us/lib/ultralib/src/io/pidma.o(.scommon*);
        build/us/lib/ultralib/src/io/aigetlen.o(.scommon*);
        build/us/lib/ultralib/src/io/aigetstat.o(.scommon*);
        build/us/lib/ultralib/src/io/aisetfreq.o(.scommon*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.scommon*);
        build/us/lib/ultralib/src/audio/env.o(.scommon*);
        build/us/lib/ultralib/src/audio/sl.o(.scommon*);
        build/us/lib/ultralib/src/audio/heapinit.o(.scommon*);
        build/us/lib/ultralib/src/audio/synthesizer.o(.scommon*);
        build/us/lib/ultralib/src/audio/syndelete.o(.scommon*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.scommon*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.scommon*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.scommon*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.scommon*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.scommon*);
        build/us/lib/ultralib/src/audio/synsetvol.o(.scommon*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.scommon*);
        build/us/lib/ultralib/src/audio/synsetpan.o(.scommon*);
        build/us/lib/ultralib/src/audio/synallocfx.o(.scommon*);
        build/us/lib/ultralib/src/os/invaldcache.o(.scommon*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.scommon*);
        build/us/lib/ultralib/src/io/contquery.o(.scommon*);
        build/us/lib/ultralib/src/io/contreaddata.o(.scommon*);
        build/us/lib/ultralib/src/io/controller.o(.scommon*);
        build/us/lib/ultralib/src/io/contsetch.o(.scommon*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.scommon*);
        build/us/lib/ultralib/src/gu/sqrtf.o(.scommon*);
        build/us/lib/ultralib/src/gu/cosf.o(.scommon*);
        build/us/lib/ultralib/src/gu/ortho.o(.scommon*);
        build/us/lib/ultralib/src/gu/perspective.o(.scommon*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.scommon*);
        build/us/lib/ultralib/src/gu/sinf.o(.scommon*);
        build/us/lib/ultralib/src/gu/sins.o(.scommon*);
        build/us/lib/ultralib/src/libc/bcmp.o(.scommon*);
        build/us/lib/ultralib/src/libc/bcopy.o(.scommon*);
        build/us/lib/ultralib/src/libc/bzero.o(.scommon*);
        build/us/lib/ultralib/src/libc/string.o(.scommon*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.scommon*);
        build/us/lib/ultralib/src/os/jammesg.o(.scommon*);
        build/us/lib/ultralib/src/os/recvmesg.o(.scommon*);
        build/us/lib/ultralib/src/os/sendmesg.o(.scommon*);
        build/us/lib/ultralib/src/os/seteventmesg.o(.scommon*);
        build/us/lib/ultralib/src/io/sptask.o(.scommon*);
        build/us/lib/ultralib/src/io/sptaskyield.o(.scommon*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.scommon*);
        build/us/lib/ultralib/src/sched/sched.o(.scommon*);
        build/us/lib/ultralib/src/io/sirawdma.o(.scommon*);
        build/us/lib/ultralib/src/io/siacs.o(.scommon*);
        build/us/lib/ultralib/src/os/createthread.o(.scommon*);
        build/us/lib/ultralib/src/os/getthreadpri.o(.scommon*);
        build/us/lib/ultralib/src/os/setthreadpri.o(.scommon*);
        build/us/lib/ultralib/src/os/startthread.o(.scommon*);
        build/us/lib/ultralib/src/os/stopthread.o(.scommon*);
        build/us/lib/ultralib/src/os/thread.o(.scommon*);
        build/us/lib/ultralib/src/os/yieldthread.o(.scommon*);
        build/us/lib/ultralib/src/os/gettime.o(.scommon*);
        build/us/lib/ultralib/src/os/settime.o(.scommon*);
        build/us/lib/ultralib/src/os/settimer.o(.scommon*);
        build/us/lib/ultralib/src/os/timerintr.o(.scommon*);
        build/us/lib/ultralib/src/os/probetlb.o(.scommon*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.scommon*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.scommon*);
        build/us/lib/ultralib/src/io/vimgr.o(.scommon*);
        build/us/lib/ultralib/src/io/vitbl.o(.scommon*);
        build/us/lib/ultralib/src/io/visetevent.o(.scommon*);
        build/us/lib/ultralib/src/io/visetmode.o(.scommon*);
        build/us/lib/ultralib/src/io/visetspecial.o(.scommon*);
        build/us/lib/ultralib/src/io/visetyscale.o(.scommon*);
        build/us/lib/ultralib/src/io/viswapbuf.o(.scommon*);
        build/us/lib/ultralib/src/io/viswapcontext.o(.scommon*);
        build/us/lib/ultralib/src/io/viblack.o(.scommon*);
        build/us/lib/ultralib/src/mgu/mtxident.o(.scommon*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.scommon*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.scommon*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.scommon*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.scommon*);
        build/us/lib/ultralib/src/mgu/scale.o(.scommon*);
        build/us/lib/ultralib/src/mgu/scalef.o(.scommon*);
        build/us/lib/ultralib/src/mgu/translate.o(.scommon*);
        build/us/lib/ultralib/src/mgu/translatef.o(.scommon*);
        build/us/lib/ultralib/src/os/initialize.o(.scommon*);
        build/us/lib/ultralib/src/io/conteepread.o(.scommon*);
        build/us/lib/ultralib/src/io/conteepwrite.o(.scommon*);
        build/us/lib/ultralib/src/os/exceptasm.o(.scommon*);
        build/us/lib/ultralib/src/os/interrupt.o(.scommon*);
        build/us/lib/ultralib/src/os/setintmask.o(.scommon*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.scommon*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.scommon*);
        build/us/lib/ultralib/src/io/pirawdma.o(.scommon*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.scommon*);
        build/us/lib/ultralib/src/io/epirawread.o(.scommon*);
        build/us/lib/ultralib/src/io/epirawwrite.o(.scommon*);
        build/us/lib/ultralib/src/io/ai.o(.scommon*);
        build/us/lib/ultralib/src/audio/drvrnew.o(.scommon*);
        build/us/lib/ultralib/src/audio/load.o(.scommon*);
        build/us/lib/ultralib/src/audio/auxbus.o(.scommon*);
        build/us/lib/ultralib/src/audio/filter.o(.scommon*);
        build/us/lib/ultralib/src/audio/mainbus.o(.scommon*);
        build/us/lib/ultralib/src/audio/resample.o(.scommon*);
        build/us/lib/ultralib/src/audio/reverb.o(.scommon*);
        build/us/lib/ultralib/src/audio/save.o(.scommon*);
        build/us/lib/ultralib/src/audio/heapalloc.o(.scommon*);
        build/us/lib/ultralib/src/audio/copy.o(.scommon*);
        build/us/lib/ultralib/src/os/invalicache.o(.scommon*);
        build/us/lib/ultralib/src/os/writebackdcache.o(.scommon*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.scommon*);
        build/us/lib/ultralib/src/os/getcause.o(.scommon*);
        build/us/lib/ultralib/src/os/getcount.o(.scommon*);
        build/us/lib/ultralib/src/os/getsr.o(.scommon*);
        build/us/lib/ultralib/src/os/setcompare.o(.scommon*);
        build/us/lib/ultralib/src/os/setfpccsr.o(.scommon*);
        build/us/lib/ultralib/src/os/setsr.o(.scommon*);
        build/us/lib/ultralib/src/os/setwatchlo.o(.scommon*);
        build/us/lib/ultralib/src/io/sp.o(.scommon*);
        build/us/lib/ultralib/src/io/spgetstat.o(.scommon*);
        build/us/lib/ultralib/src/io/spsetstat.o(.scommon*);
        build/us/lib/ultralib/src/io/spsetpc.o(.scommon*);
        build/us/lib/ultralib/src/io/sprawdma.o(.scommon*);
        build/us/lib/ultralib/src/io/sirawread.o(.scommon*);
        build/us/lib/ultralib/src/io/sirawwrite.o(.scommon*);
        build/us/lib/ultralib/src/os/destroythread.o(.scommon*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.scommon*);
        build/us/lib/ultralib/src/os/unmaptlball.o(.scommon*);
        build/us/lib/ultralib/src/io/vi.o(.scommon*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.scommon*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.scommon*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.scommon*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.scommon*);
        build/us/lib/ultralib/src/os/parameters.o(.scommon*);
        build/us/lib/ultralib/src/gu/libm_vals.o(.scommon*);
        build/us/lib/ultralib/src/io/dp.o(.scommon*);
        build/us/lib/ultralib/src/io/si.o(.scommon*);
        build/us/src/libkmc/fmod.o(.scommon*);
        build/us/src/libkmc/memmove.o(.scommon*);
        build/us/src/libkmc/memset.o(.scommon*);
        build/us/src/libkmc/modf.o(.scommon*);
        build/us/src/libkmc/rand.o(.scommon*);
        build/us/src/libkmc/strcpy.o(.scommon*);
        build/us/src/libkmc/mmuldi3.o(.scommon*);
        build/us/src/libkmc/ctype.o(.scommon*);
        build/us/asm/us/data/boot/8001B640.bss.o(.scommon*);
        boot_SCOMMON_END = .;
        boot_SCOMMON_SIZE = ABSOLUTE(boot_SCOMMON_END - boot_SCOMMON_START);

        boot_BSS_START = .;
        build/us/src/boot/boot_main.o(.bss*);
        build/us/src/boot/dmadata.o(.bss*);
        build/us/src/gzip/inflate.o(.bss*);
        build/us/src/gzip/unzip.o(.bss*);
        build/us/src/boot/util.o(.bss*);
        build/us/src/boot/rom_offsets.o(.bss*);
        build/us/lib/ultralib/src/io/conteepprobe.o(.bss*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.bss*);
        build/us/lib/ultralib/src/io/conteeplongread.o(.bss*);
        build/us/lib/ultralib/src/io/pimgr.o(.bss*);
        build/us/lib/ultralib/src/io/epirawdma.o(.bss*);
        build/us/lib/ultralib/src/io/epidma.o(.bss*);
        build/us/lib/ultralib/src/io/cartrominit.o(.bss*);
        build/us/lib/ultralib/src/io/devmgr.o(.bss*);
        build/us/lib/ultralib/src/io/piacs.o(.bss*);
        build/us/lib/ultralib/src/io/pidma.o(.bss*);
        build/us/lib/ultralib/src/io/aigetlen.o(.bss*);
        build/us/lib/ultralib/src/io/aigetstat.o(.bss*);
        build/us/lib/ultralib/src/io/aisetfreq.o(.bss*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.bss*);
        build/us/lib/ultralib/src/audio/env.o(.bss*);
        build/us/lib/ultralib/src/audio/sl.o(.bss*);
        build/us/lib/ultralib/src/audio/heapinit.o(.bss*);
        build/us/lib/ultralib/src/audio/synthesizer.o(.bss*);
        build/us/lib/ultralib/src/audio/syndelete.o(.bss*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.bss*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.bss*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.bss*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.bss*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.bss*);
        build/us/lib/ultralib/src/audio/synsetvol.o(.bss*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.bss*);
        build/us/lib/ultralib/src/audio/synsetpan.o(.bss*);
        build/us/lib/ultralib/src/audio/synallocfx.o(.bss*);
        build/us/lib/ultralib/src/os/invaldcache.o(.bss*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.bss*);
        build/us/lib/ultralib/src/io/contquery.o(.bss*);
        build/us/lib/ultralib/src/io/contreaddata.o(.bss*);
        build/us/lib/ultralib/src/io/controller.o(.bss*);
        build/us/lib/ultralib/src/io/contsetch.o(.bss*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.bss*);
        build/us/lib/ultralib/src/gu/sqrtf.o(.bss*);
        build/us/lib/ultralib/src/gu/cosf.o(.bss*);
        build/us/lib/ultralib/src/gu/ortho.o(.bss*);
        build/us/lib/ultralib/src/gu/perspective.o(.bss*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.bss*);
        build/us/lib/ultralib/src/gu/sinf.o(.bss*);
        build/us/lib/ultralib/src/gu/sins.o(.bss*);
        build/us/lib/ultralib/src/libc/bcmp.o(.bss*);
        build/us/lib/ultralib/src/libc/bcopy.o(.bss*);
        build/us/lib/ultralib/src/libc/bzero.o(.bss*);
        build/us/lib/ultralib/src/libc/string.o(.bss*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.bss*);
        build/us/lib/ultralib/src/os/jammesg.o(.bss*);
        build/us/lib/ultralib/src/os/recvmesg.o(.bss*);
        build/us/lib/ultralib/src/os/sendmesg.o(.bss*);
        build/us/lib/ultralib/src/os/seteventmesg.o(.bss*);
        build/us/lib/ultralib/src/io/sptask.o(.bss*);
        build/us/lib/ultralib/src/io/sptaskyield.o(.bss*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.bss*);
        build/us/lib/ultralib/src/sched/sched.o(.bss*);
        build/us/lib/ultralib/src/io/sirawdma.o(.bss*);
        build/us/lib/ultralib/src/io/siacs.o(.bss*);
        build/us/lib/ultralib/src/os/createthread.o(.bss*);
        build/us/lib/ultralib/src/os/getthreadpri.o(.bss*);
        build/us/lib/ultralib/src/os/setthreadpri.o(.bss*);
        build/us/lib/ultralib/src/os/startthread.o(.bss*);
        build/us/lib/ultralib/src/os/stopthread.o(.bss*);
        build/us/lib/ultralib/src/os/thread.o(.bss*);
        build/us/lib/ultralib/src/os/yieldthread.o(.bss*);
        build/us/lib/ultralib/src/os/gettime.o(.bss*);
        build/us/lib/ultralib/src/os/settime.o(.bss*);
        build/us/lib/ultralib/src/os/settimer.o(.bss*);
        build/us/lib/ultralib/src/os/timerintr.o(.bss*);
        build/us/lib/ultralib/src/os/probetlb.o(.bss*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.bss*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.bss*);
        build/us/lib/ultralib/src/io/vimgr.o(.bss*);
        build/us/lib/ultralib/src/io/vitbl.o(.bss*);
        build/us/lib/ultralib/src/io/visetevent.o(.bss*);
        build/us/lib/ultralib/src/io/visetmode.o(.bss*);
        build/us/lib/ultralib/src/io/visetspecial.o(.bss*);
        build/us/lib/ultralib/src/io/visetyscale.o(.bss*);
        build/us/lib/ultralib/src/io/viswapbuf.o(.bss*);
        build/us/lib/ultralib/src/io/viswapcontext.o(.bss*);
        build/us/lib/ultralib/src/io/viblack.o(.bss*);
        build/us/lib/ultralib/src/mgu/mtxident.o(.bss*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.bss*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.bss*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.bss*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.bss*);
        build/us/lib/ultralib/src/mgu/scale.o(.bss*);
        build/us/lib/ultralib/src/mgu/scalef.o(.bss*);
        build/us/lib/ultralib/src/mgu/translate.o(.bss*);
        build/us/lib/ultralib/src/mgu/translatef.o(.bss*);
        build/us/lib/ultralib/src/os/initialize.o(.bss*);
        build/us/lib/ultralib/src/io/conteepread.o(.bss*);
        build/us/lib/ultralib/src/io/conteepwrite.o(.bss*);
        build/us/lib/ultralib/src/os/exceptasm.o(.bss*);
        build/us/lib/ultralib/src/os/interrupt.o(.bss*);
        build/us/lib/ultralib/src/os/setintmask.o(.bss*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.bss*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.bss*);
        build/us/lib/ultralib/src/io/pirawdma.o(.bss*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.bss*);
        build/us/lib/ultralib/src/io/epirawread.o(.bss*);
        build/us/lib/ultralib/src/io/epirawwrite.o(.bss*);
        build/us/lib/ultralib/src/io/ai.o(.bss*);
        build/us/lib/ultralib/src/audio/drvrnew.o(.bss*);
        build/us/lib/ultralib/src/audio/load.o(.bss*);
        build/us/lib/ultralib/src/audio/auxbus.o(.bss*);
        build/us/lib/ultralib/src/audio/filter.o(.bss*);
        build/us/lib/ultralib/src/audio/mainbus.o(.bss*);
        build/us/lib/ultralib/src/audio/resample.o(.bss*);
        build/us/lib/ultralib/src/audio/reverb.o(.bss*);
        build/us/lib/ultralib/src/audio/save.o(.bss*);
        build/us/lib/ultralib/src/audio/heapalloc.o(.bss*);
        build/us/lib/ultralib/src/audio/copy.o(.bss*);
        build/us/lib/ultralib/src/os/invalicache.o(.bss*);
        build/us/lib/ultralib/src/os/writebackdcache.o(.bss*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.bss*);
        build/us/lib/ultralib/src/os/getcause.o(.bss*);
        build/us/lib/ultralib/src/os/getcount.o(.bss*);
        build/us/lib/ultralib/src/os/getsr.o(.bss*);
        build/us/lib/ultralib/src/os/setcompare.o(.bss*);
        build/us/lib/ultralib/src/os/setfpccsr.o(.bss*);
        build/us/lib/ultralib/src/os/setsr.o(.bss*);
        build/us/lib/ultralib/src/os/setwatchlo.o(.bss*);
        build/us/lib/ultralib/src/io/sp.o(.bss*);
        build/us/lib/ultralib/src/io/spgetstat.o(.bss*);
        build/us/lib/ultralib/src/io/spsetstat.o(.bss*);
        build/us/lib/ultralib/src/io/spsetpc.o(.bss*);
        build/us/lib/ultralib/src/io/sprawdma.o(.bss*);
        build/us/lib/ultralib/src/io/sirawread.o(.bss*);
        build/us/lib/ultralib/src/io/sirawwrite.o(.bss*);
        build/us/lib/ultralib/src/os/destroythread.o(.bss*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.bss*);
        build/us/lib/ultralib/src/os/unmaptlball.o(.bss*);
        build/us/lib/ultralib/src/io/vi.o(.bss*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.bss*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.bss*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.bss*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.bss*);
        build/us/lib/ultralib/src/os/parameters.o(.bss*);
        build/us/lib/ultralib/src/gu/libm_vals.o(.bss*);
        build/us/lib/ultralib/src/io/dp.o(.bss*);
        build/us/lib/ultralib/src/io/si.o(.bss*);
        build/us/src/libkmc/fmod.o(.bss*);
        build/us/src/libkmc/memmove.o(.bss*);
        build/us/src/libkmc/memset.o(.bss*);
        build/us/src/libkmc/modf.o(.bss*);
        build/us/src/libkmc/rand.o(.bss*);
        build/us/src/libkmc/strcpy.o(.bss*);
        build/us/src/libkmc/mmuldi3.o(.bss*);
        build/us/src/libkmc/ctype.o(.bss*);
        build/us/asm/us/data/boot/8001B640.bss.o(.bss*);
        boot_BSS_END = .;
        boot_BSS_SIZE = ABSOLUTE(boot_BSS_END - boot_BSS_START);

        bootCOMMON_START = .;
        build/us/src/boot/boot_main.o(COMMON*);
        build/us/src/boot/dmadata.o(COMMON*);
        build/us/src/gzip/inflate.o(COMMON*);
        build/us/src/gzip/unzip.o(COMMON*);
        build/us/src/boot/util.o(COMMON*);
        build/us/src/boot/rom_offsets.o(COMMON*);
        build/us/lib/ultralib/src/io/conteepprobe.o(COMMON*);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(COMMON*);
        build/us/lib/ultralib/src/io/conteeplongread.o(COMMON*);
        build/us/lib/ultralib/src/io/pimgr.o(COMMON*);
        build/us/lib/ultralib/src/io/epirawdma.o(COMMON*);
        build/us/lib/ultralib/src/io/epidma.o(COMMON*);
        build/us/lib/ultralib/src/io/cartrominit.o(COMMON*);
        build/us/lib/ultralib/src/io/devmgr.o(COMMON*);
        build/us/lib/ultralib/src/io/piacs.o(COMMON*);
        build/us/lib/ultralib/src/io/pidma.o(COMMON*);
        build/us/lib/ultralib/src/io/aigetlen.o(COMMON*);
        build/us/lib/ultralib/src/io/aigetstat.o(COMMON*);
        build/us/lib/ultralib/src/io/aisetfreq.o(COMMON*);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(COMMON*);
        build/us/lib/ultralib/src/audio/env.o(COMMON*);
        build/us/lib/ultralib/src/audio/sl.o(COMMON*);
        build/us/lib/ultralib/src/audio/heapinit.o(COMMON*);
        build/us/lib/ultralib/src/audio/synthesizer.o(COMMON*);
        build/us/lib/ultralib/src/audio/syndelete.o(COMMON*);
        build/us/lib/ultralib/src/audio/synaddplayer.o(COMMON*);
        build/us/lib/ultralib/src/audio/synallocvoice.o(COMMON*);
        build/us/lib/ultralib/src/audio/synstopvoice.o(COMMON*);
        build/us/lib/ultralib/src/audio/synstartvoice.o(COMMON*);
        build/us/lib/ultralib/src/audio/synsetpitch.o(COMMON*);
        build/us/lib/ultralib/src/audio/synsetvol.o(COMMON*);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(COMMON*);
        build/us/lib/ultralib/src/audio/synsetpan.o(COMMON*);
        build/us/lib/ultralib/src/audio/synallocfx.o(COMMON*);
        build/us/lib/ultralib/src/os/invaldcache.o(COMMON*);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(COMMON*);
        build/us/lib/ultralib/src/io/contquery.o(COMMON*);
        build/us/lib/ultralib/src/io/contreaddata.o(COMMON*);
        build/us/lib/ultralib/src/io/controller.o(COMMON*);
        build/us/lib/ultralib/src/io/contsetch.o(COMMON*);
        build/us/lib/ultralib/src/os/virtualtophysical.o(COMMON*);
        build/us/lib/ultralib/src/gu/sqrtf.o(COMMON*);
        build/us/lib/ultralib/src/gu/cosf.o(COMMON*);
        build/us/lib/ultralib/src/gu/ortho.o(COMMON*);
        build/us/lib/ultralib/src/gu/perspective.o(COMMON*);
        build/us/lib/ultralib/src/gu/rotaterpy.o(COMMON*);
        build/us/lib/ultralib/src/gu/sinf.o(COMMON*);
        build/us/lib/ultralib/src/gu/sins.o(COMMON*);
        build/us/lib/ultralib/src/libc/bcmp.o(COMMON*);
        build/us/lib/ultralib/src/libc/bcopy.o(COMMON*);
        build/us/lib/ultralib/src/libc/bzero.o(COMMON*);
        build/us/lib/ultralib/src/libc/string.o(COMMON*);
        build/us/lib/ultralib/src/os/createmesgqueue.o(COMMON*);
        build/us/lib/ultralib/src/os/jammesg.o(COMMON*);
        build/us/lib/ultralib/src/os/recvmesg.o(COMMON*);
        build/us/lib/ultralib/src/os/sendmesg.o(COMMON*);
        build/us/lib/ultralib/src/os/seteventmesg.o(COMMON*);
        build/us/lib/ultralib/src/io/sptask.o(COMMON*);
        build/us/lib/ultralib/src/io/sptaskyield.o(COMMON*);
        build/us/lib/ultralib/src/io/sptaskyielded.o(COMMON*);
        build/us/lib/ultralib/src/sched/sched.o(COMMON*);
        build/us/lib/ultralib/src/io/sirawdma.o(COMMON*);
        build/us/lib/ultralib/src/io/siacs.o(COMMON*);
        build/us/lib/ultralib/src/os/createthread.o(COMMON*);
        build/us/lib/ultralib/src/os/getthreadpri.o(COMMON*);
        build/us/lib/ultralib/src/os/setthreadpri.o(COMMON*);
        build/us/lib/ultralib/src/os/startthread.o(COMMON*);
        build/us/lib/ultralib/src/os/stopthread.o(COMMON*);
        build/us/lib/ultralib/src/os/thread.o(COMMON*);
        build/us/lib/ultralib/src/os/yieldthread.o(COMMON*);
        build/us/lib/ultralib/src/os/gettime.o(COMMON*);
        build/us/lib/ultralib/src/os/settime.o(COMMON*);
        build/us/lib/ultralib/src/os/settimer.o(COMMON*);
        build/us/lib/ultralib/src/os/timerintr.o(COMMON*);
        build/us/lib/ultralib/src/os/probetlb.o(COMMON*);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(COMMON*);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(COMMON*);
        build/us/lib/ultralib/src/io/vimgr.o(COMMON*);
        build/us/lib/ultralib/src/io/vitbl.o(COMMON*);
        build/us/lib/ultralib/src/io/visetevent.o(COMMON*);
        build/us/lib/ultralib/src/io/visetmode.o(COMMON*);
        build/us/lib/ultralib/src/io/visetspecial.o(COMMON*);
        build/us/lib/ultralib/src/io/visetyscale.o(COMMON*);
        build/us/lib/ultralib/src/io/viswapbuf.o(COMMON*);
        build/us/lib/ultralib/src/io/viswapcontext.o(COMMON*);
        build/us/lib/ultralib/src/io/viblack.o(COMMON*);
        build/us/lib/ultralib/src/mgu/mtxident.o(COMMON*);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(COMMON*);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(COMMON*);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(COMMON*);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(COMMON*);
        build/us/lib/ultralib/src/mgu/scale.o(COMMON*);
        build/us/lib/ultralib/src/mgu/scalef.o(COMMON*);
        build/us/lib/ultralib/src/mgu/translate.o(COMMON*);
        build/us/lib/ultralib/src/mgu/translatef.o(COMMON*);
        build/us/lib/ultralib/src/os/initialize.o(COMMON*);
        build/us/lib/ultralib/src/io/conteepread.o(COMMON*);
        build/us/lib/ultralib/src/io/conteepwrite.o(COMMON*);
        build/us/lib/ultralib/src/os/exceptasm.o(COMMON*);
        build/us/lib/ultralib/src/os/interrupt.o(COMMON*);
        build/us/lib/ultralib/src/os/setintmask.o(COMMON*);
        build/us/lib/ultralib/src/os/setglobalintmask.o(COMMON*);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(COMMON*);
        build/us/lib/ultralib/src/io/pirawdma.o(COMMON*);
        build/us/lib/ultralib/src/io/pigetcmdq.o(COMMON*);
        build/us/lib/ultralib/src/io/epirawread.o(COMMON*);
        build/us/lib/ultralib/src/io/epirawwrite.o(COMMON*);
        build/us/lib/ultralib/src/io/ai.o(COMMON*);
        build/us/lib/ultralib/src/audio/drvrnew.o(COMMON*);
        build/us/lib/ultralib/src/audio/load.o(COMMON*);
        build/us/lib/ultralib/src/audio/auxbus.o(COMMON*);
        build/us/lib/ultralib/src/audio/filter.o(COMMON*);
        build/us/lib/ultralib/src/audio/mainbus.o(COMMON*);
        build/us/lib/ultralib/src/audio/resample.o(COMMON*);
        build/us/lib/ultralib/src/audio/reverb.o(COMMON*);
        build/us/lib/ultralib/src/audio/save.o(COMMON*);
        build/us/lib/ultralib/src/audio/heapalloc.o(COMMON*);
        build/us/lib/ultralib/src/audio/copy.o(COMMON*);
        build/us/lib/ultralib/src/os/invalicache.o(COMMON*);
        build/us/lib/ultralib/src/os/writebackdcache.o(COMMON*);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(COMMON*);
        build/us/lib/ultralib/src/os/getcause.o(COMMON*);
        build/us/lib/ultralib/src/os/getcount.o(COMMON*);
        build/us/lib/ultralib/src/os/getsr.o(COMMON*);
        build/us/lib/ultralib/src/os/setcompare.o(COMMON*);
        build/us/lib/ultralib/src/os/setfpccsr.o(COMMON*);
        build/us/lib/ultralib/src/os/setsr.o(COMMON*);
        build/us/lib/ultralib/src/os/setwatchlo.o(COMMON*);
        build/us/lib/ultralib/src/io/sp.o(COMMON*);
        build/us/lib/ultralib/src/io/spgetstat.o(COMMON*);
        build/us/lib/ultralib/src/io/spsetstat.o(COMMON*);
        build/us/lib/ultralib/src/io/spsetpc.o(COMMON*);
        build/us/lib/ultralib/src/io/sprawdma.o(COMMON*);
        build/us/lib/ultralib/src/io/sirawread.o(COMMON*);
        build/us/lib/ultralib/src/io/sirawwrite.o(COMMON*);
        build/us/lib/ultralib/src/os/destroythread.o(COMMON*);
        build/us/lib/ultralib/src/os/maptlbrdb.o(COMMON*);
        build/us/lib/ultralib/src/os/unmaptlball.o(COMMON*);
        build/us/lib/ultralib/src/io/vi.o(COMMON*);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(COMMON*);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(COMMON*);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(COMMON*);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(COMMON*);
        build/us/lib/ultralib/src/os/parameters.o(COMMON*);
        build/us/lib/ultralib/src/gu/libm_vals.o(COMMON*);
        build/us/lib/ultralib/src/io/dp.o(COMMON*);
        build/us/lib/ultralib/src/io/si.o(COMMON*);
        build/us/src/libkmc/fmod.o(COMMON*);
        build/us/src/libkmc/memmove.o(COMMON*);
        build/us/src/libkmc/memset.o(COMMON*);
        build/us/src/libkmc/modf.o(COMMON*);
        build/us/src/libkmc/rand.o(COMMON*);
        build/us/src/libkmc/strcpy.o(COMMON*);
        build/us/src/libkmc/mmuldi3.o(COMMON*);
        build/us/src/libkmc/ctype.o(COMMON*);
        build/us/asm/us/data/boot/8001B640.bss.o(COMMON*);
        bootCOMMON_END = .;
        bootCOMMON_SIZE = ABSOLUTE(bootCOMMON_END - bootCOMMON_START);
    }

    boot_noload_VRAM_END = .;
    boot_noload_VRAM_SIZE = ABSOLUTE(boot_noload_VRAM_END - boot_noload_VRAM);

    __romPos += SIZEOF(.boot);
    boot_VRAM_END = .;
    boot_VRAM_SIZE = ABSOLUTE(boot_VRAM_END - boot_VRAM);
    boot_ROM_END = __romPos;
    boot_ROM_SIZE = ABSOLUTE(boot_ROM_END - boot_ROM_START);

    dma_table_ROM_START = __romPos;
    dma_table_VRAM = ADDR(.dma_table);
    dma_table_alloc_VRAM = .;

    .dma_table : AT(dma_table_ROM_START)
    {
        FILL(0x00000000);
        dma_table_TEXT_START = .;
        build/us/src/dma_table/dma_table.o(.text*);
        dma_table_TEXT_END = .;
        dma_table_TEXT_SIZE = ABSOLUTE(dma_table_TEXT_END - dma_table_TEXT_START);

        dma_table_DATA_START = .;
        build/us/src/dma_table/dma_table.o(.data*);
        dma_table_DATA_END = .;
        dma_table_DATA_SIZE = ABSOLUTE(dma_table_DATA_END - dma_table_DATA_START);

        dma_table_RODATA_START = .;
        build/us/src/dma_table/dma_table.o(.rodata*);
        dma_table_RODATA_END = .;
        dma_table_RODATA_SIZE = ABSOLUTE(dma_table_RODATA_END - dma_table_RODATA_START);

        dma_table_SDATA_START = .;
        build/us/src/dma_table/dma_table.o(.sdata*);
        dma_table_SDATA_END = .;
        dma_table_SDATA_SIZE = ABSOLUTE(dma_table_SDATA_END - dma_table_SDATA_START);
    }

    dma_table_alloc_VRAM_END = .;
    dma_table_alloc_VRAM_SIZE = ABSOLUTE(dma_table_alloc_VRAM_END - dma_table_alloc_VRAM);

    dma_table_noload_VRAM = .;

    .dma_table.noload (NOLOAD) :
    {
        FILL(0x00000000);
        dma_table_SBSS_START = .;
        build/us/src/dma_table/dma_table.o(.sbss*);
        dma_table_SBSS_END = .;
        dma_table_SBSS_SIZE = ABSOLUTE(dma_table_SBSS_END - dma_table_SBSS_START);

        dma_table_SCOMMON_START = .;
        build/us/src/dma_table/dma_table.o(.scommon*);
        dma_table_SCOMMON_END = .;
        dma_table_SCOMMON_SIZE = ABSOLUTE(dma_table_SCOMMON_END - dma_table_SCOMMON_START);

        dma_table_BSS_START = .;
        build/us/src/dma_table/dma_table.o(.bss*);
        dma_table_BSS_END = .;
        dma_table_BSS_SIZE = ABSOLUTE(dma_table_BSS_END - dma_table_BSS_START);

        dma_tableCOMMON_START = .;
        build/us/src/dma_table/dma_table.o(COMMON*);
        dma_tableCOMMON_END = .;
        dma_tableCOMMON_SIZE = ABSOLUTE(dma_tableCOMMON_END - dma_tableCOMMON_START);
    }

    dma_table_noload_VRAM_END = .;
    dma_table_noload_VRAM_SIZE = ABSOLUTE(dma_table_noload_VRAM_END - dma_table_noload_VRAM);

    __romPos += SIZEOF(.dma_table);
    dma_table_VRAM_END = .;
    dma_table_VRAM_SIZE = ABSOLUTE(dma_table_VRAM_END - dma_table_VRAM);
    dma_table_ROM_END = __romPos;
    dma_table_ROM_SIZE = ABSOLUTE(dma_table_ROM_END - dma_table_ROM_START);

    main_segment_ROM_START = __romPos;
    main_segment_VRAM = ADDR(.main_segment);
    main_segment_alloc_VRAM = .;

    .main_segment : AT(main_segment_ROM_START)
    {
        FILL(0x00000000);
        main_segment_TEXT_START = .;
        build/us/src/main_segment/main.o(.text*);
        build/us/src/main_segment/nnsched.o(.text*);
        build/us/src/main_segment/joy.o(.text*);
        build/us/src/main_segment/audio/sound.o(.text*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(.text*);
        build/us/src/main_segment/graphic.o(.text*);
        build/us/src/main_segment/graphics/static.o(.text*);
        build/us/src/main_segment/graphics/graphic_dlists.o(.text*);
        build/us/src/main_segment/audio/music_driver.o(.text*);
        build/us/src/main_segment/main1x.o(.text*);
        build/us/src/main_segment/vr_init.o(.text*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(.text*);
        build/us/src/main_segment/aiset.o(.text*);
        build/us/asm/us/data/main_segment/aiset.data.o(.text*);
        build/us/asm/us/data/main_segment/aiset.bss.o(.text*);
        build/us/src/main_segment/record.o(.text*);
        build/us/asm/us/data/main_segment/record.bss.o(.text*);
        build/us/src/main_segment/unused/020D10.o(.text*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(.text*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(.text*);
        build/us/src/main_segment/game_etc.o(.text*);
        build/us/asm/us/data/main_segment/game_etc.data.o(.text*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(.text*);
        build/us/src/main_segment/screen_print/printer.o(.text*);
        build/us/src/main_segment/screen_print/printf_impl.o(.text*);
        build/us/asm/us/data/main_segment/0750C0.data.o(.text*);
        build/us/src/main_segment/screen_print/debug_print.o(.text*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(.text*);
        build/us/src/main_segment/debug_menu.o(.text*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(.text*);
        build/us/src/main_segment/028820.o(.text*);
        build/us/src/main_segment/tex_func.o(.text*);
        build/us/src/main_segment/main_menu.o(.text*);
        build/us/src/main_segment/font.o(.text*);
        build/us/src/main_segment/msgwnd.o(.text*);
        build/us/src/main_segment/char_anime.o(.text*);
        build/us/src/main_segment/dm_virus_init.o(.text*);
        build/us/src/main_segment/dm_game_main.o(.text*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(.text*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(.text*);
        build/us/src/main_segment/dm_manual_main.o(.text*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(.text*);
        build/us/src/main_segment/dm_title_main.o(.text*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(.text*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(.text*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(.text*);
        build/us/src/main_segment/main_story.o(.text*);
        build/us/asm/us/data/main_segment/main_story.data.o(.text*);
        build/us/asm/us/data/main_segment/main_story.bss.o(.text*);
        build/us/src/main_segment/lws.o(.text*);
        build/us/asm/us/data/main_segment/lws.bss.o(.text*);
        build/us/src/main_segment/calc.o(.text*);
        build/us/src/main_segment/unused/065080.o(.text*);
        build/us/src/main_segment/unused/066080.o(.text*);
        build/us/src/main_segment/replay.o(.text*);
        build/us/asm/us/data/main_segment/replay.bss.o(.text*);
        build/us/src/main_segment/066580.o(.text*);
        build/us/src/main_segment/066840.o(.text*);
        build/us/src/main_segment/unused/055C40.o(.text*);
        build/us/lib/libmus/src/player.o(.text*);
        build/us/lib/libmus/src/player_fx.o(.text*);
        build/us/lib/libmus/src/aud_dma.o(.text*);
        build/us/lib/libmus/src/aud_sched.o(.text*);
        build/us/lib/libmus/src/aud_thread.o(.text*);
        build/us/lib/libmus/src/lib_memory.o(.text*);
        build/us/lib/libmus/src/aud_samples.o(.text*);
        build/us/asm/us/data/rsp/rspboot.o(.text*);
        build/us/asm/us/data/rsp/aspMain.o(.text*);
        build/us/asm/us/data/rsp/f3dex2.o(.text*);
        build/us/asm/us/data/rsp/s2dex.o(.text*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(.text*);
        main_segment_TEXT_END = .;
        main_segment_TEXT_SIZE = ABSOLUTE(main_segment_TEXT_END - main_segment_TEXT_START);

        main_segment_DATA_START = .;
        build/us/src/main_segment/main.o(.data*);
        build/us/src/main_segment/nnsched.o(.data*);
        build/us/src/main_segment/joy.o(.data*);
        build/us/src/main_segment/audio/sound.o(.data*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(.data*);
        build/us/src/main_segment/graphic.o(.data*);
        build/us/src/main_segment/graphics/static.o(.data*);
        build/us/src/main_segment/graphics/graphic_dlists.o(.data*);
        build/us/src/main_segment/audio/music_driver.o(.data*);
        build/us/src/main_segment/main1x.o(.data*);
        build/us/src/main_segment/vr_init.o(.data*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(.data*);
        build/us/src/main_segment/aiset.o(.data*);
        build/us/asm/us/data/main_segment/aiset.data.o(.data*);
        build/us/asm/us/data/main_segment/aiset.bss.o(.data*);
        build/us/src/main_segment/record.o(.data*);
        build/us/asm/us/data/main_segment/record.bss.o(.data*);
        build/us/src/main_segment/unused/020D10.o(.data*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(.data*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(.data*);
        build/us/src/main_segment/game_etc.o(.data*);
        build/us/asm/us/data/main_segment/game_etc.data.o(.data*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(.data*);
        build/us/src/main_segment/screen_print/printer.o(.data*);
        build/us/src/main_segment/screen_print/printf_impl.o(.data*);
        build/us/asm/us/data/main_segment/0750C0.data.o(.data*);
        build/us/src/main_segment/screen_print/debug_print.o(.data*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(.data*);
        build/us/src/main_segment/debug_menu.o(.data*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(.data*);
        build/us/src/main_segment/028820.o(.data*);
        build/us/src/main_segment/tex_func.o(.data*);
        build/us/src/main_segment/main_menu.o(.data*);
        build/us/src/main_segment/font.o(.data*);
        build/us/src/main_segment/msgwnd.o(.data*);
        build/us/src/main_segment/char_anime.o(.data*);
        build/us/src/main_segment/dm_virus_init.o(.data*);
        build/us/src/main_segment/dm_game_main.o(.data*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(.data*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(.data*);
        build/us/src/main_segment/dm_manual_main.o(.data*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(.data*);
        build/us/src/main_segment/dm_title_main.o(.data*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(.data*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(.data*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(.data*);
        build/us/src/main_segment/main_story.o(.data*);
        build/us/asm/us/data/main_segment/main_story.data.o(.data*);
        build/us/asm/us/data/main_segment/main_story.bss.o(.data*);
        build/us/src/main_segment/lws.o(.data*);
        build/us/asm/us/data/main_segment/lws.bss.o(.data*);
        build/us/src/main_segment/calc.o(.data*);
        build/us/src/main_segment/unused/065080.o(.data*);
        build/us/src/main_segment/unused/066080.o(.data*);
        build/us/src/main_segment/replay.o(.data*);
        build/us/asm/us/data/main_segment/replay.bss.o(.data*);
        build/us/src/main_segment/066580.o(.data*);
        build/us/src/main_segment/066840.o(.data*);
        build/us/src/main_segment/unused/055C40.o(.data*);
        build/us/lib/libmus/src/player.o(.data*);
        build/us/lib/libmus/src/player_fx.o(.data*);
        build/us/lib/libmus/src/aud_dma.o(.data*);
        build/us/lib/libmus/src/aud_sched.o(.data*);
        build/us/lib/libmus/src/aud_thread.o(.data*);
        build/us/lib/libmus/src/lib_memory.o(.data*);
        build/us/lib/libmus/src/aud_samples.o(.data*);
        build/us/asm/us/data/rsp/rspboot.o(.data*);
        build/us/asm/us/data/rsp/aspMain.o(.data*);
        build/us/asm/us/data/rsp/f3dex2.o(.data*);
        build/us/asm/us/data/rsp/s2dex.o(.data*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(.data*);
        main_segment_DATA_END = .;
        main_segment_DATA_SIZE = ABSOLUTE(main_segment_DATA_END - main_segment_DATA_START);

        main_segment_RODATA_START = .;
        build/us/src/main_segment/main.o(.rodata*);
        build/us/src/main_segment/nnsched.o(.rodata*);
        build/us/src/main_segment/joy.o(.rodata*);
        build/us/src/main_segment/audio/sound.o(.rodata*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(.rodata*);
        build/us/src/main_segment/graphic.o(.rodata*);
        build/us/src/main_segment/graphics/static.o(.rodata*);
        build/us/src/main_segment/graphics/graphic_dlists.o(.rodata*);
        build/us/src/main_segment/audio/music_driver.o(.rodata*);
        build/us/src/main_segment/main1x.o(.rodata*);
        build/us/src/main_segment/vr_init.o(.rodata*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(.rodata*);
        build/us/src/main_segment/aiset.o(.rodata*);
        build/us/asm/us/data/main_segment/aiset.data.o(.rodata*);
        build/us/asm/us/data/main_segment/aiset.bss.o(.rodata*);
        build/us/src/main_segment/record.o(.rodata*);
        build/us/asm/us/data/main_segment/record.bss.o(.rodata*);
        build/us/src/main_segment/unused/020D10.o(.rodata*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(.rodata*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(.rodata*);
        build/us/src/main_segment/game_etc.o(.rodata*);
        build/us/asm/us/data/main_segment/game_etc.data.o(.rodata*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(.rodata*);
        build/us/src/main_segment/screen_print/printer.o(.rodata*);
        build/us/src/main_segment/screen_print/printf_impl.o(.rodata*);
        build/us/asm/us/data/main_segment/0750C0.data.o(.rodata*);
        build/us/src/main_segment/screen_print/debug_print.o(.rodata*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(.rodata*);
        build/us/src/main_segment/debug_menu.o(.rodata*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(.rodata*);
        build/us/src/main_segment/028820.o(.rodata*);
        build/us/src/main_segment/tex_func.o(.rodata*);
        build/us/src/main_segment/main_menu.o(.rodata*);
        build/us/src/main_segment/font.o(.rodata*);
        build/us/src/main_segment/msgwnd.o(.rodata*);
        build/us/src/main_segment/char_anime.o(.rodata*);
        build/us/src/main_segment/dm_virus_init.o(.rodata*);
        build/us/src/main_segment/dm_game_main.o(.rodata*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(.rodata*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(.rodata*);
        build/us/src/main_segment/dm_manual_main.o(.rodata*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(.rodata*);
        build/us/src/main_segment/dm_title_main.o(.rodata*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(.rodata*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(.rodata*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(.rodata*);
        build/us/src/main_segment/main_story.o(.rodata*);
        build/us/asm/us/data/main_segment/main_story.data.o(.rodata*);
        build/us/asm/us/data/main_segment/main_story.bss.o(.rodata*);
        build/us/src/main_segment/lws.o(.rodata*);
        build/us/asm/us/data/main_segment/lws.bss.o(.rodata*);
        build/us/src/main_segment/calc.o(.rodata*);
        build/us/src/main_segment/unused/065080.o(.rodata*);
        build/us/src/main_segment/unused/066080.o(.rodata*);
        build/us/src/main_segment/replay.o(.rodata*);
        build/us/asm/us/data/main_segment/replay.bss.o(.rodata*);
        build/us/src/main_segment/066580.o(.rodata*);
        build/us/src/main_segment/066840.o(.rodata*);
        build/us/src/main_segment/unused/055C40.o(.rodata*);
        build/us/lib/libmus/src/player.o(.rodata*);
        build/us/lib/libmus/src/player_fx.o(.rodata*);
        build/us/lib/libmus/src/aud_dma.o(.rodata*);
        build/us/lib/libmus/src/aud_sched.o(.rodata*);
        build/us/lib/libmus/src/aud_thread.o(.rodata*);
        build/us/lib/libmus/src/lib_memory.o(.rodata*);
        build/us/lib/libmus/src/aud_samples.o(.rodata*);
        build/us/asm/us/data/rsp/rspboot.o(.rodata*);
        build/us/asm/us/data/rsp/aspMain.o(.rodata*);
        build/us/asm/us/data/rsp/f3dex2.o(.rodata*);
        build/us/asm/us/data/rsp/s2dex.o(.rodata*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(.rodata*);
        main_segment_RODATA_END = .;
        main_segment_RODATA_SIZE = ABSOLUTE(main_segment_RODATA_END - main_segment_RODATA_START);

        main_segment_SDATA_START = .;
        build/us/src/main_segment/main.o(.sdata*);
        build/us/src/main_segment/nnsched.o(.sdata*);
        build/us/src/main_segment/joy.o(.sdata*);
        build/us/src/main_segment/audio/sound.o(.sdata*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(.sdata*);
        build/us/src/main_segment/graphic.o(.sdata*);
        build/us/src/main_segment/graphics/static.o(.sdata*);
        build/us/src/main_segment/graphics/graphic_dlists.o(.sdata*);
        build/us/src/main_segment/audio/music_driver.o(.sdata*);
        build/us/src/main_segment/main1x.o(.sdata*);
        build/us/src/main_segment/vr_init.o(.sdata*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(.sdata*);
        build/us/src/main_segment/aiset.o(.sdata*);
        build/us/asm/us/data/main_segment/aiset.data.o(.sdata*);
        build/us/asm/us/data/main_segment/aiset.bss.o(.sdata*);
        build/us/src/main_segment/record.o(.sdata*);
        build/us/asm/us/data/main_segment/record.bss.o(.sdata*);
        build/us/src/main_segment/unused/020D10.o(.sdata*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(.sdata*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(.sdata*);
        build/us/src/main_segment/game_etc.o(.sdata*);
        build/us/asm/us/data/main_segment/game_etc.data.o(.sdata*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(.sdata*);
        build/us/src/main_segment/screen_print/printer.o(.sdata*);
        build/us/src/main_segment/screen_print/printf_impl.o(.sdata*);
        build/us/asm/us/data/main_segment/0750C0.data.o(.sdata*);
        build/us/src/main_segment/screen_print/debug_print.o(.sdata*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(.sdata*);
        build/us/src/main_segment/debug_menu.o(.sdata*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(.sdata*);
        build/us/src/main_segment/028820.o(.sdata*);
        build/us/src/main_segment/tex_func.o(.sdata*);
        build/us/src/main_segment/main_menu.o(.sdata*);
        build/us/src/main_segment/font.o(.sdata*);
        build/us/src/main_segment/msgwnd.o(.sdata*);
        build/us/src/main_segment/char_anime.o(.sdata*);
        build/us/src/main_segment/dm_virus_init.o(.sdata*);
        build/us/src/main_segment/dm_game_main.o(.sdata*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(.sdata*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(.sdata*);
        build/us/src/main_segment/dm_manual_main.o(.sdata*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(.sdata*);
        build/us/src/main_segment/dm_title_main.o(.sdata*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(.sdata*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(.sdata*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(.sdata*);
        build/us/src/main_segment/main_story.o(.sdata*);
        build/us/asm/us/data/main_segment/main_story.data.o(.sdata*);
        build/us/asm/us/data/main_segment/main_story.bss.o(.sdata*);
        build/us/src/main_segment/lws.o(.sdata*);
        build/us/asm/us/data/main_segment/lws.bss.o(.sdata*);
        build/us/src/main_segment/calc.o(.sdata*);
        build/us/src/main_segment/unused/065080.o(.sdata*);
        build/us/src/main_segment/unused/066080.o(.sdata*);
        build/us/src/main_segment/replay.o(.sdata*);
        build/us/asm/us/data/main_segment/replay.bss.o(.sdata*);
        build/us/src/main_segment/066580.o(.sdata*);
        build/us/src/main_segment/066840.o(.sdata*);
        build/us/src/main_segment/unused/055C40.o(.sdata*);
        build/us/lib/libmus/src/player.o(.sdata*);
        build/us/lib/libmus/src/player_fx.o(.sdata*);
        build/us/lib/libmus/src/aud_dma.o(.sdata*);
        build/us/lib/libmus/src/aud_sched.o(.sdata*);
        build/us/lib/libmus/src/aud_thread.o(.sdata*);
        build/us/lib/libmus/src/lib_memory.o(.sdata*);
        build/us/lib/libmus/src/aud_samples.o(.sdata*);
        build/us/asm/us/data/rsp/rspboot.o(.sdata*);
        build/us/asm/us/data/rsp/aspMain.o(.sdata*);
        build/us/asm/us/data/rsp/f3dex2.o(.sdata*);
        build/us/asm/us/data/rsp/s2dex.o(.sdata*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(.sdata*);
        main_segment_SDATA_END = .;
        main_segment_SDATA_SIZE = ABSOLUTE(main_segment_SDATA_END - main_segment_SDATA_START);
    }

    main_segment_alloc_VRAM_END = .;
    main_segment_alloc_VRAM_SIZE = ABSOLUTE(main_segment_alloc_VRAM_END - main_segment_alloc_VRAM);

    main_segment_noload_VRAM = .;

    .main_segment.noload (NOLOAD) :
    {
        FILL(0x00000000);
        main_segment_SBSS_START = .;
        build/us/src/main_segment/main.o(.sbss*);
        build/us/src/main_segment/nnsched.o(.sbss*);
        build/us/src/main_segment/joy.o(.sbss*);
        build/us/src/main_segment/audio/sound.o(.sbss*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(.sbss*);
        build/us/src/main_segment/graphic.o(.sbss*);
        build/us/src/main_segment/graphics/static.o(.sbss*);
        build/us/src/main_segment/graphics/graphic_dlists.o(.sbss*);
        build/us/src/main_segment/audio/music_driver.o(.sbss*);
        build/us/src/main_segment/main1x.o(.sbss*);
        build/us/src/main_segment/vr_init.o(.sbss*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(.sbss*);
        build/us/src/main_segment/aiset.o(.sbss*);
        build/us/asm/us/data/main_segment/aiset.data.o(.sbss*);
        build/us/asm/us/data/main_segment/aiset.bss.o(.sbss*);
        build/us/src/main_segment/record.o(.sbss*);
        build/us/asm/us/data/main_segment/record.bss.o(.sbss*);
        build/us/src/main_segment/unused/020D10.o(.sbss*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(.sbss*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(.sbss*);
        build/us/src/main_segment/game_etc.o(.sbss*);
        build/us/asm/us/data/main_segment/game_etc.data.o(.sbss*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(.sbss*);
        build/us/src/main_segment/screen_print/printer.o(.sbss*);
        build/us/src/main_segment/screen_print/printf_impl.o(.sbss*);
        build/us/asm/us/data/main_segment/0750C0.data.o(.sbss*);
        build/us/src/main_segment/screen_print/debug_print.o(.sbss*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(.sbss*);
        build/us/src/main_segment/debug_menu.o(.sbss*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(.sbss*);
        build/us/src/main_segment/028820.o(.sbss*);
        build/us/src/main_segment/tex_func.o(.sbss*);
        build/us/src/main_segment/main_menu.o(.sbss*);
        build/us/src/main_segment/font.o(.sbss*);
        build/us/src/main_segment/msgwnd.o(.sbss*);
        build/us/src/main_segment/char_anime.o(.sbss*);
        build/us/src/main_segment/dm_virus_init.o(.sbss*);
        build/us/src/main_segment/dm_game_main.o(.sbss*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(.sbss*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(.sbss*);
        build/us/src/main_segment/dm_manual_main.o(.sbss*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(.sbss*);
        build/us/src/main_segment/dm_title_main.o(.sbss*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(.sbss*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(.sbss*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(.sbss*);
        build/us/src/main_segment/main_story.o(.sbss*);
        build/us/asm/us/data/main_segment/main_story.data.o(.sbss*);
        build/us/asm/us/data/main_segment/main_story.bss.o(.sbss*);
        build/us/src/main_segment/lws.o(.sbss*);
        build/us/asm/us/data/main_segment/lws.bss.o(.sbss*);
        build/us/src/main_segment/calc.o(.sbss*);
        build/us/src/main_segment/unused/065080.o(.sbss*);
        build/us/src/main_segment/unused/066080.o(.sbss*);
        build/us/src/main_segment/replay.o(.sbss*);
        build/us/asm/us/data/main_segment/replay.bss.o(.sbss*);
        build/us/src/main_segment/066580.o(.sbss*);
        build/us/src/main_segment/066840.o(.sbss*);
        build/us/src/main_segment/unused/055C40.o(.sbss*);
        build/us/lib/libmus/src/player.o(.sbss*);
        build/us/lib/libmus/src/player_fx.o(.sbss*);
        build/us/lib/libmus/src/aud_dma.o(.sbss*);
        build/us/lib/libmus/src/aud_sched.o(.sbss*);
        build/us/lib/libmus/src/aud_thread.o(.sbss*);
        build/us/lib/libmus/src/lib_memory.o(.sbss*);
        build/us/lib/libmus/src/aud_samples.o(.sbss*);
        build/us/asm/us/data/rsp/rspboot.o(.sbss*);
        build/us/asm/us/data/rsp/aspMain.o(.sbss*);
        build/us/asm/us/data/rsp/f3dex2.o(.sbss*);
        build/us/asm/us/data/rsp/s2dex.o(.sbss*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(.sbss*);
        main_segment_SBSS_END = .;
        main_segment_SBSS_SIZE = ABSOLUTE(main_segment_SBSS_END - main_segment_SBSS_START);

        main_segment_SCOMMON_START = .;
        build/us/src/main_segment/main.o(.scommon*);
        build/us/src/main_segment/nnsched.o(.scommon*);
        build/us/src/main_segment/joy.o(.scommon*);
        build/us/src/main_segment/audio/sound.o(.scommon*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(.scommon*);
        build/us/src/main_segment/graphic.o(.scommon*);
        build/us/src/main_segment/graphics/static.o(.scommon*);
        build/us/src/main_segment/graphics/graphic_dlists.o(.scommon*);
        build/us/src/main_segment/audio/music_driver.o(.scommon*);
        build/us/src/main_segment/main1x.o(.scommon*);
        build/us/src/main_segment/vr_init.o(.scommon*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(.scommon*);
        build/us/src/main_segment/aiset.o(.scommon*);
        build/us/asm/us/data/main_segment/aiset.data.o(.scommon*);
        build/us/asm/us/data/main_segment/aiset.bss.o(.scommon*);
        build/us/src/main_segment/record.o(.scommon*);
        build/us/asm/us/data/main_segment/record.bss.o(.scommon*);
        build/us/src/main_segment/unused/020D10.o(.scommon*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(.scommon*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(.scommon*);
        build/us/src/main_segment/game_etc.o(.scommon*);
        build/us/asm/us/data/main_segment/game_etc.data.o(.scommon*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(.scommon*);
        build/us/src/main_segment/screen_print/printer.o(.scommon*);
        build/us/src/main_segment/screen_print/printf_impl.o(.scommon*);
        build/us/asm/us/data/main_segment/0750C0.data.o(.scommon*);
        build/us/src/main_segment/screen_print/debug_print.o(.scommon*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(.scommon*);
        build/us/src/main_segment/debug_menu.o(.scommon*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(.scommon*);
        build/us/src/main_segment/028820.o(.scommon*);
        build/us/src/main_segment/tex_func.o(.scommon*);
        build/us/src/main_segment/main_menu.o(.scommon*);
        build/us/src/main_segment/font.o(.scommon*);
        build/us/src/main_segment/msgwnd.o(.scommon*);
        build/us/src/main_segment/char_anime.o(.scommon*);
        build/us/src/main_segment/dm_virus_init.o(.scommon*);
        build/us/src/main_segment/dm_game_main.o(.scommon*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(.scommon*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(.scommon*);
        build/us/src/main_segment/dm_manual_main.o(.scommon*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(.scommon*);
        build/us/src/main_segment/dm_title_main.o(.scommon*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(.scommon*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(.scommon*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(.scommon*);
        build/us/src/main_segment/main_story.o(.scommon*);
        build/us/asm/us/data/main_segment/main_story.data.o(.scommon*);
        build/us/asm/us/data/main_segment/main_story.bss.o(.scommon*);
        build/us/src/main_segment/lws.o(.scommon*);
        build/us/asm/us/data/main_segment/lws.bss.o(.scommon*);
        build/us/src/main_segment/calc.o(.scommon*);
        build/us/src/main_segment/unused/065080.o(.scommon*);
        build/us/src/main_segment/unused/066080.o(.scommon*);
        build/us/src/main_segment/replay.o(.scommon*);
        build/us/asm/us/data/main_segment/replay.bss.o(.scommon*);
        build/us/src/main_segment/066580.o(.scommon*);
        build/us/src/main_segment/066840.o(.scommon*);
        build/us/src/main_segment/unused/055C40.o(.scommon*);
        build/us/lib/libmus/src/player.o(.scommon*);
        build/us/lib/libmus/src/player_fx.o(.scommon*);
        build/us/lib/libmus/src/aud_dma.o(.scommon*);
        build/us/lib/libmus/src/aud_sched.o(.scommon*);
        build/us/lib/libmus/src/aud_thread.o(.scommon*);
        build/us/lib/libmus/src/lib_memory.o(.scommon*);
        build/us/lib/libmus/src/aud_samples.o(.scommon*);
        build/us/asm/us/data/rsp/rspboot.o(.scommon*);
        build/us/asm/us/data/rsp/aspMain.o(.scommon*);
        build/us/asm/us/data/rsp/f3dex2.o(.scommon*);
        build/us/asm/us/data/rsp/s2dex.o(.scommon*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(.scommon*);
        main_segment_SCOMMON_END = .;
        main_segment_SCOMMON_SIZE = ABSOLUTE(main_segment_SCOMMON_END - main_segment_SCOMMON_START);

        main_segment_BSS_START = .;
        build/us/src/main_segment/main.o(.bss*);
        build/us/src/main_segment/nnsched.o(.bss*);
        build/us/src/main_segment/joy.o(.bss*);
        build/us/src/main_segment/audio/sound.o(.bss*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(.bss*);
        build/us/src/main_segment/graphic.o(.bss*);
        build/us/src/main_segment/graphics/static.o(.bss*);
        build/us/src/main_segment/graphics/graphic_dlists.o(.bss*);
        build/us/src/main_segment/audio/music_driver.o(.bss*);
        build/us/src/main_segment/main1x.o(.bss*);
        build/us/src/main_segment/vr_init.o(.bss*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(.bss*);
        build/us/src/main_segment/aiset.o(.bss*);
        build/us/asm/us/data/main_segment/aiset.data.o(.bss*);
        build/us/asm/us/data/main_segment/aiset.bss.o(.bss*);
        build/us/src/main_segment/record.o(.bss*);
        build/us/asm/us/data/main_segment/record.bss.o(.bss*);
        build/us/src/main_segment/unused/020D10.o(.bss*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(.bss*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(.bss*);
        build/us/src/main_segment/game_etc.o(.bss*);
        build/us/asm/us/data/main_segment/game_etc.data.o(.bss*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(.bss*);
        build/us/src/main_segment/screen_print/printer.o(.bss*);
        build/us/src/main_segment/screen_print/printf_impl.o(.bss*);
        build/us/asm/us/data/main_segment/0750C0.data.o(.bss*);
        build/us/src/main_segment/screen_print/debug_print.o(.bss*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(.bss*);
        build/us/src/main_segment/debug_menu.o(.bss*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(.bss*);
        build/us/src/main_segment/028820.o(.bss*);
        build/us/src/main_segment/tex_func.o(.bss*);
        build/us/src/main_segment/main_menu.o(.bss*);
        build/us/src/main_segment/font.o(.bss*);
        build/us/src/main_segment/msgwnd.o(.bss*);
        build/us/src/main_segment/char_anime.o(.bss*);
        build/us/src/main_segment/dm_virus_init.o(.bss*);
        build/us/src/main_segment/dm_game_main.o(.bss*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(.bss*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(.bss*);
        build/us/src/main_segment/dm_manual_main.o(.bss*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(.bss*);
        build/us/src/main_segment/dm_title_main.o(.bss*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(.bss*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(.bss*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(.bss*);
        build/us/src/main_segment/main_story.o(.bss*);
        build/us/asm/us/data/main_segment/main_story.data.o(.bss*);
        build/us/asm/us/data/main_segment/main_story.bss.o(.bss*);
        build/us/src/main_segment/lws.o(.bss*);
        build/us/asm/us/data/main_segment/lws.bss.o(.bss*);
        build/us/src/main_segment/calc.o(.bss*);
        build/us/src/main_segment/unused/065080.o(.bss*);
        build/us/src/main_segment/unused/066080.o(.bss*);
        build/us/src/main_segment/replay.o(.bss*);
        build/us/asm/us/data/main_segment/replay.bss.o(.bss*);
        build/us/src/main_segment/066580.o(.bss*);
        build/us/src/main_segment/066840.o(.bss*);
        build/us/src/main_segment/unused/055C40.o(.bss*);
        build/us/lib/libmus/src/player.o(.bss*);
        build/us/lib/libmus/src/player_fx.o(.bss*);
        build/us/lib/libmus/src/aud_dma.o(.bss*);
        build/us/lib/libmus/src/aud_sched.o(.bss*);
        build/us/lib/libmus/src/aud_thread.o(.bss*);
        build/us/lib/libmus/src/lib_memory.o(.bss*);
        build/us/lib/libmus/src/aud_samples.o(.bss*);
        build/us/asm/us/data/rsp/rspboot.o(.bss*);
        build/us/asm/us/data/rsp/aspMain.o(.bss*);
        build/us/asm/us/data/rsp/f3dex2.o(.bss*);
        build/us/asm/us/data/rsp/s2dex.o(.bss*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(.bss*);
        main_segment_BSS_END = .;
        main_segment_BSS_SIZE = ABSOLUTE(main_segment_BSS_END - main_segment_BSS_START);

        main_segmentCOMMON_START = .;
        build/us/src/main_segment/main.o(COMMON*);
        build/us/src/main_segment/nnsched.o(COMMON*);
        build/us/src/main_segment/joy.o(COMMON*);
        build/us/src/main_segment/audio/sound.o(COMMON*);
        build/us/asm/us/data/main_segment/audio/sound.bss.o(COMMON*);
        build/us/src/main_segment/graphic.o(COMMON*);
        build/us/src/main_segment/graphics/static.o(COMMON*);
        build/us/src/main_segment/graphics/graphic_dlists.o(COMMON*);
        build/us/src/main_segment/audio/music_driver.o(COMMON*);
        build/us/src/main_segment/main1x.o(COMMON*);
        build/us/src/main_segment/vr_init.o(COMMON*);
        build/us/asm/us/data/main_segment/vr_init.bss.o(COMMON*);
        build/us/src/main_segment/aiset.o(COMMON*);
        build/us/asm/us/data/main_segment/aiset.data.o(COMMON*);
        build/us/asm/us/data/main_segment/aiset.bss.o(COMMON*);
        build/us/src/main_segment/record.o(COMMON*);
        build/us/asm/us/data/main_segment/record.bss.o(COMMON*);
        build/us/src/main_segment/unused/020D10.o(COMMON*);
        build/us/asm/us/data/main_segment/unused/020D10.data.o(COMMON*);
        build/us/asm/us/data/main_segment/unused/020D10.bss.o(COMMON*);
        build/us/src/main_segment/game_etc.o(COMMON*);
        build/us/asm/us/data/main_segment/game_etc.data.o(COMMON*);
        build/us/asm/us/data/main_segment/game_etc.bss.o(COMMON*);
        build/us/src/main_segment/screen_print/printer.o(COMMON*);
        build/us/src/main_segment/screen_print/printf_impl.o(COMMON*);
        build/us/asm/us/data/main_segment/0750C0.data.o(COMMON*);
        build/us/src/main_segment/screen_print/debug_print.o(COMMON*);
        build/us/asm/us/data/main_segment/screen_print/debug_print.bss.o(COMMON*);
        build/us/src/main_segment/debug_menu.o(COMMON*);
        build/us/asm/us/data/main_segment/debug_menu.bss.o(COMMON*);
        build/us/src/main_segment/028820.o(COMMON*);
        build/us/src/main_segment/tex_func.o(COMMON*);
        build/us/src/main_segment/main_menu.o(COMMON*);
        build/us/src/main_segment/font.o(COMMON*);
        build/us/src/main_segment/msgwnd.o(COMMON*);
        build/us/src/main_segment/char_anime.o(COMMON*);
        build/us/src/main_segment/dm_virus_init.o(COMMON*);
        build/us/src/main_segment/dm_game_main.o(COMMON*);
        build/us/asm/us/data/main_segment/dm_game_main.data.o(COMMON*);
        build/us/asm/us/data/main_segment/dm_game_main.bss.o(COMMON*);
        build/us/src/main_segment/dm_manual_main.o(COMMON*);
        build/us/asm/us/data/main_segment/dm_manual_main.bss.o(COMMON*);
        build/us/src/main_segment/dm_title_main.o(COMMON*);
        build/us/asm/us/data/main_segment/dm_title_main.data.o(COMMON*);
        build/us/asm/us/data/main_segment/dm_title_main.bss.o(COMMON*);
        build/us/asm/us/data/main_segment/08F1C0.data.o(COMMON*);
        build/us/src/main_segment/main_story.o(COMMON*);
        build/us/asm/us/data/main_segment/main_story.data.o(COMMON*);
        build/us/asm/us/data/main_segment/main_story.bss.o(COMMON*);
        build/us/src/main_segment/lws.o(COMMON*);
        build/us/asm/us/data/main_segment/lws.bss.o(COMMON*);
        build/us/src/main_segment/calc.o(COMMON*);
        build/us/src/main_segment/unused/065080.o(COMMON*);
        build/us/src/main_segment/unused/066080.o(COMMON*);
        build/us/src/main_segment/replay.o(COMMON*);
        build/us/asm/us/data/main_segment/replay.bss.o(COMMON*);
        build/us/src/main_segment/066580.o(COMMON*);
        build/us/src/main_segment/066840.o(COMMON*);
        build/us/src/main_segment/unused/055C40.o(COMMON*);
        build/us/lib/libmus/src/player.o(COMMON*);
        build/us/lib/libmus/src/player_fx.o(COMMON*);
        build/us/lib/libmus/src/aud_dma.o(COMMON*);
        build/us/lib/libmus/src/aud_sched.o(COMMON*);
        build/us/lib/libmus/src/aud_thread.o(COMMON*);
        build/us/lib/libmus/src/lib_memory.o(COMMON*);
        build/us/lib/libmus/src/aud_samples.o(COMMON*);
        build/us/asm/us/data/rsp/rspboot.o(COMMON*);
        build/us/asm/us/data/rsp/aspMain.o(COMMON*);
        build/us/asm/us/data/rsp/f3dex2.o(COMMON*);
        build/us/asm/us/data/rsp/s2dex.o(COMMON*);
        build/us/asm/us/data/main_segment/800E9BB0.bss.o(COMMON*);
        main_segmentCOMMON_END = .;
        main_segmentCOMMON_SIZE = ABSOLUTE(main_segmentCOMMON_END - main_segmentCOMMON_START);
    }

    main_segment_noload_VRAM_END = .;
    main_segment_noload_VRAM_SIZE = ABSOLUTE(main_segment_noload_VRAM_END - main_segment_noload_VRAM);

    __romPos += SIZEOF(.main_segment);
    main_segment_VRAM_END = .;
    main_segment_VRAM_SIZE = ABSOLUTE(main_segment_VRAM_END - main_segment_VRAM);
    main_segment_ROM_END = __romPos;
    main_segment_ROM_SIZE = ABSOLUTE(main_segment_ROM_END - main_segment_ROM_START);

    buffer1_ROM_START = __romPos;
    buffer1_VRAM = ADDR(.buffer1);
    buffer1_alloc_VRAM = .;

    .buffer1 : AT(buffer1_ROM_START)
    {
        FILL(0x00000000);
        buffer1_TEXT_START = .;
        build/us/src/buffers/buffer1.o(.text*);
        buffer1_TEXT_END = .;
        buffer1_TEXT_SIZE = ABSOLUTE(buffer1_TEXT_END - buffer1_TEXT_START);

        buffer1_DATA_START = .;
        build/us/src/buffers/buffer1.o(.data*);
        buffer1_DATA_END = .;
        buffer1_DATA_SIZE = ABSOLUTE(buffer1_DATA_END - buffer1_DATA_START);

        buffer1_RODATA_START = .;
        build/us/src/buffers/buffer1.o(.rodata*);
        buffer1_RODATA_END = .;
        buffer1_RODATA_SIZE = ABSOLUTE(buffer1_RODATA_END - buffer1_RODATA_START);

        buffer1_SDATA_START = .;
        build/us/src/buffers/buffer1.o(.sdata*);
        buffer1_SDATA_END = .;
        buffer1_SDATA_SIZE = ABSOLUTE(buffer1_SDATA_END - buffer1_SDATA_START);
    }

    buffer1_alloc_VRAM_END = .;
    buffer1_alloc_VRAM_SIZE = ABSOLUTE(buffer1_alloc_VRAM_END - buffer1_alloc_VRAM);

    buffer1_noload_VRAM = .;

    .buffer1.noload (NOLOAD) :
    {
        FILL(0x00000000);
        buffer1_SBSS_START = .;
        build/us/src/buffers/buffer1.o(.sbss*);
        buffer1_SBSS_END = .;
        buffer1_SBSS_SIZE = ABSOLUTE(buffer1_SBSS_END - buffer1_SBSS_START);

        buffer1_SCOMMON_START = .;
        build/us/src/buffers/buffer1.o(.scommon*);
        buffer1_SCOMMON_END = .;
        buffer1_SCOMMON_SIZE = ABSOLUTE(buffer1_SCOMMON_END - buffer1_SCOMMON_START);

        buffer1_BSS_START = .;
        build/us/src/buffers/buffer1.o(.bss*);
        buffer1_BSS_END = .;
        buffer1_BSS_SIZE = ABSOLUTE(buffer1_BSS_END - buffer1_BSS_START);

        buffer1COMMON_START = .;
        build/us/src/buffers/buffer1.o(COMMON*);
        buffer1COMMON_END = .;
        buffer1COMMON_SIZE = ABSOLUTE(buffer1COMMON_END - buffer1COMMON_START);
    }

    buffer1_noload_VRAM_END = .;
    buffer1_noload_VRAM_SIZE = ABSOLUTE(buffer1_noload_VRAM_END - buffer1_noload_VRAM);

    __romPos += SIZEOF(.buffer1);
    buffer1_VRAM_END = .;
    buffer1_VRAM_SIZE = ABSOLUTE(buffer1_VRAM_END - buffer1_VRAM);
    buffer1_ROM_END = __romPos;
    buffer1_ROM_SIZE = ABSOLUTE(buffer1_ROM_END - buffer1_ROM_START);

    buffer2_ROM_START = __romPos;
    buffer2_VRAM = ADDR(.buffer2);
    buffer2_alloc_VRAM = .;

    .buffer2 0x80205000 : AT(buffer2_ROM_START)
    {
        FILL(0x00000000);
        buffer2_TEXT_START = .;
        build/us/src/buffers/buffer2.o(.text*);
        buffer2_TEXT_END = .;
        buffer2_TEXT_SIZE = ABSOLUTE(buffer2_TEXT_END - buffer2_TEXT_START);

        buffer2_DATA_START = .;
        build/us/src/buffers/buffer2.o(.data*);
        buffer2_DATA_END = .;
        buffer2_DATA_SIZE = ABSOLUTE(buffer2_DATA_END - buffer2_DATA_START);

        buffer2_RODATA_START = .;
        build/us/src/buffers/buffer2.o(.rodata*);
        buffer2_RODATA_END = .;
        buffer2_RODATA_SIZE = ABSOLUTE(buffer2_RODATA_END - buffer2_RODATA_START);

        buffer2_SDATA_START = .;
        build/us/src/buffers/buffer2.o(.sdata*);
        buffer2_SDATA_END = .;
        buffer2_SDATA_SIZE = ABSOLUTE(buffer2_SDATA_END - buffer2_SDATA_START);
    }

    buffer2_alloc_VRAM_END = .;
    buffer2_alloc_VRAM_SIZE = ABSOLUTE(buffer2_alloc_VRAM_END - buffer2_alloc_VRAM);

    buffer2_noload_VRAM = .;

    .buffer2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        buffer2_SBSS_START = .;
        build/us/src/buffers/buffer2.o(.sbss*);
        buffer2_SBSS_END = .;
        buffer2_SBSS_SIZE = ABSOLUTE(buffer2_SBSS_END - buffer2_SBSS_START);

        buffer2_SCOMMON_START = .;
        build/us/src/buffers/buffer2.o(.scommon*);
        buffer2_SCOMMON_END = .;
        buffer2_SCOMMON_SIZE = ABSOLUTE(buffer2_SCOMMON_END - buffer2_SCOMMON_START);

        buffer2_BSS_START = .;
        build/us/src/buffers/buffer2.o(.bss*);
        buffer2_BSS_END = .;
        buffer2_BSS_SIZE = ABSOLUTE(buffer2_BSS_END - buffer2_BSS_START);

        buffer2COMMON_START = .;
        build/us/src/buffers/buffer2.o(COMMON*);
        buffer2COMMON_END = .;
        buffer2COMMON_SIZE = ABSOLUTE(buffer2COMMON_END - buffer2COMMON_START);
    }

    buffer2_noload_VRAM_END = .;
    buffer2_noload_VRAM_SIZE = ABSOLUTE(buffer2_noload_VRAM_END - buffer2_noload_VRAM);

    __romPos += SIZEOF(.buffer2);
    buffer2_VRAM_END = .;
    buffer2_VRAM_SIZE = ABSOLUTE(buffer2_VRAM_END - buffer2_VRAM);
    buffer2_ROM_END = __romPos;
    buffer2_ROM_SIZE = ABSOLUTE(buffer2_ROM_END - buffer2_ROM_START);

    framebuffer_ROM_START = __romPos;
    framebuffer_VRAM = ADDR(.framebuffer);
    framebuffer_alloc_VRAM = .;

    .framebuffer 0x803B5000 : AT(framebuffer_ROM_START)
    {
        FILL(0x00000000);
        framebuffer_TEXT_START = .;
        build/us/src/buffers/framebuffer.o(.text*);
        framebuffer_TEXT_END = .;
        framebuffer_TEXT_SIZE = ABSOLUTE(framebuffer_TEXT_END - framebuffer_TEXT_START);

        framebuffer_DATA_START = .;
        build/us/src/buffers/framebuffer.o(.data*);
        framebuffer_DATA_END = .;
        framebuffer_DATA_SIZE = ABSOLUTE(framebuffer_DATA_END - framebuffer_DATA_START);

        framebuffer_RODATA_START = .;
        build/us/src/buffers/framebuffer.o(.rodata*);
        framebuffer_RODATA_END = .;
        framebuffer_RODATA_SIZE = ABSOLUTE(framebuffer_RODATA_END - framebuffer_RODATA_START);

        framebuffer_SDATA_START = .;
        build/us/src/buffers/framebuffer.o(.sdata*);
        framebuffer_SDATA_END = .;
        framebuffer_SDATA_SIZE = ABSOLUTE(framebuffer_SDATA_END - framebuffer_SDATA_START);
    }

    framebuffer_alloc_VRAM_END = .;
    framebuffer_alloc_VRAM_SIZE = ABSOLUTE(framebuffer_alloc_VRAM_END - framebuffer_alloc_VRAM);

    framebuffer_noload_VRAM = .;

    .framebuffer.noload (NOLOAD) :
    {
        FILL(0x00000000);
        framebuffer_SBSS_START = .;
        build/us/src/buffers/framebuffer.o(.sbss*);
        framebuffer_SBSS_END = .;
        framebuffer_SBSS_SIZE = ABSOLUTE(framebuffer_SBSS_END - framebuffer_SBSS_START);

        framebuffer_SCOMMON_START = .;
        build/us/src/buffers/framebuffer.o(.scommon*);
        framebuffer_SCOMMON_END = .;
        framebuffer_SCOMMON_SIZE = ABSOLUTE(framebuffer_SCOMMON_END - framebuffer_SCOMMON_START);

        framebuffer_BSS_START = .;
        build/us/src/buffers/framebuffer.o(.bss*);
        framebuffer_BSS_END = .;
        framebuffer_BSS_SIZE = ABSOLUTE(framebuffer_BSS_END - framebuffer_BSS_START);

        framebufferCOMMON_START = .;
        build/us/src/buffers/framebuffer.o(COMMON*);
        framebufferCOMMON_END = .;
        framebufferCOMMON_SIZE = ABSOLUTE(framebufferCOMMON_END - framebufferCOMMON_START);
    }

    framebuffer_noload_VRAM_END = .;
    framebuffer_noload_VRAM_SIZE = ABSOLUTE(framebuffer_noload_VRAM_END - framebuffer_noload_VRAM);

    __romPos += SIZEOF(.framebuffer);
    framebuffer_VRAM_END = .;
    framebuffer_VRAM_SIZE = ABSOLUTE(framebuffer_VRAM_END - framebuffer_VRAM);
    framebuffer_ROM_END = __romPos;
    framebuffer_ROM_SIZE = ABSOLUTE(framebuffer_ROM_END - framebuffer_ROM_START);

    n64_wave_tables_ROM_START = __romPos;
    n64_wave_tables_VRAM = ADDR(.n64_wave_tables);
    n64_wave_tables_alloc_VRAM = .;

    .n64_wave_tables : AT(n64_wave_tables_ROM_START)
    {
        FILL(0x00000000);
        n64_wave_tables_TEXT_START = .;
        build/us/asm/us/data/n64_wave_tables.o(.text*);
        n64_wave_tables_TEXT_END = .;
        n64_wave_tables_TEXT_SIZE = ABSOLUTE(n64_wave_tables_TEXT_END - n64_wave_tables_TEXT_START);

        n64_wave_tables_DATA_START = .;
        build/us/asm/us/data/n64_wave_tables.o(.data*);
        n64_wave_tables_DATA_END = .;
        n64_wave_tables_DATA_SIZE = ABSOLUTE(n64_wave_tables_DATA_END - n64_wave_tables_DATA_START);

        n64_wave_tables_RODATA_START = .;
        build/us/asm/us/data/n64_wave_tables.o(.rodata*);
        n64_wave_tables_RODATA_END = .;
        n64_wave_tables_RODATA_SIZE = ABSOLUTE(n64_wave_tables_RODATA_END - n64_wave_tables_RODATA_START);

        n64_wave_tables_SDATA_START = .;
        build/us/asm/us/data/n64_wave_tables.o(.sdata*);
        n64_wave_tables_SDATA_END = .;
        n64_wave_tables_SDATA_SIZE = ABSOLUTE(n64_wave_tables_SDATA_END - n64_wave_tables_SDATA_START);
    }

    n64_wave_tables_alloc_VRAM_END = .;
    n64_wave_tables_alloc_VRAM_SIZE = ABSOLUTE(n64_wave_tables_alloc_VRAM_END - n64_wave_tables_alloc_VRAM);

    n64_wave_tables_noload_VRAM = .;

    .n64_wave_tables.noload (NOLOAD) :
    {
        FILL(0x00000000);
        n64_wave_tables_SBSS_START = .;
        build/us/asm/us/data/n64_wave_tables.o(.sbss*);
        n64_wave_tables_SBSS_END = .;
        n64_wave_tables_SBSS_SIZE = ABSOLUTE(n64_wave_tables_SBSS_END - n64_wave_tables_SBSS_START);

        n64_wave_tables_SCOMMON_START = .;
        build/us/asm/us/data/n64_wave_tables.o(.scommon*);
        n64_wave_tables_SCOMMON_END = .;
        n64_wave_tables_SCOMMON_SIZE = ABSOLUTE(n64_wave_tables_SCOMMON_END - n64_wave_tables_SCOMMON_START);

        n64_wave_tables_BSS_START = .;
        build/us/asm/us/data/n64_wave_tables.o(.bss*);
        n64_wave_tables_BSS_END = .;
        n64_wave_tables_BSS_SIZE = ABSOLUTE(n64_wave_tables_BSS_END - n64_wave_tables_BSS_START);

        n64_wave_tablesCOMMON_START = .;
        build/us/asm/us/data/n64_wave_tables.o(COMMON*);
        n64_wave_tablesCOMMON_END = .;
        n64_wave_tablesCOMMON_SIZE = ABSOLUTE(n64_wave_tablesCOMMON_END - n64_wave_tablesCOMMON_START);
    }

    n64_wave_tables_noload_VRAM_END = .;
    n64_wave_tables_noload_VRAM_SIZE = ABSOLUTE(n64_wave_tables_noload_VRAM_END - n64_wave_tables_noload_VRAM);

    __romPos += SIZEOF(.n64_wave_tables);
    n64_wave_tables_VRAM_END = .;
    n64_wave_tables_VRAM_SIZE = ABSOLUTE(n64_wave_tables_VRAM_END - n64_wave_tables_VRAM);
    n64_wave_tables_ROM_END = __romPos;
    n64_wave_tables_ROM_SIZE = ABSOLUTE(n64_wave_tables_ROM_END - n64_wave_tables_ROM_START);

    n64_ptr_tables_v2_ROM_START = __romPos;
    n64_ptr_tables_v2_VRAM = ADDR(.n64_ptr_tables_v2);
    n64_ptr_tables_v2_alloc_VRAM = .;

    .n64_ptr_tables_v2 : AT(n64_ptr_tables_v2_ROM_START)
    {
        FILL(0x00000000);
        n64_ptr_tables_v2_TEXT_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(.text*);
        n64_ptr_tables_v2_TEXT_END = .;
        n64_ptr_tables_v2_TEXT_SIZE = ABSOLUTE(n64_ptr_tables_v2_TEXT_END - n64_ptr_tables_v2_TEXT_START);

        n64_ptr_tables_v2_DATA_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(.data*);
        n64_ptr_tables_v2_DATA_END = .;
        n64_ptr_tables_v2_DATA_SIZE = ABSOLUTE(n64_ptr_tables_v2_DATA_END - n64_ptr_tables_v2_DATA_START);

        n64_ptr_tables_v2_RODATA_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(.rodata*);
        n64_ptr_tables_v2_RODATA_END = .;
        n64_ptr_tables_v2_RODATA_SIZE = ABSOLUTE(n64_ptr_tables_v2_RODATA_END - n64_ptr_tables_v2_RODATA_START);

        n64_ptr_tables_v2_SDATA_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(.sdata*);
        n64_ptr_tables_v2_SDATA_END = .;
        n64_ptr_tables_v2_SDATA_SIZE = ABSOLUTE(n64_ptr_tables_v2_SDATA_END - n64_ptr_tables_v2_SDATA_START);
    }

    n64_ptr_tables_v2_alloc_VRAM_END = .;
    n64_ptr_tables_v2_alloc_VRAM_SIZE = ABSOLUTE(n64_ptr_tables_v2_alloc_VRAM_END - n64_ptr_tables_v2_alloc_VRAM);

    n64_ptr_tables_v2_noload_VRAM = .;

    .n64_ptr_tables_v2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        n64_ptr_tables_v2_SBSS_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(.sbss*);
        n64_ptr_tables_v2_SBSS_END = .;
        n64_ptr_tables_v2_SBSS_SIZE = ABSOLUTE(n64_ptr_tables_v2_SBSS_END - n64_ptr_tables_v2_SBSS_START);

        n64_ptr_tables_v2_SCOMMON_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(.scommon*);
        n64_ptr_tables_v2_SCOMMON_END = .;
        n64_ptr_tables_v2_SCOMMON_SIZE = ABSOLUTE(n64_ptr_tables_v2_SCOMMON_END - n64_ptr_tables_v2_SCOMMON_START);

        n64_ptr_tables_v2_BSS_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(.bss*);
        n64_ptr_tables_v2_BSS_END = .;
        n64_ptr_tables_v2_BSS_SIZE = ABSOLUTE(n64_ptr_tables_v2_BSS_END - n64_ptr_tables_v2_BSS_START);

        n64_ptr_tables_v2COMMON_START = .;
        build/us/asm/us/data/n64_ptr_tables_v2.o(COMMON*);
        n64_ptr_tables_v2COMMON_END = .;
        n64_ptr_tables_v2COMMON_SIZE = ABSOLUTE(n64_ptr_tables_v2COMMON_END - n64_ptr_tables_v2COMMON_START);
    }

    n64_ptr_tables_v2_noload_VRAM_END = .;
    n64_ptr_tables_v2_noload_VRAM_SIZE = ABSOLUTE(n64_ptr_tables_v2_noload_VRAM_END - n64_ptr_tables_v2_noload_VRAM);

    __romPos += SIZEOF(.n64_ptr_tables_v2);
    n64_ptr_tables_v2_VRAM_END = .;
    n64_ptr_tables_v2_VRAM_SIZE = ABSOLUTE(n64_ptr_tables_v2_VRAM_END - n64_ptr_tables_v2_VRAM);
    n64_ptr_tables_v2_ROM_END = __romPos;
    n64_ptr_tables_v2_ROM_SIZE = ABSOLUTE(n64_ptr_tables_v2_ROM_END - n64_ptr_tables_v2_ROM_START);

    segment_172130_ROM_START = __romPos;
    segment_172130_VRAM = ADDR(.segment_172130);
    segment_172130_alloc_VRAM = .;

    .segment_172130 : AT(segment_172130_ROM_START)
    {
        FILL(0x00000000);
        segment_172130_TEXT_START = .;
        build/us/asm/us/data/segment_172130.o(.text*);
        segment_172130_TEXT_END = .;
        segment_172130_TEXT_SIZE = ABSOLUTE(segment_172130_TEXT_END - segment_172130_TEXT_START);

        segment_172130_DATA_START = .;
        build/us/asm/us/data/segment_172130.o(.data*);
        segment_172130_DATA_END = .;
        segment_172130_DATA_SIZE = ABSOLUTE(segment_172130_DATA_END - segment_172130_DATA_START);

        segment_172130_RODATA_START = .;
        build/us/asm/us/data/segment_172130.o(.rodata*);
        segment_172130_RODATA_END = .;
        segment_172130_RODATA_SIZE = ABSOLUTE(segment_172130_RODATA_END - segment_172130_RODATA_START);

        segment_172130_SDATA_START = .;
        build/us/asm/us/data/segment_172130.o(.sdata*);
        segment_172130_SDATA_END = .;
        segment_172130_SDATA_SIZE = ABSOLUTE(segment_172130_SDATA_END - segment_172130_SDATA_START);
    }

    segment_172130_alloc_VRAM_END = .;
    segment_172130_alloc_VRAM_SIZE = ABSOLUTE(segment_172130_alloc_VRAM_END - segment_172130_alloc_VRAM);

    segment_172130_noload_VRAM = .;

    .segment_172130.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_172130_SBSS_START = .;
        build/us/asm/us/data/segment_172130.o(.sbss*);
        segment_172130_SBSS_END = .;
        segment_172130_SBSS_SIZE = ABSOLUTE(segment_172130_SBSS_END - segment_172130_SBSS_START);

        segment_172130_SCOMMON_START = .;
        build/us/asm/us/data/segment_172130.o(.scommon*);
        segment_172130_SCOMMON_END = .;
        segment_172130_SCOMMON_SIZE = ABSOLUTE(segment_172130_SCOMMON_END - segment_172130_SCOMMON_START);

        segment_172130_BSS_START = .;
        build/us/asm/us/data/segment_172130.o(.bss*);
        segment_172130_BSS_END = .;
        segment_172130_BSS_SIZE = ABSOLUTE(segment_172130_BSS_END - segment_172130_BSS_START);

        segment_172130COMMON_START = .;
        build/us/asm/us/data/segment_172130.o(COMMON*);
        segment_172130COMMON_END = .;
        segment_172130COMMON_SIZE = ABSOLUTE(segment_172130COMMON_END - segment_172130COMMON_START);
    }

    segment_172130_noload_VRAM_END = .;
    segment_172130_noload_VRAM_SIZE = ABSOLUTE(segment_172130_noload_VRAM_END - segment_172130_noload_VRAM);

    __romPos += SIZEOF(.segment_172130);
    segment_172130_VRAM_END = .;
    segment_172130_VRAM_SIZE = ABSOLUTE(segment_172130_VRAM_END - segment_172130_VRAM);
    segment_172130_ROM_END = __romPos;
    segment_172130_ROM_SIZE = ABSOLUTE(segment_172130_ROM_END - segment_172130_ROM_START);

    segment_172D60_ROM_START = __romPos;
    segment_172D60_VRAM = ADDR(.segment_172D60);
    segment_172D60_alloc_VRAM = .;

    .segment_172D60 : AT(segment_172D60_ROM_START)
    {
        FILL(0x00000000);
        segment_172D60_TEXT_START = .;
        build/us/asm/us/data/segment_172D60.o(.text*);
        segment_172D60_TEXT_END = .;
        segment_172D60_TEXT_SIZE = ABSOLUTE(segment_172D60_TEXT_END - segment_172D60_TEXT_START);

        segment_172D60_DATA_START = .;
        build/us/asm/us/data/segment_172D60.o(.data*);
        segment_172D60_DATA_END = .;
        segment_172D60_DATA_SIZE = ABSOLUTE(segment_172D60_DATA_END - segment_172D60_DATA_START);

        segment_172D60_RODATA_START = .;
        build/us/asm/us/data/segment_172D60.o(.rodata*);
        segment_172D60_RODATA_END = .;
        segment_172D60_RODATA_SIZE = ABSOLUTE(segment_172D60_RODATA_END - segment_172D60_RODATA_START);

        segment_172D60_SDATA_START = .;
        build/us/asm/us/data/segment_172D60.o(.sdata*);
        segment_172D60_SDATA_END = .;
        segment_172D60_SDATA_SIZE = ABSOLUTE(segment_172D60_SDATA_END - segment_172D60_SDATA_START);
    }

    segment_172D60_alloc_VRAM_END = .;
    segment_172D60_alloc_VRAM_SIZE = ABSOLUTE(segment_172D60_alloc_VRAM_END - segment_172D60_alloc_VRAM);

    segment_172D60_noload_VRAM = .;

    .segment_172D60.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_172D60_SBSS_START = .;
        build/us/asm/us/data/segment_172D60.o(.sbss*);
        segment_172D60_SBSS_END = .;
        segment_172D60_SBSS_SIZE = ABSOLUTE(segment_172D60_SBSS_END - segment_172D60_SBSS_START);

        segment_172D60_SCOMMON_START = .;
        build/us/asm/us/data/segment_172D60.o(.scommon*);
        segment_172D60_SCOMMON_END = .;
        segment_172D60_SCOMMON_SIZE = ABSOLUTE(segment_172D60_SCOMMON_END - segment_172D60_SCOMMON_START);

        segment_172D60_BSS_START = .;
        build/us/asm/us/data/segment_172D60.o(.bss*);
        segment_172D60_BSS_END = .;
        segment_172D60_BSS_SIZE = ABSOLUTE(segment_172D60_BSS_END - segment_172D60_BSS_START);

        segment_172D60COMMON_START = .;
        build/us/asm/us/data/segment_172D60.o(COMMON*);
        segment_172D60COMMON_END = .;
        segment_172D60COMMON_SIZE = ABSOLUTE(segment_172D60COMMON_END - segment_172D60COMMON_START);
    }

    segment_172D60_noload_VRAM_END = .;
    segment_172D60_noload_VRAM_SIZE = ABSOLUTE(segment_172D60_noload_VRAM_END - segment_172D60_noload_VRAM);

    __romPos += SIZEOF(.segment_172D60);
    segment_172D60_VRAM_END = .;
    segment_172D60_VRAM_SIZE = ABSOLUTE(segment_172D60_VRAM_END - segment_172D60_VRAM);
    segment_172D60_ROM_END = __romPos;
    segment_172D60_ROM_SIZE = ABSOLUTE(segment_172D60_ROM_END - segment_172D60_ROM_START);

    segment_1750C0_ROM_START = __romPos;
    segment_1750C0_VRAM = ADDR(.segment_1750C0);
    segment_1750C0_alloc_VRAM = .;

    .segment_1750C0 : AT(segment_1750C0_ROM_START)
    {
        FILL(0x00000000);
        segment_1750C0_TEXT_START = .;
        build/us/asm/us/data/segment_1750C0.o(.text*);
        segment_1750C0_TEXT_END = .;
        segment_1750C0_TEXT_SIZE = ABSOLUTE(segment_1750C0_TEXT_END - segment_1750C0_TEXT_START);

        segment_1750C0_DATA_START = .;
        build/us/asm/us/data/segment_1750C0.o(.data*);
        segment_1750C0_DATA_END = .;
        segment_1750C0_DATA_SIZE = ABSOLUTE(segment_1750C0_DATA_END - segment_1750C0_DATA_START);

        segment_1750C0_RODATA_START = .;
        build/us/asm/us/data/segment_1750C0.o(.rodata*);
        segment_1750C0_RODATA_END = .;
        segment_1750C0_RODATA_SIZE = ABSOLUTE(segment_1750C0_RODATA_END - segment_1750C0_RODATA_START);

        segment_1750C0_SDATA_START = .;
        build/us/asm/us/data/segment_1750C0.o(.sdata*);
        segment_1750C0_SDATA_END = .;
        segment_1750C0_SDATA_SIZE = ABSOLUTE(segment_1750C0_SDATA_END - segment_1750C0_SDATA_START);
    }

    segment_1750C0_alloc_VRAM_END = .;
    segment_1750C0_alloc_VRAM_SIZE = ABSOLUTE(segment_1750C0_alloc_VRAM_END - segment_1750C0_alloc_VRAM);

    segment_1750C0_noload_VRAM = .;

    .segment_1750C0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_1750C0_SBSS_START = .;
        build/us/asm/us/data/segment_1750C0.o(.sbss*);
        segment_1750C0_SBSS_END = .;
        segment_1750C0_SBSS_SIZE = ABSOLUTE(segment_1750C0_SBSS_END - segment_1750C0_SBSS_START);

        segment_1750C0_SCOMMON_START = .;
        build/us/asm/us/data/segment_1750C0.o(.scommon*);
        segment_1750C0_SCOMMON_END = .;
        segment_1750C0_SCOMMON_SIZE = ABSOLUTE(segment_1750C0_SCOMMON_END - segment_1750C0_SCOMMON_START);

        segment_1750C0_BSS_START = .;
        build/us/asm/us/data/segment_1750C0.o(.bss*);
        segment_1750C0_BSS_END = .;
        segment_1750C0_BSS_SIZE = ABSOLUTE(segment_1750C0_BSS_END - segment_1750C0_BSS_START);

        segment_1750C0COMMON_START = .;
        build/us/asm/us/data/segment_1750C0.o(COMMON*);
        segment_1750C0COMMON_END = .;
        segment_1750C0COMMON_SIZE = ABSOLUTE(segment_1750C0COMMON_END - segment_1750C0COMMON_START);
    }

    segment_1750C0_noload_VRAM_END = .;
    segment_1750C0_noload_VRAM_SIZE = ABSOLUTE(segment_1750C0_noload_VRAM_END - segment_1750C0_noload_VRAM);

    __romPos += SIZEOF(.segment_1750C0);
    segment_1750C0_VRAM_END = .;
    segment_1750C0_VRAM_SIZE = ABSOLUTE(segment_1750C0_VRAM_END - segment_1750C0_VRAM);
    segment_1750C0_ROM_END = __romPos;
    segment_1750C0_ROM_SIZE = ABSOLUTE(segment_1750C0_ROM_END - segment_1750C0_ROM_START);

    segment_177420_ROM_START = __romPos;
    segment_177420_VRAM = ADDR(.segment_177420);
    segment_177420_alloc_VRAM = .;

    .segment_177420 : AT(segment_177420_ROM_START)
    {
        FILL(0x00000000);
        segment_177420_TEXT_START = .;
        build/us/asm/us/data/segment_177420.o(.text*);
        segment_177420_TEXT_END = .;
        segment_177420_TEXT_SIZE = ABSOLUTE(segment_177420_TEXT_END - segment_177420_TEXT_START);

        segment_177420_DATA_START = .;
        build/us/asm/us/data/segment_177420.o(.data*);
        segment_177420_DATA_END = .;
        segment_177420_DATA_SIZE = ABSOLUTE(segment_177420_DATA_END - segment_177420_DATA_START);

        segment_177420_RODATA_START = .;
        build/us/asm/us/data/segment_177420.o(.rodata*);
        segment_177420_RODATA_END = .;
        segment_177420_RODATA_SIZE = ABSOLUTE(segment_177420_RODATA_END - segment_177420_RODATA_START);

        segment_177420_SDATA_START = .;
        build/us/asm/us/data/segment_177420.o(.sdata*);
        segment_177420_SDATA_END = .;
        segment_177420_SDATA_SIZE = ABSOLUTE(segment_177420_SDATA_END - segment_177420_SDATA_START);
    }

    segment_177420_alloc_VRAM_END = .;
    segment_177420_alloc_VRAM_SIZE = ABSOLUTE(segment_177420_alloc_VRAM_END - segment_177420_alloc_VRAM);

    segment_177420_noload_VRAM = .;

    .segment_177420.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_177420_SBSS_START = .;
        build/us/asm/us/data/segment_177420.o(.sbss*);
        segment_177420_SBSS_END = .;
        segment_177420_SBSS_SIZE = ABSOLUTE(segment_177420_SBSS_END - segment_177420_SBSS_START);

        segment_177420_SCOMMON_START = .;
        build/us/asm/us/data/segment_177420.o(.scommon*);
        segment_177420_SCOMMON_END = .;
        segment_177420_SCOMMON_SIZE = ABSOLUTE(segment_177420_SCOMMON_END - segment_177420_SCOMMON_START);

        segment_177420_BSS_START = .;
        build/us/asm/us/data/segment_177420.o(.bss*);
        segment_177420_BSS_END = .;
        segment_177420_BSS_SIZE = ABSOLUTE(segment_177420_BSS_END - segment_177420_BSS_START);

        segment_177420COMMON_START = .;
        build/us/asm/us/data/segment_177420.o(COMMON*);
        segment_177420COMMON_END = .;
        segment_177420COMMON_SIZE = ABSOLUTE(segment_177420COMMON_END - segment_177420COMMON_START);
    }

    segment_177420_noload_VRAM_END = .;
    segment_177420_noload_VRAM_SIZE = ABSOLUTE(segment_177420_noload_VRAM_END - segment_177420_noload_VRAM);

    __romPos += SIZEOF(.segment_177420);
    segment_177420_VRAM_END = .;
    segment_177420_VRAM_SIZE = ABSOLUTE(segment_177420_VRAM_END - segment_177420_VRAM);
    segment_177420_ROM_END = __romPos;
    segment_177420_ROM_SIZE = ABSOLUTE(segment_177420_ROM_END - segment_177420_ROM_START);

    segment_179620_ROM_START = __romPos;
    segment_179620_VRAM = ADDR(.segment_179620);
    segment_179620_alloc_VRAM = .;

    .segment_179620 : AT(segment_179620_ROM_START)
    {
        FILL(0x00000000);
        segment_179620_TEXT_START = .;
        build/us/asm/us/data/segment_179620.o(.text*);
        segment_179620_TEXT_END = .;
        segment_179620_TEXT_SIZE = ABSOLUTE(segment_179620_TEXT_END - segment_179620_TEXT_START);

        segment_179620_DATA_START = .;
        build/us/asm/us/data/segment_179620.o(.data*);
        segment_179620_DATA_END = .;
        segment_179620_DATA_SIZE = ABSOLUTE(segment_179620_DATA_END - segment_179620_DATA_START);

        segment_179620_RODATA_START = .;
        build/us/asm/us/data/segment_179620.o(.rodata*);
        segment_179620_RODATA_END = .;
        segment_179620_RODATA_SIZE = ABSOLUTE(segment_179620_RODATA_END - segment_179620_RODATA_START);

        segment_179620_SDATA_START = .;
        build/us/asm/us/data/segment_179620.o(.sdata*);
        segment_179620_SDATA_END = .;
        segment_179620_SDATA_SIZE = ABSOLUTE(segment_179620_SDATA_END - segment_179620_SDATA_START);
    }

    segment_179620_alloc_VRAM_END = .;
    segment_179620_alloc_VRAM_SIZE = ABSOLUTE(segment_179620_alloc_VRAM_END - segment_179620_alloc_VRAM);

    segment_179620_noload_VRAM = .;

    .segment_179620.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_179620_SBSS_START = .;
        build/us/asm/us/data/segment_179620.o(.sbss*);
        segment_179620_SBSS_END = .;
        segment_179620_SBSS_SIZE = ABSOLUTE(segment_179620_SBSS_END - segment_179620_SBSS_START);

        segment_179620_SCOMMON_START = .;
        build/us/asm/us/data/segment_179620.o(.scommon*);
        segment_179620_SCOMMON_END = .;
        segment_179620_SCOMMON_SIZE = ABSOLUTE(segment_179620_SCOMMON_END - segment_179620_SCOMMON_START);

        segment_179620_BSS_START = .;
        build/us/asm/us/data/segment_179620.o(.bss*);
        segment_179620_BSS_END = .;
        segment_179620_BSS_SIZE = ABSOLUTE(segment_179620_BSS_END - segment_179620_BSS_START);

        segment_179620COMMON_START = .;
        build/us/asm/us/data/segment_179620.o(COMMON*);
        segment_179620COMMON_END = .;
        segment_179620COMMON_SIZE = ABSOLUTE(segment_179620COMMON_END - segment_179620COMMON_START);
    }

    segment_179620_noload_VRAM_END = .;
    segment_179620_noload_VRAM_SIZE = ABSOLUTE(segment_179620_noload_VRAM_END - segment_179620_noload_VRAM);

    __romPos += SIZEOF(.segment_179620);
    segment_179620_VRAM_END = .;
    segment_179620_VRAM_SIZE = ABSOLUTE(segment_179620_VRAM_END - segment_179620_VRAM);
    segment_179620_ROM_END = __romPos;
    segment_179620_ROM_SIZE = ABSOLUTE(segment_179620_ROM_END - segment_179620_ROM_START);

    segment_17B790_ROM_START = __romPos;
    segment_17B790_VRAM = ADDR(.segment_17B790);
    segment_17B790_alloc_VRAM = .;

    .segment_17B790 : AT(segment_17B790_ROM_START)
    {
        FILL(0x00000000);
        segment_17B790_TEXT_START = .;
        build/us/asm/us/data/segment_17B790.o(.text*);
        segment_17B790_TEXT_END = .;
        segment_17B790_TEXT_SIZE = ABSOLUTE(segment_17B790_TEXT_END - segment_17B790_TEXT_START);

        segment_17B790_DATA_START = .;
        build/us/asm/us/data/segment_17B790.o(.data*);
        segment_17B790_DATA_END = .;
        segment_17B790_DATA_SIZE = ABSOLUTE(segment_17B790_DATA_END - segment_17B790_DATA_START);

        segment_17B790_RODATA_START = .;
        build/us/asm/us/data/segment_17B790.o(.rodata*);
        segment_17B790_RODATA_END = .;
        segment_17B790_RODATA_SIZE = ABSOLUTE(segment_17B790_RODATA_END - segment_17B790_RODATA_START);

        segment_17B790_SDATA_START = .;
        build/us/asm/us/data/segment_17B790.o(.sdata*);
        segment_17B790_SDATA_END = .;
        segment_17B790_SDATA_SIZE = ABSOLUTE(segment_17B790_SDATA_END - segment_17B790_SDATA_START);
    }

    segment_17B790_alloc_VRAM_END = .;
    segment_17B790_alloc_VRAM_SIZE = ABSOLUTE(segment_17B790_alloc_VRAM_END - segment_17B790_alloc_VRAM);

    segment_17B790_noload_VRAM = .;

    .segment_17B790.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_17B790_SBSS_START = .;
        build/us/asm/us/data/segment_17B790.o(.sbss*);
        segment_17B790_SBSS_END = .;
        segment_17B790_SBSS_SIZE = ABSOLUTE(segment_17B790_SBSS_END - segment_17B790_SBSS_START);

        segment_17B790_SCOMMON_START = .;
        build/us/asm/us/data/segment_17B790.o(.scommon*);
        segment_17B790_SCOMMON_END = .;
        segment_17B790_SCOMMON_SIZE = ABSOLUTE(segment_17B790_SCOMMON_END - segment_17B790_SCOMMON_START);

        segment_17B790_BSS_START = .;
        build/us/asm/us/data/segment_17B790.o(.bss*);
        segment_17B790_BSS_END = .;
        segment_17B790_BSS_SIZE = ABSOLUTE(segment_17B790_BSS_END - segment_17B790_BSS_START);

        segment_17B790COMMON_START = .;
        build/us/asm/us/data/segment_17B790.o(COMMON*);
        segment_17B790COMMON_END = .;
        segment_17B790COMMON_SIZE = ABSOLUTE(segment_17B790COMMON_END - segment_17B790COMMON_START);
    }

    segment_17B790_noload_VRAM_END = .;
    segment_17B790_noload_VRAM_SIZE = ABSOLUTE(segment_17B790_noload_VRAM_END - segment_17B790_noload_VRAM);

    __romPos += SIZEOF(.segment_17B790);
    segment_17B790_VRAM_END = .;
    segment_17B790_VRAM_SIZE = ABSOLUTE(segment_17B790_VRAM_END - segment_17B790_VRAM);
    segment_17B790_ROM_END = __romPos;
    segment_17B790_ROM_SIZE = ABSOLUTE(segment_17B790_ROM_END - segment_17B790_ROM_START);

    segment_17C1E0_ROM_START = __romPos;
    segment_17C1E0_VRAM = ADDR(.segment_17C1E0);
    segment_17C1E0_alloc_VRAM = .;

    .segment_17C1E0 : AT(segment_17C1E0_ROM_START)
    {
        FILL(0x00000000);
        segment_17C1E0_TEXT_START = .;
        build/us/asm/us/data/segment_17C1E0.o(.text*);
        segment_17C1E0_TEXT_END = .;
        segment_17C1E0_TEXT_SIZE = ABSOLUTE(segment_17C1E0_TEXT_END - segment_17C1E0_TEXT_START);

        segment_17C1E0_DATA_START = .;
        build/us/asm/us/data/segment_17C1E0.o(.data*);
        segment_17C1E0_DATA_END = .;
        segment_17C1E0_DATA_SIZE = ABSOLUTE(segment_17C1E0_DATA_END - segment_17C1E0_DATA_START);

        segment_17C1E0_RODATA_START = .;
        build/us/asm/us/data/segment_17C1E0.o(.rodata*);
        segment_17C1E0_RODATA_END = .;
        segment_17C1E0_RODATA_SIZE = ABSOLUTE(segment_17C1E0_RODATA_END - segment_17C1E0_RODATA_START);

        segment_17C1E0_SDATA_START = .;
        build/us/asm/us/data/segment_17C1E0.o(.sdata*);
        segment_17C1E0_SDATA_END = .;
        segment_17C1E0_SDATA_SIZE = ABSOLUTE(segment_17C1E0_SDATA_END - segment_17C1E0_SDATA_START);
    }

    segment_17C1E0_alloc_VRAM_END = .;
    segment_17C1E0_alloc_VRAM_SIZE = ABSOLUTE(segment_17C1E0_alloc_VRAM_END - segment_17C1E0_alloc_VRAM);

    segment_17C1E0_noload_VRAM = .;

    .segment_17C1E0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_17C1E0_SBSS_START = .;
        build/us/asm/us/data/segment_17C1E0.o(.sbss*);
        segment_17C1E0_SBSS_END = .;
        segment_17C1E0_SBSS_SIZE = ABSOLUTE(segment_17C1E0_SBSS_END - segment_17C1E0_SBSS_START);

        segment_17C1E0_SCOMMON_START = .;
        build/us/asm/us/data/segment_17C1E0.o(.scommon*);
        segment_17C1E0_SCOMMON_END = .;
        segment_17C1E0_SCOMMON_SIZE = ABSOLUTE(segment_17C1E0_SCOMMON_END - segment_17C1E0_SCOMMON_START);

        segment_17C1E0_BSS_START = .;
        build/us/asm/us/data/segment_17C1E0.o(.bss*);
        segment_17C1E0_BSS_END = .;
        segment_17C1E0_BSS_SIZE = ABSOLUTE(segment_17C1E0_BSS_END - segment_17C1E0_BSS_START);

        segment_17C1E0COMMON_START = .;
        build/us/asm/us/data/segment_17C1E0.o(COMMON*);
        segment_17C1E0COMMON_END = .;
        segment_17C1E0COMMON_SIZE = ABSOLUTE(segment_17C1E0COMMON_END - segment_17C1E0COMMON_START);
    }

    segment_17C1E0_noload_VRAM_END = .;
    segment_17C1E0_noload_VRAM_SIZE = ABSOLUTE(segment_17C1E0_noload_VRAM_END - segment_17C1E0_noload_VRAM);

    __romPos += SIZEOF(.segment_17C1E0);
    segment_17C1E0_VRAM_END = .;
    segment_17C1E0_VRAM_SIZE = ABSOLUTE(segment_17C1E0_VRAM_END - segment_17C1E0_VRAM);
    segment_17C1E0_ROM_END = __romPos;
    segment_17C1E0_ROM_SIZE = ABSOLUTE(segment_17C1E0_ROM_END - segment_17C1E0_ROM_START);

    segment_17D130_ROM_START = __romPos;
    segment_17D130_VRAM = ADDR(.segment_17D130);
    segment_17D130_alloc_VRAM = .;

    .segment_17D130 : AT(segment_17D130_ROM_START)
    {
        FILL(0x00000000);
        segment_17D130_TEXT_START = .;
        build/us/asm/us/data/segment_17D130.o(.text*);
        segment_17D130_TEXT_END = .;
        segment_17D130_TEXT_SIZE = ABSOLUTE(segment_17D130_TEXT_END - segment_17D130_TEXT_START);

        segment_17D130_DATA_START = .;
        build/us/asm/us/data/segment_17D130.o(.data*);
        segment_17D130_DATA_END = .;
        segment_17D130_DATA_SIZE = ABSOLUTE(segment_17D130_DATA_END - segment_17D130_DATA_START);

        segment_17D130_RODATA_START = .;
        build/us/asm/us/data/segment_17D130.o(.rodata*);
        segment_17D130_RODATA_END = .;
        segment_17D130_RODATA_SIZE = ABSOLUTE(segment_17D130_RODATA_END - segment_17D130_RODATA_START);

        segment_17D130_SDATA_START = .;
        build/us/asm/us/data/segment_17D130.o(.sdata*);
        segment_17D130_SDATA_END = .;
        segment_17D130_SDATA_SIZE = ABSOLUTE(segment_17D130_SDATA_END - segment_17D130_SDATA_START);
    }

    segment_17D130_alloc_VRAM_END = .;
    segment_17D130_alloc_VRAM_SIZE = ABSOLUTE(segment_17D130_alloc_VRAM_END - segment_17D130_alloc_VRAM);

    segment_17D130_noload_VRAM = .;

    .segment_17D130.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_17D130_SBSS_START = .;
        build/us/asm/us/data/segment_17D130.o(.sbss*);
        segment_17D130_SBSS_END = .;
        segment_17D130_SBSS_SIZE = ABSOLUTE(segment_17D130_SBSS_END - segment_17D130_SBSS_START);

        segment_17D130_SCOMMON_START = .;
        build/us/asm/us/data/segment_17D130.o(.scommon*);
        segment_17D130_SCOMMON_END = .;
        segment_17D130_SCOMMON_SIZE = ABSOLUTE(segment_17D130_SCOMMON_END - segment_17D130_SCOMMON_START);

        segment_17D130_BSS_START = .;
        build/us/asm/us/data/segment_17D130.o(.bss*);
        segment_17D130_BSS_END = .;
        segment_17D130_BSS_SIZE = ABSOLUTE(segment_17D130_BSS_END - segment_17D130_BSS_START);

        segment_17D130COMMON_START = .;
        build/us/asm/us/data/segment_17D130.o(COMMON*);
        segment_17D130COMMON_END = .;
        segment_17D130COMMON_SIZE = ABSOLUTE(segment_17D130COMMON_END - segment_17D130COMMON_START);
    }

    segment_17D130_noload_VRAM_END = .;
    segment_17D130_noload_VRAM_SIZE = ABSOLUTE(segment_17D130_noload_VRAM_END - segment_17D130_noload_VRAM);

    __romPos += SIZEOF(.segment_17D130);
    segment_17D130_VRAM_END = .;
    segment_17D130_VRAM_SIZE = ABSOLUTE(segment_17D130_VRAM_END - segment_17D130_VRAM);
    segment_17D130_ROM_END = __romPos;
    segment_17D130_ROM_SIZE = ABSOLUTE(segment_17D130_ROM_END - segment_17D130_ROM_START);

    segment_17E090_ROM_START = __romPos;
    segment_17E090_VRAM = ADDR(.segment_17E090);
    segment_17E090_alloc_VRAM = .;

    .segment_17E090 : AT(segment_17E090_ROM_START)
    {
        FILL(0x00000000);
        segment_17E090_TEXT_START = .;
        build/us/asm/us/data/segment_17E090.o(.text*);
        segment_17E090_TEXT_END = .;
        segment_17E090_TEXT_SIZE = ABSOLUTE(segment_17E090_TEXT_END - segment_17E090_TEXT_START);

        segment_17E090_DATA_START = .;
        build/us/asm/us/data/segment_17E090.o(.data*);
        segment_17E090_DATA_END = .;
        segment_17E090_DATA_SIZE = ABSOLUTE(segment_17E090_DATA_END - segment_17E090_DATA_START);

        segment_17E090_RODATA_START = .;
        build/us/asm/us/data/segment_17E090.o(.rodata*);
        segment_17E090_RODATA_END = .;
        segment_17E090_RODATA_SIZE = ABSOLUTE(segment_17E090_RODATA_END - segment_17E090_RODATA_START);

        segment_17E090_SDATA_START = .;
        build/us/asm/us/data/segment_17E090.o(.sdata*);
        segment_17E090_SDATA_END = .;
        segment_17E090_SDATA_SIZE = ABSOLUTE(segment_17E090_SDATA_END - segment_17E090_SDATA_START);
    }

    segment_17E090_alloc_VRAM_END = .;
    segment_17E090_alloc_VRAM_SIZE = ABSOLUTE(segment_17E090_alloc_VRAM_END - segment_17E090_alloc_VRAM);

    segment_17E090_noload_VRAM = .;

    .segment_17E090.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_17E090_SBSS_START = .;
        build/us/asm/us/data/segment_17E090.o(.sbss*);
        segment_17E090_SBSS_END = .;
        segment_17E090_SBSS_SIZE = ABSOLUTE(segment_17E090_SBSS_END - segment_17E090_SBSS_START);

        segment_17E090_SCOMMON_START = .;
        build/us/asm/us/data/segment_17E090.o(.scommon*);
        segment_17E090_SCOMMON_END = .;
        segment_17E090_SCOMMON_SIZE = ABSOLUTE(segment_17E090_SCOMMON_END - segment_17E090_SCOMMON_START);

        segment_17E090_BSS_START = .;
        build/us/asm/us/data/segment_17E090.o(.bss*);
        segment_17E090_BSS_END = .;
        segment_17E090_BSS_SIZE = ABSOLUTE(segment_17E090_BSS_END - segment_17E090_BSS_START);

        segment_17E090COMMON_START = .;
        build/us/asm/us/data/segment_17E090.o(COMMON*);
        segment_17E090COMMON_END = .;
        segment_17E090COMMON_SIZE = ABSOLUTE(segment_17E090COMMON_END - segment_17E090COMMON_START);
    }

    segment_17E090_noload_VRAM_END = .;
    segment_17E090_noload_VRAM_SIZE = ABSOLUTE(segment_17E090_noload_VRAM_END - segment_17E090_noload_VRAM);

    __romPos += SIZEOF(.segment_17E090);
    segment_17E090_VRAM_END = .;
    segment_17E090_VRAM_SIZE = ABSOLUTE(segment_17E090_VRAM_END - segment_17E090_VRAM);
    segment_17E090_ROM_END = __romPos;
    segment_17E090_ROM_SIZE = ABSOLUTE(segment_17E090_ROM_END - segment_17E090_ROM_START);

    segment_181840_ROM_START = __romPos;
    segment_181840_VRAM = ADDR(.segment_181840);
    segment_181840_alloc_VRAM = .;

    .segment_181840 : AT(segment_181840_ROM_START)
    {
        FILL(0x00000000);
        segment_181840_TEXT_START = .;
        build/us/asm/us/data/segment_181840.o(.text*);
        segment_181840_TEXT_END = .;
        segment_181840_TEXT_SIZE = ABSOLUTE(segment_181840_TEXT_END - segment_181840_TEXT_START);

        segment_181840_DATA_START = .;
        build/us/asm/us/data/segment_181840.o(.data*);
        segment_181840_DATA_END = .;
        segment_181840_DATA_SIZE = ABSOLUTE(segment_181840_DATA_END - segment_181840_DATA_START);

        segment_181840_RODATA_START = .;
        build/us/asm/us/data/segment_181840.o(.rodata*);
        segment_181840_RODATA_END = .;
        segment_181840_RODATA_SIZE = ABSOLUTE(segment_181840_RODATA_END - segment_181840_RODATA_START);

        segment_181840_SDATA_START = .;
        build/us/asm/us/data/segment_181840.o(.sdata*);
        segment_181840_SDATA_END = .;
        segment_181840_SDATA_SIZE = ABSOLUTE(segment_181840_SDATA_END - segment_181840_SDATA_START);
    }

    segment_181840_alloc_VRAM_END = .;
    segment_181840_alloc_VRAM_SIZE = ABSOLUTE(segment_181840_alloc_VRAM_END - segment_181840_alloc_VRAM);

    segment_181840_noload_VRAM = .;

    .segment_181840.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_181840_SBSS_START = .;
        build/us/asm/us/data/segment_181840.o(.sbss*);
        segment_181840_SBSS_END = .;
        segment_181840_SBSS_SIZE = ABSOLUTE(segment_181840_SBSS_END - segment_181840_SBSS_START);

        segment_181840_SCOMMON_START = .;
        build/us/asm/us/data/segment_181840.o(.scommon*);
        segment_181840_SCOMMON_END = .;
        segment_181840_SCOMMON_SIZE = ABSOLUTE(segment_181840_SCOMMON_END - segment_181840_SCOMMON_START);

        segment_181840_BSS_START = .;
        build/us/asm/us/data/segment_181840.o(.bss*);
        segment_181840_BSS_END = .;
        segment_181840_BSS_SIZE = ABSOLUTE(segment_181840_BSS_END - segment_181840_BSS_START);

        segment_181840COMMON_START = .;
        build/us/asm/us/data/segment_181840.o(COMMON*);
        segment_181840COMMON_END = .;
        segment_181840COMMON_SIZE = ABSOLUTE(segment_181840COMMON_END - segment_181840COMMON_START);
    }

    segment_181840_noload_VRAM_END = .;
    segment_181840_noload_VRAM_SIZE = ABSOLUTE(segment_181840_noload_VRAM_END - segment_181840_noload_VRAM);

    __romPos += SIZEOF(.segment_181840);
    segment_181840_VRAM_END = .;
    segment_181840_VRAM_SIZE = ABSOLUTE(segment_181840_VRAM_END - segment_181840_VRAM);
    segment_181840_ROM_END = __romPos;
    segment_181840_ROM_SIZE = ABSOLUTE(segment_181840_ROM_END - segment_181840_ROM_START);

    segment_184FF0_ROM_START = __romPos;
    segment_184FF0_VRAM = ADDR(.segment_184FF0);
    segment_184FF0_alloc_VRAM = .;

    .segment_184FF0 : AT(segment_184FF0_ROM_START)
    {
        FILL(0x00000000);
        segment_184FF0_TEXT_START = .;
        build/us/asm/us/data/segment_184FF0.o(.text*);
        segment_184FF0_TEXT_END = .;
        segment_184FF0_TEXT_SIZE = ABSOLUTE(segment_184FF0_TEXT_END - segment_184FF0_TEXT_START);

        segment_184FF0_DATA_START = .;
        build/us/asm/us/data/segment_184FF0.o(.data*);
        segment_184FF0_DATA_END = .;
        segment_184FF0_DATA_SIZE = ABSOLUTE(segment_184FF0_DATA_END - segment_184FF0_DATA_START);

        segment_184FF0_RODATA_START = .;
        build/us/asm/us/data/segment_184FF0.o(.rodata*);
        segment_184FF0_RODATA_END = .;
        segment_184FF0_RODATA_SIZE = ABSOLUTE(segment_184FF0_RODATA_END - segment_184FF0_RODATA_START);

        segment_184FF0_SDATA_START = .;
        build/us/asm/us/data/segment_184FF0.o(.sdata*);
        segment_184FF0_SDATA_END = .;
        segment_184FF0_SDATA_SIZE = ABSOLUTE(segment_184FF0_SDATA_END - segment_184FF0_SDATA_START);
    }

    segment_184FF0_alloc_VRAM_END = .;
    segment_184FF0_alloc_VRAM_SIZE = ABSOLUTE(segment_184FF0_alloc_VRAM_END - segment_184FF0_alloc_VRAM);

    segment_184FF0_noload_VRAM = .;

    .segment_184FF0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_184FF0_SBSS_START = .;
        build/us/asm/us/data/segment_184FF0.o(.sbss*);
        segment_184FF0_SBSS_END = .;
        segment_184FF0_SBSS_SIZE = ABSOLUTE(segment_184FF0_SBSS_END - segment_184FF0_SBSS_START);

        segment_184FF0_SCOMMON_START = .;
        build/us/asm/us/data/segment_184FF0.o(.scommon*);
        segment_184FF0_SCOMMON_END = .;
        segment_184FF0_SCOMMON_SIZE = ABSOLUTE(segment_184FF0_SCOMMON_END - segment_184FF0_SCOMMON_START);

        segment_184FF0_BSS_START = .;
        build/us/asm/us/data/segment_184FF0.o(.bss*);
        segment_184FF0_BSS_END = .;
        segment_184FF0_BSS_SIZE = ABSOLUTE(segment_184FF0_BSS_END - segment_184FF0_BSS_START);

        segment_184FF0COMMON_START = .;
        build/us/asm/us/data/segment_184FF0.o(COMMON*);
        segment_184FF0COMMON_END = .;
        segment_184FF0COMMON_SIZE = ABSOLUTE(segment_184FF0COMMON_END - segment_184FF0COMMON_START);
    }

    segment_184FF0_noload_VRAM_END = .;
    segment_184FF0_noload_VRAM_SIZE = ABSOLUTE(segment_184FF0_noload_VRAM_END - segment_184FF0_noload_VRAM);

    __romPos += SIZEOF(.segment_184FF0);
    segment_184FF0_VRAM_END = .;
    segment_184FF0_VRAM_SIZE = ABSOLUTE(segment_184FF0_VRAM_END - segment_184FF0_VRAM);
    segment_184FF0_ROM_END = __romPos;
    segment_184FF0_ROM_SIZE = ABSOLUTE(segment_184FF0_ROM_END - segment_184FF0_ROM_START);

    segment_186FF0_ROM_START = __romPos;
    segment_186FF0_VRAM = ADDR(.segment_186FF0);
    segment_186FF0_alloc_VRAM = .;

    .segment_186FF0 : AT(segment_186FF0_ROM_START)
    {
        FILL(0x00000000);
        segment_186FF0_TEXT_START = .;
        build/us/asm/us/data/segment_186FF0.o(.text*);
        segment_186FF0_TEXT_END = .;
        segment_186FF0_TEXT_SIZE = ABSOLUTE(segment_186FF0_TEXT_END - segment_186FF0_TEXT_START);

        segment_186FF0_DATA_START = .;
        build/us/asm/us/data/segment_186FF0.o(.data*);
        segment_186FF0_DATA_END = .;
        segment_186FF0_DATA_SIZE = ABSOLUTE(segment_186FF0_DATA_END - segment_186FF0_DATA_START);

        segment_186FF0_RODATA_START = .;
        build/us/asm/us/data/segment_186FF0.o(.rodata*);
        segment_186FF0_RODATA_END = .;
        segment_186FF0_RODATA_SIZE = ABSOLUTE(segment_186FF0_RODATA_END - segment_186FF0_RODATA_START);

        segment_186FF0_SDATA_START = .;
        build/us/asm/us/data/segment_186FF0.o(.sdata*);
        segment_186FF0_SDATA_END = .;
        segment_186FF0_SDATA_SIZE = ABSOLUTE(segment_186FF0_SDATA_END - segment_186FF0_SDATA_START);
    }

    segment_186FF0_alloc_VRAM_END = .;
    segment_186FF0_alloc_VRAM_SIZE = ABSOLUTE(segment_186FF0_alloc_VRAM_END - segment_186FF0_alloc_VRAM);

    segment_186FF0_noload_VRAM = .;

    .segment_186FF0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_186FF0_SBSS_START = .;
        build/us/asm/us/data/segment_186FF0.o(.sbss*);
        segment_186FF0_SBSS_END = .;
        segment_186FF0_SBSS_SIZE = ABSOLUTE(segment_186FF0_SBSS_END - segment_186FF0_SBSS_START);

        segment_186FF0_SCOMMON_START = .;
        build/us/asm/us/data/segment_186FF0.o(.scommon*);
        segment_186FF0_SCOMMON_END = .;
        segment_186FF0_SCOMMON_SIZE = ABSOLUTE(segment_186FF0_SCOMMON_END - segment_186FF0_SCOMMON_START);

        segment_186FF0_BSS_START = .;
        build/us/asm/us/data/segment_186FF0.o(.bss*);
        segment_186FF0_BSS_END = .;
        segment_186FF0_BSS_SIZE = ABSOLUTE(segment_186FF0_BSS_END - segment_186FF0_BSS_START);

        segment_186FF0COMMON_START = .;
        build/us/asm/us/data/segment_186FF0.o(COMMON*);
        segment_186FF0COMMON_END = .;
        segment_186FF0COMMON_SIZE = ABSOLUTE(segment_186FF0COMMON_END - segment_186FF0COMMON_START);
    }

    segment_186FF0_noload_VRAM_END = .;
    segment_186FF0_noload_VRAM_SIZE = ABSOLUTE(segment_186FF0_noload_VRAM_END - segment_186FF0_noload_VRAM);

    __romPos += SIZEOF(.segment_186FF0);
    segment_186FF0_VRAM_END = .;
    segment_186FF0_VRAM_SIZE = ABSOLUTE(segment_186FF0_VRAM_END - segment_186FF0_VRAM);
    segment_186FF0_ROM_END = __romPos;
    segment_186FF0_ROM_SIZE = ABSOLUTE(segment_186FF0_ROM_END - segment_186FF0_ROM_START);

    segment_188FF0_ROM_START = __romPos;
    segment_188FF0_VRAM = ADDR(.segment_188FF0);
    segment_188FF0_alloc_VRAM = .;

    .segment_188FF0 : AT(segment_188FF0_ROM_START)
    {
        FILL(0x00000000);
        segment_188FF0_TEXT_START = .;
        build/us/asm/us/data/segment_188FF0.o(.text*);
        segment_188FF0_TEXT_END = .;
        segment_188FF0_TEXT_SIZE = ABSOLUTE(segment_188FF0_TEXT_END - segment_188FF0_TEXT_START);

        segment_188FF0_DATA_START = .;
        build/us/asm/us/data/segment_188FF0.o(.data*);
        segment_188FF0_DATA_END = .;
        segment_188FF0_DATA_SIZE = ABSOLUTE(segment_188FF0_DATA_END - segment_188FF0_DATA_START);

        segment_188FF0_RODATA_START = .;
        build/us/asm/us/data/segment_188FF0.o(.rodata*);
        segment_188FF0_RODATA_END = .;
        segment_188FF0_RODATA_SIZE = ABSOLUTE(segment_188FF0_RODATA_END - segment_188FF0_RODATA_START);

        segment_188FF0_SDATA_START = .;
        build/us/asm/us/data/segment_188FF0.o(.sdata*);
        segment_188FF0_SDATA_END = .;
        segment_188FF0_SDATA_SIZE = ABSOLUTE(segment_188FF0_SDATA_END - segment_188FF0_SDATA_START);
    }

    segment_188FF0_alloc_VRAM_END = .;
    segment_188FF0_alloc_VRAM_SIZE = ABSOLUTE(segment_188FF0_alloc_VRAM_END - segment_188FF0_alloc_VRAM);

    segment_188FF0_noload_VRAM = .;

    .segment_188FF0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_188FF0_SBSS_START = .;
        build/us/asm/us/data/segment_188FF0.o(.sbss*);
        segment_188FF0_SBSS_END = .;
        segment_188FF0_SBSS_SIZE = ABSOLUTE(segment_188FF0_SBSS_END - segment_188FF0_SBSS_START);

        segment_188FF0_SCOMMON_START = .;
        build/us/asm/us/data/segment_188FF0.o(.scommon*);
        segment_188FF0_SCOMMON_END = .;
        segment_188FF0_SCOMMON_SIZE = ABSOLUTE(segment_188FF0_SCOMMON_END - segment_188FF0_SCOMMON_START);

        segment_188FF0_BSS_START = .;
        build/us/asm/us/data/segment_188FF0.o(.bss*);
        segment_188FF0_BSS_END = .;
        segment_188FF0_BSS_SIZE = ABSOLUTE(segment_188FF0_BSS_END - segment_188FF0_BSS_START);

        segment_188FF0COMMON_START = .;
        build/us/asm/us/data/segment_188FF0.o(COMMON*);
        segment_188FF0COMMON_END = .;
        segment_188FF0COMMON_SIZE = ABSOLUTE(segment_188FF0COMMON_END - segment_188FF0COMMON_START);
    }

    segment_188FF0_noload_VRAM_END = .;
    segment_188FF0_noload_VRAM_SIZE = ABSOLUTE(segment_188FF0_noload_VRAM_END - segment_188FF0_noload_VRAM);

    __romPos += SIZEOF(.segment_188FF0);
    segment_188FF0_VRAM_END = .;
    segment_188FF0_VRAM_SIZE = ABSOLUTE(segment_188FF0_VRAM_END - segment_188FF0_VRAM);
    segment_188FF0_ROM_END = __romPos;
    segment_188FF0_ROM_SIZE = ABSOLUTE(segment_188FF0_ROM_END - segment_188FF0_ROM_START);

    segment_189D40_ROM_START = __romPos;
    segment_189D40_VRAM = ADDR(.segment_189D40);
    segment_189D40_alloc_VRAM = .;

    .segment_189D40 : AT(segment_189D40_ROM_START)
    {
        FILL(0x00000000);
        segment_189D40_TEXT_START = .;
        build/us/asm/us/data/segment_189D40.o(.text*);
        segment_189D40_TEXT_END = .;
        segment_189D40_TEXT_SIZE = ABSOLUTE(segment_189D40_TEXT_END - segment_189D40_TEXT_START);

        segment_189D40_DATA_START = .;
        build/us/asm/us/data/segment_189D40.o(.data*);
        segment_189D40_DATA_END = .;
        segment_189D40_DATA_SIZE = ABSOLUTE(segment_189D40_DATA_END - segment_189D40_DATA_START);

        segment_189D40_RODATA_START = .;
        build/us/asm/us/data/segment_189D40.o(.rodata*);
        segment_189D40_RODATA_END = .;
        segment_189D40_RODATA_SIZE = ABSOLUTE(segment_189D40_RODATA_END - segment_189D40_RODATA_START);

        segment_189D40_SDATA_START = .;
        build/us/asm/us/data/segment_189D40.o(.sdata*);
        segment_189D40_SDATA_END = .;
        segment_189D40_SDATA_SIZE = ABSOLUTE(segment_189D40_SDATA_END - segment_189D40_SDATA_START);
    }

    segment_189D40_alloc_VRAM_END = .;
    segment_189D40_alloc_VRAM_SIZE = ABSOLUTE(segment_189D40_alloc_VRAM_END - segment_189D40_alloc_VRAM);

    segment_189D40_noload_VRAM = .;

    .segment_189D40.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_189D40_SBSS_START = .;
        build/us/asm/us/data/segment_189D40.o(.sbss*);
        segment_189D40_SBSS_END = .;
        segment_189D40_SBSS_SIZE = ABSOLUTE(segment_189D40_SBSS_END - segment_189D40_SBSS_START);

        segment_189D40_SCOMMON_START = .;
        build/us/asm/us/data/segment_189D40.o(.scommon*);
        segment_189D40_SCOMMON_END = .;
        segment_189D40_SCOMMON_SIZE = ABSOLUTE(segment_189D40_SCOMMON_END - segment_189D40_SCOMMON_START);

        segment_189D40_BSS_START = .;
        build/us/asm/us/data/segment_189D40.o(.bss*);
        segment_189D40_BSS_END = .;
        segment_189D40_BSS_SIZE = ABSOLUTE(segment_189D40_BSS_END - segment_189D40_BSS_START);

        segment_189D40COMMON_START = .;
        build/us/asm/us/data/segment_189D40.o(COMMON*);
        segment_189D40COMMON_END = .;
        segment_189D40COMMON_SIZE = ABSOLUTE(segment_189D40COMMON_END - segment_189D40COMMON_START);
    }

    segment_189D40_noload_VRAM_END = .;
    segment_189D40_noload_VRAM_SIZE = ABSOLUTE(segment_189D40_noload_VRAM_END - segment_189D40_noload_VRAM);

    __romPos += SIZEOF(.segment_189D40);
    segment_189D40_VRAM_END = .;
    segment_189D40_VRAM_SIZE = ABSOLUTE(segment_189D40_VRAM_END - segment_189D40_VRAM);
    segment_189D40_ROM_END = __romPos;
    segment_189D40_ROM_SIZE = ABSOLUTE(segment_189D40_ROM_END - segment_189D40_ROM_START);

    segment_18CB40_ROM_START = __romPos;
    segment_18CB40_VRAM = ADDR(.segment_18CB40);
    segment_18CB40_alloc_VRAM = .;

    .segment_18CB40 : AT(segment_18CB40_ROM_START)
    {
        FILL(0x00000000);
        segment_18CB40_TEXT_START = .;
        build/us/asm/us/data/segment_18CB40.o(.text*);
        segment_18CB40_TEXT_END = .;
        segment_18CB40_TEXT_SIZE = ABSOLUTE(segment_18CB40_TEXT_END - segment_18CB40_TEXT_START);

        segment_18CB40_DATA_START = .;
        build/us/asm/us/data/segment_18CB40.o(.data*);
        segment_18CB40_DATA_END = .;
        segment_18CB40_DATA_SIZE = ABSOLUTE(segment_18CB40_DATA_END - segment_18CB40_DATA_START);

        segment_18CB40_RODATA_START = .;
        build/us/asm/us/data/segment_18CB40.o(.rodata*);
        segment_18CB40_RODATA_END = .;
        segment_18CB40_RODATA_SIZE = ABSOLUTE(segment_18CB40_RODATA_END - segment_18CB40_RODATA_START);

        segment_18CB40_SDATA_START = .;
        build/us/asm/us/data/segment_18CB40.o(.sdata*);
        segment_18CB40_SDATA_END = .;
        segment_18CB40_SDATA_SIZE = ABSOLUTE(segment_18CB40_SDATA_END - segment_18CB40_SDATA_START);
    }

    segment_18CB40_alloc_VRAM_END = .;
    segment_18CB40_alloc_VRAM_SIZE = ABSOLUTE(segment_18CB40_alloc_VRAM_END - segment_18CB40_alloc_VRAM);

    segment_18CB40_noload_VRAM = .;

    .segment_18CB40.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_18CB40_SBSS_START = .;
        build/us/asm/us/data/segment_18CB40.o(.sbss*);
        segment_18CB40_SBSS_END = .;
        segment_18CB40_SBSS_SIZE = ABSOLUTE(segment_18CB40_SBSS_END - segment_18CB40_SBSS_START);

        segment_18CB40_SCOMMON_START = .;
        build/us/asm/us/data/segment_18CB40.o(.scommon*);
        segment_18CB40_SCOMMON_END = .;
        segment_18CB40_SCOMMON_SIZE = ABSOLUTE(segment_18CB40_SCOMMON_END - segment_18CB40_SCOMMON_START);

        segment_18CB40_BSS_START = .;
        build/us/asm/us/data/segment_18CB40.o(.bss*);
        segment_18CB40_BSS_END = .;
        segment_18CB40_BSS_SIZE = ABSOLUTE(segment_18CB40_BSS_END - segment_18CB40_BSS_START);

        segment_18CB40COMMON_START = .;
        build/us/asm/us/data/segment_18CB40.o(COMMON*);
        segment_18CB40COMMON_END = .;
        segment_18CB40COMMON_SIZE = ABSOLUTE(segment_18CB40COMMON_END - segment_18CB40COMMON_START);
    }

    segment_18CB40_noload_VRAM_END = .;
    segment_18CB40_noload_VRAM_SIZE = ABSOLUTE(segment_18CB40_noload_VRAM_END - segment_18CB40_noload_VRAM);

    __romPos += SIZEOF(.segment_18CB40);
    segment_18CB40_VRAM_END = .;
    segment_18CB40_VRAM_SIZE = ABSOLUTE(segment_18CB40_VRAM_END - segment_18CB40_VRAM);
    segment_18CB40_ROM_END = __romPos;
    segment_18CB40_ROM_SIZE = ABSOLUTE(segment_18CB40_ROM_END - segment_18CB40_ROM_START);

    segment_18DB90_ROM_START = __romPos;
    segment_18DB90_VRAM = ADDR(.segment_18DB90);
    segment_18DB90_alloc_VRAM = .;

    .segment_18DB90 : AT(segment_18DB90_ROM_START)
    {
        FILL(0x00000000);
        segment_18DB90_TEXT_START = .;
        build/us/asm/us/data/segment_18DB90.o(.text*);
        segment_18DB90_TEXT_END = .;
        segment_18DB90_TEXT_SIZE = ABSOLUTE(segment_18DB90_TEXT_END - segment_18DB90_TEXT_START);

        segment_18DB90_DATA_START = .;
        build/us/asm/us/data/segment_18DB90.o(.data*);
        segment_18DB90_DATA_END = .;
        segment_18DB90_DATA_SIZE = ABSOLUTE(segment_18DB90_DATA_END - segment_18DB90_DATA_START);

        segment_18DB90_RODATA_START = .;
        build/us/asm/us/data/segment_18DB90.o(.rodata*);
        segment_18DB90_RODATA_END = .;
        segment_18DB90_RODATA_SIZE = ABSOLUTE(segment_18DB90_RODATA_END - segment_18DB90_RODATA_START);

        segment_18DB90_SDATA_START = .;
        build/us/asm/us/data/segment_18DB90.o(.sdata*);
        segment_18DB90_SDATA_END = .;
        segment_18DB90_SDATA_SIZE = ABSOLUTE(segment_18DB90_SDATA_END - segment_18DB90_SDATA_START);
    }

    segment_18DB90_alloc_VRAM_END = .;
    segment_18DB90_alloc_VRAM_SIZE = ABSOLUTE(segment_18DB90_alloc_VRAM_END - segment_18DB90_alloc_VRAM);

    segment_18DB90_noload_VRAM = .;

    .segment_18DB90.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_18DB90_SBSS_START = .;
        build/us/asm/us/data/segment_18DB90.o(.sbss*);
        segment_18DB90_SBSS_END = .;
        segment_18DB90_SBSS_SIZE = ABSOLUTE(segment_18DB90_SBSS_END - segment_18DB90_SBSS_START);

        segment_18DB90_SCOMMON_START = .;
        build/us/asm/us/data/segment_18DB90.o(.scommon*);
        segment_18DB90_SCOMMON_END = .;
        segment_18DB90_SCOMMON_SIZE = ABSOLUTE(segment_18DB90_SCOMMON_END - segment_18DB90_SCOMMON_START);

        segment_18DB90_BSS_START = .;
        build/us/asm/us/data/segment_18DB90.o(.bss*);
        segment_18DB90_BSS_END = .;
        segment_18DB90_BSS_SIZE = ABSOLUTE(segment_18DB90_BSS_END - segment_18DB90_BSS_START);

        segment_18DB90COMMON_START = .;
        build/us/asm/us/data/segment_18DB90.o(COMMON*);
        segment_18DB90COMMON_END = .;
        segment_18DB90COMMON_SIZE = ABSOLUTE(segment_18DB90COMMON_END - segment_18DB90COMMON_START);
    }

    segment_18DB90_noload_VRAM_END = .;
    segment_18DB90_noload_VRAM_SIZE = ABSOLUTE(segment_18DB90_noload_VRAM_END - segment_18DB90_noload_VRAM);

    __romPos += SIZEOF(.segment_18DB90);
    segment_18DB90_VRAM_END = .;
    segment_18DB90_VRAM_SIZE = ABSOLUTE(segment_18DB90_VRAM_END - segment_18DB90_VRAM);
    segment_18DB90_ROM_END = __romPos;
    segment_18DB90_ROM_SIZE = ABSOLUTE(segment_18DB90_ROM_END - segment_18DB90_ROM_START);

    segment_18F160_ROM_START = __romPos;
    segment_18F160_VRAM = ADDR(.segment_18F160);
    segment_18F160_alloc_VRAM = .;

    .segment_18F160 : AT(segment_18F160_ROM_START)
    {
        FILL(0x00000000);
        segment_18F160_TEXT_START = .;
        build/us/asm/us/data/segment_18F160.o(.text*);
        segment_18F160_TEXT_END = .;
        segment_18F160_TEXT_SIZE = ABSOLUTE(segment_18F160_TEXT_END - segment_18F160_TEXT_START);

        segment_18F160_DATA_START = .;
        build/us/asm/us/data/segment_18F160.o(.data*);
        segment_18F160_DATA_END = .;
        segment_18F160_DATA_SIZE = ABSOLUTE(segment_18F160_DATA_END - segment_18F160_DATA_START);

        segment_18F160_RODATA_START = .;
        build/us/asm/us/data/segment_18F160.o(.rodata*);
        segment_18F160_RODATA_END = .;
        segment_18F160_RODATA_SIZE = ABSOLUTE(segment_18F160_RODATA_END - segment_18F160_RODATA_START);

        segment_18F160_SDATA_START = .;
        build/us/asm/us/data/segment_18F160.o(.sdata*);
        segment_18F160_SDATA_END = .;
        segment_18F160_SDATA_SIZE = ABSOLUTE(segment_18F160_SDATA_END - segment_18F160_SDATA_START);
    }

    segment_18F160_alloc_VRAM_END = .;
    segment_18F160_alloc_VRAM_SIZE = ABSOLUTE(segment_18F160_alloc_VRAM_END - segment_18F160_alloc_VRAM);

    segment_18F160_noload_VRAM = .;

    .segment_18F160.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_18F160_SBSS_START = .;
        build/us/asm/us/data/segment_18F160.o(.sbss*);
        segment_18F160_SBSS_END = .;
        segment_18F160_SBSS_SIZE = ABSOLUTE(segment_18F160_SBSS_END - segment_18F160_SBSS_START);

        segment_18F160_SCOMMON_START = .;
        build/us/asm/us/data/segment_18F160.o(.scommon*);
        segment_18F160_SCOMMON_END = .;
        segment_18F160_SCOMMON_SIZE = ABSOLUTE(segment_18F160_SCOMMON_END - segment_18F160_SCOMMON_START);

        segment_18F160_BSS_START = .;
        build/us/asm/us/data/segment_18F160.o(.bss*);
        segment_18F160_BSS_END = .;
        segment_18F160_BSS_SIZE = ABSOLUTE(segment_18F160_BSS_END - segment_18F160_BSS_START);

        segment_18F160COMMON_START = .;
        build/us/asm/us/data/segment_18F160.o(COMMON*);
        segment_18F160COMMON_END = .;
        segment_18F160COMMON_SIZE = ABSOLUTE(segment_18F160COMMON_END - segment_18F160COMMON_START);
    }

    segment_18F160_noload_VRAM_END = .;
    segment_18F160_noload_VRAM_SIZE = ABSOLUTE(segment_18F160_noload_VRAM_END - segment_18F160_noload_VRAM);

    __romPos += SIZEOF(.segment_18F160);
    segment_18F160_VRAM_END = .;
    segment_18F160_VRAM_SIZE = ABSOLUTE(segment_18F160_VRAM_END - segment_18F160_VRAM);
    segment_18F160_ROM_END = __romPos;
    segment_18F160_ROM_SIZE = ABSOLUTE(segment_18F160_ROM_END - segment_18F160_ROM_START);

    segment_1906E0_ROM_START = __romPos;
    segment_1906E0_VRAM = ADDR(.segment_1906E0);
    segment_1906E0_alloc_VRAM = .;

    .segment_1906E0 : AT(segment_1906E0_ROM_START)
    {
        FILL(0x00000000);
        segment_1906E0_TEXT_START = .;
        build/us/asm/us/data/segment_1906E0.o(.text*);
        segment_1906E0_TEXT_END = .;
        segment_1906E0_TEXT_SIZE = ABSOLUTE(segment_1906E0_TEXT_END - segment_1906E0_TEXT_START);

        segment_1906E0_DATA_START = .;
        build/us/asm/us/data/segment_1906E0.o(.data*);
        segment_1906E0_DATA_END = .;
        segment_1906E0_DATA_SIZE = ABSOLUTE(segment_1906E0_DATA_END - segment_1906E0_DATA_START);

        segment_1906E0_RODATA_START = .;
        build/us/asm/us/data/segment_1906E0.o(.rodata*);
        segment_1906E0_RODATA_END = .;
        segment_1906E0_RODATA_SIZE = ABSOLUTE(segment_1906E0_RODATA_END - segment_1906E0_RODATA_START);

        segment_1906E0_SDATA_START = .;
        build/us/asm/us/data/segment_1906E0.o(.sdata*);
        segment_1906E0_SDATA_END = .;
        segment_1906E0_SDATA_SIZE = ABSOLUTE(segment_1906E0_SDATA_END - segment_1906E0_SDATA_START);
    }

    segment_1906E0_alloc_VRAM_END = .;
    segment_1906E0_alloc_VRAM_SIZE = ABSOLUTE(segment_1906E0_alloc_VRAM_END - segment_1906E0_alloc_VRAM);

    segment_1906E0_noload_VRAM = .;

    .segment_1906E0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_1906E0_SBSS_START = .;
        build/us/asm/us/data/segment_1906E0.o(.sbss*);
        segment_1906E0_SBSS_END = .;
        segment_1906E0_SBSS_SIZE = ABSOLUTE(segment_1906E0_SBSS_END - segment_1906E0_SBSS_START);

        segment_1906E0_SCOMMON_START = .;
        build/us/asm/us/data/segment_1906E0.o(.scommon*);
        segment_1906E0_SCOMMON_END = .;
        segment_1906E0_SCOMMON_SIZE = ABSOLUTE(segment_1906E0_SCOMMON_END - segment_1906E0_SCOMMON_START);

        segment_1906E0_BSS_START = .;
        build/us/asm/us/data/segment_1906E0.o(.bss*);
        segment_1906E0_BSS_END = .;
        segment_1906E0_BSS_SIZE = ABSOLUTE(segment_1906E0_BSS_END - segment_1906E0_BSS_START);

        segment_1906E0COMMON_START = .;
        build/us/asm/us/data/segment_1906E0.o(COMMON*);
        segment_1906E0COMMON_END = .;
        segment_1906E0COMMON_SIZE = ABSOLUTE(segment_1906E0COMMON_END - segment_1906E0COMMON_START);
    }

    segment_1906E0_noload_VRAM_END = .;
    segment_1906E0_noload_VRAM_SIZE = ABSOLUTE(segment_1906E0_noload_VRAM_END - segment_1906E0_noload_VRAM);

    __romPos += SIZEOF(.segment_1906E0);
    segment_1906E0_VRAM_END = .;
    segment_1906E0_VRAM_SIZE = ABSOLUTE(segment_1906E0_VRAM_END - segment_1906E0_VRAM);
    segment_1906E0_ROM_END = __romPos;
    segment_1906E0_ROM_SIZE = ABSOLUTE(segment_1906E0_ROM_END - segment_1906E0_ROM_START);

    segment_1911D0_ROM_START = __romPos;
    segment_1911D0_VRAM = ADDR(.segment_1911D0);
    segment_1911D0_alloc_VRAM = .;

    .segment_1911D0 : AT(segment_1911D0_ROM_START)
    {
        FILL(0x00000000);
        segment_1911D0_TEXT_START = .;
        build/us/asm/us/data/segment_1911D0.o(.text*);
        segment_1911D0_TEXT_END = .;
        segment_1911D0_TEXT_SIZE = ABSOLUTE(segment_1911D0_TEXT_END - segment_1911D0_TEXT_START);

        segment_1911D0_DATA_START = .;
        build/us/asm/us/data/segment_1911D0.o(.data*);
        segment_1911D0_DATA_END = .;
        segment_1911D0_DATA_SIZE = ABSOLUTE(segment_1911D0_DATA_END - segment_1911D0_DATA_START);

        segment_1911D0_RODATA_START = .;
        build/us/asm/us/data/segment_1911D0.o(.rodata*);
        segment_1911D0_RODATA_END = .;
        segment_1911D0_RODATA_SIZE = ABSOLUTE(segment_1911D0_RODATA_END - segment_1911D0_RODATA_START);

        segment_1911D0_SDATA_START = .;
        build/us/asm/us/data/segment_1911D0.o(.sdata*);
        segment_1911D0_SDATA_END = .;
        segment_1911D0_SDATA_SIZE = ABSOLUTE(segment_1911D0_SDATA_END - segment_1911D0_SDATA_START);
    }

    segment_1911D0_alloc_VRAM_END = .;
    segment_1911D0_alloc_VRAM_SIZE = ABSOLUTE(segment_1911D0_alloc_VRAM_END - segment_1911D0_alloc_VRAM);

    segment_1911D0_noload_VRAM = .;

    .segment_1911D0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_1911D0_SBSS_START = .;
        build/us/asm/us/data/segment_1911D0.o(.sbss*);
        segment_1911D0_SBSS_END = .;
        segment_1911D0_SBSS_SIZE = ABSOLUTE(segment_1911D0_SBSS_END - segment_1911D0_SBSS_START);

        segment_1911D0_SCOMMON_START = .;
        build/us/asm/us/data/segment_1911D0.o(.scommon*);
        segment_1911D0_SCOMMON_END = .;
        segment_1911D0_SCOMMON_SIZE = ABSOLUTE(segment_1911D0_SCOMMON_END - segment_1911D0_SCOMMON_START);

        segment_1911D0_BSS_START = .;
        build/us/asm/us/data/segment_1911D0.o(.bss*);
        segment_1911D0_BSS_END = .;
        segment_1911D0_BSS_SIZE = ABSOLUTE(segment_1911D0_BSS_END - segment_1911D0_BSS_START);

        segment_1911D0COMMON_START = .;
        build/us/asm/us/data/segment_1911D0.o(COMMON*);
        segment_1911D0COMMON_END = .;
        segment_1911D0COMMON_SIZE = ABSOLUTE(segment_1911D0COMMON_END - segment_1911D0COMMON_START);
    }

    segment_1911D0_noload_VRAM_END = .;
    segment_1911D0_noload_VRAM_SIZE = ABSOLUTE(segment_1911D0_noload_VRAM_END - segment_1911D0_noload_VRAM);

    __romPos += SIZEOF(.segment_1911D0);
    segment_1911D0_VRAM_END = .;
    segment_1911D0_VRAM_SIZE = ABSOLUTE(segment_1911D0_VRAM_END - segment_1911D0_VRAM);
    segment_1911D0_ROM_END = __romPos;
    segment_1911D0_ROM_SIZE = ABSOLUTE(segment_1911D0_ROM_END - segment_1911D0_ROM_START);

    segment_1936C0_ROM_START = __romPos;
    segment_1936C0_VRAM = ADDR(.segment_1936C0);
    segment_1936C0_alloc_VRAM = .;

    .segment_1936C0 : AT(segment_1936C0_ROM_START)
    {
        FILL(0x00000000);
        segment_1936C0_TEXT_START = .;
        build/us/asm/us/data/segment_1936C0.o(.text*);
        segment_1936C0_TEXT_END = .;
        segment_1936C0_TEXT_SIZE = ABSOLUTE(segment_1936C0_TEXT_END - segment_1936C0_TEXT_START);

        segment_1936C0_DATA_START = .;
        build/us/asm/us/data/segment_1936C0.o(.data*);
        segment_1936C0_DATA_END = .;
        segment_1936C0_DATA_SIZE = ABSOLUTE(segment_1936C0_DATA_END - segment_1936C0_DATA_START);

        segment_1936C0_RODATA_START = .;
        build/us/asm/us/data/segment_1936C0.o(.rodata*);
        segment_1936C0_RODATA_END = .;
        segment_1936C0_RODATA_SIZE = ABSOLUTE(segment_1936C0_RODATA_END - segment_1936C0_RODATA_START);

        segment_1936C0_SDATA_START = .;
        build/us/asm/us/data/segment_1936C0.o(.sdata*);
        segment_1936C0_SDATA_END = .;
        segment_1936C0_SDATA_SIZE = ABSOLUTE(segment_1936C0_SDATA_END - segment_1936C0_SDATA_START);
    }

    segment_1936C0_alloc_VRAM_END = .;
    segment_1936C0_alloc_VRAM_SIZE = ABSOLUTE(segment_1936C0_alloc_VRAM_END - segment_1936C0_alloc_VRAM);

    segment_1936C0_noload_VRAM = .;

    .segment_1936C0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_1936C0_SBSS_START = .;
        build/us/asm/us/data/segment_1936C0.o(.sbss*);
        segment_1936C0_SBSS_END = .;
        segment_1936C0_SBSS_SIZE = ABSOLUTE(segment_1936C0_SBSS_END - segment_1936C0_SBSS_START);

        segment_1936C0_SCOMMON_START = .;
        build/us/asm/us/data/segment_1936C0.o(.scommon*);
        segment_1936C0_SCOMMON_END = .;
        segment_1936C0_SCOMMON_SIZE = ABSOLUTE(segment_1936C0_SCOMMON_END - segment_1936C0_SCOMMON_START);

        segment_1936C0_BSS_START = .;
        build/us/asm/us/data/segment_1936C0.o(.bss*);
        segment_1936C0_BSS_END = .;
        segment_1936C0_BSS_SIZE = ABSOLUTE(segment_1936C0_BSS_END - segment_1936C0_BSS_START);

        segment_1936C0COMMON_START = .;
        build/us/asm/us/data/segment_1936C0.o(COMMON*);
        segment_1936C0COMMON_END = .;
        segment_1936C0COMMON_SIZE = ABSOLUTE(segment_1936C0COMMON_END - segment_1936C0COMMON_START);
    }

    segment_1936C0_noload_VRAM_END = .;
    segment_1936C0_noload_VRAM_SIZE = ABSOLUTE(segment_1936C0_noload_VRAM_END - segment_1936C0_noload_VRAM);

    __romPos += SIZEOF(.segment_1936C0);
    segment_1936C0_VRAM_END = .;
    segment_1936C0_VRAM_SIZE = ABSOLUTE(segment_1936C0_VRAM_END - segment_1936C0_VRAM);
    segment_1936C0_ROM_END = __romPos;
    segment_1936C0_ROM_SIZE = ABSOLUTE(segment_1936C0_ROM_END - segment_1936C0_ROM_START);

    segment_1937F0_ROM_START = __romPos;
    segment_1937F0_VRAM = ADDR(.segment_1937F0);
    segment_1937F0_alloc_VRAM = .;

    .segment_1937F0 : AT(segment_1937F0_ROM_START)
    {
        FILL(0x00000000);
        segment_1937F0_TEXT_START = .;
        build/us/asm/us/data/segment_1937F0.o(.text*);
        segment_1937F0_TEXT_END = .;
        segment_1937F0_TEXT_SIZE = ABSOLUTE(segment_1937F0_TEXT_END - segment_1937F0_TEXT_START);

        segment_1937F0_DATA_START = .;
        build/us/asm/us/data/segment_1937F0.o(.data*);
        segment_1937F0_DATA_END = .;
        segment_1937F0_DATA_SIZE = ABSOLUTE(segment_1937F0_DATA_END - segment_1937F0_DATA_START);

        segment_1937F0_RODATA_START = .;
        build/us/asm/us/data/segment_1937F0.o(.rodata*);
        segment_1937F0_RODATA_END = .;
        segment_1937F0_RODATA_SIZE = ABSOLUTE(segment_1937F0_RODATA_END - segment_1937F0_RODATA_START);

        segment_1937F0_SDATA_START = .;
        build/us/asm/us/data/segment_1937F0.o(.sdata*);
        segment_1937F0_SDATA_END = .;
        segment_1937F0_SDATA_SIZE = ABSOLUTE(segment_1937F0_SDATA_END - segment_1937F0_SDATA_START);
    }

    segment_1937F0_alloc_VRAM_END = .;
    segment_1937F0_alloc_VRAM_SIZE = ABSOLUTE(segment_1937F0_alloc_VRAM_END - segment_1937F0_alloc_VRAM);

    segment_1937F0_noload_VRAM = .;

    .segment_1937F0.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_1937F0_SBSS_START = .;
        build/us/asm/us/data/segment_1937F0.o(.sbss*);
        segment_1937F0_SBSS_END = .;
        segment_1937F0_SBSS_SIZE = ABSOLUTE(segment_1937F0_SBSS_END - segment_1937F0_SBSS_START);

        segment_1937F0_SCOMMON_START = .;
        build/us/asm/us/data/segment_1937F0.o(.scommon*);
        segment_1937F0_SCOMMON_END = .;
        segment_1937F0_SCOMMON_SIZE = ABSOLUTE(segment_1937F0_SCOMMON_END - segment_1937F0_SCOMMON_START);

        segment_1937F0_BSS_START = .;
        build/us/asm/us/data/segment_1937F0.o(.bss*);
        segment_1937F0_BSS_END = .;
        segment_1937F0_BSS_SIZE = ABSOLUTE(segment_1937F0_BSS_END - segment_1937F0_BSS_START);

        segment_1937F0COMMON_START = .;
        build/us/asm/us/data/segment_1937F0.o(COMMON*);
        segment_1937F0COMMON_END = .;
        segment_1937F0COMMON_SIZE = ABSOLUTE(segment_1937F0COMMON_END - segment_1937F0COMMON_START);
    }

    segment_1937F0_noload_VRAM_END = .;
    segment_1937F0_noload_VRAM_SIZE = ABSOLUTE(segment_1937F0_noload_VRAM_END - segment_1937F0_noload_VRAM);

    __romPos += SIZEOF(.segment_1937F0);
    segment_1937F0_VRAM_END = .;
    segment_1937F0_VRAM_SIZE = ABSOLUTE(segment_1937F0_VRAM_END - segment_1937F0_VRAM);
    segment_1937F0_ROM_END = __romPos;
    segment_1937F0_ROM_SIZE = ABSOLUTE(segment_1937F0_ROM_END - segment_1937F0_ROM_START);

    segment_194070_ROM_START = __romPos;
    segment_194070_VRAM = ADDR(.segment_194070);
    segment_194070_alloc_VRAM = .;

    .segment_194070 : AT(segment_194070_ROM_START)
    {
        FILL(0x00000000);
        segment_194070_TEXT_START = .;
        build/us/asm/us/data/segment_194070.o(.text*);
        segment_194070_TEXT_END = .;
        segment_194070_TEXT_SIZE = ABSOLUTE(segment_194070_TEXT_END - segment_194070_TEXT_START);

        segment_194070_DATA_START = .;
        build/us/asm/us/data/segment_194070.o(.data*);
        segment_194070_DATA_END = .;
        segment_194070_DATA_SIZE = ABSOLUTE(segment_194070_DATA_END - segment_194070_DATA_START);

        segment_194070_RODATA_START = .;
        build/us/asm/us/data/segment_194070.o(.rodata*);
        segment_194070_RODATA_END = .;
        segment_194070_RODATA_SIZE = ABSOLUTE(segment_194070_RODATA_END - segment_194070_RODATA_START);

        segment_194070_SDATA_START = .;
        build/us/asm/us/data/segment_194070.o(.sdata*);
        segment_194070_SDATA_END = .;
        segment_194070_SDATA_SIZE = ABSOLUTE(segment_194070_SDATA_END - segment_194070_SDATA_START);
    }

    segment_194070_alloc_VRAM_END = .;
    segment_194070_alloc_VRAM_SIZE = ABSOLUTE(segment_194070_alloc_VRAM_END - segment_194070_alloc_VRAM);

    segment_194070_noload_VRAM = .;

    .segment_194070.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_194070_SBSS_START = .;
        build/us/asm/us/data/segment_194070.o(.sbss*);
        segment_194070_SBSS_END = .;
        segment_194070_SBSS_SIZE = ABSOLUTE(segment_194070_SBSS_END - segment_194070_SBSS_START);

        segment_194070_SCOMMON_START = .;
        build/us/asm/us/data/segment_194070.o(.scommon*);
        segment_194070_SCOMMON_END = .;
        segment_194070_SCOMMON_SIZE = ABSOLUTE(segment_194070_SCOMMON_END - segment_194070_SCOMMON_START);

        segment_194070_BSS_START = .;
        build/us/asm/us/data/segment_194070.o(.bss*);
        segment_194070_BSS_END = .;
        segment_194070_BSS_SIZE = ABSOLUTE(segment_194070_BSS_END - segment_194070_BSS_START);

        segment_194070COMMON_START = .;
        build/us/asm/us/data/segment_194070.o(COMMON*);
        segment_194070COMMON_END = .;
        segment_194070COMMON_SIZE = ABSOLUTE(segment_194070COMMON_END - segment_194070COMMON_START);
    }

    segment_194070_noload_VRAM_END = .;
    segment_194070_noload_VRAM_SIZE = ABSOLUTE(segment_194070_noload_VRAM_END - segment_194070_noload_VRAM);

    __romPos += SIZEOF(.segment_194070);
    segment_194070_VRAM_END = .;
    segment_194070_VRAM_SIZE = ABSOLUTE(segment_194070_VRAM_END - segment_194070_VRAM);
    segment_194070_ROM_END = __romPos;
    segment_194070_ROM_SIZE = ABSOLUTE(segment_194070_ROM_END - segment_194070_ROM_START);

    segment_194150_ROM_START = __romPos;
    segment_194150_VRAM = ADDR(.segment_194150);
    segment_194150_alloc_VRAM = .;

    .segment_194150 : AT(segment_194150_ROM_START)
    {
        FILL(0x00000000);
        segment_194150_TEXT_START = .;
        build/us/asm/us/data/segment_194150.o(.text*);
        segment_194150_TEXT_END = .;
        segment_194150_TEXT_SIZE = ABSOLUTE(segment_194150_TEXT_END - segment_194150_TEXT_START);

        segment_194150_DATA_START = .;
        build/us/asm/us/data/segment_194150.o(.data*);
        segment_194150_DATA_END = .;
        segment_194150_DATA_SIZE = ABSOLUTE(segment_194150_DATA_END - segment_194150_DATA_START);

        segment_194150_RODATA_START = .;
        build/us/asm/us/data/segment_194150.o(.rodata*);
        segment_194150_RODATA_END = .;
        segment_194150_RODATA_SIZE = ABSOLUTE(segment_194150_RODATA_END - segment_194150_RODATA_START);

        segment_194150_SDATA_START = .;
        build/us/asm/us/data/segment_194150.o(.sdata*);
        segment_194150_SDATA_END = .;
        segment_194150_SDATA_SIZE = ABSOLUTE(segment_194150_SDATA_END - segment_194150_SDATA_START);
    }

    segment_194150_alloc_VRAM_END = .;
    segment_194150_alloc_VRAM_SIZE = ABSOLUTE(segment_194150_alloc_VRAM_END - segment_194150_alloc_VRAM);

    segment_194150_noload_VRAM = .;

    .segment_194150.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_194150_SBSS_START = .;
        build/us/asm/us/data/segment_194150.o(.sbss*);
        segment_194150_SBSS_END = .;
        segment_194150_SBSS_SIZE = ABSOLUTE(segment_194150_SBSS_END - segment_194150_SBSS_START);

        segment_194150_SCOMMON_START = .;
        build/us/asm/us/data/segment_194150.o(.scommon*);
        segment_194150_SCOMMON_END = .;
        segment_194150_SCOMMON_SIZE = ABSOLUTE(segment_194150_SCOMMON_END - segment_194150_SCOMMON_START);

        segment_194150_BSS_START = .;
        build/us/asm/us/data/segment_194150.o(.bss*);
        segment_194150_BSS_END = .;
        segment_194150_BSS_SIZE = ABSOLUTE(segment_194150_BSS_END - segment_194150_BSS_START);

        segment_194150COMMON_START = .;
        build/us/asm/us/data/segment_194150.o(COMMON*);
        segment_194150COMMON_END = .;
        segment_194150COMMON_SIZE = ABSOLUTE(segment_194150COMMON_END - segment_194150COMMON_START);
    }

    segment_194150_noload_VRAM_END = .;
    segment_194150_noload_VRAM_SIZE = ABSOLUTE(segment_194150_noload_VRAM_END - segment_194150_noload_VRAM);

    __romPos += SIZEOF(.segment_194150);
    segment_194150_VRAM_END = .;
    segment_194150_VRAM_SIZE = ABSOLUTE(segment_194150_VRAM_END - segment_194150_VRAM);
    segment_194150_ROM_END = __romPos;
    segment_194150_ROM_SIZE = ABSOLUTE(segment_194150_ROM_END - segment_194150_ROM_START);

    segment_194910_ROM_START = __romPos;
    segment_194910_VRAM = ADDR(.segment_194910);
    segment_194910_alloc_VRAM = .;

    .segment_194910 : AT(segment_194910_ROM_START)
    {
        FILL(0x00000000);
        segment_194910_TEXT_START = .;
        build/us/asm/us/data/segment_194910.o(.text*);
        segment_194910_TEXT_END = .;
        segment_194910_TEXT_SIZE = ABSOLUTE(segment_194910_TEXT_END - segment_194910_TEXT_START);

        segment_194910_DATA_START = .;
        build/us/asm/us/data/segment_194910.o(.data*);
        segment_194910_DATA_END = .;
        segment_194910_DATA_SIZE = ABSOLUTE(segment_194910_DATA_END - segment_194910_DATA_START);

        segment_194910_RODATA_START = .;
        build/us/asm/us/data/segment_194910.o(.rodata*);
        segment_194910_RODATA_END = .;
        segment_194910_RODATA_SIZE = ABSOLUTE(segment_194910_RODATA_END - segment_194910_RODATA_START);

        segment_194910_SDATA_START = .;
        build/us/asm/us/data/segment_194910.o(.sdata*);
        segment_194910_SDATA_END = .;
        segment_194910_SDATA_SIZE = ABSOLUTE(segment_194910_SDATA_END - segment_194910_SDATA_START);
    }

    segment_194910_alloc_VRAM_END = .;
    segment_194910_alloc_VRAM_SIZE = ABSOLUTE(segment_194910_alloc_VRAM_END - segment_194910_alloc_VRAM);

    segment_194910_noload_VRAM = .;

    .segment_194910.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_194910_SBSS_START = .;
        build/us/asm/us/data/segment_194910.o(.sbss*);
        segment_194910_SBSS_END = .;
        segment_194910_SBSS_SIZE = ABSOLUTE(segment_194910_SBSS_END - segment_194910_SBSS_START);

        segment_194910_SCOMMON_START = .;
        build/us/asm/us/data/segment_194910.o(.scommon*);
        segment_194910_SCOMMON_END = .;
        segment_194910_SCOMMON_SIZE = ABSOLUTE(segment_194910_SCOMMON_END - segment_194910_SCOMMON_START);

        segment_194910_BSS_START = .;
        build/us/asm/us/data/segment_194910.o(.bss*);
        segment_194910_BSS_END = .;
        segment_194910_BSS_SIZE = ABSOLUTE(segment_194910_BSS_END - segment_194910_BSS_START);

        segment_194910COMMON_START = .;
        build/us/asm/us/data/segment_194910.o(COMMON*);
        segment_194910COMMON_END = .;
        segment_194910COMMON_SIZE = ABSOLUTE(segment_194910COMMON_END - segment_194910COMMON_START);
    }

    segment_194910_noload_VRAM_END = .;
    segment_194910_noload_VRAM_SIZE = ABSOLUTE(segment_194910_noload_VRAM_END - segment_194910_noload_VRAM);

    __romPos += SIZEOF(.segment_194910);
    segment_194910_VRAM_END = .;
    segment_194910_VRAM_SIZE = ABSOLUTE(segment_194910_VRAM_END - segment_194910_VRAM);
    segment_194910_ROM_END = __romPos;
    segment_194910_ROM_SIZE = ABSOLUTE(segment_194910_ROM_END - segment_194910_ROM_START);

    segment_195290_ROM_START = __romPos;
    segment_195290_VRAM = ADDR(.segment_195290);
    segment_195290_alloc_VRAM = .;

    .segment_195290 : AT(segment_195290_ROM_START)
    {
        FILL(0x00000000);
        segment_195290_TEXT_START = .;
        build/us/asm/us/data/segment_195290.o(.text*);
        segment_195290_TEXT_END = .;
        segment_195290_TEXT_SIZE = ABSOLUTE(segment_195290_TEXT_END - segment_195290_TEXT_START);

        segment_195290_DATA_START = .;
        build/us/asm/us/data/segment_195290.o(.data*);
        segment_195290_DATA_END = .;
        segment_195290_DATA_SIZE = ABSOLUTE(segment_195290_DATA_END - segment_195290_DATA_START);

        segment_195290_RODATA_START = .;
        build/us/asm/us/data/segment_195290.o(.rodata*);
        segment_195290_RODATA_END = .;
        segment_195290_RODATA_SIZE = ABSOLUTE(segment_195290_RODATA_END - segment_195290_RODATA_START);

        segment_195290_SDATA_START = .;
        build/us/asm/us/data/segment_195290.o(.sdata*);
        segment_195290_SDATA_END = .;
        segment_195290_SDATA_SIZE = ABSOLUTE(segment_195290_SDATA_END - segment_195290_SDATA_START);
    }

    segment_195290_alloc_VRAM_END = .;
    segment_195290_alloc_VRAM_SIZE = ABSOLUTE(segment_195290_alloc_VRAM_END - segment_195290_alloc_VRAM);

    segment_195290_noload_VRAM = .;

    .segment_195290.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_195290_SBSS_START = .;
        build/us/asm/us/data/segment_195290.o(.sbss*);
        segment_195290_SBSS_END = .;
        segment_195290_SBSS_SIZE = ABSOLUTE(segment_195290_SBSS_END - segment_195290_SBSS_START);

        segment_195290_SCOMMON_START = .;
        build/us/asm/us/data/segment_195290.o(.scommon*);
        segment_195290_SCOMMON_END = .;
        segment_195290_SCOMMON_SIZE = ABSOLUTE(segment_195290_SCOMMON_END - segment_195290_SCOMMON_START);

        segment_195290_BSS_START = .;
        build/us/asm/us/data/segment_195290.o(.bss*);
        segment_195290_BSS_END = .;
        segment_195290_BSS_SIZE = ABSOLUTE(segment_195290_BSS_END - segment_195290_BSS_START);

        segment_195290COMMON_START = .;
        build/us/asm/us/data/segment_195290.o(COMMON*);
        segment_195290COMMON_END = .;
        segment_195290COMMON_SIZE = ABSOLUTE(segment_195290COMMON_END - segment_195290COMMON_START);
    }

    segment_195290_noload_VRAM_END = .;
    segment_195290_noload_VRAM_SIZE = ABSOLUTE(segment_195290_noload_VRAM_END - segment_195290_noload_VRAM);

    __romPos += SIZEOF(.segment_195290);
    segment_195290_VRAM_END = .;
    segment_195290_VRAM_SIZE = ABSOLUTE(segment_195290_VRAM_END - segment_195290_VRAM);
    segment_195290_ROM_END = __romPos;
    segment_195290_ROM_SIZE = ABSOLUTE(segment_195290_ROM_END - segment_195290_ROM_START);

    segment_game_etc_ROM_START = __romPos;
    segment_game_etc_VRAM = ADDR(.segment_game_etc);
    segment_game_etc_alloc_VRAM = .;

    .segment_game_etc : AT(segment_game_etc_ROM_START)
    {
        FILL(0x00000000);
        segment_game_etc_TEXT_START = .;
        build/us/asm/us/data/segment_game_etc.o(.text*);
        segment_game_etc_TEXT_END = .;
        segment_game_etc_TEXT_SIZE = ABSOLUTE(segment_game_etc_TEXT_END - segment_game_etc_TEXT_START);

        segment_game_etc_DATA_START = .;
        build/us/asm/us/data/segment_game_etc.o(.data*);
        segment_game_etc_DATA_END = .;
        segment_game_etc_DATA_SIZE = ABSOLUTE(segment_game_etc_DATA_END - segment_game_etc_DATA_START);

        segment_game_etc_RODATA_START = .;
        build/us/asm/us/data/segment_game_etc.o(.rodata*);
        segment_game_etc_RODATA_END = .;
        segment_game_etc_RODATA_SIZE = ABSOLUTE(segment_game_etc_RODATA_END - segment_game_etc_RODATA_START);

        segment_game_etc_SDATA_START = .;
        build/us/asm/us/data/segment_game_etc.o(.sdata*);
        segment_game_etc_SDATA_END = .;
        segment_game_etc_SDATA_SIZE = ABSOLUTE(segment_game_etc_SDATA_END - segment_game_etc_SDATA_START);
    }

    segment_game_etc_alloc_VRAM_END = .;
    segment_game_etc_alloc_VRAM_SIZE = ABSOLUTE(segment_game_etc_alloc_VRAM_END - segment_game_etc_alloc_VRAM);

    segment_game_etc_noload_VRAM = .;

    .segment_game_etc.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_game_etc_SBSS_START = .;
        build/us/asm/us/data/segment_game_etc.o(.sbss*);
        segment_game_etc_SBSS_END = .;
        segment_game_etc_SBSS_SIZE = ABSOLUTE(segment_game_etc_SBSS_END - segment_game_etc_SBSS_START);

        segment_game_etc_SCOMMON_START = .;
        build/us/asm/us/data/segment_game_etc.o(.scommon*);
        segment_game_etc_SCOMMON_END = .;
        segment_game_etc_SCOMMON_SIZE = ABSOLUTE(segment_game_etc_SCOMMON_END - segment_game_etc_SCOMMON_START);

        segment_game_etc_BSS_START = .;
        build/us/asm/us/data/segment_game_etc.o(.bss*);
        segment_game_etc_BSS_END = .;
        segment_game_etc_BSS_SIZE = ABSOLUTE(segment_game_etc_BSS_END - segment_game_etc_BSS_START);

        segment_game_etcCOMMON_START = .;
        build/us/asm/us/data/segment_game_etc.o(COMMON*);
        segment_game_etcCOMMON_END = .;
        segment_game_etcCOMMON_SIZE = ABSOLUTE(segment_game_etcCOMMON_END - segment_game_etcCOMMON_START);
    }

    segment_game_etc_noload_VRAM_END = .;
    segment_game_etc_noload_VRAM_SIZE = ABSOLUTE(segment_game_etc_noload_VRAM_END - segment_game_etc_noload_VRAM);

    __romPos += SIZEOF(.segment_game_etc);
    segment_game_etc_VRAM_END = .;
    segment_game_etc_VRAM_SIZE = ABSOLUTE(segment_game_etc_VRAM_END - segment_game_etc_VRAM);
    segment_game_etc_ROM_END = __romPos;
    segment_game_etc_ROM_SIZE = ABSOLUTE(segment_game_etc_ROM_END - segment_game_etc_ROM_START);

    segment_menu_bg_ROM_START = __romPos;
    segment_menu_bg_VRAM = ADDR(.segment_menu_bg);
    segment_menu_bg_alloc_VRAM = .;

    .segment_menu_bg : AT(segment_menu_bg_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_bg_TEXT_START = .;
        build/us/asm/us/data/segment_menu_bg.o(.text*);
        segment_menu_bg_TEXT_END = .;
        segment_menu_bg_TEXT_SIZE = ABSOLUTE(segment_menu_bg_TEXT_END - segment_menu_bg_TEXT_START);

        segment_menu_bg_DATA_START = .;
        build/us/asm/us/data/segment_menu_bg.o(.data*);
        segment_menu_bg_DATA_END = .;
        segment_menu_bg_DATA_SIZE = ABSOLUTE(segment_menu_bg_DATA_END - segment_menu_bg_DATA_START);

        segment_menu_bg_RODATA_START = .;
        build/us/asm/us/data/segment_menu_bg.o(.rodata*);
        segment_menu_bg_RODATA_END = .;
        segment_menu_bg_RODATA_SIZE = ABSOLUTE(segment_menu_bg_RODATA_END - segment_menu_bg_RODATA_START);

        segment_menu_bg_SDATA_START = .;
        build/us/asm/us/data/segment_menu_bg.o(.sdata*);
        segment_menu_bg_SDATA_END = .;
        segment_menu_bg_SDATA_SIZE = ABSOLUTE(segment_menu_bg_SDATA_END - segment_menu_bg_SDATA_START);
    }

    segment_menu_bg_alloc_VRAM_END = .;
    segment_menu_bg_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_bg_alloc_VRAM_END - segment_menu_bg_alloc_VRAM);

    segment_menu_bg_noload_VRAM = .;

    .segment_menu_bg.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_bg_SBSS_START = .;
        build/us/asm/us/data/segment_menu_bg.o(.sbss*);
        segment_menu_bg_SBSS_END = .;
        segment_menu_bg_SBSS_SIZE = ABSOLUTE(segment_menu_bg_SBSS_END - segment_menu_bg_SBSS_START);

        segment_menu_bg_SCOMMON_START = .;
        build/us/asm/us/data/segment_menu_bg.o(.scommon*);
        segment_menu_bg_SCOMMON_END = .;
        segment_menu_bg_SCOMMON_SIZE = ABSOLUTE(segment_menu_bg_SCOMMON_END - segment_menu_bg_SCOMMON_START);

        segment_menu_bg_BSS_START = .;
        build/us/asm/us/data/segment_menu_bg.o(.bss*);
        segment_menu_bg_BSS_END = .;
        segment_menu_bg_BSS_SIZE = ABSOLUTE(segment_menu_bg_BSS_END - segment_menu_bg_BSS_START);

        segment_menu_bgCOMMON_START = .;
        build/us/asm/us/data/segment_menu_bg.o(COMMON*);
        segment_menu_bgCOMMON_END = .;
        segment_menu_bgCOMMON_SIZE = ABSOLUTE(segment_menu_bgCOMMON_END - segment_menu_bgCOMMON_START);
    }

    segment_menu_bg_noload_VRAM_END = .;
    segment_menu_bg_noload_VRAM_SIZE = ABSOLUTE(segment_menu_bg_noload_VRAM_END - segment_menu_bg_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_bg);
    segment_menu_bg_VRAM_END = .;
    segment_menu_bg_VRAM_SIZE = ABSOLUTE(segment_menu_bg_VRAM_END - segment_menu_bg_VRAM);
    segment_menu_bg_ROM_END = __romPos;
    segment_menu_bg_ROM_SIZE = ABSOLUTE(segment_menu_bg_ROM_END - segment_menu_bg_ROM_START);

    segment_menu_bg2_ROM_START = __romPos;
    segment_menu_bg2_VRAM = ADDR(.segment_menu_bg2);
    segment_menu_bg2_alloc_VRAM = .;

    .segment_menu_bg2 : AT(segment_menu_bg2_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_bg2_TEXT_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(.text*);
        segment_menu_bg2_TEXT_END = .;
        segment_menu_bg2_TEXT_SIZE = ABSOLUTE(segment_menu_bg2_TEXT_END - segment_menu_bg2_TEXT_START);

        segment_menu_bg2_DATA_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(.data*);
        segment_menu_bg2_DATA_END = .;
        segment_menu_bg2_DATA_SIZE = ABSOLUTE(segment_menu_bg2_DATA_END - segment_menu_bg2_DATA_START);

        segment_menu_bg2_RODATA_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(.rodata*);
        segment_menu_bg2_RODATA_END = .;
        segment_menu_bg2_RODATA_SIZE = ABSOLUTE(segment_menu_bg2_RODATA_END - segment_menu_bg2_RODATA_START);

        segment_menu_bg2_SDATA_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(.sdata*);
        segment_menu_bg2_SDATA_END = .;
        segment_menu_bg2_SDATA_SIZE = ABSOLUTE(segment_menu_bg2_SDATA_END - segment_menu_bg2_SDATA_START);
    }

    segment_menu_bg2_alloc_VRAM_END = .;
    segment_menu_bg2_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_bg2_alloc_VRAM_END - segment_menu_bg2_alloc_VRAM);

    segment_menu_bg2_noload_VRAM = .;

    .segment_menu_bg2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_bg2_SBSS_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(.sbss*);
        segment_menu_bg2_SBSS_END = .;
        segment_menu_bg2_SBSS_SIZE = ABSOLUTE(segment_menu_bg2_SBSS_END - segment_menu_bg2_SBSS_START);

        segment_menu_bg2_SCOMMON_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(.scommon*);
        segment_menu_bg2_SCOMMON_END = .;
        segment_menu_bg2_SCOMMON_SIZE = ABSOLUTE(segment_menu_bg2_SCOMMON_END - segment_menu_bg2_SCOMMON_START);

        segment_menu_bg2_BSS_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(.bss*);
        segment_menu_bg2_BSS_END = .;
        segment_menu_bg2_BSS_SIZE = ABSOLUTE(segment_menu_bg2_BSS_END - segment_menu_bg2_BSS_START);

        segment_menu_bg2COMMON_START = .;
        build/us/asm/us/data/segment_menu_bg2.o(COMMON*);
        segment_menu_bg2COMMON_END = .;
        segment_menu_bg2COMMON_SIZE = ABSOLUTE(segment_menu_bg2COMMON_END - segment_menu_bg2COMMON_START);
    }

    segment_menu_bg2_noload_VRAM_END = .;
    segment_menu_bg2_noload_VRAM_SIZE = ABSOLUTE(segment_menu_bg2_noload_VRAM_END - segment_menu_bg2_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_bg2);
    segment_menu_bg2_VRAM_END = .;
    segment_menu_bg2_VRAM_SIZE = ABSOLUTE(segment_menu_bg2_VRAM_END - segment_menu_bg2_VRAM);
    segment_menu_bg2_ROM_END = __romPos;
    segment_menu_bg2_ROM_SIZE = ABSOLUTE(segment_menu_bg2_ROM_END - segment_menu_bg2_ROM_START);

    segment_coffee01_ROM_START = __romPos;
    segment_coffee01_VRAM = ADDR(.segment_coffee01);
    segment_coffee01_alloc_VRAM = .;

    .segment_coffee01 : AT(segment_coffee01_ROM_START)
    {
        FILL(0x00000000);
        segment_coffee01_TEXT_START = .;
        build/us/asm/us/data/segment_coffee01.o(.text*);
        segment_coffee01_TEXT_END = .;
        segment_coffee01_TEXT_SIZE = ABSOLUTE(segment_coffee01_TEXT_END - segment_coffee01_TEXT_START);

        segment_coffee01_DATA_START = .;
        build/us/asm/us/data/segment_coffee01.o(.data*);
        segment_coffee01_DATA_END = .;
        segment_coffee01_DATA_SIZE = ABSOLUTE(segment_coffee01_DATA_END - segment_coffee01_DATA_START);

        segment_coffee01_RODATA_START = .;
        build/us/asm/us/data/segment_coffee01.o(.rodata*);
        segment_coffee01_RODATA_END = .;
        segment_coffee01_RODATA_SIZE = ABSOLUTE(segment_coffee01_RODATA_END - segment_coffee01_RODATA_START);

        segment_coffee01_SDATA_START = .;
        build/us/asm/us/data/segment_coffee01.o(.sdata*);
        segment_coffee01_SDATA_END = .;
        segment_coffee01_SDATA_SIZE = ABSOLUTE(segment_coffee01_SDATA_END - segment_coffee01_SDATA_START);
    }

    segment_coffee01_alloc_VRAM_END = .;
    segment_coffee01_alloc_VRAM_SIZE = ABSOLUTE(segment_coffee01_alloc_VRAM_END - segment_coffee01_alloc_VRAM);

    segment_coffee01_noload_VRAM = .;

    .segment_coffee01.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_coffee01_SBSS_START = .;
        build/us/asm/us/data/segment_coffee01.o(.sbss*);
        segment_coffee01_SBSS_END = .;
        segment_coffee01_SBSS_SIZE = ABSOLUTE(segment_coffee01_SBSS_END - segment_coffee01_SBSS_START);

        segment_coffee01_SCOMMON_START = .;
        build/us/asm/us/data/segment_coffee01.o(.scommon*);
        segment_coffee01_SCOMMON_END = .;
        segment_coffee01_SCOMMON_SIZE = ABSOLUTE(segment_coffee01_SCOMMON_END - segment_coffee01_SCOMMON_START);

        segment_coffee01_BSS_START = .;
        build/us/asm/us/data/segment_coffee01.o(.bss*);
        segment_coffee01_BSS_END = .;
        segment_coffee01_BSS_SIZE = ABSOLUTE(segment_coffee01_BSS_END - segment_coffee01_BSS_START);

        segment_coffee01COMMON_START = .;
        build/us/asm/us/data/segment_coffee01.o(COMMON*);
        segment_coffee01COMMON_END = .;
        segment_coffee01COMMON_SIZE = ABSOLUTE(segment_coffee01COMMON_END - segment_coffee01COMMON_START);
    }

    segment_coffee01_noload_VRAM_END = .;
    segment_coffee01_noload_VRAM_SIZE = ABSOLUTE(segment_coffee01_noload_VRAM_END - segment_coffee01_noload_VRAM);

    __romPos += SIZEOF(.segment_coffee01);
    segment_coffee01_VRAM_END = .;
    segment_coffee01_VRAM_SIZE = ABSOLUTE(segment_coffee01_VRAM_END - segment_coffee01_VRAM);
    segment_coffee01_ROM_END = __romPos;
    segment_coffee01_ROM_SIZE = ABSOLUTE(segment_coffee01_ROM_END - segment_coffee01_ROM_START);

    segment_title_all_ROM_START = __romPos;
    segment_title_all_VRAM = ADDR(.segment_title_all);
    segment_title_all_alloc_VRAM = .;

    .segment_title_all : AT(segment_title_all_ROM_START)
    {
        FILL(0x00000000);
        segment_title_all_TEXT_START = .;
        build/us/asm/us/data/segment_title_all.o(.text*);
        segment_title_all_TEXT_END = .;
        segment_title_all_TEXT_SIZE = ABSOLUTE(segment_title_all_TEXT_END - segment_title_all_TEXT_START);

        segment_title_all_DATA_START = .;
        build/us/asm/us/data/segment_title_all.o(.data*);
        segment_title_all_DATA_END = .;
        segment_title_all_DATA_SIZE = ABSOLUTE(segment_title_all_DATA_END - segment_title_all_DATA_START);

        segment_title_all_RODATA_START = .;
        build/us/asm/us/data/segment_title_all.o(.rodata*);
        segment_title_all_RODATA_END = .;
        segment_title_all_RODATA_SIZE = ABSOLUTE(segment_title_all_RODATA_END - segment_title_all_RODATA_START);

        segment_title_all_SDATA_START = .;
        build/us/asm/us/data/segment_title_all.o(.sdata*);
        segment_title_all_SDATA_END = .;
        segment_title_all_SDATA_SIZE = ABSOLUTE(segment_title_all_SDATA_END - segment_title_all_SDATA_START);
    }

    segment_title_all_alloc_VRAM_END = .;
    segment_title_all_alloc_VRAM_SIZE = ABSOLUTE(segment_title_all_alloc_VRAM_END - segment_title_all_alloc_VRAM);

    segment_title_all_noload_VRAM = .;

    .segment_title_all.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_title_all_SBSS_START = .;
        build/us/asm/us/data/segment_title_all.o(.sbss*);
        segment_title_all_SBSS_END = .;
        segment_title_all_SBSS_SIZE = ABSOLUTE(segment_title_all_SBSS_END - segment_title_all_SBSS_START);

        segment_title_all_SCOMMON_START = .;
        build/us/asm/us/data/segment_title_all.o(.scommon*);
        segment_title_all_SCOMMON_END = .;
        segment_title_all_SCOMMON_SIZE = ABSOLUTE(segment_title_all_SCOMMON_END - segment_title_all_SCOMMON_START);

        segment_title_all_BSS_START = .;
        build/us/asm/us/data/segment_title_all.o(.bss*);
        segment_title_all_BSS_END = .;
        segment_title_all_BSS_SIZE = ABSOLUTE(segment_title_all_BSS_END - segment_title_all_BSS_START);

        segment_title_allCOMMON_START = .;
        build/us/asm/us/data/segment_title_all.o(COMMON*);
        segment_title_allCOMMON_END = .;
        segment_title_allCOMMON_SIZE = ABSOLUTE(segment_title_allCOMMON_END - segment_title_allCOMMON_START);
    }

    segment_title_all_noload_VRAM_END = .;
    segment_title_all_noload_VRAM_SIZE = ABSOLUTE(segment_title_all_noload_VRAM_END - segment_title_all_noload_VRAM);

    __romPos += SIZEOF(.segment_title_all);
    segment_title_all_VRAM_END = .;
    segment_title_all_VRAM_SIZE = ABSOLUTE(segment_title_all_VRAM_END - segment_title_all_VRAM);
    segment_title_all_ROM_END = __romPos;
    segment_title_all_ROM_SIZE = ABSOLUTE(segment_title_all_ROM_END - segment_title_all_ROM_START);

    segment_title_bmp_ROM_START = __romPos;
    segment_title_bmp_VRAM = ADDR(.segment_title_bmp);
    segment_title_bmp_alloc_VRAM = .;

    .segment_title_bmp : AT(segment_title_bmp_ROM_START)
    {
        FILL(0x00000000);
        segment_title_bmp_TEXT_START = .;
        build/us/asm/us/data/segment_title_bmp.o(.text*);
        segment_title_bmp_TEXT_END = .;
        segment_title_bmp_TEXT_SIZE = ABSOLUTE(segment_title_bmp_TEXT_END - segment_title_bmp_TEXT_START);

        segment_title_bmp_DATA_START = .;
        build/us/asm/us/data/segment_title_bmp.o(.data*);
        segment_title_bmp_DATA_END = .;
        segment_title_bmp_DATA_SIZE = ABSOLUTE(segment_title_bmp_DATA_END - segment_title_bmp_DATA_START);

        segment_title_bmp_RODATA_START = .;
        build/us/asm/us/data/segment_title_bmp.o(.rodata*);
        segment_title_bmp_RODATA_END = .;
        segment_title_bmp_RODATA_SIZE = ABSOLUTE(segment_title_bmp_RODATA_END - segment_title_bmp_RODATA_START);

        segment_title_bmp_SDATA_START = .;
        build/us/asm/us/data/segment_title_bmp.o(.sdata*);
        segment_title_bmp_SDATA_END = .;
        segment_title_bmp_SDATA_SIZE = ABSOLUTE(segment_title_bmp_SDATA_END - segment_title_bmp_SDATA_START);
    }

    segment_title_bmp_alloc_VRAM_END = .;
    segment_title_bmp_alloc_VRAM_SIZE = ABSOLUTE(segment_title_bmp_alloc_VRAM_END - segment_title_bmp_alloc_VRAM);

    segment_title_bmp_noload_VRAM = .;

    .segment_title_bmp.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_title_bmp_SBSS_START = .;
        build/us/asm/us/data/segment_title_bmp.o(.sbss*);
        segment_title_bmp_SBSS_END = .;
        segment_title_bmp_SBSS_SIZE = ABSOLUTE(segment_title_bmp_SBSS_END - segment_title_bmp_SBSS_START);

        segment_title_bmp_SCOMMON_START = .;
        build/us/asm/us/data/segment_title_bmp.o(.scommon*);
        segment_title_bmp_SCOMMON_END = .;
        segment_title_bmp_SCOMMON_SIZE = ABSOLUTE(segment_title_bmp_SCOMMON_END - segment_title_bmp_SCOMMON_START);

        segment_title_bmp_BSS_START = .;
        build/us/asm/us/data/segment_title_bmp.o(.bss*);
        segment_title_bmp_BSS_END = .;
        segment_title_bmp_BSS_SIZE = ABSOLUTE(segment_title_bmp_BSS_END - segment_title_bmp_BSS_START);

        segment_title_bmpCOMMON_START = .;
        build/us/asm/us/data/segment_title_bmp.o(COMMON*);
        segment_title_bmpCOMMON_END = .;
        segment_title_bmpCOMMON_SIZE = ABSOLUTE(segment_title_bmpCOMMON_END - segment_title_bmpCOMMON_START);
    }

    segment_title_bmp_noload_VRAM_END = .;
    segment_title_bmp_noload_VRAM_SIZE = ABSOLUTE(segment_title_bmp_noload_VRAM_END - segment_title_bmp_noload_VRAM);

    __romPos += SIZEOF(.segment_title_bmp);
    segment_title_bmp_VRAM_END = .;
    segment_title_bmp_VRAM_SIZE = ABSOLUTE(segment_title_bmp_VRAM_END - segment_title_bmp_VRAM);
    segment_title_bmp_ROM_END = __romPos;
    segment_title_bmp_ROM_SIZE = ABSOLUTE(segment_title_bmp_ROM_END - segment_title_bmp_ROM_START);

    segment_waku_ROM_START = __romPos;
    segment_waku_VRAM = ADDR(.segment_waku);
    segment_waku_alloc_VRAM = .;

    .segment_waku : AT(segment_waku_ROM_START)
    {
        FILL(0x00000000);
        segment_waku_TEXT_START = .;
        build/us/asm/us/data/segment_waku.o(.text*);
        segment_waku_TEXT_END = .;
        segment_waku_TEXT_SIZE = ABSOLUTE(segment_waku_TEXT_END - segment_waku_TEXT_START);

        segment_waku_DATA_START = .;
        build/us/asm/us/data/segment_waku.o(.data*);
        segment_waku_DATA_END = .;
        segment_waku_DATA_SIZE = ABSOLUTE(segment_waku_DATA_END - segment_waku_DATA_START);

        segment_waku_RODATA_START = .;
        build/us/asm/us/data/segment_waku.o(.rodata*);
        segment_waku_RODATA_END = .;
        segment_waku_RODATA_SIZE = ABSOLUTE(segment_waku_RODATA_END - segment_waku_RODATA_START);

        segment_waku_SDATA_START = .;
        build/us/asm/us/data/segment_waku.o(.sdata*);
        segment_waku_SDATA_END = .;
        segment_waku_SDATA_SIZE = ABSOLUTE(segment_waku_SDATA_END - segment_waku_SDATA_START);
    }

    segment_waku_alloc_VRAM_END = .;
    segment_waku_alloc_VRAM_SIZE = ABSOLUTE(segment_waku_alloc_VRAM_END - segment_waku_alloc_VRAM);

    segment_waku_noload_VRAM = .;

    .segment_waku.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_waku_SBSS_START = .;
        build/us/asm/us/data/segment_waku.o(.sbss*);
        segment_waku_SBSS_END = .;
        segment_waku_SBSS_SIZE = ABSOLUTE(segment_waku_SBSS_END - segment_waku_SBSS_START);

        segment_waku_SCOMMON_START = .;
        build/us/asm/us/data/segment_waku.o(.scommon*);
        segment_waku_SCOMMON_END = .;
        segment_waku_SCOMMON_SIZE = ABSOLUTE(segment_waku_SCOMMON_END - segment_waku_SCOMMON_START);

        segment_waku_BSS_START = .;
        build/us/asm/us/data/segment_waku.o(.bss*);
        segment_waku_BSS_END = .;
        segment_waku_BSS_SIZE = ABSOLUTE(segment_waku_BSS_END - segment_waku_BSS_START);

        segment_wakuCOMMON_START = .;
        build/us/asm/us/data/segment_waku.o(COMMON*);
        segment_wakuCOMMON_END = .;
        segment_wakuCOMMON_SIZE = ABSOLUTE(segment_wakuCOMMON_END - segment_wakuCOMMON_START);
    }

    segment_waku_noload_VRAM_END = .;
    segment_waku_noload_VRAM_SIZE = ABSOLUTE(segment_waku_noload_VRAM_END - segment_waku_noload_VRAM);

    __romPos += SIZEOF(.segment_waku);
    segment_waku_VRAM_END = .;
    segment_waku_VRAM_SIZE = ABSOLUTE(segment_waku_VRAM_END - segment_waku_VRAM);
    segment_waku_ROM_END = __romPos;
    segment_waku_ROM_SIZE = ABSOLUTE(segment_waku_ROM_END - segment_waku_ROM_START);

    segment_waku2_ROM_START = __romPos;
    segment_waku2_VRAM = ADDR(.segment_waku2);
    segment_waku2_alloc_VRAM = .;

    .segment_waku2 : AT(segment_waku2_ROM_START)
    {
        FILL(0x00000000);
        segment_waku2_TEXT_START = .;
        build/us/asm/us/data/segment_waku2.o(.text*);
        segment_waku2_TEXT_END = .;
        segment_waku2_TEXT_SIZE = ABSOLUTE(segment_waku2_TEXT_END - segment_waku2_TEXT_START);

        segment_waku2_DATA_START = .;
        build/us/asm/us/data/segment_waku2.o(.data*);
        segment_waku2_DATA_END = .;
        segment_waku2_DATA_SIZE = ABSOLUTE(segment_waku2_DATA_END - segment_waku2_DATA_START);

        segment_waku2_RODATA_START = .;
        build/us/asm/us/data/segment_waku2.o(.rodata*);
        segment_waku2_RODATA_END = .;
        segment_waku2_RODATA_SIZE = ABSOLUTE(segment_waku2_RODATA_END - segment_waku2_RODATA_START);

        segment_waku2_SDATA_START = .;
        build/us/asm/us/data/segment_waku2.o(.sdata*);
        segment_waku2_SDATA_END = .;
        segment_waku2_SDATA_SIZE = ABSOLUTE(segment_waku2_SDATA_END - segment_waku2_SDATA_START);
    }

    segment_waku2_alloc_VRAM_END = .;
    segment_waku2_alloc_VRAM_SIZE = ABSOLUTE(segment_waku2_alloc_VRAM_END - segment_waku2_alloc_VRAM);

    segment_waku2_noload_VRAM = .;

    .segment_waku2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_waku2_SBSS_START = .;
        build/us/asm/us/data/segment_waku2.o(.sbss*);
        segment_waku2_SBSS_END = .;
        segment_waku2_SBSS_SIZE = ABSOLUTE(segment_waku2_SBSS_END - segment_waku2_SBSS_START);

        segment_waku2_SCOMMON_START = .;
        build/us/asm/us/data/segment_waku2.o(.scommon*);
        segment_waku2_SCOMMON_END = .;
        segment_waku2_SCOMMON_SIZE = ABSOLUTE(segment_waku2_SCOMMON_END - segment_waku2_SCOMMON_START);

        segment_waku2_BSS_START = .;
        build/us/asm/us/data/segment_waku2.o(.bss*);
        segment_waku2_BSS_END = .;
        segment_waku2_BSS_SIZE = ABSOLUTE(segment_waku2_BSS_END - segment_waku2_BSS_START);

        segment_waku2COMMON_START = .;
        build/us/asm/us/data/segment_waku2.o(COMMON*);
        segment_waku2COMMON_END = .;
        segment_waku2COMMON_SIZE = ABSOLUTE(segment_waku2COMMON_END - segment_waku2COMMON_START);
    }

    segment_waku2_noload_VRAM_END = .;
    segment_waku2_noload_VRAM_SIZE = ABSOLUTE(segment_waku2_noload_VRAM_END - segment_waku2_noload_VRAM);

    __romPos += SIZEOF(.segment_waku2);
    segment_waku2_VRAM_END = .;
    segment_waku2_VRAM_SIZE = ABSOLUTE(segment_waku2_VRAM_END - segment_waku2_VRAM);
    segment_waku2_ROM_END = __romPos;
    segment_waku2_ROM_SIZE = ABSOLUTE(segment_waku2_ROM_END - segment_waku2_ROM_START);

    segment_story_bg01_ROM_START = __romPos;
    segment_story_bg01_VRAM = ADDR(.segment_story_bg01);
    segment_story_bg01_alloc_VRAM = .;

    .segment_story_bg01 : AT(segment_story_bg01_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg01_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg01.o(.text*);
        segment_story_bg01_TEXT_END = .;
        segment_story_bg01_TEXT_SIZE = ABSOLUTE(segment_story_bg01_TEXT_END - segment_story_bg01_TEXT_START);

        segment_story_bg01_DATA_START = .;
        build/us/asm/us/data/segment_story_bg01.o(.data*);
        segment_story_bg01_DATA_END = .;
        segment_story_bg01_DATA_SIZE = ABSOLUTE(segment_story_bg01_DATA_END - segment_story_bg01_DATA_START);

        segment_story_bg01_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg01.o(.rodata*);
        segment_story_bg01_RODATA_END = .;
        segment_story_bg01_RODATA_SIZE = ABSOLUTE(segment_story_bg01_RODATA_END - segment_story_bg01_RODATA_START);

        segment_story_bg01_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg01.o(.sdata*);
        segment_story_bg01_SDATA_END = .;
        segment_story_bg01_SDATA_SIZE = ABSOLUTE(segment_story_bg01_SDATA_END - segment_story_bg01_SDATA_START);
    }

    segment_story_bg01_alloc_VRAM_END = .;
    segment_story_bg01_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg01_alloc_VRAM_END - segment_story_bg01_alloc_VRAM);

    segment_story_bg01_noload_VRAM = .;

    .segment_story_bg01.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg01_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg01.o(.sbss*);
        segment_story_bg01_SBSS_END = .;
        segment_story_bg01_SBSS_SIZE = ABSOLUTE(segment_story_bg01_SBSS_END - segment_story_bg01_SBSS_START);

        segment_story_bg01_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg01.o(.scommon*);
        segment_story_bg01_SCOMMON_END = .;
        segment_story_bg01_SCOMMON_SIZE = ABSOLUTE(segment_story_bg01_SCOMMON_END - segment_story_bg01_SCOMMON_START);

        segment_story_bg01_BSS_START = .;
        build/us/asm/us/data/segment_story_bg01.o(.bss*);
        segment_story_bg01_BSS_END = .;
        segment_story_bg01_BSS_SIZE = ABSOLUTE(segment_story_bg01_BSS_END - segment_story_bg01_BSS_START);

        segment_story_bg01COMMON_START = .;
        build/us/asm/us/data/segment_story_bg01.o(COMMON*);
        segment_story_bg01COMMON_END = .;
        segment_story_bg01COMMON_SIZE = ABSOLUTE(segment_story_bg01COMMON_END - segment_story_bg01COMMON_START);
    }

    segment_story_bg01_noload_VRAM_END = .;
    segment_story_bg01_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg01_noload_VRAM_END - segment_story_bg01_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg01);
    segment_story_bg01_VRAM_END = .;
    segment_story_bg01_VRAM_SIZE = ABSOLUTE(segment_story_bg01_VRAM_END - segment_story_bg01_VRAM);
    segment_story_bg01_ROM_END = __romPos;
    segment_story_bg01_ROM_SIZE = ABSOLUTE(segment_story_bg01_ROM_END - segment_story_bg01_ROM_START);

    segment_story_bg02_ROM_START = __romPos;
    segment_story_bg02_VRAM = ADDR(.segment_story_bg02);
    segment_story_bg02_alloc_VRAM = .;

    .segment_story_bg02 : AT(segment_story_bg02_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg02_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg02.o(.text*);
        segment_story_bg02_TEXT_END = .;
        segment_story_bg02_TEXT_SIZE = ABSOLUTE(segment_story_bg02_TEXT_END - segment_story_bg02_TEXT_START);

        segment_story_bg02_DATA_START = .;
        build/us/asm/us/data/segment_story_bg02.o(.data*);
        segment_story_bg02_DATA_END = .;
        segment_story_bg02_DATA_SIZE = ABSOLUTE(segment_story_bg02_DATA_END - segment_story_bg02_DATA_START);

        segment_story_bg02_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg02.o(.rodata*);
        segment_story_bg02_RODATA_END = .;
        segment_story_bg02_RODATA_SIZE = ABSOLUTE(segment_story_bg02_RODATA_END - segment_story_bg02_RODATA_START);

        segment_story_bg02_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg02.o(.sdata*);
        segment_story_bg02_SDATA_END = .;
        segment_story_bg02_SDATA_SIZE = ABSOLUTE(segment_story_bg02_SDATA_END - segment_story_bg02_SDATA_START);
    }

    segment_story_bg02_alloc_VRAM_END = .;
    segment_story_bg02_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg02_alloc_VRAM_END - segment_story_bg02_alloc_VRAM);

    segment_story_bg02_noload_VRAM = .;

    .segment_story_bg02.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg02_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg02.o(.sbss*);
        segment_story_bg02_SBSS_END = .;
        segment_story_bg02_SBSS_SIZE = ABSOLUTE(segment_story_bg02_SBSS_END - segment_story_bg02_SBSS_START);

        segment_story_bg02_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg02.o(.scommon*);
        segment_story_bg02_SCOMMON_END = .;
        segment_story_bg02_SCOMMON_SIZE = ABSOLUTE(segment_story_bg02_SCOMMON_END - segment_story_bg02_SCOMMON_START);

        segment_story_bg02_BSS_START = .;
        build/us/asm/us/data/segment_story_bg02.o(.bss*);
        segment_story_bg02_BSS_END = .;
        segment_story_bg02_BSS_SIZE = ABSOLUTE(segment_story_bg02_BSS_END - segment_story_bg02_BSS_START);

        segment_story_bg02COMMON_START = .;
        build/us/asm/us/data/segment_story_bg02.o(COMMON*);
        segment_story_bg02COMMON_END = .;
        segment_story_bg02COMMON_SIZE = ABSOLUTE(segment_story_bg02COMMON_END - segment_story_bg02COMMON_START);
    }

    segment_story_bg02_noload_VRAM_END = .;
    segment_story_bg02_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg02_noload_VRAM_END - segment_story_bg02_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg02);
    segment_story_bg02_VRAM_END = .;
    segment_story_bg02_VRAM_SIZE = ABSOLUTE(segment_story_bg02_VRAM_END - segment_story_bg02_VRAM);
    segment_story_bg02_ROM_END = __romPos;
    segment_story_bg02_ROM_SIZE = ABSOLUTE(segment_story_bg02_ROM_END - segment_story_bg02_ROM_START);

    segment_story_bg03_ROM_START = __romPos;
    segment_story_bg03_VRAM = ADDR(.segment_story_bg03);
    segment_story_bg03_alloc_VRAM = .;

    .segment_story_bg03 : AT(segment_story_bg03_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg03_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg03.o(.text*);
        segment_story_bg03_TEXT_END = .;
        segment_story_bg03_TEXT_SIZE = ABSOLUTE(segment_story_bg03_TEXT_END - segment_story_bg03_TEXT_START);

        segment_story_bg03_DATA_START = .;
        build/us/asm/us/data/segment_story_bg03.o(.data*);
        segment_story_bg03_DATA_END = .;
        segment_story_bg03_DATA_SIZE = ABSOLUTE(segment_story_bg03_DATA_END - segment_story_bg03_DATA_START);

        segment_story_bg03_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg03.o(.rodata*);
        segment_story_bg03_RODATA_END = .;
        segment_story_bg03_RODATA_SIZE = ABSOLUTE(segment_story_bg03_RODATA_END - segment_story_bg03_RODATA_START);

        segment_story_bg03_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg03.o(.sdata*);
        segment_story_bg03_SDATA_END = .;
        segment_story_bg03_SDATA_SIZE = ABSOLUTE(segment_story_bg03_SDATA_END - segment_story_bg03_SDATA_START);
    }

    segment_story_bg03_alloc_VRAM_END = .;
    segment_story_bg03_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg03_alloc_VRAM_END - segment_story_bg03_alloc_VRAM);

    segment_story_bg03_noload_VRAM = .;

    .segment_story_bg03.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg03_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg03.o(.sbss*);
        segment_story_bg03_SBSS_END = .;
        segment_story_bg03_SBSS_SIZE = ABSOLUTE(segment_story_bg03_SBSS_END - segment_story_bg03_SBSS_START);

        segment_story_bg03_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg03.o(.scommon*);
        segment_story_bg03_SCOMMON_END = .;
        segment_story_bg03_SCOMMON_SIZE = ABSOLUTE(segment_story_bg03_SCOMMON_END - segment_story_bg03_SCOMMON_START);

        segment_story_bg03_BSS_START = .;
        build/us/asm/us/data/segment_story_bg03.o(.bss*);
        segment_story_bg03_BSS_END = .;
        segment_story_bg03_BSS_SIZE = ABSOLUTE(segment_story_bg03_BSS_END - segment_story_bg03_BSS_START);

        segment_story_bg03COMMON_START = .;
        build/us/asm/us/data/segment_story_bg03.o(COMMON*);
        segment_story_bg03COMMON_END = .;
        segment_story_bg03COMMON_SIZE = ABSOLUTE(segment_story_bg03COMMON_END - segment_story_bg03COMMON_START);
    }

    segment_story_bg03_noload_VRAM_END = .;
    segment_story_bg03_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg03_noload_VRAM_END - segment_story_bg03_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg03);
    segment_story_bg03_VRAM_END = .;
    segment_story_bg03_VRAM_SIZE = ABSOLUTE(segment_story_bg03_VRAM_END - segment_story_bg03_VRAM);
    segment_story_bg03_ROM_END = __romPos;
    segment_story_bg03_ROM_SIZE = ABSOLUTE(segment_story_bg03_ROM_END - segment_story_bg03_ROM_START);

    segment_story_bg04_ROM_START = __romPos;
    segment_story_bg04_VRAM = ADDR(.segment_story_bg04);
    segment_story_bg04_alloc_VRAM = .;

    .segment_story_bg04 : AT(segment_story_bg04_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg04_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg04.o(.text*);
        segment_story_bg04_TEXT_END = .;
        segment_story_bg04_TEXT_SIZE = ABSOLUTE(segment_story_bg04_TEXT_END - segment_story_bg04_TEXT_START);

        segment_story_bg04_DATA_START = .;
        build/us/asm/us/data/segment_story_bg04.o(.data*);
        segment_story_bg04_DATA_END = .;
        segment_story_bg04_DATA_SIZE = ABSOLUTE(segment_story_bg04_DATA_END - segment_story_bg04_DATA_START);

        segment_story_bg04_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg04.o(.rodata*);
        segment_story_bg04_RODATA_END = .;
        segment_story_bg04_RODATA_SIZE = ABSOLUTE(segment_story_bg04_RODATA_END - segment_story_bg04_RODATA_START);

        segment_story_bg04_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg04.o(.sdata*);
        segment_story_bg04_SDATA_END = .;
        segment_story_bg04_SDATA_SIZE = ABSOLUTE(segment_story_bg04_SDATA_END - segment_story_bg04_SDATA_START);
    }

    segment_story_bg04_alloc_VRAM_END = .;
    segment_story_bg04_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg04_alloc_VRAM_END - segment_story_bg04_alloc_VRAM);

    segment_story_bg04_noload_VRAM = .;

    .segment_story_bg04.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg04_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg04.o(.sbss*);
        segment_story_bg04_SBSS_END = .;
        segment_story_bg04_SBSS_SIZE = ABSOLUTE(segment_story_bg04_SBSS_END - segment_story_bg04_SBSS_START);

        segment_story_bg04_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg04.o(.scommon*);
        segment_story_bg04_SCOMMON_END = .;
        segment_story_bg04_SCOMMON_SIZE = ABSOLUTE(segment_story_bg04_SCOMMON_END - segment_story_bg04_SCOMMON_START);

        segment_story_bg04_BSS_START = .;
        build/us/asm/us/data/segment_story_bg04.o(.bss*);
        segment_story_bg04_BSS_END = .;
        segment_story_bg04_BSS_SIZE = ABSOLUTE(segment_story_bg04_BSS_END - segment_story_bg04_BSS_START);

        segment_story_bg04COMMON_START = .;
        build/us/asm/us/data/segment_story_bg04.o(COMMON*);
        segment_story_bg04COMMON_END = .;
        segment_story_bg04COMMON_SIZE = ABSOLUTE(segment_story_bg04COMMON_END - segment_story_bg04COMMON_START);
    }

    segment_story_bg04_noload_VRAM_END = .;
    segment_story_bg04_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg04_noload_VRAM_END - segment_story_bg04_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg04);
    segment_story_bg04_VRAM_END = .;
    segment_story_bg04_VRAM_SIZE = ABSOLUTE(segment_story_bg04_VRAM_END - segment_story_bg04_VRAM);
    segment_story_bg04_ROM_END = __romPos;
    segment_story_bg04_ROM_SIZE = ABSOLUTE(segment_story_bg04_ROM_END - segment_story_bg04_ROM_START);

    segment_story_bg05_ROM_START = __romPos;
    segment_story_bg05_VRAM = ADDR(.segment_story_bg05);
    segment_story_bg05_alloc_VRAM = .;

    .segment_story_bg05 : AT(segment_story_bg05_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg05_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg05.o(.text*);
        segment_story_bg05_TEXT_END = .;
        segment_story_bg05_TEXT_SIZE = ABSOLUTE(segment_story_bg05_TEXT_END - segment_story_bg05_TEXT_START);

        segment_story_bg05_DATA_START = .;
        build/us/asm/us/data/segment_story_bg05.o(.data*);
        segment_story_bg05_DATA_END = .;
        segment_story_bg05_DATA_SIZE = ABSOLUTE(segment_story_bg05_DATA_END - segment_story_bg05_DATA_START);

        segment_story_bg05_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg05.o(.rodata*);
        segment_story_bg05_RODATA_END = .;
        segment_story_bg05_RODATA_SIZE = ABSOLUTE(segment_story_bg05_RODATA_END - segment_story_bg05_RODATA_START);

        segment_story_bg05_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg05.o(.sdata*);
        segment_story_bg05_SDATA_END = .;
        segment_story_bg05_SDATA_SIZE = ABSOLUTE(segment_story_bg05_SDATA_END - segment_story_bg05_SDATA_START);
    }

    segment_story_bg05_alloc_VRAM_END = .;
    segment_story_bg05_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg05_alloc_VRAM_END - segment_story_bg05_alloc_VRAM);

    segment_story_bg05_noload_VRAM = .;

    .segment_story_bg05.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg05_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg05.o(.sbss*);
        segment_story_bg05_SBSS_END = .;
        segment_story_bg05_SBSS_SIZE = ABSOLUTE(segment_story_bg05_SBSS_END - segment_story_bg05_SBSS_START);

        segment_story_bg05_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg05.o(.scommon*);
        segment_story_bg05_SCOMMON_END = .;
        segment_story_bg05_SCOMMON_SIZE = ABSOLUTE(segment_story_bg05_SCOMMON_END - segment_story_bg05_SCOMMON_START);

        segment_story_bg05_BSS_START = .;
        build/us/asm/us/data/segment_story_bg05.o(.bss*);
        segment_story_bg05_BSS_END = .;
        segment_story_bg05_BSS_SIZE = ABSOLUTE(segment_story_bg05_BSS_END - segment_story_bg05_BSS_START);

        segment_story_bg05COMMON_START = .;
        build/us/asm/us/data/segment_story_bg05.o(COMMON*);
        segment_story_bg05COMMON_END = .;
        segment_story_bg05COMMON_SIZE = ABSOLUTE(segment_story_bg05COMMON_END - segment_story_bg05COMMON_START);
    }

    segment_story_bg05_noload_VRAM_END = .;
    segment_story_bg05_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg05_noload_VRAM_END - segment_story_bg05_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg05);
    segment_story_bg05_VRAM_END = .;
    segment_story_bg05_VRAM_SIZE = ABSOLUTE(segment_story_bg05_VRAM_END - segment_story_bg05_VRAM);
    segment_story_bg05_ROM_END = __romPos;
    segment_story_bg05_ROM_SIZE = ABSOLUTE(segment_story_bg05_ROM_END - segment_story_bg05_ROM_START);

    segment_story_bg07_ROM_START = __romPos;
    segment_story_bg07_VRAM = ADDR(.segment_story_bg07);
    segment_story_bg07_alloc_VRAM = .;

    .segment_story_bg07 : AT(segment_story_bg07_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg07_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg07.o(.text*);
        segment_story_bg07_TEXT_END = .;
        segment_story_bg07_TEXT_SIZE = ABSOLUTE(segment_story_bg07_TEXT_END - segment_story_bg07_TEXT_START);

        segment_story_bg07_DATA_START = .;
        build/us/asm/us/data/segment_story_bg07.o(.data*);
        segment_story_bg07_DATA_END = .;
        segment_story_bg07_DATA_SIZE = ABSOLUTE(segment_story_bg07_DATA_END - segment_story_bg07_DATA_START);

        segment_story_bg07_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg07.o(.rodata*);
        segment_story_bg07_RODATA_END = .;
        segment_story_bg07_RODATA_SIZE = ABSOLUTE(segment_story_bg07_RODATA_END - segment_story_bg07_RODATA_START);

        segment_story_bg07_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg07.o(.sdata*);
        segment_story_bg07_SDATA_END = .;
        segment_story_bg07_SDATA_SIZE = ABSOLUTE(segment_story_bg07_SDATA_END - segment_story_bg07_SDATA_START);
    }

    segment_story_bg07_alloc_VRAM_END = .;
    segment_story_bg07_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg07_alloc_VRAM_END - segment_story_bg07_alloc_VRAM);

    segment_story_bg07_noload_VRAM = .;

    .segment_story_bg07.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg07_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg07.o(.sbss*);
        segment_story_bg07_SBSS_END = .;
        segment_story_bg07_SBSS_SIZE = ABSOLUTE(segment_story_bg07_SBSS_END - segment_story_bg07_SBSS_START);

        segment_story_bg07_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg07.o(.scommon*);
        segment_story_bg07_SCOMMON_END = .;
        segment_story_bg07_SCOMMON_SIZE = ABSOLUTE(segment_story_bg07_SCOMMON_END - segment_story_bg07_SCOMMON_START);

        segment_story_bg07_BSS_START = .;
        build/us/asm/us/data/segment_story_bg07.o(.bss*);
        segment_story_bg07_BSS_END = .;
        segment_story_bg07_BSS_SIZE = ABSOLUTE(segment_story_bg07_BSS_END - segment_story_bg07_BSS_START);

        segment_story_bg07COMMON_START = .;
        build/us/asm/us/data/segment_story_bg07.o(COMMON*);
        segment_story_bg07COMMON_END = .;
        segment_story_bg07COMMON_SIZE = ABSOLUTE(segment_story_bg07COMMON_END - segment_story_bg07COMMON_START);
    }

    segment_story_bg07_noload_VRAM_END = .;
    segment_story_bg07_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg07_noload_VRAM_END - segment_story_bg07_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg07);
    segment_story_bg07_VRAM_END = .;
    segment_story_bg07_VRAM_SIZE = ABSOLUTE(segment_story_bg07_VRAM_END - segment_story_bg07_VRAM);
    segment_story_bg07_ROM_END = __romPos;
    segment_story_bg07_ROM_SIZE = ABSOLUTE(segment_story_bg07_ROM_END - segment_story_bg07_ROM_START);

    segment_story_bg08_ROM_START = __romPos;
    segment_story_bg08_VRAM = ADDR(.segment_story_bg08);
    segment_story_bg08_alloc_VRAM = .;

    .segment_story_bg08 : AT(segment_story_bg08_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg08_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg08.o(.text*);
        segment_story_bg08_TEXT_END = .;
        segment_story_bg08_TEXT_SIZE = ABSOLUTE(segment_story_bg08_TEXT_END - segment_story_bg08_TEXT_START);

        segment_story_bg08_DATA_START = .;
        build/us/asm/us/data/segment_story_bg08.o(.data*);
        segment_story_bg08_DATA_END = .;
        segment_story_bg08_DATA_SIZE = ABSOLUTE(segment_story_bg08_DATA_END - segment_story_bg08_DATA_START);

        segment_story_bg08_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg08.o(.rodata*);
        segment_story_bg08_RODATA_END = .;
        segment_story_bg08_RODATA_SIZE = ABSOLUTE(segment_story_bg08_RODATA_END - segment_story_bg08_RODATA_START);

        segment_story_bg08_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg08.o(.sdata*);
        segment_story_bg08_SDATA_END = .;
        segment_story_bg08_SDATA_SIZE = ABSOLUTE(segment_story_bg08_SDATA_END - segment_story_bg08_SDATA_START);
    }

    segment_story_bg08_alloc_VRAM_END = .;
    segment_story_bg08_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg08_alloc_VRAM_END - segment_story_bg08_alloc_VRAM);

    segment_story_bg08_noload_VRAM = .;

    .segment_story_bg08.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg08_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg08.o(.sbss*);
        segment_story_bg08_SBSS_END = .;
        segment_story_bg08_SBSS_SIZE = ABSOLUTE(segment_story_bg08_SBSS_END - segment_story_bg08_SBSS_START);

        segment_story_bg08_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg08.o(.scommon*);
        segment_story_bg08_SCOMMON_END = .;
        segment_story_bg08_SCOMMON_SIZE = ABSOLUTE(segment_story_bg08_SCOMMON_END - segment_story_bg08_SCOMMON_START);

        segment_story_bg08_BSS_START = .;
        build/us/asm/us/data/segment_story_bg08.o(.bss*);
        segment_story_bg08_BSS_END = .;
        segment_story_bg08_BSS_SIZE = ABSOLUTE(segment_story_bg08_BSS_END - segment_story_bg08_BSS_START);

        segment_story_bg08COMMON_START = .;
        build/us/asm/us/data/segment_story_bg08.o(COMMON*);
        segment_story_bg08COMMON_END = .;
        segment_story_bg08COMMON_SIZE = ABSOLUTE(segment_story_bg08COMMON_END - segment_story_bg08COMMON_START);
    }

    segment_story_bg08_noload_VRAM_END = .;
    segment_story_bg08_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg08_noload_VRAM_END - segment_story_bg08_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg08);
    segment_story_bg08_VRAM_END = .;
    segment_story_bg08_VRAM_SIZE = ABSOLUTE(segment_story_bg08_VRAM_END - segment_story_bg08_VRAM);
    segment_story_bg08_ROM_END = __romPos;
    segment_story_bg08_ROM_SIZE = ABSOLUTE(segment_story_bg08_ROM_END - segment_story_bg08_ROM_START);

    segment_story_bg09_ROM_START = __romPos;
    segment_story_bg09_VRAM = ADDR(.segment_story_bg09);
    segment_story_bg09_alloc_VRAM = .;

    .segment_story_bg09 : AT(segment_story_bg09_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg09_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg09.o(.text*);
        segment_story_bg09_TEXT_END = .;
        segment_story_bg09_TEXT_SIZE = ABSOLUTE(segment_story_bg09_TEXT_END - segment_story_bg09_TEXT_START);

        segment_story_bg09_DATA_START = .;
        build/us/asm/us/data/segment_story_bg09.o(.data*);
        segment_story_bg09_DATA_END = .;
        segment_story_bg09_DATA_SIZE = ABSOLUTE(segment_story_bg09_DATA_END - segment_story_bg09_DATA_START);

        segment_story_bg09_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg09.o(.rodata*);
        segment_story_bg09_RODATA_END = .;
        segment_story_bg09_RODATA_SIZE = ABSOLUTE(segment_story_bg09_RODATA_END - segment_story_bg09_RODATA_START);

        segment_story_bg09_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg09.o(.sdata*);
        segment_story_bg09_SDATA_END = .;
        segment_story_bg09_SDATA_SIZE = ABSOLUTE(segment_story_bg09_SDATA_END - segment_story_bg09_SDATA_START);
    }

    segment_story_bg09_alloc_VRAM_END = .;
    segment_story_bg09_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg09_alloc_VRAM_END - segment_story_bg09_alloc_VRAM);

    segment_story_bg09_noload_VRAM = .;

    .segment_story_bg09.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg09_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg09.o(.sbss*);
        segment_story_bg09_SBSS_END = .;
        segment_story_bg09_SBSS_SIZE = ABSOLUTE(segment_story_bg09_SBSS_END - segment_story_bg09_SBSS_START);

        segment_story_bg09_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg09.o(.scommon*);
        segment_story_bg09_SCOMMON_END = .;
        segment_story_bg09_SCOMMON_SIZE = ABSOLUTE(segment_story_bg09_SCOMMON_END - segment_story_bg09_SCOMMON_START);

        segment_story_bg09_BSS_START = .;
        build/us/asm/us/data/segment_story_bg09.o(.bss*);
        segment_story_bg09_BSS_END = .;
        segment_story_bg09_BSS_SIZE = ABSOLUTE(segment_story_bg09_BSS_END - segment_story_bg09_BSS_START);

        segment_story_bg09COMMON_START = .;
        build/us/asm/us/data/segment_story_bg09.o(COMMON*);
        segment_story_bg09COMMON_END = .;
        segment_story_bg09COMMON_SIZE = ABSOLUTE(segment_story_bg09COMMON_END - segment_story_bg09COMMON_START);
    }

    segment_story_bg09_noload_VRAM_END = .;
    segment_story_bg09_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg09_noload_VRAM_END - segment_story_bg09_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg09);
    segment_story_bg09_VRAM_END = .;
    segment_story_bg09_VRAM_SIZE = ABSOLUTE(segment_story_bg09_VRAM_END - segment_story_bg09_VRAM);
    segment_story_bg09_ROM_END = __romPos;
    segment_story_bg09_ROM_SIZE = ABSOLUTE(segment_story_bg09_ROM_END - segment_story_bg09_ROM_START);

    segment_story_bg10_ROM_START = __romPos;
    segment_story_bg10_VRAM = ADDR(.segment_story_bg10);
    segment_story_bg10_alloc_VRAM = .;

    .segment_story_bg10 : AT(segment_story_bg10_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg10_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg10.o(.text*);
        segment_story_bg10_TEXT_END = .;
        segment_story_bg10_TEXT_SIZE = ABSOLUTE(segment_story_bg10_TEXT_END - segment_story_bg10_TEXT_START);

        segment_story_bg10_DATA_START = .;
        build/us/asm/us/data/segment_story_bg10.o(.data*);
        segment_story_bg10_DATA_END = .;
        segment_story_bg10_DATA_SIZE = ABSOLUTE(segment_story_bg10_DATA_END - segment_story_bg10_DATA_START);

        segment_story_bg10_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg10.o(.rodata*);
        segment_story_bg10_RODATA_END = .;
        segment_story_bg10_RODATA_SIZE = ABSOLUTE(segment_story_bg10_RODATA_END - segment_story_bg10_RODATA_START);

        segment_story_bg10_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg10.o(.sdata*);
        segment_story_bg10_SDATA_END = .;
        segment_story_bg10_SDATA_SIZE = ABSOLUTE(segment_story_bg10_SDATA_END - segment_story_bg10_SDATA_START);
    }

    segment_story_bg10_alloc_VRAM_END = .;
    segment_story_bg10_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg10_alloc_VRAM_END - segment_story_bg10_alloc_VRAM);

    segment_story_bg10_noload_VRAM = .;

    .segment_story_bg10.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg10_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg10.o(.sbss*);
        segment_story_bg10_SBSS_END = .;
        segment_story_bg10_SBSS_SIZE = ABSOLUTE(segment_story_bg10_SBSS_END - segment_story_bg10_SBSS_START);

        segment_story_bg10_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg10.o(.scommon*);
        segment_story_bg10_SCOMMON_END = .;
        segment_story_bg10_SCOMMON_SIZE = ABSOLUTE(segment_story_bg10_SCOMMON_END - segment_story_bg10_SCOMMON_START);

        segment_story_bg10_BSS_START = .;
        build/us/asm/us/data/segment_story_bg10.o(.bss*);
        segment_story_bg10_BSS_END = .;
        segment_story_bg10_BSS_SIZE = ABSOLUTE(segment_story_bg10_BSS_END - segment_story_bg10_BSS_START);

        segment_story_bg10COMMON_START = .;
        build/us/asm/us/data/segment_story_bg10.o(COMMON*);
        segment_story_bg10COMMON_END = .;
        segment_story_bg10COMMON_SIZE = ABSOLUTE(segment_story_bg10COMMON_END - segment_story_bg10COMMON_START);
    }

    segment_story_bg10_noload_VRAM_END = .;
    segment_story_bg10_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg10_noload_VRAM_END - segment_story_bg10_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg10);
    segment_story_bg10_VRAM_END = .;
    segment_story_bg10_VRAM_SIZE = ABSOLUTE(segment_story_bg10_VRAM_END - segment_story_bg10_VRAM);
    segment_story_bg10_ROM_END = __romPos;
    segment_story_bg10_ROM_SIZE = ABSOLUTE(segment_story_bg10_ROM_END - segment_story_bg10_ROM_START);

    segment_story_bg11_ROM_START = __romPos;
    segment_story_bg11_VRAM = ADDR(.segment_story_bg11);
    segment_story_bg11_alloc_VRAM = .;

    .segment_story_bg11 : AT(segment_story_bg11_ROM_START)
    {
        FILL(0x00000000);
        segment_story_bg11_TEXT_START = .;
        build/us/asm/us/data/segment_story_bg11.o(.text*);
        segment_story_bg11_TEXT_END = .;
        segment_story_bg11_TEXT_SIZE = ABSOLUTE(segment_story_bg11_TEXT_END - segment_story_bg11_TEXT_START);

        segment_story_bg11_DATA_START = .;
        build/us/asm/us/data/segment_story_bg11.o(.data*);
        segment_story_bg11_DATA_END = .;
        segment_story_bg11_DATA_SIZE = ABSOLUTE(segment_story_bg11_DATA_END - segment_story_bg11_DATA_START);

        segment_story_bg11_RODATA_START = .;
        build/us/asm/us/data/segment_story_bg11.o(.rodata*);
        segment_story_bg11_RODATA_END = .;
        segment_story_bg11_RODATA_SIZE = ABSOLUTE(segment_story_bg11_RODATA_END - segment_story_bg11_RODATA_START);

        segment_story_bg11_SDATA_START = .;
        build/us/asm/us/data/segment_story_bg11.o(.sdata*);
        segment_story_bg11_SDATA_END = .;
        segment_story_bg11_SDATA_SIZE = ABSOLUTE(segment_story_bg11_SDATA_END - segment_story_bg11_SDATA_START);
    }

    segment_story_bg11_alloc_VRAM_END = .;
    segment_story_bg11_alloc_VRAM_SIZE = ABSOLUTE(segment_story_bg11_alloc_VRAM_END - segment_story_bg11_alloc_VRAM);

    segment_story_bg11_noload_VRAM = .;

    .segment_story_bg11.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_story_bg11_SBSS_START = .;
        build/us/asm/us/data/segment_story_bg11.o(.sbss*);
        segment_story_bg11_SBSS_END = .;
        segment_story_bg11_SBSS_SIZE = ABSOLUTE(segment_story_bg11_SBSS_END - segment_story_bg11_SBSS_START);

        segment_story_bg11_SCOMMON_START = .;
        build/us/asm/us/data/segment_story_bg11.o(.scommon*);
        segment_story_bg11_SCOMMON_END = .;
        segment_story_bg11_SCOMMON_SIZE = ABSOLUTE(segment_story_bg11_SCOMMON_END - segment_story_bg11_SCOMMON_START);

        segment_story_bg11_BSS_START = .;
        build/us/asm/us/data/segment_story_bg11.o(.bss*);
        segment_story_bg11_BSS_END = .;
        segment_story_bg11_BSS_SIZE = ABSOLUTE(segment_story_bg11_BSS_END - segment_story_bg11_BSS_START);

        segment_story_bg11COMMON_START = .;
        build/us/asm/us/data/segment_story_bg11.o(COMMON*);
        segment_story_bg11COMMON_END = .;
        segment_story_bg11COMMON_SIZE = ABSOLUTE(segment_story_bg11COMMON_END - segment_story_bg11COMMON_START);
    }

    segment_story_bg11_noload_VRAM_END = .;
    segment_story_bg11_noload_VRAM_SIZE = ABSOLUTE(segment_story_bg11_noload_VRAM_END - segment_story_bg11_noload_VRAM);

    __romPos += SIZEOF(.segment_story_bg11);
    segment_story_bg11_VRAM_END = .;
    segment_story_bg11_VRAM_SIZE = ABSOLUTE(segment_story_bg11_VRAM_END - segment_story_bg11_VRAM);
    segment_story_bg11_ROM_END = __romPos;
    segment_story_bg11_ROM_SIZE = ABSOLUTE(segment_story_bg11_ROM_END - segment_story_bg11_ROM_START);

    segment_menu_char_ROM_START = __romPos;
    segment_menu_char_VRAM = ADDR(.segment_menu_char);
    segment_menu_char_alloc_VRAM = .;

    .segment_menu_char 0x00000000 : AT(segment_menu_char_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_char_TEXT_START = .;
        build/us/src/assets/menu/menu_char.o(.text*);
        segment_menu_char_TEXT_END = .;
        segment_menu_char_TEXT_SIZE = ABSOLUTE(segment_menu_char_TEXT_END - segment_menu_char_TEXT_START);

        segment_menu_char_DATA_START = .;
        build/us/src/assets/menu/menu_char.o(.data*);
        segment_menu_char_DATA_END = .;
        segment_menu_char_DATA_SIZE = ABSOLUTE(segment_menu_char_DATA_END - segment_menu_char_DATA_START);

        segment_menu_char_RODATA_START = .;
        build/us/src/assets/menu/menu_char.o(.rodata*);
        segment_menu_char_RODATA_END = .;
        segment_menu_char_RODATA_SIZE = ABSOLUTE(segment_menu_char_RODATA_END - segment_menu_char_RODATA_START);

        segment_menu_char_SDATA_START = .;
        build/us/src/assets/menu/menu_char.o(.sdata*);
        segment_menu_char_SDATA_END = .;
        segment_menu_char_SDATA_SIZE = ABSOLUTE(segment_menu_char_SDATA_END - segment_menu_char_SDATA_START);
    }

    segment_menu_char_alloc_VRAM_END = .;
    segment_menu_char_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_char_alloc_VRAM_END - segment_menu_char_alloc_VRAM);

    segment_menu_char_noload_VRAM = .;

    .segment_menu_char.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_char_SBSS_START = .;
        build/us/src/assets/menu/menu_char.o(.sbss*);
        segment_menu_char_SBSS_END = .;
        segment_menu_char_SBSS_SIZE = ABSOLUTE(segment_menu_char_SBSS_END - segment_menu_char_SBSS_START);

        segment_menu_char_SCOMMON_START = .;
        build/us/src/assets/menu/menu_char.o(.scommon*);
        segment_menu_char_SCOMMON_END = .;
        segment_menu_char_SCOMMON_SIZE = ABSOLUTE(segment_menu_char_SCOMMON_END - segment_menu_char_SCOMMON_START);

        segment_menu_char_BSS_START = .;
        build/us/src/assets/menu/menu_char.o(.bss*);
        segment_menu_char_BSS_END = .;
        segment_menu_char_BSS_SIZE = ABSOLUTE(segment_menu_char_BSS_END - segment_menu_char_BSS_START);

        segment_menu_charCOMMON_START = .;
        build/us/src/assets/menu/menu_char.o(COMMON*);
        segment_menu_charCOMMON_END = .;
        segment_menu_charCOMMON_SIZE = ABSOLUTE(segment_menu_charCOMMON_END - segment_menu_charCOMMON_START);
    }

    segment_menu_char_noload_VRAM_END = .;
    segment_menu_char_noload_VRAM_SIZE = ABSOLUTE(segment_menu_char_noload_VRAM_END - segment_menu_char_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_char);
    segment_menu_char_VRAM_END = .;
    segment_menu_char_VRAM_SIZE = ABSOLUTE(segment_menu_char_VRAM_END - segment_menu_char_VRAM);
    segment_menu_char_ROM_END = __romPos;
    segment_menu_char_ROM_SIZE = ABSOLUTE(segment_menu_char_ROM_END - segment_menu_char_ROM_START);

    segment_menu_common_ROM_START = __romPos;
    segment_menu_common_VRAM = ADDR(.segment_menu_common);
    segment_menu_common_alloc_VRAM = .;

    .segment_menu_common 0x00000000 : AT(segment_menu_common_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_common_TEXT_START = .;
        build/us/src/assets/menu/menu_common.o(.text*);
        segment_menu_common_TEXT_END = .;
        segment_menu_common_TEXT_SIZE = ABSOLUTE(segment_menu_common_TEXT_END - segment_menu_common_TEXT_START);

        segment_menu_common_DATA_START = .;
        build/us/src/assets/menu/menu_common.o(.data*);
        segment_menu_common_DATA_END = .;
        segment_menu_common_DATA_SIZE = ABSOLUTE(segment_menu_common_DATA_END - segment_menu_common_DATA_START);

        segment_menu_common_RODATA_START = .;
        build/us/src/assets/menu/menu_common.o(.rodata*);
        segment_menu_common_RODATA_END = .;
        segment_menu_common_RODATA_SIZE = ABSOLUTE(segment_menu_common_RODATA_END - segment_menu_common_RODATA_START);

        segment_menu_common_SDATA_START = .;
        build/us/src/assets/menu/menu_common.o(.sdata*);
        segment_menu_common_SDATA_END = .;
        segment_menu_common_SDATA_SIZE = ABSOLUTE(segment_menu_common_SDATA_END - segment_menu_common_SDATA_START);
    }

    segment_menu_common_alloc_VRAM_END = .;
    segment_menu_common_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_common_alloc_VRAM_END - segment_menu_common_alloc_VRAM);

    segment_menu_common_noload_VRAM = .;

    .segment_menu_common.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_common_SBSS_START = .;
        build/us/src/assets/menu/menu_common.o(.sbss*);
        segment_menu_common_SBSS_END = .;
        segment_menu_common_SBSS_SIZE = ABSOLUTE(segment_menu_common_SBSS_END - segment_menu_common_SBSS_START);

        segment_menu_common_SCOMMON_START = .;
        build/us/src/assets/menu/menu_common.o(.scommon*);
        segment_menu_common_SCOMMON_END = .;
        segment_menu_common_SCOMMON_SIZE = ABSOLUTE(segment_menu_common_SCOMMON_END - segment_menu_common_SCOMMON_START);

        segment_menu_common_BSS_START = .;
        build/us/src/assets/menu/menu_common.o(.bss*);
        segment_menu_common_BSS_END = .;
        segment_menu_common_BSS_SIZE = ABSOLUTE(segment_menu_common_BSS_END - segment_menu_common_BSS_START);

        segment_menu_commonCOMMON_START = .;
        build/us/src/assets/menu/menu_common.o(COMMON*);
        segment_menu_commonCOMMON_END = .;
        segment_menu_commonCOMMON_SIZE = ABSOLUTE(segment_menu_commonCOMMON_END - segment_menu_commonCOMMON_START);
    }

    segment_menu_common_noload_VRAM_END = .;
    segment_menu_common_noload_VRAM_SIZE = ABSOLUTE(segment_menu_common_noload_VRAM_END - segment_menu_common_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_common);
    segment_menu_common_VRAM_END = .;
    segment_menu_common_VRAM_SIZE = ABSOLUTE(segment_menu_common_VRAM_END - segment_menu_common_VRAM);
    segment_menu_common_ROM_END = __romPos;
    segment_menu_common_ROM_SIZE = ABSOLUTE(segment_menu_common_ROM_END - segment_menu_common_ROM_START);

    segment_menu_level_ROM_START = __romPos;
    segment_menu_level_VRAM = ADDR(.segment_menu_level);
    segment_menu_level_alloc_VRAM = .;

    .segment_menu_level 0x00000000 : AT(segment_menu_level_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_level_TEXT_START = .;
        build/us/src/assets/menu/menu_level.o(.text*);
        segment_menu_level_TEXT_END = .;
        segment_menu_level_TEXT_SIZE = ABSOLUTE(segment_menu_level_TEXT_END - segment_menu_level_TEXT_START);

        segment_menu_level_DATA_START = .;
        build/us/src/assets/menu/menu_level.o(.data*);
        segment_menu_level_DATA_END = .;
        segment_menu_level_DATA_SIZE = ABSOLUTE(segment_menu_level_DATA_END - segment_menu_level_DATA_START);

        segment_menu_level_RODATA_START = .;
        build/us/src/assets/menu/menu_level.o(.rodata*);
        segment_menu_level_RODATA_END = .;
        segment_menu_level_RODATA_SIZE = ABSOLUTE(segment_menu_level_RODATA_END - segment_menu_level_RODATA_START);

        segment_menu_level_SDATA_START = .;
        build/us/src/assets/menu/menu_level.o(.sdata*);
        segment_menu_level_SDATA_END = .;
        segment_menu_level_SDATA_SIZE = ABSOLUTE(segment_menu_level_SDATA_END - segment_menu_level_SDATA_START);
    }

    segment_menu_level_alloc_VRAM_END = .;
    segment_menu_level_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_level_alloc_VRAM_END - segment_menu_level_alloc_VRAM);

    segment_menu_level_noload_VRAM = .;

    .segment_menu_level.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_level_SBSS_START = .;
        build/us/src/assets/menu/menu_level.o(.sbss*);
        segment_menu_level_SBSS_END = .;
        segment_menu_level_SBSS_SIZE = ABSOLUTE(segment_menu_level_SBSS_END - segment_menu_level_SBSS_START);

        segment_menu_level_SCOMMON_START = .;
        build/us/src/assets/menu/menu_level.o(.scommon*);
        segment_menu_level_SCOMMON_END = .;
        segment_menu_level_SCOMMON_SIZE = ABSOLUTE(segment_menu_level_SCOMMON_END - segment_menu_level_SCOMMON_START);

        segment_menu_level_BSS_START = .;
        build/us/src/assets/menu/menu_level.o(.bss*);
        segment_menu_level_BSS_END = .;
        segment_menu_level_BSS_SIZE = ABSOLUTE(segment_menu_level_BSS_END - segment_menu_level_BSS_START);

        segment_menu_levelCOMMON_START = .;
        build/us/src/assets/menu/menu_level.o(COMMON*);
        segment_menu_levelCOMMON_END = .;
        segment_menu_levelCOMMON_SIZE = ABSOLUTE(segment_menu_levelCOMMON_END - segment_menu_levelCOMMON_START);
    }

    segment_menu_level_noload_VRAM_END = .;
    segment_menu_level_noload_VRAM_SIZE = ABSOLUTE(segment_menu_level_noload_VRAM_END - segment_menu_level_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_level);
    segment_menu_level_VRAM_END = .;
    segment_menu_level_VRAM_SIZE = ABSOLUTE(segment_menu_level_VRAM_END - segment_menu_level_VRAM);
    segment_menu_level_ROM_END = __romPos;
    segment_menu_level_ROM_SIZE = ABSOLUTE(segment_menu_level_ROM_END - segment_menu_level_ROM_START);

    segment_menu_main_ROM_START = __romPos;
    segment_menu_main_VRAM = ADDR(.segment_menu_main);
    segment_menu_main_alloc_VRAM = .;

    .segment_menu_main 0x00000000 : AT(segment_menu_main_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_main_TEXT_START = .;
        build/us/src/assets/menu/menu_main.o(.text*);
        segment_menu_main_TEXT_END = .;
        segment_menu_main_TEXT_SIZE = ABSOLUTE(segment_menu_main_TEXT_END - segment_menu_main_TEXT_START);

        segment_menu_main_DATA_START = .;
        build/us/src/assets/menu/menu_main.o(.data*);
        segment_menu_main_DATA_END = .;
        segment_menu_main_DATA_SIZE = ABSOLUTE(segment_menu_main_DATA_END - segment_menu_main_DATA_START);

        segment_menu_main_RODATA_START = .;
        build/us/src/assets/menu/menu_main.o(.rodata*);
        segment_menu_main_RODATA_END = .;
        segment_menu_main_RODATA_SIZE = ABSOLUTE(segment_menu_main_RODATA_END - segment_menu_main_RODATA_START);

        segment_menu_main_SDATA_START = .;
        build/us/src/assets/menu/menu_main.o(.sdata*);
        segment_menu_main_SDATA_END = .;
        segment_menu_main_SDATA_SIZE = ABSOLUTE(segment_menu_main_SDATA_END - segment_menu_main_SDATA_START);
    }

    segment_menu_main_alloc_VRAM_END = .;
    segment_menu_main_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_main_alloc_VRAM_END - segment_menu_main_alloc_VRAM);

    segment_menu_main_noload_VRAM = .;

    .segment_menu_main.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_main_SBSS_START = .;
        build/us/src/assets/menu/menu_main.o(.sbss*);
        segment_menu_main_SBSS_END = .;
        segment_menu_main_SBSS_SIZE = ABSOLUTE(segment_menu_main_SBSS_END - segment_menu_main_SBSS_START);

        segment_menu_main_SCOMMON_START = .;
        build/us/src/assets/menu/menu_main.o(.scommon*);
        segment_menu_main_SCOMMON_END = .;
        segment_menu_main_SCOMMON_SIZE = ABSOLUTE(segment_menu_main_SCOMMON_END - segment_menu_main_SCOMMON_START);

        segment_menu_main_BSS_START = .;
        build/us/src/assets/menu/menu_main.o(.bss*);
        segment_menu_main_BSS_END = .;
        segment_menu_main_BSS_SIZE = ABSOLUTE(segment_menu_main_BSS_END - segment_menu_main_BSS_START);

        segment_menu_mainCOMMON_START = .;
        build/us/src/assets/menu/menu_main.o(COMMON*);
        segment_menu_mainCOMMON_END = .;
        segment_menu_mainCOMMON_SIZE = ABSOLUTE(segment_menu_mainCOMMON_END - segment_menu_mainCOMMON_START);
    }

    segment_menu_main_noload_VRAM_END = .;
    segment_menu_main_noload_VRAM_SIZE = ABSOLUTE(segment_menu_main_noload_VRAM_END - segment_menu_main_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_main);
    segment_menu_main_VRAM_END = .;
    segment_menu_main_VRAM_SIZE = ABSOLUTE(segment_menu_main_VRAM_END - segment_menu_main_VRAM);
    segment_menu_main_ROM_END = __romPos;
    segment_menu_main_ROM_SIZE = ABSOLUTE(segment_menu_main_ROM_END - segment_menu_main_ROM_START);

    segment_menu_name_ROM_START = __romPos;
    segment_menu_name_VRAM = ADDR(.segment_menu_name);
    segment_menu_name_alloc_VRAM = .;

    .segment_menu_name 0x00000000 : AT(segment_menu_name_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_name_TEXT_START = .;
        build/us/src/assets/menu/menu_name.o(.text*);
        segment_menu_name_TEXT_END = .;
        segment_menu_name_TEXT_SIZE = ABSOLUTE(segment_menu_name_TEXT_END - segment_menu_name_TEXT_START);

        segment_menu_name_DATA_START = .;
        build/us/src/assets/menu/menu_name.o(.data*);
        segment_menu_name_DATA_END = .;
        segment_menu_name_DATA_SIZE = ABSOLUTE(segment_menu_name_DATA_END - segment_menu_name_DATA_START);

        segment_menu_name_RODATA_START = .;
        build/us/src/assets/menu/menu_name.o(.rodata*);
        segment_menu_name_RODATA_END = .;
        segment_menu_name_RODATA_SIZE = ABSOLUTE(segment_menu_name_RODATA_END - segment_menu_name_RODATA_START);

        segment_menu_name_SDATA_START = .;
        build/us/src/assets/menu/menu_name.o(.sdata*);
        segment_menu_name_SDATA_END = .;
        segment_menu_name_SDATA_SIZE = ABSOLUTE(segment_menu_name_SDATA_END - segment_menu_name_SDATA_START);
    }

    segment_menu_name_alloc_VRAM_END = .;
    segment_menu_name_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_name_alloc_VRAM_END - segment_menu_name_alloc_VRAM);

    segment_menu_name_noload_VRAM = .;

    .segment_menu_name.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_name_SBSS_START = .;
        build/us/src/assets/menu/menu_name.o(.sbss*);
        segment_menu_name_SBSS_END = .;
        segment_menu_name_SBSS_SIZE = ABSOLUTE(segment_menu_name_SBSS_END - segment_menu_name_SBSS_START);

        segment_menu_name_SCOMMON_START = .;
        build/us/src/assets/menu/menu_name.o(.scommon*);
        segment_menu_name_SCOMMON_END = .;
        segment_menu_name_SCOMMON_SIZE = ABSOLUTE(segment_menu_name_SCOMMON_END - segment_menu_name_SCOMMON_START);

        segment_menu_name_BSS_START = .;
        build/us/src/assets/menu/menu_name.o(.bss*);
        segment_menu_name_BSS_END = .;
        segment_menu_name_BSS_SIZE = ABSOLUTE(segment_menu_name_BSS_END - segment_menu_name_BSS_START);

        segment_menu_nameCOMMON_START = .;
        build/us/src/assets/menu/menu_name.o(COMMON*);
        segment_menu_nameCOMMON_END = .;
        segment_menu_nameCOMMON_SIZE = ABSOLUTE(segment_menu_nameCOMMON_END - segment_menu_nameCOMMON_START);
    }

    segment_menu_name_noload_VRAM_END = .;
    segment_menu_name_noload_VRAM_SIZE = ABSOLUTE(segment_menu_name_noload_VRAM_END - segment_menu_name_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_name);
    segment_menu_name_VRAM_END = .;
    segment_menu_name_VRAM_SIZE = ABSOLUTE(segment_menu_name_VRAM_END - segment_menu_name_VRAM);
    segment_menu_name_ROM_END = __romPos;
    segment_menu_name_ROM_SIZE = ABSOLUTE(segment_menu_name_ROM_END - segment_menu_name_ROM_START);

    segment_menu_p2_ROM_START = __romPos;
    segment_menu_p2_VRAM = ADDR(.segment_menu_p2);
    segment_menu_p2_alloc_VRAM = .;

    .segment_menu_p2 0x00000000 : AT(segment_menu_p2_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_p2_TEXT_START = .;
        build/us/src/assets/menu/menu_p2.o(.text*);
        segment_menu_p2_TEXT_END = .;
        segment_menu_p2_TEXT_SIZE = ABSOLUTE(segment_menu_p2_TEXT_END - segment_menu_p2_TEXT_START);

        segment_menu_p2_DATA_START = .;
        build/us/src/assets/menu/menu_p2.o(.data*);
        segment_menu_p2_DATA_END = .;
        segment_menu_p2_DATA_SIZE = ABSOLUTE(segment_menu_p2_DATA_END - segment_menu_p2_DATA_START);

        segment_menu_p2_RODATA_START = .;
        build/us/src/assets/menu/menu_p2.o(.rodata*);
        segment_menu_p2_RODATA_END = .;
        segment_menu_p2_RODATA_SIZE = ABSOLUTE(segment_menu_p2_RODATA_END - segment_menu_p2_RODATA_START);

        segment_menu_p2_SDATA_START = .;
        build/us/src/assets/menu/menu_p2.o(.sdata*);
        segment_menu_p2_SDATA_END = .;
        segment_menu_p2_SDATA_SIZE = ABSOLUTE(segment_menu_p2_SDATA_END - segment_menu_p2_SDATA_START);
    }

    segment_menu_p2_alloc_VRAM_END = .;
    segment_menu_p2_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_p2_alloc_VRAM_END - segment_menu_p2_alloc_VRAM);

    segment_menu_p2_noload_VRAM = .;

    .segment_menu_p2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_p2_SBSS_START = .;
        build/us/src/assets/menu/menu_p2.o(.sbss*);
        segment_menu_p2_SBSS_END = .;
        segment_menu_p2_SBSS_SIZE = ABSOLUTE(segment_menu_p2_SBSS_END - segment_menu_p2_SBSS_START);

        segment_menu_p2_SCOMMON_START = .;
        build/us/src/assets/menu/menu_p2.o(.scommon*);
        segment_menu_p2_SCOMMON_END = .;
        segment_menu_p2_SCOMMON_SIZE = ABSOLUTE(segment_menu_p2_SCOMMON_END - segment_menu_p2_SCOMMON_START);

        segment_menu_p2_BSS_START = .;
        build/us/src/assets/menu/menu_p2.o(.bss*);
        segment_menu_p2_BSS_END = .;
        segment_menu_p2_BSS_SIZE = ABSOLUTE(segment_menu_p2_BSS_END - segment_menu_p2_BSS_START);

        segment_menu_p2COMMON_START = .;
        build/us/src/assets/menu/menu_p2.o(COMMON*);
        segment_menu_p2COMMON_END = .;
        segment_menu_p2COMMON_SIZE = ABSOLUTE(segment_menu_p2COMMON_END - segment_menu_p2COMMON_START);
    }

    segment_menu_p2_noload_VRAM_END = .;
    segment_menu_p2_noload_VRAM_SIZE = ABSOLUTE(segment_menu_p2_noload_VRAM_END - segment_menu_p2_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_p2);
    segment_menu_p2_VRAM_END = .;
    segment_menu_p2_VRAM_SIZE = ABSOLUTE(segment_menu_p2_VRAM_END - segment_menu_p2_VRAM);
    segment_menu_p2_ROM_END = __romPos;
    segment_menu_p2_ROM_SIZE = ABSOLUTE(segment_menu_p2_ROM_END - segment_menu_p2_ROM_START);

    segment_menu_p4_ROM_START = __romPos;
    segment_menu_p4_VRAM = ADDR(.segment_menu_p4);
    segment_menu_p4_alloc_VRAM = .;

    .segment_menu_p4 0x00000000 : AT(segment_menu_p4_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_p4_TEXT_START = .;
        build/us/src/assets/menu/menu_p4.o(.text*);
        segment_menu_p4_TEXT_END = .;
        segment_menu_p4_TEXT_SIZE = ABSOLUTE(segment_menu_p4_TEXT_END - segment_menu_p4_TEXT_START);

        segment_menu_p4_DATA_START = .;
        build/us/src/assets/menu/menu_p4.o(.data*);
        segment_menu_p4_DATA_END = .;
        segment_menu_p4_DATA_SIZE = ABSOLUTE(segment_menu_p4_DATA_END - segment_menu_p4_DATA_START);

        segment_menu_p4_RODATA_START = .;
        build/us/src/assets/menu/menu_p4.o(.rodata*);
        segment_menu_p4_RODATA_END = .;
        segment_menu_p4_RODATA_SIZE = ABSOLUTE(segment_menu_p4_RODATA_END - segment_menu_p4_RODATA_START);

        segment_menu_p4_SDATA_START = .;
        build/us/src/assets/menu/menu_p4.o(.sdata*);
        segment_menu_p4_SDATA_END = .;
        segment_menu_p4_SDATA_SIZE = ABSOLUTE(segment_menu_p4_SDATA_END - segment_menu_p4_SDATA_START);
    }

    segment_menu_p4_alloc_VRAM_END = .;
    segment_menu_p4_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_p4_alloc_VRAM_END - segment_menu_p4_alloc_VRAM);

    segment_menu_p4_noload_VRAM = .;

    .segment_menu_p4.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_p4_SBSS_START = .;
        build/us/src/assets/menu/menu_p4.o(.sbss*);
        segment_menu_p4_SBSS_END = .;
        segment_menu_p4_SBSS_SIZE = ABSOLUTE(segment_menu_p4_SBSS_END - segment_menu_p4_SBSS_START);

        segment_menu_p4_SCOMMON_START = .;
        build/us/src/assets/menu/menu_p4.o(.scommon*);
        segment_menu_p4_SCOMMON_END = .;
        segment_menu_p4_SCOMMON_SIZE = ABSOLUTE(segment_menu_p4_SCOMMON_END - segment_menu_p4_SCOMMON_START);

        segment_menu_p4_BSS_START = .;
        build/us/src/assets/menu/menu_p4.o(.bss*);
        segment_menu_p4_BSS_END = .;
        segment_menu_p4_BSS_SIZE = ABSOLUTE(segment_menu_p4_BSS_END - segment_menu_p4_BSS_START);

        segment_menu_p4COMMON_START = .;
        build/us/src/assets/menu/menu_p4.o(COMMON*);
        segment_menu_p4COMMON_END = .;
        segment_menu_p4COMMON_SIZE = ABSOLUTE(segment_menu_p4COMMON_END - segment_menu_p4COMMON_START);
    }

    segment_menu_p4_noload_VRAM_END = .;
    segment_menu_p4_noload_VRAM_SIZE = ABSOLUTE(segment_menu_p4_noload_VRAM_END - segment_menu_p4_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_p4);
    segment_menu_p4_VRAM_END = .;
    segment_menu_p4_VRAM_SIZE = ABSOLUTE(segment_menu_p4_VRAM_END - segment_menu_p4_VRAM);
    segment_menu_p4_ROM_END = __romPos;
    segment_menu_p4_ROM_SIZE = ABSOLUTE(segment_menu_p4_ROM_END - segment_menu_p4_ROM_START);

    segment_menu_rank_ROM_START = __romPos;
    segment_menu_rank_VRAM = ADDR(.segment_menu_rank);
    segment_menu_rank_alloc_VRAM = .;

    .segment_menu_rank 0x00000000 : AT(segment_menu_rank_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_rank_TEXT_START = .;
        build/us/src/assets/menu/menu_rank.o(.text*);
        segment_menu_rank_TEXT_END = .;
        segment_menu_rank_TEXT_SIZE = ABSOLUTE(segment_menu_rank_TEXT_END - segment_menu_rank_TEXT_START);

        segment_menu_rank_DATA_START = .;
        build/us/src/assets/menu/menu_rank.o(.data*);
        segment_menu_rank_DATA_END = .;
        segment_menu_rank_DATA_SIZE = ABSOLUTE(segment_menu_rank_DATA_END - segment_menu_rank_DATA_START);

        segment_menu_rank_RODATA_START = .;
        build/us/src/assets/menu/menu_rank.o(.rodata*);
        segment_menu_rank_RODATA_END = .;
        segment_menu_rank_RODATA_SIZE = ABSOLUTE(segment_menu_rank_RODATA_END - segment_menu_rank_RODATA_START);

        segment_menu_rank_SDATA_START = .;
        build/us/src/assets/menu/menu_rank.o(.sdata*);
        segment_menu_rank_SDATA_END = .;
        segment_menu_rank_SDATA_SIZE = ABSOLUTE(segment_menu_rank_SDATA_END - segment_menu_rank_SDATA_START);
    }

    segment_menu_rank_alloc_VRAM_END = .;
    segment_menu_rank_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_rank_alloc_VRAM_END - segment_menu_rank_alloc_VRAM);

    segment_menu_rank_noload_VRAM = .;

    .segment_menu_rank.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_rank_SBSS_START = .;
        build/us/src/assets/menu/menu_rank.o(.sbss*);
        segment_menu_rank_SBSS_END = .;
        segment_menu_rank_SBSS_SIZE = ABSOLUTE(segment_menu_rank_SBSS_END - segment_menu_rank_SBSS_START);

        segment_menu_rank_SCOMMON_START = .;
        build/us/src/assets/menu/menu_rank.o(.scommon*);
        segment_menu_rank_SCOMMON_END = .;
        segment_menu_rank_SCOMMON_SIZE = ABSOLUTE(segment_menu_rank_SCOMMON_END - segment_menu_rank_SCOMMON_START);

        segment_menu_rank_BSS_START = .;
        build/us/src/assets/menu/menu_rank.o(.bss*);
        segment_menu_rank_BSS_END = .;
        segment_menu_rank_BSS_SIZE = ABSOLUTE(segment_menu_rank_BSS_END - segment_menu_rank_BSS_START);

        segment_menu_rankCOMMON_START = .;
        build/us/src/assets/menu/menu_rank.o(COMMON*);
        segment_menu_rankCOMMON_END = .;
        segment_menu_rankCOMMON_SIZE = ABSOLUTE(segment_menu_rankCOMMON_END - segment_menu_rankCOMMON_START);
    }

    segment_menu_rank_noload_VRAM_END = .;
    segment_menu_rank_noload_VRAM_SIZE = ABSOLUTE(segment_menu_rank_noload_VRAM_END - segment_menu_rank_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_rank);
    segment_menu_rank_VRAM_END = .;
    segment_menu_rank_VRAM_SIZE = ABSOLUTE(segment_menu_rank_VRAM_END - segment_menu_rank_VRAM);
    segment_menu_rank_ROM_END = __romPos;
    segment_menu_rank_ROM_SIZE = ABSOLUTE(segment_menu_rank_ROM_END - segment_menu_rank_ROM_START);

    segment_menu_setup_ROM_START = __romPos;
    segment_menu_setup_VRAM = ADDR(.segment_menu_setup);
    segment_menu_setup_alloc_VRAM = .;

    .segment_menu_setup 0x00000000 : AT(segment_menu_setup_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_setup_TEXT_START = .;
        build/us/src/assets/menu/menu_setup.o(.text*);
        segment_menu_setup_TEXT_END = .;
        segment_menu_setup_TEXT_SIZE = ABSOLUTE(segment_menu_setup_TEXT_END - segment_menu_setup_TEXT_START);

        segment_menu_setup_DATA_START = .;
        build/us/src/assets/menu/menu_setup.o(.data*);
        segment_menu_setup_DATA_END = .;
        segment_menu_setup_DATA_SIZE = ABSOLUTE(segment_menu_setup_DATA_END - segment_menu_setup_DATA_START);

        segment_menu_setup_RODATA_START = .;
        build/us/src/assets/menu/menu_setup.o(.rodata*);
        segment_menu_setup_RODATA_END = .;
        segment_menu_setup_RODATA_SIZE = ABSOLUTE(segment_menu_setup_RODATA_END - segment_menu_setup_RODATA_START);

        segment_menu_setup_SDATA_START = .;
        build/us/src/assets/menu/menu_setup.o(.sdata*);
        segment_menu_setup_SDATA_END = .;
        segment_menu_setup_SDATA_SIZE = ABSOLUTE(segment_menu_setup_SDATA_END - segment_menu_setup_SDATA_START);
    }

    segment_menu_setup_alloc_VRAM_END = .;
    segment_menu_setup_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_setup_alloc_VRAM_END - segment_menu_setup_alloc_VRAM);

    segment_menu_setup_noload_VRAM = .;

    .segment_menu_setup.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_setup_SBSS_START = .;
        build/us/src/assets/menu/menu_setup.o(.sbss*);
        segment_menu_setup_SBSS_END = .;
        segment_menu_setup_SBSS_SIZE = ABSOLUTE(segment_menu_setup_SBSS_END - segment_menu_setup_SBSS_START);

        segment_menu_setup_SCOMMON_START = .;
        build/us/src/assets/menu/menu_setup.o(.scommon*);
        segment_menu_setup_SCOMMON_END = .;
        segment_menu_setup_SCOMMON_SIZE = ABSOLUTE(segment_menu_setup_SCOMMON_END - segment_menu_setup_SCOMMON_START);

        segment_menu_setup_BSS_START = .;
        build/us/src/assets/menu/menu_setup.o(.bss*);
        segment_menu_setup_BSS_END = .;
        segment_menu_setup_BSS_SIZE = ABSOLUTE(segment_menu_setup_BSS_END - segment_menu_setup_BSS_START);

        segment_menu_setupCOMMON_START = .;
        build/us/src/assets/menu/menu_setup.o(COMMON*);
        segment_menu_setupCOMMON_END = .;
        segment_menu_setupCOMMON_SIZE = ABSOLUTE(segment_menu_setupCOMMON_END - segment_menu_setupCOMMON_START);
    }

    segment_menu_setup_noload_VRAM_END = .;
    segment_menu_setup_noload_VRAM_SIZE = ABSOLUTE(segment_menu_setup_noload_VRAM_END - segment_menu_setup_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_setup);
    segment_menu_setup_VRAM_END = .;
    segment_menu_setup_VRAM_SIZE = ABSOLUTE(segment_menu_setup_VRAM_END - segment_menu_setup_VRAM);
    segment_menu_setup_ROM_END = __romPos;
    segment_menu_setup_ROM_SIZE = ABSOLUTE(segment_menu_setup_ROM_END - segment_menu_setup_ROM_START);

    segment_menu_story_ROM_START = __romPos;
    segment_menu_story_VRAM = ADDR(.segment_menu_story);
    segment_menu_story_alloc_VRAM = .;

    .segment_menu_story 0x00000000 : AT(segment_menu_story_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_story_TEXT_START = .;
        build/us/src/assets/menu/menu_story.o(.text*);
        segment_menu_story_TEXT_END = .;
        segment_menu_story_TEXT_SIZE = ABSOLUTE(segment_menu_story_TEXT_END - segment_menu_story_TEXT_START);

        segment_menu_story_DATA_START = .;
        build/us/src/assets/menu/menu_story.o(.data*);
        segment_menu_story_DATA_END = .;
        segment_menu_story_DATA_SIZE = ABSOLUTE(segment_menu_story_DATA_END - segment_menu_story_DATA_START);

        segment_menu_story_RODATA_START = .;
        build/us/src/assets/menu/menu_story.o(.rodata*);
        segment_menu_story_RODATA_END = .;
        segment_menu_story_RODATA_SIZE = ABSOLUTE(segment_menu_story_RODATA_END - segment_menu_story_RODATA_START);

        segment_menu_story_SDATA_START = .;
        build/us/src/assets/menu/menu_story.o(.sdata*);
        segment_menu_story_SDATA_END = .;
        segment_menu_story_SDATA_SIZE = ABSOLUTE(segment_menu_story_SDATA_END - segment_menu_story_SDATA_START);
    }

    segment_menu_story_alloc_VRAM_END = .;
    segment_menu_story_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_story_alloc_VRAM_END - segment_menu_story_alloc_VRAM);

    segment_menu_story_noload_VRAM = .;

    .segment_menu_story.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_story_SBSS_START = .;
        build/us/src/assets/menu/menu_story.o(.sbss*);
        segment_menu_story_SBSS_END = .;
        segment_menu_story_SBSS_SIZE = ABSOLUTE(segment_menu_story_SBSS_END - segment_menu_story_SBSS_START);

        segment_menu_story_SCOMMON_START = .;
        build/us/src/assets/menu/menu_story.o(.scommon*);
        segment_menu_story_SCOMMON_END = .;
        segment_menu_story_SCOMMON_SIZE = ABSOLUTE(segment_menu_story_SCOMMON_END - segment_menu_story_SCOMMON_START);

        segment_menu_story_BSS_START = .;
        build/us/src/assets/menu/menu_story.o(.bss*);
        segment_menu_story_BSS_END = .;
        segment_menu_story_BSS_SIZE = ABSOLUTE(segment_menu_story_BSS_END - segment_menu_story_BSS_START);

        segment_menu_storyCOMMON_START = .;
        build/us/src/assets/menu/menu_story.o(COMMON*);
        segment_menu_storyCOMMON_END = .;
        segment_menu_storyCOMMON_SIZE = ABSOLUTE(segment_menu_storyCOMMON_END - segment_menu_storyCOMMON_START);
    }

    segment_menu_story_noload_VRAM_END = .;
    segment_menu_story_noload_VRAM_SIZE = ABSOLUTE(segment_menu_story_noload_VRAM_END - segment_menu_story_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_story);
    segment_menu_story_VRAM_END = .;
    segment_menu_story_VRAM_SIZE = ABSOLUTE(segment_menu_story_VRAM_END - segment_menu_story_VRAM);
    segment_menu_story_ROM_END = __romPos;
    segment_menu_story_ROM_SIZE = ABSOLUTE(segment_menu_story_ROM_END - segment_menu_story_ROM_START);

    segment_menu_cont_ROM_START = __romPos;
    segment_menu_cont_VRAM = ADDR(.segment_menu_cont);
    segment_menu_cont_alloc_VRAM = .;

    .segment_menu_cont 0x00000000 : AT(segment_menu_cont_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_cont_TEXT_START = .;
        build/us/src/assets/menu/menu_cont.o(.text*);
        segment_menu_cont_TEXT_END = .;
        segment_menu_cont_TEXT_SIZE = ABSOLUTE(segment_menu_cont_TEXT_END - segment_menu_cont_TEXT_START);

        segment_menu_cont_DATA_START = .;
        build/us/src/assets/menu/menu_cont.o(.data*);
        segment_menu_cont_DATA_END = .;
        segment_menu_cont_DATA_SIZE = ABSOLUTE(segment_menu_cont_DATA_END - segment_menu_cont_DATA_START);

        segment_menu_cont_RODATA_START = .;
        build/us/src/assets/menu/menu_cont.o(.rodata*);
        segment_menu_cont_RODATA_END = .;
        segment_menu_cont_RODATA_SIZE = ABSOLUTE(segment_menu_cont_RODATA_END - segment_menu_cont_RODATA_START);

        segment_menu_cont_SDATA_START = .;
        build/us/src/assets/menu/menu_cont.o(.sdata*);
        segment_menu_cont_SDATA_END = .;
        segment_menu_cont_SDATA_SIZE = ABSOLUTE(segment_menu_cont_SDATA_END - segment_menu_cont_SDATA_START);
    }

    segment_menu_cont_alloc_VRAM_END = .;
    segment_menu_cont_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_cont_alloc_VRAM_END - segment_menu_cont_alloc_VRAM);

    segment_menu_cont_noload_VRAM = .;

    .segment_menu_cont.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_cont_SBSS_START = .;
        build/us/src/assets/menu/menu_cont.o(.sbss*);
        segment_menu_cont_SBSS_END = .;
        segment_menu_cont_SBSS_SIZE = ABSOLUTE(segment_menu_cont_SBSS_END - segment_menu_cont_SBSS_START);

        segment_menu_cont_SCOMMON_START = .;
        build/us/src/assets/menu/menu_cont.o(.scommon*);
        segment_menu_cont_SCOMMON_END = .;
        segment_menu_cont_SCOMMON_SIZE = ABSOLUTE(segment_menu_cont_SCOMMON_END - segment_menu_cont_SCOMMON_START);

        segment_menu_cont_BSS_START = .;
        build/us/src/assets/menu/menu_cont.o(.bss*);
        segment_menu_cont_BSS_END = .;
        segment_menu_cont_BSS_SIZE = ABSOLUTE(segment_menu_cont_BSS_END - segment_menu_cont_BSS_START);

        segment_menu_contCOMMON_START = .;
        build/us/src/assets/menu/menu_cont.o(COMMON*);
        segment_menu_contCOMMON_END = .;
        segment_menu_contCOMMON_SIZE = ABSOLUTE(segment_menu_contCOMMON_END - segment_menu_contCOMMON_START);
    }

    segment_menu_cont_noload_VRAM_END = .;
    segment_menu_cont_noload_VRAM_SIZE = ABSOLUTE(segment_menu_cont_noload_VRAM_END - segment_menu_cont_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_cont);
    segment_menu_cont_VRAM_END = .;
    segment_menu_cont_VRAM_SIZE = ABSOLUTE(segment_menu_cont_VRAM_END - segment_menu_cont_VRAM);
    segment_menu_cont_ROM_END = __romPos;
    segment_menu_cont_ROM_SIZE = ABSOLUTE(segment_menu_cont_ROM_END - segment_menu_cont_ROM_START);

    segment_menu_kasa_ROM_START = __romPos;
    segment_menu_kasa_VRAM = ADDR(.segment_menu_kasa);
    segment_menu_kasa_alloc_VRAM = .;

    .segment_menu_kasa 0x00000000 : AT(segment_menu_kasa_ROM_START)
    {
        FILL(0x00000000);
        segment_menu_kasa_TEXT_START = .;
        build/us/src/assets/menu/menu_kasa.o(.text*);
        segment_menu_kasa_TEXT_END = .;
        segment_menu_kasa_TEXT_SIZE = ABSOLUTE(segment_menu_kasa_TEXT_END - segment_menu_kasa_TEXT_START);

        segment_menu_kasa_DATA_START = .;
        build/us/src/assets/menu/menu_kasa.o(.data*);
        segment_menu_kasa_DATA_END = .;
        segment_menu_kasa_DATA_SIZE = ABSOLUTE(segment_menu_kasa_DATA_END - segment_menu_kasa_DATA_START);

        segment_menu_kasa_RODATA_START = .;
        build/us/src/assets/menu/menu_kasa.o(.rodata*);
        segment_menu_kasa_RODATA_END = .;
        segment_menu_kasa_RODATA_SIZE = ABSOLUTE(segment_menu_kasa_RODATA_END - segment_menu_kasa_RODATA_START);

        segment_menu_kasa_SDATA_START = .;
        build/us/src/assets/menu/menu_kasa.o(.sdata*);
        segment_menu_kasa_SDATA_END = .;
        segment_menu_kasa_SDATA_SIZE = ABSOLUTE(segment_menu_kasa_SDATA_END - segment_menu_kasa_SDATA_START);
    }

    segment_menu_kasa_alloc_VRAM_END = .;
    segment_menu_kasa_alloc_VRAM_SIZE = ABSOLUTE(segment_menu_kasa_alloc_VRAM_END - segment_menu_kasa_alloc_VRAM);

    segment_menu_kasa_noload_VRAM = .;

    .segment_menu_kasa.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_menu_kasa_SBSS_START = .;
        build/us/src/assets/menu/menu_kasa.o(.sbss*);
        segment_menu_kasa_SBSS_END = .;
        segment_menu_kasa_SBSS_SIZE = ABSOLUTE(segment_menu_kasa_SBSS_END - segment_menu_kasa_SBSS_START);

        segment_menu_kasa_SCOMMON_START = .;
        build/us/src/assets/menu/menu_kasa.o(.scommon*);
        segment_menu_kasa_SCOMMON_END = .;
        segment_menu_kasa_SCOMMON_SIZE = ABSOLUTE(segment_menu_kasa_SCOMMON_END - segment_menu_kasa_SCOMMON_START);

        segment_menu_kasa_BSS_START = .;
        build/us/src/assets/menu/menu_kasa.o(.bss*);
        segment_menu_kasa_BSS_END = .;
        segment_menu_kasa_BSS_SIZE = ABSOLUTE(segment_menu_kasa_BSS_END - segment_menu_kasa_BSS_START);

        segment_menu_kasaCOMMON_START = .;
        build/us/src/assets/menu/menu_kasa.o(COMMON*);
        segment_menu_kasaCOMMON_END = .;
        segment_menu_kasaCOMMON_SIZE = ABSOLUTE(segment_menu_kasaCOMMON_END - segment_menu_kasaCOMMON_START);
    }

    segment_menu_kasa_noload_VRAM_END = .;
    segment_menu_kasa_noload_VRAM_SIZE = ABSOLUTE(segment_menu_kasa_noload_VRAM_END - segment_menu_kasa_noload_VRAM);

    __romPos += SIZEOF(.segment_menu_kasa);
    segment_menu_kasa_VRAM_END = .;
    segment_menu_kasa_VRAM_SIZE = ABSOLUTE(segment_menu_kasa_VRAM_END - segment_menu_kasa_VRAM);
    segment_menu_kasa_ROM_END = __romPos;
    segment_menu_kasa_ROM_SIZE = ABSOLUTE(segment_menu_kasa_ROM_END - segment_menu_kasa_ROM_START);

    segment_game_al_ROM_START = __romPos;
    segment_game_al_VRAM = ADDR(.segment_game_al);
    segment_game_al_alloc_VRAM = .;

    .segment_game_al 0x00000000 : AT(segment_game_al_ROM_START)
    {
        FILL(0x00000000);
        segment_game_al_TEXT_START = .;
        build/us/src/assets/game/game_al.o(.text*);
        segment_game_al_TEXT_END = .;
        segment_game_al_TEXT_SIZE = ABSOLUTE(segment_game_al_TEXT_END - segment_game_al_TEXT_START);

        segment_game_al_DATA_START = .;
        build/us/src/assets/game/game_al.o(.data*);
        segment_game_al_DATA_END = .;
        segment_game_al_DATA_SIZE = ABSOLUTE(segment_game_al_DATA_END - segment_game_al_DATA_START);

        segment_game_al_RODATA_START = .;
        build/us/src/assets/game/game_al.o(.rodata*);
        segment_game_al_RODATA_END = .;
        segment_game_al_RODATA_SIZE = ABSOLUTE(segment_game_al_RODATA_END - segment_game_al_RODATA_START);

        segment_game_al_SDATA_START = .;
        build/us/src/assets/game/game_al.o(.sdata*);
        segment_game_al_SDATA_END = .;
        segment_game_al_SDATA_SIZE = ABSOLUTE(segment_game_al_SDATA_END - segment_game_al_SDATA_START);
    }

    segment_game_al_alloc_VRAM_END = .;
    segment_game_al_alloc_VRAM_SIZE = ABSOLUTE(segment_game_al_alloc_VRAM_END - segment_game_al_alloc_VRAM);

    segment_game_al_noload_VRAM = .;

    .segment_game_al.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_game_al_SBSS_START = .;
        build/us/src/assets/game/game_al.o(.sbss*);
        segment_game_al_SBSS_END = .;
        segment_game_al_SBSS_SIZE = ABSOLUTE(segment_game_al_SBSS_END - segment_game_al_SBSS_START);

        segment_game_al_SCOMMON_START = .;
        build/us/src/assets/game/game_al.o(.scommon*);
        segment_game_al_SCOMMON_END = .;
        segment_game_al_SCOMMON_SIZE = ABSOLUTE(segment_game_al_SCOMMON_END - segment_game_al_SCOMMON_START);

        segment_game_al_BSS_START = .;
        build/us/src/assets/game/game_al.o(.bss*);
        segment_game_al_BSS_END = .;
        segment_game_al_BSS_SIZE = ABSOLUTE(segment_game_al_BSS_END - segment_game_al_BSS_START);

        segment_game_alCOMMON_START = .;
        build/us/src/assets/game/game_al.o(COMMON*);
        segment_game_alCOMMON_END = .;
        segment_game_alCOMMON_SIZE = ABSOLUTE(segment_game_alCOMMON_END - segment_game_alCOMMON_START);
    }

    segment_game_al_noload_VRAM_END = .;
    segment_game_al_noload_VRAM_SIZE = ABSOLUTE(segment_game_al_noload_VRAM_END - segment_game_al_noload_VRAM);

    __romPos += SIZEOF(.segment_game_al);
    segment_game_al_VRAM_END = .;
    segment_game_al_VRAM_SIZE = ABSOLUTE(segment_game_al_VRAM_END - segment_game_al_VRAM);
    segment_game_al_ROM_END = __romPos;
    segment_game_al_ROM_SIZE = ABSOLUTE(segment_game_al_ROM_END - segment_game_al_ROM_START);

    segment_game_p1_ROM_START = __romPos;
    segment_game_p1_VRAM = ADDR(.segment_game_p1);
    segment_game_p1_alloc_VRAM = .;

    .segment_game_p1 0x00000000 : AT(segment_game_p1_ROM_START)
    {
        FILL(0x00000000);
        segment_game_p1_TEXT_START = .;
        build/us/src/assets/game/game_p1.o(.text*);
        segment_game_p1_TEXT_END = .;
        segment_game_p1_TEXT_SIZE = ABSOLUTE(segment_game_p1_TEXT_END - segment_game_p1_TEXT_START);

        segment_game_p1_DATA_START = .;
        build/us/src/assets/game/game_p1.o(.data*);
        segment_game_p1_DATA_END = .;
        segment_game_p1_DATA_SIZE = ABSOLUTE(segment_game_p1_DATA_END - segment_game_p1_DATA_START);

        segment_game_p1_RODATA_START = .;
        build/us/src/assets/game/game_p1.o(.rodata*);
        segment_game_p1_RODATA_END = .;
        segment_game_p1_RODATA_SIZE = ABSOLUTE(segment_game_p1_RODATA_END - segment_game_p1_RODATA_START);

        segment_game_p1_SDATA_START = .;
        build/us/src/assets/game/game_p1.o(.sdata*);
        segment_game_p1_SDATA_END = .;
        segment_game_p1_SDATA_SIZE = ABSOLUTE(segment_game_p1_SDATA_END - segment_game_p1_SDATA_START);
    }

    segment_game_p1_alloc_VRAM_END = .;
    segment_game_p1_alloc_VRAM_SIZE = ABSOLUTE(segment_game_p1_alloc_VRAM_END - segment_game_p1_alloc_VRAM);

    segment_game_p1_noload_VRAM = .;

    .segment_game_p1.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_game_p1_SBSS_START = .;
        build/us/src/assets/game/game_p1.o(.sbss*);
        segment_game_p1_SBSS_END = .;
        segment_game_p1_SBSS_SIZE = ABSOLUTE(segment_game_p1_SBSS_END - segment_game_p1_SBSS_START);

        segment_game_p1_SCOMMON_START = .;
        build/us/src/assets/game/game_p1.o(.scommon*);
        segment_game_p1_SCOMMON_END = .;
        segment_game_p1_SCOMMON_SIZE = ABSOLUTE(segment_game_p1_SCOMMON_END - segment_game_p1_SCOMMON_START);

        segment_game_p1_BSS_START = .;
        build/us/src/assets/game/game_p1.o(.bss*);
        segment_game_p1_BSS_END = .;
        segment_game_p1_BSS_SIZE = ABSOLUTE(segment_game_p1_BSS_END - segment_game_p1_BSS_START);

        segment_game_p1COMMON_START = .;
        build/us/src/assets/game/game_p1.o(COMMON*);
        segment_game_p1COMMON_END = .;
        segment_game_p1COMMON_SIZE = ABSOLUTE(segment_game_p1COMMON_END - segment_game_p1COMMON_START);
    }

    segment_game_p1_noload_VRAM_END = .;
    segment_game_p1_noload_VRAM_SIZE = ABSOLUTE(segment_game_p1_noload_VRAM_END - segment_game_p1_noload_VRAM);

    __romPos += SIZEOF(.segment_game_p1);
    segment_game_p1_VRAM_END = .;
    segment_game_p1_VRAM_SIZE = ABSOLUTE(segment_game_p1_VRAM_END - segment_game_p1_VRAM);
    segment_game_p1_ROM_END = __romPos;
    segment_game_p1_ROM_SIZE = ABSOLUTE(segment_game_p1_ROM_END - segment_game_p1_ROM_START);

    segment_game_p2_ROM_START = __romPos;
    segment_game_p2_VRAM = ADDR(.segment_game_p2);
    segment_game_p2_alloc_VRAM = .;

    .segment_game_p2 0x00000000 : AT(segment_game_p2_ROM_START)
    {
        FILL(0x00000000);
        segment_game_p2_TEXT_START = .;
        build/us/src/assets/game/game_p2.o(.text*);
        segment_game_p2_TEXT_END = .;
        segment_game_p2_TEXT_SIZE = ABSOLUTE(segment_game_p2_TEXT_END - segment_game_p2_TEXT_START);

        segment_game_p2_DATA_START = .;
        build/us/src/assets/game/game_p2.o(.data*);
        segment_game_p2_DATA_END = .;
        segment_game_p2_DATA_SIZE = ABSOLUTE(segment_game_p2_DATA_END - segment_game_p2_DATA_START);

        segment_game_p2_RODATA_START = .;
        build/us/src/assets/game/game_p2.o(.rodata*);
        segment_game_p2_RODATA_END = .;
        segment_game_p2_RODATA_SIZE = ABSOLUTE(segment_game_p2_RODATA_END - segment_game_p2_RODATA_START);

        segment_game_p2_SDATA_START = .;
        build/us/src/assets/game/game_p2.o(.sdata*);
        segment_game_p2_SDATA_END = .;
        segment_game_p2_SDATA_SIZE = ABSOLUTE(segment_game_p2_SDATA_END - segment_game_p2_SDATA_START);
    }

    segment_game_p2_alloc_VRAM_END = .;
    segment_game_p2_alloc_VRAM_SIZE = ABSOLUTE(segment_game_p2_alloc_VRAM_END - segment_game_p2_alloc_VRAM);

    segment_game_p2_noload_VRAM = .;

    .segment_game_p2.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_game_p2_SBSS_START = .;
        build/us/src/assets/game/game_p2.o(.sbss*);
        segment_game_p2_SBSS_END = .;
        segment_game_p2_SBSS_SIZE = ABSOLUTE(segment_game_p2_SBSS_END - segment_game_p2_SBSS_START);

        segment_game_p2_SCOMMON_START = .;
        build/us/src/assets/game/game_p2.o(.scommon*);
        segment_game_p2_SCOMMON_END = .;
        segment_game_p2_SCOMMON_SIZE = ABSOLUTE(segment_game_p2_SCOMMON_END - segment_game_p2_SCOMMON_START);

        segment_game_p2_BSS_START = .;
        build/us/src/assets/game/game_p2.o(.bss*);
        segment_game_p2_BSS_END = .;
        segment_game_p2_BSS_SIZE = ABSOLUTE(segment_game_p2_BSS_END - segment_game_p2_BSS_START);

        segment_game_p2COMMON_START = .;
        build/us/src/assets/game/game_p2.o(COMMON*);
        segment_game_p2COMMON_END = .;
        segment_game_p2COMMON_SIZE = ABSOLUTE(segment_game_p2COMMON_END - segment_game_p2COMMON_START);
    }

    segment_game_p2_noload_VRAM_END = .;
    segment_game_p2_noload_VRAM_SIZE = ABSOLUTE(segment_game_p2_noload_VRAM_END - segment_game_p2_noload_VRAM);

    __romPos += SIZEOF(.segment_game_p2);
    segment_game_p2_VRAM_END = .;
    segment_game_p2_VRAM_SIZE = ABSOLUTE(segment_game_p2_VRAM_END - segment_game_p2_VRAM);
    segment_game_p2_ROM_END = __romPos;
    segment_game_p2_ROM_SIZE = ABSOLUTE(segment_game_p2_ROM_END - segment_game_p2_ROM_START);

    segment_game_p4_ROM_START = __romPos;
    segment_game_p4_VRAM = ADDR(.segment_game_p4);
    segment_game_p4_alloc_VRAM = .;

    .segment_game_p4 0x00000000 : AT(segment_game_p4_ROM_START)
    {
        FILL(0x00000000);
        segment_game_p4_TEXT_START = .;
        build/us/src/assets/game/game_p4.o(.text*);
        segment_game_p4_TEXT_END = .;
        segment_game_p4_TEXT_SIZE = ABSOLUTE(segment_game_p4_TEXT_END - segment_game_p4_TEXT_START);

        segment_game_p4_DATA_START = .;
        build/us/src/assets/game/game_p4.o(.data*);
        segment_game_p4_DATA_END = .;
        segment_game_p4_DATA_SIZE = ABSOLUTE(segment_game_p4_DATA_END - segment_game_p4_DATA_START);

        segment_game_p4_RODATA_START = .;
        build/us/src/assets/game/game_p4.o(.rodata*);
        segment_game_p4_RODATA_END = .;
        segment_game_p4_RODATA_SIZE = ABSOLUTE(segment_game_p4_RODATA_END - segment_game_p4_RODATA_START);

        segment_game_p4_SDATA_START = .;
        build/us/src/assets/game/game_p4.o(.sdata*);
        segment_game_p4_SDATA_END = .;
        segment_game_p4_SDATA_SIZE = ABSOLUTE(segment_game_p4_SDATA_END - segment_game_p4_SDATA_START);
    }

    segment_game_p4_alloc_VRAM_END = .;
    segment_game_p4_alloc_VRAM_SIZE = ABSOLUTE(segment_game_p4_alloc_VRAM_END - segment_game_p4_alloc_VRAM);

    segment_game_p4_noload_VRAM = .;

    .segment_game_p4.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_game_p4_SBSS_START = .;
        build/us/src/assets/game/game_p4.o(.sbss*);
        segment_game_p4_SBSS_END = .;
        segment_game_p4_SBSS_SIZE = ABSOLUTE(segment_game_p4_SBSS_END - segment_game_p4_SBSS_START);

        segment_game_p4_SCOMMON_START = .;
        build/us/src/assets/game/game_p4.o(.scommon*);
        segment_game_p4_SCOMMON_END = .;
        segment_game_p4_SCOMMON_SIZE = ABSOLUTE(segment_game_p4_SCOMMON_END - segment_game_p4_SCOMMON_START);

        segment_game_p4_BSS_START = .;
        build/us/src/assets/game/game_p4.o(.bss*);
        segment_game_p4_BSS_END = .;
        segment_game_p4_BSS_SIZE = ABSOLUTE(segment_game_p4_BSS_END - segment_game_p4_BSS_START);

        segment_game_p4COMMON_START = .;
        build/us/src/assets/game/game_p4.o(COMMON*);
        segment_game_p4COMMON_END = .;
        segment_game_p4COMMON_SIZE = ABSOLUTE(segment_game_p4COMMON_END - segment_game_p4COMMON_START);
    }

    segment_game_p4_noload_VRAM_END = .;
    segment_game_p4_noload_VRAM_SIZE = ABSOLUTE(segment_game_p4_noload_VRAM_END - segment_game_p4_noload_VRAM);

    __romPos += SIZEOF(.segment_game_p4);
    segment_game_p4_VRAM_END = .;
    segment_game_p4_VRAM_SIZE = ABSOLUTE(segment_game_p4_VRAM_END - segment_game_p4_VRAM);
    segment_game_p4_ROM_END = __romPos;
    segment_game_p4_ROM_SIZE = ABSOLUTE(segment_game_p4_ROM_END - segment_game_p4_ROM_START);

    segment_game_ls_ROM_START = __romPos;
    segment_game_ls_VRAM = ADDR(.segment_game_ls);
    segment_game_ls_alloc_VRAM = .;

    .segment_game_ls 0x00000000 : AT(segment_game_ls_ROM_START)
    {
        FILL(0x00000000);
        segment_game_ls_TEXT_START = .;
        build/us/src/assets/game/game_ls.o(.text*);
        segment_game_ls_TEXT_END = .;
        segment_game_ls_TEXT_SIZE = ABSOLUTE(segment_game_ls_TEXT_END - segment_game_ls_TEXT_START);

        segment_game_ls_DATA_START = .;
        build/us/src/assets/game/game_ls.o(.data*);
        segment_game_ls_DATA_END = .;
        segment_game_ls_DATA_SIZE = ABSOLUTE(segment_game_ls_DATA_END - segment_game_ls_DATA_START);

        segment_game_ls_RODATA_START = .;
        build/us/src/assets/game/game_ls.o(.rodata*);
        segment_game_ls_RODATA_END = .;
        segment_game_ls_RODATA_SIZE = ABSOLUTE(segment_game_ls_RODATA_END - segment_game_ls_RODATA_START);

        segment_game_ls_SDATA_START = .;
        build/us/src/assets/game/game_ls.o(.sdata*);
        segment_game_ls_SDATA_END = .;
        segment_game_ls_SDATA_SIZE = ABSOLUTE(segment_game_ls_SDATA_END - segment_game_ls_SDATA_START);
    }

    segment_game_ls_alloc_VRAM_END = .;
    segment_game_ls_alloc_VRAM_SIZE = ABSOLUTE(segment_game_ls_alloc_VRAM_END - segment_game_ls_alloc_VRAM);

    segment_game_ls_noload_VRAM = .;

    .segment_game_ls.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_game_ls_SBSS_START = .;
        build/us/src/assets/game/game_ls.o(.sbss*);
        segment_game_ls_SBSS_END = .;
        segment_game_ls_SBSS_SIZE = ABSOLUTE(segment_game_ls_SBSS_END - segment_game_ls_SBSS_START);

        segment_game_ls_SCOMMON_START = .;
        build/us/src/assets/game/game_ls.o(.scommon*);
        segment_game_ls_SCOMMON_END = .;
        segment_game_ls_SCOMMON_SIZE = ABSOLUTE(segment_game_ls_SCOMMON_END - segment_game_ls_SCOMMON_START);

        segment_game_ls_BSS_START = .;
        build/us/src/assets/game/game_ls.o(.bss*);
        segment_game_ls_BSS_END = .;
        segment_game_ls_BSS_SIZE = ABSOLUTE(segment_game_ls_BSS_END - segment_game_ls_BSS_START);

        segment_game_lsCOMMON_START = .;
        build/us/src/assets/game/game_ls.o(COMMON*);
        segment_game_lsCOMMON_END = .;
        segment_game_lsCOMMON_SIZE = ABSOLUTE(segment_game_lsCOMMON_END - segment_game_lsCOMMON_START);
    }

    segment_game_ls_noload_VRAM_END = .;
    segment_game_ls_noload_VRAM_SIZE = ABSOLUTE(segment_game_ls_noload_VRAM_END - segment_game_ls_noload_VRAM);

    __romPos += SIZEOF(.segment_game_ls);
    segment_game_ls_VRAM_END = .;
    segment_game_ls_VRAM_SIZE = ABSOLUTE(segment_game_ls_VRAM_END - segment_game_ls_VRAM);
    segment_game_ls_ROM_END = __romPos;
    segment_game_ls_ROM_SIZE = ABSOLUTE(segment_game_ls_ROM_END - segment_game_ls_ROM_START);

    segment_game_item_ROM_START = __romPos;
    segment_game_item_VRAM = ADDR(.segment_game_item);
    segment_game_item_alloc_VRAM = .;

    .segment_game_item 0x00000000 : AT(segment_game_item_ROM_START)
    {
        FILL(0x00000000);
        segment_game_item_TEXT_START = .;
        build/us/src/assets/game/game_item.o(.text*);
        segment_game_item_TEXT_END = .;
        segment_game_item_TEXT_SIZE = ABSOLUTE(segment_game_item_TEXT_END - segment_game_item_TEXT_START);

        segment_game_item_DATA_START = .;
        build/us/src/assets/game/game_item.o(.data*);
        segment_game_item_DATA_END = .;
        segment_game_item_DATA_SIZE = ABSOLUTE(segment_game_item_DATA_END - segment_game_item_DATA_START);

        segment_game_item_RODATA_START = .;
        build/us/src/assets/game/game_item.o(.rodata*);
        segment_game_item_RODATA_END = .;
        segment_game_item_RODATA_SIZE = ABSOLUTE(segment_game_item_RODATA_END - segment_game_item_RODATA_START);

        segment_game_item_SDATA_START = .;
        build/us/src/assets/game/game_item.o(.sdata*);
        segment_game_item_SDATA_END = .;
        segment_game_item_SDATA_SIZE = ABSOLUTE(segment_game_item_SDATA_END - segment_game_item_SDATA_START);
    }

    segment_game_item_alloc_VRAM_END = .;
    segment_game_item_alloc_VRAM_SIZE = ABSOLUTE(segment_game_item_alloc_VRAM_END - segment_game_item_alloc_VRAM);

    segment_game_item_noload_VRAM = .;

    .segment_game_item.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_game_item_SBSS_START = .;
        build/us/src/assets/game/game_item.o(.sbss*);
        segment_game_item_SBSS_END = .;
        segment_game_item_SBSS_SIZE = ABSOLUTE(segment_game_item_SBSS_END - segment_game_item_SBSS_START);

        segment_game_item_SCOMMON_START = .;
        build/us/src/assets/game/game_item.o(.scommon*);
        segment_game_item_SCOMMON_END = .;
        segment_game_item_SCOMMON_SIZE = ABSOLUTE(segment_game_item_SCOMMON_END - segment_game_item_SCOMMON_START);

        segment_game_item_BSS_START = .;
        build/us/src/assets/game/game_item.o(.bss*);
        segment_game_item_BSS_END = .;
        segment_game_item_BSS_SIZE = ABSOLUTE(segment_game_item_BSS_END - segment_game_item_BSS_START);

        segment_game_itemCOMMON_START = .;
        build/us/src/assets/game/game_item.o(COMMON*);
        segment_game_itemCOMMON_END = .;
        segment_game_itemCOMMON_SIZE = ABSOLUTE(segment_game_itemCOMMON_END - segment_game_itemCOMMON_START);
    }

    segment_game_item_noload_VRAM_END = .;
    segment_game_item_noload_VRAM_SIZE = ABSOLUTE(segment_game_item_noload_VRAM_END - segment_game_item_noload_VRAM);

    __romPos += SIZEOF(.segment_game_item);
    segment_game_item_VRAM_END = .;
    segment_game_item_VRAM_SIZE = ABSOLUTE(segment_game_item_VRAM_END - segment_game_item_VRAM);
    segment_game_item_ROM_END = __romPos;
    segment_game_item_ROM_SIZE = ABSOLUTE(segment_game_item_ROM_END - segment_game_item_ROM_START);

    segment_anime_a_ROM_START = __romPos;
    segment_anime_a_VRAM = ADDR(.segment_anime_a);
    segment_anime_a_alloc_VRAM = .;

    .segment_anime_a 0x00000000 : AT(segment_anime_a_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_a_TEXT_START = .;
        build/us/src/assets/anime/anime_a.o(.text*);
        segment_anime_a_TEXT_END = .;
        segment_anime_a_TEXT_SIZE = ABSOLUTE(segment_anime_a_TEXT_END - segment_anime_a_TEXT_START);

        segment_anime_a_DATA_START = .;
        build/us/src/assets/anime/anime_a.o(.data*);
        segment_anime_a_DATA_END = .;
        segment_anime_a_DATA_SIZE = ABSOLUTE(segment_anime_a_DATA_END - segment_anime_a_DATA_START);

        segment_anime_a_RODATA_START = .;
        build/us/src/assets/anime/anime_a.o(.rodata*);
        segment_anime_a_RODATA_END = .;
        segment_anime_a_RODATA_SIZE = ABSOLUTE(segment_anime_a_RODATA_END - segment_anime_a_RODATA_START);

        segment_anime_a_SDATA_START = .;
        build/us/src/assets/anime/anime_a.o(.sdata*);
        segment_anime_a_SDATA_END = .;
        segment_anime_a_SDATA_SIZE = ABSOLUTE(segment_anime_a_SDATA_END - segment_anime_a_SDATA_START);
    }

    segment_anime_a_alloc_VRAM_END = .;
    segment_anime_a_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_a_alloc_VRAM_END - segment_anime_a_alloc_VRAM);

    segment_anime_a_noload_VRAM = .;

    .segment_anime_a.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_a_SBSS_START = .;
        build/us/src/assets/anime/anime_a.o(.sbss*);
        segment_anime_a_SBSS_END = .;
        segment_anime_a_SBSS_SIZE = ABSOLUTE(segment_anime_a_SBSS_END - segment_anime_a_SBSS_START);

        segment_anime_a_SCOMMON_START = .;
        build/us/src/assets/anime/anime_a.o(.scommon*);
        segment_anime_a_SCOMMON_END = .;
        segment_anime_a_SCOMMON_SIZE = ABSOLUTE(segment_anime_a_SCOMMON_END - segment_anime_a_SCOMMON_START);

        segment_anime_a_BSS_START = .;
        build/us/src/assets/anime/anime_a.o(.bss*);
        segment_anime_a_BSS_END = .;
        segment_anime_a_BSS_SIZE = ABSOLUTE(segment_anime_a_BSS_END - segment_anime_a_BSS_START);

        segment_anime_aCOMMON_START = .;
        build/us/src/assets/anime/anime_a.o(COMMON*);
        segment_anime_aCOMMON_END = .;
        segment_anime_aCOMMON_SIZE = ABSOLUTE(segment_anime_aCOMMON_END - segment_anime_aCOMMON_START);
    }

    segment_anime_a_noload_VRAM_END = .;
    segment_anime_a_noload_VRAM_SIZE = ABSOLUTE(segment_anime_a_noload_VRAM_END - segment_anime_a_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_a);
    segment_anime_a_VRAM_END = .;
    segment_anime_a_VRAM_SIZE = ABSOLUTE(segment_anime_a_VRAM_END - segment_anime_a_VRAM);
    segment_anime_a_ROM_END = __romPos;
    segment_anime_a_ROM_SIZE = ABSOLUTE(segment_anime_a_ROM_END - segment_anime_a_ROM_START);

    segment_anime_b_ROM_START = __romPos;
    segment_anime_b_VRAM = ADDR(.segment_anime_b);
    segment_anime_b_alloc_VRAM = .;

    .segment_anime_b 0x00000000 : AT(segment_anime_b_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_b_TEXT_START = .;
        build/us/src/assets/anime/anime_b.o(.text*);
        segment_anime_b_TEXT_END = .;
        segment_anime_b_TEXT_SIZE = ABSOLUTE(segment_anime_b_TEXT_END - segment_anime_b_TEXT_START);

        segment_anime_b_DATA_START = .;
        build/us/src/assets/anime/anime_b.o(.data*);
        segment_anime_b_DATA_END = .;
        segment_anime_b_DATA_SIZE = ABSOLUTE(segment_anime_b_DATA_END - segment_anime_b_DATA_START);

        segment_anime_b_RODATA_START = .;
        build/us/src/assets/anime/anime_b.o(.rodata*);
        segment_anime_b_RODATA_END = .;
        segment_anime_b_RODATA_SIZE = ABSOLUTE(segment_anime_b_RODATA_END - segment_anime_b_RODATA_START);

        segment_anime_b_SDATA_START = .;
        build/us/src/assets/anime/anime_b.o(.sdata*);
        segment_anime_b_SDATA_END = .;
        segment_anime_b_SDATA_SIZE = ABSOLUTE(segment_anime_b_SDATA_END - segment_anime_b_SDATA_START);
    }

    segment_anime_b_alloc_VRAM_END = .;
    segment_anime_b_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_b_alloc_VRAM_END - segment_anime_b_alloc_VRAM);

    segment_anime_b_noload_VRAM = .;

    .segment_anime_b.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_b_SBSS_START = .;
        build/us/src/assets/anime/anime_b.o(.sbss*);
        segment_anime_b_SBSS_END = .;
        segment_anime_b_SBSS_SIZE = ABSOLUTE(segment_anime_b_SBSS_END - segment_anime_b_SBSS_START);

        segment_anime_b_SCOMMON_START = .;
        build/us/src/assets/anime/anime_b.o(.scommon*);
        segment_anime_b_SCOMMON_END = .;
        segment_anime_b_SCOMMON_SIZE = ABSOLUTE(segment_anime_b_SCOMMON_END - segment_anime_b_SCOMMON_START);

        segment_anime_b_BSS_START = .;
        build/us/src/assets/anime/anime_b.o(.bss*);
        segment_anime_b_BSS_END = .;
        segment_anime_b_BSS_SIZE = ABSOLUTE(segment_anime_b_BSS_END - segment_anime_b_BSS_START);

        segment_anime_bCOMMON_START = .;
        build/us/src/assets/anime/anime_b.o(COMMON*);
        segment_anime_bCOMMON_END = .;
        segment_anime_bCOMMON_SIZE = ABSOLUTE(segment_anime_bCOMMON_END - segment_anime_bCOMMON_START);
    }

    segment_anime_b_noload_VRAM_END = .;
    segment_anime_b_noload_VRAM_SIZE = ABSOLUTE(segment_anime_b_noload_VRAM_END - segment_anime_b_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_b);
    segment_anime_b_VRAM_END = .;
    segment_anime_b_VRAM_SIZE = ABSOLUTE(segment_anime_b_VRAM_END - segment_anime_b_VRAM);
    segment_anime_b_ROM_END = __romPos;
    segment_anime_b_ROM_SIZE = ABSOLUTE(segment_anime_b_ROM_END - segment_anime_b_ROM_START);

    segment_anime_c_ROM_START = __romPos;
    segment_anime_c_VRAM = ADDR(.segment_anime_c);
    segment_anime_c_alloc_VRAM = .;

    .segment_anime_c 0x00000000 : AT(segment_anime_c_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_c_TEXT_START = .;
        build/us/src/assets/anime/anime_c.o(.text*);
        segment_anime_c_TEXT_END = .;
        segment_anime_c_TEXT_SIZE = ABSOLUTE(segment_anime_c_TEXT_END - segment_anime_c_TEXT_START);

        segment_anime_c_DATA_START = .;
        build/us/src/assets/anime/anime_c.o(.data*);
        segment_anime_c_DATA_END = .;
        segment_anime_c_DATA_SIZE = ABSOLUTE(segment_anime_c_DATA_END - segment_anime_c_DATA_START);

        segment_anime_c_RODATA_START = .;
        build/us/src/assets/anime/anime_c.o(.rodata*);
        segment_anime_c_RODATA_END = .;
        segment_anime_c_RODATA_SIZE = ABSOLUTE(segment_anime_c_RODATA_END - segment_anime_c_RODATA_START);

        segment_anime_c_SDATA_START = .;
        build/us/src/assets/anime/anime_c.o(.sdata*);
        segment_anime_c_SDATA_END = .;
        segment_anime_c_SDATA_SIZE = ABSOLUTE(segment_anime_c_SDATA_END - segment_anime_c_SDATA_START);
    }

    segment_anime_c_alloc_VRAM_END = .;
    segment_anime_c_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_c_alloc_VRAM_END - segment_anime_c_alloc_VRAM);

    segment_anime_c_noload_VRAM = .;

    .segment_anime_c.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_c_SBSS_START = .;
        build/us/src/assets/anime/anime_c.o(.sbss*);
        segment_anime_c_SBSS_END = .;
        segment_anime_c_SBSS_SIZE = ABSOLUTE(segment_anime_c_SBSS_END - segment_anime_c_SBSS_START);

        segment_anime_c_SCOMMON_START = .;
        build/us/src/assets/anime/anime_c.o(.scommon*);
        segment_anime_c_SCOMMON_END = .;
        segment_anime_c_SCOMMON_SIZE = ABSOLUTE(segment_anime_c_SCOMMON_END - segment_anime_c_SCOMMON_START);

        segment_anime_c_BSS_START = .;
        build/us/src/assets/anime/anime_c.o(.bss*);
        segment_anime_c_BSS_END = .;
        segment_anime_c_BSS_SIZE = ABSOLUTE(segment_anime_c_BSS_END - segment_anime_c_BSS_START);

        segment_anime_cCOMMON_START = .;
        build/us/src/assets/anime/anime_c.o(COMMON*);
        segment_anime_cCOMMON_END = .;
        segment_anime_cCOMMON_SIZE = ABSOLUTE(segment_anime_cCOMMON_END - segment_anime_cCOMMON_START);
    }

    segment_anime_c_noload_VRAM_END = .;
    segment_anime_c_noload_VRAM_SIZE = ABSOLUTE(segment_anime_c_noload_VRAM_END - segment_anime_c_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_c);
    segment_anime_c_VRAM_END = .;
    segment_anime_c_VRAM_SIZE = ABSOLUTE(segment_anime_c_VRAM_END - segment_anime_c_VRAM);
    segment_anime_c_ROM_END = __romPos;
    segment_anime_c_ROM_SIZE = ABSOLUTE(segment_anime_c_ROM_END - segment_anime_c_ROM_START);

    segment_anime_d_ROM_START = __romPos;
    segment_anime_d_VRAM = ADDR(.segment_anime_d);
    segment_anime_d_alloc_VRAM = .;

    .segment_anime_d 0x00000000 : AT(segment_anime_d_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_d_TEXT_START = .;
        build/us/src/assets/anime/anime_d.o(.text*);
        segment_anime_d_TEXT_END = .;
        segment_anime_d_TEXT_SIZE = ABSOLUTE(segment_anime_d_TEXT_END - segment_anime_d_TEXT_START);

        segment_anime_d_DATA_START = .;
        build/us/src/assets/anime/anime_d.o(.data*);
        segment_anime_d_DATA_END = .;
        segment_anime_d_DATA_SIZE = ABSOLUTE(segment_anime_d_DATA_END - segment_anime_d_DATA_START);

        segment_anime_d_RODATA_START = .;
        build/us/src/assets/anime/anime_d.o(.rodata*);
        segment_anime_d_RODATA_END = .;
        segment_anime_d_RODATA_SIZE = ABSOLUTE(segment_anime_d_RODATA_END - segment_anime_d_RODATA_START);

        segment_anime_d_SDATA_START = .;
        build/us/src/assets/anime/anime_d.o(.sdata*);
        segment_anime_d_SDATA_END = .;
        segment_anime_d_SDATA_SIZE = ABSOLUTE(segment_anime_d_SDATA_END - segment_anime_d_SDATA_START);
    }

    segment_anime_d_alloc_VRAM_END = .;
    segment_anime_d_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_d_alloc_VRAM_END - segment_anime_d_alloc_VRAM);

    segment_anime_d_noload_VRAM = .;

    .segment_anime_d.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_d_SBSS_START = .;
        build/us/src/assets/anime/anime_d.o(.sbss*);
        segment_anime_d_SBSS_END = .;
        segment_anime_d_SBSS_SIZE = ABSOLUTE(segment_anime_d_SBSS_END - segment_anime_d_SBSS_START);

        segment_anime_d_SCOMMON_START = .;
        build/us/src/assets/anime/anime_d.o(.scommon*);
        segment_anime_d_SCOMMON_END = .;
        segment_anime_d_SCOMMON_SIZE = ABSOLUTE(segment_anime_d_SCOMMON_END - segment_anime_d_SCOMMON_START);

        segment_anime_d_BSS_START = .;
        build/us/src/assets/anime/anime_d.o(.bss*);
        segment_anime_d_BSS_END = .;
        segment_anime_d_BSS_SIZE = ABSOLUTE(segment_anime_d_BSS_END - segment_anime_d_BSS_START);

        segment_anime_dCOMMON_START = .;
        build/us/src/assets/anime/anime_d.o(COMMON*);
        segment_anime_dCOMMON_END = .;
        segment_anime_dCOMMON_SIZE = ABSOLUTE(segment_anime_dCOMMON_END - segment_anime_dCOMMON_START);
    }

    segment_anime_d_noload_VRAM_END = .;
    segment_anime_d_noload_VRAM_SIZE = ABSOLUTE(segment_anime_d_noload_VRAM_END - segment_anime_d_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_d);
    segment_anime_d_VRAM_END = .;
    segment_anime_d_VRAM_SIZE = ABSOLUTE(segment_anime_d_VRAM_END - segment_anime_d_VRAM);
    segment_anime_d_ROM_END = __romPos;
    segment_anime_d_ROM_SIZE = ABSOLUTE(segment_anime_d_ROM_END - segment_anime_d_ROM_START);

    segment_anime_e_ROM_START = __romPos;
    segment_anime_e_VRAM = ADDR(.segment_anime_e);
    segment_anime_e_alloc_VRAM = .;

    .segment_anime_e 0x00000000 : AT(segment_anime_e_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_e_TEXT_START = .;
        build/us/src/assets/anime/anime_e.o(.text*);
        segment_anime_e_TEXT_END = .;
        segment_anime_e_TEXT_SIZE = ABSOLUTE(segment_anime_e_TEXT_END - segment_anime_e_TEXT_START);

        segment_anime_e_DATA_START = .;
        build/us/src/assets/anime/anime_e.o(.data*);
        segment_anime_e_DATA_END = .;
        segment_anime_e_DATA_SIZE = ABSOLUTE(segment_anime_e_DATA_END - segment_anime_e_DATA_START);

        segment_anime_e_RODATA_START = .;
        build/us/src/assets/anime/anime_e.o(.rodata*);
        segment_anime_e_RODATA_END = .;
        segment_anime_e_RODATA_SIZE = ABSOLUTE(segment_anime_e_RODATA_END - segment_anime_e_RODATA_START);

        segment_anime_e_SDATA_START = .;
        build/us/src/assets/anime/anime_e.o(.sdata*);
        segment_anime_e_SDATA_END = .;
        segment_anime_e_SDATA_SIZE = ABSOLUTE(segment_anime_e_SDATA_END - segment_anime_e_SDATA_START);
    }

    segment_anime_e_alloc_VRAM_END = .;
    segment_anime_e_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_e_alloc_VRAM_END - segment_anime_e_alloc_VRAM);

    segment_anime_e_noload_VRAM = .;

    .segment_anime_e.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_e_SBSS_START = .;
        build/us/src/assets/anime/anime_e.o(.sbss*);
        segment_anime_e_SBSS_END = .;
        segment_anime_e_SBSS_SIZE = ABSOLUTE(segment_anime_e_SBSS_END - segment_anime_e_SBSS_START);

        segment_anime_e_SCOMMON_START = .;
        build/us/src/assets/anime/anime_e.o(.scommon*);
        segment_anime_e_SCOMMON_END = .;
        segment_anime_e_SCOMMON_SIZE = ABSOLUTE(segment_anime_e_SCOMMON_END - segment_anime_e_SCOMMON_START);

        segment_anime_e_BSS_START = .;
        build/us/src/assets/anime/anime_e.o(.bss*);
        segment_anime_e_BSS_END = .;
        segment_anime_e_BSS_SIZE = ABSOLUTE(segment_anime_e_BSS_END - segment_anime_e_BSS_START);

        segment_anime_eCOMMON_START = .;
        build/us/src/assets/anime/anime_e.o(COMMON*);
        segment_anime_eCOMMON_END = .;
        segment_anime_eCOMMON_SIZE = ABSOLUTE(segment_anime_eCOMMON_END - segment_anime_eCOMMON_START);
    }

    segment_anime_e_noload_VRAM_END = .;
    segment_anime_e_noload_VRAM_SIZE = ABSOLUTE(segment_anime_e_noload_VRAM_END - segment_anime_e_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_e);
    segment_anime_e_VRAM_END = .;
    segment_anime_e_VRAM_SIZE = ABSOLUTE(segment_anime_e_VRAM_END - segment_anime_e_VRAM);
    segment_anime_e_ROM_END = __romPos;
    segment_anime_e_ROM_SIZE = ABSOLUTE(segment_anime_e_ROM_END - segment_anime_e_ROM_START);

    segment_anime_f_ROM_START = __romPos;
    segment_anime_f_VRAM = ADDR(.segment_anime_f);
    segment_anime_f_alloc_VRAM = .;

    .segment_anime_f 0x00000000 : AT(segment_anime_f_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_f_TEXT_START = .;
        build/us/src/assets/anime/anime_f.o(.text*);
        segment_anime_f_TEXT_END = .;
        segment_anime_f_TEXT_SIZE = ABSOLUTE(segment_anime_f_TEXT_END - segment_anime_f_TEXT_START);

        segment_anime_f_DATA_START = .;
        build/us/src/assets/anime/anime_f.o(.data*);
        segment_anime_f_DATA_END = .;
        segment_anime_f_DATA_SIZE = ABSOLUTE(segment_anime_f_DATA_END - segment_anime_f_DATA_START);

        segment_anime_f_RODATA_START = .;
        build/us/src/assets/anime/anime_f.o(.rodata*);
        segment_anime_f_RODATA_END = .;
        segment_anime_f_RODATA_SIZE = ABSOLUTE(segment_anime_f_RODATA_END - segment_anime_f_RODATA_START);

        segment_anime_f_SDATA_START = .;
        build/us/src/assets/anime/anime_f.o(.sdata*);
        segment_anime_f_SDATA_END = .;
        segment_anime_f_SDATA_SIZE = ABSOLUTE(segment_anime_f_SDATA_END - segment_anime_f_SDATA_START);
    }

    segment_anime_f_alloc_VRAM_END = .;
    segment_anime_f_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_f_alloc_VRAM_END - segment_anime_f_alloc_VRAM);

    segment_anime_f_noload_VRAM = .;

    .segment_anime_f.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_f_SBSS_START = .;
        build/us/src/assets/anime/anime_f.o(.sbss*);
        segment_anime_f_SBSS_END = .;
        segment_anime_f_SBSS_SIZE = ABSOLUTE(segment_anime_f_SBSS_END - segment_anime_f_SBSS_START);

        segment_anime_f_SCOMMON_START = .;
        build/us/src/assets/anime/anime_f.o(.scommon*);
        segment_anime_f_SCOMMON_END = .;
        segment_anime_f_SCOMMON_SIZE = ABSOLUTE(segment_anime_f_SCOMMON_END - segment_anime_f_SCOMMON_START);

        segment_anime_f_BSS_START = .;
        build/us/src/assets/anime/anime_f.o(.bss*);
        segment_anime_f_BSS_END = .;
        segment_anime_f_BSS_SIZE = ABSOLUTE(segment_anime_f_BSS_END - segment_anime_f_BSS_START);

        segment_anime_fCOMMON_START = .;
        build/us/src/assets/anime/anime_f.o(COMMON*);
        segment_anime_fCOMMON_END = .;
        segment_anime_fCOMMON_SIZE = ABSOLUTE(segment_anime_fCOMMON_END - segment_anime_fCOMMON_START);
    }

    segment_anime_f_noload_VRAM_END = .;
    segment_anime_f_noload_VRAM_SIZE = ABSOLUTE(segment_anime_f_noload_VRAM_END - segment_anime_f_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_f);
    segment_anime_f_VRAM_END = .;
    segment_anime_f_VRAM_SIZE = ABSOLUTE(segment_anime_f_VRAM_END - segment_anime_f_VRAM);
    segment_anime_f_ROM_END = __romPos;
    segment_anime_f_ROM_SIZE = ABSOLUTE(segment_anime_f_ROM_END - segment_anime_f_ROM_START);

    segment_anime_g_ROM_START = __romPos;
    segment_anime_g_VRAM = ADDR(.segment_anime_g);
    segment_anime_g_alloc_VRAM = .;

    .segment_anime_g 0x00000000 : AT(segment_anime_g_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_g_TEXT_START = .;
        build/us/src/assets/anime/anime_g.o(.text*);
        segment_anime_g_TEXT_END = .;
        segment_anime_g_TEXT_SIZE = ABSOLUTE(segment_anime_g_TEXT_END - segment_anime_g_TEXT_START);

        segment_anime_g_DATA_START = .;
        build/us/src/assets/anime/anime_g.o(.data*);
        segment_anime_g_DATA_END = .;
        segment_anime_g_DATA_SIZE = ABSOLUTE(segment_anime_g_DATA_END - segment_anime_g_DATA_START);

        segment_anime_g_RODATA_START = .;
        build/us/src/assets/anime/anime_g.o(.rodata*);
        segment_anime_g_RODATA_END = .;
        segment_anime_g_RODATA_SIZE = ABSOLUTE(segment_anime_g_RODATA_END - segment_anime_g_RODATA_START);

        segment_anime_g_SDATA_START = .;
        build/us/src/assets/anime/anime_g.o(.sdata*);
        segment_anime_g_SDATA_END = .;
        segment_anime_g_SDATA_SIZE = ABSOLUTE(segment_anime_g_SDATA_END - segment_anime_g_SDATA_START);
    }

    segment_anime_g_alloc_VRAM_END = .;
    segment_anime_g_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_g_alloc_VRAM_END - segment_anime_g_alloc_VRAM);

    segment_anime_g_noload_VRAM = .;

    .segment_anime_g.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_g_SBSS_START = .;
        build/us/src/assets/anime/anime_g.o(.sbss*);
        segment_anime_g_SBSS_END = .;
        segment_anime_g_SBSS_SIZE = ABSOLUTE(segment_anime_g_SBSS_END - segment_anime_g_SBSS_START);

        segment_anime_g_SCOMMON_START = .;
        build/us/src/assets/anime/anime_g.o(.scommon*);
        segment_anime_g_SCOMMON_END = .;
        segment_anime_g_SCOMMON_SIZE = ABSOLUTE(segment_anime_g_SCOMMON_END - segment_anime_g_SCOMMON_START);

        segment_anime_g_BSS_START = .;
        build/us/src/assets/anime/anime_g.o(.bss*);
        segment_anime_g_BSS_END = .;
        segment_anime_g_BSS_SIZE = ABSOLUTE(segment_anime_g_BSS_END - segment_anime_g_BSS_START);

        segment_anime_gCOMMON_START = .;
        build/us/src/assets/anime/anime_g.o(COMMON*);
        segment_anime_gCOMMON_END = .;
        segment_anime_gCOMMON_SIZE = ABSOLUTE(segment_anime_gCOMMON_END - segment_anime_gCOMMON_START);
    }

    segment_anime_g_noload_VRAM_END = .;
    segment_anime_g_noload_VRAM_SIZE = ABSOLUTE(segment_anime_g_noload_VRAM_END - segment_anime_g_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_g);
    segment_anime_g_VRAM_END = .;
    segment_anime_g_VRAM_SIZE = ABSOLUTE(segment_anime_g_VRAM_END - segment_anime_g_VRAM);
    segment_anime_g_ROM_END = __romPos;
    segment_anime_g_ROM_SIZE = ABSOLUTE(segment_anime_g_ROM_END - segment_anime_g_ROM_START);

    segment_anime_h_ROM_START = __romPos;
    segment_anime_h_VRAM = ADDR(.segment_anime_h);
    segment_anime_h_alloc_VRAM = .;

    .segment_anime_h 0x00000000 : AT(segment_anime_h_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_h_TEXT_START = .;
        build/us/src/assets/anime/anime_h.o(.text*);
        segment_anime_h_TEXT_END = .;
        segment_anime_h_TEXT_SIZE = ABSOLUTE(segment_anime_h_TEXT_END - segment_anime_h_TEXT_START);

        segment_anime_h_DATA_START = .;
        build/us/src/assets/anime/anime_h.o(.data*);
        segment_anime_h_DATA_END = .;
        segment_anime_h_DATA_SIZE = ABSOLUTE(segment_anime_h_DATA_END - segment_anime_h_DATA_START);

        segment_anime_h_RODATA_START = .;
        build/us/src/assets/anime/anime_h.o(.rodata*);
        segment_anime_h_RODATA_END = .;
        segment_anime_h_RODATA_SIZE = ABSOLUTE(segment_anime_h_RODATA_END - segment_anime_h_RODATA_START);

        segment_anime_h_SDATA_START = .;
        build/us/src/assets/anime/anime_h.o(.sdata*);
        segment_anime_h_SDATA_END = .;
        segment_anime_h_SDATA_SIZE = ABSOLUTE(segment_anime_h_SDATA_END - segment_anime_h_SDATA_START);
    }

    segment_anime_h_alloc_VRAM_END = .;
    segment_anime_h_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_h_alloc_VRAM_END - segment_anime_h_alloc_VRAM);

    segment_anime_h_noload_VRAM = .;

    .segment_anime_h.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_h_SBSS_START = .;
        build/us/src/assets/anime/anime_h.o(.sbss*);
        segment_anime_h_SBSS_END = .;
        segment_anime_h_SBSS_SIZE = ABSOLUTE(segment_anime_h_SBSS_END - segment_anime_h_SBSS_START);

        segment_anime_h_SCOMMON_START = .;
        build/us/src/assets/anime/anime_h.o(.scommon*);
        segment_anime_h_SCOMMON_END = .;
        segment_anime_h_SCOMMON_SIZE = ABSOLUTE(segment_anime_h_SCOMMON_END - segment_anime_h_SCOMMON_START);

        segment_anime_h_BSS_START = .;
        build/us/src/assets/anime/anime_h.o(.bss*);
        segment_anime_h_BSS_END = .;
        segment_anime_h_BSS_SIZE = ABSOLUTE(segment_anime_h_BSS_END - segment_anime_h_BSS_START);

        segment_anime_hCOMMON_START = .;
        build/us/src/assets/anime/anime_h.o(COMMON*);
        segment_anime_hCOMMON_END = .;
        segment_anime_hCOMMON_SIZE = ABSOLUTE(segment_anime_hCOMMON_END - segment_anime_hCOMMON_START);
    }

    segment_anime_h_noload_VRAM_END = .;
    segment_anime_h_noload_VRAM_SIZE = ABSOLUTE(segment_anime_h_noload_VRAM_END - segment_anime_h_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_h);
    segment_anime_h_VRAM_END = .;
    segment_anime_h_VRAM_SIZE = ABSOLUTE(segment_anime_h_VRAM_END - segment_anime_h_VRAM);
    segment_anime_h_ROM_END = __romPos;
    segment_anime_h_ROM_SIZE = ABSOLUTE(segment_anime_h_ROM_END - segment_anime_h_ROM_START);

    segment_anime_i_ROM_START = __romPos;
    segment_anime_i_VRAM = ADDR(.segment_anime_i);
    segment_anime_i_alloc_VRAM = .;

    .segment_anime_i 0x00000000 : AT(segment_anime_i_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_i_TEXT_START = .;
        build/us/src/assets/anime/anime_i.o(.text*);
        segment_anime_i_TEXT_END = .;
        segment_anime_i_TEXT_SIZE = ABSOLUTE(segment_anime_i_TEXT_END - segment_anime_i_TEXT_START);

        segment_anime_i_DATA_START = .;
        build/us/src/assets/anime/anime_i.o(.data*);
        segment_anime_i_DATA_END = .;
        segment_anime_i_DATA_SIZE = ABSOLUTE(segment_anime_i_DATA_END - segment_anime_i_DATA_START);

        segment_anime_i_RODATA_START = .;
        build/us/src/assets/anime/anime_i.o(.rodata*);
        segment_anime_i_RODATA_END = .;
        segment_anime_i_RODATA_SIZE = ABSOLUTE(segment_anime_i_RODATA_END - segment_anime_i_RODATA_START);

        segment_anime_i_SDATA_START = .;
        build/us/src/assets/anime/anime_i.o(.sdata*);
        segment_anime_i_SDATA_END = .;
        segment_anime_i_SDATA_SIZE = ABSOLUTE(segment_anime_i_SDATA_END - segment_anime_i_SDATA_START);
    }

    segment_anime_i_alloc_VRAM_END = .;
    segment_anime_i_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_i_alloc_VRAM_END - segment_anime_i_alloc_VRAM);

    segment_anime_i_noload_VRAM = .;

    .segment_anime_i.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_i_SBSS_START = .;
        build/us/src/assets/anime/anime_i.o(.sbss*);
        segment_anime_i_SBSS_END = .;
        segment_anime_i_SBSS_SIZE = ABSOLUTE(segment_anime_i_SBSS_END - segment_anime_i_SBSS_START);

        segment_anime_i_SCOMMON_START = .;
        build/us/src/assets/anime/anime_i.o(.scommon*);
        segment_anime_i_SCOMMON_END = .;
        segment_anime_i_SCOMMON_SIZE = ABSOLUTE(segment_anime_i_SCOMMON_END - segment_anime_i_SCOMMON_START);

        segment_anime_i_BSS_START = .;
        build/us/src/assets/anime/anime_i.o(.bss*);
        segment_anime_i_BSS_END = .;
        segment_anime_i_BSS_SIZE = ABSOLUTE(segment_anime_i_BSS_END - segment_anime_i_BSS_START);

        segment_anime_iCOMMON_START = .;
        build/us/src/assets/anime/anime_i.o(COMMON*);
        segment_anime_iCOMMON_END = .;
        segment_anime_iCOMMON_SIZE = ABSOLUTE(segment_anime_iCOMMON_END - segment_anime_iCOMMON_START);
    }

    segment_anime_i_noload_VRAM_END = .;
    segment_anime_i_noload_VRAM_SIZE = ABSOLUTE(segment_anime_i_noload_VRAM_END - segment_anime_i_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_i);
    segment_anime_i_VRAM_END = .;
    segment_anime_i_VRAM_SIZE = ABSOLUTE(segment_anime_i_VRAM_END - segment_anime_i_VRAM);
    segment_anime_i_ROM_END = __romPos;
    segment_anime_i_ROM_SIZE = ABSOLUTE(segment_anime_i_ROM_END - segment_anime_i_ROM_START);

    segment_anime_j_ROM_START = __romPos;
    segment_anime_j_VRAM = ADDR(.segment_anime_j);
    segment_anime_j_alloc_VRAM = .;

    .segment_anime_j 0x00000000 : AT(segment_anime_j_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_j_TEXT_START = .;
        build/us/src/assets/anime/anime_j.o(.text*);
        segment_anime_j_TEXT_END = .;
        segment_anime_j_TEXT_SIZE = ABSOLUTE(segment_anime_j_TEXT_END - segment_anime_j_TEXT_START);

        segment_anime_j_DATA_START = .;
        build/us/src/assets/anime/anime_j.o(.data*);
        segment_anime_j_DATA_END = .;
        segment_anime_j_DATA_SIZE = ABSOLUTE(segment_anime_j_DATA_END - segment_anime_j_DATA_START);

        segment_anime_j_RODATA_START = .;
        build/us/src/assets/anime/anime_j.o(.rodata*);
        segment_anime_j_RODATA_END = .;
        segment_anime_j_RODATA_SIZE = ABSOLUTE(segment_anime_j_RODATA_END - segment_anime_j_RODATA_START);

        segment_anime_j_SDATA_START = .;
        build/us/src/assets/anime/anime_j.o(.sdata*);
        segment_anime_j_SDATA_END = .;
        segment_anime_j_SDATA_SIZE = ABSOLUTE(segment_anime_j_SDATA_END - segment_anime_j_SDATA_START);
    }

    segment_anime_j_alloc_VRAM_END = .;
    segment_anime_j_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_j_alloc_VRAM_END - segment_anime_j_alloc_VRAM);

    segment_anime_j_noload_VRAM = .;

    .segment_anime_j.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_j_SBSS_START = .;
        build/us/src/assets/anime/anime_j.o(.sbss*);
        segment_anime_j_SBSS_END = .;
        segment_anime_j_SBSS_SIZE = ABSOLUTE(segment_anime_j_SBSS_END - segment_anime_j_SBSS_START);

        segment_anime_j_SCOMMON_START = .;
        build/us/src/assets/anime/anime_j.o(.scommon*);
        segment_anime_j_SCOMMON_END = .;
        segment_anime_j_SCOMMON_SIZE = ABSOLUTE(segment_anime_j_SCOMMON_END - segment_anime_j_SCOMMON_START);

        segment_anime_j_BSS_START = .;
        build/us/src/assets/anime/anime_j.o(.bss*);
        segment_anime_j_BSS_END = .;
        segment_anime_j_BSS_SIZE = ABSOLUTE(segment_anime_j_BSS_END - segment_anime_j_BSS_START);

        segment_anime_jCOMMON_START = .;
        build/us/src/assets/anime/anime_j.o(COMMON*);
        segment_anime_jCOMMON_END = .;
        segment_anime_jCOMMON_SIZE = ABSOLUTE(segment_anime_jCOMMON_END - segment_anime_jCOMMON_START);
    }

    segment_anime_j_noload_VRAM_END = .;
    segment_anime_j_noload_VRAM_SIZE = ABSOLUTE(segment_anime_j_noload_VRAM_END - segment_anime_j_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_j);
    segment_anime_j_VRAM_END = .;
    segment_anime_j_VRAM_SIZE = ABSOLUTE(segment_anime_j_VRAM_END - segment_anime_j_VRAM);
    segment_anime_j_ROM_END = __romPos;
    segment_anime_j_ROM_SIZE = ABSOLUTE(segment_anime_j_ROM_END - segment_anime_j_ROM_START);

    segment_anime_k_ROM_START = __romPos;
    segment_anime_k_VRAM = ADDR(.segment_anime_k);
    segment_anime_k_alloc_VRAM = .;

    .segment_anime_k 0x00000000 : AT(segment_anime_k_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_k_TEXT_START = .;
        build/us/src/assets/anime/anime_k.o(.text*);
        segment_anime_k_TEXT_END = .;
        segment_anime_k_TEXT_SIZE = ABSOLUTE(segment_anime_k_TEXT_END - segment_anime_k_TEXT_START);

        segment_anime_k_DATA_START = .;
        build/us/src/assets/anime/anime_k.o(.data*);
        segment_anime_k_DATA_END = .;
        segment_anime_k_DATA_SIZE = ABSOLUTE(segment_anime_k_DATA_END - segment_anime_k_DATA_START);

        segment_anime_k_RODATA_START = .;
        build/us/src/assets/anime/anime_k.o(.rodata*);
        segment_anime_k_RODATA_END = .;
        segment_anime_k_RODATA_SIZE = ABSOLUTE(segment_anime_k_RODATA_END - segment_anime_k_RODATA_START);

        segment_anime_k_SDATA_START = .;
        build/us/src/assets/anime/anime_k.o(.sdata*);
        segment_anime_k_SDATA_END = .;
        segment_anime_k_SDATA_SIZE = ABSOLUTE(segment_anime_k_SDATA_END - segment_anime_k_SDATA_START);
    }

    segment_anime_k_alloc_VRAM_END = .;
    segment_anime_k_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_k_alloc_VRAM_END - segment_anime_k_alloc_VRAM);

    segment_anime_k_noload_VRAM = .;

    .segment_anime_k.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_k_SBSS_START = .;
        build/us/src/assets/anime/anime_k.o(.sbss*);
        segment_anime_k_SBSS_END = .;
        segment_anime_k_SBSS_SIZE = ABSOLUTE(segment_anime_k_SBSS_END - segment_anime_k_SBSS_START);

        segment_anime_k_SCOMMON_START = .;
        build/us/src/assets/anime/anime_k.o(.scommon*);
        segment_anime_k_SCOMMON_END = .;
        segment_anime_k_SCOMMON_SIZE = ABSOLUTE(segment_anime_k_SCOMMON_END - segment_anime_k_SCOMMON_START);

        segment_anime_k_BSS_START = .;
        build/us/src/assets/anime/anime_k.o(.bss*);
        segment_anime_k_BSS_END = .;
        segment_anime_k_BSS_SIZE = ABSOLUTE(segment_anime_k_BSS_END - segment_anime_k_BSS_START);

        segment_anime_kCOMMON_START = .;
        build/us/src/assets/anime/anime_k.o(COMMON*);
        segment_anime_kCOMMON_END = .;
        segment_anime_kCOMMON_SIZE = ABSOLUTE(segment_anime_kCOMMON_END - segment_anime_kCOMMON_START);
    }

    segment_anime_k_noload_VRAM_END = .;
    segment_anime_k_noload_VRAM_SIZE = ABSOLUTE(segment_anime_k_noload_VRAM_END - segment_anime_k_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_k);
    segment_anime_k_VRAM_END = .;
    segment_anime_k_VRAM_SIZE = ABSOLUTE(segment_anime_k_VRAM_END - segment_anime_k_VRAM);
    segment_anime_k_ROM_END = __romPos;
    segment_anime_k_ROM_SIZE = ABSOLUTE(segment_anime_k_ROM_END - segment_anime_k_ROM_START);

    segment_anime_l_ROM_START = __romPos;
    segment_anime_l_VRAM = ADDR(.segment_anime_l);
    segment_anime_l_alloc_VRAM = .;

    .segment_anime_l 0x00000000 : AT(segment_anime_l_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_l_TEXT_START = .;
        build/us/src/assets/anime/anime_l.o(.text*);
        segment_anime_l_TEXT_END = .;
        segment_anime_l_TEXT_SIZE = ABSOLUTE(segment_anime_l_TEXT_END - segment_anime_l_TEXT_START);

        segment_anime_l_DATA_START = .;
        build/us/src/assets/anime/anime_l.o(.data*);
        segment_anime_l_DATA_END = .;
        segment_anime_l_DATA_SIZE = ABSOLUTE(segment_anime_l_DATA_END - segment_anime_l_DATA_START);

        segment_anime_l_RODATA_START = .;
        build/us/src/assets/anime/anime_l.o(.rodata*);
        segment_anime_l_RODATA_END = .;
        segment_anime_l_RODATA_SIZE = ABSOLUTE(segment_anime_l_RODATA_END - segment_anime_l_RODATA_START);

        segment_anime_l_SDATA_START = .;
        build/us/src/assets/anime/anime_l.o(.sdata*);
        segment_anime_l_SDATA_END = .;
        segment_anime_l_SDATA_SIZE = ABSOLUTE(segment_anime_l_SDATA_END - segment_anime_l_SDATA_START);
    }

    segment_anime_l_alloc_VRAM_END = .;
    segment_anime_l_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_l_alloc_VRAM_END - segment_anime_l_alloc_VRAM);

    segment_anime_l_noload_VRAM = .;

    .segment_anime_l.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_l_SBSS_START = .;
        build/us/src/assets/anime/anime_l.o(.sbss*);
        segment_anime_l_SBSS_END = .;
        segment_anime_l_SBSS_SIZE = ABSOLUTE(segment_anime_l_SBSS_END - segment_anime_l_SBSS_START);

        segment_anime_l_SCOMMON_START = .;
        build/us/src/assets/anime/anime_l.o(.scommon*);
        segment_anime_l_SCOMMON_END = .;
        segment_anime_l_SCOMMON_SIZE = ABSOLUTE(segment_anime_l_SCOMMON_END - segment_anime_l_SCOMMON_START);

        segment_anime_l_BSS_START = .;
        build/us/src/assets/anime/anime_l.o(.bss*);
        segment_anime_l_BSS_END = .;
        segment_anime_l_BSS_SIZE = ABSOLUTE(segment_anime_l_BSS_END - segment_anime_l_BSS_START);

        segment_anime_lCOMMON_START = .;
        build/us/src/assets/anime/anime_l.o(COMMON*);
        segment_anime_lCOMMON_END = .;
        segment_anime_lCOMMON_SIZE = ABSOLUTE(segment_anime_lCOMMON_END - segment_anime_lCOMMON_START);
    }

    segment_anime_l_noload_VRAM_END = .;
    segment_anime_l_noload_VRAM_SIZE = ABSOLUTE(segment_anime_l_noload_VRAM_END - segment_anime_l_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_l);
    segment_anime_l_VRAM_END = .;
    segment_anime_l_VRAM_SIZE = ABSOLUTE(segment_anime_l_VRAM_END - segment_anime_l_VRAM);
    segment_anime_l_ROM_END = __romPos;
    segment_anime_l_ROM_SIZE = ABSOLUTE(segment_anime_l_ROM_END - segment_anime_l_ROM_START);

    segment_anime_m_ROM_START = __romPos;
    segment_anime_m_VRAM = ADDR(.segment_anime_m);
    segment_anime_m_alloc_VRAM = .;

    .segment_anime_m 0x00000000 : AT(segment_anime_m_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_m_TEXT_START = .;
        build/us/src/assets/anime/anime_m.o(.text*);
        segment_anime_m_TEXT_END = .;
        segment_anime_m_TEXT_SIZE = ABSOLUTE(segment_anime_m_TEXT_END - segment_anime_m_TEXT_START);

        segment_anime_m_DATA_START = .;
        build/us/src/assets/anime/anime_m.o(.data*);
        segment_anime_m_DATA_END = .;
        segment_anime_m_DATA_SIZE = ABSOLUTE(segment_anime_m_DATA_END - segment_anime_m_DATA_START);

        segment_anime_m_RODATA_START = .;
        build/us/src/assets/anime/anime_m.o(.rodata*);
        segment_anime_m_RODATA_END = .;
        segment_anime_m_RODATA_SIZE = ABSOLUTE(segment_anime_m_RODATA_END - segment_anime_m_RODATA_START);

        segment_anime_m_SDATA_START = .;
        build/us/src/assets/anime/anime_m.o(.sdata*);
        segment_anime_m_SDATA_END = .;
        segment_anime_m_SDATA_SIZE = ABSOLUTE(segment_anime_m_SDATA_END - segment_anime_m_SDATA_START);
    }

    segment_anime_m_alloc_VRAM_END = .;
    segment_anime_m_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_m_alloc_VRAM_END - segment_anime_m_alloc_VRAM);

    segment_anime_m_noload_VRAM = .;

    .segment_anime_m.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_m_SBSS_START = .;
        build/us/src/assets/anime/anime_m.o(.sbss*);
        segment_anime_m_SBSS_END = .;
        segment_anime_m_SBSS_SIZE = ABSOLUTE(segment_anime_m_SBSS_END - segment_anime_m_SBSS_START);

        segment_anime_m_SCOMMON_START = .;
        build/us/src/assets/anime/anime_m.o(.scommon*);
        segment_anime_m_SCOMMON_END = .;
        segment_anime_m_SCOMMON_SIZE = ABSOLUTE(segment_anime_m_SCOMMON_END - segment_anime_m_SCOMMON_START);

        segment_anime_m_BSS_START = .;
        build/us/src/assets/anime/anime_m.o(.bss*);
        segment_anime_m_BSS_END = .;
        segment_anime_m_BSS_SIZE = ABSOLUTE(segment_anime_m_BSS_END - segment_anime_m_BSS_START);

        segment_anime_mCOMMON_START = .;
        build/us/src/assets/anime/anime_m.o(COMMON*);
        segment_anime_mCOMMON_END = .;
        segment_anime_mCOMMON_SIZE = ABSOLUTE(segment_anime_mCOMMON_END - segment_anime_mCOMMON_START);
    }

    segment_anime_m_noload_VRAM_END = .;
    segment_anime_m_noload_VRAM_SIZE = ABSOLUTE(segment_anime_m_noload_VRAM_END - segment_anime_m_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_m);
    segment_anime_m_VRAM_END = .;
    segment_anime_m_VRAM_SIZE = ABSOLUTE(segment_anime_m_VRAM_END - segment_anime_m_VRAM);
    segment_anime_m_ROM_END = __romPos;
    segment_anime_m_ROM_SIZE = ABSOLUTE(segment_anime_m_ROM_END - segment_anime_m_ROM_START);

    segment_anime_n_ROM_START = __romPos;
    segment_anime_n_VRAM = ADDR(.segment_anime_n);
    segment_anime_n_alloc_VRAM = .;

    .segment_anime_n 0x00000000 : AT(segment_anime_n_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_n_TEXT_START = .;
        build/us/src/assets/anime/anime_n.o(.text*);
        segment_anime_n_TEXT_END = .;
        segment_anime_n_TEXT_SIZE = ABSOLUTE(segment_anime_n_TEXT_END - segment_anime_n_TEXT_START);

        segment_anime_n_DATA_START = .;
        build/us/src/assets/anime/anime_n.o(.data*);
        segment_anime_n_DATA_END = .;
        segment_anime_n_DATA_SIZE = ABSOLUTE(segment_anime_n_DATA_END - segment_anime_n_DATA_START);

        segment_anime_n_RODATA_START = .;
        build/us/src/assets/anime/anime_n.o(.rodata*);
        segment_anime_n_RODATA_END = .;
        segment_anime_n_RODATA_SIZE = ABSOLUTE(segment_anime_n_RODATA_END - segment_anime_n_RODATA_START);

        segment_anime_n_SDATA_START = .;
        build/us/src/assets/anime/anime_n.o(.sdata*);
        segment_anime_n_SDATA_END = .;
        segment_anime_n_SDATA_SIZE = ABSOLUTE(segment_anime_n_SDATA_END - segment_anime_n_SDATA_START);
    }

    segment_anime_n_alloc_VRAM_END = .;
    segment_anime_n_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_n_alloc_VRAM_END - segment_anime_n_alloc_VRAM);

    segment_anime_n_noload_VRAM = .;

    .segment_anime_n.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_n_SBSS_START = .;
        build/us/src/assets/anime/anime_n.o(.sbss*);
        segment_anime_n_SBSS_END = .;
        segment_anime_n_SBSS_SIZE = ABSOLUTE(segment_anime_n_SBSS_END - segment_anime_n_SBSS_START);

        segment_anime_n_SCOMMON_START = .;
        build/us/src/assets/anime/anime_n.o(.scommon*);
        segment_anime_n_SCOMMON_END = .;
        segment_anime_n_SCOMMON_SIZE = ABSOLUTE(segment_anime_n_SCOMMON_END - segment_anime_n_SCOMMON_START);

        segment_anime_n_BSS_START = .;
        build/us/src/assets/anime/anime_n.o(.bss*);
        segment_anime_n_BSS_END = .;
        segment_anime_n_BSS_SIZE = ABSOLUTE(segment_anime_n_BSS_END - segment_anime_n_BSS_START);

        segment_anime_nCOMMON_START = .;
        build/us/src/assets/anime/anime_n.o(COMMON*);
        segment_anime_nCOMMON_END = .;
        segment_anime_nCOMMON_SIZE = ABSOLUTE(segment_anime_nCOMMON_END - segment_anime_nCOMMON_START);
    }

    segment_anime_n_noload_VRAM_END = .;
    segment_anime_n_noload_VRAM_SIZE = ABSOLUTE(segment_anime_n_noload_VRAM_END - segment_anime_n_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_n);
    segment_anime_n_VRAM_END = .;
    segment_anime_n_VRAM_SIZE = ABSOLUTE(segment_anime_n_VRAM_END - segment_anime_n_VRAM);
    segment_anime_n_ROM_END = __romPos;
    segment_anime_n_ROM_SIZE = ABSOLUTE(segment_anime_n_ROM_END - segment_anime_n_ROM_START);

    segment_anime_o_ROM_START = __romPos;
    segment_anime_o_VRAM = ADDR(.segment_anime_o);
    segment_anime_o_alloc_VRAM = .;

    .segment_anime_o 0x00000000 : AT(segment_anime_o_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_o_TEXT_START = .;
        build/us/src/assets/anime/anime_o.o(.text*);
        segment_anime_o_TEXT_END = .;
        segment_anime_o_TEXT_SIZE = ABSOLUTE(segment_anime_o_TEXT_END - segment_anime_o_TEXT_START);

        segment_anime_o_DATA_START = .;
        build/us/src/assets/anime/anime_o.o(.data*);
        segment_anime_o_DATA_END = .;
        segment_anime_o_DATA_SIZE = ABSOLUTE(segment_anime_o_DATA_END - segment_anime_o_DATA_START);

        segment_anime_o_RODATA_START = .;
        build/us/src/assets/anime/anime_o.o(.rodata*);
        segment_anime_o_RODATA_END = .;
        segment_anime_o_RODATA_SIZE = ABSOLUTE(segment_anime_o_RODATA_END - segment_anime_o_RODATA_START);

        segment_anime_o_SDATA_START = .;
        build/us/src/assets/anime/anime_o.o(.sdata*);
        segment_anime_o_SDATA_END = .;
        segment_anime_o_SDATA_SIZE = ABSOLUTE(segment_anime_o_SDATA_END - segment_anime_o_SDATA_START);
    }

    segment_anime_o_alloc_VRAM_END = .;
    segment_anime_o_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_o_alloc_VRAM_END - segment_anime_o_alloc_VRAM);

    segment_anime_o_noload_VRAM = .;

    .segment_anime_o.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_o_SBSS_START = .;
        build/us/src/assets/anime/anime_o.o(.sbss*);
        segment_anime_o_SBSS_END = .;
        segment_anime_o_SBSS_SIZE = ABSOLUTE(segment_anime_o_SBSS_END - segment_anime_o_SBSS_START);

        segment_anime_o_SCOMMON_START = .;
        build/us/src/assets/anime/anime_o.o(.scommon*);
        segment_anime_o_SCOMMON_END = .;
        segment_anime_o_SCOMMON_SIZE = ABSOLUTE(segment_anime_o_SCOMMON_END - segment_anime_o_SCOMMON_START);

        segment_anime_o_BSS_START = .;
        build/us/src/assets/anime/anime_o.o(.bss*);
        segment_anime_o_BSS_END = .;
        segment_anime_o_BSS_SIZE = ABSOLUTE(segment_anime_o_BSS_END - segment_anime_o_BSS_START);

        segment_anime_oCOMMON_START = .;
        build/us/src/assets/anime/anime_o.o(COMMON*);
        segment_anime_oCOMMON_END = .;
        segment_anime_oCOMMON_SIZE = ABSOLUTE(segment_anime_oCOMMON_END - segment_anime_oCOMMON_START);
    }

    segment_anime_o_noload_VRAM_END = .;
    segment_anime_o_noload_VRAM_SIZE = ABSOLUTE(segment_anime_o_noload_VRAM_END - segment_anime_o_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_o);
    segment_anime_o_VRAM_END = .;
    segment_anime_o_VRAM_SIZE = ABSOLUTE(segment_anime_o_VRAM_END - segment_anime_o_VRAM);
    segment_anime_o_ROM_END = __romPos;
    segment_anime_o_ROM_SIZE = ABSOLUTE(segment_anime_o_ROM_END - segment_anime_o_ROM_START);

    segment_anime_mario_ROM_START = __romPos;
    segment_anime_mario_VRAM = ADDR(.segment_anime_mario);
    segment_anime_mario_alloc_VRAM = .;

    .segment_anime_mario 0x00000000 : AT(segment_anime_mario_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_mario_TEXT_START = .;
        build/us/src/assets/anime/anime_mario.o(.text*);
        segment_anime_mario_TEXT_END = .;
        segment_anime_mario_TEXT_SIZE = ABSOLUTE(segment_anime_mario_TEXT_END - segment_anime_mario_TEXT_START);

        segment_anime_mario_DATA_START = .;
        build/us/src/assets/anime/anime_mario.o(.data*);
        segment_anime_mario_DATA_END = .;
        segment_anime_mario_DATA_SIZE = ABSOLUTE(segment_anime_mario_DATA_END - segment_anime_mario_DATA_START);

        segment_anime_mario_RODATA_START = .;
        build/us/src/assets/anime/anime_mario.o(.rodata*);
        segment_anime_mario_RODATA_END = .;
        segment_anime_mario_RODATA_SIZE = ABSOLUTE(segment_anime_mario_RODATA_END - segment_anime_mario_RODATA_START);

        segment_anime_mario_SDATA_START = .;
        build/us/src/assets/anime/anime_mario.o(.sdata*);
        segment_anime_mario_SDATA_END = .;
        segment_anime_mario_SDATA_SIZE = ABSOLUTE(segment_anime_mario_SDATA_END - segment_anime_mario_SDATA_START);
    }

    segment_anime_mario_alloc_VRAM_END = .;
    segment_anime_mario_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_mario_alloc_VRAM_END - segment_anime_mario_alloc_VRAM);

    segment_anime_mario_noload_VRAM = .;

    .segment_anime_mario.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_mario_SBSS_START = .;
        build/us/src/assets/anime/anime_mario.o(.sbss*);
        segment_anime_mario_SBSS_END = .;
        segment_anime_mario_SBSS_SIZE = ABSOLUTE(segment_anime_mario_SBSS_END - segment_anime_mario_SBSS_START);

        segment_anime_mario_SCOMMON_START = .;
        build/us/src/assets/anime/anime_mario.o(.scommon*);
        segment_anime_mario_SCOMMON_END = .;
        segment_anime_mario_SCOMMON_SIZE = ABSOLUTE(segment_anime_mario_SCOMMON_END - segment_anime_mario_SCOMMON_START);

        segment_anime_mario_BSS_START = .;
        build/us/src/assets/anime/anime_mario.o(.bss*);
        segment_anime_mario_BSS_END = .;
        segment_anime_mario_BSS_SIZE = ABSOLUTE(segment_anime_mario_BSS_END - segment_anime_mario_BSS_START);

        segment_anime_marioCOMMON_START = .;
        build/us/src/assets/anime/anime_mario.o(COMMON*);
        segment_anime_marioCOMMON_END = .;
        segment_anime_marioCOMMON_SIZE = ABSOLUTE(segment_anime_marioCOMMON_END - segment_anime_marioCOMMON_START);
    }

    segment_anime_mario_noload_VRAM_END = .;
    segment_anime_mario_noload_VRAM_SIZE = ABSOLUTE(segment_anime_mario_noload_VRAM_END - segment_anime_mario_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_mario);
    segment_anime_mario_VRAM_END = .;
    segment_anime_mario_VRAM_SIZE = ABSOLUTE(segment_anime_mario_VRAM_END - segment_anime_mario_VRAM);
    segment_anime_mario_ROM_END = __romPos;
    segment_anime_mario_ROM_SIZE = ABSOLUTE(segment_anime_mario_ROM_END - segment_anime_mario_ROM_START);

    segment_anime_virus_b_ROM_START = __romPos;
    segment_anime_virus_b_VRAM = ADDR(.segment_anime_virus_b);
    segment_anime_virus_b_alloc_VRAM = .;

    .segment_anime_virus_b 0x00000000 : AT(segment_anime_virus_b_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_virus_b_TEXT_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.text*);
        segment_anime_virus_b_TEXT_END = .;
        segment_anime_virus_b_TEXT_SIZE = ABSOLUTE(segment_anime_virus_b_TEXT_END - segment_anime_virus_b_TEXT_START);

        segment_anime_virus_b_DATA_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.data*);
        segment_anime_virus_b_DATA_END = .;
        segment_anime_virus_b_DATA_SIZE = ABSOLUTE(segment_anime_virus_b_DATA_END - segment_anime_virus_b_DATA_START);

        segment_anime_virus_b_RODATA_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.rodata*);
        segment_anime_virus_b_RODATA_END = .;
        segment_anime_virus_b_RODATA_SIZE = ABSOLUTE(segment_anime_virus_b_RODATA_END - segment_anime_virus_b_RODATA_START);

        segment_anime_virus_b_SDATA_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.sdata*);
        segment_anime_virus_b_SDATA_END = .;
        segment_anime_virus_b_SDATA_SIZE = ABSOLUTE(segment_anime_virus_b_SDATA_END - segment_anime_virus_b_SDATA_START);
    }

    segment_anime_virus_b_alloc_VRAM_END = .;
    segment_anime_virus_b_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_virus_b_alloc_VRAM_END - segment_anime_virus_b_alloc_VRAM);

    segment_anime_virus_b_noload_VRAM = .;

    .segment_anime_virus_b.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_virus_b_SBSS_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.sbss*);
        segment_anime_virus_b_SBSS_END = .;
        segment_anime_virus_b_SBSS_SIZE = ABSOLUTE(segment_anime_virus_b_SBSS_END - segment_anime_virus_b_SBSS_START);

        segment_anime_virus_b_SCOMMON_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.scommon*);
        segment_anime_virus_b_SCOMMON_END = .;
        segment_anime_virus_b_SCOMMON_SIZE = ABSOLUTE(segment_anime_virus_b_SCOMMON_END - segment_anime_virus_b_SCOMMON_START);

        segment_anime_virus_b_BSS_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.bss*);
        segment_anime_virus_b_BSS_END = .;
        segment_anime_virus_b_BSS_SIZE = ABSOLUTE(segment_anime_virus_b_BSS_END - segment_anime_virus_b_BSS_START);

        segment_anime_virus_bCOMMON_START = .;
        build/us/src/assets/anime/anime_virus_b.o(COMMON*);
        segment_anime_virus_bCOMMON_END = .;
        segment_anime_virus_bCOMMON_SIZE = ABSOLUTE(segment_anime_virus_bCOMMON_END - segment_anime_virus_bCOMMON_START);
    }

    segment_anime_virus_b_noload_VRAM_END = .;
    segment_anime_virus_b_noload_VRAM_SIZE = ABSOLUTE(segment_anime_virus_b_noload_VRAM_END - segment_anime_virus_b_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_virus_b);
    segment_anime_virus_b_VRAM_END = .;
    segment_anime_virus_b_VRAM_SIZE = ABSOLUTE(segment_anime_virus_b_VRAM_END - segment_anime_virus_b_VRAM);
    segment_anime_virus_b_ROM_END = __romPos;
    segment_anime_virus_b_ROM_SIZE = ABSOLUTE(segment_anime_virus_b_ROM_END - segment_anime_virus_b_ROM_START);

    segment_anime_virus_r_ROM_START = __romPos;
    segment_anime_virus_r_VRAM = ADDR(.segment_anime_virus_r);
    segment_anime_virus_r_alloc_VRAM = .;

    .segment_anime_virus_r 0x00000000 : AT(segment_anime_virus_r_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_virus_r_TEXT_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.text*);
        segment_anime_virus_r_TEXT_END = .;
        segment_anime_virus_r_TEXT_SIZE = ABSOLUTE(segment_anime_virus_r_TEXT_END - segment_anime_virus_r_TEXT_START);

        segment_anime_virus_r_DATA_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.data*);
        segment_anime_virus_r_DATA_END = .;
        segment_anime_virus_r_DATA_SIZE = ABSOLUTE(segment_anime_virus_r_DATA_END - segment_anime_virus_r_DATA_START);

        segment_anime_virus_r_RODATA_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.rodata*);
        segment_anime_virus_r_RODATA_END = .;
        segment_anime_virus_r_RODATA_SIZE = ABSOLUTE(segment_anime_virus_r_RODATA_END - segment_anime_virus_r_RODATA_START);

        segment_anime_virus_r_SDATA_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.sdata*);
        segment_anime_virus_r_SDATA_END = .;
        segment_anime_virus_r_SDATA_SIZE = ABSOLUTE(segment_anime_virus_r_SDATA_END - segment_anime_virus_r_SDATA_START);
    }

    segment_anime_virus_r_alloc_VRAM_END = .;
    segment_anime_virus_r_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_virus_r_alloc_VRAM_END - segment_anime_virus_r_alloc_VRAM);

    segment_anime_virus_r_noload_VRAM = .;

    .segment_anime_virus_r.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_virus_r_SBSS_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.sbss*);
        segment_anime_virus_r_SBSS_END = .;
        segment_anime_virus_r_SBSS_SIZE = ABSOLUTE(segment_anime_virus_r_SBSS_END - segment_anime_virus_r_SBSS_START);

        segment_anime_virus_r_SCOMMON_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.scommon*);
        segment_anime_virus_r_SCOMMON_END = .;
        segment_anime_virus_r_SCOMMON_SIZE = ABSOLUTE(segment_anime_virus_r_SCOMMON_END - segment_anime_virus_r_SCOMMON_START);

        segment_anime_virus_r_BSS_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.bss*);
        segment_anime_virus_r_BSS_END = .;
        segment_anime_virus_r_BSS_SIZE = ABSOLUTE(segment_anime_virus_r_BSS_END - segment_anime_virus_r_BSS_START);

        segment_anime_virus_rCOMMON_START = .;
        build/us/src/assets/anime/anime_virus_r.o(COMMON*);
        segment_anime_virus_rCOMMON_END = .;
        segment_anime_virus_rCOMMON_SIZE = ABSOLUTE(segment_anime_virus_rCOMMON_END - segment_anime_virus_rCOMMON_START);
    }

    segment_anime_virus_r_noload_VRAM_END = .;
    segment_anime_virus_r_noload_VRAM_SIZE = ABSOLUTE(segment_anime_virus_r_noload_VRAM_END - segment_anime_virus_r_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_virus_r);
    segment_anime_virus_r_VRAM_END = .;
    segment_anime_virus_r_VRAM_SIZE = ABSOLUTE(segment_anime_virus_r_VRAM_END - segment_anime_virus_r_VRAM);
    segment_anime_virus_r_ROM_END = __romPos;
    segment_anime_virus_r_ROM_SIZE = ABSOLUTE(segment_anime_virus_r_ROM_END - segment_anime_virus_r_ROM_START);

    segment_anime_virus_y_ROM_START = __romPos;
    segment_anime_virus_y_VRAM = ADDR(.segment_anime_virus_y);
    segment_anime_virus_y_alloc_VRAM = .;

    .segment_anime_virus_y 0x00000000 : AT(segment_anime_virus_y_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_virus_y_TEXT_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.text*);
        segment_anime_virus_y_TEXT_END = .;
        segment_anime_virus_y_TEXT_SIZE = ABSOLUTE(segment_anime_virus_y_TEXT_END - segment_anime_virus_y_TEXT_START);

        segment_anime_virus_y_DATA_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.data*);
        segment_anime_virus_y_DATA_END = .;
        segment_anime_virus_y_DATA_SIZE = ABSOLUTE(segment_anime_virus_y_DATA_END - segment_anime_virus_y_DATA_START);

        segment_anime_virus_y_RODATA_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.rodata*);
        segment_anime_virus_y_RODATA_END = .;
        segment_anime_virus_y_RODATA_SIZE = ABSOLUTE(segment_anime_virus_y_RODATA_END - segment_anime_virus_y_RODATA_START);

        segment_anime_virus_y_SDATA_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.sdata*);
        segment_anime_virus_y_SDATA_END = .;
        segment_anime_virus_y_SDATA_SIZE = ABSOLUTE(segment_anime_virus_y_SDATA_END - segment_anime_virus_y_SDATA_START);
    }

    segment_anime_virus_y_alloc_VRAM_END = .;
    segment_anime_virus_y_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_virus_y_alloc_VRAM_END - segment_anime_virus_y_alloc_VRAM);

    segment_anime_virus_y_noload_VRAM = .;

    .segment_anime_virus_y.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_virus_y_SBSS_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.sbss*);
        segment_anime_virus_y_SBSS_END = .;
        segment_anime_virus_y_SBSS_SIZE = ABSOLUTE(segment_anime_virus_y_SBSS_END - segment_anime_virus_y_SBSS_START);

        segment_anime_virus_y_SCOMMON_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.scommon*);
        segment_anime_virus_y_SCOMMON_END = .;
        segment_anime_virus_y_SCOMMON_SIZE = ABSOLUTE(segment_anime_virus_y_SCOMMON_END - segment_anime_virus_y_SCOMMON_START);

        segment_anime_virus_y_BSS_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.bss*);
        segment_anime_virus_y_BSS_END = .;
        segment_anime_virus_y_BSS_SIZE = ABSOLUTE(segment_anime_virus_y_BSS_END - segment_anime_virus_y_BSS_START);

        segment_anime_virus_yCOMMON_START = .;
        build/us/src/assets/anime/anime_virus_y.o(COMMON*);
        segment_anime_virus_yCOMMON_END = .;
        segment_anime_virus_yCOMMON_SIZE = ABSOLUTE(segment_anime_virus_yCOMMON_END - segment_anime_virus_yCOMMON_START);
    }

    segment_anime_virus_y_noload_VRAM_END = .;
    segment_anime_virus_y_noload_VRAM_SIZE = ABSOLUTE(segment_anime_virus_y_noload_VRAM_END - segment_anime_virus_y_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_virus_y);
    segment_anime_virus_y_VRAM_END = .;
    segment_anime_virus_y_VRAM_SIZE = ABSOLUTE(segment_anime_virus_y_VRAM_END - segment_anime_virus_y_VRAM);
    segment_anime_virus_y_ROM_END = __romPos;
    segment_anime_virus_y_ROM_SIZE = ABSOLUTE(segment_anime_virus_y_ROM_END - segment_anime_virus_y_ROM_START);

    segment_anime_smog_ROM_START = __romPos;
    segment_anime_smog_VRAM = ADDR(.segment_anime_smog);
    segment_anime_smog_alloc_VRAM = .;

    .segment_anime_smog 0x00000000 : AT(segment_anime_smog_ROM_START)
    {
        FILL(0x00000000);
        segment_anime_smog_TEXT_START = .;
        build/us/src/assets/anime/anime_smog.o(.text*);
        segment_anime_smog_TEXT_END = .;
        segment_anime_smog_TEXT_SIZE = ABSOLUTE(segment_anime_smog_TEXT_END - segment_anime_smog_TEXT_START);

        segment_anime_smog_DATA_START = .;
        build/us/src/assets/anime/anime_smog.o(.data*);
        segment_anime_smog_DATA_END = .;
        segment_anime_smog_DATA_SIZE = ABSOLUTE(segment_anime_smog_DATA_END - segment_anime_smog_DATA_START);

        segment_anime_smog_RODATA_START = .;
        build/us/src/assets/anime/anime_smog.o(.rodata*);
        segment_anime_smog_RODATA_END = .;
        segment_anime_smog_RODATA_SIZE = ABSOLUTE(segment_anime_smog_RODATA_END - segment_anime_smog_RODATA_START);

        segment_anime_smog_SDATA_START = .;
        build/us/src/assets/anime/anime_smog.o(.sdata*);
        segment_anime_smog_SDATA_END = .;
        segment_anime_smog_SDATA_SIZE = ABSOLUTE(segment_anime_smog_SDATA_END - segment_anime_smog_SDATA_START);
    }

    segment_anime_smog_alloc_VRAM_END = .;
    segment_anime_smog_alloc_VRAM_SIZE = ABSOLUTE(segment_anime_smog_alloc_VRAM_END - segment_anime_smog_alloc_VRAM);

    segment_anime_smog_noload_VRAM = .;

    .segment_anime_smog.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_anime_smog_SBSS_START = .;
        build/us/src/assets/anime/anime_smog.o(.sbss*);
        segment_anime_smog_SBSS_END = .;
        segment_anime_smog_SBSS_SIZE = ABSOLUTE(segment_anime_smog_SBSS_END - segment_anime_smog_SBSS_START);

        segment_anime_smog_SCOMMON_START = .;
        build/us/src/assets/anime/anime_smog.o(.scommon*);
        segment_anime_smog_SCOMMON_END = .;
        segment_anime_smog_SCOMMON_SIZE = ABSOLUTE(segment_anime_smog_SCOMMON_END - segment_anime_smog_SCOMMON_START);

        segment_anime_smog_BSS_START = .;
        build/us/src/assets/anime/anime_smog.o(.bss*);
        segment_anime_smog_BSS_END = .;
        segment_anime_smog_BSS_SIZE = ABSOLUTE(segment_anime_smog_BSS_END - segment_anime_smog_BSS_START);

        segment_anime_smogCOMMON_START = .;
        build/us/src/assets/anime/anime_smog.o(COMMON*);
        segment_anime_smogCOMMON_END = .;
        segment_anime_smogCOMMON_SIZE = ABSOLUTE(segment_anime_smogCOMMON_END - segment_anime_smogCOMMON_START);
    }

    segment_anime_smog_noload_VRAM_END = .;
    segment_anime_smog_noload_VRAM_SIZE = ABSOLUTE(segment_anime_smog_noload_VRAM_END - segment_anime_smog_noload_VRAM);

    __romPos += SIZEOF(.segment_anime_smog);
    segment_anime_smog_VRAM_END = .;
    segment_anime_smog_VRAM_SIZE = ABSOLUTE(segment_anime_smog_VRAM_END - segment_anime_smog_VRAM);
    segment_anime_smog_ROM_END = __romPos;
    segment_anime_smog_ROM_SIZE = ABSOLUTE(segment_anime_smog_ROM_END - segment_anime_smog_ROM_START);

    segment_tutorial_data_ROM_START = __romPos;
    segment_tutorial_data_VRAM = ADDR(.segment_tutorial_data);
    segment_tutorial_data_alloc_VRAM = .;

    .segment_tutorial_data 0x00000000 : AT(segment_tutorial_data_ROM_START)
    {
        FILL(0x00000000);
        segment_tutorial_data_TEXT_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.text*);
        segment_tutorial_data_TEXT_END = .;
        segment_tutorial_data_TEXT_SIZE = ABSOLUTE(segment_tutorial_data_TEXT_END - segment_tutorial_data_TEXT_START);

        segment_tutorial_data_DATA_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.data*);
        segment_tutorial_data_DATA_END = .;
        segment_tutorial_data_DATA_SIZE = ABSOLUTE(segment_tutorial_data_DATA_END - segment_tutorial_data_DATA_START);

        segment_tutorial_data_RODATA_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.rodata*);
        segment_tutorial_data_RODATA_END = .;
        segment_tutorial_data_RODATA_SIZE = ABSOLUTE(segment_tutorial_data_RODATA_END - segment_tutorial_data_RODATA_START);

        segment_tutorial_data_SDATA_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.sdata*);
        segment_tutorial_data_SDATA_END = .;
        segment_tutorial_data_SDATA_SIZE = ABSOLUTE(segment_tutorial_data_SDATA_END - segment_tutorial_data_SDATA_START);
    }

    segment_tutorial_data_alloc_VRAM_END = .;
    segment_tutorial_data_alloc_VRAM_SIZE = ABSOLUTE(segment_tutorial_data_alloc_VRAM_END - segment_tutorial_data_alloc_VRAM);

    segment_tutorial_data_noload_VRAM = .;

    .segment_tutorial_data.noload (NOLOAD) :
    {
        FILL(0x00000000);
        segment_tutorial_data_SBSS_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.sbss*);
        segment_tutorial_data_SBSS_END = .;
        segment_tutorial_data_SBSS_SIZE = ABSOLUTE(segment_tutorial_data_SBSS_END - segment_tutorial_data_SBSS_START);

        segment_tutorial_data_SCOMMON_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.scommon*);
        segment_tutorial_data_SCOMMON_END = .;
        segment_tutorial_data_SCOMMON_SIZE = ABSOLUTE(segment_tutorial_data_SCOMMON_END - segment_tutorial_data_SCOMMON_START);

        segment_tutorial_data_BSS_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.bss*);
        segment_tutorial_data_BSS_END = .;
        segment_tutorial_data_BSS_SIZE = ABSOLUTE(segment_tutorial_data_BSS_END - segment_tutorial_data_BSS_START);

        segment_tutorial_dataCOMMON_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(COMMON*);
        segment_tutorial_dataCOMMON_END = .;
        segment_tutorial_dataCOMMON_SIZE = ABSOLUTE(segment_tutorial_dataCOMMON_END - segment_tutorial_dataCOMMON_START);
    }

    segment_tutorial_data_noload_VRAM_END = .;
    segment_tutorial_data_noload_VRAM_SIZE = ABSOLUTE(segment_tutorial_data_noload_VRAM_END - segment_tutorial_data_noload_VRAM);

    __romPos += SIZEOF(.segment_tutorial_data);
    segment_tutorial_data_VRAM_END = .;
    segment_tutorial_data_VRAM_SIZE = ABSOLUTE(segment_tutorial_data_VRAM_END - segment_tutorial_data_VRAM);
    segment_tutorial_data_ROM_END = __romPos;
    segment_tutorial_data_ROM_SIZE = ABSOLUTE(segment_tutorial_data_ROM_END - segment_tutorial_data_ROM_START);

    .pdr 0 :
    {
        *(.pdr);
    }
    .mdebug 0 :
    {
        *(.mdebug);
    }
    .mdebug.abi32 0 :
    {
        *(.mdebug.abi32);
    }
    .debug 0 :
    {
        *(.debug);
    }
    .line 0 :
    {
        *(.line);
    }
    .debug_srcinfo 0 :
    {
        *(.debug_srcinfo);
    }
    .debug_sfnames 0 :
    {
        *(.debug_sfnames);
    }
    .debug_aranges 0 :
    {
        *(.debug_aranges);
    }
    .debug_pubnames 0 :
    {
        *(.debug_pubnames);
    }
    .debug_info 0 :
    {
        *(.debug_info);
    }
    .debug_abbrev 0 :
    {
        *(.debug_abbrev);
    }
    .debug_line 0 :
    {
        *(.debug_line);
    }
    .debug_line_end 0 :
    {
        *(.debug_line_end);
    }
    .debug_frame 0 :
    {
        *(.debug_frame);
    }
    .debug_str 0 :
    {
        *(.debug_str);
    }
    .debug_loc 0 :
    {
        *(.debug_loc);
    }
    .debug_macinfo 0 :
    {
        *(.debug_macinfo);
    }
    .debug_weaknames 0 :
    {
        *(.debug_weaknames);
    }
    .debug_funcnames 0 :
    {
        *(.debug_funcnames);
    }
    .debug_typenames 0 :
    {
        *(.debug_typenames);
    }
    .debug_varnames 0 :
    {
        *(.debug_varnames);
    }
    .debug_pubtypes 0 :
    {
        *(.debug_pubtypes);
    }
    .debug_ranges 0 :
    {
        *(.debug_ranges);
    }
    .debug_addr 0 :
    {
        *(.debug_addr);
    }
    .debug_line_str 0 :
    {
        *(.debug_line_str);
    }
    .debug_loclists 0 :
    {
        *(.debug_loclists);
    }
    .debug_macro 0 :
    {
        *(.debug_macro);
    }
    .debug_names 0 :
    {
        *(.debug_names);
    }
    .debug_rnglists 0 :
    {
        *(.debug_rnglists);
    }
    .debug_str_offsets 0 :
    {
        *(.debug_str_offsets);
    }
    .debug_sup 0 :
    {
        *(.debug_sup);
    }
    .gnu.attributes 0 :
    {
        *(.gnu.attributes);
    }
    .note 0 :
    {
        *(.note);
    }
    .comment 0 :
    {
        *(.comment);
    }

    .symtab 0 :
    {
        *(.symtab);
    }
    .strtab 0 :
    {
        *(.strtab);
    }
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

ENTRY(entrypoint);

ASSERT((boot_ROM_END <= 0x101000), "Error: boot segment is larger than 1 MiB");
