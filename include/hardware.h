#ifndef HARDWARE_H
#define HARDWARE_H

#include "prelude.h"

// TODO: move to gbasomething
#define VRAM (void *)0x06000000

enum
{
    FRAMES_PER_SECOND = 60,
    FRAMES_PER_MINUTE = 60 * FRAMES_PER_SECOND,
    FRAMES_PER_HOUR = 60 * FRAMES_PER_MINUTE,
};

enum
{
    BG0_SYNC_BIT = 1 << 0,
    BG1_SYNC_BIT = 1 << 1,
    BG2_SYNC_BIT = 1 << 2,
    BG3_SYNC_BIT = 1 << 3,
};

#if defined(MODERN) && MODERN
#define IO_ALIGNED(n) ALIGNED(n)
#else
#define IO_ALIGNED(n) ALIGNED(4)
#endif

struct IO_ALIGNED(2) DispCnt
{
    /* bit  0 */ u16 mode : 3;
    /* bit  3 */ u16 : 1;
    /* bit  4 */ u16 bitmap_frame : 1;
    /* bit  5 */ u16 hblank_interval_free : 1;
    /* bit  6 */ u16 obj_mapping : 1;
    /* bit  7 */ u16 forced_blank : 1;
    /* bit  8 */ u16 bg0_enable : 1;
    /* bit  9 */ u16 bg1_enable : 1;
    /* bit 10 */ u16 bg2_enable : 1;
    /* bit 11 */ u16 bg3_enable : 1;
    /* bit 12 */ u16 obj_enable : 1;
    /* bit 13 */ u16 win0_enable : 1;
    /* bit 14 */ u16 win1_enable : 1;
    /* bit 15 */ u16 objwin_enable : 1;
};

struct IO_ALIGNED(2) DispStat
{
    /* bit  0 */ u16 vblank : 1;
    /* bit  1 */ u16 hblank : 1;
    /* bit  2 */ u16 vcount : 1;
    /* bit  3 */ u16 vblank_int_enable : 1;
    /* bit  4 */ u16 hblank_int_enable : 1;
    /* bit  5 */ u16 vcount_int_enable : 1;
    /* bit  6 */ u16 : 2;
    /* bit  8 */ u16 vcount_compare : 8;
};

struct IO_ALIGNED(2) BgCnt
{
    /* bit  0 */ u16 priority : 2;
    /* bit  2 */ u16 chr_block : 2;
    /* bit  4 */ u16 : 2;
    /* bit  6 */ u16 mosaic : 1;
    /* bit  7 */ u16 color_depth : 1;
    /* bit  8 */ u16 tm_block : 5;
    /* bit 13 */ u16 wrap : 1;
    /* bit 14 */ u16 size : 2;
};

struct IO_ALIGNED(4) WinCnt
{
    u8 win0_enable_bg0 : 1;
    u8 win0_enable_bg1 : 1;
    u8 win0_enable_bg2 : 1;
    u8 win0_enable_bg3 : 1;
    u8 win0_enable_obj : 1;
    u8 win0_enable_blend : 1;
    u8 : 2;

    u8 win1_enable_bg0 : 1;
    u8 win1_enable_bg1 : 1;
    u8 win1_enable_bg2 : 1;
    u8 win1_enable_bg3 : 1;
    u8 win1_enable_obj : 1;
    u8 win1_enable_blend : 1;
    u8 : 2;

    u8 wout_enable_bg0 : 1;
    u8 wout_enable_bg1 : 1;
    u8 wout_enable_bg2 : 1;
    u8 wout_enable_bg3 : 1;
    u8 wout_enable_obj : 1;
    u8 wout_enable_blend : 1;
    u8 : 2;

    u8 wobj_enable_bg0 : 1;
    u8 wobj_enable_bg1 : 1;
    u8 wobj_enable_bg2 : 1;
    u8 wobj_enable_bg3 : 1;
    u8 wobj_enable_obj : 1;
    u8 wobj_enable_blend : 1;
    u8 : 2;
};

struct IO_ALIGNED(2) BlendCnt
{
    u16 target1_enable_bg0 : 1;
    u16 target1_enable_bg1 : 1;
    u16 target1_enable_bg2 : 1;
    u16 target1_enable_bg3 : 1;
    u16 target1_enable_obj : 1;
    u16 target1_enable_bd : 1;
    u16 effect : 2;
    u16 target2_enable_bg0 : 1;
    u16 target2_enable_bg1 : 1;
    u16 target2_enable_bg2 : 1;
    u16 target2_enable_bg3 : 1;
    u16 target2_enable_obj : 1;
    u16 target2_enable_bd : 1;
};

struct DispIo
{
    /* 00 */ struct DispCnt disp_ct;
    /* 04 */ struct DispStat disp_stat;
    /* 08 */ STRUCT_PAD(0x08, 0x0C);
    /* 0C */ struct BgCnt bg0_ct;
    /* 10 */ struct BgCnt bg1_ct;
    /* 14 */ struct BgCnt bg2_ct;
    /* 18 */ struct BgCnt bg3_ct;
    /* 1C */ struct Vec2u bg_off[4];
    /* 2C */ u8 win0_right, win0_left, win1_right, win1_left;
    /* 30 */ u8 win0_bottom, win0_top, win1_bottom, win1_top;
    /* 34 */ struct WinCnt win_ct;
    /* 38 */ u16 mosaic;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ struct BlendCnt blend_ct;
    /* 40 */ STRUCT_PAD(0x40, 0x44);
    /* 44 */ u8 blend_coef_a;
    /* 45 */ u8 blend_coef_b;
    /* 46 */ u8 blend_y;
    /* 48 */ u16 bg2pa;
    /* 4A */ u16 bg2pb;
    /* 4C */ u16 bg2pc;
    /* 4E */ u16 bg2pd;
    /* 50 */ u32 bg2x;
    /* 54 */ u32 bg2y;
    /* 58 */ u16 bg3pa;
    /* 5A */ u16 bg3pb;
    /* 5C */ u16 bg3pc;
    /* 5E */ u16 bg3pd;
    /* 60 */ u32 bg3x;
    /* 64 */ u32 bg3y;
    /* 68 */ i8 color_addition;
};

struct Keys
{
    /* 00 */ u8 repeat_delay;
    /* 01 */ u8 repeat_interval;
    /* 02 */ u8 repeat_clock;
    /* 04 */ u16 held;     // keys that are currently held
    /* 06 */ u16 repeated; // repeated keys
    /* 08 */ u16 pressed;  // keys that went down this frame
    /* 0A */ u16 previous; // keys that were held last frame
    /* 0C */ u16 last;
    /* 0E */ u16 ablr_pressed; // 1 for Release (A B L R Only), 0 Otherwise
    /* 10 */ u16 pressed2;
    /* 12 */ u16 time_since_start_select; // Time since last Non-Start Non-Select Button was pressed
};

// NOTE: not decompiled

// ... GetGameTime(...)
// ... SetGameTime(...)
// ... IncGameTime(...)
// ... FormatTime(...)
void EnableBgSync(u32 mask);
// ... func_08001018(...)
// ... func_08001038(...)
// ... EnablePalSync(...)
// ... func_08001070(...)
void ApplyPaletteExt(void const * src, int offset, int length);
// ... func_080010F4(...)
// ... func_080011B0(...)
// ... func_08001348(...)
u32 GetBgChrOffset(int bg);
// ... func_080013CC(...)
// ... func_08001400(...)
// ... SetBgChrOffset(...)
// ... func_08001478(...)
// ... func_080014DC(...)
// ... func_08001518(...)
// ... func_0800155C(...)
// ... func_08001624(...)
// ... func_080016EC(...)
// ... TmFill(...)
// ... SetBlankChr(...)
void SetOnVBlank(void (*func)(void));
// ... func_080018D0(...)
// ... func_08001948(...)
// ... func_08001990(...)
// ... func_080019B8(...)
void RunMainFunc(void);
// ... func_080019F4(...)
void RefreshKeySt(struct Keys * keys);
// ... func_08001C1C(...)
void InitKeySt(struct Keys * keys);
// ... func_08001CD0(...)
// ... func_08001CEC(...)
// ... func_08001D54(...)
void SetBgOffset(fu16 bgid, fu16 x_offset, fu16 y_offset); // ... func_08001E94(...)
// ... func_08001EC8(...)
// ... func_08001EFC(...)
// ... func_08001F3C(...)
// ... func_08002018(...)
// ... func_080020BC(...)
// ... func_080020F4(...)
// ... func_08002218(...)
// ... func_08002338(...)
// ... func_08002384(...)
// ... func_080024BC(...)
// ... func_080025E4(...)
// ... func_0800271C(...)
// ... func_08002854(...)
// ... InitBgs(...)
// ... func_08002BE8(...)
int func_08002C0C(void);
int func_08002C24(void);
void func_08002C3C(int arg_0);
void func_08002C58(int arg_0);
// ... func_08002C74(...)
// ... func_08002C8C(...)
// ... func_08002CA4(...)
// ... func_08002CCC(...)
void SoftResetIfKeyCombo(void);
// ... func_08002D48(...)
// ... OnHBlankBoth(...)
// ... RefreshOnHBlank(...)
// ... SetOnHBlankA(...)
// ... SetOnHBlankB(...)
// ... func_08002F54(...)

extern u8 gBuf[0x2100];

extern struct DispIo gDispIo;

extern i8 gFadeComponentStep[0x20];
extern i8 gFadeComponents[0x600];

extern u16 gPal[0x200];

extern u16 gBg0Tm[0x400];
extern u16 gBg1Tm[0x400];
extern u16 gBg2Tm[0x400];
extern u16 gBg3Tm[0x400];

extern void * gBgMapVramTable[4];

extern void (*gMainFunc)(void);

// existing code prefers gKeys, which is a pointer to this
extern struct Keys gKeysInstance;

extern u32 gUnk_02024C8C;
extern u32 gUnk_02024C90;

extern struct Keys * SHOULD_BE_CONST gKeys;

// TODO: remove the SAFE from the names
#define TILE_CHR(chr) ((chr) & 0x3FF)
#define TILE_PAL(pal) (((pal) & 0xF) << 12)
#define TILEREF(chr, pal) ((chr) + ((pal) << 12))
#define TILE_HFLIP 0x0400
#define TILE_VFLIP 0x0800

#define TM_OFFSET(x, y) (((y) << 5) + (x))

#define ApplyPalettes(src, num, count) ApplyPaletteExt((src), 0x20 * (num), 0x20 * (count))

#define ApplyPalettes(src, num, count) ApplyPaletteExt((src), 0x20 * (num), 0x20 * (count))
#define ApplyPalette(src, num) ApplyPalettes((src), (num), 1)

#define ApplyBgPalettes ApplyPalettes
#define ApplyBgPalette ApplyPalette
#define ApplyObPalettes(src, num, count) ApplyPalettes((src), 0x10 + (num), (count))
#define ApplyObPalette(src, num) ApplyPalette((src), 0x10 + (num))

#define SetDispEnable(bg0, bg1, bg2, bg3, obj)                                                                         \
    gDispIo.disp_ct.bg0_enable = (bg0);                                                                                \
    gDispIo.disp_ct.bg1_enable = (bg1);                                                                                \
    gDispIo.disp_ct.bg2_enable = (bg2);                                                                                \
    gDispIo.disp_ct.bg3_enable = (bg3);                                                                                \
    gDispIo.disp_ct.obj_enable = (obj)

#endif // HARDWARE_H
