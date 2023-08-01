#include "msg.h"

// NOTE: data only

char EWRAM_DATA gMsgBuf[0x1000] = { 0 };
i32 EWRAM_DATA gLoadedMsg = 0;
