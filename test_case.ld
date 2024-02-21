SECTIONS
{
    __romPos = 0x0;

    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    .header 0x8F000000 : AT(header_ROM_START)
    {
        header_text_START = .;
        build/us/rom_header/rom_header.o(.text);
        header_text_END = .;
        header_text_SIZE = ABSOLUTE(header_text_END - header_text_START);
        header_data_START = .;
        build/us/rom_header/rom_header.o(.data);
        header_data_END = .;
        header_data_SIZE = ABSOLUTE(header_data_END - header_data_START);
        header_rodata_START = .;
        build/us/rom_header/rom_header.o(.rodata);
        header_rodata_END = .;
        header_rodata_SIZE = ABSOLUTE(header_rodata_END - header_rodata_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    .header (NOLOAD) :
    {
        header_bss_START = .;
        build/us/rom_header/rom_header.o(.sbss);
        build/us/rom_header/rom_header.o(.scommon);
        build/us/rom_header/rom_header.o(.bss);
        build/us/rom_header/rom_header.o(COMMON);
        header_bss_END = .;
        header_bss_SIZE = ABSOLUTE(header_bss_END - header_bss_START);
    }
    header_VRAM_END = .;

    ipl3_ROM_START = __romPos;
    ipl3_VRAM = ADDR(.ipl3);
    .ipl3 : AT(ipl3_ROM_START)
    {
        ipl3_text_START = .;
        build/us/asm/data/ipl3.o(.text);
        ipl3_text_END = .;
        ipl3_text_SIZE = ABSOLUTE(ipl3_text_END - ipl3_text_START);
        ipl3_data_START = .;
        build/us/asm/data/ipl3.o(.data);
        ipl3_data_END = .;
        ipl3_data_SIZE = ABSOLUTE(ipl3_data_END - ipl3_data_START);
        ipl3_rodata_START = .;
        build/us/asm/data/ipl3.o(.rodata);
        ipl3_rodata_END = .;
        ipl3_rodata_SIZE = ABSOLUTE(ipl3_rodata_END - ipl3_rodata_START);
    }
    __romPos += SIZEOF(.ipl3);
    ipl3_ROM_END = __romPos;
    .ipl3 (NOLOAD) :
    {
        ipl3_bss_START = .;
        build/us/asm/data/ipl3.o(.sbss);
        build/us/asm/data/ipl3.o(.scommon);
        build/us/asm/data/ipl3.o(.bss);
        build/us/asm/data/ipl3.o(COMMON);
        ipl3_bss_END = .;
        ipl3_bss_SIZE = ABSOLUTE(ipl3_bss_END - ipl3_bss_START);
    }
    ipl3_VRAM_END = .;

    entry_ROM_START = __romPos;
    entry_VRAM = ADDR(.entry);
    .entry 0x80000400 : AT(entry_ROM_START)
    {
        entry_text_START = .;
        build/us/src/entry/entry.o(.text);
        entry_text_END = .;
        entry_text_SIZE = ABSOLUTE(entry_text_END - entry_text_START);
        entry_data_START = .;
        build/us/src/entry/entry.o(.data);
        entry_data_END = .;
        entry_data_SIZE = ABSOLUTE(entry_data_END - entry_data_START);
        entry_rodata_START = .;
        build/us/src/entry/entry.o(.rodata);
        entry_rodata_END = .;
        entry_rodata_SIZE = ABSOLUTE(entry_rodata_END - entry_rodata_START);
    }
    __romPos += SIZEOF(.entry);
    entry_ROM_END = __romPos;
    .entry (NOLOAD) :
    {
        entry_bss_START = .;
        build/us/src/entry/entry.o(.sbss);
        build/us/src/entry/entry.o(.scommon);
        build/us/src/entry/entry.o(.bss);
        build/us/src/entry/entry.o(COMMON);
        entry_bss_END = .;
        entry_bss_SIZE = ABSOLUTE(entry_bss_END - entry_bss_START);
    }
    entry_VRAM_END = .;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    .boot : AT(boot_ROM_START)
    {
        boot_text_START = .;
        build/us/src/boot/boot_main.o(.text);
        build/us/src/boot/dmadata.o(.text);
        build/us/src/gzip/inflate.o(.text);
        build/us/src/gzip/unzip.o(.text);
        build/us/src/boot/util.o(.text);
        build/us/src/boot/rom_offsets.o(.text);
        build/us/lib/ultralib/src/io/conteepprobe.o(.text);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.text);
        build/us/lib/ultralib/src/io/conteeplongread.o(.text);
        build/us/lib/ultralib/src/io/pimgr.o(.text);
        build/us/lib/ultralib/src/io/epirawdma.o(.text);
        build/us/lib/ultralib/src/io/epidma.o(.text);
        build/us/lib/ultralib/src/io/cartrominit.o(.text);
        build/us/lib/ultralib/src/io/devmgr.o(.text);
        build/us/lib/ultralib/src/io/piacs.o(.text);
        build/us/lib/ultralib/src/io/pidma.o(.text);
        build/us/lib/ultralib/src/io/aigetlen.o(.text);
        build/us/lib/ultralib/src/io/aigetstat.o(.text);
        build/us/lib/ultralib/src/io/aisetfreq.o(.text);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.text);
        build/us/lib/ultralib/src/audio/env.o(.text);
        build/us/lib/ultralib/src/audio/sl.o(.text);
        build/us/lib/ultralib/src/audio/heapinit.o(.text);
        build/us/lib/ultralib/src/audio/synthesizer.o(.text);
        build/us/lib/ultralib/src/audio/syndelete.o(.text);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.text);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.text);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.text);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.text);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.text);
        build/us/lib/ultralib/src/audio/synsetvol.o(.text);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.text);
        build/us/lib/ultralib/src/audio/synsetpan.o(.text);
        build/us/lib/ultralib/src/audio/synallocfx.o(.text);
        build/us/lib/ultralib/src/os/invaldcache.o(.text);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.text);
        build/us/lib/ultralib/src/io/contquery.o(.text);
        build/us/lib/ultralib/src/io/contreaddata.o(.text);
        build/us/lib/ultralib/src/io/controller.o(.text);
        build/us/lib/ultralib/src/io/contsetch.o(.text);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.text);
        build/us/lib/ultralib/src/gu/sqrtf.o(.text);
        build/us/lib/ultralib/src/gu/cosf.o(.text);
        build/us/lib/ultralib/src/gu/ortho.o(.text);
        build/us/lib/ultralib/src/gu/perspective.o(.text);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.text);
        build/us/lib/ultralib/src/gu/sinf.o(.text);
        build/us/lib/ultralib/src/gu/sins.o(.text);
        build/us/lib/ultralib/src/libc/bcmp.o(.text);
        build/us/lib/ultralib/src/libc/bcopy.o(.text);
        build/us/lib/ultralib/src/libc/bzero.o(.text);
        build/us/lib/ultralib/src/libc/string.o(.text);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.text);
        build/us/lib/ultralib/src/os/jammesg.o(.text);
        build/us/lib/ultralib/src/os/recvmesg.o(.text);
        build/us/lib/ultralib/src/os/sendmesg.o(.text);
        build/us/lib/ultralib/src/os/seteventmesg.o(.text);
        build/us/lib/ultralib/src/io/sptask.o(.text);
        build/us/lib/ultralib/src/io/sptaskyield.o(.text);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.text);
        build/us/lib/ultralib/src/sched/sched.o(.text);
        build/us/lib/ultralib/src/io/sirawdma.o(.text);
        build/us/lib/ultralib/src/io/siacs.o(.text);
        build/us/lib/ultralib/src/os/createthread.o(.text);
        build/us/lib/ultralib/src/os/getthreadpri.o(.text);
        build/us/lib/ultralib/src/os/setthreadpri.o(.text);
        build/us/lib/ultralib/src/os/startthread.o(.text);
        build/us/lib/ultralib/src/os/stopthread.o(.text);
        build/us/lib/ultralib/src/os/thread.o(.text);
        build/us/lib/ultralib/src/os/yieldthread.o(.text);
        build/us/lib/ultralib/src/os/gettime.o(.text);
        build/us/lib/ultralib/src/os/settime.o(.text);
        build/us/lib/ultralib/src/os/settimer.o(.text);
        build/us/lib/ultralib/src/os/timerintr.o(.text);
        build/us/lib/ultralib/src/os/probetlb.o(.text);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.text);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.text);
        build/us/lib/ultralib/src/io/vimgr.o(.text);
        build/us/lib/ultralib/src/io/vitbl.o(.text);
        build/us/lib/ultralib/src/io/visetevent.o(.text);
        build/us/lib/ultralib/src/io/visetmode.o(.text);
        build/us/lib/ultralib/src/io/visetspecial.o(.text);
        build/us/lib/ultralib/src/io/visetyscale.o(.text);
        build/us/lib/ultralib/src/io/viswapbuf.o(.text);
        build/us/lib/ultralib/src/io/viswapcontext.o(.text);
        build/us/lib/ultralib/src/io/viblack.o(.text);
        build/us/lib/ultralib/src/mgu/mtxident.o(.text);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.text);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.text);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.text);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.text);
        build/us/lib/ultralib/src/mgu/scale.o(.text);
        build/us/lib/ultralib/src/mgu/scalef.o(.text);
        build/us/lib/ultralib/src/mgu/translate.o(.text);
        build/us/lib/ultralib/src/mgu/translatef.o(.text);
        build/us/lib/ultralib/src/os/initialize.o(.text);
        build/us/lib/ultralib/src/io/conteepread.o(.text);
        build/us/lib/ultralib/src/io/conteepwrite.o(.text);
        build/us/lib/ultralib/src/os/exceptasm.o(.text);
        build/us/lib/ultralib/src/os/interrupt.o(.text);
        build/us/lib/ultralib/src/os/setintmask.o(.text);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.text);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.text);
        build/us/lib/ultralib/src/io/pirawdma.o(.text);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.text);
        build/us/lib/ultralib/src/io/epirawread.o(.text);
        build/us/lib/ultralib/src/io/epirawwrite.o(.text);
        build/us/lib/ultralib/src/io/ai.o(.text);
        build/us/lib/ultralib/src/audio/drvrnew.o(.text);
        build/us/lib/ultralib/src/audio/load.o(.text);
        build/us/lib/ultralib/src/audio/auxbus.o(.text);
        build/us/lib/ultralib/src/audio/filter.o(.text);
        build/us/lib/ultralib/src/audio/mainbus.o(.text);
        build/us/lib/ultralib/src/audio/resample.o(.text);
        build/us/lib/ultralib/src/audio/reverb.o(.text);
        build/us/lib/ultralib/src/audio/save.o(.text);
        build/us/lib/ultralib/src/audio/heapalloc.o(.text);
        build/us/lib/ultralib/src/audio/copy.o(.text);
        build/us/lib/ultralib/src/os/invalicache.o(.text);
        build/us/lib/ultralib/src/os/writebackdcache.o(.text);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.text);
        build/us/lib/ultralib/src/os/getcause.o(.text);
        build/us/lib/ultralib/src/os/getcount.o(.text);
        build/us/lib/ultralib/src/os/getsr.o(.text);
        build/us/lib/ultralib/src/os/setcompare.o(.text);
        build/us/lib/ultralib/src/os/setfpccsr.o(.text);
        build/us/lib/ultralib/src/os/setsr.o(.text);
        build/us/lib/ultralib/src/os/setwatchlo.o(.text);
        build/us/lib/ultralib/src/io/sp.o(.text);
        build/us/lib/ultralib/src/io/spgetstat.o(.text);
        build/us/lib/ultralib/src/io/spsetstat.o(.text);
        build/us/lib/ultralib/src/io/spsetpc.o(.text);
        build/us/lib/ultralib/src/io/sprawdma.o(.text);
        build/us/lib/ultralib/src/io/sirawread.o(.text);
        build/us/lib/ultralib/src/io/sirawwrite.o(.text);
        build/us/lib/ultralib/src/os/destroythread.o(.text);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.text);
        build/us/lib/ultralib/src/os/unmaptlball.o(.text);
        build/us/lib/ultralib/src/io/vi.o(.text);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.text);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.text);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.text);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.text);
        build/us/lib/ultralib/src/os/parameters.o(.text);
        build/us/lib/ultralib/src/gu/libm_vals.o(.text);
        build/us/lib/ultralib/src/io/dp.o(.text);
        build/us/lib/ultralib/src/io/si.o(.text);
        build/us/src/libkmc/fmod.o(.text);
        build/us/src/libkmc/memmove.o(.text);
        build/us/src/libkmc/memset.o(.text);
        build/us/src/libkmc/modf.o(.text);
        build/us/src/libkmc/rand.o(.text);
        build/us/src/libkmc/strcpy.o(.text);
        build/us/src/libkmc/mmuldi3.o(.text);
        build/us/src/libkmc/ctype.o(.text);
        build/us/asm/boot/8001B640.o(.text);
        boot_text_END = .;
        boot_text_SIZE = ABSOLUTE(boot_text_END - boot_text_START);
        boot_data_START = .;
        build/us/src/boot/boot_main.o(.data);
        build/us/src/boot/dmadata.o(.data);
        build/us/src/gzip/inflate.o(.data);
        build/us/src/gzip/unzip.o(.data);
        build/us/src/boot/util.o(.data);
        build/us/src/boot/rom_offsets.o(.data);
        build/us/lib/ultralib/src/io/conteepprobe.o(.data);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.data);
        build/us/lib/ultralib/src/io/conteeplongread.o(.data);
        build/us/lib/ultralib/src/io/pimgr.o(.data);
        build/us/lib/ultralib/src/io/epirawdma.o(.data);
        build/us/lib/ultralib/src/io/epidma.o(.data);
        build/us/lib/ultralib/src/io/cartrominit.o(.data);
        build/us/lib/ultralib/src/io/devmgr.o(.data);
        build/us/lib/ultralib/src/io/piacs.o(.data);
        build/us/lib/ultralib/src/io/pidma.o(.data);
        build/us/lib/ultralib/src/io/aigetlen.o(.data);
        build/us/lib/ultralib/src/io/aigetstat.o(.data);
        build/us/lib/ultralib/src/io/aisetfreq.o(.data);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.data);
        build/us/lib/ultralib/src/audio/env.o(.data);
        build/us/lib/ultralib/src/audio/sl.o(.data);
        build/us/lib/ultralib/src/audio/heapinit.o(.data);
        build/us/lib/ultralib/src/audio/synthesizer.o(.data);
        build/us/lib/ultralib/src/audio/syndelete.o(.data);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.data);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.data);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.data);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.data);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.data);
        build/us/lib/ultralib/src/audio/synsetvol.o(.data);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.data);
        build/us/lib/ultralib/src/audio/synsetpan.o(.data);
        build/us/lib/ultralib/src/audio/synallocfx.o(.data);
        build/us/lib/ultralib/src/os/invaldcache.o(.data);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.data);
        build/us/lib/ultralib/src/io/contquery.o(.data);
        build/us/lib/ultralib/src/io/contreaddata.o(.data);
        build/us/lib/ultralib/src/io/controller.o(.data);
        build/us/lib/ultralib/src/io/contsetch.o(.data);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.data);
        build/us/lib/ultralib/src/gu/sqrtf.o(.data);
        build/us/lib/ultralib/src/gu/cosf.o(.data);
        build/us/lib/ultralib/src/gu/ortho.o(.data);
        build/us/lib/ultralib/src/gu/perspective.o(.data);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.data);
        build/us/lib/ultralib/src/gu/sinf.o(.data);
        build/us/lib/ultralib/src/gu/sins.o(.data);
        build/us/lib/ultralib/src/libc/bcmp.o(.data);
        build/us/lib/ultralib/src/libc/bcopy.o(.data);
        build/us/lib/ultralib/src/libc/bzero.o(.data);
        build/us/lib/ultralib/src/libc/string.o(.data);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.data);
        build/us/lib/ultralib/src/os/jammesg.o(.data);
        build/us/lib/ultralib/src/os/recvmesg.o(.data);
        build/us/lib/ultralib/src/os/sendmesg.o(.data);
        build/us/lib/ultralib/src/os/seteventmesg.o(.data);
        build/us/lib/ultralib/src/io/sptask.o(.data);
        build/us/lib/ultralib/src/io/sptaskyield.o(.data);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.data);
        build/us/lib/ultralib/src/sched/sched.o(.data);
        build/us/lib/ultralib/src/io/sirawdma.o(.data);
        build/us/lib/ultralib/src/io/siacs.o(.data);
        build/us/lib/ultralib/src/os/createthread.o(.data);
        build/us/lib/ultralib/src/os/getthreadpri.o(.data);
        build/us/lib/ultralib/src/os/setthreadpri.o(.data);
        build/us/lib/ultralib/src/os/startthread.o(.data);
        build/us/lib/ultralib/src/os/stopthread.o(.data);
        build/us/lib/ultralib/src/os/thread.o(.data);
        build/us/lib/ultralib/src/os/yieldthread.o(.data);
        build/us/lib/ultralib/src/os/gettime.o(.data);
        build/us/lib/ultralib/src/os/settime.o(.data);
        build/us/lib/ultralib/src/os/settimer.o(.data);
        build/us/lib/ultralib/src/os/timerintr.o(.data);
        build/us/lib/ultralib/src/os/probetlb.o(.data);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.data);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.data);
        build/us/lib/ultralib/src/io/vimgr.o(.data);
        build/us/lib/ultralib/src/io/vitbl.o(.data);
        build/us/lib/ultralib/src/io/visetevent.o(.data);
        build/us/lib/ultralib/src/io/visetmode.o(.data);
        build/us/lib/ultralib/src/io/visetspecial.o(.data);
        build/us/lib/ultralib/src/io/visetyscale.o(.data);
        build/us/lib/ultralib/src/io/viswapbuf.o(.data);
        build/us/lib/ultralib/src/io/viswapcontext.o(.data);
        build/us/lib/ultralib/src/io/viblack.o(.data);
        build/us/lib/ultralib/src/mgu/mtxident.o(.data);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.data);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.data);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.data);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.data);
        build/us/lib/ultralib/src/mgu/scale.o(.data);
        build/us/lib/ultralib/src/mgu/scalef.o(.data);
        build/us/lib/ultralib/src/mgu/translate.o(.data);
        build/us/lib/ultralib/src/mgu/translatef.o(.data);
        build/us/lib/ultralib/src/os/initialize.o(.data);
        build/us/lib/ultralib/src/io/conteepread.o(.data);
        build/us/lib/ultralib/src/io/conteepwrite.o(.data);
        build/us/lib/ultralib/src/os/exceptasm.o(.data);
        build/us/lib/ultralib/src/os/interrupt.o(.data);
        build/us/lib/ultralib/src/os/setintmask.o(.data);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.data);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.data);
        build/us/lib/ultralib/src/io/pirawdma.o(.data);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.data);
        build/us/lib/ultralib/src/io/epirawread.o(.data);
        build/us/lib/ultralib/src/io/epirawwrite.o(.data);
        build/us/lib/ultralib/src/io/ai.o(.data);
        build/us/lib/ultralib/src/audio/drvrnew.o(.data);
        build/us/lib/ultralib/src/audio/load.o(.data);
        build/us/lib/ultralib/src/audio/auxbus.o(.data);
        build/us/lib/ultralib/src/audio/filter.o(.data);
        build/us/lib/ultralib/src/audio/mainbus.o(.data);
        build/us/lib/ultralib/src/audio/resample.o(.data);
        build/us/lib/ultralib/src/audio/reverb.o(.data);
        build/us/lib/ultralib/src/audio/save.o(.data);
        build/us/lib/ultralib/src/audio/heapalloc.o(.data);
        build/us/lib/ultralib/src/audio/copy.o(.data);
        build/us/lib/ultralib/src/os/invalicache.o(.data);
        build/us/lib/ultralib/src/os/writebackdcache.o(.data);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.data);
        build/us/lib/ultralib/src/os/getcause.o(.data);
        build/us/lib/ultralib/src/os/getcount.o(.data);
        build/us/lib/ultralib/src/os/getsr.o(.data);
        build/us/lib/ultralib/src/os/setcompare.o(.data);
        build/us/lib/ultralib/src/os/setfpccsr.o(.data);
        build/us/lib/ultralib/src/os/setsr.o(.data);
        build/us/lib/ultralib/src/os/setwatchlo.o(.data);
        build/us/lib/ultralib/src/io/sp.o(.data);
        build/us/lib/ultralib/src/io/spgetstat.o(.data);
        build/us/lib/ultralib/src/io/spsetstat.o(.data);
        build/us/lib/ultralib/src/io/spsetpc.o(.data);
        build/us/lib/ultralib/src/io/sprawdma.o(.data);
        build/us/lib/ultralib/src/io/sirawread.o(.data);
        build/us/lib/ultralib/src/io/sirawwrite.o(.data);
        build/us/lib/ultralib/src/os/destroythread.o(.data);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.data);
        build/us/lib/ultralib/src/os/unmaptlball.o(.data);
        build/us/lib/ultralib/src/io/vi.o(.data);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.data);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.data);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.data);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.data);
        build/us/lib/ultralib/src/os/parameters.o(.data);
        build/us/lib/ultralib/src/gu/libm_vals.o(.data);
        build/us/lib/ultralib/src/io/dp.o(.data);
        build/us/lib/ultralib/src/io/si.o(.data);
        build/us/src/libkmc/fmod.o(.data);
        build/us/src/libkmc/memmove.o(.data);
        build/us/src/libkmc/memset.o(.data);
        build/us/src/libkmc/modf.o(.data);
        build/us/src/libkmc/rand.o(.data);
        build/us/src/libkmc/strcpy.o(.data);
        build/us/src/libkmc/mmuldi3.o(.data);
        build/us/src/libkmc/ctype.o(.data);
        build/us/asm/boot/8001B640.o(.data);
        boot_data_END = .;
        boot_data_SIZE = ABSOLUTE(boot_data_END - boot_data_START);
        boot_rodata_START = .;
        build/us/src/boot/boot_main.o(.rodata);
        build/us/src/boot/dmadata.o(.rodata);
        build/us/src/gzip/inflate.o(.rodata);
        build/us/src/gzip/unzip.o(.rodata);
        build/us/src/boot/util.o(.rodata);
        build/us/src/boot/rom_offsets.o(.rodata);
        build/us/lib/ultralib/src/io/conteepprobe.o(.rodata);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.rodata);
        build/us/lib/ultralib/src/io/conteeplongread.o(.rodata);
        build/us/lib/ultralib/src/io/pimgr.o(.rodata);
        build/us/lib/ultralib/src/io/epirawdma.o(.rodata);
        build/us/lib/ultralib/src/io/epidma.o(.rodata);
        build/us/lib/ultralib/src/io/cartrominit.o(.rodata);
        build/us/lib/ultralib/src/io/devmgr.o(.rodata);
        build/us/lib/ultralib/src/io/piacs.o(.rodata);
        build/us/lib/ultralib/src/io/pidma.o(.rodata);
        build/us/lib/ultralib/src/io/aigetlen.o(.rodata);
        build/us/lib/ultralib/src/io/aigetstat.o(.rodata);
        build/us/lib/ultralib/src/io/aisetfreq.o(.rodata);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.rodata);
        build/us/lib/ultralib/src/audio/env.o(.rodata);
        build/us/lib/ultralib/src/audio/sl.o(.rodata);
        build/us/lib/ultralib/src/audio/heapinit.o(.rodata);
        build/us/lib/ultralib/src/audio/synthesizer.o(.rodata);
        build/us/lib/ultralib/src/audio/syndelete.o(.rodata);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.rodata);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.rodata);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.rodata);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.rodata);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.rodata);
        build/us/lib/ultralib/src/audio/synsetvol.o(.rodata);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.rodata);
        build/us/lib/ultralib/src/audio/synsetpan.o(.rodata);
        build/us/lib/ultralib/src/audio/synallocfx.o(.rodata);
        build/us/lib/ultralib/src/os/invaldcache.o(.rodata);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.rodata);
        build/us/lib/ultralib/src/io/contquery.o(.rodata);
        build/us/lib/ultralib/src/io/contreaddata.o(.rodata);
        build/us/lib/ultralib/src/io/controller.o(.rodata);
        build/us/lib/ultralib/src/io/contsetch.o(.rodata);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.rodata);
        build/us/lib/ultralib/src/gu/sqrtf.o(.rodata);
        build/us/lib/ultralib/src/gu/cosf.o(.rodata);
        build/us/lib/ultralib/src/gu/ortho.o(.rodata);
        build/us/lib/ultralib/src/gu/perspective.o(.rodata);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.rodata);
        build/us/lib/ultralib/src/gu/sinf.o(.rodata);
        build/us/lib/ultralib/src/gu/sins.o(.rodata);
        build/us/lib/ultralib/src/libc/bcmp.o(.rodata);
        build/us/lib/ultralib/src/libc/bcopy.o(.rodata);
        build/us/lib/ultralib/src/libc/bzero.o(.rodata);
        build/us/lib/ultralib/src/libc/string.o(.rodata);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.rodata);
        build/us/lib/ultralib/src/os/jammesg.o(.rodata);
        build/us/lib/ultralib/src/os/recvmesg.o(.rodata);
        build/us/lib/ultralib/src/os/sendmesg.o(.rodata);
        build/us/lib/ultralib/src/os/seteventmesg.o(.rodata);
        build/us/lib/ultralib/src/io/sptask.o(.rodata);
        build/us/lib/ultralib/src/io/sptaskyield.o(.rodata);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.rodata);
        build/us/lib/ultralib/src/sched/sched.o(.rodata);
        build/us/lib/ultralib/src/io/sirawdma.o(.rodata);
        build/us/lib/ultralib/src/io/siacs.o(.rodata);
        build/us/lib/ultralib/src/os/createthread.o(.rodata);
        build/us/lib/ultralib/src/os/getthreadpri.o(.rodata);
        build/us/lib/ultralib/src/os/setthreadpri.o(.rodata);
        build/us/lib/ultralib/src/os/startthread.o(.rodata);
        build/us/lib/ultralib/src/os/stopthread.o(.rodata);
        build/us/lib/ultralib/src/os/thread.o(.rodata);
        build/us/lib/ultralib/src/os/yieldthread.o(.rodata);
        build/us/lib/ultralib/src/os/gettime.o(.rodata);
        build/us/lib/ultralib/src/os/settime.o(.rodata);
        build/us/lib/ultralib/src/os/settimer.o(.rodata);
        build/us/lib/ultralib/src/os/timerintr.o(.rodata);
        build/us/lib/ultralib/src/os/probetlb.o(.rodata);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.rodata);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.rodata);
        build/us/lib/ultralib/src/io/vimgr.o(.rodata);
        build/us/lib/ultralib/src/io/vitbl.o(.rodata);
        build/us/lib/ultralib/src/io/visetevent.o(.rodata);
        build/us/lib/ultralib/src/io/visetmode.o(.rodata);
        build/us/lib/ultralib/src/io/visetspecial.o(.rodata);
        build/us/lib/ultralib/src/io/visetyscale.o(.rodata);
        build/us/lib/ultralib/src/io/viswapbuf.o(.rodata);
        build/us/lib/ultralib/src/io/viswapcontext.o(.rodata);
        build/us/lib/ultralib/src/io/viblack.o(.rodata);
        build/us/lib/ultralib/src/mgu/mtxident.o(.rodata);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.rodata);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.rodata);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.rodata);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.rodata);
        build/us/lib/ultralib/src/mgu/scale.o(.rodata);
        build/us/lib/ultralib/src/mgu/scalef.o(.rodata);
        build/us/lib/ultralib/src/mgu/translate.o(.rodata);
        build/us/lib/ultralib/src/mgu/translatef.o(.rodata);
        build/us/lib/ultralib/src/os/initialize.o(.rodata);
        build/us/lib/ultralib/src/io/conteepread.o(.rodata);
        build/us/lib/ultralib/src/io/conteepwrite.o(.rodata);
        build/us/lib/ultralib/src/os/exceptasm.o(.rodata);
        build/us/lib/ultralib/src/os/interrupt.o(.rodata);
        build/us/lib/ultralib/src/os/setintmask.o(.rodata);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.rodata);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.rodata);
        build/us/lib/ultralib/src/io/pirawdma.o(.rodata);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.rodata);
        build/us/lib/ultralib/src/io/epirawread.o(.rodata);
        build/us/lib/ultralib/src/io/epirawwrite.o(.rodata);
        build/us/lib/ultralib/src/io/ai.o(.rodata);
        build/us/lib/ultralib/src/audio/drvrnew.o(.rodata);
        build/us/lib/ultralib/src/audio/load.o(.rodata);
        build/us/lib/ultralib/src/audio/auxbus.o(.rodata);
        build/us/lib/ultralib/src/audio/filter.o(.rodata);
        build/us/lib/ultralib/src/audio/mainbus.o(.rodata);
        build/us/lib/ultralib/src/audio/resample.o(.rodata);
        build/us/lib/ultralib/src/audio/reverb.o(.rodata);
        build/us/lib/ultralib/src/audio/save.o(.rodata);
        build/us/lib/ultralib/src/audio/heapalloc.o(.rodata);
        build/us/lib/ultralib/src/audio/copy.o(.rodata);
        build/us/lib/ultralib/src/os/invalicache.o(.rodata);
        build/us/lib/ultralib/src/os/writebackdcache.o(.rodata);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.rodata);
        build/us/lib/ultralib/src/os/getcause.o(.rodata);
        build/us/lib/ultralib/src/os/getcount.o(.rodata);
        build/us/lib/ultralib/src/os/getsr.o(.rodata);
        build/us/lib/ultralib/src/os/setcompare.o(.rodata);
        build/us/lib/ultralib/src/os/setfpccsr.o(.rodata);
        build/us/lib/ultralib/src/os/setsr.o(.rodata);
        build/us/lib/ultralib/src/os/setwatchlo.o(.rodata);
        build/us/lib/ultralib/src/io/sp.o(.rodata);
        build/us/lib/ultralib/src/io/spgetstat.o(.rodata);
        build/us/lib/ultralib/src/io/spsetstat.o(.rodata);
        build/us/lib/ultralib/src/io/spsetpc.o(.rodata);
        build/us/lib/ultralib/src/io/sprawdma.o(.rodata);
        build/us/lib/ultralib/src/io/sirawread.o(.rodata);
        build/us/lib/ultralib/src/io/sirawwrite.o(.rodata);
        build/us/lib/ultralib/src/os/destroythread.o(.rodata);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.rodata);
        build/us/lib/ultralib/src/os/unmaptlball.o(.rodata);
        build/us/lib/ultralib/src/io/vi.o(.rodata);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.rodata);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.rodata);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.rodata);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.rodata);
        build/us/lib/ultralib/src/os/parameters.o(.rodata);
        build/us/lib/ultralib/src/gu/libm_vals.o(.rodata);
        build/us/lib/ultralib/src/io/dp.o(.rodata);
        build/us/lib/ultralib/src/io/si.o(.rodata);
        build/us/src/libkmc/fmod.o(.rodata);
        build/us/src/libkmc/memmove.o(.rodata);
        build/us/src/libkmc/memset.o(.rodata);
        build/us/src/libkmc/modf.o(.rodata);
        build/us/src/libkmc/rand.o(.rodata);
        build/us/src/libkmc/strcpy.o(.rodata);
        build/us/src/libkmc/mmuldi3.o(.rodata);
        build/us/src/libkmc/ctype.o(.rodata);
        build/us/asm/boot/8001B640.o(.rodata);
        boot_rodata_END = .;
        boot_rodata_SIZE = ABSOLUTE(boot_rodata_END - boot_rodata_START);
    }
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    .boot (NOLOAD) :
    {
        boot_bss_START = .;
        build/us/src/boot/boot_main.o(.sbss);
        build/us/src/boot/dmadata.o(.sbss);
        build/us/src/gzip/inflate.o(.sbss);
        build/us/src/gzip/unzip.o(.sbss);
        build/us/src/boot/util.o(.sbss);
        build/us/src/boot/rom_offsets.o(.sbss);
        build/us/lib/ultralib/src/io/conteepprobe.o(.sbss);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.sbss);
        build/us/lib/ultralib/src/io/conteeplongread.o(.sbss);
        build/us/lib/ultralib/src/io/pimgr.o(.sbss);
        build/us/lib/ultralib/src/io/epirawdma.o(.sbss);
        build/us/lib/ultralib/src/io/epidma.o(.sbss);
        build/us/lib/ultralib/src/io/cartrominit.o(.sbss);
        build/us/lib/ultralib/src/io/devmgr.o(.sbss);
        build/us/lib/ultralib/src/io/piacs.o(.sbss);
        build/us/lib/ultralib/src/io/pidma.o(.sbss);
        build/us/lib/ultralib/src/io/aigetlen.o(.sbss);
        build/us/lib/ultralib/src/io/aigetstat.o(.sbss);
        build/us/lib/ultralib/src/io/aisetfreq.o(.sbss);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.sbss);
        build/us/lib/ultralib/src/audio/env.o(.sbss);
        build/us/lib/ultralib/src/audio/sl.o(.sbss);
        build/us/lib/ultralib/src/audio/heapinit.o(.sbss);
        build/us/lib/ultralib/src/audio/synthesizer.o(.sbss);
        build/us/lib/ultralib/src/audio/syndelete.o(.sbss);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.sbss);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.sbss);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.sbss);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.sbss);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.sbss);
        build/us/lib/ultralib/src/audio/synsetvol.o(.sbss);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.sbss);
        build/us/lib/ultralib/src/audio/synsetpan.o(.sbss);
        build/us/lib/ultralib/src/audio/synallocfx.o(.sbss);
        build/us/lib/ultralib/src/os/invaldcache.o(.sbss);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.sbss);
        build/us/lib/ultralib/src/io/contquery.o(.sbss);
        build/us/lib/ultralib/src/io/contreaddata.o(.sbss);
        build/us/lib/ultralib/src/io/controller.o(.sbss);
        build/us/lib/ultralib/src/io/contsetch.o(.sbss);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.sbss);
        build/us/lib/ultralib/src/gu/sqrtf.o(.sbss);
        build/us/lib/ultralib/src/gu/cosf.o(.sbss);
        build/us/lib/ultralib/src/gu/ortho.o(.sbss);
        build/us/lib/ultralib/src/gu/perspective.o(.sbss);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.sbss);
        build/us/lib/ultralib/src/gu/sinf.o(.sbss);
        build/us/lib/ultralib/src/gu/sins.o(.sbss);
        build/us/lib/ultralib/src/libc/bcmp.o(.sbss);
        build/us/lib/ultralib/src/libc/bcopy.o(.sbss);
        build/us/lib/ultralib/src/libc/bzero.o(.sbss);
        build/us/lib/ultralib/src/libc/string.o(.sbss);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.sbss);
        build/us/lib/ultralib/src/os/jammesg.o(.sbss);
        build/us/lib/ultralib/src/os/recvmesg.o(.sbss);
        build/us/lib/ultralib/src/os/sendmesg.o(.sbss);
        build/us/lib/ultralib/src/os/seteventmesg.o(.sbss);
        build/us/lib/ultralib/src/io/sptask.o(.sbss);
        build/us/lib/ultralib/src/io/sptaskyield.o(.sbss);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.sbss);
        build/us/lib/ultralib/src/sched/sched.o(.sbss);
        build/us/lib/ultralib/src/io/sirawdma.o(.sbss);
        build/us/lib/ultralib/src/io/siacs.o(.sbss);
        build/us/lib/ultralib/src/os/createthread.o(.sbss);
        build/us/lib/ultralib/src/os/getthreadpri.o(.sbss);
        build/us/lib/ultralib/src/os/setthreadpri.o(.sbss);
        build/us/lib/ultralib/src/os/startthread.o(.sbss);
        build/us/lib/ultralib/src/os/stopthread.o(.sbss);
        build/us/lib/ultralib/src/os/thread.o(.sbss);
        build/us/lib/ultralib/src/os/yieldthread.o(.sbss);
        build/us/lib/ultralib/src/os/gettime.o(.sbss);
        build/us/lib/ultralib/src/os/settime.o(.sbss);
        build/us/lib/ultralib/src/os/settimer.o(.sbss);
        build/us/lib/ultralib/src/os/timerintr.o(.sbss);
        build/us/lib/ultralib/src/os/probetlb.o(.sbss);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.sbss);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.sbss);
        build/us/lib/ultralib/src/io/vimgr.o(.sbss);
        build/us/lib/ultralib/src/io/vitbl.o(.sbss);
        build/us/lib/ultralib/src/io/visetevent.o(.sbss);
        build/us/lib/ultralib/src/io/visetmode.o(.sbss);
        build/us/lib/ultralib/src/io/visetspecial.o(.sbss);
        build/us/lib/ultralib/src/io/visetyscale.o(.sbss);
        build/us/lib/ultralib/src/io/viswapbuf.o(.sbss);
        build/us/lib/ultralib/src/io/viswapcontext.o(.sbss);
        build/us/lib/ultralib/src/io/viblack.o(.sbss);
        build/us/lib/ultralib/src/mgu/mtxident.o(.sbss);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.sbss);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.sbss);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.sbss);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.sbss);
        build/us/lib/ultralib/src/mgu/scale.o(.sbss);
        build/us/lib/ultralib/src/mgu/scalef.o(.sbss);
        build/us/lib/ultralib/src/mgu/translate.o(.sbss);
        build/us/lib/ultralib/src/mgu/translatef.o(.sbss);
        build/us/lib/ultralib/src/os/initialize.o(.sbss);
        build/us/lib/ultralib/src/io/conteepread.o(.sbss);
        build/us/lib/ultralib/src/io/conteepwrite.o(.sbss);
        build/us/lib/ultralib/src/os/exceptasm.o(.sbss);
        build/us/lib/ultralib/src/os/interrupt.o(.sbss);
        build/us/lib/ultralib/src/os/setintmask.o(.sbss);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.sbss);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.sbss);
        build/us/lib/ultralib/src/io/pirawdma.o(.sbss);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.sbss);
        build/us/lib/ultralib/src/io/epirawread.o(.sbss);
        build/us/lib/ultralib/src/io/epirawwrite.o(.sbss);
        build/us/lib/ultralib/src/io/ai.o(.sbss);
        build/us/lib/ultralib/src/audio/drvrnew.o(.sbss);
        build/us/lib/ultralib/src/audio/load.o(.sbss);
        build/us/lib/ultralib/src/audio/auxbus.o(.sbss);
        build/us/lib/ultralib/src/audio/filter.o(.sbss);
        build/us/lib/ultralib/src/audio/mainbus.o(.sbss);
        build/us/lib/ultralib/src/audio/resample.o(.sbss);
        build/us/lib/ultralib/src/audio/reverb.o(.sbss);
        build/us/lib/ultralib/src/audio/save.o(.sbss);
        build/us/lib/ultralib/src/audio/heapalloc.o(.sbss);
        build/us/lib/ultralib/src/audio/copy.o(.sbss);
        build/us/lib/ultralib/src/os/invalicache.o(.sbss);
        build/us/lib/ultralib/src/os/writebackdcache.o(.sbss);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.sbss);
        build/us/lib/ultralib/src/os/getcause.o(.sbss);
        build/us/lib/ultralib/src/os/getcount.o(.sbss);
        build/us/lib/ultralib/src/os/getsr.o(.sbss);
        build/us/lib/ultralib/src/os/setcompare.o(.sbss);
        build/us/lib/ultralib/src/os/setfpccsr.o(.sbss);
        build/us/lib/ultralib/src/os/setsr.o(.sbss);
        build/us/lib/ultralib/src/os/setwatchlo.o(.sbss);
        build/us/lib/ultralib/src/io/sp.o(.sbss);
        build/us/lib/ultralib/src/io/spgetstat.o(.sbss);
        build/us/lib/ultralib/src/io/spsetstat.o(.sbss);
        build/us/lib/ultralib/src/io/spsetpc.o(.sbss);
        build/us/lib/ultralib/src/io/sprawdma.o(.sbss);
        build/us/lib/ultralib/src/io/sirawread.o(.sbss);
        build/us/lib/ultralib/src/io/sirawwrite.o(.sbss);
        build/us/lib/ultralib/src/os/destroythread.o(.sbss);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.sbss);
        build/us/lib/ultralib/src/os/unmaptlball.o(.sbss);
        build/us/lib/ultralib/src/io/vi.o(.sbss);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.sbss);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.sbss);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.sbss);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.sbss);
        build/us/lib/ultralib/src/os/parameters.o(.sbss);
        build/us/lib/ultralib/src/gu/libm_vals.o(.sbss);
        build/us/lib/ultralib/src/io/dp.o(.sbss);
        build/us/lib/ultralib/src/io/si.o(.sbss);
        build/us/src/libkmc/fmod.o(.sbss);
        build/us/src/libkmc/memmove.o(.sbss);
        build/us/src/libkmc/memset.o(.sbss);
        build/us/src/libkmc/modf.o(.sbss);
        build/us/src/libkmc/rand.o(.sbss);
        build/us/src/libkmc/strcpy.o(.sbss);
        build/us/src/libkmc/mmuldi3.o(.sbss);
        build/us/src/libkmc/ctype.o(.sbss);
        build/us/asm/boot/8001B640.o(.sbss);
        build/us/src/boot/boot_main.o(.scommon);
        build/us/src/boot/dmadata.o(.scommon);
        build/us/src/gzip/inflate.o(.scommon);
        build/us/src/gzip/unzip.o(.scommon);
        build/us/src/boot/util.o(.scommon);
        build/us/src/boot/rom_offsets.o(.scommon);
        build/us/lib/ultralib/src/io/conteepprobe.o(.scommon);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.scommon);
        build/us/lib/ultralib/src/io/conteeplongread.o(.scommon);
        build/us/lib/ultralib/src/io/pimgr.o(.scommon);
        build/us/lib/ultralib/src/io/epirawdma.o(.scommon);
        build/us/lib/ultralib/src/io/epidma.o(.scommon);
        build/us/lib/ultralib/src/io/cartrominit.o(.scommon);
        build/us/lib/ultralib/src/io/devmgr.o(.scommon);
        build/us/lib/ultralib/src/io/piacs.o(.scommon);
        build/us/lib/ultralib/src/io/pidma.o(.scommon);
        build/us/lib/ultralib/src/io/aigetlen.o(.scommon);
        build/us/lib/ultralib/src/io/aigetstat.o(.scommon);
        build/us/lib/ultralib/src/io/aisetfreq.o(.scommon);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.scommon);
        build/us/lib/ultralib/src/audio/env.o(.scommon);
        build/us/lib/ultralib/src/audio/sl.o(.scommon);
        build/us/lib/ultralib/src/audio/heapinit.o(.scommon);
        build/us/lib/ultralib/src/audio/synthesizer.o(.scommon);
        build/us/lib/ultralib/src/audio/syndelete.o(.scommon);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.scommon);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.scommon);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.scommon);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.scommon);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.scommon);
        build/us/lib/ultralib/src/audio/synsetvol.o(.scommon);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.scommon);
        build/us/lib/ultralib/src/audio/synsetpan.o(.scommon);
        build/us/lib/ultralib/src/audio/synallocfx.o(.scommon);
        build/us/lib/ultralib/src/os/invaldcache.o(.scommon);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.scommon);
        build/us/lib/ultralib/src/io/contquery.o(.scommon);
        build/us/lib/ultralib/src/io/contreaddata.o(.scommon);
        build/us/lib/ultralib/src/io/controller.o(.scommon);
        build/us/lib/ultralib/src/io/contsetch.o(.scommon);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.scommon);
        build/us/lib/ultralib/src/gu/sqrtf.o(.scommon);
        build/us/lib/ultralib/src/gu/cosf.o(.scommon);
        build/us/lib/ultralib/src/gu/ortho.o(.scommon);
        build/us/lib/ultralib/src/gu/perspective.o(.scommon);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.scommon);
        build/us/lib/ultralib/src/gu/sinf.o(.scommon);
        build/us/lib/ultralib/src/gu/sins.o(.scommon);
        build/us/lib/ultralib/src/libc/bcmp.o(.scommon);
        build/us/lib/ultralib/src/libc/bcopy.o(.scommon);
        build/us/lib/ultralib/src/libc/bzero.o(.scommon);
        build/us/lib/ultralib/src/libc/string.o(.scommon);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.scommon);
        build/us/lib/ultralib/src/os/jammesg.o(.scommon);
        build/us/lib/ultralib/src/os/recvmesg.o(.scommon);
        build/us/lib/ultralib/src/os/sendmesg.o(.scommon);
        build/us/lib/ultralib/src/os/seteventmesg.o(.scommon);
        build/us/lib/ultralib/src/io/sptask.o(.scommon);
        build/us/lib/ultralib/src/io/sptaskyield.o(.scommon);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.scommon);
        build/us/lib/ultralib/src/sched/sched.o(.scommon);
        build/us/lib/ultralib/src/io/sirawdma.o(.scommon);
        build/us/lib/ultralib/src/io/siacs.o(.scommon);
        build/us/lib/ultralib/src/os/createthread.o(.scommon);
        build/us/lib/ultralib/src/os/getthreadpri.o(.scommon);
        build/us/lib/ultralib/src/os/setthreadpri.o(.scommon);
        build/us/lib/ultralib/src/os/startthread.o(.scommon);
        build/us/lib/ultralib/src/os/stopthread.o(.scommon);
        build/us/lib/ultralib/src/os/thread.o(.scommon);
        build/us/lib/ultralib/src/os/yieldthread.o(.scommon);
        build/us/lib/ultralib/src/os/gettime.o(.scommon);
        build/us/lib/ultralib/src/os/settime.o(.scommon);
        build/us/lib/ultralib/src/os/settimer.o(.scommon);
        build/us/lib/ultralib/src/os/timerintr.o(.scommon);
        build/us/lib/ultralib/src/os/probetlb.o(.scommon);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.scommon);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.scommon);
        build/us/lib/ultralib/src/io/vimgr.o(.scommon);
        build/us/lib/ultralib/src/io/vitbl.o(.scommon);
        build/us/lib/ultralib/src/io/visetevent.o(.scommon);
        build/us/lib/ultralib/src/io/visetmode.o(.scommon);
        build/us/lib/ultralib/src/io/visetspecial.o(.scommon);
        build/us/lib/ultralib/src/io/visetyscale.o(.scommon);
        build/us/lib/ultralib/src/io/viswapbuf.o(.scommon);
        build/us/lib/ultralib/src/io/viswapcontext.o(.scommon);
        build/us/lib/ultralib/src/io/viblack.o(.scommon);
        build/us/lib/ultralib/src/mgu/mtxident.o(.scommon);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.scommon);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.scommon);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.scommon);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.scommon);
        build/us/lib/ultralib/src/mgu/scale.o(.scommon);
        build/us/lib/ultralib/src/mgu/scalef.o(.scommon);
        build/us/lib/ultralib/src/mgu/translate.o(.scommon);
        build/us/lib/ultralib/src/mgu/translatef.o(.scommon);
        build/us/lib/ultralib/src/os/initialize.o(.scommon);
        build/us/lib/ultralib/src/io/conteepread.o(.scommon);
        build/us/lib/ultralib/src/io/conteepwrite.o(.scommon);
        build/us/lib/ultralib/src/os/exceptasm.o(.scommon);
        build/us/lib/ultralib/src/os/interrupt.o(.scommon);
        build/us/lib/ultralib/src/os/setintmask.o(.scommon);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.scommon);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.scommon);
        build/us/lib/ultralib/src/io/pirawdma.o(.scommon);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.scommon);
        build/us/lib/ultralib/src/io/epirawread.o(.scommon);
        build/us/lib/ultralib/src/io/epirawwrite.o(.scommon);
        build/us/lib/ultralib/src/io/ai.o(.scommon);
        build/us/lib/ultralib/src/audio/drvrnew.o(.scommon);
        build/us/lib/ultralib/src/audio/load.o(.scommon);
        build/us/lib/ultralib/src/audio/auxbus.o(.scommon);
        build/us/lib/ultralib/src/audio/filter.o(.scommon);
        build/us/lib/ultralib/src/audio/mainbus.o(.scommon);
        build/us/lib/ultralib/src/audio/resample.o(.scommon);
        build/us/lib/ultralib/src/audio/reverb.o(.scommon);
        build/us/lib/ultralib/src/audio/save.o(.scommon);
        build/us/lib/ultralib/src/audio/heapalloc.o(.scommon);
        build/us/lib/ultralib/src/audio/copy.o(.scommon);
        build/us/lib/ultralib/src/os/invalicache.o(.scommon);
        build/us/lib/ultralib/src/os/writebackdcache.o(.scommon);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.scommon);
        build/us/lib/ultralib/src/os/getcause.o(.scommon);
        build/us/lib/ultralib/src/os/getcount.o(.scommon);
        build/us/lib/ultralib/src/os/getsr.o(.scommon);
        build/us/lib/ultralib/src/os/setcompare.o(.scommon);
        build/us/lib/ultralib/src/os/setfpccsr.o(.scommon);
        build/us/lib/ultralib/src/os/setsr.o(.scommon);
        build/us/lib/ultralib/src/os/setwatchlo.o(.scommon);
        build/us/lib/ultralib/src/io/sp.o(.scommon);
        build/us/lib/ultralib/src/io/spgetstat.o(.scommon);
        build/us/lib/ultralib/src/io/spsetstat.o(.scommon);
        build/us/lib/ultralib/src/io/spsetpc.o(.scommon);
        build/us/lib/ultralib/src/io/sprawdma.o(.scommon);
        build/us/lib/ultralib/src/io/sirawread.o(.scommon);
        build/us/lib/ultralib/src/io/sirawwrite.o(.scommon);
        build/us/lib/ultralib/src/os/destroythread.o(.scommon);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.scommon);
        build/us/lib/ultralib/src/os/unmaptlball.o(.scommon);
        build/us/lib/ultralib/src/io/vi.o(.scommon);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.scommon);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.scommon);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.scommon);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.scommon);
        build/us/lib/ultralib/src/os/parameters.o(.scommon);
        build/us/lib/ultralib/src/gu/libm_vals.o(.scommon);
        build/us/lib/ultralib/src/io/dp.o(.scommon);
        build/us/lib/ultralib/src/io/si.o(.scommon);
        build/us/src/libkmc/fmod.o(.scommon);
        build/us/src/libkmc/memmove.o(.scommon);
        build/us/src/libkmc/memset.o(.scommon);
        build/us/src/libkmc/modf.o(.scommon);
        build/us/src/libkmc/rand.o(.scommon);
        build/us/src/libkmc/strcpy.o(.scommon);
        build/us/src/libkmc/mmuldi3.o(.scommon);
        build/us/src/libkmc/ctype.o(.scommon);
        build/us/asm/boot/8001B640.o(.scommon);
        build/us/src/boot/boot_main.o(.bss);
        build/us/src/boot/dmadata.o(.bss);
        build/us/src/gzip/inflate.o(.bss);
        build/us/src/gzip/unzip.o(.bss);
        build/us/src/boot/util.o(.bss);
        build/us/src/boot/rom_offsets.o(.bss);
        build/us/lib/ultralib/src/io/conteepprobe.o(.bss);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(.bss);
        build/us/lib/ultralib/src/io/conteeplongread.o(.bss);
        build/us/lib/ultralib/src/io/pimgr.o(.bss);
        build/us/lib/ultralib/src/io/epirawdma.o(.bss);
        build/us/lib/ultralib/src/io/epidma.o(.bss);
        build/us/lib/ultralib/src/io/cartrominit.o(.bss);
        build/us/lib/ultralib/src/io/devmgr.o(.bss);
        build/us/lib/ultralib/src/io/piacs.o(.bss);
        build/us/lib/ultralib/src/io/pidma.o(.bss);
        build/us/lib/ultralib/src/io/aigetlen.o(.bss);
        build/us/lib/ultralib/src/io/aigetstat.o(.bss);
        build/us/lib/ultralib/src/io/aisetfreq.o(.bss);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(.bss);
        build/us/lib/ultralib/src/audio/env.o(.bss);
        build/us/lib/ultralib/src/audio/sl.o(.bss);
        build/us/lib/ultralib/src/audio/heapinit.o(.bss);
        build/us/lib/ultralib/src/audio/synthesizer.o(.bss);
        build/us/lib/ultralib/src/audio/syndelete.o(.bss);
        build/us/lib/ultralib/src/audio/synaddplayer.o(.bss);
        build/us/lib/ultralib/src/audio/synallocvoice.o(.bss);
        build/us/lib/ultralib/src/audio/synstopvoice.o(.bss);
        build/us/lib/ultralib/src/audio/synstartvoice.o(.bss);
        build/us/lib/ultralib/src/audio/synsetpitch.o(.bss);
        build/us/lib/ultralib/src/audio/synsetvol.o(.bss);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(.bss);
        build/us/lib/ultralib/src/audio/synsetpan.o(.bss);
        build/us/lib/ultralib/src/audio/synallocfx.o(.bss);
        build/us/lib/ultralib/src/os/invaldcache.o(.bss);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(.bss);
        build/us/lib/ultralib/src/io/contquery.o(.bss);
        build/us/lib/ultralib/src/io/contreaddata.o(.bss);
        build/us/lib/ultralib/src/io/controller.o(.bss);
        build/us/lib/ultralib/src/io/contsetch.o(.bss);
        build/us/lib/ultralib/src/os/virtualtophysical.o(.bss);
        build/us/lib/ultralib/src/gu/sqrtf.o(.bss);
        build/us/lib/ultralib/src/gu/cosf.o(.bss);
        build/us/lib/ultralib/src/gu/ortho.o(.bss);
        build/us/lib/ultralib/src/gu/perspective.o(.bss);
        build/us/lib/ultralib/src/gu/rotaterpy.o(.bss);
        build/us/lib/ultralib/src/gu/sinf.o(.bss);
        build/us/lib/ultralib/src/gu/sins.o(.bss);
        build/us/lib/ultralib/src/libc/bcmp.o(.bss);
        build/us/lib/ultralib/src/libc/bcopy.o(.bss);
        build/us/lib/ultralib/src/libc/bzero.o(.bss);
        build/us/lib/ultralib/src/libc/string.o(.bss);
        build/us/lib/ultralib/src/os/createmesgqueue.o(.bss);
        build/us/lib/ultralib/src/os/jammesg.o(.bss);
        build/us/lib/ultralib/src/os/recvmesg.o(.bss);
        build/us/lib/ultralib/src/os/sendmesg.o(.bss);
        build/us/lib/ultralib/src/os/seteventmesg.o(.bss);
        build/us/lib/ultralib/src/io/sptask.o(.bss);
        build/us/lib/ultralib/src/io/sptaskyield.o(.bss);
        build/us/lib/ultralib/src/io/sptaskyielded.o(.bss);
        build/us/lib/ultralib/src/sched/sched.o(.bss);
        build/us/lib/ultralib/src/io/sirawdma.o(.bss);
        build/us/lib/ultralib/src/io/siacs.o(.bss);
        build/us/lib/ultralib/src/os/createthread.o(.bss);
        build/us/lib/ultralib/src/os/getthreadpri.o(.bss);
        build/us/lib/ultralib/src/os/setthreadpri.o(.bss);
        build/us/lib/ultralib/src/os/startthread.o(.bss);
        build/us/lib/ultralib/src/os/stopthread.o(.bss);
        build/us/lib/ultralib/src/os/thread.o(.bss);
        build/us/lib/ultralib/src/os/yieldthread.o(.bss);
        build/us/lib/ultralib/src/os/gettime.o(.bss);
        build/us/lib/ultralib/src/os/settime.o(.bss);
        build/us/lib/ultralib/src/os/settimer.o(.bss);
        build/us/lib/ultralib/src/os/timerintr.o(.bss);
        build/us/lib/ultralib/src/os/probetlb.o(.bss);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(.bss);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(.bss);
        build/us/lib/ultralib/src/io/vimgr.o(.bss);
        build/us/lib/ultralib/src/io/vitbl.o(.bss);
        build/us/lib/ultralib/src/io/visetevent.o(.bss);
        build/us/lib/ultralib/src/io/visetmode.o(.bss);
        build/us/lib/ultralib/src/io/visetspecial.o(.bss);
        build/us/lib/ultralib/src/io/visetyscale.o(.bss);
        build/us/lib/ultralib/src/io/viswapbuf.o(.bss);
        build/us/lib/ultralib/src/io/viswapcontext.o(.bss);
        build/us/lib/ultralib/src/io/viblack.o(.bss);
        build/us/lib/ultralib/src/mgu/mtxident.o(.bss);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(.bss);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(.bss);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(.bss);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(.bss);
        build/us/lib/ultralib/src/mgu/scale.o(.bss);
        build/us/lib/ultralib/src/mgu/scalef.o(.bss);
        build/us/lib/ultralib/src/mgu/translate.o(.bss);
        build/us/lib/ultralib/src/mgu/translatef.o(.bss);
        build/us/lib/ultralib/src/os/initialize.o(.bss);
        build/us/lib/ultralib/src/io/conteepread.o(.bss);
        build/us/lib/ultralib/src/io/conteepwrite.o(.bss);
        build/us/lib/ultralib/src/os/exceptasm.o(.bss);
        build/us/lib/ultralib/src/os/interrupt.o(.bss);
        build/us/lib/ultralib/src/os/setintmask.o(.bss);
        build/us/lib/ultralib/src/os/setglobalintmask.o(.bss);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(.bss);
        build/us/lib/ultralib/src/io/pirawdma.o(.bss);
        build/us/lib/ultralib/src/io/pigetcmdq.o(.bss);
        build/us/lib/ultralib/src/io/epirawread.o(.bss);
        build/us/lib/ultralib/src/io/epirawwrite.o(.bss);
        build/us/lib/ultralib/src/io/ai.o(.bss);
        build/us/lib/ultralib/src/audio/drvrnew.o(.bss);
        build/us/lib/ultralib/src/audio/load.o(.bss);
        build/us/lib/ultralib/src/audio/auxbus.o(.bss);
        build/us/lib/ultralib/src/audio/filter.o(.bss);
        build/us/lib/ultralib/src/audio/mainbus.o(.bss);
        build/us/lib/ultralib/src/audio/resample.o(.bss);
        build/us/lib/ultralib/src/audio/reverb.o(.bss);
        build/us/lib/ultralib/src/audio/save.o(.bss);
        build/us/lib/ultralib/src/audio/heapalloc.o(.bss);
        build/us/lib/ultralib/src/audio/copy.o(.bss);
        build/us/lib/ultralib/src/os/invalicache.o(.bss);
        build/us/lib/ultralib/src/os/writebackdcache.o(.bss);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(.bss);
        build/us/lib/ultralib/src/os/getcause.o(.bss);
        build/us/lib/ultralib/src/os/getcount.o(.bss);
        build/us/lib/ultralib/src/os/getsr.o(.bss);
        build/us/lib/ultralib/src/os/setcompare.o(.bss);
        build/us/lib/ultralib/src/os/setfpccsr.o(.bss);
        build/us/lib/ultralib/src/os/setsr.o(.bss);
        build/us/lib/ultralib/src/os/setwatchlo.o(.bss);
        build/us/lib/ultralib/src/io/sp.o(.bss);
        build/us/lib/ultralib/src/io/spgetstat.o(.bss);
        build/us/lib/ultralib/src/io/spsetstat.o(.bss);
        build/us/lib/ultralib/src/io/spsetpc.o(.bss);
        build/us/lib/ultralib/src/io/sprawdma.o(.bss);
        build/us/lib/ultralib/src/io/sirawread.o(.bss);
        build/us/lib/ultralib/src/io/sirawwrite.o(.bss);
        build/us/lib/ultralib/src/os/destroythread.o(.bss);
        build/us/lib/ultralib/src/os/maptlbrdb.o(.bss);
        build/us/lib/ultralib/src/os/unmaptlball.o(.bss);
        build/us/lib/ultralib/src/io/vi.o(.bss);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(.bss);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(.bss);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(.bss);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(.bss);
        build/us/lib/ultralib/src/os/parameters.o(.bss);
        build/us/lib/ultralib/src/gu/libm_vals.o(.bss);
        build/us/lib/ultralib/src/io/dp.o(.bss);
        build/us/lib/ultralib/src/io/si.o(.bss);
        build/us/src/libkmc/fmod.o(.bss);
        build/us/src/libkmc/memmove.o(.bss);
        build/us/src/libkmc/memset.o(.bss);
        build/us/src/libkmc/modf.o(.bss);
        build/us/src/libkmc/rand.o(.bss);
        build/us/src/libkmc/strcpy.o(.bss);
        build/us/src/libkmc/mmuldi3.o(.bss);
        build/us/src/libkmc/ctype.o(.bss);
        build/us/asm/boot/8001B640.o(.bss);
        build/us/src/boot/boot_main.o(COMMON);
        build/us/src/boot/dmadata.o(COMMON);
        build/us/src/gzip/inflate.o(COMMON);
        build/us/src/gzip/unzip.o(COMMON);
        build/us/src/boot/util.o(COMMON);
        build/us/src/boot/rom_offsets.o(COMMON);
        build/us/lib/ultralib/src/io/conteepprobe.o(COMMON);
        build/us/lib/ultralib/src/io/conteeplongwrite.o(COMMON);
        build/us/lib/ultralib/src/io/conteeplongread.o(COMMON);
        build/us/lib/ultralib/src/io/pimgr.o(COMMON);
        build/us/lib/ultralib/src/io/epirawdma.o(COMMON);
        build/us/lib/ultralib/src/io/epidma.o(COMMON);
        build/us/lib/ultralib/src/io/cartrominit.o(COMMON);
        build/us/lib/ultralib/src/io/devmgr.o(COMMON);
        build/us/lib/ultralib/src/io/piacs.o(COMMON);
        build/us/lib/ultralib/src/io/pidma.o(COMMON);
        build/us/lib/ultralib/src/io/aigetlen.o(COMMON);
        build/us/lib/ultralib/src/io/aigetstat.o(COMMON);
        build/us/lib/ultralib/src/io/aisetfreq.o(COMMON);
        build/us/lib/ultralib/src/io/aisetnextbuf.o(COMMON);
        build/us/lib/ultralib/src/audio/env.o(COMMON);
        build/us/lib/ultralib/src/audio/sl.o(COMMON);
        build/us/lib/ultralib/src/audio/heapinit.o(COMMON);
        build/us/lib/ultralib/src/audio/synthesizer.o(COMMON);
        build/us/lib/ultralib/src/audio/syndelete.o(COMMON);
        build/us/lib/ultralib/src/audio/synaddplayer.o(COMMON);
        build/us/lib/ultralib/src/audio/synallocvoice.o(COMMON);
        build/us/lib/ultralib/src/audio/synstopvoice.o(COMMON);
        build/us/lib/ultralib/src/audio/synstartvoice.o(COMMON);
        build/us/lib/ultralib/src/audio/synsetpitch.o(COMMON);
        build/us/lib/ultralib/src/audio/synsetvol.o(COMMON);
        build/us/lib/ultralib/src/audio/synsetfxmix.o(COMMON);
        build/us/lib/ultralib/src/audio/synsetpan.o(COMMON);
        build/us/lib/ultralib/src/audio/synallocfx.o(COMMON);
        build/us/lib/ultralib/src/os/invaldcache.o(COMMON);
        build/us/lib/ultralib/src/os/writebackdcacheall.o(COMMON);
        build/us/lib/ultralib/src/io/contquery.o(COMMON);
        build/us/lib/ultralib/src/io/contreaddata.o(COMMON);
        build/us/lib/ultralib/src/io/controller.o(COMMON);
        build/us/lib/ultralib/src/io/contsetch.o(COMMON);
        build/us/lib/ultralib/src/os/virtualtophysical.o(COMMON);
        build/us/lib/ultralib/src/gu/sqrtf.o(COMMON);
        build/us/lib/ultralib/src/gu/cosf.o(COMMON);
        build/us/lib/ultralib/src/gu/ortho.o(COMMON);
        build/us/lib/ultralib/src/gu/perspective.o(COMMON);
        build/us/lib/ultralib/src/gu/rotaterpy.o(COMMON);
        build/us/lib/ultralib/src/gu/sinf.o(COMMON);
        build/us/lib/ultralib/src/gu/sins.o(COMMON);
        build/us/lib/ultralib/src/libc/bcmp.o(COMMON);
        build/us/lib/ultralib/src/libc/bcopy.o(COMMON);
        build/us/lib/ultralib/src/libc/bzero.o(COMMON);
        build/us/lib/ultralib/src/libc/string.o(COMMON);
        build/us/lib/ultralib/src/os/createmesgqueue.o(COMMON);
        build/us/lib/ultralib/src/os/jammesg.o(COMMON);
        build/us/lib/ultralib/src/os/recvmesg.o(COMMON);
        build/us/lib/ultralib/src/os/sendmesg.o(COMMON);
        build/us/lib/ultralib/src/os/seteventmesg.o(COMMON);
        build/us/lib/ultralib/src/io/sptask.o(COMMON);
        build/us/lib/ultralib/src/io/sptaskyield.o(COMMON);
        build/us/lib/ultralib/src/io/sptaskyielded.o(COMMON);
        build/us/lib/ultralib/src/sched/sched.o(COMMON);
        build/us/lib/ultralib/src/io/sirawdma.o(COMMON);
        build/us/lib/ultralib/src/io/siacs.o(COMMON);
        build/us/lib/ultralib/src/os/createthread.o(COMMON);
        build/us/lib/ultralib/src/os/getthreadpri.o(COMMON);
        build/us/lib/ultralib/src/os/setthreadpri.o(COMMON);
        build/us/lib/ultralib/src/os/startthread.o(COMMON);
        build/us/lib/ultralib/src/os/stopthread.o(COMMON);
        build/us/lib/ultralib/src/os/thread.o(COMMON);
        build/us/lib/ultralib/src/os/yieldthread.o(COMMON);
        build/us/lib/ultralib/src/os/gettime.o(COMMON);
        build/us/lib/ultralib/src/os/settime.o(COMMON);
        build/us/lib/ultralib/src/os/settimer.o(COMMON);
        build/us/lib/ultralib/src/os/timerintr.o(COMMON);
        build/us/lib/ultralib/src/os/probetlb.o(COMMON);
        build/us/lib/ultralib/src/io/vigetcurrframebuf.o(COMMON);
        build/us/lib/ultralib/src/io/vigetnextframebuf.o(COMMON);
        build/us/lib/ultralib/src/io/vimgr.o(COMMON);
        build/us/lib/ultralib/src/io/vitbl.o(COMMON);
        build/us/lib/ultralib/src/io/visetevent.o(COMMON);
        build/us/lib/ultralib/src/io/visetmode.o(COMMON);
        build/us/lib/ultralib/src/io/visetspecial.o(COMMON);
        build/us/lib/ultralib/src/io/visetyscale.o(COMMON);
        build/us/lib/ultralib/src/io/viswapbuf.o(COMMON);
        build/us/lib/ultralib/src/io/viswapcontext.o(COMMON);
        build/us/lib/ultralib/src/io/viblack.o(COMMON);
        build/us/lib/ultralib/src/mgu/mtxident.o(COMMON);
        build/us/lib/ultralib/src/mgu/mtxidentf.o(COMMON);
        build/us/lib/ultralib/src/mgu/mtxf2l.o(COMMON);
        build/us/lib/ultralib/src/mgu/mtxl2f.o(COMMON);
        build/us/lib/ultralib/src/mgu/mtxcatf.o(COMMON);
        build/us/lib/ultralib/src/mgu/scale.o(COMMON);
        build/us/lib/ultralib/src/mgu/scalef.o(COMMON);
        build/us/lib/ultralib/src/mgu/translate.o(COMMON);
        build/us/lib/ultralib/src/mgu/translatef.o(COMMON);
        build/us/lib/ultralib/src/os/initialize.o(COMMON);
        build/us/lib/ultralib/src/io/conteepread.o(COMMON);
        build/us/lib/ultralib/src/io/conteepwrite.o(COMMON);
        build/us/lib/ultralib/src/os/exceptasm.o(COMMON);
        build/us/lib/ultralib/src/os/interrupt.o(COMMON);
        build/us/lib/ultralib/src/os/setintmask.o(COMMON);
        build/us/lib/ultralib/src/os/setglobalintmask.o(COMMON);
        build/us/lib/ultralib/src/os/resetglobalintmask.o(COMMON);
        build/us/lib/ultralib/src/io/pirawdma.o(COMMON);
        build/us/lib/ultralib/src/io/pigetcmdq.o(COMMON);
        build/us/lib/ultralib/src/io/epirawread.o(COMMON);
        build/us/lib/ultralib/src/io/epirawwrite.o(COMMON);
        build/us/lib/ultralib/src/io/ai.o(COMMON);
        build/us/lib/ultralib/src/audio/drvrnew.o(COMMON);
        build/us/lib/ultralib/src/audio/load.o(COMMON);
        build/us/lib/ultralib/src/audio/auxbus.o(COMMON);
        build/us/lib/ultralib/src/audio/filter.o(COMMON);
        build/us/lib/ultralib/src/audio/mainbus.o(COMMON);
        build/us/lib/ultralib/src/audio/resample.o(COMMON);
        build/us/lib/ultralib/src/audio/reverb.o(COMMON);
        build/us/lib/ultralib/src/audio/save.o(COMMON);
        build/us/lib/ultralib/src/audio/heapalloc.o(COMMON);
        build/us/lib/ultralib/src/audio/copy.o(COMMON);
        build/us/lib/ultralib/src/os/invalicache.o(COMMON);
        build/us/lib/ultralib/src/os/writebackdcache.o(COMMON);
        build/us/lib/ultralib/src/io/dpsetnextbuf.o(COMMON);
        build/us/lib/ultralib/src/os/getcause.o(COMMON);
        build/us/lib/ultralib/src/os/getcount.o(COMMON);
        build/us/lib/ultralib/src/os/getsr.o(COMMON);
        build/us/lib/ultralib/src/os/setcompare.o(COMMON);
        build/us/lib/ultralib/src/os/setfpccsr.o(COMMON);
        build/us/lib/ultralib/src/os/setsr.o(COMMON);
        build/us/lib/ultralib/src/os/setwatchlo.o(COMMON);
        build/us/lib/ultralib/src/io/sp.o(COMMON);
        build/us/lib/ultralib/src/io/spgetstat.o(COMMON);
        build/us/lib/ultralib/src/io/spsetstat.o(COMMON);
        build/us/lib/ultralib/src/io/spsetpc.o(COMMON);
        build/us/lib/ultralib/src/io/sprawdma.o(COMMON);
        build/us/lib/ultralib/src/io/sirawread.o(COMMON);
        build/us/lib/ultralib/src/io/sirawwrite.o(COMMON);
        build/us/lib/ultralib/src/os/destroythread.o(COMMON);
        build/us/lib/ultralib/src/os/maptlbrdb.o(COMMON);
        build/us/lib/ultralib/src/os/unmaptlball.o(COMMON);
        build/us/lib/ultralib/src/io/vi.o(COMMON);
        build/us/lib/ultralib/src/io/vigetcurrcontext.o(COMMON);
        build/us/lib/ultralib/src/vimodes/vimodentsclan1.o(COMMON);
        build/us/lib/ultralib/src/vimodes/vimodepallan1.o(COMMON);
        build/us/lib/ultralib/src/vimodes/vimodempallan1.o(COMMON);
        build/us/lib/ultralib/src/os/parameters.o(COMMON);
        build/us/lib/ultralib/src/gu/libm_vals.o(COMMON);
        build/us/lib/ultralib/src/io/dp.o(COMMON);
        build/us/lib/ultralib/src/io/si.o(COMMON);
        build/us/src/libkmc/fmod.o(COMMON);
        build/us/src/libkmc/memmove.o(COMMON);
        build/us/src/libkmc/memset.o(COMMON);
        build/us/src/libkmc/modf.o(COMMON);
        build/us/src/libkmc/rand.o(COMMON);
        build/us/src/libkmc/strcpy.o(COMMON);
        build/us/src/libkmc/mmuldi3.o(COMMON);
        build/us/src/libkmc/ctype.o(COMMON);
        build/us/asm/boot/8001B640.o(COMMON);
        boot_bss_END = .;
        boot_bss_SIZE = ABSOLUTE(boot_bss_END - boot_bss_START);
    }
    boot_VRAM_END = .;

    dma_table_ROM_START = __romPos;
    dma_table_VRAM = ADDR(.dma_table);
    .dma_table : AT(dma_table_ROM_START)
    {
        dma_table_text_START = .;
        build/us/src/dma_table/dma_table.o(.text);
        dma_table_text_END = .;
        dma_table_text_SIZE = ABSOLUTE(dma_table_text_END - dma_table_text_START);
        dma_table_data_START = .;
        build/us/src/dma_table/dma_table.o(.data);
        dma_table_data_END = .;
        dma_table_data_SIZE = ABSOLUTE(dma_table_data_END - dma_table_data_START);
        dma_table_rodata_START = .;
        build/us/src/dma_table/dma_table.o(.rodata);
        dma_table_rodata_END = .;
        dma_table_rodata_SIZE = ABSOLUTE(dma_table_rodata_END - dma_table_rodata_START);
    }
    __romPos += SIZEOF(.dma_table);
    dma_table_ROM_END = __romPos;
    .dma_table (NOLOAD) :
    {
        dma_table_bss_START = .;
        build/us/src/dma_table/dma_table.o(.sbss);
        build/us/src/dma_table/dma_table.o(.scommon);
        build/us/src/dma_table/dma_table.o(.bss);
        build/us/src/dma_table/dma_table.o(COMMON);
        dma_table_bss_END = .;
        dma_table_bss_SIZE = ABSOLUTE(dma_table_bss_END - dma_table_bss_START);
    }
    dma_table_VRAM_END = .;

    main_segment_ROM_START = __romPos;
    main_segment_VRAM = ADDR(.main_segment);
    .main_segment : AT(main_segment_ROM_START)
    {
        main_segment_text_START = .;
        build/us/src/main_segment/main.o(.text);
        build/us/src/main_segment/nnsched.o(.text);
        build/us/src/main_segment/joy.o(.text);
        build/us/src/main_segment/audio/sound.o(.text);
        build/us/src/main_segment/graphic.o(.text);
        build/us/src/main_segment/graphics/static.o(.text);
        build/us/src/main_segment/graphics/graphic_dlists.o(.text);
        build/us/src/main_segment/audio/music_driver.o(.text);
        build/us/src/main_segment/main1x.o(.text);
        build/us/src/main_segment/vr_init.o(.text);
        build/us/src/main_segment/aiset.o(.text);
        build/us/src/main_segment/record.o(.text);
        build/us/src/main_segment/unused/020D10.o(.text);
        build/us/src/main_segment/game_etc.o(.text);
        build/us/src/main_segment/screen_print/printer.o(.text);
        build/us/src/main_segment/screen_print/printf_impl.o(.text);
        build/us/src/main_segment/screen_print/debug_print.o(.text);
        build/us/src/main_segment/debug_menu.o(.text);
        build/us/src/main_segment/028820.o(.text);
        build/us/src/main_segment/tex_func.o(.text);
        build/us/src/main_segment/main_menu.o(.text);
        build/us/src/main_segment/font.o(.text);
        build/us/src/main_segment/msgwnd.o(.text);
        build/us/src/main_segment/char_anime.o(.text);
        build/us/src/main_segment/dm_virus_init.o(.text);
        build/us/src/main_segment/dm_game_main.o(.text);
        build/us/src/main_segment/dm_manual_main.o(.text);
        build/us/src/main_segment/dm_title_main.o(.text);
        build/us/src/main_segment/main_story.o(.text);
        build/us/src/main_segment/lws.o(.text);
        build/us/src/main_segment/calc.o(.text);
        build/us/src/main_segment/unused/065080.o(.text);
        build/us/src/main_segment/unused/066080.o(.text);
        build/us/src/main_segment/replay.o(.text);
        build/us/src/main_segment/066580.o(.text);
        build/us/src/main_segment/066840.o(.text);
        build/us/src/main_segment/unused/055C40.o(.text);
        build/us/lib/libmus/src/player.o(.text);
        build/us/lib/libmus/src/player_fx.o(.text);
        build/us/lib/libmus/src/aud_dma.o(.text);
        build/us/lib/libmus/src/aud_sched.o(.text);
        build/us/lib/libmus/src/aud_thread.o(.text);
        build/us/lib/libmus/src/lib_memory.o(.text);
        build/us/lib/libmus/src/aud_samples.o(.text);
        build/us/asm/rsp/rspboot.o(.text);
        build/us/asm/rsp/aspMain.o(.text);
        build/us/asm/rsp/f3dex2.o(.text);
        build/us/asm/rsp/s2dex.o(.text);
        build/us/asm/main_segment/800E9BB0.o(.text);
        main_segment_text_END = .;
        main_segment_text_SIZE = ABSOLUTE(main_segment_text_END - main_segment_text_START);
        main_segment_data_START = .;
        build/us/src/main_segment/main.o(.data);
        build/us/src/main_segment/nnsched.o(.data);
        build/us/src/main_segment/joy.o(.data);
        build/us/src/main_segment/audio/sound.o(.data);
        build/us/src/main_segment/graphic.o(.data);
        build/us/src/main_segment/graphics/static.o(.data);
        build/us/src/main_segment/graphics/graphic_dlists.o(.data);
        build/us/src/main_segment/audio/music_driver.o(.data);
        build/us/src/main_segment/main1x.o(.data);
        build/us/src/main_segment/vr_init.o(.data);
        build/us/src/main_segment/aiset.o(.data);
        build/us/src/main_segment/record.o(.data);
        build/us/src/main_segment/unused/020D10.o(.data);
        build/us/src/main_segment/game_etc.o(.data);
        build/us/src/main_segment/screen_print/printer.o(.data);
        build/us/src/main_segment/screen_print/printf_impl.o(.data);
        build/us/src/main_segment/screen_print/debug_print.o(.data);
        build/us/src/main_segment/debug_menu.o(.data);
        build/us/src/main_segment/028820.o(.data);
        build/us/src/main_segment/tex_func.o(.data);
        build/us/src/main_segment/main_menu.o(.data);
        build/us/src/main_segment/font.o(.data);
        build/us/src/main_segment/msgwnd.o(.data);
        build/us/src/main_segment/char_anime.o(.data);
        build/us/src/main_segment/dm_virus_init.o(.data);
        build/us/src/main_segment/dm_game_main.o(.data);
        build/us/src/main_segment/dm_manual_main.o(.data);
        build/us/src/main_segment/dm_title_main.o(.data);
        build/us/src/main_segment/main_story.o(.data);
        build/us/src/main_segment/lws.o(.data);
        build/us/src/main_segment/calc.o(.data);
        build/us/src/main_segment/unused/065080.o(.data);
        build/us/src/main_segment/unused/066080.o(.data);
        build/us/src/main_segment/replay.o(.data);
        build/us/src/main_segment/066580.o(.data);
        build/us/src/main_segment/066840.o(.data);
        build/us/src/main_segment/unused/055C40.o(.data);
        build/us/lib/libmus/src/player.o(.data);
        build/us/lib/libmus/src/player_fx.o(.data);
        build/us/lib/libmus/src/aud_dma.o(.data);
        build/us/lib/libmus/src/aud_sched.o(.data);
        build/us/lib/libmus/src/aud_thread.o(.data);
        build/us/lib/libmus/src/lib_memory.o(.data);
        build/us/lib/libmus/src/aud_samples.o(.data);
        build/us/asm/rsp/rspboot.o(.data);
        build/us/asm/rsp/aspMain.o(.data);
        build/us/asm/rsp/f3dex2.o(.data);
        build/us/asm/rsp/s2dex.o(.data);
        build/us/asm/main_segment/800E9BB0.o(.data);
        main_segment_data_END = .;
        main_segment_data_SIZE = ABSOLUTE(main_segment_data_END - main_segment_data_START);
        main_segment_rodata_START = .;
        build/us/src/main_segment/main.o(.rodata);
        build/us/src/main_segment/nnsched.o(.rodata);
        build/us/src/main_segment/joy.o(.rodata);
        build/us/src/main_segment/audio/sound.o(.rodata);
        build/us/src/main_segment/graphic.o(.rodata);
        build/us/src/main_segment/graphics/static.o(.rodata);
        build/us/src/main_segment/graphics/graphic_dlists.o(.rodata);
        build/us/src/main_segment/audio/music_driver.o(.rodata);
        build/us/src/main_segment/main1x.o(.rodata);
        build/us/src/main_segment/vr_init.o(.rodata);
        build/us/src/main_segment/aiset.o(.rodata);
        build/us/src/main_segment/record.o(.rodata);
        build/us/src/main_segment/unused/020D10.o(.rodata);
        build/us/src/main_segment/game_etc.o(.rodata);
        build/us/src/main_segment/screen_print/printer.o(.rodata);
        build/us/src/main_segment/screen_print/printf_impl.o(.rodata);
        build/us/src/main_segment/screen_print/debug_print.o(.rodata);
        build/us/src/main_segment/debug_menu.o(.rodata);
        build/us/src/main_segment/028820.o(.rodata);
        build/us/src/main_segment/tex_func.o(.rodata);
        build/us/src/main_segment/main_menu.o(.rodata);
        build/us/src/main_segment/font.o(.rodata);
        build/us/src/main_segment/msgwnd.o(.rodata);
        build/us/src/main_segment/char_anime.o(.rodata);
        build/us/src/main_segment/dm_virus_init.o(.rodata);
        build/us/src/main_segment/dm_game_main.o(.rodata);
        build/us/src/main_segment/dm_manual_main.o(.rodata);
        build/us/src/main_segment/dm_title_main.o(.rodata);
        build/us/src/main_segment/main_story.o(.rodata);
        build/us/src/main_segment/lws.o(.rodata);
        build/us/src/main_segment/calc.o(.rodata);
        build/us/src/main_segment/unused/065080.o(.rodata);
        build/us/src/main_segment/unused/066080.o(.rodata);
        build/us/src/main_segment/replay.o(.rodata);
        build/us/src/main_segment/066580.o(.rodata);
        build/us/src/main_segment/066840.o(.rodata);
        build/us/src/main_segment/unused/055C40.o(.rodata);
        build/us/lib/libmus/src/player.o(.rodata);
        build/us/lib/libmus/src/player_fx.o(.rodata);
        build/us/lib/libmus/src/aud_dma.o(.rodata);
        build/us/lib/libmus/src/aud_sched.o(.rodata);
        build/us/lib/libmus/src/aud_thread.o(.rodata);
        build/us/lib/libmus/src/lib_memory.o(.rodata);
        build/us/lib/libmus/src/aud_samples.o(.rodata);
        build/us/asm/rsp/rspboot.o(.rodata);
        build/us/asm/rsp/aspMain.o(.rodata);
        build/us/asm/rsp/f3dex2.o(.rodata);
        build/us/asm/rsp/s2dex.o(.rodata);
        build/us/asm/main_segment/800E9BB0.o(.rodata);
        main_segment_rodata_END = .;
        main_segment_rodata_SIZE = ABSOLUTE(main_segment_rodata_END - main_segment_rodata_START);
    }
    __romPos += SIZEOF(.main_segment);
    main_segment_ROM_END = __romPos;
    .main_segment (NOLOAD) :
    {
        main_segment_bss_START = .;
        build/us/src/main_segment/main.o(.sbss);
        build/us/src/main_segment/nnsched.o(.sbss);
        build/us/src/main_segment/joy.o(.sbss);
        build/us/src/main_segment/audio/sound.o(.sbss);
        build/us/src/main_segment/graphic.o(.sbss);
        build/us/src/main_segment/graphics/static.o(.sbss);
        build/us/src/main_segment/graphics/graphic_dlists.o(.sbss);
        build/us/src/main_segment/audio/music_driver.o(.sbss);
        build/us/src/main_segment/main1x.o(.sbss);
        build/us/src/main_segment/vr_init.o(.sbss);
        build/us/src/main_segment/aiset.o(.sbss);
        build/us/src/main_segment/record.o(.sbss);
        build/us/src/main_segment/unused/020D10.o(.sbss);
        build/us/src/main_segment/game_etc.o(.sbss);
        build/us/src/main_segment/screen_print/printer.o(.sbss);
        build/us/src/main_segment/screen_print/printf_impl.o(.sbss);
        build/us/src/main_segment/screen_print/debug_print.o(.sbss);
        build/us/src/main_segment/debug_menu.o(.sbss);
        build/us/src/main_segment/028820.o(.sbss);
        build/us/src/main_segment/tex_func.o(.sbss);
        build/us/src/main_segment/main_menu.o(.sbss);
        build/us/src/main_segment/font.o(.sbss);
        build/us/src/main_segment/msgwnd.o(.sbss);
        build/us/src/main_segment/char_anime.o(.sbss);
        build/us/src/main_segment/dm_virus_init.o(.sbss);
        build/us/src/main_segment/dm_game_main.o(.sbss);
        build/us/src/main_segment/dm_manual_main.o(.sbss);
        build/us/src/main_segment/dm_title_main.o(.sbss);
        build/us/src/main_segment/main_story.o(.sbss);
        build/us/src/main_segment/lws.o(.sbss);
        build/us/src/main_segment/calc.o(.sbss);
        build/us/src/main_segment/unused/065080.o(.sbss);
        build/us/src/main_segment/unused/066080.o(.sbss);
        build/us/src/main_segment/replay.o(.sbss);
        build/us/src/main_segment/066580.o(.sbss);
        build/us/src/main_segment/066840.o(.sbss);
        build/us/src/main_segment/unused/055C40.o(.sbss);
        build/us/lib/libmus/src/player.o(.sbss);
        build/us/lib/libmus/src/player_fx.o(.sbss);
        build/us/lib/libmus/src/aud_dma.o(.sbss);
        build/us/lib/libmus/src/aud_sched.o(.sbss);
        build/us/lib/libmus/src/aud_thread.o(.sbss);
        build/us/lib/libmus/src/lib_memory.o(.sbss);
        build/us/lib/libmus/src/aud_samples.o(.sbss);
        build/us/asm/rsp/rspboot.o(.sbss);
        build/us/asm/rsp/aspMain.o(.sbss);
        build/us/asm/rsp/f3dex2.o(.sbss);
        build/us/asm/rsp/s2dex.o(.sbss);
        build/us/asm/main_segment/800E9BB0.o(.sbss);
        build/us/src/main_segment/main.o(.scommon);
        build/us/src/main_segment/nnsched.o(.scommon);
        build/us/src/main_segment/joy.o(.scommon);
        build/us/src/main_segment/audio/sound.o(.scommon);
        build/us/src/main_segment/graphic.o(.scommon);
        build/us/src/main_segment/graphics/static.o(.scommon);
        build/us/src/main_segment/graphics/graphic_dlists.o(.scommon);
        build/us/src/main_segment/audio/music_driver.o(.scommon);
        build/us/src/main_segment/main1x.o(.scommon);
        build/us/src/main_segment/vr_init.o(.scommon);
        build/us/src/main_segment/aiset.o(.scommon);
        build/us/src/main_segment/record.o(.scommon);
        build/us/src/main_segment/unused/020D10.o(.scommon);
        build/us/src/main_segment/game_etc.o(.scommon);
        build/us/src/main_segment/screen_print/printer.o(.scommon);
        build/us/src/main_segment/screen_print/printf_impl.o(.scommon);
        build/us/src/main_segment/screen_print/debug_print.o(.scommon);
        build/us/src/main_segment/debug_menu.o(.scommon);
        build/us/src/main_segment/028820.o(.scommon);
        build/us/src/main_segment/tex_func.o(.scommon);
        build/us/src/main_segment/main_menu.o(.scommon);
        build/us/src/main_segment/font.o(.scommon);
        build/us/src/main_segment/msgwnd.o(.scommon);
        build/us/src/main_segment/char_anime.o(.scommon);
        build/us/src/main_segment/dm_virus_init.o(.scommon);
        build/us/src/main_segment/dm_game_main.o(.scommon);
        build/us/src/main_segment/dm_manual_main.o(.scommon);
        build/us/src/main_segment/dm_title_main.o(.scommon);
        build/us/src/main_segment/main_story.o(.scommon);
        build/us/src/main_segment/lws.o(.scommon);
        build/us/src/main_segment/calc.o(.scommon);
        build/us/src/main_segment/unused/065080.o(.scommon);
        build/us/src/main_segment/unused/066080.o(.scommon);
        build/us/src/main_segment/replay.o(.scommon);
        build/us/src/main_segment/066580.o(.scommon);
        build/us/src/main_segment/066840.o(.scommon);
        build/us/src/main_segment/unused/055C40.o(.scommon);
        build/us/lib/libmus/src/player.o(.scommon);
        build/us/lib/libmus/src/player_fx.o(.scommon);
        build/us/lib/libmus/src/aud_dma.o(.scommon);
        build/us/lib/libmus/src/aud_sched.o(.scommon);
        build/us/lib/libmus/src/aud_thread.o(.scommon);
        build/us/lib/libmus/src/lib_memory.o(.scommon);
        build/us/lib/libmus/src/aud_samples.o(.scommon);
        build/us/asm/rsp/rspboot.o(.scommon);
        build/us/asm/rsp/aspMain.o(.scommon);
        build/us/asm/rsp/f3dex2.o(.scommon);
        build/us/asm/rsp/s2dex.o(.scommon);
        build/us/asm/main_segment/800E9BB0.o(.scommon);
        build/us/src/main_segment/main.o(.bss);
        build/us/src/main_segment/nnsched.o(.bss);
        build/us/src/main_segment/joy.o(.bss);
        build/us/src/main_segment/audio/sound.o(.bss);
        build/us/src/main_segment/graphic.o(.bss);
        build/us/src/main_segment/graphics/static.o(.bss);
        build/us/src/main_segment/graphics/graphic_dlists.o(.bss);
        build/us/src/main_segment/audio/music_driver.o(.bss);
        build/us/src/main_segment/main1x.o(.bss);
        build/us/src/main_segment/vr_init.o(.bss);
        build/us/src/main_segment/aiset.o(.bss);
        build/us/src/main_segment/record.o(.bss);
        build/us/src/main_segment/unused/020D10.o(.bss);
        build/us/src/main_segment/game_etc.o(.bss);
        build/us/src/main_segment/screen_print/printer.o(.bss);
        build/us/src/main_segment/screen_print/printf_impl.o(.bss);
        build/us/src/main_segment/screen_print/debug_print.o(.bss);
        build/us/src/main_segment/debug_menu.o(.bss);
        build/us/src/main_segment/028820.o(.bss);
        build/us/src/main_segment/tex_func.o(.bss);
        build/us/src/main_segment/main_menu.o(.bss);
        build/us/src/main_segment/font.o(.bss);
        build/us/src/main_segment/msgwnd.o(.bss);
        build/us/src/main_segment/char_anime.o(.bss);
        build/us/src/main_segment/dm_virus_init.o(.bss);
        build/us/src/main_segment/dm_game_main.o(.bss);
        build/us/src/main_segment/dm_manual_main.o(.bss);
        build/us/src/main_segment/dm_title_main.o(.bss);
        build/us/src/main_segment/main_story.o(.bss);
        build/us/src/main_segment/lws.o(.bss);
        build/us/src/main_segment/calc.o(.bss);
        build/us/src/main_segment/unused/065080.o(.bss);
        build/us/src/main_segment/unused/066080.o(.bss);
        build/us/src/main_segment/replay.o(.bss);
        build/us/src/main_segment/066580.o(.bss);
        build/us/src/main_segment/066840.o(.bss);
        build/us/src/main_segment/unused/055C40.o(.bss);
        build/us/lib/libmus/src/player.o(.bss);
        build/us/lib/libmus/src/player_fx.o(.bss);
        build/us/lib/libmus/src/aud_dma.o(.bss);
        build/us/lib/libmus/src/aud_sched.o(.bss);
        build/us/lib/libmus/src/aud_thread.o(.bss);
        build/us/lib/libmus/src/lib_memory.o(.bss);
        build/us/lib/libmus/src/aud_samples.o(.bss);
        build/us/asm/rsp/rspboot.o(.bss);
        build/us/asm/rsp/aspMain.o(.bss);
        build/us/asm/rsp/f3dex2.o(.bss);
        build/us/asm/rsp/s2dex.o(.bss);
        build/us/asm/main_segment/800E9BB0.o(.bss);
        build/us/src/main_segment/main.o(COMMON);
        build/us/src/main_segment/nnsched.o(COMMON);
        build/us/src/main_segment/joy.o(COMMON);
        build/us/src/main_segment/audio/sound.o(COMMON);
        build/us/src/main_segment/graphic.o(COMMON);
        build/us/src/main_segment/graphics/static.o(COMMON);
        build/us/src/main_segment/graphics/graphic_dlists.o(COMMON);
        build/us/src/main_segment/audio/music_driver.o(COMMON);
        build/us/src/main_segment/main1x.o(COMMON);
        build/us/src/main_segment/vr_init.o(COMMON);
        build/us/src/main_segment/aiset.o(COMMON);
        build/us/src/main_segment/record.o(COMMON);
        build/us/src/main_segment/unused/020D10.o(COMMON);
        build/us/src/main_segment/game_etc.o(COMMON);
        build/us/src/main_segment/screen_print/printer.o(COMMON);
        build/us/src/main_segment/screen_print/printf_impl.o(COMMON);
        build/us/src/main_segment/screen_print/debug_print.o(COMMON);
        build/us/src/main_segment/debug_menu.o(COMMON);
        build/us/src/main_segment/028820.o(COMMON);
        build/us/src/main_segment/tex_func.o(COMMON);
        build/us/src/main_segment/main_menu.o(COMMON);
        build/us/src/main_segment/font.o(COMMON);
        build/us/src/main_segment/msgwnd.o(COMMON);
        build/us/src/main_segment/char_anime.o(COMMON);
        build/us/src/main_segment/dm_virus_init.o(COMMON);
        build/us/src/main_segment/dm_game_main.o(COMMON);
        build/us/src/main_segment/dm_manual_main.o(COMMON);
        build/us/src/main_segment/dm_title_main.o(COMMON);
        build/us/src/main_segment/main_story.o(COMMON);
        build/us/src/main_segment/lws.o(COMMON);
        build/us/src/main_segment/calc.o(COMMON);
        build/us/src/main_segment/unused/065080.o(COMMON);
        build/us/src/main_segment/unused/066080.o(COMMON);
        build/us/src/main_segment/replay.o(COMMON);
        build/us/src/main_segment/066580.o(COMMON);
        build/us/src/main_segment/066840.o(COMMON);
        build/us/src/main_segment/unused/055C40.o(COMMON);
        build/us/lib/libmus/src/player.o(COMMON);
        build/us/lib/libmus/src/player_fx.o(COMMON);
        build/us/lib/libmus/src/aud_dma.o(COMMON);
        build/us/lib/libmus/src/aud_sched.o(COMMON);
        build/us/lib/libmus/src/aud_thread.o(COMMON);
        build/us/lib/libmus/src/lib_memory.o(COMMON);
        build/us/lib/libmus/src/aud_samples.o(COMMON);
        build/us/asm/rsp/rspboot.o(COMMON);
        build/us/asm/rsp/aspMain.o(COMMON);
        build/us/asm/rsp/f3dex2.o(COMMON);
        build/us/asm/rsp/s2dex.o(COMMON);
        build/us/asm/main_segment/800E9BB0.o(COMMON);
        main_segment_bss_END = .;
        main_segment_bss_SIZE = ABSOLUTE(main_segment_bss_END - main_segment_bss_START);
    }
    main_segment_VRAM_END = .;

    buffer1_ROM_START = __romPos;
    buffer1_VRAM = ADDR(.buffer1);
    .buffer1 : AT(buffer1_ROM_START)
    {
        buffer1_text_START = .;
        build/us/src/buffers/buffer1.o(.text);
        buffer1_text_END = .;
        buffer1_text_SIZE = ABSOLUTE(buffer1_text_END - buffer1_text_START);
        buffer1_data_START = .;
        build/us/src/buffers/buffer1.o(.data);
        buffer1_data_END = .;
        buffer1_data_SIZE = ABSOLUTE(buffer1_data_END - buffer1_data_START);
        buffer1_rodata_START = .;
        build/us/src/buffers/buffer1.o(.rodata);
        buffer1_rodata_END = .;
        buffer1_rodata_SIZE = ABSOLUTE(buffer1_rodata_END - buffer1_rodata_START);
    }
    __romPos += SIZEOF(.buffer1);
    buffer1_ROM_END = __romPos;
    .buffer1 (NOLOAD) :
    {
        buffer1_bss_START = .;
        build/us/src/buffers/buffer1.o(.sbss);
        build/us/src/buffers/buffer1.o(.scommon);
        build/us/src/buffers/buffer1.o(.bss);
        build/us/src/buffers/buffer1.o(COMMON);
        buffer1_bss_END = .;
        buffer1_bss_SIZE = ABSOLUTE(buffer1_bss_END - buffer1_bss_START);
    }
    buffer1_VRAM_END = .;

    buffer2_ROM_START = __romPos;
    buffer2_VRAM = ADDR(.buffer2);
    .buffer2 0x80205000 : AT(buffer2_ROM_START)
    {
        buffer2_text_START = .;
        build/us/src/buffers/buffer2.o(.text);
        buffer2_text_END = .;
        buffer2_text_SIZE = ABSOLUTE(buffer2_text_END - buffer2_text_START);
        buffer2_data_START = .;
        build/us/src/buffers/buffer2.o(.data);
        buffer2_data_END = .;
        buffer2_data_SIZE = ABSOLUTE(buffer2_data_END - buffer2_data_START);
        buffer2_rodata_START = .;
        build/us/src/buffers/buffer2.o(.rodata);
        buffer2_rodata_END = .;
        buffer2_rodata_SIZE = ABSOLUTE(buffer2_rodata_END - buffer2_rodata_START);
    }
    __romPos += SIZEOF(.buffer2);
    buffer2_ROM_END = __romPos;
    .buffer2 (NOLOAD) :
    {
        buffer2_bss_START = .;
        build/us/src/buffers/buffer2.o(.sbss);
        build/us/src/buffers/buffer2.o(.scommon);
        build/us/src/buffers/buffer2.o(.bss);
        build/us/src/buffers/buffer2.o(COMMON);
        buffer2_bss_END = .;
        buffer2_bss_SIZE = ABSOLUTE(buffer2_bss_END - buffer2_bss_START);
    }
    buffer2_VRAM_END = .;

    framebuffer_ROM_START = __romPos;
    framebuffer_VRAM = ADDR(.framebuffer);
    .framebuffer 0x803B5000 : AT(framebuffer_ROM_START)
    {
        framebuffer_text_START = .;
        build/us/src/buffers/framebuffer.o(.text);
        framebuffer_text_END = .;
        framebuffer_text_SIZE = ABSOLUTE(framebuffer_text_END - framebuffer_text_START);
        framebuffer_data_START = .;
        build/us/src/buffers/framebuffer.o(.data);
        framebuffer_data_END = .;
        framebuffer_data_SIZE = ABSOLUTE(framebuffer_data_END - framebuffer_data_START);
        framebuffer_rodata_START = .;
        build/us/src/buffers/framebuffer.o(.rodata);
        framebuffer_rodata_END = .;
        framebuffer_rodata_SIZE = ABSOLUTE(framebuffer_rodata_END - framebuffer_rodata_START);
    }
    __romPos += SIZEOF(.framebuffer);
    framebuffer_ROM_END = __romPos;
    .framebuffer (NOLOAD) :
    {
        framebuffer_bss_START = .;
        build/us/src/buffers/framebuffer.o(.sbss);
        build/us/src/buffers/framebuffer.o(.scommon);
        build/us/src/buffers/framebuffer.o(.bss);
        build/us/src/buffers/framebuffer.o(COMMON);
        framebuffer_bss_END = .;
        framebuffer_bss_SIZE = ABSOLUTE(framebuffer_bss_END - framebuffer_bss_START);
    }
    framebuffer_VRAM_END = .;

    n64_wave_tables_ROM_START = __romPos;
    n64_wave_tables_VRAM = ADDR(.n64_wave_tables);
    .n64_wave_tables : AT(n64_wave_tables_ROM_START)
    {
        n64_wave_tables_text_START = .;
        build/us/asm/n64_wave_tables.o(.text);
        n64_wave_tables_text_END = .;
        n64_wave_tables_text_SIZE = ABSOLUTE(n64_wave_tables_text_END - n64_wave_tables_text_START);
        n64_wave_tables_data_START = .;
        build/us/asm/n64_wave_tables.o(.data);
        n64_wave_tables_data_END = .;
        n64_wave_tables_data_SIZE = ABSOLUTE(n64_wave_tables_data_END - n64_wave_tables_data_START);
        n64_wave_tables_rodata_START = .;
        build/us/asm/n64_wave_tables.o(.rodata);
        n64_wave_tables_rodata_END = .;
        n64_wave_tables_rodata_SIZE = ABSOLUTE(n64_wave_tables_rodata_END - n64_wave_tables_rodata_START);
    }
    __romPos += SIZEOF(.n64_wave_tables);
    n64_wave_tables_ROM_END = __romPos;
    .n64_wave_tables (NOLOAD) :
    {
        n64_wave_tables_bss_START = .;
        build/us/asm/n64_wave_tables.o(.sbss);
        build/us/asm/n64_wave_tables.o(.scommon);
        build/us/asm/n64_wave_tables.o(.bss);
        build/us/asm/n64_wave_tables.o(COMMON);
        n64_wave_tables_bss_END = .;
        n64_wave_tables_bss_SIZE = ABSOLUTE(n64_wave_tables_bss_END - n64_wave_tables_bss_START);
    }
    n64_wave_tables_VRAM_END = .;

    n64_ptr_tables_v2_ROM_START = __romPos;
    n64_ptr_tables_v2_VRAM = ADDR(.n64_ptr_tables_v2);
    .n64_ptr_tables_v2 : AT(n64_ptr_tables_v2_ROM_START)
    {
        n64_ptr_tables_v2_text_START = .;
        build/us/asm/n64_ptr_tables_v2.o(.text);
        n64_ptr_tables_v2_text_END = .;
        n64_ptr_tables_v2_text_SIZE = ABSOLUTE(n64_ptr_tables_v2_text_END - n64_ptr_tables_v2_text_START);
        n64_ptr_tables_v2_data_START = .;
        build/us/asm/n64_ptr_tables_v2.o(.data);
        n64_ptr_tables_v2_data_END = .;
        n64_ptr_tables_v2_data_SIZE = ABSOLUTE(n64_ptr_tables_v2_data_END - n64_ptr_tables_v2_data_START);
        n64_ptr_tables_v2_rodata_START = .;
        build/us/asm/n64_ptr_tables_v2.o(.rodata);
        n64_ptr_tables_v2_rodata_END = .;
        n64_ptr_tables_v2_rodata_SIZE = ABSOLUTE(n64_ptr_tables_v2_rodata_END - n64_ptr_tables_v2_rodata_START);
    }
    __romPos += SIZEOF(.n64_ptr_tables_v2);
    n64_ptr_tables_v2_ROM_END = __romPos;
    .n64_ptr_tables_v2 (NOLOAD) :
    {
        n64_ptr_tables_v2_bss_START = .;
        build/us/asm/n64_ptr_tables_v2.o(.sbss);
        build/us/asm/n64_ptr_tables_v2.o(.scommon);
        build/us/asm/n64_ptr_tables_v2.o(.bss);
        build/us/asm/n64_ptr_tables_v2.o(COMMON);
        n64_ptr_tables_v2_bss_END = .;
        n64_ptr_tables_v2_bss_SIZE = ABSOLUTE(n64_ptr_tables_v2_bss_END - n64_ptr_tables_v2_bss_START);
    }
    n64_ptr_tables_v2_VRAM_END = .;

    segment_17213_ROM_START = __romPos;
    segment_17213_VRAM = ADDR(.segment_17213);
    .segment_17213 : AT(segment_17213_ROM_START)
    {
        segment_17213_text_START = .;
        build/us/asm/segment_17213.o(.text);
        segment_17213_text_END = .;
        segment_17213_text_SIZE = ABSOLUTE(segment_17213_text_END - segment_17213_text_START);
        segment_17213_data_START = .;
        build/us/asm/segment_17213.o(.data);
        segment_17213_data_END = .;
        segment_17213_data_SIZE = ABSOLUTE(segment_17213_data_END - segment_17213_data_START);
        segment_17213_rodata_START = .;
        build/us/asm/segment_17213.o(.rodata);
        segment_17213_rodata_END = .;
        segment_17213_rodata_SIZE = ABSOLUTE(segment_17213_rodata_END - segment_17213_rodata_START);
    }
    __romPos += SIZEOF(.segment_17213);
    segment_17213_ROM_END = __romPos;
    .segment_17213 (NOLOAD) :
    {
        segment_17213_bss_START = .;
        build/us/asm/segment_17213.o(.sbss);
        build/us/asm/segment_17213.o(.scommon);
        build/us/asm/segment_17213.o(.bss);
        build/us/asm/segment_17213.o(COMMON);
        segment_17213_bss_END = .;
        segment_17213_bss_SIZE = ABSOLUTE(segment_17213_bss_END - segment_17213_bss_START);
    }
    segment_17213_VRAM_END = .;

    segment_172D60_ROM_START = __romPos;
    segment_172D60_VRAM = ADDR(.segment_172D60);
    .segment_172D60 : AT(segment_172D60_ROM_START)
    {
        segment_172D60_text_START = .;
        build/us/asm/segment_172D60.o(.text);
        segment_172D60_text_END = .;
        segment_172D60_text_SIZE = ABSOLUTE(segment_172D60_text_END - segment_172D60_text_START);
        segment_172D60_data_START = .;
        build/us/asm/segment_172D60.o(.data);
        segment_172D60_data_END = .;
        segment_172D60_data_SIZE = ABSOLUTE(segment_172D60_data_END - segment_172D60_data_START);
        segment_172D60_rodata_START = .;
        build/us/asm/segment_172D60.o(.rodata);
        segment_172D60_rodata_END = .;
        segment_172D60_rodata_SIZE = ABSOLUTE(segment_172D60_rodata_END - segment_172D60_rodata_START);
    }
    __romPos += SIZEOF(.segment_172D60);
    segment_172D60_ROM_END = __romPos;
    .segment_172D60 (NOLOAD) :
    {
        segment_172D60_bss_START = .;
        build/us/asm/segment_172D60.o(.sbss);
        build/us/asm/segment_172D60.o(.scommon);
        build/us/asm/segment_172D60.o(.bss);
        build/us/asm/segment_172D60.o(COMMON);
        segment_172D60_bss_END = .;
        segment_172D60_bss_SIZE = ABSOLUTE(segment_172D60_bss_END - segment_172D60_bss_START);
    }
    segment_172D60_VRAM_END = .;

    segment_1750C0_ROM_START = __romPos;
    segment_1750C0_VRAM = ADDR(.segment_1750C0);
    .segment_1750C0 : AT(segment_1750C0_ROM_START)
    {
        segment_1750C0_text_START = .;
        build/us/asm/segment_1750C0.o(.text);
        segment_1750C0_text_END = .;
        segment_1750C0_text_SIZE = ABSOLUTE(segment_1750C0_text_END - segment_1750C0_text_START);
        segment_1750C0_data_START = .;
        build/us/asm/segment_1750C0.o(.data);
        segment_1750C0_data_END = .;
        segment_1750C0_data_SIZE = ABSOLUTE(segment_1750C0_data_END - segment_1750C0_data_START);
        segment_1750C0_rodata_START = .;
        build/us/asm/segment_1750C0.o(.rodata);
        segment_1750C0_rodata_END = .;
        segment_1750C0_rodata_SIZE = ABSOLUTE(segment_1750C0_rodata_END - segment_1750C0_rodata_START);
    }
    __romPos += SIZEOF(.segment_1750C0);
    segment_1750C0_ROM_END = __romPos;
    .segment_1750C0 (NOLOAD) :
    {
        segment_1750C0_bss_START = .;
        build/us/asm/segment_1750C0.o(.sbss);
        build/us/asm/segment_1750C0.o(.scommon);
        build/us/asm/segment_1750C0.o(.bss);
        build/us/asm/segment_1750C0.o(COMMON);
        segment_1750C0_bss_END = .;
        segment_1750C0_bss_SIZE = ABSOLUTE(segment_1750C0_bss_END - segment_1750C0_bss_START);
    }
    segment_1750C0_VRAM_END = .;

    segment_177420_ROM_START = __romPos;
    segment_177420_VRAM = ADDR(.segment_177420);
    .segment_177420 : AT(segment_177420_ROM_START)
    {
        segment_177420_text_START = .;
        build/us/asm/segment_177420.o(.text);
        segment_177420_text_END = .;
        segment_177420_text_SIZE = ABSOLUTE(segment_177420_text_END - segment_177420_text_START);
        segment_177420_data_START = .;
        build/us/asm/segment_177420.o(.data);
        segment_177420_data_END = .;
        segment_177420_data_SIZE = ABSOLUTE(segment_177420_data_END - segment_177420_data_START);
        segment_177420_rodata_START = .;
        build/us/asm/segment_177420.o(.rodata);
        segment_177420_rodata_END = .;
        segment_177420_rodata_SIZE = ABSOLUTE(segment_177420_rodata_END - segment_177420_rodata_START);
    }
    __romPos += SIZEOF(.segment_177420);
    segment_177420_ROM_END = __romPos;
    .segment_177420 (NOLOAD) :
    {
        segment_177420_bss_START = .;
        build/us/asm/segment_177420.o(.sbss);
        build/us/asm/segment_177420.o(.scommon);
        build/us/asm/segment_177420.o(.bss);
        build/us/asm/segment_177420.o(COMMON);
        segment_177420_bss_END = .;
        segment_177420_bss_SIZE = ABSOLUTE(segment_177420_bss_END - segment_177420_bss_START);
    }
    segment_177420_VRAM_END = .;

    segment_179620_ROM_START = __romPos;
    segment_179620_VRAM = ADDR(.segment_179620);
    .segment_179620 : AT(segment_179620_ROM_START)
    {
        segment_179620_text_START = .;
        build/us/asm/segment_179620.o(.text);
        segment_179620_text_END = .;
        segment_179620_text_SIZE = ABSOLUTE(segment_179620_text_END - segment_179620_text_START);
        segment_179620_data_START = .;
        build/us/asm/segment_179620.o(.data);
        segment_179620_data_END = .;
        segment_179620_data_SIZE = ABSOLUTE(segment_179620_data_END - segment_179620_data_START);
        segment_179620_rodata_START = .;
        build/us/asm/segment_179620.o(.rodata);
        segment_179620_rodata_END = .;
        segment_179620_rodata_SIZE = ABSOLUTE(segment_179620_rodata_END - segment_179620_rodata_START);
    }
    __romPos += SIZEOF(.segment_179620);
    segment_179620_ROM_END = __romPos;
    .segment_179620 (NOLOAD) :
    {
        segment_179620_bss_START = .;
        build/us/asm/segment_179620.o(.sbss);
        build/us/asm/segment_179620.o(.scommon);
        build/us/asm/segment_179620.o(.bss);
        build/us/asm/segment_179620.o(COMMON);
        segment_179620_bss_END = .;
        segment_179620_bss_SIZE = ABSOLUTE(segment_179620_bss_END - segment_179620_bss_START);
    }
    segment_179620_VRAM_END = .;

    segment_17B790_ROM_START = __romPos;
    segment_17B790_VRAM = ADDR(.segment_17B790);
    .segment_17B790 : AT(segment_17B790_ROM_START)
    {
        segment_17B790_text_START = .;
        build/us/asm/segment_17B790.o(.text);
        segment_17B790_text_END = .;
        segment_17B790_text_SIZE = ABSOLUTE(segment_17B790_text_END - segment_17B790_text_START);
        segment_17B790_data_START = .;
        build/us/asm/segment_17B790.o(.data);
        segment_17B790_data_END = .;
        segment_17B790_data_SIZE = ABSOLUTE(segment_17B790_data_END - segment_17B790_data_START);
        segment_17B790_rodata_START = .;
        build/us/asm/segment_17B790.o(.rodata);
        segment_17B790_rodata_END = .;
        segment_17B790_rodata_SIZE = ABSOLUTE(segment_17B790_rodata_END - segment_17B790_rodata_START);
    }
    __romPos += SIZEOF(.segment_17B790);
    segment_17B790_ROM_END = __romPos;
    .segment_17B790 (NOLOAD) :
    {
        segment_17B790_bss_START = .;
        build/us/asm/segment_17B790.o(.sbss);
        build/us/asm/segment_17B790.o(.scommon);
        build/us/asm/segment_17B790.o(.bss);
        build/us/asm/segment_17B790.o(COMMON);
        segment_17B790_bss_END = .;
        segment_17B790_bss_SIZE = ABSOLUTE(segment_17B790_bss_END - segment_17B790_bss_START);
    }
    segment_17B790_VRAM_END = .;

    segment_17C1E0_ROM_START = __romPos;
    segment_17C1E0_VRAM = ADDR(.segment_17C1E0);
    .segment_17C1E0 : AT(segment_17C1E0_ROM_START)
    {
        segment_17C1E0_text_START = .;
        build/us/asm/segment_17C1E0.o(.text);
        segment_17C1E0_text_END = .;
        segment_17C1E0_text_SIZE = ABSOLUTE(segment_17C1E0_text_END - segment_17C1E0_text_START);
        segment_17C1E0_data_START = .;
        build/us/asm/segment_17C1E0.o(.data);
        segment_17C1E0_data_END = .;
        segment_17C1E0_data_SIZE = ABSOLUTE(segment_17C1E0_data_END - segment_17C1E0_data_START);
        segment_17C1E0_rodata_START = .;
        build/us/asm/segment_17C1E0.o(.rodata);
        segment_17C1E0_rodata_END = .;
        segment_17C1E0_rodata_SIZE = ABSOLUTE(segment_17C1E0_rodata_END - segment_17C1E0_rodata_START);
    }
    __romPos += SIZEOF(.segment_17C1E0);
    segment_17C1E0_ROM_END = __romPos;
    .segment_17C1E0 (NOLOAD) :
    {
        segment_17C1E0_bss_START = .;
        build/us/asm/segment_17C1E0.o(.sbss);
        build/us/asm/segment_17C1E0.o(.scommon);
        build/us/asm/segment_17C1E0.o(.bss);
        build/us/asm/segment_17C1E0.o(COMMON);
        segment_17C1E0_bss_END = .;
        segment_17C1E0_bss_SIZE = ABSOLUTE(segment_17C1E0_bss_END - segment_17C1E0_bss_START);
    }
    segment_17C1E0_VRAM_END = .;

    segment_17D130_ROM_START = __romPos;
    segment_17D130_VRAM = ADDR(.segment_17D130);
    .segment_17D130 : AT(segment_17D130_ROM_START)
    {
        segment_17D130_text_START = .;
        build/us/asm/segment_17D130.o(.text);
        segment_17D130_text_END = .;
        segment_17D130_text_SIZE = ABSOLUTE(segment_17D130_text_END - segment_17D130_text_START);
        segment_17D130_data_START = .;
        build/us/asm/segment_17D130.o(.data);
        segment_17D130_data_END = .;
        segment_17D130_data_SIZE = ABSOLUTE(segment_17D130_data_END - segment_17D130_data_START);
        segment_17D130_rodata_START = .;
        build/us/asm/segment_17D130.o(.rodata);
        segment_17D130_rodata_END = .;
        segment_17D130_rodata_SIZE = ABSOLUTE(segment_17D130_rodata_END - segment_17D130_rodata_START);
    }
    __romPos += SIZEOF(.segment_17D130);
    segment_17D130_ROM_END = __romPos;
    .segment_17D130 (NOLOAD) :
    {
        segment_17D130_bss_START = .;
        build/us/asm/segment_17D130.o(.sbss);
        build/us/asm/segment_17D130.o(.scommon);
        build/us/asm/segment_17D130.o(.bss);
        build/us/asm/segment_17D130.o(COMMON);
        segment_17D130_bss_END = .;
        segment_17D130_bss_SIZE = ABSOLUTE(segment_17D130_bss_END - segment_17D130_bss_START);
    }
    segment_17D130_VRAM_END = .;

    segment_17E090_ROM_START = __romPos;
    segment_17E090_VRAM = ADDR(.segment_17E090);
    .segment_17E090 : AT(segment_17E090_ROM_START)
    {
        segment_17E090_text_START = .;
        build/us/asm/segment_17E090.o(.text);
        segment_17E090_text_END = .;
        segment_17E090_text_SIZE = ABSOLUTE(segment_17E090_text_END - segment_17E090_text_START);
        segment_17E090_data_START = .;
        build/us/asm/segment_17E090.o(.data);
        segment_17E090_data_END = .;
        segment_17E090_data_SIZE = ABSOLUTE(segment_17E090_data_END - segment_17E090_data_START);
        segment_17E090_rodata_START = .;
        build/us/asm/segment_17E090.o(.rodata);
        segment_17E090_rodata_END = .;
        segment_17E090_rodata_SIZE = ABSOLUTE(segment_17E090_rodata_END - segment_17E090_rodata_START);
    }
    __romPos += SIZEOF(.segment_17E090);
    segment_17E090_ROM_END = __romPos;
    .segment_17E090 (NOLOAD) :
    {
        segment_17E090_bss_START = .;
        build/us/asm/segment_17E090.o(.sbss);
        build/us/asm/segment_17E090.o(.scommon);
        build/us/asm/segment_17E090.o(.bss);
        build/us/asm/segment_17E090.o(COMMON);
        segment_17E090_bss_END = .;
        segment_17E090_bss_SIZE = ABSOLUTE(segment_17E090_bss_END - segment_17E090_bss_START);
    }
    segment_17E090_VRAM_END = .;

    segment_181840_ROM_START = __romPos;
    segment_181840_VRAM = ADDR(.segment_181840);
    .segment_181840 : AT(segment_181840_ROM_START)
    {
        segment_181840_text_START = .;
        build/us/asm/segment_181840.o(.text);
        segment_181840_text_END = .;
        segment_181840_text_SIZE = ABSOLUTE(segment_181840_text_END - segment_181840_text_START);
        segment_181840_data_START = .;
        build/us/asm/segment_181840.o(.data);
        segment_181840_data_END = .;
        segment_181840_data_SIZE = ABSOLUTE(segment_181840_data_END - segment_181840_data_START);
        segment_181840_rodata_START = .;
        build/us/asm/segment_181840.o(.rodata);
        segment_181840_rodata_END = .;
        segment_181840_rodata_SIZE = ABSOLUTE(segment_181840_rodata_END - segment_181840_rodata_START);
    }
    __romPos += SIZEOF(.segment_181840);
    segment_181840_ROM_END = __romPos;
    .segment_181840 (NOLOAD) :
    {
        segment_181840_bss_START = .;
        build/us/asm/segment_181840.o(.sbss);
        build/us/asm/segment_181840.o(.scommon);
        build/us/asm/segment_181840.o(.bss);
        build/us/asm/segment_181840.o(COMMON);
        segment_181840_bss_END = .;
        segment_181840_bss_SIZE = ABSOLUTE(segment_181840_bss_END - segment_181840_bss_START);
    }
    segment_181840_VRAM_END = .;

    segment_184FF0_ROM_START = __romPos;
    segment_184FF0_VRAM = ADDR(.segment_184FF0);
    .segment_184FF0 : AT(segment_184FF0_ROM_START)
    {
        segment_184FF0_text_START = .;
        build/us/asm/segment_184FF0.o(.text);
        segment_184FF0_text_END = .;
        segment_184FF0_text_SIZE = ABSOLUTE(segment_184FF0_text_END - segment_184FF0_text_START);
        segment_184FF0_data_START = .;
        build/us/asm/segment_184FF0.o(.data);
        segment_184FF0_data_END = .;
        segment_184FF0_data_SIZE = ABSOLUTE(segment_184FF0_data_END - segment_184FF0_data_START);
        segment_184FF0_rodata_START = .;
        build/us/asm/segment_184FF0.o(.rodata);
        segment_184FF0_rodata_END = .;
        segment_184FF0_rodata_SIZE = ABSOLUTE(segment_184FF0_rodata_END - segment_184FF0_rodata_START);
    }
    __romPos += SIZEOF(.segment_184FF0);
    segment_184FF0_ROM_END = __romPos;
    .segment_184FF0 (NOLOAD) :
    {
        segment_184FF0_bss_START = .;
        build/us/asm/segment_184FF0.o(.sbss);
        build/us/asm/segment_184FF0.o(.scommon);
        build/us/asm/segment_184FF0.o(.bss);
        build/us/asm/segment_184FF0.o(COMMON);
        segment_184FF0_bss_END = .;
        segment_184FF0_bss_SIZE = ABSOLUTE(segment_184FF0_bss_END - segment_184FF0_bss_START);
    }
    segment_184FF0_VRAM_END = .;

    segment_186FF0_ROM_START = __romPos;
    segment_186FF0_VRAM = ADDR(.segment_186FF0);
    .segment_186FF0 : AT(segment_186FF0_ROM_START)
    {
        segment_186FF0_text_START = .;
        build/us/asm/segment_186FF0.o(.text);
        segment_186FF0_text_END = .;
        segment_186FF0_text_SIZE = ABSOLUTE(segment_186FF0_text_END - segment_186FF0_text_START);
        segment_186FF0_data_START = .;
        build/us/asm/segment_186FF0.o(.data);
        segment_186FF0_data_END = .;
        segment_186FF0_data_SIZE = ABSOLUTE(segment_186FF0_data_END - segment_186FF0_data_START);
        segment_186FF0_rodata_START = .;
        build/us/asm/segment_186FF0.o(.rodata);
        segment_186FF0_rodata_END = .;
        segment_186FF0_rodata_SIZE = ABSOLUTE(segment_186FF0_rodata_END - segment_186FF0_rodata_START);
    }
    __romPos += SIZEOF(.segment_186FF0);
    segment_186FF0_ROM_END = __romPos;
    .segment_186FF0 (NOLOAD) :
    {
        segment_186FF0_bss_START = .;
        build/us/asm/segment_186FF0.o(.sbss);
        build/us/asm/segment_186FF0.o(.scommon);
        build/us/asm/segment_186FF0.o(.bss);
        build/us/asm/segment_186FF0.o(COMMON);
        segment_186FF0_bss_END = .;
        segment_186FF0_bss_SIZE = ABSOLUTE(segment_186FF0_bss_END - segment_186FF0_bss_START);
    }
    segment_186FF0_VRAM_END = .;

    segment_188FF0_ROM_START = __romPos;
    segment_188FF0_VRAM = ADDR(.segment_188FF0);
    .segment_188FF0 : AT(segment_188FF0_ROM_START)
    {
        segment_188FF0_text_START = .;
        build/us/asm/segment_188FF0.o(.text);
        segment_188FF0_text_END = .;
        segment_188FF0_text_SIZE = ABSOLUTE(segment_188FF0_text_END - segment_188FF0_text_START);
        segment_188FF0_data_START = .;
        build/us/asm/segment_188FF0.o(.data);
        segment_188FF0_data_END = .;
        segment_188FF0_data_SIZE = ABSOLUTE(segment_188FF0_data_END - segment_188FF0_data_START);
        segment_188FF0_rodata_START = .;
        build/us/asm/segment_188FF0.o(.rodata);
        segment_188FF0_rodata_END = .;
        segment_188FF0_rodata_SIZE = ABSOLUTE(segment_188FF0_rodata_END - segment_188FF0_rodata_START);
    }
    __romPos += SIZEOF(.segment_188FF0);
    segment_188FF0_ROM_END = __romPos;
    .segment_188FF0 (NOLOAD) :
    {
        segment_188FF0_bss_START = .;
        build/us/asm/segment_188FF0.o(.sbss);
        build/us/asm/segment_188FF0.o(.scommon);
        build/us/asm/segment_188FF0.o(.bss);
        build/us/asm/segment_188FF0.o(COMMON);
        segment_188FF0_bss_END = .;
        segment_188FF0_bss_SIZE = ABSOLUTE(segment_188FF0_bss_END - segment_188FF0_bss_START);
    }
    segment_188FF0_VRAM_END = .;

    segment_189D40_ROM_START = __romPos;
    segment_189D40_VRAM = ADDR(.segment_189D40);
    .segment_189D40 : AT(segment_189D40_ROM_START)
    {
        segment_189D40_text_START = .;
        build/us/asm/segment_189D40.o(.text);
        segment_189D40_text_END = .;
        segment_189D40_text_SIZE = ABSOLUTE(segment_189D40_text_END - segment_189D40_text_START);
        segment_189D40_data_START = .;
        build/us/asm/segment_189D40.o(.data);
        segment_189D40_data_END = .;
        segment_189D40_data_SIZE = ABSOLUTE(segment_189D40_data_END - segment_189D40_data_START);
        segment_189D40_rodata_START = .;
        build/us/asm/segment_189D40.o(.rodata);
        segment_189D40_rodata_END = .;
        segment_189D40_rodata_SIZE = ABSOLUTE(segment_189D40_rodata_END - segment_189D40_rodata_START);
    }
    __romPos += SIZEOF(.segment_189D40);
    segment_189D40_ROM_END = __romPos;
    .segment_189D40 (NOLOAD) :
    {
        segment_189D40_bss_START = .;
        build/us/asm/segment_189D40.o(.sbss);
        build/us/asm/segment_189D40.o(.scommon);
        build/us/asm/segment_189D40.o(.bss);
        build/us/asm/segment_189D40.o(COMMON);
        segment_189D40_bss_END = .;
        segment_189D40_bss_SIZE = ABSOLUTE(segment_189D40_bss_END - segment_189D40_bss_START);
    }
    segment_189D40_VRAM_END = .;

    segment_18CB40_ROM_START = __romPos;
    segment_18CB40_VRAM = ADDR(.segment_18CB40);
    .segment_18CB40 : AT(segment_18CB40_ROM_START)
    {
        segment_18CB40_text_START = .;
        build/us/asm/segment_18CB40.o(.text);
        segment_18CB40_text_END = .;
        segment_18CB40_text_SIZE = ABSOLUTE(segment_18CB40_text_END - segment_18CB40_text_START);
        segment_18CB40_data_START = .;
        build/us/asm/segment_18CB40.o(.data);
        segment_18CB40_data_END = .;
        segment_18CB40_data_SIZE = ABSOLUTE(segment_18CB40_data_END - segment_18CB40_data_START);
        segment_18CB40_rodata_START = .;
        build/us/asm/segment_18CB40.o(.rodata);
        segment_18CB40_rodata_END = .;
        segment_18CB40_rodata_SIZE = ABSOLUTE(segment_18CB40_rodata_END - segment_18CB40_rodata_START);
    }
    __romPos += SIZEOF(.segment_18CB40);
    segment_18CB40_ROM_END = __romPos;
    .segment_18CB40 (NOLOAD) :
    {
        segment_18CB40_bss_START = .;
        build/us/asm/segment_18CB40.o(.sbss);
        build/us/asm/segment_18CB40.o(.scommon);
        build/us/asm/segment_18CB40.o(.bss);
        build/us/asm/segment_18CB40.o(COMMON);
        segment_18CB40_bss_END = .;
        segment_18CB40_bss_SIZE = ABSOLUTE(segment_18CB40_bss_END - segment_18CB40_bss_START);
    }
    segment_18CB40_VRAM_END = .;

    segment_18DB90_ROM_START = __romPos;
    segment_18DB90_VRAM = ADDR(.segment_18DB90);
    .segment_18DB90 : AT(segment_18DB90_ROM_START)
    {
        segment_18DB90_text_START = .;
        build/us/asm/segment_18DB90.o(.text);
        segment_18DB90_text_END = .;
        segment_18DB90_text_SIZE = ABSOLUTE(segment_18DB90_text_END - segment_18DB90_text_START);
        segment_18DB90_data_START = .;
        build/us/asm/segment_18DB90.o(.data);
        segment_18DB90_data_END = .;
        segment_18DB90_data_SIZE = ABSOLUTE(segment_18DB90_data_END - segment_18DB90_data_START);
        segment_18DB90_rodata_START = .;
        build/us/asm/segment_18DB90.o(.rodata);
        segment_18DB90_rodata_END = .;
        segment_18DB90_rodata_SIZE = ABSOLUTE(segment_18DB90_rodata_END - segment_18DB90_rodata_START);
    }
    __romPos += SIZEOF(.segment_18DB90);
    segment_18DB90_ROM_END = __romPos;
    .segment_18DB90 (NOLOAD) :
    {
        segment_18DB90_bss_START = .;
        build/us/asm/segment_18DB90.o(.sbss);
        build/us/asm/segment_18DB90.o(.scommon);
        build/us/asm/segment_18DB90.o(.bss);
        build/us/asm/segment_18DB90.o(COMMON);
        segment_18DB90_bss_END = .;
        segment_18DB90_bss_SIZE = ABSOLUTE(segment_18DB90_bss_END - segment_18DB90_bss_START);
    }
    segment_18DB90_VRAM_END = .;

    segment_18F160_ROM_START = __romPos;
    segment_18F160_VRAM = ADDR(.segment_18F160);
    .segment_18F160 : AT(segment_18F160_ROM_START)
    {
        segment_18F160_text_START = .;
        build/us/asm/segment_18F160.o(.text);
        segment_18F160_text_END = .;
        segment_18F160_text_SIZE = ABSOLUTE(segment_18F160_text_END - segment_18F160_text_START);
        segment_18F160_data_START = .;
        build/us/asm/segment_18F160.o(.data);
        segment_18F160_data_END = .;
        segment_18F160_data_SIZE = ABSOLUTE(segment_18F160_data_END - segment_18F160_data_START);
        segment_18F160_rodata_START = .;
        build/us/asm/segment_18F160.o(.rodata);
        segment_18F160_rodata_END = .;
        segment_18F160_rodata_SIZE = ABSOLUTE(segment_18F160_rodata_END - segment_18F160_rodata_START);
    }
    __romPos += SIZEOF(.segment_18F160);
    segment_18F160_ROM_END = __romPos;
    .segment_18F160 (NOLOAD) :
    {
        segment_18F160_bss_START = .;
        build/us/asm/segment_18F160.o(.sbss);
        build/us/asm/segment_18F160.o(.scommon);
        build/us/asm/segment_18F160.o(.bss);
        build/us/asm/segment_18F160.o(COMMON);
        segment_18F160_bss_END = .;
        segment_18F160_bss_SIZE = ABSOLUTE(segment_18F160_bss_END - segment_18F160_bss_START);
    }
    segment_18F160_VRAM_END = .;

    segment_1906E0_ROM_START = __romPos;
    segment_1906E0_VRAM = ADDR(.segment_1906E0);
    .segment_1906E0 : AT(segment_1906E0_ROM_START)
    {
        segment_1906E0_text_START = .;
        build/us/asm/segment_1906E0.o(.text);
        segment_1906E0_text_END = .;
        segment_1906E0_text_SIZE = ABSOLUTE(segment_1906E0_text_END - segment_1906E0_text_START);
        segment_1906E0_data_START = .;
        build/us/asm/segment_1906E0.o(.data);
        segment_1906E0_data_END = .;
        segment_1906E0_data_SIZE = ABSOLUTE(segment_1906E0_data_END - segment_1906E0_data_START);
        segment_1906E0_rodata_START = .;
        build/us/asm/segment_1906E0.o(.rodata);
        segment_1906E0_rodata_END = .;
        segment_1906E0_rodata_SIZE = ABSOLUTE(segment_1906E0_rodata_END - segment_1906E0_rodata_START);
    }
    __romPos += SIZEOF(.segment_1906E0);
    segment_1906E0_ROM_END = __romPos;
    .segment_1906E0 (NOLOAD) :
    {
        segment_1906E0_bss_START = .;
        build/us/asm/segment_1906E0.o(.sbss);
        build/us/asm/segment_1906E0.o(.scommon);
        build/us/asm/segment_1906E0.o(.bss);
        build/us/asm/segment_1906E0.o(COMMON);
        segment_1906E0_bss_END = .;
        segment_1906E0_bss_SIZE = ABSOLUTE(segment_1906E0_bss_END - segment_1906E0_bss_START);
    }
    segment_1906E0_VRAM_END = .;

    segment_1911D0_ROM_START = __romPos;
    segment_1911D0_VRAM = ADDR(.segment_1911D0);
    .segment_1911D0 : AT(segment_1911D0_ROM_START)
    {
        segment_1911D0_text_START = .;
        build/us/asm/segment_1911D0.o(.text);
        segment_1911D0_text_END = .;
        segment_1911D0_text_SIZE = ABSOLUTE(segment_1911D0_text_END - segment_1911D0_text_START);
        segment_1911D0_data_START = .;
        build/us/asm/segment_1911D0.o(.data);
        segment_1911D0_data_END = .;
        segment_1911D0_data_SIZE = ABSOLUTE(segment_1911D0_data_END - segment_1911D0_data_START);
        segment_1911D0_rodata_START = .;
        build/us/asm/segment_1911D0.o(.rodata);
        segment_1911D0_rodata_END = .;
        segment_1911D0_rodata_SIZE = ABSOLUTE(segment_1911D0_rodata_END - segment_1911D0_rodata_START);
    }
    __romPos += SIZEOF(.segment_1911D0);
    segment_1911D0_ROM_END = __romPos;
    .segment_1911D0 (NOLOAD) :
    {
        segment_1911D0_bss_START = .;
        build/us/asm/segment_1911D0.o(.sbss);
        build/us/asm/segment_1911D0.o(.scommon);
        build/us/asm/segment_1911D0.o(.bss);
        build/us/asm/segment_1911D0.o(COMMON);
        segment_1911D0_bss_END = .;
        segment_1911D0_bss_SIZE = ABSOLUTE(segment_1911D0_bss_END - segment_1911D0_bss_START);
    }
    segment_1911D0_VRAM_END = .;

    segment_1936C0_ROM_START = __romPos;
    segment_1936C0_VRAM = ADDR(.segment_1936C0);
    .segment_1936C0 : AT(segment_1936C0_ROM_START)
    {
        segment_1936C0_text_START = .;
        build/us/asm/segment_1936C0.o(.text);
        segment_1936C0_text_END = .;
        segment_1936C0_text_SIZE = ABSOLUTE(segment_1936C0_text_END - segment_1936C0_text_START);
        segment_1936C0_data_START = .;
        build/us/asm/segment_1936C0.o(.data);
        segment_1936C0_data_END = .;
        segment_1936C0_data_SIZE = ABSOLUTE(segment_1936C0_data_END - segment_1936C0_data_START);
        segment_1936C0_rodata_START = .;
        build/us/asm/segment_1936C0.o(.rodata);
        segment_1936C0_rodata_END = .;
        segment_1936C0_rodata_SIZE = ABSOLUTE(segment_1936C0_rodata_END - segment_1936C0_rodata_START);
    }
    __romPos += SIZEOF(.segment_1936C0);
    segment_1936C0_ROM_END = __romPos;
    .segment_1936C0 (NOLOAD) :
    {
        segment_1936C0_bss_START = .;
        build/us/asm/segment_1936C0.o(.sbss);
        build/us/asm/segment_1936C0.o(.scommon);
        build/us/asm/segment_1936C0.o(.bss);
        build/us/asm/segment_1936C0.o(COMMON);
        segment_1936C0_bss_END = .;
        segment_1936C0_bss_SIZE = ABSOLUTE(segment_1936C0_bss_END - segment_1936C0_bss_START);
    }
    segment_1936C0_VRAM_END = .;

    segment_1937F0_ROM_START = __romPos;
    segment_1937F0_VRAM = ADDR(.segment_1937F0);
    .segment_1937F0 : AT(segment_1937F0_ROM_START)
    {
        segment_1937F0_text_START = .;
        build/us/asm/segment_1937F0.o(.text);
        segment_1937F0_text_END = .;
        segment_1937F0_text_SIZE = ABSOLUTE(segment_1937F0_text_END - segment_1937F0_text_START);
        segment_1937F0_data_START = .;
        build/us/asm/segment_1937F0.o(.data);
        segment_1937F0_data_END = .;
        segment_1937F0_data_SIZE = ABSOLUTE(segment_1937F0_data_END - segment_1937F0_data_START);
        segment_1937F0_rodata_START = .;
        build/us/asm/segment_1937F0.o(.rodata);
        segment_1937F0_rodata_END = .;
        segment_1937F0_rodata_SIZE = ABSOLUTE(segment_1937F0_rodata_END - segment_1937F0_rodata_START);
    }
    __romPos += SIZEOF(.segment_1937F0);
    segment_1937F0_ROM_END = __romPos;
    .segment_1937F0 (NOLOAD) :
    {
        segment_1937F0_bss_START = .;
        build/us/asm/segment_1937F0.o(.sbss);
        build/us/asm/segment_1937F0.o(.scommon);
        build/us/asm/segment_1937F0.o(.bss);
        build/us/asm/segment_1937F0.o(COMMON);
        segment_1937F0_bss_END = .;
        segment_1937F0_bss_SIZE = ABSOLUTE(segment_1937F0_bss_END - segment_1937F0_bss_START);
    }
    segment_1937F0_VRAM_END = .;

    segment_194070_ROM_START = __romPos;
    segment_194070_VRAM = ADDR(.segment_194070);
    .segment_194070 : AT(segment_194070_ROM_START)
    {
        segment_194070_text_START = .;
        build/us/asm/segment_194070.o(.text);
        segment_194070_text_END = .;
        segment_194070_text_SIZE = ABSOLUTE(segment_194070_text_END - segment_194070_text_START);
        segment_194070_data_START = .;
        build/us/asm/segment_194070.o(.data);
        segment_194070_data_END = .;
        segment_194070_data_SIZE = ABSOLUTE(segment_194070_data_END - segment_194070_data_START);
        segment_194070_rodata_START = .;
        build/us/asm/segment_194070.o(.rodata);
        segment_194070_rodata_END = .;
        segment_194070_rodata_SIZE = ABSOLUTE(segment_194070_rodata_END - segment_194070_rodata_START);
    }
    __romPos += SIZEOF(.segment_194070);
    segment_194070_ROM_END = __romPos;
    .segment_194070 (NOLOAD) :
    {
        segment_194070_bss_START = .;
        build/us/asm/segment_194070.o(.sbss);
        build/us/asm/segment_194070.o(.scommon);
        build/us/asm/segment_194070.o(.bss);
        build/us/asm/segment_194070.o(COMMON);
        segment_194070_bss_END = .;
        segment_194070_bss_SIZE = ABSOLUTE(segment_194070_bss_END - segment_194070_bss_START);
    }
    segment_194070_VRAM_END = .;

    segment_194150_ROM_START = __romPos;
    segment_194150_VRAM = ADDR(.segment_194150);
    .segment_194150 : AT(segment_194150_ROM_START)
    {
        segment_194150_text_START = .;
        build/us/asm/segment_194150.o(.text);
        segment_194150_text_END = .;
        segment_194150_text_SIZE = ABSOLUTE(segment_194150_text_END - segment_194150_text_START);
        segment_194150_data_START = .;
        build/us/asm/segment_194150.o(.data);
        segment_194150_data_END = .;
        segment_194150_data_SIZE = ABSOLUTE(segment_194150_data_END - segment_194150_data_START);
        segment_194150_rodata_START = .;
        build/us/asm/segment_194150.o(.rodata);
        segment_194150_rodata_END = .;
        segment_194150_rodata_SIZE = ABSOLUTE(segment_194150_rodata_END - segment_194150_rodata_START);
    }
    __romPos += SIZEOF(.segment_194150);
    segment_194150_ROM_END = __romPos;
    .segment_194150 (NOLOAD) :
    {
        segment_194150_bss_START = .;
        build/us/asm/segment_194150.o(.sbss);
        build/us/asm/segment_194150.o(.scommon);
        build/us/asm/segment_194150.o(.bss);
        build/us/asm/segment_194150.o(COMMON);
        segment_194150_bss_END = .;
        segment_194150_bss_SIZE = ABSOLUTE(segment_194150_bss_END - segment_194150_bss_START);
    }
    segment_194150_VRAM_END = .;

    segment_194910_ROM_START = __romPos;
    segment_194910_VRAM = ADDR(.segment_194910);
    .segment_194910 : AT(segment_194910_ROM_START)
    {
        segment_194910_text_START = .;
        build/us/asm/segment_194910.o(.text);
        segment_194910_text_END = .;
        segment_194910_text_SIZE = ABSOLUTE(segment_194910_text_END - segment_194910_text_START);
        segment_194910_data_START = .;
        build/us/asm/segment_194910.o(.data);
        segment_194910_data_END = .;
        segment_194910_data_SIZE = ABSOLUTE(segment_194910_data_END - segment_194910_data_START);
        segment_194910_rodata_START = .;
        build/us/asm/segment_194910.o(.rodata);
        segment_194910_rodata_END = .;
        segment_194910_rodata_SIZE = ABSOLUTE(segment_194910_rodata_END - segment_194910_rodata_START);
    }
    __romPos += SIZEOF(.segment_194910);
    segment_194910_ROM_END = __romPos;
    .segment_194910 (NOLOAD) :
    {
        segment_194910_bss_START = .;
        build/us/asm/segment_194910.o(.sbss);
        build/us/asm/segment_194910.o(.scommon);
        build/us/asm/segment_194910.o(.bss);
        build/us/asm/segment_194910.o(COMMON);
        segment_194910_bss_END = .;
        segment_194910_bss_SIZE = ABSOLUTE(segment_194910_bss_END - segment_194910_bss_START);
    }
    segment_194910_VRAM_END = .;

    segment_195290_ROM_START = __romPos;
    segment_195290_VRAM = ADDR(.segment_195290);
    .segment_195290 : AT(segment_195290_ROM_START)
    {
        segment_195290_text_START = .;
        build/us/asm/segment_195290.o(.text);
        segment_195290_text_END = .;
        segment_195290_text_SIZE = ABSOLUTE(segment_195290_text_END - segment_195290_text_START);
        segment_195290_data_START = .;
        build/us/asm/segment_195290.o(.data);
        segment_195290_data_END = .;
        segment_195290_data_SIZE = ABSOLUTE(segment_195290_data_END - segment_195290_data_START);
        segment_195290_rodata_START = .;
        build/us/asm/segment_195290.o(.rodata);
        segment_195290_rodata_END = .;
        segment_195290_rodata_SIZE = ABSOLUTE(segment_195290_rodata_END - segment_195290_rodata_START);
    }
    __romPos += SIZEOF(.segment_195290);
    segment_195290_ROM_END = __romPos;
    .segment_195290 (NOLOAD) :
    {
        segment_195290_bss_START = .;
        build/us/asm/segment_195290.o(.sbss);
        build/us/asm/segment_195290.o(.scommon);
        build/us/asm/segment_195290.o(.bss);
        build/us/asm/segment_195290.o(COMMON);
        segment_195290_bss_END = .;
        segment_195290_bss_SIZE = ABSOLUTE(segment_195290_bss_END - segment_195290_bss_START);
    }
    segment_195290_VRAM_END = .;

    segment_game_etc_ROM_START = __romPos;
    segment_game_etc_VRAM = ADDR(.segment_game_etc);
    .segment_game_etc : AT(segment_game_etc_ROM_START)
    {
        segment_game_etc_text_START = .;
        build/us/asm/segment_game_etc.o(.text);
        segment_game_etc_text_END = .;
        segment_game_etc_text_SIZE = ABSOLUTE(segment_game_etc_text_END - segment_game_etc_text_START);
        segment_game_etc_data_START = .;
        build/us/asm/segment_game_etc.o(.data);
        segment_game_etc_data_END = .;
        segment_game_etc_data_SIZE = ABSOLUTE(segment_game_etc_data_END - segment_game_etc_data_START);
        segment_game_etc_rodata_START = .;
        build/us/asm/segment_game_etc.o(.rodata);
        segment_game_etc_rodata_END = .;
        segment_game_etc_rodata_SIZE = ABSOLUTE(segment_game_etc_rodata_END - segment_game_etc_rodata_START);
    }
    __romPos += SIZEOF(.segment_game_etc);
    segment_game_etc_ROM_END = __romPos;
    .segment_game_etc (NOLOAD) :
    {
        segment_game_etc_bss_START = .;
        build/us/asm/segment_game_etc.o(.sbss);
        build/us/asm/segment_game_etc.o(.scommon);
        build/us/asm/segment_game_etc.o(.bss);
        build/us/asm/segment_game_etc.o(COMMON);
        segment_game_etc_bss_END = .;
        segment_game_etc_bss_SIZE = ABSOLUTE(segment_game_etc_bss_END - segment_game_etc_bss_START);
    }
    segment_game_etc_VRAM_END = .;

    segment_menu_bg_ROM_START = __romPos;
    segment_menu_bg_VRAM = ADDR(.segment_menu_bg);
    .segment_menu_bg : AT(segment_menu_bg_ROM_START)
    {
        segment_menu_bg_text_START = .;
        build/us/asm/segment_menu_bg.o(.text);
        segment_menu_bg_text_END = .;
        segment_menu_bg_text_SIZE = ABSOLUTE(segment_menu_bg_text_END - segment_menu_bg_text_START);
        segment_menu_bg_data_START = .;
        build/us/asm/segment_menu_bg.o(.data);
        segment_menu_bg_data_END = .;
        segment_menu_bg_data_SIZE = ABSOLUTE(segment_menu_bg_data_END - segment_menu_bg_data_START);
        segment_menu_bg_rodata_START = .;
        build/us/asm/segment_menu_bg.o(.rodata);
        segment_menu_bg_rodata_END = .;
        segment_menu_bg_rodata_SIZE = ABSOLUTE(segment_menu_bg_rodata_END - segment_menu_bg_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_bg);
    segment_menu_bg_ROM_END = __romPos;
    .segment_menu_bg (NOLOAD) :
    {
        segment_menu_bg_bss_START = .;
        build/us/asm/segment_menu_bg.o(.sbss);
        build/us/asm/segment_menu_bg.o(.scommon);
        build/us/asm/segment_menu_bg.o(.bss);
        build/us/asm/segment_menu_bg.o(COMMON);
        segment_menu_bg_bss_END = .;
        segment_menu_bg_bss_SIZE = ABSOLUTE(segment_menu_bg_bss_END - segment_menu_bg_bss_START);
    }
    segment_menu_bg_VRAM_END = .;

    segment_menu_bg2_ROM_START = __romPos;
    segment_menu_bg2_VRAM = ADDR(.segment_menu_bg2);
    .segment_menu_bg2 : AT(segment_menu_bg2_ROM_START)
    {
        segment_menu_bg2_text_START = .;
        build/us/asm/segment_menu_bg2.o(.text);
        segment_menu_bg2_text_END = .;
        segment_menu_bg2_text_SIZE = ABSOLUTE(segment_menu_bg2_text_END - segment_menu_bg2_text_START);
        segment_menu_bg2_data_START = .;
        build/us/asm/segment_menu_bg2.o(.data);
        segment_menu_bg2_data_END = .;
        segment_menu_bg2_data_SIZE = ABSOLUTE(segment_menu_bg2_data_END - segment_menu_bg2_data_START);
        segment_menu_bg2_rodata_START = .;
        build/us/asm/segment_menu_bg2.o(.rodata);
        segment_menu_bg2_rodata_END = .;
        segment_menu_bg2_rodata_SIZE = ABSOLUTE(segment_menu_bg2_rodata_END - segment_menu_bg2_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_bg2);
    segment_menu_bg2_ROM_END = __romPos;
    .segment_menu_bg2 (NOLOAD) :
    {
        segment_menu_bg2_bss_START = .;
        build/us/asm/segment_menu_bg2.o(.sbss);
        build/us/asm/segment_menu_bg2.o(.scommon);
        build/us/asm/segment_menu_bg2.o(.bss);
        build/us/asm/segment_menu_bg2.o(COMMON);
        segment_menu_bg2_bss_END = .;
        segment_menu_bg2_bss_SIZE = ABSOLUTE(segment_menu_bg2_bss_END - segment_menu_bg2_bss_START);
    }
    segment_menu_bg2_VRAM_END = .;

    segment_coffee01_ROM_START = __romPos;
    segment_coffee01_VRAM = ADDR(.segment_coffee01);
    .segment_coffee01 : AT(segment_coffee01_ROM_START)
    {
        segment_coffee01_text_START = .;
        build/us/asm/segment_coffee01.o(.text);
        segment_coffee01_text_END = .;
        segment_coffee01_text_SIZE = ABSOLUTE(segment_coffee01_text_END - segment_coffee01_text_START);
        segment_coffee01_data_START = .;
        build/us/asm/segment_coffee01.o(.data);
        segment_coffee01_data_END = .;
        segment_coffee01_data_SIZE = ABSOLUTE(segment_coffee01_data_END - segment_coffee01_data_START);
        segment_coffee01_rodata_START = .;
        build/us/asm/segment_coffee01.o(.rodata);
        segment_coffee01_rodata_END = .;
        segment_coffee01_rodata_SIZE = ABSOLUTE(segment_coffee01_rodata_END - segment_coffee01_rodata_START);
    }
    __romPos += SIZEOF(.segment_coffee01);
    segment_coffee01_ROM_END = __romPos;
    .segment_coffee01 (NOLOAD) :
    {
        segment_coffee01_bss_START = .;
        build/us/asm/segment_coffee01.o(.sbss);
        build/us/asm/segment_coffee01.o(.scommon);
        build/us/asm/segment_coffee01.o(.bss);
        build/us/asm/segment_coffee01.o(COMMON);
        segment_coffee01_bss_END = .;
        segment_coffee01_bss_SIZE = ABSOLUTE(segment_coffee01_bss_END - segment_coffee01_bss_START);
    }
    segment_coffee01_VRAM_END = .;

    segment_title_all_ROM_START = __romPos;
    segment_title_all_VRAM = ADDR(.segment_title_all);
    .segment_title_all : AT(segment_title_all_ROM_START)
    {
        segment_title_all_text_START = .;
        build/us/asm/segment_title_all.o(.text);
        segment_title_all_text_END = .;
        segment_title_all_text_SIZE = ABSOLUTE(segment_title_all_text_END - segment_title_all_text_START);
        segment_title_all_data_START = .;
        build/us/asm/segment_title_all.o(.data);
        segment_title_all_data_END = .;
        segment_title_all_data_SIZE = ABSOLUTE(segment_title_all_data_END - segment_title_all_data_START);
        segment_title_all_rodata_START = .;
        build/us/asm/segment_title_all.o(.rodata);
        segment_title_all_rodata_END = .;
        segment_title_all_rodata_SIZE = ABSOLUTE(segment_title_all_rodata_END - segment_title_all_rodata_START);
    }
    __romPos += SIZEOF(.segment_title_all);
    segment_title_all_ROM_END = __romPos;
    .segment_title_all (NOLOAD) :
    {
        segment_title_all_bss_START = .;
        build/us/asm/segment_title_all.o(.sbss);
        build/us/asm/segment_title_all.o(.scommon);
        build/us/asm/segment_title_all.o(.bss);
        build/us/asm/segment_title_all.o(COMMON);
        segment_title_all_bss_END = .;
        segment_title_all_bss_SIZE = ABSOLUTE(segment_title_all_bss_END - segment_title_all_bss_START);
    }
    segment_title_all_VRAM_END = .;

    segment_title_bmp_ROM_START = __romPos;
    segment_title_bmp_VRAM = ADDR(.segment_title_bmp);
    .segment_title_bmp : AT(segment_title_bmp_ROM_START)
    {
        segment_title_bmp_text_START = .;
        build/us/asm/segment_title_bmp.o(.text);
        segment_title_bmp_text_END = .;
        segment_title_bmp_text_SIZE = ABSOLUTE(segment_title_bmp_text_END - segment_title_bmp_text_START);
        segment_title_bmp_data_START = .;
        build/us/asm/segment_title_bmp.o(.data);
        segment_title_bmp_data_END = .;
        segment_title_bmp_data_SIZE = ABSOLUTE(segment_title_bmp_data_END - segment_title_bmp_data_START);
        segment_title_bmp_rodata_START = .;
        build/us/asm/segment_title_bmp.o(.rodata);
        segment_title_bmp_rodata_END = .;
        segment_title_bmp_rodata_SIZE = ABSOLUTE(segment_title_bmp_rodata_END - segment_title_bmp_rodata_START);
    }
    __romPos += SIZEOF(.segment_title_bmp);
    segment_title_bmp_ROM_END = __romPos;
    .segment_title_bmp (NOLOAD) :
    {
        segment_title_bmp_bss_START = .;
        build/us/asm/segment_title_bmp.o(.sbss);
        build/us/asm/segment_title_bmp.o(.scommon);
        build/us/asm/segment_title_bmp.o(.bss);
        build/us/asm/segment_title_bmp.o(COMMON);
        segment_title_bmp_bss_END = .;
        segment_title_bmp_bss_SIZE = ABSOLUTE(segment_title_bmp_bss_END - segment_title_bmp_bss_START);
    }
    segment_title_bmp_VRAM_END = .;

    segment_waku_ROM_START = __romPos;
    segment_waku_VRAM = ADDR(.segment_waku);
    .segment_waku : AT(segment_waku_ROM_START)
    {
        segment_waku_text_START = .;
        build/us/asm/segment_waku.o(.text);
        segment_waku_text_END = .;
        segment_waku_text_SIZE = ABSOLUTE(segment_waku_text_END - segment_waku_text_START);
        segment_waku_data_START = .;
        build/us/asm/segment_waku.o(.data);
        segment_waku_data_END = .;
        segment_waku_data_SIZE = ABSOLUTE(segment_waku_data_END - segment_waku_data_START);
        segment_waku_rodata_START = .;
        build/us/asm/segment_waku.o(.rodata);
        segment_waku_rodata_END = .;
        segment_waku_rodata_SIZE = ABSOLUTE(segment_waku_rodata_END - segment_waku_rodata_START);
    }
    __romPos += SIZEOF(.segment_waku);
    segment_waku_ROM_END = __romPos;
    .segment_waku (NOLOAD) :
    {
        segment_waku_bss_START = .;
        build/us/asm/segment_waku.o(.sbss);
        build/us/asm/segment_waku.o(.scommon);
        build/us/asm/segment_waku.o(.bss);
        build/us/asm/segment_waku.o(COMMON);
        segment_waku_bss_END = .;
        segment_waku_bss_SIZE = ABSOLUTE(segment_waku_bss_END - segment_waku_bss_START);
    }
    segment_waku_VRAM_END = .;

    segment_waku2_ROM_START = __romPos;
    segment_waku2_VRAM = ADDR(.segment_waku2);
    .segment_waku2 : AT(segment_waku2_ROM_START)
    {
        segment_waku2_text_START = .;
        build/us/asm/segment_waku2.o(.text);
        segment_waku2_text_END = .;
        segment_waku2_text_SIZE = ABSOLUTE(segment_waku2_text_END - segment_waku2_text_START);
        segment_waku2_data_START = .;
        build/us/asm/segment_waku2.o(.data);
        segment_waku2_data_END = .;
        segment_waku2_data_SIZE = ABSOLUTE(segment_waku2_data_END - segment_waku2_data_START);
        segment_waku2_rodata_START = .;
        build/us/asm/segment_waku2.o(.rodata);
        segment_waku2_rodata_END = .;
        segment_waku2_rodata_SIZE = ABSOLUTE(segment_waku2_rodata_END - segment_waku2_rodata_START);
    }
    __romPos += SIZEOF(.segment_waku2);
    segment_waku2_ROM_END = __romPos;
    .segment_waku2 (NOLOAD) :
    {
        segment_waku2_bss_START = .;
        build/us/asm/segment_waku2.o(.sbss);
        build/us/asm/segment_waku2.o(.scommon);
        build/us/asm/segment_waku2.o(.bss);
        build/us/asm/segment_waku2.o(COMMON);
        segment_waku2_bss_END = .;
        segment_waku2_bss_SIZE = ABSOLUTE(segment_waku2_bss_END - segment_waku2_bss_START);
    }
    segment_waku2_VRAM_END = .;

    segment_story_bg01_ROM_START = __romPos;
    segment_story_bg01_VRAM = ADDR(.segment_story_bg01);
    .segment_story_bg01 : AT(segment_story_bg01_ROM_START)
    {
        segment_story_bg01_text_START = .;
        build/us/asm/segment_story_bg01.o(.text);
        segment_story_bg01_text_END = .;
        segment_story_bg01_text_SIZE = ABSOLUTE(segment_story_bg01_text_END - segment_story_bg01_text_START);
        segment_story_bg01_data_START = .;
        build/us/asm/segment_story_bg01.o(.data);
        segment_story_bg01_data_END = .;
        segment_story_bg01_data_SIZE = ABSOLUTE(segment_story_bg01_data_END - segment_story_bg01_data_START);
        segment_story_bg01_rodata_START = .;
        build/us/asm/segment_story_bg01.o(.rodata);
        segment_story_bg01_rodata_END = .;
        segment_story_bg01_rodata_SIZE = ABSOLUTE(segment_story_bg01_rodata_END - segment_story_bg01_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg01);
    segment_story_bg01_ROM_END = __romPos;
    .segment_story_bg01 (NOLOAD) :
    {
        segment_story_bg01_bss_START = .;
        build/us/asm/segment_story_bg01.o(.sbss);
        build/us/asm/segment_story_bg01.o(.scommon);
        build/us/asm/segment_story_bg01.o(.bss);
        build/us/asm/segment_story_bg01.o(COMMON);
        segment_story_bg01_bss_END = .;
        segment_story_bg01_bss_SIZE = ABSOLUTE(segment_story_bg01_bss_END - segment_story_bg01_bss_START);
    }
    segment_story_bg01_VRAM_END = .;

    segment_story_bg02_ROM_START = __romPos;
    segment_story_bg02_VRAM = ADDR(.segment_story_bg02);
    .segment_story_bg02 : AT(segment_story_bg02_ROM_START)
    {
        segment_story_bg02_text_START = .;
        build/us/asm/segment_story_bg02.o(.text);
        segment_story_bg02_text_END = .;
        segment_story_bg02_text_SIZE = ABSOLUTE(segment_story_bg02_text_END - segment_story_bg02_text_START);
        segment_story_bg02_data_START = .;
        build/us/asm/segment_story_bg02.o(.data);
        segment_story_bg02_data_END = .;
        segment_story_bg02_data_SIZE = ABSOLUTE(segment_story_bg02_data_END - segment_story_bg02_data_START);
        segment_story_bg02_rodata_START = .;
        build/us/asm/segment_story_bg02.o(.rodata);
        segment_story_bg02_rodata_END = .;
        segment_story_bg02_rodata_SIZE = ABSOLUTE(segment_story_bg02_rodata_END - segment_story_bg02_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg02);
    segment_story_bg02_ROM_END = __romPos;
    .segment_story_bg02 (NOLOAD) :
    {
        segment_story_bg02_bss_START = .;
        build/us/asm/segment_story_bg02.o(.sbss);
        build/us/asm/segment_story_bg02.o(.scommon);
        build/us/asm/segment_story_bg02.o(.bss);
        build/us/asm/segment_story_bg02.o(COMMON);
        segment_story_bg02_bss_END = .;
        segment_story_bg02_bss_SIZE = ABSOLUTE(segment_story_bg02_bss_END - segment_story_bg02_bss_START);
    }
    segment_story_bg02_VRAM_END = .;

    segment_story_bg03_ROM_START = __romPos;
    segment_story_bg03_VRAM = ADDR(.segment_story_bg03);
    .segment_story_bg03 : AT(segment_story_bg03_ROM_START)
    {
        segment_story_bg03_text_START = .;
        build/us/asm/segment_story_bg03.o(.text);
        segment_story_bg03_text_END = .;
        segment_story_bg03_text_SIZE = ABSOLUTE(segment_story_bg03_text_END - segment_story_bg03_text_START);
        segment_story_bg03_data_START = .;
        build/us/asm/segment_story_bg03.o(.data);
        segment_story_bg03_data_END = .;
        segment_story_bg03_data_SIZE = ABSOLUTE(segment_story_bg03_data_END - segment_story_bg03_data_START);
        segment_story_bg03_rodata_START = .;
        build/us/asm/segment_story_bg03.o(.rodata);
        segment_story_bg03_rodata_END = .;
        segment_story_bg03_rodata_SIZE = ABSOLUTE(segment_story_bg03_rodata_END - segment_story_bg03_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg03);
    segment_story_bg03_ROM_END = __romPos;
    .segment_story_bg03 (NOLOAD) :
    {
        segment_story_bg03_bss_START = .;
        build/us/asm/segment_story_bg03.o(.sbss);
        build/us/asm/segment_story_bg03.o(.scommon);
        build/us/asm/segment_story_bg03.o(.bss);
        build/us/asm/segment_story_bg03.o(COMMON);
        segment_story_bg03_bss_END = .;
        segment_story_bg03_bss_SIZE = ABSOLUTE(segment_story_bg03_bss_END - segment_story_bg03_bss_START);
    }
    segment_story_bg03_VRAM_END = .;

    segment_story_bg04_ROM_START = __romPos;
    segment_story_bg04_VRAM = ADDR(.segment_story_bg04);
    .segment_story_bg04 : AT(segment_story_bg04_ROM_START)
    {
        segment_story_bg04_text_START = .;
        build/us/asm/segment_story_bg04.o(.text);
        segment_story_bg04_text_END = .;
        segment_story_bg04_text_SIZE = ABSOLUTE(segment_story_bg04_text_END - segment_story_bg04_text_START);
        segment_story_bg04_data_START = .;
        build/us/asm/segment_story_bg04.o(.data);
        segment_story_bg04_data_END = .;
        segment_story_bg04_data_SIZE = ABSOLUTE(segment_story_bg04_data_END - segment_story_bg04_data_START);
        segment_story_bg04_rodata_START = .;
        build/us/asm/segment_story_bg04.o(.rodata);
        segment_story_bg04_rodata_END = .;
        segment_story_bg04_rodata_SIZE = ABSOLUTE(segment_story_bg04_rodata_END - segment_story_bg04_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg04);
    segment_story_bg04_ROM_END = __romPos;
    .segment_story_bg04 (NOLOAD) :
    {
        segment_story_bg04_bss_START = .;
        build/us/asm/segment_story_bg04.o(.sbss);
        build/us/asm/segment_story_bg04.o(.scommon);
        build/us/asm/segment_story_bg04.o(.bss);
        build/us/asm/segment_story_bg04.o(COMMON);
        segment_story_bg04_bss_END = .;
        segment_story_bg04_bss_SIZE = ABSOLUTE(segment_story_bg04_bss_END - segment_story_bg04_bss_START);
    }
    segment_story_bg04_VRAM_END = .;

    segment_story_bg05_ROM_START = __romPos;
    segment_story_bg05_VRAM = ADDR(.segment_story_bg05);
    .segment_story_bg05 : AT(segment_story_bg05_ROM_START)
    {
        segment_story_bg05_text_START = .;
        build/us/asm/segment_story_bg05.o(.text);
        segment_story_bg05_text_END = .;
        segment_story_bg05_text_SIZE = ABSOLUTE(segment_story_bg05_text_END - segment_story_bg05_text_START);
        segment_story_bg05_data_START = .;
        build/us/asm/segment_story_bg05.o(.data);
        segment_story_bg05_data_END = .;
        segment_story_bg05_data_SIZE = ABSOLUTE(segment_story_bg05_data_END - segment_story_bg05_data_START);
        segment_story_bg05_rodata_START = .;
        build/us/asm/segment_story_bg05.o(.rodata);
        segment_story_bg05_rodata_END = .;
        segment_story_bg05_rodata_SIZE = ABSOLUTE(segment_story_bg05_rodata_END - segment_story_bg05_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg05);
    segment_story_bg05_ROM_END = __romPos;
    .segment_story_bg05 (NOLOAD) :
    {
        segment_story_bg05_bss_START = .;
        build/us/asm/segment_story_bg05.o(.sbss);
        build/us/asm/segment_story_bg05.o(.scommon);
        build/us/asm/segment_story_bg05.o(.bss);
        build/us/asm/segment_story_bg05.o(COMMON);
        segment_story_bg05_bss_END = .;
        segment_story_bg05_bss_SIZE = ABSOLUTE(segment_story_bg05_bss_END - segment_story_bg05_bss_START);
    }
    segment_story_bg05_VRAM_END = .;

    segment_story_bg07_ROM_START = __romPos;
    segment_story_bg07_VRAM = ADDR(.segment_story_bg07);
    .segment_story_bg07 : AT(segment_story_bg07_ROM_START)
    {
        segment_story_bg07_text_START = .;
        build/us/asm/segment_story_bg07.o(.text);
        segment_story_bg07_text_END = .;
        segment_story_bg07_text_SIZE = ABSOLUTE(segment_story_bg07_text_END - segment_story_bg07_text_START);
        segment_story_bg07_data_START = .;
        build/us/asm/segment_story_bg07.o(.data);
        segment_story_bg07_data_END = .;
        segment_story_bg07_data_SIZE = ABSOLUTE(segment_story_bg07_data_END - segment_story_bg07_data_START);
        segment_story_bg07_rodata_START = .;
        build/us/asm/segment_story_bg07.o(.rodata);
        segment_story_bg07_rodata_END = .;
        segment_story_bg07_rodata_SIZE = ABSOLUTE(segment_story_bg07_rodata_END - segment_story_bg07_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg07);
    segment_story_bg07_ROM_END = __romPos;
    .segment_story_bg07 (NOLOAD) :
    {
        segment_story_bg07_bss_START = .;
        build/us/asm/segment_story_bg07.o(.sbss);
        build/us/asm/segment_story_bg07.o(.scommon);
        build/us/asm/segment_story_bg07.o(.bss);
        build/us/asm/segment_story_bg07.o(COMMON);
        segment_story_bg07_bss_END = .;
        segment_story_bg07_bss_SIZE = ABSOLUTE(segment_story_bg07_bss_END - segment_story_bg07_bss_START);
    }
    segment_story_bg07_VRAM_END = .;

    segment_story_bg08_ROM_START = __romPos;
    segment_story_bg08_VRAM = ADDR(.segment_story_bg08);
    .segment_story_bg08 : AT(segment_story_bg08_ROM_START)
    {
        segment_story_bg08_text_START = .;
        build/us/asm/segment_story_bg08.o(.text);
        segment_story_bg08_text_END = .;
        segment_story_bg08_text_SIZE = ABSOLUTE(segment_story_bg08_text_END - segment_story_bg08_text_START);
        segment_story_bg08_data_START = .;
        build/us/asm/segment_story_bg08.o(.data);
        segment_story_bg08_data_END = .;
        segment_story_bg08_data_SIZE = ABSOLUTE(segment_story_bg08_data_END - segment_story_bg08_data_START);
        segment_story_bg08_rodata_START = .;
        build/us/asm/segment_story_bg08.o(.rodata);
        segment_story_bg08_rodata_END = .;
        segment_story_bg08_rodata_SIZE = ABSOLUTE(segment_story_bg08_rodata_END - segment_story_bg08_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg08);
    segment_story_bg08_ROM_END = __romPos;
    .segment_story_bg08 (NOLOAD) :
    {
        segment_story_bg08_bss_START = .;
        build/us/asm/segment_story_bg08.o(.sbss);
        build/us/asm/segment_story_bg08.o(.scommon);
        build/us/asm/segment_story_bg08.o(.bss);
        build/us/asm/segment_story_bg08.o(COMMON);
        segment_story_bg08_bss_END = .;
        segment_story_bg08_bss_SIZE = ABSOLUTE(segment_story_bg08_bss_END - segment_story_bg08_bss_START);
    }
    segment_story_bg08_VRAM_END = .;

    segment_story_bg09_ROM_START = __romPos;
    segment_story_bg09_VRAM = ADDR(.segment_story_bg09);
    .segment_story_bg09 : AT(segment_story_bg09_ROM_START)
    {
        segment_story_bg09_text_START = .;
        build/us/asm/segment_story_bg09.o(.text);
        segment_story_bg09_text_END = .;
        segment_story_bg09_text_SIZE = ABSOLUTE(segment_story_bg09_text_END - segment_story_bg09_text_START);
        segment_story_bg09_data_START = .;
        build/us/asm/segment_story_bg09.o(.data);
        segment_story_bg09_data_END = .;
        segment_story_bg09_data_SIZE = ABSOLUTE(segment_story_bg09_data_END - segment_story_bg09_data_START);
        segment_story_bg09_rodata_START = .;
        build/us/asm/segment_story_bg09.o(.rodata);
        segment_story_bg09_rodata_END = .;
        segment_story_bg09_rodata_SIZE = ABSOLUTE(segment_story_bg09_rodata_END - segment_story_bg09_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg09);
    segment_story_bg09_ROM_END = __romPos;
    .segment_story_bg09 (NOLOAD) :
    {
        segment_story_bg09_bss_START = .;
        build/us/asm/segment_story_bg09.o(.sbss);
        build/us/asm/segment_story_bg09.o(.scommon);
        build/us/asm/segment_story_bg09.o(.bss);
        build/us/asm/segment_story_bg09.o(COMMON);
        segment_story_bg09_bss_END = .;
        segment_story_bg09_bss_SIZE = ABSOLUTE(segment_story_bg09_bss_END - segment_story_bg09_bss_START);
    }
    segment_story_bg09_VRAM_END = .;

    segment_story_bg10_ROM_START = __romPos;
    segment_story_bg10_VRAM = ADDR(.segment_story_bg10);
    .segment_story_bg10 : AT(segment_story_bg10_ROM_START)
    {
        segment_story_bg10_text_START = .;
        build/us/asm/segment_story_bg10.o(.text);
        segment_story_bg10_text_END = .;
        segment_story_bg10_text_SIZE = ABSOLUTE(segment_story_bg10_text_END - segment_story_bg10_text_START);
        segment_story_bg10_data_START = .;
        build/us/asm/segment_story_bg10.o(.data);
        segment_story_bg10_data_END = .;
        segment_story_bg10_data_SIZE = ABSOLUTE(segment_story_bg10_data_END - segment_story_bg10_data_START);
        segment_story_bg10_rodata_START = .;
        build/us/asm/segment_story_bg10.o(.rodata);
        segment_story_bg10_rodata_END = .;
        segment_story_bg10_rodata_SIZE = ABSOLUTE(segment_story_bg10_rodata_END - segment_story_bg10_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg10);
    segment_story_bg10_ROM_END = __romPos;
    .segment_story_bg10 (NOLOAD) :
    {
        segment_story_bg10_bss_START = .;
        build/us/asm/segment_story_bg10.o(.sbss);
        build/us/asm/segment_story_bg10.o(.scommon);
        build/us/asm/segment_story_bg10.o(.bss);
        build/us/asm/segment_story_bg10.o(COMMON);
        segment_story_bg10_bss_END = .;
        segment_story_bg10_bss_SIZE = ABSOLUTE(segment_story_bg10_bss_END - segment_story_bg10_bss_START);
    }
    segment_story_bg10_VRAM_END = .;

    segment_story_bg11_ROM_START = __romPos;
    segment_story_bg11_VRAM = ADDR(.segment_story_bg11);
    .segment_story_bg11 : AT(segment_story_bg11_ROM_START)
    {
        segment_story_bg11_text_START = .;
        build/us/asm/segment_story_bg11.o(.text);
        segment_story_bg11_text_END = .;
        segment_story_bg11_text_SIZE = ABSOLUTE(segment_story_bg11_text_END - segment_story_bg11_text_START);
        segment_story_bg11_data_START = .;
        build/us/asm/segment_story_bg11.o(.data);
        segment_story_bg11_data_END = .;
        segment_story_bg11_data_SIZE = ABSOLUTE(segment_story_bg11_data_END - segment_story_bg11_data_START);
        segment_story_bg11_rodata_START = .;
        build/us/asm/segment_story_bg11.o(.rodata);
        segment_story_bg11_rodata_END = .;
        segment_story_bg11_rodata_SIZE = ABSOLUTE(segment_story_bg11_rodata_END - segment_story_bg11_rodata_START);
    }
    __romPos += SIZEOF(.segment_story_bg11);
    segment_story_bg11_ROM_END = __romPos;
    .segment_story_bg11 (NOLOAD) :
    {
        segment_story_bg11_bss_START = .;
        build/us/asm/segment_story_bg11.o(.sbss);
        build/us/asm/segment_story_bg11.o(.scommon);
        build/us/asm/segment_story_bg11.o(.bss);
        build/us/asm/segment_story_bg11.o(COMMON);
        segment_story_bg11_bss_END = .;
        segment_story_bg11_bss_SIZE = ABSOLUTE(segment_story_bg11_bss_END - segment_story_bg11_bss_START);
    }
    segment_story_bg11_VRAM_END = .;

    segment_menu_char_ROM_START = __romPos;
    segment_menu_char_VRAM = ADDR(.segment_menu_char);
    .segment_menu_char 0x00000000 : AT(segment_menu_char_ROM_START)
    {
        segment_menu_char_text_START = .;
        build/us/src/assets/menu/menu_char.o(.text);
        segment_menu_char_text_END = .;
        segment_menu_char_text_SIZE = ABSOLUTE(segment_menu_char_text_END - segment_menu_char_text_START);
        segment_menu_char_data_START = .;
        build/us/src/assets/menu/menu_char.o(.data);
        segment_menu_char_data_END = .;
        segment_menu_char_data_SIZE = ABSOLUTE(segment_menu_char_data_END - segment_menu_char_data_START);
        segment_menu_char_rodata_START = .;
        build/us/src/assets/menu/menu_char.o(.rodata);
        segment_menu_char_rodata_END = .;
        segment_menu_char_rodata_SIZE = ABSOLUTE(segment_menu_char_rodata_END - segment_menu_char_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_char);
    segment_menu_char_ROM_END = __romPos;
    .segment_menu_char (NOLOAD) :
    {
        segment_menu_char_bss_START = .;
        build/us/src/assets/menu/menu_char.o(.sbss);
        build/us/src/assets/menu/menu_char.o(.scommon);
        build/us/src/assets/menu/menu_char.o(.bss);
        build/us/src/assets/menu/menu_char.o(COMMON);
        segment_menu_char_bss_END = .;
        segment_menu_char_bss_SIZE = ABSOLUTE(segment_menu_char_bss_END - segment_menu_char_bss_START);
    }
    segment_menu_char_VRAM_END = .;

    segment_menu_common_ROM_START = __romPos;
    segment_menu_common_VRAM = ADDR(.segment_menu_common);
    .segment_menu_common 0x00000000 : AT(segment_menu_common_ROM_START)
    {
        segment_menu_common_text_START = .;
        build/us/src/assets/menu/menu_common.o(.text);
        segment_menu_common_text_END = .;
        segment_menu_common_text_SIZE = ABSOLUTE(segment_menu_common_text_END - segment_menu_common_text_START);
        segment_menu_common_data_START = .;
        build/us/src/assets/menu/menu_common.o(.data);
        segment_menu_common_data_END = .;
        segment_menu_common_data_SIZE = ABSOLUTE(segment_menu_common_data_END - segment_menu_common_data_START);
        segment_menu_common_rodata_START = .;
        build/us/src/assets/menu/menu_common.o(.rodata);
        segment_menu_common_rodata_END = .;
        segment_menu_common_rodata_SIZE = ABSOLUTE(segment_menu_common_rodata_END - segment_menu_common_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_common);
    segment_menu_common_ROM_END = __romPos;
    .segment_menu_common (NOLOAD) :
    {
        segment_menu_common_bss_START = .;
        build/us/src/assets/menu/menu_common.o(.sbss);
        build/us/src/assets/menu/menu_common.o(.scommon);
        build/us/src/assets/menu/menu_common.o(.bss);
        build/us/src/assets/menu/menu_common.o(COMMON);
        segment_menu_common_bss_END = .;
        segment_menu_common_bss_SIZE = ABSOLUTE(segment_menu_common_bss_END - segment_menu_common_bss_START);
    }
    segment_menu_common_VRAM_END = .;

    segment_menu_level_ROM_START = __romPos;
    segment_menu_level_VRAM = ADDR(.segment_menu_level);
    .segment_menu_level 0x00000000 : AT(segment_menu_level_ROM_START)
    {
        segment_menu_level_text_START = .;
        build/us/src/assets/menu/menu_level.o(.text);
        segment_menu_level_text_END = .;
        segment_menu_level_text_SIZE = ABSOLUTE(segment_menu_level_text_END - segment_menu_level_text_START);
        segment_menu_level_data_START = .;
        build/us/src/assets/menu/menu_level.o(.data);
        segment_menu_level_data_END = .;
        segment_menu_level_data_SIZE = ABSOLUTE(segment_menu_level_data_END - segment_menu_level_data_START);
        segment_menu_level_rodata_START = .;
        build/us/src/assets/menu/menu_level.o(.rodata);
        segment_menu_level_rodata_END = .;
        segment_menu_level_rodata_SIZE = ABSOLUTE(segment_menu_level_rodata_END - segment_menu_level_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_level);
    segment_menu_level_ROM_END = __romPos;
    .segment_menu_level (NOLOAD) :
    {
        segment_menu_level_bss_START = .;
        build/us/src/assets/menu/menu_level.o(.sbss);
        build/us/src/assets/menu/menu_level.o(.scommon);
        build/us/src/assets/menu/menu_level.o(.bss);
        build/us/src/assets/menu/menu_level.o(COMMON);
        segment_menu_level_bss_END = .;
        segment_menu_level_bss_SIZE = ABSOLUTE(segment_menu_level_bss_END - segment_menu_level_bss_START);
    }
    segment_menu_level_VRAM_END = .;

    segment_menu_main_ROM_START = __romPos;
    segment_menu_main_VRAM = ADDR(.segment_menu_main);
    .segment_menu_main 0x00000000 : AT(segment_menu_main_ROM_START)
    {
        segment_menu_main_text_START = .;
        build/us/src/assets/menu/menu_main.o(.text);
        segment_menu_main_text_END = .;
        segment_menu_main_text_SIZE = ABSOLUTE(segment_menu_main_text_END - segment_menu_main_text_START);
        segment_menu_main_data_START = .;
        build/us/src/assets/menu/menu_main.o(.data);
        segment_menu_main_data_END = .;
        segment_menu_main_data_SIZE = ABSOLUTE(segment_menu_main_data_END - segment_menu_main_data_START);
        segment_menu_main_rodata_START = .;
        build/us/src/assets/menu/menu_main.o(.rodata);
        segment_menu_main_rodata_END = .;
        segment_menu_main_rodata_SIZE = ABSOLUTE(segment_menu_main_rodata_END - segment_menu_main_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_main);
    segment_menu_main_ROM_END = __romPos;
    .segment_menu_main (NOLOAD) :
    {
        segment_menu_main_bss_START = .;
        build/us/src/assets/menu/menu_main.o(.sbss);
        build/us/src/assets/menu/menu_main.o(.scommon);
        build/us/src/assets/menu/menu_main.o(.bss);
        build/us/src/assets/menu/menu_main.o(COMMON);
        segment_menu_main_bss_END = .;
        segment_menu_main_bss_SIZE = ABSOLUTE(segment_menu_main_bss_END - segment_menu_main_bss_START);
    }
    segment_menu_main_VRAM_END = .;

    segment_menu_name_ROM_START = __romPos;
    segment_menu_name_VRAM = ADDR(.segment_menu_name);
    .segment_menu_name 0x00000000 : AT(segment_menu_name_ROM_START)
    {
        segment_menu_name_text_START = .;
        build/us/src/assets/menu/menu_name.o(.text);
        segment_menu_name_text_END = .;
        segment_menu_name_text_SIZE = ABSOLUTE(segment_menu_name_text_END - segment_menu_name_text_START);
        segment_menu_name_data_START = .;
        build/us/src/assets/menu/menu_name.o(.data);
        segment_menu_name_data_END = .;
        segment_menu_name_data_SIZE = ABSOLUTE(segment_menu_name_data_END - segment_menu_name_data_START);
        segment_menu_name_rodata_START = .;
        build/us/src/assets/menu/menu_name.o(.rodata);
        segment_menu_name_rodata_END = .;
        segment_menu_name_rodata_SIZE = ABSOLUTE(segment_menu_name_rodata_END - segment_menu_name_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_name);
    segment_menu_name_ROM_END = __romPos;
    .segment_menu_name (NOLOAD) :
    {
        segment_menu_name_bss_START = .;
        build/us/src/assets/menu/menu_name.o(.sbss);
        build/us/src/assets/menu/menu_name.o(.scommon);
        build/us/src/assets/menu/menu_name.o(.bss);
        build/us/src/assets/menu/menu_name.o(COMMON);
        segment_menu_name_bss_END = .;
        segment_menu_name_bss_SIZE = ABSOLUTE(segment_menu_name_bss_END - segment_menu_name_bss_START);
    }
    segment_menu_name_VRAM_END = .;

    segment_menu_p2_ROM_START = __romPos;
    segment_menu_p2_VRAM = ADDR(.segment_menu_p2);
    .segment_menu_p2 0x00000000 : AT(segment_menu_p2_ROM_START)
    {
        segment_menu_p2_text_START = .;
        build/us/src/assets/menu/menu_p2.o(.text);
        segment_menu_p2_text_END = .;
        segment_menu_p2_text_SIZE = ABSOLUTE(segment_menu_p2_text_END - segment_menu_p2_text_START);
        segment_menu_p2_data_START = .;
        build/us/src/assets/menu/menu_p2.o(.data);
        segment_menu_p2_data_END = .;
        segment_menu_p2_data_SIZE = ABSOLUTE(segment_menu_p2_data_END - segment_menu_p2_data_START);
        segment_menu_p2_rodata_START = .;
        build/us/src/assets/menu/menu_p2.o(.rodata);
        segment_menu_p2_rodata_END = .;
        segment_menu_p2_rodata_SIZE = ABSOLUTE(segment_menu_p2_rodata_END - segment_menu_p2_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_p2);
    segment_menu_p2_ROM_END = __romPos;
    .segment_menu_p2 (NOLOAD) :
    {
        segment_menu_p2_bss_START = .;
        build/us/src/assets/menu/menu_p2.o(.sbss);
        build/us/src/assets/menu/menu_p2.o(.scommon);
        build/us/src/assets/menu/menu_p2.o(.bss);
        build/us/src/assets/menu/menu_p2.o(COMMON);
        segment_menu_p2_bss_END = .;
        segment_menu_p2_bss_SIZE = ABSOLUTE(segment_menu_p2_bss_END - segment_menu_p2_bss_START);
    }
    segment_menu_p2_VRAM_END = .;

    segment_menu_p4_ROM_START = __romPos;
    segment_menu_p4_VRAM = ADDR(.segment_menu_p4);
    .segment_menu_p4 0x00000000 : AT(segment_menu_p4_ROM_START)
    {
        segment_menu_p4_text_START = .;
        build/us/src/assets/menu/menu_p4.o(.text);
        segment_menu_p4_text_END = .;
        segment_menu_p4_text_SIZE = ABSOLUTE(segment_menu_p4_text_END - segment_menu_p4_text_START);
        segment_menu_p4_data_START = .;
        build/us/src/assets/menu/menu_p4.o(.data);
        segment_menu_p4_data_END = .;
        segment_menu_p4_data_SIZE = ABSOLUTE(segment_menu_p4_data_END - segment_menu_p4_data_START);
        segment_menu_p4_rodata_START = .;
        build/us/src/assets/menu/menu_p4.o(.rodata);
        segment_menu_p4_rodata_END = .;
        segment_menu_p4_rodata_SIZE = ABSOLUTE(segment_menu_p4_rodata_END - segment_menu_p4_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_p4);
    segment_menu_p4_ROM_END = __romPos;
    .segment_menu_p4 (NOLOAD) :
    {
        segment_menu_p4_bss_START = .;
        build/us/src/assets/menu/menu_p4.o(.sbss);
        build/us/src/assets/menu/menu_p4.o(.scommon);
        build/us/src/assets/menu/menu_p4.o(.bss);
        build/us/src/assets/menu/menu_p4.o(COMMON);
        segment_menu_p4_bss_END = .;
        segment_menu_p4_bss_SIZE = ABSOLUTE(segment_menu_p4_bss_END - segment_menu_p4_bss_START);
    }
    segment_menu_p4_VRAM_END = .;

    segment_menu_rank_ROM_START = __romPos;
    segment_menu_rank_VRAM = ADDR(.segment_menu_rank);
    .segment_menu_rank 0x00000000 : AT(segment_menu_rank_ROM_START)
    {
        segment_menu_rank_text_START = .;
        build/us/src/assets/menu/menu_rank.o(.text);
        segment_menu_rank_text_END = .;
        segment_menu_rank_text_SIZE = ABSOLUTE(segment_menu_rank_text_END - segment_menu_rank_text_START);
        segment_menu_rank_data_START = .;
        build/us/src/assets/menu/menu_rank.o(.data);
        segment_menu_rank_data_END = .;
        segment_menu_rank_data_SIZE = ABSOLUTE(segment_menu_rank_data_END - segment_menu_rank_data_START);
        segment_menu_rank_rodata_START = .;
        build/us/src/assets/menu/menu_rank.o(.rodata);
        segment_menu_rank_rodata_END = .;
        segment_menu_rank_rodata_SIZE = ABSOLUTE(segment_menu_rank_rodata_END - segment_menu_rank_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_rank);
    segment_menu_rank_ROM_END = __romPos;
    .segment_menu_rank (NOLOAD) :
    {
        segment_menu_rank_bss_START = .;
        build/us/src/assets/menu/menu_rank.o(.sbss);
        build/us/src/assets/menu/menu_rank.o(.scommon);
        build/us/src/assets/menu/menu_rank.o(.bss);
        build/us/src/assets/menu/menu_rank.o(COMMON);
        segment_menu_rank_bss_END = .;
        segment_menu_rank_bss_SIZE = ABSOLUTE(segment_menu_rank_bss_END - segment_menu_rank_bss_START);
    }
    segment_menu_rank_VRAM_END = .;

    segment_menu_setup_ROM_START = __romPos;
    segment_menu_setup_VRAM = ADDR(.segment_menu_setup);
    .segment_menu_setup 0x00000000 : AT(segment_menu_setup_ROM_START)
    {
        segment_menu_setup_text_START = .;
        build/us/src/assets/menu/menu_setup.o(.text);
        segment_menu_setup_text_END = .;
        segment_menu_setup_text_SIZE = ABSOLUTE(segment_menu_setup_text_END - segment_menu_setup_text_START);
        segment_menu_setup_data_START = .;
        build/us/src/assets/menu/menu_setup.o(.data);
        segment_menu_setup_data_END = .;
        segment_menu_setup_data_SIZE = ABSOLUTE(segment_menu_setup_data_END - segment_menu_setup_data_START);
        segment_menu_setup_rodata_START = .;
        build/us/src/assets/menu/menu_setup.o(.rodata);
        segment_menu_setup_rodata_END = .;
        segment_menu_setup_rodata_SIZE = ABSOLUTE(segment_menu_setup_rodata_END - segment_menu_setup_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_setup);
    segment_menu_setup_ROM_END = __romPos;
    .segment_menu_setup (NOLOAD) :
    {
        segment_menu_setup_bss_START = .;
        build/us/src/assets/menu/menu_setup.o(.sbss);
        build/us/src/assets/menu/menu_setup.o(.scommon);
        build/us/src/assets/menu/menu_setup.o(.bss);
        build/us/src/assets/menu/menu_setup.o(COMMON);
        segment_menu_setup_bss_END = .;
        segment_menu_setup_bss_SIZE = ABSOLUTE(segment_menu_setup_bss_END - segment_menu_setup_bss_START);
    }
    segment_menu_setup_VRAM_END = .;

    segment_menu_story_ROM_START = __romPos;
    segment_menu_story_VRAM = ADDR(.segment_menu_story);
    .segment_menu_story 0x00000000 : AT(segment_menu_story_ROM_START)
    {
        segment_menu_story_text_START = .;
        build/us/src/assets/menu/menu_story.o(.text);
        segment_menu_story_text_END = .;
        segment_menu_story_text_SIZE = ABSOLUTE(segment_menu_story_text_END - segment_menu_story_text_START);
        segment_menu_story_data_START = .;
        build/us/src/assets/menu/menu_story.o(.data);
        segment_menu_story_data_END = .;
        segment_menu_story_data_SIZE = ABSOLUTE(segment_menu_story_data_END - segment_menu_story_data_START);
        segment_menu_story_rodata_START = .;
        build/us/src/assets/menu/menu_story.o(.rodata);
        segment_menu_story_rodata_END = .;
        segment_menu_story_rodata_SIZE = ABSOLUTE(segment_menu_story_rodata_END - segment_menu_story_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_story);
    segment_menu_story_ROM_END = __romPos;
    .segment_menu_story (NOLOAD) :
    {
        segment_menu_story_bss_START = .;
        build/us/src/assets/menu/menu_story.o(.sbss);
        build/us/src/assets/menu/menu_story.o(.scommon);
        build/us/src/assets/menu/menu_story.o(.bss);
        build/us/src/assets/menu/menu_story.o(COMMON);
        segment_menu_story_bss_END = .;
        segment_menu_story_bss_SIZE = ABSOLUTE(segment_menu_story_bss_END - segment_menu_story_bss_START);
    }
    segment_menu_story_VRAM_END = .;

    segment_menu_cont_ROM_START = __romPos;
    segment_menu_cont_VRAM = ADDR(.segment_menu_cont);
    .segment_menu_cont 0x00000000 : AT(segment_menu_cont_ROM_START)
    {
        segment_menu_cont_text_START = .;
        build/us/src/assets/menu/menu_cont.o(.text);
        segment_menu_cont_text_END = .;
        segment_menu_cont_text_SIZE = ABSOLUTE(segment_menu_cont_text_END - segment_menu_cont_text_START);
        segment_menu_cont_data_START = .;
        build/us/src/assets/menu/menu_cont.o(.data);
        segment_menu_cont_data_END = .;
        segment_menu_cont_data_SIZE = ABSOLUTE(segment_menu_cont_data_END - segment_menu_cont_data_START);
        segment_menu_cont_rodata_START = .;
        build/us/src/assets/menu/menu_cont.o(.rodata);
        segment_menu_cont_rodata_END = .;
        segment_menu_cont_rodata_SIZE = ABSOLUTE(segment_menu_cont_rodata_END - segment_menu_cont_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_cont);
    segment_menu_cont_ROM_END = __romPos;
    .segment_menu_cont (NOLOAD) :
    {
        segment_menu_cont_bss_START = .;
        build/us/src/assets/menu/menu_cont.o(.sbss);
        build/us/src/assets/menu/menu_cont.o(.scommon);
        build/us/src/assets/menu/menu_cont.o(.bss);
        build/us/src/assets/menu/menu_cont.o(COMMON);
        segment_menu_cont_bss_END = .;
        segment_menu_cont_bss_SIZE = ABSOLUTE(segment_menu_cont_bss_END - segment_menu_cont_bss_START);
    }
    segment_menu_cont_VRAM_END = .;

    segment_menu_kasa_ROM_START = __romPos;
    segment_menu_kasa_VRAM = ADDR(.segment_menu_kasa);
    .segment_menu_kasa 0x00000000 : AT(segment_menu_kasa_ROM_START)
    {
        segment_menu_kasa_text_START = .;
        build/us/src/assets/menu/menu_kasa.o(.text);
        segment_menu_kasa_text_END = .;
        segment_menu_kasa_text_SIZE = ABSOLUTE(segment_menu_kasa_text_END - segment_menu_kasa_text_START);
        segment_menu_kasa_data_START = .;
        build/us/src/assets/menu/menu_kasa.o(.data);
        segment_menu_kasa_data_END = .;
        segment_menu_kasa_data_SIZE = ABSOLUTE(segment_menu_kasa_data_END - segment_menu_kasa_data_START);
        segment_menu_kasa_rodata_START = .;
        build/us/src/assets/menu/menu_kasa.o(.rodata);
        segment_menu_kasa_rodata_END = .;
        segment_menu_kasa_rodata_SIZE = ABSOLUTE(segment_menu_kasa_rodata_END - segment_menu_kasa_rodata_START);
    }
    __romPos += SIZEOF(.segment_menu_kasa);
    segment_menu_kasa_ROM_END = __romPos;
    .segment_menu_kasa (NOLOAD) :
    {
        segment_menu_kasa_bss_START = .;
        build/us/src/assets/menu/menu_kasa.o(.sbss);
        build/us/src/assets/menu/menu_kasa.o(.scommon);
        build/us/src/assets/menu/menu_kasa.o(.bss);
        build/us/src/assets/menu/menu_kasa.o(COMMON);
        segment_menu_kasa_bss_END = .;
        segment_menu_kasa_bss_SIZE = ABSOLUTE(segment_menu_kasa_bss_END - segment_menu_kasa_bss_START);
    }
    segment_menu_kasa_VRAM_END = .;

    segment_game_al_ROM_START = __romPos;
    segment_game_al_VRAM = ADDR(.segment_game_al);
    .segment_game_al 0x00000000 : AT(segment_game_al_ROM_START)
    {
        segment_game_al_text_START = .;
        build/us/src/assets/game/game_al.o(.text);
        segment_game_al_text_END = .;
        segment_game_al_text_SIZE = ABSOLUTE(segment_game_al_text_END - segment_game_al_text_START);
        segment_game_al_data_START = .;
        build/us/src/assets/game/game_al.o(.data);
        segment_game_al_data_END = .;
        segment_game_al_data_SIZE = ABSOLUTE(segment_game_al_data_END - segment_game_al_data_START);
        segment_game_al_rodata_START = .;
        build/us/src/assets/game/game_al.o(.rodata);
        segment_game_al_rodata_END = .;
        segment_game_al_rodata_SIZE = ABSOLUTE(segment_game_al_rodata_END - segment_game_al_rodata_START);
    }
    __romPos += SIZEOF(.segment_game_al);
    segment_game_al_ROM_END = __romPos;
    .segment_game_al (NOLOAD) :
    {
        segment_game_al_bss_START = .;
        build/us/src/assets/game/game_al.o(.sbss);
        build/us/src/assets/game/game_al.o(.scommon);
        build/us/src/assets/game/game_al.o(.bss);
        build/us/src/assets/game/game_al.o(COMMON);
        segment_game_al_bss_END = .;
        segment_game_al_bss_SIZE = ABSOLUTE(segment_game_al_bss_END - segment_game_al_bss_START);
    }
    segment_game_al_VRAM_END = .;

    segment_game_p1_ROM_START = __romPos;
    segment_game_p1_VRAM = ADDR(.segment_game_p1);
    .segment_game_p1 0x00000000 : AT(segment_game_p1_ROM_START)
    {
        segment_game_p1_text_START = .;
        build/us/src/assets/game/game_p1.o(.text);
        segment_game_p1_text_END = .;
        segment_game_p1_text_SIZE = ABSOLUTE(segment_game_p1_text_END - segment_game_p1_text_START);
        segment_game_p1_data_START = .;
        build/us/src/assets/game/game_p1.o(.data);
        segment_game_p1_data_END = .;
        segment_game_p1_data_SIZE = ABSOLUTE(segment_game_p1_data_END - segment_game_p1_data_START);
        segment_game_p1_rodata_START = .;
        build/us/src/assets/game/game_p1.o(.rodata);
        segment_game_p1_rodata_END = .;
        segment_game_p1_rodata_SIZE = ABSOLUTE(segment_game_p1_rodata_END - segment_game_p1_rodata_START);
    }
    __romPos += SIZEOF(.segment_game_p1);
    segment_game_p1_ROM_END = __romPos;
    .segment_game_p1 (NOLOAD) :
    {
        segment_game_p1_bss_START = .;
        build/us/src/assets/game/game_p1.o(.sbss);
        build/us/src/assets/game/game_p1.o(.scommon);
        build/us/src/assets/game/game_p1.o(.bss);
        build/us/src/assets/game/game_p1.o(COMMON);
        segment_game_p1_bss_END = .;
        segment_game_p1_bss_SIZE = ABSOLUTE(segment_game_p1_bss_END - segment_game_p1_bss_START);
    }
    segment_game_p1_VRAM_END = .;

    segment_game_p2_ROM_START = __romPos;
    segment_game_p2_VRAM = ADDR(.segment_game_p2);
    .segment_game_p2 0x00000000 : AT(segment_game_p2_ROM_START)
    {
        segment_game_p2_text_START = .;
        build/us/src/assets/game/game_p2.o(.text);
        segment_game_p2_text_END = .;
        segment_game_p2_text_SIZE = ABSOLUTE(segment_game_p2_text_END - segment_game_p2_text_START);
        segment_game_p2_data_START = .;
        build/us/src/assets/game/game_p2.o(.data);
        segment_game_p2_data_END = .;
        segment_game_p2_data_SIZE = ABSOLUTE(segment_game_p2_data_END - segment_game_p2_data_START);
        segment_game_p2_rodata_START = .;
        build/us/src/assets/game/game_p2.o(.rodata);
        segment_game_p2_rodata_END = .;
        segment_game_p2_rodata_SIZE = ABSOLUTE(segment_game_p2_rodata_END - segment_game_p2_rodata_START);
    }
    __romPos += SIZEOF(.segment_game_p2);
    segment_game_p2_ROM_END = __romPos;
    .segment_game_p2 (NOLOAD) :
    {
        segment_game_p2_bss_START = .;
        build/us/src/assets/game/game_p2.o(.sbss);
        build/us/src/assets/game/game_p2.o(.scommon);
        build/us/src/assets/game/game_p2.o(.bss);
        build/us/src/assets/game/game_p2.o(COMMON);
        segment_game_p2_bss_END = .;
        segment_game_p2_bss_SIZE = ABSOLUTE(segment_game_p2_bss_END - segment_game_p2_bss_START);
    }
    segment_game_p2_VRAM_END = .;

    segment_game_p4_ROM_START = __romPos;
    segment_game_p4_VRAM = ADDR(.segment_game_p4);
    .segment_game_p4 0x00000000 : AT(segment_game_p4_ROM_START)
    {
        segment_game_p4_text_START = .;
        build/us/src/assets/game/game_p4.o(.text);
        segment_game_p4_text_END = .;
        segment_game_p4_text_SIZE = ABSOLUTE(segment_game_p4_text_END - segment_game_p4_text_START);
        segment_game_p4_data_START = .;
        build/us/src/assets/game/game_p4.o(.data);
        segment_game_p4_data_END = .;
        segment_game_p4_data_SIZE = ABSOLUTE(segment_game_p4_data_END - segment_game_p4_data_START);
        segment_game_p4_rodata_START = .;
        build/us/src/assets/game/game_p4.o(.rodata);
        segment_game_p4_rodata_END = .;
        segment_game_p4_rodata_SIZE = ABSOLUTE(segment_game_p4_rodata_END - segment_game_p4_rodata_START);
    }
    __romPos += SIZEOF(.segment_game_p4);
    segment_game_p4_ROM_END = __romPos;
    .segment_game_p4 (NOLOAD) :
    {
        segment_game_p4_bss_START = .;
        build/us/src/assets/game/game_p4.o(.sbss);
        build/us/src/assets/game/game_p4.o(.scommon);
        build/us/src/assets/game/game_p4.o(.bss);
        build/us/src/assets/game/game_p4.o(COMMON);
        segment_game_p4_bss_END = .;
        segment_game_p4_bss_SIZE = ABSOLUTE(segment_game_p4_bss_END - segment_game_p4_bss_START);
    }
    segment_game_p4_VRAM_END = .;

    segment_game_ls_ROM_START = __romPos;
    segment_game_ls_VRAM = ADDR(.segment_game_ls);
    .segment_game_ls 0x00000000 : AT(segment_game_ls_ROM_START)
    {
        segment_game_ls_text_START = .;
        build/us/src/assets/game/game_ls.o(.text);
        segment_game_ls_text_END = .;
        segment_game_ls_text_SIZE = ABSOLUTE(segment_game_ls_text_END - segment_game_ls_text_START);
        segment_game_ls_data_START = .;
        build/us/src/assets/game/game_ls.o(.data);
        segment_game_ls_data_END = .;
        segment_game_ls_data_SIZE = ABSOLUTE(segment_game_ls_data_END - segment_game_ls_data_START);
        segment_game_ls_rodata_START = .;
        build/us/src/assets/game/game_ls.o(.rodata);
        segment_game_ls_rodata_END = .;
        segment_game_ls_rodata_SIZE = ABSOLUTE(segment_game_ls_rodata_END - segment_game_ls_rodata_START);
    }
    __romPos += SIZEOF(.segment_game_ls);
    segment_game_ls_ROM_END = __romPos;
    .segment_game_ls (NOLOAD) :
    {
        segment_game_ls_bss_START = .;
        build/us/src/assets/game/game_ls.o(.sbss);
        build/us/src/assets/game/game_ls.o(.scommon);
        build/us/src/assets/game/game_ls.o(.bss);
        build/us/src/assets/game/game_ls.o(COMMON);
        segment_game_ls_bss_END = .;
        segment_game_ls_bss_SIZE = ABSOLUTE(segment_game_ls_bss_END - segment_game_ls_bss_START);
    }
    segment_game_ls_VRAM_END = .;

    segment_game_item_ROM_START = __romPos;
    segment_game_item_VRAM = ADDR(.segment_game_item);
    .segment_game_item 0x00000000 : AT(segment_game_item_ROM_START)
    {
        segment_game_item_text_START = .;
        build/us/src/assets/game/game_item.o(.text);
        segment_game_item_text_END = .;
        segment_game_item_text_SIZE = ABSOLUTE(segment_game_item_text_END - segment_game_item_text_START);
        segment_game_item_data_START = .;
        build/us/src/assets/game/game_item.o(.data);
        segment_game_item_data_END = .;
        segment_game_item_data_SIZE = ABSOLUTE(segment_game_item_data_END - segment_game_item_data_START);
        segment_game_item_rodata_START = .;
        build/us/src/assets/game/game_item.o(.rodata);
        segment_game_item_rodata_END = .;
        segment_game_item_rodata_SIZE = ABSOLUTE(segment_game_item_rodata_END - segment_game_item_rodata_START);
    }
    __romPos += SIZEOF(.segment_game_item);
    segment_game_item_ROM_END = __romPos;
    .segment_game_item (NOLOAD) :
    {
        segment_game_item_bss_START = .;
        build/us/src/assets/game/game_item.o(.sbss);
        build/us/src/assets/game/game_item.o(.scommon);
        build/us/src/assets/game/game_item.o(.bss);
        build/us/src/assets/game/game_item.o(COMMON);
        segment_game_item_bss_END = .;
        segment_game_item_bss_SIZE = ABSOLUTE(segment_game_item_bss_END - segment_game_item_bss_START);
    }
    segment_game_item_VRAM_END = .;

    segment_anime_a_ROM_START = __romPos;
    segment_anime_a_VRAM = ADDR(.segment_anime_a);
    .segment_anime_a 0x00000000 : AT(segment_anime_a_ROM_START)
    {
        segment_anime_a_text_START = .;
        build/us/src/assets/anime/anime_a.o(.text);
        segment_anime_a_text_END = .;
        segment_anime_a_text_SIZE = ABSOLUTE(segment_anime_a_text_END - segment_anime_a_text_START);
        segment_anime_a_data_START = .;
        build/us/src/assets/anime/anime_a.o(.data);
        segment_anime_a_data_END = .;
        segment_anime_a_data_SIZE = ABSOLUTE(segment_anime_a_data_END - segment_anime_a_data_START);
        segment_anime_a_rodata_START = .;
        build/us/src/assets/anime/anime_a.o(.rodata);
        segment_anime_a_rodata_END = .;
        segment_anime_a_rodata_SIZE = ABSOLUTE(segment_anime_a_rodata_END - segment_anime_a_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_a);
    segment_anime_a_ROM_END = __romPos;
    .segment_anime_a (NOLOAD) :
    {
        segment_anime_a_bss_START = .;
        build/us/src/assets/anime/anime_a.o(.sbss);
        build/us/src/assets/anime/anime_a.o(.scommon);
        build/us/src/assets/anime/anime_a.o(.bss);
        build/us/src/assets/anime/anime_a.o(COMMON);
        segment_anime_a_bss_END = .;
        segment_anime_a_bss_SIZE = ABSOLUTE(segment_anime_a_bss_END - segment_anime_a_bss_START);
    }
    segment_anime_a_VRAM_END = .;

    segment_anime_b_ROM_START = __romPos;
    segment_anime_b_VRAM = ADDR(.segment_anime_b);
    .segment_anime_b 0x00000000 : AT(segment_anime_b_ROM_START)
    {
        segment_anime_b_text_START = .;
        build/us/src/assets/anime/anime_b.o(.text);
        segment_anime_b_text_END = .;
        segment_anime_b_text_SIZE = ABSOLUTE(segment_anime_b_text_END - segment_anime_b_text_START);
        segment_anime_b_data_START = .;
        build/us/src/assets/anime/anime_b.o(.data);
        segment_anime_b_data_END = .;
        segment_anime_b_data_SIZE = ABSOLUTE(segment_anime_b_data_END - segment_anime_b_data_START);
        segment_anime_b_rodata_START = .;
        build/us/src/assets/anime/anime_b.o(.rodata);
        segment_anime_b_rodata_END = .;
        segment_anime_b_rodata_SIZE = ABSOLUTE(segment_anime_b_rodata_END - segment_anime_b_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_b);
    segment_anime_b_ROM_END = __romPos;
    .segment_anime_b (NOLOAD) :
    {
        segment_anime_b_bss_START = .;
        build/us/src/assets/anime/anime_b.o(.sbss);
        build/us/src/assets/anime/anime_b.o(.scommon);
        build/us/src/assets/anime/anime_b.o(.bss);
        build/us/src/assets/anime/anime_b.o(COMMON);
        segment_anime_b_bss_END = .;
        segment_anime_b_bss_SIZE = ABSOLUTE(segment_anime_b_bss_END - segment_anime_b_bss_START);
    }
    segment_anime_b_VRAM_END = .;

    segment_anime_c_ROM_START = __romPos;
    segment_anime_c_VRAM = ADDR(.segment_anime_c);
    .segment_anime_c 0x00000000 : AT(segment_anime_c_ROM_START)
    {
        segment_anime_c_text_START = .;
        build/us/src/assets/anime/anime_c.o(.text);
        segment_anime_c_text_END = .;
        segment_anime_c_text_SIZE = ABSOLUTE(segment_anime_c_text_END - segment_anime_c_text_START);
        segment_anime_c_data_START = .;
        build/us/src/assets/anime/anime_c.o(.data);
        segment_anime_c_data_END = .;
        segment_anime_c_data_SIZE = ABSOLUTE(segment_anime_c_data_END - segment_anime_c_data_START);
        segment_anime_c_rodata_START = .;
        build/us/src/assets/anime/anime_c.o(.rodata);
        segment_anime_c_rodata_END = .;
        segment_anime_c_rodata_SIZE = ABSOLUTE(segment_anime_c_rodata_END - segment_anime_c_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_c);
    segment_anime_c_ROM_END = __romPos;
    .segment_anime_c (NOLOAD) :
    {
        segment_anime_c_bss_START = .;
        build/us/src/assets/anime/anime_c.o(.sbss);
        build/us/src/assets/anime/anime_c.o(.scommon);
        build/us/src/assets/anime/anime_c.o(.bss);
        build/us/src/assets/anime/anime_c.o(COMMON);
        segment_anime_c_bss_END = .;
        segment_anime_c_bss_SIZE = ABSOLUTE(segment_anime_c_bss_END - segment_anime_c_bss_START);
    }
    segment_anime_c_VRAM_END = .;

    segment_anime_d_ROM_START = __romPos;
    segment_anime_d_VRAM = ADDR(.segment_anime_d);
    .segment_anime_d 0x00000000 : AT(segment_anime_d_ROM_START)
    {
        segment_anime_d_text_START = .;
        build/us/src/assets/anime/anime_d.o(.text);
        segment_anime_d_text_END = .;
        segment_anime_d_text_SIZE = ABSOLUTE(segment_anime_d_text_END - segment_anime_d_text_START);
        segment_anime_d_data_START = .;
        build/us/src/assets/anime/anime_d.o(.data);
        segment_anime_d_data_END = .;
        segment_anime_d_data_SIZE = ABSOLUTE(segment_anime_d_data_END - segment_anime_d_data_START);
        segment_anime_d_rodata_START = .;
        build/us/src/assets/anime/anime_d.o(.rodata);
        segment_anime_d_rodata_END = .;
        segment_anime_d_rodata_SIZE = ABSOLUTE(segment_anime_d_rodata_END - segment_anime_d_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_d);
    segment_anime_d_ROM_END = __romPos;
    .segment_anime_d (NOLOAD) :
    {
        segment_anime_d_bss_START = .;
        build/us/src/assets/anime/anime_d.o(.sbss);
        build/us/src/assets/anime/anime_d.o(.scommon);
        build/us/src/assets/anime/anime_d.o(.bss);
        build/us/src/assets/anime/anime_d.o(COMMON);
        segment_anime_d_bss_END = .;
        segment_anime_d_bss_SIZE = ABSOLUTE(segment_anime_d_bss_END - segment_anime_d_bss_START);
    }
    segment_anime_d_VRAM_END = .;

    segment_anime_e_ROM_START = __romPos;
    segment_anime_e_VRAM = ADDR(.segment_anime_e);
    .segment_anime_e 0x00000000 : AT(segment_anime_e_ROM_START)
    {
        segment_anime_e_text_START = .;
        build/us/src/assets/anime/anime_e.o(.text);
        segment_anime_e_text_END = .;
        segment_anime_e_text_SIZE = ABSOLUTE(segment_anime_e_text_END - segment_anime_e_text_START);
        segment_anime_e_data_START = .;
        build/us/src/assets/anime/anime_e.o(.data);
        segment_anime_e_data_END = .;
        segment_anime_e_data_SIZE = ABSOLUTE(segment_anime_e_data_END - segment_anime_e_data_START);
        segment_anime_e_rodata_START = .;
        build/us/src/assets/anime/anime_e.o(.rodata);
        segment_anime_e_rodata_END = .;
        segment_anime_e_rodata_SIZE = ABSOLUTE(segment_anime_e_rodata_END - segment_anime_e_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_e);
    segment_anime_e_ROM_END = __romPos;
    .segment_anime_e (NOLOAD) :
    {
        segment_anime_e_bss_START = .;
        build/us/src/assets/anime/anime_e.o(.sbss);
        build/us/src/assets/anime/anime_e.o(.scommon);
        build/us/src/assets/anime/anime_e.o(.bss);
        build/us/src/assets/anime/anime_e.o(COMMON);
        segment_anime_e_bss_END = .;
        segment_anime_e_bss_SIZE = ABSOLUTE(segment_anime_e_bss_END - segment_anime_e_bss_START);
    }
    segment_anime_e_VRAM_END = .;

    segment_anime_f_ROM_START = __romPos;
    segment_anime_f_VRAM = ADDR(.segment_anime_f);
    .segment_anime_f 0x00000000 : AT(segment_anime_f_ROM_START)
    {
        segment_anime_f_text_START = .;
        build/us/src/assets/anime/anime_f.o(.text);
        segment_anime_f_text_END = .;
        segment_anime_f_text_SIZE = ABSOLUTE(segment_anime_f_text_END - segment_anime_f_text_START);
        segment_anime_f_data_START = .;
        build/us/src/assets/anime/anime_f.o(.data);
        segment_anime_f_data_END = .;
        segment_anime_f_data_SIZE = ABSOLUTE(segment_anime_f_data_END - segment_anime_f_data_START);
        segment_anime_f_rodata_START = .;
        build/us/src/assets/anime/anime_f.o(.rodata);
        segment_anime_f_rodata_END = .;
        segment_anime_f_rodata_SIZE = ABSOLUTE(segment_anime_f_rodata_END - segment_anime_f_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_f);
    segment_anime_f_ROM_END = __romPos;
    .segment_anime_f (NOLOAD) :
    {
        segment_anime_f_bss_START = .;
        build/us/src/assets/anime/anime_f.o(.sbss);
        build/us/src/assets/anime/anime_f.o(.scommon);
        build/us/src/assets/anime/anime_f.o(.bss);
        build/us/src/assets/anime/anime_f.o(COMMON);
        segment_anime_f_bss_END = .;
        segment_anime_f_bss_SIZE = ABSOLUTE(segment_anime_f_bss_END - segment_anime_f_bss_START);
    }
    segment_anime_f_VRAM_END = .;

    segment_anime_g_ROM_START = __romPos;
    segment_anime_g_VRAM = ADDR(.segment_anime_g);
    .segment_anime_g 0x00000000 : AT(segment_anime_g_ROM_START)
    {
        segment_anime_g_text_START = .;
        build/us/src/assets/anime/anime_g.o(.text);
        segment_anime_g_text_END = .;
        segment_anime_g_text_SIZE = ABSOLUTE(segment_anime_g_text_END - segment_anime_g_text_START);
        segment_anime_g_data_START = .;
        build/us/src/assets/anime/anime_g.o(.data);
        segment_anime_g_data_END = .;
        segment_anime_g_data_SIZE = ABSOLUTE(segment_anime_g_data_END - segment_anime_g_data_START);
        segment_anime_g_rodata_START = .;
        build/us/src/assets/anime/anime_g.o(.rodata);
        segment_anime_g_rodata_END = .;
        segment_anime_g_rodata_SIZE = ABSOLUTE(segment_anime_g_rodata_END - segment_anime_g_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_g);
    segment_anime_g_ROM_END = __romPos;
    .segment_anime_g (NOLOAD) :
    {
        segment_anime_g_bss_START = .;
        build/us/src/assets/anime/anime_g.o(.sbss);
        build/us/src/assets/anime/anime_g.o(.scommon);
        build/us/src/assets/anime/anime_g.o(.bss);
        build/us/src/assets/anime/anime_g.o(COMMON);
        segment_anime_g_bss_END = .;
        segment_anime_g_bss_SIZE = ABSOLUTE(segment_anime_g_bss_END - segment_anime_g_bss_START);
    }
    segment_anime_g_VRAM_END = .;

    segment_anime_h_ROM_START = __romPos;
    segment_anime_h_VRAM = ADDR(.segment_anime_h);
    .segment_anime_h 0x00000000 : AT(segment_anime_h_ROM_START)
    {
        segment_anime_h_text_START = .;
        build/us/src/assets/anime/anime_h.o(.text);
        segment_anime_h_text_END = .;
        segment_anime_h_text_SIZE = ABSOLUTE(segment_anime_h_text_END - segment_anime_h_text_START);
        segment_anime_h_data_START = .;
        build/us/src/assets/anime/anime_h.o(.data);
        segment_anime_h_data_END = .;
        segment_anime_h_data_SIZE = ABSOLUTE(segment_anime_h_data_END - segment_anime_h_data_START);
        segment_anime_h_rodata_START = .;
        build/us/src/assets/anime/anime_h.o(.rodata);
        segment_anime_h_rodata_END = .;
        segment_anime_h_rodata_SIZE = ABSOLUTE(segment_anime_h_rodata_END - segment_anime_h_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_h);
    segment_anime_h_ROM_END = __romPos;
    .segment_anime_h (NOLOAD) :
    {
        segment_anime_h_bss_START = .;
        build/us/src/assets/anime/anime_h.o(.sbss);
        build/us/src/assets/anime/anime_h.o(.scommon);
        build/us/src/assets/anime/anime_h.o(.bss);
        build/us/src/assets/anime/anime_h.o(COMMON);
        segment_anime_h_bss_END = .;
        segment_anime_h_bss_SIZE = ABSOLUTE(segment_anime_h_bss_END - segment_anime_h_bss_START);
    }
    segment_anime_h_VRAM_END = .;

    segment_anime_i_ROM_START = __romPos;
    segment_anime_i_VRAM = ADDR(.segment_anime_i);
    .segment_anime_i 0x00000000 : AT(segment_anime_i_ROM_START)
    {
        segment_anime_i_text_START = .;
        build/us/src/assets/anime/anime_i.o(.text);
        segment_anime_i_text_END = .;
        segment_anime_i_text_SIZE = ABSOLUTE(segment_anime_i_text_END - segment_anime_i_text_START);
        segment_anime_i_data_START = .;
        build/us/src/assets/anime/anime_i.o(.data);
        segment_anime_i_data_END = .;
        segment_anime_i_data_SIZE = ABSOLUTE(segment_anime_i_data_END - segment_anime_i_data_START);
        segment_anime_i_rodata_START = .;
        build/us/src/assets/anime/anime_i.o(.rodata);
        segment_anime_i_rodata_END = .;
        segment_anime_i_rodata_SIZE = ABSOLUTE(segment_anime_i_rodata_END - segment_anime_i_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_i);
    segment_anime_i_ROM_END = __romPos;
    .segment_anime_i (NOLOAD) :
    {
        segment_anime_i_bss_START = .;
        build/us/src/assets/anime/anime_i.o(.sbss);
        build/us/src/assets/anime/anime_i.o(.scommon);
        build/us/src/assets/anime/anime_i.o(.bss);
        build/us/src/assets/anime/anime_i.o(COMMON);
        segment_anime_i_bss_END = .;
        segment_anime_i_bss_SIZE = ABSOLUTE(segment_anime_i_bss_END - segment_anime_i_bss_START);
    }
    segment_anime_i_VRAM_END = .;

    segment_anime_j_ROM_START = __romPos;
    segment_anime_j_VRAM = ADDR(.segment_anime_j);
    .segment_anime_j 0x00000000 : AT(segment_anime_j_ROM_START)
    {
        segment_anime_j_text_START = .;
        build/us/src/assets/anime/anime_j.o(.text);
        segment_anime_j_text_END = .;
        segment_anime_j_text_SIZE = ABSOLUTE(segment_anime_j_text_END - segment_anime_j_text_START);
        segment_anime_j_data_START = .;
        build/us/src/assets/anime/anime_j.o(.data);
        segment_anime_j_data_END = .;
        segment_anime_j_data_SIZE = ABSOLUTE(segment_anime_j_data_END - segment_anime_j_data_START);
        segment_anime_j_rodata_START = .;
        build/us/src/assets/anime/anime_j.o(.rodata);
        segment_anime_j_rodata_END = .;
        segment_anime_j_rodata_SIZE = ABSOLUTE(segment_anime_j_rodata_END - segment_anime_j_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_j);
    segment_anime_j_ROM_END = __romPos;
    .segment_anime_j (NOLOAD) :
    {
        segment_anime_j_bss_START = .;
        build/us/src/assets/anime/anime_j.o(.sbss);
        build/us/src/assets/anime/anime_j.o(.scommon);
        build/us/src/assets/anime/anime_j.o(.bss);
        build/us/src/assets/anime/anime_j.o(COMMON);
        segment_anime_j_bss_END = .;
        segment_anime_j_bss_SIZE = ABSOLUTE(segment_anime_j_bss_END - segment_anime_j_bss_START);
    }
    segment_anime_j_VRAM_END = .;

    segment_anime_k_ROM_START = __romPos;
    segment_anime_k_VRAM = ADDR(.segment_anime_k);
    .segment_anime_k 0x00000000 : AT(segment_anime_k_ROM_START)
    {
        segment_anime_k_text_START = .;
        build/us/src/assets/anime/anime_k.o(.text);
        segment_anime_k_text_END = .;
        segment_anime_k_text_SIZE = ABSOLUTE(segment_anime_k_text_END - segment_anime_k_text_START);
        segment_anime_k_data_START = .;
        build/us/src/assets/anime/anime_k.o(.data);
        segment_anime_k_data_END = .;
        segment_anime_k_data_SIZE = ABSOLUTE(segment_anime_k_data_END - segment_anime_k_data_START);
        segment_anime_k_rodata_START = .;
        build/us/src/assets/anime/anime_k.o(.rodata);
        segment_anime_k_rodata_END = .;
        segment_anime_k_rodata_SIZE = ABSOLUTE(segment_anime_k_rodata_END - segment_anime_k_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_k);
    segment_anime_k_ROM_END = __romPos;
    .segment_anime_k (NOLOAD) :
    {
        segment_anime_k_bss_START = .;
        build/us/src/assets/anime/anime_k.o(.sbss);
        build/us/src/assets/anime/anime_k.o(.scommon);
        build/us/src/assets/anime/anime_k.o(.bss);
        build/us/src/assets/anime/anime_k.o(COMMON);
        segment_anime_k_bss_END = .;
        segment_anime_k_bss_SIZE = ABSOLUTE(segment_anime_k_bss_END - segment_anime_k_bss_START);
    }
    segment_anime_k_VRAM_END = .;

    segment_anime_l_ROM_START = __romPos;
    segment_anime_l_VRAM = ADDR(.segment_anime_l);
    .segment_anime_l 0x00000000 : AT(segment_anime_l_ROM_START)
    {
        segment_anime_l_text_START = .;
        build/us/src/assets/anime/anime_l.o(.text);
        segment_anime_l_text_END = .;
        segment_anime_l_text_SIZE = ABSOLUTE(segment_anime_l_text_END - segment_anime_l_text_START);
        segment_anime_l_data_START = .;
        build/us/src/assets/anime/anime_l.o(.data);
        segment_anime_l_data_END = .;
        segment_anime_l_data_SIZE = ABSOLUTE(segment_anime_l_data_END - segment_anime_l_data_START);
        segment_anime_l_rodata_START = .;
        build/us/src/assets/anime/anime_l.o(.rodata);
        segment_anime_l_rodata_END = .;
        segment_anime_l_rodata_SIZE = ABSOLUTE(segment_anime_l_rodata_END - segment_anime_l_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_l);
    segment_anime_l_ROM_END = __romPos;
    .segment_anime_l (NOLOAD) :
    {
        segment_anime_l_bss_START = .;
        build/us/src/assets/anime/anime_l.o(.sbss);
        build/us/src/assets/anime/anime_l.o(.scommon);
        build/us/src/assets/anime/anime_l.o(.bss);
        build/us/src/assets/anime/anime_l.o(COMMON);
        segment_anime_l_bss_END = .;
        segment_anime_l_bss_SIZE = ABSOLUTE(segment_anime_l_bss_END - segment_anime_l_bss_START);
    }
    segment_anime_l_VRAM_END = .;

    segment_anime_m_ROM_START = __romPos;
    segment_anime_m_VRAM = ADDR(.segment_anime_m);
    .segment_anime_m 0x00000000 : AT(segment_anime_m_ROM_START)
    {
        segment_anime_m_text_START = .;
        build/us/src/assets/anime/anime_m.o(.text);
        segment_anime_m_text_END = .;
        segment_anime_m_text_SIZE = ABSOLUTE(segment_anime_m_text_END - segment_anime_m_text_START);
        segment_anime_m_data_START = .;
        build/us/src/assets/anime/anime_m.o(.data);
        segment_anime_m_data_END = .;
        segment_anime_m_data_SIZE = ABSOLUTE(segment_anime_m_data_END - segment_anime_m_data_START);
        segment_anime_m_rodata_START = .;
        build/us/src/assets/anime/anime_m.o(.rodata);
        segment_anime_m_rodata_END = .;
        segment_anime_m_rodata_SIZE = ABSOLUTE(segment_anime_m_rodata_END - segment_anime_m_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_m);
    segment_anime_m_ROM_END = __romPos;
    .segment_anime_m (NOLOAD) :
    {
        segment_anime_m_bss_START = .;
        build/us/src/assets/anime/anime_m.o(.sbss);
        build/us/src/assets/anime/anime_m.o(.scommon);
        build/us/src/assets/anime/anime_m.o(.bss);
        build/us/src/assets/anime/anime_m.o(COMMON);
        segment_anime_m_bss_END = .;
        segment_anime_m_bss_SIZE = ABSOLUTE(segment_anime_m_bss_END - segment_anime_m_bss_START);
    }
    segment_anime_m_VRAM_END = .;

    segment_anime_n_ROM_START = __romPos;
    segment_anime_n_VRAM = ADDR(.segment_anime_n);
    .segment_anime_n 0x00000000 : AT(segment_anime_n_ROM_START)
    {
        segment_anime_n_text_START = .;
        build/us/src/assets/anime/anime_n.o(.text);
        segment_anime_n_text_END = .;
        segment_anime_n_text_SIZE = ABSOLUTE(segment_anime_n_text_END - segment_anime_n_text_START);
        segment_anime_n_data_START = .;
        build/us/src/assets/anime/anime_n.o(.data);
        segment_anime_n_data_END = .;
        segment_anime_n_data_SIZE = ABSOLUTE(segment_anime_n_data_END - segment_anime_n_data_START);
        segment_anime_n_rodata_START = .;
        build/us/src/assets/anime/anime_n.o(.rodata);
        segment_anime_n_rodata_END = .;
        segment_anime_n_rodata_SIZE = ABSOLUTE(segment_anime_n_rodata_END - segment_anime_n_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_n);
    segment_anime_n_ROM_END = __romPos;
    .segment_anime_n (NOLOAD) :
    {
        segment_anime_n_bss_START = .;
        build/us/src/assets/anime/anime_n.o(.sbss);
        build/us/src/assets/anime/anime_n.o(.scommon);
        build/us/src/assets/anime/anime_n.o(.bss);
        build/us/src/assets/anime/anime_n.o(COMMON);
        segment_anime_n_bss_END = .;
        segment_anime_n_bss_SIZE = ABSOLUTE(segment_anime_n_bss_END - segment_anime_n_bss_START);
    }
    segment_anime_n_VRAM_END = .;

    segment_anime_o_ROM_START = __romPos;
    segment_anime_o_VRAM = ADDR(.segment_anime_o);
    .segment_anime_o 0x00000000 : AT(segment_anime_o_ROM_START)
    {
        segment_anime_o_text_START = .;
        build/us/src/assets/anime/anime_o.o(.text);
        segment_anime_o_text_END = .;
        segment_anime_o_text_SIZE = ABSOLUTE(segment_anime_o_text_END - segment_anime_o_text_START);
        segment_anime_o_data_START = .;
        build/us/src/assets/anime/anime_o.o(.data);
        segment_anime_o_data_END = .;
        segment_anime_o_data_SIZE = ABSOLUTE(segment_anime_o_data_END - segment_anime_o_data_START);
        segment_anime_o_rodata_START = .;
        build/us/src/assets/anime/anime_o.o(.rodata);
        segment_anime_o_rodata_END = .;
        segment_anime_o_rodata_SIZE = ABSOLUTE(segment_anime_o_rodata_END - segment_anime_o_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_o);
    segment_anime_o_ROM_END = __romPos;
    .segment_anime_o (NOLOAD) :
    {
        segment_anime_o_bss_START = .;
        build/us/src/assets/anime/anime_o.o(.sbss);
        build/us/src/assets/anime/anime_o.o(.scommon);
        build/us/src/assets/anime/anime_o.o(.bss);
        build/us/src/assets/anime/anime_o.o(COMMON);
        segment_anime_o_bss_END = .;
        segment_anime_o_bss_SIZE = ABSOLUTE(segment_anime_o_bss_END - segment_anime_o_bss_START);
    }
    segment_anime_o_VRAM_END = .;

    segment_anime_mario_ROM_START = __romPos;
    segment_anime_mario_VRAM = ADDR(.segment_anime_mario);
    .segment_anime_mario 0x00000000 : AT(segment_anime_mario_ROM_START)
    {
        segment_anime_mario_text_START = .;
        build/us/src/assets/anime/anime_mario.o(.text);
        segment_anime_mario_text_END = .;
        segment_anime_mario_text_SIZE = ABSOLUTE(segment_anime_mario_text_END - segment_anime_mario_text_START);
        segment_anime_mario_data_START = .;
        build/us/src/assets/anime/anime_mario.o(.data);
        segment_anime_mario_data_END = .;
        segment_anime_mario_data_SIZE = ABSOLUTE(segment_anime_mario_data_END - segment_anime_mario_data_START);
        segment_anime_mario_rodata_START = .;
        build/us/src/assets/anime/anime_mario.o(.rodata);
        segment_anime_mario_rodata_END = .;
        segment_anime_mario_rodata_SIZE = ABSOLUTE(segment_anime_mario_rodata_END - segment_anime_mario_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_mario);
    segment_anime_mario_ROM_END = __romPos;
    .segment_anime_mario (NOLOAD) :
    {
        segment_anime_mario_bss_START = .;
        build/us/src/assets/anime/anime_mario.o(.sbss);
        build/us/src/assets/anime/anime_mario.o(.scommon);
        build/us/src/assets/anime/anime_mario.o(.bss);
        build/us/src/assets/anime/anime_mario.o(COMMON);
        segment_anime_mario_bss_END = .;
        segment_anime_mario_bss_SIZE = ABSOLUTE(segment_anime_mario_bss_END - segment_anime_mario_bss_START);
    }
    segment_anime_mario_VRAM_END = .;

    segment_anime_virus_b_ROM_START = __romPos;
    segment_anime_virus_b_VRAM = ADDR(.segment_anime_virus_b);
    .segment_anime_virus_b 0x00000000 : AT(segment_anime_virus_b_ROM_START)
    {
        segment_anime_virus_b_text_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.text);
        segment_anime_virus_b_text_END = .;
        segment_anime_virus_b_text_SIZE = ABSOLUTE(segment_anime_virus_b_text_END - segment_anime_virus_b_text_START);
        segment_anime_virus_b_data_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.data);
        segment_anime_virus_b_data_END = .;
        segment_anime_virus_b_data_SIZE = ABSOLUTE(segment_anime_virus_b_data_END - segment_anime_virus_b_data_START);
        segment_anime_virus_b_rodata_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.rodata);
        segment_anime_virus_b_rodata_END = .;
        segment_anime_virus_b_rodata_SIZE = ABSOLUTE(segment_anime_virus_b_rodata_END - segment_anime_virus_b_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_virus_b);
    segment_anime_virus_b_ROM_END = __romPos;
    .segment_anime_virus_b (NOLOAD) :
    {
        segment_anime_virus_b_bss_START = .;
        build/us/src/assets/anime/anime_virus_b.o(.sbss);
        build/us/src/assets/anime/anime_virus_b.o(.scommon);
        build/us/src/assets/anime/anime_virus_b.o(.bss);
        build/us/src/assets/anime/anime_virus_b.o(COMMON);
        segment_anime_virus_b_bss_END = .;
        segment_anime_virus_b_bss_SIZE = ABSOLUTE(segment_anime_virus_b_bss_END - segment_anime_virus_b_bss_START);
    }
    segment_anime_virus_b_VRAM_END = .;

    segment_anime_virus_r_ROM_START = __romPos;
    segment_anime_virus_r_VRAM = ADDR(.segment_anime_virus_r);
    .segment_anime_virus_r 0x00000000 : AT(segment_anime_virus_r_ROM_START)
    {
        segment_anime_virus_r_text_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.text);
        segment_anime_virus_r_text_END = .;
        segment_anime_virus_r_text_SIZE = ABSOLUTE(segment_anime_virus_r_text_END - segment_anime_virus_r_text_START);
        segment_anime_virus_r_data_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.data);
        segment_anime_virus_r_data_END = .;
        segment_anime_virus_r_data_SIZE = ABSOLUTE(segment_anime_virus_r_data_END - segment_anime_virus_r_data_START);
        segment_anime_virus_r_rodata_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.rodata);
        segment_anime_virus_r_rodata_END = .;
        segment_anime_virus_r_rodata_SIZE = ABSOLUTE(segment_anime_virus_r_rodata_END - segment_anime_virus_r_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_virus_r);
    segment_anime_virus_r_ROM_END = __romPos;
    .segment_anime_virus_r (NOLOAD) :
    {
        segment_anime_virus_r_bss_START = .;
        build/us/src/assets/anime/anime_virus_r.o(.sbss);
        build/us/src/assets/anime/anime_virus_r.o(.scommon);
        build/us/src/assets/anime/anime_virus_r.o(.bss);
        build/us/src/assets/anime/anime_virus_r.o(COMMON);
        segment_anime_virus_r_bss_END = .;
        segment_anime_virus_r_bss_SIZE = ABSOLUTE(segment_anime_virus_r_bss_END - segment_anime_virus_r_bss_START);
    }
    segment_anime_virus_r_VRAM_END = .;

    segment_anime_virus_y_ROM_START = __romPos;
    segment_anime_virus_y_VRAM = ADDR(.segment_anime_virus_y);
    .segment_anime_virus_y 0x00000000 : AT(segment_anime_virus_y_ROM_START)
    {
        segment_anime_virus_y_text_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.text);
        segment_anime_virus_y_text_END = .;
        segment_anime_virus_y_text_SIZE = ABSOLUTE(segment_anime_virus_y_text_END - segment_anime_virus_y_text_START);
        segment_anime_virus_y_data_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.data);
        segment_anime_virus_y_data_END = .;
        segment_anime_virus_y_data_SIZE = ABSOLUTE(segment_anime_virus_y_data_END - segment_anime_virus_y_data_START);
        segment_anime_virus_y_rodata_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.rodata);
        segment_anime_virus_y_rodata_END = .;
        segment_anime_virus_y_rodata_SIZE = ABSOLUTE(segment_anime_virus_y_rodata_END - segment_anime_virus_y_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_virus_y);
    segment_anime_virus_y_ROM_END = __romPos;
    .segment_anime_virus_y (NOLOAD) :
    {
        segment_anime_virus_y_bss_START = .;
        build/us/src/assets/anime/anime_virus_y.o(.sbss);
        build/us/src/assets/anime/anime_virus_y.o(.scommon);
        build/us/src/assets/anime/anime_virus_y.o(.bss);
        build/us/src/assets/anime/anime_virus_y.o(COMMON);
        segment_anime_virus_y_bss_END = .;
        segment_anime_virus_y_bss_SIZE = ABSOLUTE(segment_anime_virus_y_bss_END - segment_anime_virus_y_bss_START);
    }
    segment_anime_virus_y_VRAM_END = .;

    segment_anime_smog_ROM_START = __romPos;
    segment_anime_smog_VRAM = ADDR(.segment_anime_smog);
    .segment_anime_smog 0x00000000 : AT(segment_anime_smog_ROM_START)
    {
        segment_anime_smog_text_START = .;
        build/us/src/assets/anime/anime_smog.o(.text);
        segment_anime_smog_text_END = .;
        segment_anime_smog_text_SIZE = ABSOLUTE(segment_anime_smog_text_END - segment_anime_smog_text_START);
        segment_anime_smog_data_START = .;
        build/us/src/assets/anime/anime_smog.o(.data);
        segment_anime_smog_data_END = .;
        segment_anime_smog_data_SIZE = ABSOLUTE(segment_anime_smog_data_END - segment_anime_smog_data_START);
        segment_anime_smog_rodata_START = .;
        build/us/src/assets/anime/anime_smog.o(.rodata);
        segment_anime_smog_rodata_END = .;
        segment_anime_smog_rodata_SIZE = ABSOLUTE(segment_anime_smog_rodata_END - segment_anime_smog_rodata_START);
    }
    __romPos += SIZEOF(.segment_anime_smog);
    segment_anime_smog_ROM_END = __romPos;
    .segment_anime_smog (NOLOAD) :
    {
        segment_anime_smog_bss_START = .;
        build/us/src/assets/anime/anime_smog.o(.sbss);
        build/us/src/assets/anime/anime_smog.o(.scommon);
        build/us/src/assets/anime/anime_smog.o(.bss);
        build/us/src/assets/anime/anime_smog.o(COMMON);
        segment_anime_smog_bss_END = .;
        segment_anime_smog_bss_SIZE = ABSOLUTE(segment_anime_smog_bss_END - segment_anime_smog_bss_START);
    }
    segment_anime_smog_VRAM_END = .;

    segment_tutorial_data_ROM_START = __romPos;
    segment_tutorial_data_VRAM = ADDR(.segment_tutorial_data);
    .segment_tutorial_data 0x00000000 : AT(segment_tutorial_data_ROM_START)
    {
        segment_tutorial_data_text_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.text);
        segment_tutorial_data_text_END = .;
        segment_tutorial_data_text_SIZE = ABSOLUTE(segment_tutorial_data_text_END - segment_tutorial_data_text_START);
        segment_tutorial_data_data_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.data);
        segment_tutorial_data_data_END = .;
        segment_tutorial_data_data_SIZE = ABSOLUTE(segment_tutorial_data_data_END - segment_tutorial_data_data_START);
        segment_tutorial_data_rodata_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.rodata);
        segment_tutorial_data_rodata_END = .;
        segment_tutorial_data_rodata_SIZE = ABSOLUTE(segment_tutorial_data_rodata_END - segment_tutorial_data_rodata_START);
    }
    __romPos += SIZEOF(.segment_tutorial_data);
    segment_tutorial_data_ROM_END = __romPos;
    .segment_tutorial_data (NOLOAD) :
    {
        segment_tutorial_data_bss_START = .;
        build/us/src/assets/tutorial/tutorial_kasa.o(.sbss);
        build/us/src/assets/tutorial/tutorial_kasa.o(.scommon);
        build/us/src/assets/tutorial/tutorial_kasa.o(.bss);
        build/us/src/assets/tutorial/tutorial_kasa.o(COMMON);
        segment_tutorial_data_bss_END = .;
        segment_tutorial_data_bss_SIZE = ABSOLUTE(segment_tutorial_data_bss_END - segment_tutorial_data_bss_START);
    }
    segment_tutorial_data_VRAM_END = .;

}
