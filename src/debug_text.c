#include "debug_text.h"

// NOTE: data only

struct DebugTextStatus EWRAM_DATA gDebugText = { 0 };

char EWRAM_DATA gNumberStr[9] = { 0 };

i32 EWRAM_DATA gDebugOam2Chr = 0;
i32 EWRAM_DATA gDebugOam2Pal = 0;
