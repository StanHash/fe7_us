#ifndef UTIL_H
#define UTIL_H

#include "prelude.h"

struct PalFadeStatus
{
    /* 00 */ u16 from_colors[0x10];
    /* 20 */ u16 const * to_colors;
    /* 24 */ u16 * pal;
    /* 28 */ u16 clock;
    /* 2A */ u16 clock_end;
    /* 2C */ u16 clock_stop;
};

extern struct PalFadeStatus gPalFadeStatus[0x20];

#endif // UTIL_H
