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

#endif // HARDWARE_H
