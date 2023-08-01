#include "bm.h"

// NOTE: data only

struct BmStatus EWRAM_DATA gBmStatus = { 0 };
struct PlayStatus EWRAM_DATA gPlayStatus = { 0 };

struct Vec2i EWRAM_DATA gLastCoordMapCursorDrawn = { 0 };
u32 EWRAM_DATA gLastTimeMapCursorDrawn = 0;

i8 EWRAM_DATA gCameraAnimTable[0x100] = {};
