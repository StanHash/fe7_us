#include "prelude.h"

#include "gbaio.h"
#include "gbasvc.h"

extern void IntrMain(void);

void DummyIntFunc(void);

extern void (*IntrFuncTable[])(void);
extern u32 IntrMainRam[0x200];

void IrqInit(void)
{
    int i;

    for (i = 0; i < 14; ++i)
    {
        IntrFuncTable[i] = DummyIntFunc;
    }

    CpuFastCopy(IntrMain, IntrMainRam, sizeof(IntrMainRam));
    INTR_VECTOR = IntrMainRam;
}

void DummyIntFunc(void)
{
}

void SetIrqFunc(int num, void (*func)(void))
{
    IntrFuncTable[num] = func;
}
