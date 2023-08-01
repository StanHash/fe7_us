#include "unit.h"

// NOTE: data only

u8 EWRAM_DATA gActiveUnitId = 0;
struct Vec2i EWRAM_DATA gActiveUnitMoveOrigin = { 0 };

struct Unit EWRAM_DATA gBlueUnits[UNIT_COUNT_BLUE] = { 0 };
struct Unit EWRAM_DATA gRedUnits[UNIT_COUNT_RED] = { 0 };
struct Unit EWRAM_DATA gGreenUnits[UNIT_COUNT_GREEN] = { 0 };
struct Unit EWRAM_DATA gPurpleUnits[UNIT_COUNT_PURPLE] = { 0 };
