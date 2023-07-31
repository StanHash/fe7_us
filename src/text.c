#include "text.h"

// NOTE: data only

struct Font EWRAM_DATA gDefaultFont = { 0 };
struct Font * EWRAM_DATA gFont = NULL;

u8 EWRAM_DATA gLang = 0;

struct SpecialCharEnt EWRAM_DATA gSpecialCharList[SPECIAL_CHARACTER_COUNT] = { 0 };
