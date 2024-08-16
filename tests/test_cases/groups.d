build/rom.elf: \
    build/src/rom_header/rom_header.o \
    build/asm/data/ipl3.o \
    build/src/entry/entry.o \
    build/src/boot/boot_main.o \
    build/src/boot/util.o \
    build/src/libultra/io/conteepprobe.o \
    build/src/libultra/io/conteeplongwrite.o \
    build/src/libultra/io/conteeplongread.o \
    build/src/libultra/io/pimgr.o \
    build/src/libultra/io/epirawdma.o \
    build/src/libultra/io/epidma.o \
    build/src/libultra/io/cartrominit.o \
    build/src/libultra/io/devmgr.o \
    build/src/libultra/io/piacs.o \
    build/src/libultra/io/pidma.o \
    build/src/libultra/io/aigetlen.o \
    build/src/libultra/io/aigetstat.o \
    build/src/libultra/io/aisetfreq.o \
    build/src/libultra/io/aisetnextbuf.o \
    build/src/libultra/audio/env.o \
    build/src/libultra/audio/sl.o \
    build/src/libultra/audio/heapinit.o \
    build/src/libultra/audio/synthesizer.o \
    build/src/libultra/audio/syndelete.o \
    build/src/libultra/audio/synaddplayer.o \
    build/src/libultra/audio/synallocvoice.o \
    build/src/libultra/audio/synstopvoice.o \
    build/src/libultra/audio/synstartvoice.o \
    build/src/libultra/audio/synsetpitch.o \
    build/src/libultra/audio/synsetvol.o \
    build/src/libultra/audio/synsetfxmix.o \
    build/src/libultra/audio/synsetpan.o \
    build/src/libultra/audio/synallocfx.o \
    build/src/libultra/os/invaldcache.o \
    build/src/libultra/os/writebackdcacheall.o \
    build/src/libultra/io/contquery.o \
    build/src/libultra/io/contreaddata.o \
    build/src/libultra/io/controller.o \
    build/src/libultra/io/contsetch.o \
    build/src/libultra/os/virtualtophysical.o \
    build/src/libultra/gu/sqrtf.o \
    build/src/libultra/gu/cosf.o \
    build/src/libultra/gu/ortho.o \
    build/src/libultra/gu/perspective.o \
    build/src/libultra/gu/rotaterpy.o \
    build/src/libultra/gu/sinf.o \
    build/src/libultra/gu/sins.o \
    build/src/libultra/libc/bcmp.o \
    build/src/libultra/libc/bcopy.o \
    build/src/libultra/libc/bzero.o \
    build/src/libultra/libc/string.o \
    build/src/libultra/os/createmesgqueue.o \
    build/src/libultra/os/jammesg.o \
    build/src/libultra/os/recvmesg.o \
    build/src/libultra/os/sendmesg.o \
    build/src/libultra/os/seteventmesg.o \
    build/src/libultra/io/sptask.o \
    build/src/libultra/io/sptaskyield.o \
    build/src/libultra/io/sptaskyielded.o \
    build/src/libultra/sched/sched.o \
    build/src/libultra/io/sirawdma.o \
    build/src/libultra/io/siacs.o \
    build/src/libultra/os/createthread.o \
    build/src/libultra/os/getthreadpri.o \
    build/src/libultra/os/setthreadpri.o \
    build/src/libultra/os/startthread.o \
    build/src/libultra/os/stopthread.o \
    build/src/libultra/os/thread.o \
    build/src/libultra/os/yieldthread.o \
    build/src/libultra/os/gettime.o \
    build/src/libultra/os/settime.o \
    build/src/libultra/os/settimer.o \
    build/src/libultra/os/timerintr.o \
    build/src/libultra/os/probetlb.o \
    build/src/libultra/io/vigetcurrframebuf.o \
    build/src/libultra/io/vigetnextframebuf.o \
    build/src/libultra/io/vimgr.o \
    build/src/libultra/io/vitbl.o \
    build/src/libultra/io/visetevent.o \
    build/src/libultra/io/visetmode.o \
    build/src/libultra/io/visetspecial.o \
    build/src/libultra/io/visetyscale.o \
    build/src/libultra/io/viswapbuf.o \
    build/src/libultra/io/viswapcontext.o \
    build/src/libultra/io/viblack.o \
    build/src/libultra/mgu/mtxident.o \
    build/src/libultra/mgu/mtxidentf.o \
    build/src/libultra/mgu/mtxf2l.o \
    build/src/libultra/mgu/mtxl2f.o \
    build/src/libultra/mgu/mtxcatf.o \
    build/src/libultra/mgu/scale.o \
    build/src/libultra/mgu/scalef.o \
    build/src/libultra/mgu/translate.o \
    build/src/libultra/mgu/translatef.o \
    build/src/libultra/os/initialize.o \
    build/src/libultra/io/conteepread.o \
    build/src/libultra/io/conteepwrite.o \
    build/src/libultra/os/exceptasm.o \
    build/src/libultra/os/interrupt.o \
    build/src/libultra/os/setintmask.o \
    build/src/libultra/os/setglobalintmask.o \
    build/src/libultra/os/resetglobalintmask.o \
    build/src/libultra/io/pirawdma.o \
    build/src/libultra/io/pigetcmdq.o \
    build/src/libultra/io/epirawread.o \
    build/src/libultra/io/epirawwrite.o \
    build/src/libultra/io/ai.o \
    build/src/libultra/audio/drvrnew.o \
    build/src/libultra/audio/load.o \
    build/src/libultra/audio/auxbus.o \
    build/src/libultra/audio/filter.o \
    build/src/libultra/audio/mainbus.o \
    build/src/libultra/audio/resample.o \
    build/src/libultra/audio/reverb.o \
    build/src/libultra/audio/save.o \
    build/src/libultra/audio/heapalloc.o \
    build/src/libultra/audio/copy.o \
    build/src/libultra/os/invalicache.o \
    build/src/libultra/os/writebackdcache.o \
    build/src/libultra/io/dpsetnextbuf.o \
    build/src/libultra/os/getcause.o \
    build/src/libultra/os/getcount.o \
    build/src/libultra/os/getsr.o \
    build/src/libultra/os/setcompare.o \
    build/src/libultra/os/setfpccsr.o \
    build/src/libultra/os/setsr.o \
    build/src/libultra/os/setwatchlo.o \
    build/src/libultra/io/sp.o \
    build/src/libultra/io/spgetstat.o \
    build/src/libultra/io/spsetstat.o \
    build/src/libultra/io/spsetpc.o \
    build/src/libultra/io/sprawdma.o \
    build/src/libultra/io/sirawread.o \
    build/src/libultra/io/sirawwrite.o \
    build/src/libultra/os/destroythread.o \
    build/src/libultra/os/maptlbrdb.o \
    build/src/libultra/os/unmaptlball.o \
    build/src/libultra/io/vi.o \
    build/src/libultra/io/vigetcurrcontext.o \
    build/src/libultra/vimodes/vimodentsclan1.o \
    build/src/libultra/vimodes/vimodepallan1.o \
    build/src/libultra/vimodes/vimodempallan1.o \
    build/src/libultra/os/parameters.o \
    build/src/libultra/gu/libm_vals.o \
    build/src/libultra/io/dp.o \
    build/src/libultra/io/si.o \
    build/src/libkmc/fmod.o \
    build/src/libkmc/memmove.o \
    build/src/libkmc/memset.o \
    build/src/libkmc/modf.o \
    build/src/libkmc/rand.o \
    build/src/libkmc/strcpy.o \
    build/src/libkmc/mmuldi3.o \
    build/src/libkmc/ctype.o \
    build/src/dma_table/dma_table.o \
    build/src/main_segment/main.o \
    build/src/main_segment/nnsched.o \
    build/src/main_segment/joy.o \
    build/src/libmus/player.o \
    build/src/libmus/player_fx.o \
    build/src/libmus/aud_dma.o \
    build/src/libmus/aud_sched.o \
    build/src/libmus/aud_thread.o \
    build/src/libmus/lib_memory.o \
    build/src/libmus/aud_samples.o \
    build/src/rsp/rspboot.o \
    build/src/rsp/aspMain.o \
    build/src/rsp/f3dex2.o \
    build/src/rsp/s2dex.o \
    build/src/stufsh/thingy1.o \
    build/src/stufsh/thingy2.o \
    build/src/stufsh/thonga3.o \
    build/src/stufsh/capy4.o \
    build/src/stufsh/placeholder5.o \
    build/src/stufsh/idk6.o \
    build/src/stufsh/another7.o \
    build/src/buffers/framebuffer.o

build/src/rom_header/rom_header.o:
build/asm/data/ipl3.o:
build/src/entry/entry.o:
build/src/boot/boot_main.o:
build/src/boot/util.o:
build/src/libultra/io/conteepprobe.o:
build/src/libultra/io/conteeplongwrite.o:
build/src/libultra/io/conteeplongread.o:
build/src/libultra/io/pimgr.o:
build/src/libultra/io/epirawdma.o:
build/src/libultra/io/epidma.o:
build/src/libultra/io/cartrominit.o:
build/src/libultra/io/devmgr.o:
build/src/libultra/io/piacs.o:
build/src/libultra/io/pidma.o:
build/src/libultra/io/aigetlen.o:
build/src/libultra/io/aigetstat.o:
build/src/libultra/io/aisetfreq.o:
build/src/libultra/io/aisetnextbuf.o:
build/src/libultra/audio/env.o:
build/src/libultra/audio/sl.o:
build/src/libultra/audio/heapinit.o:
build/src/libultra/audio/synthesizer.o:
build/src/libultra/audio/syndelete.o:
build/src/libultra/audio/synaddplayer.o:
build/src/libultra/audio/synallocvoice.o:
build/src/libultra/audio/synstopvoice.o:
build/src/libultra/audio/synstartvoice.o:
build/src/libultra/audio/synsetpitch.o:
build/src/libultra/audio/synsetvol.o:
build/src/libultra/audio/synsetfxmix.o:
build/src/libultra/audio/synsetpan.o:
build/src/libultra/audio/synallocfx.o:
build/src/libultra/os/invaldcache.o:
build/src/libultra/os/writebackdcacheall.o:
build/src/libultra/io/contquery.o:
build/src/libultra/io/contreaddata.o:
build/src/libultra/io/controller.o:
build/src/libultra/io/contsetch.o:
build/src/libultra/os/virtualtophysical.o:
build/src/libultra/gu/sqrtf.o:
build/src/libultra/gu/cosf.o:
build/src/libultra/gu/ortho.o:
build/src/libultra/gu/perspective.o:
build/src/libultra/gu/rotaterpy.o:
build/src/libultra/gu/sinf.o:
build/src/libultra/gu/sins.o:
build/src/libultra/libc/bcmp.o:
build/src/libultra/libc/bcopy.o:
build/src/libultra/libc/bzero.o:
build/src/libultra/libc/string.o:
build/src/libultra/os/createmesgqueue.o:
build/src/libultra/os/jammesg.o:
build/src/libultra/os/recvmesg.o:
build/src/libultra/os/sendmesg.o:
build/src/libultra/os/seteventmesg.o:
build/src/libultra/io/sptask.o:
build/src/libultra/io/sptaskyield.o:
build/src/libultra/io/sptaskyielded.o:
build/src/libultra/sched/sched.o:
build/src/libultra/io/sirawdma.o:
build/src/libultra/io/siacs.o:
build/src/libultra/os/createthread.o:
build/src/libultra/os/getthreadpri.o:
build/src/libultra/os/setthreadpri.o:
build/src/libultra/os/startthread.o:
build/src/libultra/os/stopthread.o:
build/src/libultra/os/thread.o:
build/src/libultra/os/yieldthread.o:
build/src/libultra/os/gettime.o:
build/src/libultra/os/settime.o:
build/src/libultra/os/settimer.o:
build/src/libultra/os/timerintr.o:
build/src/libultra/os/probetlb.o:
build/src/libultra/io/vigetcurrframebuf.o:
build/src/libultra/io/vigetnextframebuf.o:
build/src/libultra/io/vimgr.o:
build/src/libultra/io/vitbl.o:
build/src/libultra/io/visetevent.o:
build/src/libultra/io/visetmode.o:
build/src/libultra/io/visetspecial.o:
build/src/libultra/io/visetyscale.o:
build/src/libultra/io/viswapbuf.o:
build/src/libultra/io/viswapcontext.o:
build/src/libultra/io/viblack.o:
build/src/libultra/mgu/mtxident.o:
build/src/libultra/mgu/mtxidentf.o:
build/src/libultra/mgu/mtxf2l.o:
build/src/libultra/mgu/mtxl2f.o:
build/src/libultra/mgu/mtxcatf.o:
build/src/libultra/mgu/scale.o:
build/src/libultra/mgu/scalef.o:
build/src/libultra/mgu/translate.o:
build/src/libultra/mgu/translatef.o:
build/src/libultra/os/initialize.o:
build/src/libultra/io/conteepread.o:
build/src/libultra/io/conteepwrite.o:
build/src/libultra/os/exceptasm.o:
build/src/libultra/os/interrupt.o:
build/src/libultra/os/setintmask.o:
build/src/libultra/os/setglobalintmask.o:
build/src/libultra/os/resetglobalintmask.o:
build/src/libultra/io/pirawdma.o:
build/src/libultra/io/pigetcmdq.o:
build/src/libultra/io/epirawread.o:
build/src/libultra/io/epirawwrite.o:
build/src/libultra/io/ai.o:
build/src/libultra/audio/drvrnew.o:
build/src/libultra/audio/load.o:
build/src/libultra/audio/auxbus.o:
build/src/libultra/audio/filter.o:
build/src/libultra/audio/mainbus.o:
build/src/libultra/audio/resample.o:
build/src/libultra/audio/reverb.o:
build/src/libultra/audio/save.o:
build/src/libultra/audio/heapalloc.o:
build/src/libultra/audio/copy.o:
build/src/libultra/os/invalicache.o:
build/src/libultra/os/writebackdcache.o:
build/src/libultra/io/dpsetnextbuf.o:
build/src/libultra/os/getcause.o:
build/src/libultra/os/getcount.o:
build/src/libultra/os/getsr.o:
build/src/libultra/os/setcompare.o:
build/src/libultra/os/setfpccsr.o:
build/src/libultra/os/setsr.o:
build/src/libultra/os/setwatchlo.o:
build/src/libultra/io/sp.o:
build/src/libultra/io/spgetstat.o:
build/src/libultra/io/spsetstat.o:
build/src/libultra/io/spsetpc.o:
build/src/libultra/io/sprawdma.o:
build/src/libultra/io/sirawread.o:
build/src/libultra/io/sirawwrite.o:
build/src/libultra/os/destroythread.o:
build/src/libultra/os/maptlbrdb.o:
build/src/libultra/os/unmaptlball.o:
build/src/libultra/io/vi.o:
build/src/libultra/io/vigetcurrcontext.o:
build/src/libultra/vimodes/vimodentsclan1.o:
build/src/libultra/vimodes/vimodepallan1.o:
build/src/libultra/vimodes/vimodempallan1.o:
build/src/libultra/os/parameters.o:
build/src/libultra/gu/libm_vals.o:
build/src/libultra/io/dp.o:
build/src/libultra/io/si.o:
build/src/libkmc/fmod.o:
build/src/libkmc/memmove.o:
build/src/libkmc/memset.o:
build/src/libkmc/modf.o:
build/src/libkmc/rand.o:
build/src/libkmc/strcpy.o:
build/src/libkmc/mmuldi3.o:
build/src/libkmc/ctype.o:
build/src/dma_table/dma_table.o:
build/src/main_segment/main.o:
build/src/main_segment/nnsched.o:
build/src/main_segment/joy.o:
build/src/libmus/player.o:
build/src/libmus/player_fx.o:
build/src/libmus/aud_dma.o:
build/src/libmus/aud_sched.o:
build/src/libmus/aud_thread.o:
build/src/libmus/lib_memory.o:
build/src/libmus/aud_samples.o:
build/src/rsp/rspboot.o:
build/src/rsp/aspMain.o:
build/src/rsp/f3dex2.o:
build/src/rsp/s2dex.o:
build/src/stufsh/thingy1.o:
build/src/stufsh/thingy2.o:
build/src/stufsh/thonga3.o:
build/src/stufsh/capy4.o:
build/src/stufsh/placeholder5.o:
build/src/stufsh/idk6.o:
build/src/stufsh/another7.o:
build/src/buffers/framebuffer.o:
