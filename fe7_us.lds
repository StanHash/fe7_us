OUTPUT_ARCH(arm)
ENTRY(_start)

MEMORY
{
    EWRAM (w!x)  : ORIGIN = 0x02000000, LENGTH = 256K
    IWRAM (w!x)  : ORIGIN = 0x03000000, LENGTH = 32K
    ROM   (x)    : ORIGIN = 0x08000000, LENGTH = 32M
}

/* TODO: dump */
gMusicPlayerTable = 0x0869D668;
gSongTable = 0x0869D6E0;
MsgHuffNodes = 0x08B7D71C;
MsgHuffRoot = 0x08B808A8;

gNumMusicPlayers = 9;
gMaxLines = 0;

SECTIONS
{
    .text : ALIGN(4)
    {
        src/crt0.o(.text);
        src/armfunc.o(.text);
        asm/code.o(.text);
        src/m4a_1.o(.text);
        src/m4a.o(.text);
        src/gbasvc.o(.text);
        src/gbasram.o(.text);
        *libgcc.a:_ashldi3.o(.text);
        *libgcc.a:_call_via_rX.o(.text);
        *libgcc.a:_divsi3.o(.text);
        *libgcc.a:_dvmd_tls.o(.text);
        *libgcc.a:_modsi3.o(.text);
        *libgcc.a:_muldi3.o(.text);
        *libgcc.a:_udivsi3.o(.text);
        *libgcc.a:_umodsi3.o(.text);
        *libc.a:memcpy.o(.text);
        *libc.a:memset.o(.text);
        *libc.a:sprintf.o(.text);
        *libc.a:strcpy.o(.text);
        *libc.a:strlen.o(.text);
        *libc.a:strstr.o(.text);
        *libc.a:vfprintf.o(.text);
        *libc.a:vsprintf.o(.text);
        *libc.a:wsetup.o(.text);
        *libc.a:dtoa.o(.text);
        *libc.a:fflush.o(.text);
        *libc.a:findfp.o(.text);
        *libc.a:freer.o(.text);
        *libc.a:fvwrite.o(.text);
        *libc.a:fwalk.o(.text);
        *libc.a:locale.o(.text);
        *libc.a:makebuf.o(.text);
        *libc.a:mallocr.o(.text);
        *libc.a:mbtowc_r.o(.text);
        *libc.a:memchr.o(.text);
        *libc.a:memmove.o(.text);
        *libc.a:mlock.o(.text);
        *libc.a:mprec.o(.text);
        *libc.a:s_isinf.o(.text);
        *libc.a:s_isnan.o(.text);
        *libc.a:sbrkr.o(.text);
        *libc.a:stdio.o(.text);
        *libc.a:strcmp.o(.text);
        *libc.a:syscalls.o(.text);
        *libc.a:writer.o(.text);
        *libc.a:callocr.o(.text);
        *libc.a:closer.o(.text);
        *libc.a:errno.o(.text);
        *libc.a:fstatr.o(.text);
        *libc.a:libcfunc.o(.text);
        *libc.a:lseekr.o(.text);
        *libc.a:readr.o(.text);
        *libgcc.a:dp-bit.o(.text);
        *libgcc.a:fp-bit.o(.text);
        *libgcc.a:_lshrdi3.o(.text);
        *libgcc.a:_negdi2.o(.text);

        *(fake_glue);
    } > ROM

    .rodata : ALIGN(4)
    {
        . = ALIGN(4); asm/rodata.o(.rodata);
        . = ALIGN(4); src/m4a.o(.rodata);
        . = ALIGN(4); asm/rodata.o(.rodata_2);
        . = ALIGN(4); *libc.a:vfprintf.o(.rodata);
        . = ALIGN(4); *libc.a:dtoa.o(.rodata);
        . = ALIGN(4); *libc.a:impure.o(.rodata);
        . = ALIGN(4); *libc.a:locale.o(.rodata);
        . = ALIGN(4); *libc.a:mprec.o(.rodata);
        . = ALIGN(4); *libc.a:syscalls.o(.rodata);
    } > ROM

    .data : ALIGN(4)
    {
        . = ALIGN(4); asm/data.o(.data);

        /* libc */
        . = ALIGN(4); *libc.a:impure.o(.data);
        . = ALIGN(4); *libc.a:locale.o(.data);
        . = ALIGN(4); *libc.a:mallocr.o(.data);

        /* garbage first then banim */
        . = ALIGN(4); asm/data.o(.data_2);
    } > ROM

    .bss (NOLOAD) : ALIGN(4)
    {
        . = 0x002258;
        . = ALIGN(4); src/gbasram.o(.bss);
        . = ALIGN(4); *libc.a:syscalls.o(.bss);
        . = ALIGN(4); *libgcc.a:dp-bit.o(.bss);
        . = ALIGN(4); *libgcc.a:fp-bit.o(.bss);
        . = ALIGN(4); *(bss.SoundMainRam);

        /* COMMON */
        . = 0x002860; gOamLoPutIt = .;
        . = 0x0028E0; IntrFuncTable = .;
        . = 0x002F34; gOamHiPutIt = .;
        . = 0x0041E0; gWorkingMap = .;
        . = 0x0041F0; gMapFloodSquareBufB = .;
        . = 0x0043F0; gWorkingMovTable = .;
        . = 0x004490; gMapFloodSquareBufA = .;
        . = 0x0046A0; gMapFloodSt = .;

        . = 0x004AE0; *(COMMON.gSoundInfo);
        . = 0x005B50;
        . = ALIGN(4); *(COMMON.gMPlayJumpTable);
        . = ALIGN(4); *(COMMON.gCgbChans);
        . = 0x005DE0; *(COMMON.gMPlayMemAccArea);
        . = 0x005E70;
        . = ALIGN(4); *(COMMON.ReadSramFast);
        . = ALIGN(4); *(COMMON.VerifySramFast);
        . = ALIGN(4); errno = .; . = . + 4;
    } > IWRAM

    .ewram_data (NOLOAD) : ALIGN(4)
    {
        . = 0x020140; /* begin (before that is ewram overlay) */

        . = ALIGN(4); src/hardware.o(ewram_data);
        . = ALIGN(4); src/async_upload.o(ewram_data);
        . = ALIGN(4); src/audio.o(ewram_data);
        . = ALIGN(4); src/proc.o(ewram_data);
        . = ALIGN(4); src/icon.o(ewram_data);
        . = ALIGN(4); src/debug_text.o(ewram_data);
        . = ALIGN(4); src/text.o(ewram_data);
        . = ALIGN(4); src/banim_sprite.o(ewram_data);
        . = ALIGN(4); src/sprite.o(ewram_data);
        . = ALIGN(4); src/face.o(ewram_data);
        . = ALIGN(4); src/event.o(ewram_data);
        . = ALIGN(4); src/msg.o(ewram_data);
        . = ALIGN(4); src/util.o(ewram_data);
        . = ALIGN(4); src/bm.o(ewram_data);
        . = ALIGN(4); src/unit.o(ewram_data);
        . = ALIGN(4); src/map.o(ewram_data);

        . = 0x03EEA8;
        . = ALIGN(4); end = .;
    } > EWRAM

    /* DWARF 2 sections */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    .debug_info     0 : { *(.debug_info) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }

    /* Discard everything not specifically mentioned above. */
    /DISCARD/ :
    {
        *(*);
    }
}