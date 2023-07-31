#include "hardware.h"

// NOTE: data only

u8 ALIGNED(4) EWRAM_DATA gBuf[0x2100] = { 0 };

i8 EWRAM_DATA gFadeComponentStep[0x20] = { 0 };
i8 EWRAM_DATA gFadeComponents[0x600] = { 0 };

u16 ALIGNED(4) EWRAM_DATA gPal[0x200] = { 0 };

u16 ALIGNED(4) EWRAM_DATA gBg0Tm[0x400] = { 0 };
u16 ALIGNED(4) EWRAM_DATA gBg1Tm[0x400] = { 0 };
u16 ALIGNED(4) EWRAM_DATA gBg2Tm[0x400] = { 0 };
u16 ALIGNED(4) EWRAM_DATA gBg3Tm[0x400] = { 0 };

void * EWRAM_DATA gBgMapVramTable[4] = { 0 };

void (*EWRAM_DATA gMainFunc)(void) = NULL;

u32 EWRAM_DATA ewram_pad_2024C74 = 0;

struct Keys EWRAM_DATA gKeysInstance = { 0 };

// unknowns
u32 EWRAM_DATA gUnk_02024C8C = 0;
u32 EWRAM_DATA gUnk_02024C90 = 0;
