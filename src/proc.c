#include "proc.h"

// NOTE: data only

struct ProcDummy
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ u32 user_reserved[0x10];
};

struct ProcDummy EWRAM_DATA gProcs[PROC_COUNT] = { 0 };

struct ProcDummy * EWRAM_DATA gProcAllocList[PROC_COUNT + 1] = { 0 };
struct ProcDummy ** EWRAM_DATA gProcAllocHead = NULL;

Proc * EWRAM_DATA gProcTreeRoots[PROC_TREE_COUNT] = { 0 };
