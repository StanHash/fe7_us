#ifndef ICON_H
#define ICON_H

#include "prelude.h"

#define ICON_COUNT 176
#define ICON_DISPLAY_COUNT 0x20

struct IconStatus
{
    /* 00 */ u8 ref_count;
    /* 01 */ u8 disp_id;
};

extern struct IconStatus gIconStatusTable[ICON_COUNT];
extern u8 gIconDisplayList[ICON_DISPLAY_COUNT];

#endif // ICON_H
