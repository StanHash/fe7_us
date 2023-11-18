#ifndef HARDWARE_H
#define HARDWARE_H

#include "prelude.h"

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
// ... EnableBgSync(...)
// ... func_08001018(...)
// ... func_08001038(...)
// ... EnablePalSync(...)
// ... func_08001070(...)
// ... ApplyPaletteExt(...)
// ... func_080010F4(...)
// ... func_080011B0(...)
// ... func_08001348(...)
// ... GetBgChrOffset(...)
// ... func_080013CC(...)
// ... func_08001400(...)
// ... func_08001434(...)
// ... func_08001478(...)
// ... func_080014DC(...)
// ... func_08001518(...)
// ... func_0800155C(...)
// ... func_08001624(...)
// ... func_080016EC(...)
// ... TmFill(...)
// ... func_08001840(...)
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
// ... SetBgOffset(...)
// ... func_08001E94(...)
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

#define TM_OFFSET(x, y) (((y) << 5) + (x))

#endif // HARDWARE_H
