#include "icon.h"

// NOTE: data only

struct IconStatus EWRAM_DATA gIconStatusTable[ICON_COUNT] = { 0 };
u8 EWRAM_DATA gIconDisplayList[ICON_DISPLAY_COUNT] = { 0 };
