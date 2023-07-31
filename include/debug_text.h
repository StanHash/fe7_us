#ifndef DEBUG_TEXT_H
#define DEBUG_TEXT_H

#include "prelude.h"

struct DebugTextStatus
{
    /* 00 */ i32 vram_offset;
    /* 04 */ i16 bg;
    /* 06 */ u16 chr;
    /* 08 */ i32 hcur;
    /* 0C */ u32 vcur;
    /* 10 */ u32 vdisp;
    /* 14 */ char screen[256][32];
};

extern struct DebugTextStatus gDebugText;

// 8 characters + '\0'. least significant digit always at + 7
extern char gNumberStr[9];

extern i32 gDebugOam2Chr;
extern i32 gDebugOam2Pal;

#endif // DEBUG_TEXT_H
