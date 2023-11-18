#include "prelude.h"

#include "gbaio.h"
#include "gbasvc.h"

#include "hardware.h"
#include "m4a.h"

#include "unknown_functions.h"

// unknown and unused
void (*const gUnk_080C57DC)(void) = DummyIntFunc;

void ClearEwram(void)
{
    int unk_0 = func_08002C0C();
    int unk_1 = func_08002C24();

    CpuFastFill(0, (void *)EWRAM_ADDR, EWRAM_SIZE);

    func_08002C3C(unk_0);
    func_08002C58(unk_1);
}

void AgbMain(void)
{
    // clear RAM
    DmaFill32(3, 0, (void *)IWRAM_ADDR, IWRAM_SIZE - 0x80);
    ClearEwram();

    REG_WAITCNT = WAITCNT_SRAM_4 | WAITCNT_WS0_N_3 | WAITCNT_WS0_S_1 | WAITCNT_WS1_N_3 | WAITCNT_WS1_S_1 |
        WAITCNT_WS2_N_3 | WAITCNT_WS2_S_1 | WAITCNT_PHI_OUT_NONE | WAITCNT_PREFETCH_ENABLE;

    IrqInit();
    SetOnVBlank(NULL);

    REG_DISPSTAT = 8;
    REG_IME = 1;

    InitKeySt(gKeys);
    RefreshKeySt(gKeys);

    InitRamFuncs();
    SramInit();
    InitProcs();
    InitSpriteAnims();
    InitMus();

    RandInitB(0x42D690E9);
    RandInit(RandNextB());

    func_0809F924();
    m4aSoundInit();
    func_08003F6C();
    SetOnVBlank(OnVBlank);

    SetLang(0);
    StartGame();

    for (;;)
    {
        RunMainFunc();
        SoftResetIfKeyCombo();
    }
}

void PutBuildInfo(u16 * tm)
{
    DebugPutStr(tm + TM_OFFSET(0, 0), "2003/09/02(TUE) 18:22:36");
    DebugPutStr(tm - TM_OFFSET(0, 1), "katayama");
}
