#include "event.h"

#include "armfunc.h"
#include "hardware.h"
#include "proc.h"
#include "unit.h"
#include "map.h"
#include "bm.h"
#include "chapter_info.h"

#include "unknown_functions.h"

#include "constants/song.h"
#include "constants/terrain.h"

// = START OF GARBAGE =

#define TALK_RESULT_CANCEL 0
#define TALK_RESULT_YES 1
#define TALK_RESULT_NO 2

#define TALK_FLAG_NOSKIP (1 << 2)
#define TALK_FLAG_NOFAST (1 << 3)
#define TALK_FLAG_OPAQUE (1 << 8)

#define EVENT_FLAG_FOLLOWMOVE 1
#define EVENT_FLAG_TALKSKIPPED 2
#define EVENT_FLAG_SKIPPED 4
#define EVENT_FLAG_UNK_5 0x20
#define EVENT_FLAG_NOSKIPTALK 0x80
#define EVENT_FLAG_SLOWTALK 0x100

#define EVENT_CMDRET_CONTINUE 0
#define EVENT_CMDRET_JUMPED 1
#define EVENT_CMDRET_YIELD 2
#define EVENT_CMDRET_REPEAT 3

void SetTalkFlag(int flag);
Proc * StartTalkMsg(int x, int y, int msg);

void TryMoveUnit(struct Unit * unit, int x, int y, bool closest);

#define BGCHR_TALK 0x80

#define BGPAL_TALK_BACKGROUND 8 // ..15

#define NUM_BACKGROUNDS 0x5B

struct BackgroundInfo
{
    u8 const * img;
    u8 const * tsa;
    u16 const * pal;
};

extern struct BackgroundInfo gBackgroundTable[];

typedef uptr EventScr;

struct EventProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ ALIGN_PAD(0x29, 0x2C);
    /* 2C */ EventScr const * script_entry;
    /* 30 */ EventScr const * script;
    /* 38 */ EventScr const * script_return;
    /* 34 */ STRUCT_PAD(0x38, 0x40);
    /* 40 */ void (*idle_func)(struct EventProc * proc);
    /* 44 */ struct UnitInfo const * unit_info;
    /* 48 */ i32 talk_auto_msg;
    /* 4C */ i8 background;
    /* 4D */ bool8 unk_4D;
    /* 4E */ u8 unk_4E;
    /* 4F */ u8 map_change_param;
    /* 50 */ u16 sleep_duration;
    /* 52 */ STRUCT_PAD(0x52, 0x55);
    /* 55 */ u8 pid_param; // TODO: what is this exactly?
    /* 56 */ u16 ignore_count;
    /* 58 */ STRUCT_PAD(0x58, 0x5C);
    /* 5C */ u16 iid_param;
    /* 5E */ u16 flags;
};

#define SCR_LO16(script_word) (((script_word) & 0x0000FFFF) >> 0)
#define SCR_HI16(script_word) (((script_word) & 0xFFFF0000) >> 16)

#define SCR_LO16_SIGN(script_word) (SCR_LO16(script_word) & 0x8000 ? -1 : SCR_LO16(script_word))
#define SCR_HI16_SIGN(script_word) (SCR_HI16(script_word) & 0x8000 ? -1 : SCR_HI16(script_word))

#define LO8(half) (((half) & 0x00FF) >> 0)
#define HI8(half) (((half) & 0xFF00) >> 8)

bool TryMoveUnitDisplayed(struct EventProc * proc, struct Unit * unit, int x, int y, fu16 move_speed);
bool DisplayMovement(struct EventProc * proc, struct Unit * unit, u8 const * move_script, fu16 move_speed);
void Event_FadeOutOfBackgroundTalk(struct EventProc * proc);
void EventClearTalkDisplayed(struct EventProc * proc);
void Event_FadeOutOfSkip(struct EventProc * proc);
void EventForceSlowTextSpeed(struct EventProc * proc);
void EventTalkWait(struct EventProc * proc);
void func_0800AF20(struct EventProc * proc);

extern struct ProcScr ProcScr_MoveCamera[];
extern u8 gWorkingMoveScript[];

bool AiGetUnitClosestValidPosition(struct Unit * unit, fi16 x, fi16 y, struct Vec2i * out_position);
void UnitSyncMovement(struct Unit * unit);
void RefreshEntityMaps(void);

struct EventWaitForMuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ i32 x;
    /* 30 */ i32 y;
    /* 34 */ STRUCT_PAD(0x34, 0x54);
    /* 54 */ Proc * mu_proc;
};

extern struct ProcScr ProcScr_EventWaitForMu[];

void HideUnitSprite(struct Unit * unit);
Proc * StartMu(struct Unit * unit);
void DisableMuCamera(Proc * mu);
void SetMuMoveScript(Proc * mu, u8 const * move_script);
Proc * SpawnProc(struct ProcScr const * script, Proc * parent);
void func_0806D4CC(Proc * mu, int move_speed);

struct SpriteAnim;
struct MuConfig;

struct MuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * unit;

    // TODO: this is all FE6 offsets. this probably changed

    /* 30 */ struct SpriteAnim * sprite_anim;
    /* 34 */ struct MuConfig * config;

    /* 38 */ u8 cam_b;
    /* 39 */ u8 state;
    /* 3A */ u8 hidden_b;
    /* 3B */ u8 jid;
    /* 3C */ i8 facing;
    /* 3D */ u8 step_sound_clock;
    /* 3E */ u8 fast_walk_b;
    /* 3F */ // pad
    /* 40 */ u16 move_clock_q4;
    /* 42 */ i16 move_config;
    /* 44 */ i16 x_q4, y_q4;
    /* 48 */ i16 x_offset_q4, y_offset_q4;
};

bool IsMuActive(Proc * mu);
void EndMu(Proc * mu);
void ShowUnitSprite(struct Unit * unit);
void Proc_Break(Proc * proc);

void EventUnitLoadWait(struct EventProc * proc);
void EventUnitLoadAliveWait(struct EventProc * proc);
void EventLoadUnitsAsParty(struct EventProc * proc);

void ForceSyncUnitSpriteSheet(void);
void EventMovementWait(struct EventProc * proc);
void LoadUnitWrapper(struct UnitInfo const * unit_info, Proc * parent);
void FakeLoadUnit(struct UnitInfo const * info, struct Unit * unit);

extern struct UnitInfo gMutableUnitInfo;
extern struct UnitInfo UnitInfo_Dummy;

#define EVENT_CMD_END 0x00
#define EVENT_CMD_LABEL 0x44

struct EventCmdInfo
{
    int (*func)(struct EventProc * proc);
    int size;
};

extern struct EventCmdInfo gEventCmdTable[];

int EventGiveItem(struct Unit * unit, fu16 iid, struct EventProc * proc);
void StartGiveItem(struct Unit * unit, fu16 iid, Proc * parent);

#include "m4a.h"

#define PlaySe(id)                                                                                                     \
    if (!gPlayStatus.config_se_disable)                                                                                \
    m4aSongNumStart((id))

void RenderMapForFade(void);
void ApplyMapChange(int id);
void RemoveMapChangeTrap(int id);
void AddMapChangeTrap(int id);
void RefreshTerrainMap(void);
void StartMapFade(bool lock_field);
void UpdateRoofedUnits(void);
void RefreshAutoWaterShadows(void);

int GetMapChangeIdAt(int x, int y);
void UnitChangeFaction(struct Unit * unit, int faction);

struct EventFlashCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ i32 clock;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ i16 x;
    /* 66 */ i16 y;
};

extern struct ProcScr ProcScr_EventFlashCursor[];
void EventFlashCursorWait(struct EventProc * proc);

void Proc_EndEach(struct ProcScr const * script);

enum
{
    MAP_CURSOR_DEFAULT,
    MAP_CURSOR_REGULAR,
    MAP_CURSOR_RED_MOVING,
    MAP_CURSOR_STRETCHED,
    MAP_CURSOR_RED_STATIC,
};

void PutMapCursor(int x, int y, int kind);

extern struct ProcScr ProcScr_EventCursor[];

struct EventCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ i16 x;
    /* 66 */ i16 y;
};

void ClearUnit(struct Unit * unit);

void SetAutoMuDefaultFacing(void);
void StartMuDeathFade(Proc * mu_proc);

void EventRemoveDisplayedWait(struct EventProc * proc);

void EndAllMus(void);

// = END OF GARBAGE =

u8 EWRAM_DATA gEventRememberedX[4] = { 0 };
u8 EWRAM_DATA gEventRememberedY[4] = { 0 };

int EvtCmd_Sleep(struct EventProc * proc)
{
    // script[1]: duration

    int duration = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (duration > 0)
        duration--;

    proc->sleep_duration = duration;
    proc->unk_4E = 0;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SleepFast(struct EventProc * proc)
{
    // script[1]: duration

    int duration = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (duration > 0)
        duration--;

    proc->sleep_duration = duration;
    proc->unk_4E = 1;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SleepText(struct EventProc * proc)
{
    // script[1]: duration

    int duration = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (duration > 0)
        duration--;

    proc->sleep_duration = duration;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_Background(struct EventProc * proc)
{
    // script[1]: background

    int background = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (proc->background == -1)
    {
        LockBmDisplay();
        LockMus();
    }

    DisplayBackground(background);
    proc->background = background;

    SetDispEnable(1, 1, 1, 1, 1);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_BackgroundLynModeDeath(struct EventProc * proc)
{
    int background = GetChapterInfo(gPlayStatus.chapter)->default_background;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (!GetLynModeDeathFlag())
    {
        OverrideBgm(SONG_2C);
        SetLynModeDeathFlag();
    }

    if (proc->background == -1)
    {
        LockBmDisplay();
        LockMus();
    }

    DisplayBackground(background);
    proc->background = background;

    SetDispEnable(1, 1, 1, 1, 1);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_BackgroundRandom(struct EventProc * proc)
{
    int background;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    background = RandNextB() % NUM_BACKGROUNDS;

    DisplayBackground(background);
    proc->background = background;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_BackgroundMore(struct EventProc * proc)
{
    // script[1]: background

    int background = SCR_HI16(proc->script[0]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if (proc->background == -1)
    {
        LockBmDisplay();
        LockMus();
    }

    DisplayBackgroundNoClear(background);
    proc->background = background;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearTalk(struct EventProc * proc)
{
    if (proc->background == -1)
    {
        EventClearTalkDisplayed(proc);
        SetDispEnable(1, 1, 1, 1, 1);

        return EVENT_CMDRET_YIELD;
    }

    Event_FadeOutOfBackgroundTalk(proc);
    proc->background = -1;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearSkip(struct EventProc * proc)
{
    if (proc->script_return != NULL)
        return EVENT_CMDRET_CONTINUE;

    if ((proc->flags & EVENT_FLAG_SKIPPED) == 0)
        return EVENT_CMDRET_CONTINUE;

    if ((proc->flags & EVENT_FLAG_UNK_5) == 0)
    {
        Event_FadeOutOfSkip(proc);
        proc->background = -1;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearSkipFadeToPrep(struct EventProc * proc)
{
    if (proc->background != -1)
    {
        UnlockBmDisplay();
        ReleaseMus();
    }

    if (proc->unk_4D)
    {
        if (!GetChapterInfo(gPlayStatus.chapter)->has_prep)
            Event_FadeOutOfSkip(proc);
    }
    else
    {
        if (proc->background == -1)
        {
            if (GetChapterInfo(gPlayStatus.chapter)->has_prep)
                StartMidLockingFadeToBlack(proc);
        }
        else
        {
            if (!GetChapterInfo(gPlayStatus.chapter)->has_prep)
                Event_FadeOutOfSkip(proc);
        }
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FadeFromOpening(struct EventProc * proc)
{
    LockBmDisplay();
    LockMus();

    Event_FadeOutOfBackgroundTalk(proc);
    proc->background = -1;

    return EVENT_CMDRET_YIELD;
}

void DisplayBackground(int background)
{
    ClearTalk();

    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    Decompress(gBackgroundTable[background].img, VRAM + GetBgChrOffset(3));
    TmApplyTsa(gBg3Tm, gBackgroundTable[background].tsa, TILE_PAL(BGPAL_TALK_BACKGROUND));
    ApplyPalettes(gBackgroundTable[background].pal, BGPAL_TALK_BACKGROUND, 8);

    EnableBgSync(BG3_SYNC_BIT);
    gPal[0] = 0;
}

void DisplayBackgroundNoClear(int background)
{
    SetBgOffset(0, 0, 0);
    SetBgOffset(1, 0, 0);
    SetBgOffset(2, 0, 0);
    SetBgOffset(3, 0, 0);

    Decompress(gBackgroundTable[background].img, VRAM + GetBgChrOffset(3));
    TmApplyTsa(gBg3Tm, gBackgroundTable[background].tsa, TILE_PAL(BGPAL_TALK_BACKGROUND));

    /* BUG: the palette count should be 8, matching DisplayBackground, but is 4 instead
     * This is the value used in fe6. I assume this DisplayBackground was updated but not this */

#if BUGFIX
    ApplyPalettes(gBackgroundTable[background].pal, BGPAL_TALK_BACKGROUND, 8);
#else
    ApplyPalettes(gBackgroundTable[background].pal, BGPAL_TALK_BACKGROUND, 4);
#endif

    EnableBgSync(BG3_SYNC_BIT);
    gPal[0] = 0;
}

void EventStartTalk(struct EventProc * proc, int msg, bool init)
{
    if (init)
    {
        InitTalk(BGCHR_TALK, 2, TRUE);
    }

    if ((proc->flags & EVENT_FLAG_SLOWTALK) != 0)
    {
        EventForceSlowTextSpeed(proc);
    }

    StartTalkMsg(1, 1, msg);

    if ((proc->flags & EVENT_FLAG_NOSKIPTALK) != 0)
    {
        SetTalkFlag(TALK_FLAG_NOSKIP);
    }

    if ((proc->flags & EVENT_FLAG_SLOWTALK) != 0)
    {
        SetTalkFlag(TALK_FLAG_NOFAST);
    }

    proc->idle_func = EventTalkWait;
}

int EvtCmd_Talk(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    EventStartTalk(proc, proc->script[1], TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkOpaque(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    EventStartTalk(proc, proc->script[1], TRUE);
    SetTalkFlag(TALK_FLAG_OPAQUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByMode(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    InitTalk(BGCHR_TALK, 2, TRUE);

    if (gPlayStatus.scenario != PLAY_SCENARIO_3)
    {
        EventStartTalk(proc, proc->script[1], TRUE);
    }
    else
    {
        EventStartTalk(proc, proc->script[2], TRUE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkSetFuncBroken(struct EventProc * proc)
{
    void const * func; // TODO: type

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    /* BUG: there's an extra '&' here that doesn't belong
     * unless the goal was to have an arm instruction inline which I doubt */

#if BUGFIX
    func = (void *)proc->script[1];
#else
    func = &proc->script[1];
#endif

    SetTalkFunc(func);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMore(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    EventStartTalk(proc, proc->script[1], FALSE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByMode(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (gPlayStatus.scenario != PLAY_SCENARIO_3)
    {
        EventStartTalk(proc, proc->script[1], FALSE);
    }
    else
    {
        EventStartTalk(proc, proc->script[2], FALSE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkAuto(struct EventProc * proc)
{
    // TODO: is the lack of the following a bug?
    // proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    EventStartTalk(proc, proc->talk_auto_msg, TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkContinue(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        EndTalk();
        return EVENT_CMDRET_CONTINUE;
    }

    ResumeTalk();
    proc->idle_func = EventTalkWait;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkGeneric(struct EventProc * proc)
{
    int const * msg_by_tone_table = (void const *)proc->script[1];

    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    EventStartTalk(proc, msg_by_tone_table[gActiveUnit->pinfo->generic_talk_tone], TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreGeneric(struct EventProc * proc)
{
    int const * msg_by_tone_table = (void const *)proc->script[1];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    EventStartTalk(proc, msg_by_tone_table[gActiveUnit->pinfo->generic_talk_tone], FALSE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByTactRank(struct EventProc * proc)
{
    int rank_level;
    int entry_num;

    int const * msg_by_tact_rank_table = (void const *)proc->script[1];

    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    switch (SCR_HI16(proc->script[0]))
    {
        case 0:
            rank_level = func_080B62F4();
            break;

        case 1:
            rank_level = func_080B63EC();
            break;

        case 2:
            rank_level = func_080B6424();
            break;

        case 3:
            rank_level = func_080B651C();
            break;

        case 4:
        default:
            rank_level = func_080B6550();
            break;
    }

    entry_num = 0;

    if (rank_level < 3)
    {
        entry_num = 1;

        if (rank_level < 2)
            entry_num = 2;
    }

    EventStartTalk(proc, msg_by_tact_rank_table[entry_num], TRUE);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByTactGender(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (!IsTactFemale())
    {
        EventStartTalk(proc, proc->script[1], TRUE);
    }
    else
    {
        EventStartTalk(proc, proc->script[2], TRUE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByTactGender(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (!IsTactFemale())
    {
        EventStartTalk(proc, proc->script[1], FALSE);
    }
    else
    {
        EventStartTalk(proc, proc->script[2], FALSE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByFlag(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (GetFlag(proc->script[1]))
    {
        EventStartTalk(proc, proc->script[2], TRUE);
    }
    else
    {
        EventStartTalk(proc, proc->script[3], TRUE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByFlag(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (GetFlag(proc->script[1]))
    {
        EventStartTalk(proc, proc->script[2], FALSE);
    }
    else
    {
        EventStartTalk(proc, proc->script[3], FALSE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkByFunc(struct EventProc * proc)
{
    typedef bool PredicateFunc(void);

    proc->flags &= ~EVENT_FLAG_TALKSKIPPED;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (((PredicateFunc *)proc->script[1])())
    {
        EventStartTalk(proc, proc->script[2], TRUE);
    }
    else
    {
        EventStartTalk(proc, proc->script[3], TRUE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_TalkMoreByFunc(struct EventProc * proc)
{
    typedef bool PredicateFunc(void);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (((PredicateFunc *)proc->script[1])())
    {
        EventStartTalk(proc, proc->script[2], FALSE);
    }
    else
    {
        EventStartTalk(proc, proc->script[3], FALSE);
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_ClearTalkBubble(struct EventProc * proc)
{
    ClearTalkBubble();
    return EVENT_CMDRET_CONTINUE;
}

void EventTalkWait(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        EndTalk();
        func_0800AF20(proc);
        proc->idle_func = NULL;
    }
    else if (!IsTalkActive() || IsTalkLocked())
    {
        func_0800AF20(proc);
        proc->idle_func = NULL;
    }
}

int EvtCmd_CameraCenterPosition(struct EventProc * proc)
{
    fi16 x = (proc->script[0] >> 16) & 0xFF;
    fi16 y = (proc->script[0] >> 24) & 0xFF;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        i32 x_cam, y_cam;

        GetCameraAdjustedCenter(x, y, &x_cam, &y_cam);

        gBmStatus.camera.x = x_cam << 4;
        gBmStatus.camera.y = y_cam << 4;

        SetMapCursorPosition(x, y);

        RenderMap();

        return EVENT_CMDRET_CONTINUE;
    }

    CameraMoveWatchPositionCenter(proc, x, y);
    SetMapCursorPosition(x, y);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_CameraPosition(struct EventProc * proc)
{
    fi16 x = (proc->script[0] >> 16) & 0xFF;
    fi16 y = (proc->script[0] >> 24) & 0xFF;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        gBmStatus.camera.x = GetCameraAdjustedX(x << 4);
        gBmStatus.camera.y = GetCameraAdjustedY(y << 4);

        SetMapCursorPosition(x, y);

        RenderMap();

        return EVENT_CMDRET_CONTINUE;
    }

    CameraMoveWatchPosition(proc, x, y);
    SetMapCursorPosition(x, y);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_CameraPid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(SCR_HI16(proc->script[0]));

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        gBmStatus.camera.x = GetCameraAdjustedX(unit->x << 4);
        gBmStatus.camera.y = GetCameraAdjustedY(unit->y << 4);

        SetMapCursorPosition(unit->x, unit->y);

        RenderMap();

        return EVENT_CMDRET_YIELD;
    }

    CameraMoveWatchPosition(proc, unit->x, unit->y);
    SetMapCursorPosition(unit->x, unit->y);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_CameraLeader(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(GetLeaderPid());

    CameraMoveWatchPosition(proc, unit->x, unit->y);
    SetMapCursorPosition(unit->x, unit->y);

    return EVENT_CMDRET_YIELD;
}

bool CanDisplayUnitMovement(struct EventProc * proc, int x, int y)
{
    if ((proc->flags & EVENT_FLAG_FOLLOWMOVE) != 0)
    {
        if (Proc_Find(ProcScr_MoveCamera) != NULL || CameraMoveWatchPosition(proc, x, y))
            return FALSE;
    }

    if (!CanStartMu())
        return FALSE;

    return TRUE;
}

int EvtCmd_MovePosition(struct EventProc * proc)
{
    struct Unit * unit;

    int x_unit = SCR_LO16_SIGN(proc->script[1]);
    int y_unit = SCR_HI16_SIGN(proc->script[1]);

    int x_target = SCR_LO16_SIGN(proc->script[2]);
    int y_target = SCR_HI16_SIGN(proc->script[2]);

    if (gMapUnit[y_unit][x_unit] == 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    unit = GetUnit(gMapUnit[y_unit][x_unit]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x_target, y_target, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, x_unit, y_unit))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_target, y_target, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePositionSpeed(struct EventProc * proc)
{
    struct Unit * unit;

    int x_unit = SCR_LO16_SIGN(proc->script[1]);
    int y_unit = SCR_HI16_SIGN(proc->script[1]);

    int x_target = SCR_LO16_SIGN(proc->script[2]);
    int y_target = SCR_HI16_SIGN(proc->script[2]);

    fu16 move_speed = proc->script[3];

    if (gMapUnit[y_unit][x_unit] == 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    unit = GetUnit(gMapUnit[y_unit][x_unit]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x_target, y_target, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, x_unit, y_unit))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_target, y_target, move_speed);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(proc->script[1]);

    int x_target = SCR_LO16_SIGN(proc->script[2]);
    int y_target = SCR_HI16_SIGN(proc->script[2]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x_target, y_target, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_target, y_target, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidSpeed(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(proc->script[1]);

    int x_target = SCR_LO16_SIGN(proc->script[2]);
    int y_target = SCR_HI16_SIGN(proc->script[2]);

    fu16 move_speed = proc->script[3];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x_target, y_target, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_target, y_target, move_speed);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidOneStepSpeed(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(proc->script[1]);

    int direction = proc->script[2];

    // BUG: the size of this event command is only 3!!! this reads the next command's ID
    fu16 move_speed = proc->script[3];

    int x_target = unit->x;
    int y_target = unit->y;

    // why are these constants different from the usual FACING_... constants?
    switch (direction)
    {
        case 0:
            y_target = y_target - 1;
            break;

        case 1:
            y_target = y_target + 1;
            break;

        case 2:
            x_target = x_target - 1;
            break;

        case 3:
            x_target = x_target + 1;
            break;
    }

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x_target, y_target, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_target, y_target, move_speed);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidScript(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(proc->script[1]);

    u8 const * move_script = (void const *)proc->script[2];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        i32 x = unit->x;
        i32 y = unit->y;

        ApplyMoveScriptToCoordinates(&x, &y, move_script);

        TryMoveUnit(unit, x, y, FALSE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    DisplayMovement(proc, unit, move_script, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePositionScript(struct EventProc * proc)
{
    i32 x_unit = SCR_LO16_SIGN(proc->script[1]);
    i32 y_unit = SCR_HI16_SIGN(proc->script[1]);

    u8 const * move_script = (void const *)proc->script[2];

    struct Unit * unit = GetUnit(gMapUnit[y_unit][x_unit]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        ApplyMoveScriptToCoordinates(&x_unit, &y_unit, move_script);

        TryMoveUnit(unit, x_unit, y_unit, FALSE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, x_unit, y_unit))
        return EVENT_CMDRET_REPEAT;

    DisplayMovement(proc, unit, move_script, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidNextTo(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(proc->script[2]);

    int x = unit->x;
    int y = unit->y;

    unit = GetUnitByPid(proc->script[1]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x, y, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x, y, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MoveLeader(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(GetLeaderPid());

    int x_target = SCR_LO16_SIGN(proc->script[1]);
    int y_target = SCR_HI16_SIGN(proc->script[1]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x_target, y_target, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_target, y_target, 0);

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidByFaction_PositionSpeed_Script(struct EventProc * proc)
{
    bool is_blue = IsPidBlue(SCR_LO16(proc->script[1]));

    struct Unit * unit = GetUnitByPid(SCR_LO16(proc->script[1]));

    i32 x_target = SCR_LO16_SIGN(proc->script[2]);
    i32 y_target = SCR_HI16_SIGN(proc->script[2]);

    fu16 move_speed_blue = SCR_HI16(proc->script[1]);

    u8 const * move_script_red = (void const *)proc->script[3];

    if (!is_blue || (x_target != 99 && (x_target != unit->x || y_target != unit->y)))
    {
        if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
        {
            if (!is_blue)
            {
                x_target = unit->x;
                y_target = unit->y;

                ApplyMoveScriptToCoordinates(&x_target, &y_target, move_script_red);
            }

            TryMoveUnit(unit, x_target, y_target, FALSE);
            RefreshUnitSprites();

            return EVENT_CMDRET_CONTINUE;
        }

        if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
            return EVENT_CMDRET_REPEAT;

        if (is_blue)
        {
            TryMoveUnitDisplayed(proc, unit, x_target, y_target, move_speed_blue);
        }
        else
        {
            DisplayMovement(proc, unit, move_script_red, 0);
        }
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidByFaction_Script_Script(struct EventProc * proc)
{
    bool is_blue = IsPidBlue(SCR_LO16(proc->script[1]));

    struct Unit * unit = GetUnitByPid(SCR_LO16(proc->script[1]));

    u8 const * move_script_blue = (void const *)proc->script[2];
    u8 const * move_script_red = (void const *)proc->script[3];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        i32 x = unit->x;
        i32 y = unit->y;

        if (!is_blue)
        {
            ApplyMoveScriptToCoordinates(&x, &y, move_script_red);
        }
        else
        {
            ApplyMoveScriptToCoordinates(&x, &y, move_script_blue);
        }

        TryMoveUnit(unit, x, y, FALSE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    if (is_blue)
    {
        DisplayMovement(proc, unit, move_script_blue, 0);
    }
    else
    {
        DisplayMovement(proc, unit, move_script_red, 0);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePositionInstant(struct EventProc * proc)
{
    int x_target, y_target;

    struct Unit * unit = GetUnit(gMapUnit[SCR_HI16_SIGN(proc->script[1])][SCR_LO16_SIGN(proc->script[1])]);

    if (unit == NULL)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    x_target = SCR_LO16_SIGN(proc->script[2]);
    y_target = SCR_HI16_SIGN(proc->script[2]);

    TryMoveUnit(unit, x_target, y_target, TRUE);
    RefreshUnitSprites();

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidInstant(struct EventProc * proc)
{
    int x_target, y_target;

    struct Unit * unit = GetUnitByPid(proc->script[1]);

    x_target = SCR_LO16_SIGN(proc->script[2]);
    y_target = SCR_HI16_SIGN(proc->script[2]);

    TryMoveUnit(unit, x_target, y_target, TRUE);
    RefreshUnitSprites();

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SavePositionPid(struct EventProc * proc)
{
    struct Unit * unit;
    int slot;

    if (proc->script[1] == 0)
    {
        if (!IsPidBlueDeployed(GetLeaderPid()))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitByPid(GetLeaderPid());
        slot = gPlayStatus.scenario;
    }
    else
    {
        if (!IsPidBlueDeployed(proc->script[1]))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitByPid(proc->script[1]);
        slot = proc->script[2];
    }

    gEventRememberedX[slot] = unit->x;
    gEventRememberedY[slot] = unit->y;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MovePidToSavedPosition(struct EventProc * proc)
{
    struct Unit * unit;
    int slot;
    int x_target, y_target;

    if (proc->script[1] == 0)
    {
        if (!IsPidBlueDeployed(GetLeaderPid()))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitByPid(GetLeaderPid());
        slot = gPlayStatus.scenario;
    }
    else
    {
        if (!IsPidBlueDeployed(proc->script[1]))
            return EVENT_CMDRET_CONTINUE;

        unit = GetUnitByPid(proc->script[1]);
        slot = proc->script[2];
    }

    x_target = gEventRememberedX[slot];
    y_target = gEventRememberedY[slot];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
    {
        TryMoveUnit(unit, x_target, y_target, TRUE);
        RefreshUnitSprites();

        return EVENT_CMDRET_CONTINUE;
    }

    if (!CanDisplayUnitMovement(proc, unit->x, unit->y))
        return EVENT_CMDRET_REPEAT;

    TryMoveUnitDisplayed(proc, unit, x_target, y_target, 0);

    return EVENT_CMDRET_CONTINUE;
}

void TryMoveUnit(struct Unit * unit, int x, int y, bool closest)
{
    struct Vec2i vec;

    if (x == 0xFF)
        x = -1;

    if (y == 0xFF)
        y = -1;

    vec.x = x;
    vec.y = y;

    if (gMapTerrain[y][x] == TERRAIN_0)
    {
    }
    else if (closest && (unit->x != x || unit->y != y))
    {
        AiGetUnitClosestValidPosition(unit, x, y, &vec);
    }

    unit->x = vec.x;
    unit->y = vec.y;

    UnitSyncMovement(unit);

    if ((unit->flags & UNIT_FLAG_UNDER_A_ROOF) == 0)
    {
        unit->flags &= ~(UNIT_FLAG_HIDDEN | UNIT_FLAG_NOT_DEPLOYED);
        RefreshEntityMaps();
    }
}

bool TryMoveUnitDisplayed(struct EventProc * proc, struct Unit * unit, int x, int y, fu16 move_speed)
{
    struct Vec2i vec;

    int terrain_changed = FALSE;

    if (x == 0xFF)
        x = -1;

    if (y == 0xFF)
        y = -1;

    func_0802C29C();

    vec.x = x;
    vec.y = y;

    if (gMapTerrain[y][x] == TERRAIN_0)
    {
        terrain_changed = TRUE;
        gMapTerrain[y][x] = TERRAIN_1;
    }
    else
    {
        AiGetUnitClosestValidPosition(unit, x, y, &vec);
    }

    MapFloodRange_Unitless(unit->x, unit->y, unit->jinfo->mov_table[0]);
    BuildBestMoveScript(vec.x, vec.y, gWorkingMoveScript);

    if (terrain_changed)
        gMapTerrain[y][x] = TERRAIN_0;

    if ((proc->flags & EVENT_FLAG_SLOWTALK) != 0)
    {
        move_speed |= 0x40;
    }

    func_0802C2DC();

    return DisplayMovement(proc, unit, gWorkingMoveScript, move_speed);
}

bool DisplayMovement(struct EventProc * proc, struct Unit * unit, u8 const * move_script, fu16 move_speed)
{
    struct EventWaitForMuProc * wait_for_mu_proc;

    Proc * mu = StartMu(unit);

    i32 x, y;

    if ((proc->flags & EVENT_FLAG_FOLLOWMOVE) == 0)
    {
        DisableMuCamera(mu);
    }

    wait_for_mu_proc = SpawnProc(ProcScr_EventWaitForMu, PROC_TREE_3);
    wait_for_mu_proc->mu_proc = mu;

    HideUnitSprite(unit);
    unit->flags |= UNIT_FLAG_HIDDEN;

    x = unit->x;
    y = unit->y;

    gMapOther[y][x] = 0;

    ApplyMoveScriptToCoordinates(&x, &y, move_script);

    wait_for_mu_proc->x = x;
    wait_for_mu_proc->y = y;

    SetMuMoveScript(mu, move_script);

    if (move_speed != 0)
    {
        func_0806D4CC(mu, move_speed);
    }

    gMapOther[y][x] = unit->id;

    return TRUE;
}

// unreferenced
void EventWaitForMu_0800CD14(struct EventWaitForMuProc * proc)
{
}

void EventWaitForMu_Loop(struct EventWaitForMuProc * proc)
{
    struct MuProc * mu = proc->mu_proc;
    struct Unit * unit;

    if (IsMuActive(mu))
        return;

    EndMu(mu);

    unit = mu->unit;

    unit->x = proc->x;
    unit->y = proc->y;

    UnitSyncMovement(unit);

    ShowUnitSprite(unit);
    unit->flags &= ~UNIT_FLAG_HIDDEN;

    RefreshEntityMaps();
    RefreshUnitSprites();

    Proc_Break(proc);
}

int EvtCmd_LoadUnits(struct EventProc * proc)
{
    MapFill(gMapOther, 0);

    proc->unit_info = (void const *)proc->script[1];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        EventUnitLoadWait(proc);
        return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        proc->idle_func = EventUnitLoadWait;
        return EVENT_CMDRET_YIELD;
    }
}

int EvtCmd_LoadUnitsAlive(struct EventProc * proc)
{
    MapFill(gMapOther, 0);

    proc->unit_info = (void const *)proc->script[1];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        EventUnitLoadAliveWait(proc);
        return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        proc->idle_func = EventUnitLoadAliveWait;
        return EVENT_CMDRET_YIELD;
    }
}

int EvtCmd_LoadUnitsFiltered(struct EventProc * proc)
{
    if ((proc->script[1] & 0xFFFF0000) != 0 && (gPlayStatus.flags & PLAY_FLAG_HARD) == 0)
    {
        return EVENT_CMDRET_CONTINUE;
    }

    if (gPlayStatus.scenario != (proc->script[1] & 0xFF))
    {
        return EVENT_CMDRET_CONTINUE;
    }

    MapFill(gMapOther, 0);

    proc->unit_info = (void const *)proc->script[2];

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        EventUnitLoadWait(proc);
        return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        proc->idle_func = EventUnitLoadWait;
        return EVENT_CMDRET_YIELD;
    }
}

int EvtCmd_LoadUnitsParty(struct EventProc * proc)
{
    MapFill(gMapOther, 0);

    proc->unit_info = (void const *)proc->script[1];
    EventLoadUnitsAsParty(proc);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_LoadUnitsPartyIfScenario(struct EventProc * proc)
{
    if (gPlayStatus.scenario == (proc->script[1] & 0xFF))
    {
        MapFill(gMapOther, 0);

        proc->unit_info = (void const *)proc->script[2];
        EventLoadUnitsAsParty(proc);

        return EVENT_CMDRET_YIELD;
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_LoadUnitsByMode(struct EventProc * proc)
{
    int idx;

    if ((gPlayStatus.flags & PLAY_FLAG_HARD) != 0)
        idx = 1;
    else
        idx = 0;

    if (gPlayStatus.scenario == PLAY_SCENARIO_3)
        idx += 2;

    MapFill(gMapOther, 0);

    switch (idx)
    {
        case 0:
            proc->unit_info = (void const *)proc->script[1];
            break;

        case 1:
            proc->unit_info = (void const *)proc->script[2];
            break;

        case 2:
            proc->unit_info = (void const *)proc->script[3];
            break;

        case 3:
            proc->unit_info = (void const *)proc->script[4];
            break;

        default:
            proc->unit_info = (void const *)proc->script[1];
            break;
    }

    if (proc->unit_info != NULL)
    {
        if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        {
            EventUnitLoadWait(proc);
            return EVENT_CMDRET_CONTINUE;
        }
        else
        {
            proc->idle_func = EventUnitLoadWait;
            return EVENT_CMDRET_YIELD;
        }
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_LoadUnitsPartyByMode(struct EventProc * proc)
{
    int idx;

    if ((gPlayStatus.flags & PLAY_FLAG_HARD) != 0)
        idx = 1;
    else
        idx = 0;

    if (gPlayStatus.scenario == PLAY_SCENARIO_3)
        idx += 2;

    MapFill(gMapOther, 0);

    switch (idx)
    {
        case 0:
            proc->unit_info = (void const *)proc->script[1];
            break;

        case 1:
            proc->unit_info = (void const *)proc->script[2];
            break;

        case 2:
            proc->unit_info = (void const *)proc->script[3];
            break;

        case 3:
            proc->unit_info = (void const *)proc->script[4];
            break;

        default:
            proc->unit_info = (void const *)proc->script[1];
            break;
    }

    EventLoadUnitsAsParty(proc);

    return EVENT_CMDRET_CONTINUE;
}

int GetNextAvailableBlueUnitId(int id)
{
    for (; id < FACTION_BLUE + UNITS_PER_FACTION; id++)
    {
        struct Unit * unit = GetUnit(id);

        if (unit == NULL)
            continue;

        if (unit->pinfo == NULL)
            continue;

        if ((unit->flags & (UNIT_FLAG_DEAD | UNIT_FLAG_NOT_DEPLOYED)) != 0)
            continue;

        return id;
    }

    return 0;
}

bool UnitInfoRequiresNoMovement(struct UnitInfo const * unit_info)
{
    if (unit_info->x_load != unit_info->x_move || unit_info->y_load != unit_info->y_move)
        return FALSE;

    // TODO: isn't this backwards?
    if (gMapUnit[unit_info->y_load][unit_info->x_load] == 0)
        return FALSE;

    return TRUE;
}

void EventUnitLoadWait(struct EventProc * proc)
{
    struct UnitInfo const * info = proc->unit_info;

    while (TRUE)
    {
        if (info->pid == 0)
        {
            proc->idle_func = EventMovementWait;
            break;
        }

        if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
        {
            while (info->pid != 0)
            {
                LoadUnitWrapper(info, NULL);
                info++;
            }

            proc->idle_func = NULL;
            return;
        }

        if (!UnitInfoRequiresNoMovement(info))
        {
            if (!CanDisplayUnitMovement(proc, info->x_load, info->y_load))
                break;

            LoadUnitWrapper(info, proc);
        }

        info++;
        proc->unit_info = info;
    }

    ForceSyncUnitSpriteSheet();
}

void EventUnitLoadAliveWait(struct EventProc * proc)
{
    struct UnitInfo const * info = proc->unit_info;

    while (TRUE)
    {
        if (info->pid == 0)
        {
            proc->idle_func = EventMovementWait;
            break;
        }

        if ((proc->flags & EVENT_FLAG_SKIPPED) != 0 || proc->unk_4D)
        {
            while (info->pid != 0)
            {
                if ((GetUnitByPid(info->pid)->flags & UNIT_FLAG_DEAD) == 0)
                    LoadUnitWrapper(info, NULL);

                info++;
            }

            proc->idle_func = NULL;
            return;
        }

        if ((GetUnitByPid(info->pid)->flags & UNIT_FLAG_DEAD) == 0)
        {
            if (!UnitInfoRequiresNoMovement(info))
            {
                if (!CanDisplayUnitMovement(proc, info->x_load, info->y_load))
                    break;

                LoadUnitWrapper(info, proc);
            }
        }

        info++;
        proc->unit_info = info;
    }

    ForceSyncUnitSpriteSheet();
}

void EventLoadUnitsAsParty(struct EventProc * proc)
{
    struct UnitInfo const * info = proc->unit_info;

    int id;
    struct Unit * unit;

    int suitable_unit_count = 0;

    FOR_UNITS_FACTION(FACTION_BLUE, unit, {
        if ((unit->flags & (UNIT_FLAG_DEAD | UNIT_FLAG_AWAY)) != 0)
            continue;

        suitable_unit_count++;
    })

    if (suitable_unit_count > 0 && GetChapterInfo(gPlayStatus.chapter)->has_prep)
        return;

    if (GetChapterInfo(gPlayStatus.chapter)->has_prep)
    {
        FOR_UNITS_FACTION(FACTION_BLUE, unit, {
            if ((unit->flags & (UNIT_FLAG_DEAD | UNIT_FLAG_AWAY)) != 0)
                continue;

            unit->flags |= UNIT_FLAG_HIDDEN;
        })
    }
    else
    {
        FOR_UNITS_FACTION(FACTION_BLUE, unit, {
            if ((unit->flags & (UNIT_FLAG_DEAD | UNIT_FLAG_AWAY)) != 0)
                continue;

            unit->flags |= UNIT_FLAG_HIDDEN;
            unit->flags &= ~UNIT_FLAG_NOT_DEPLOYED;
        })
    }

    id = 0;

    while (info->pid != 0)
    {
        id = GetNextAvailableBlueUnitId(id);

        if (id == 0)
            break;

        unit = GetUnit(id);
        id++;

        FakeLoadUnit(info, unit);

        info++;
    }

    FOR_UNITS_FACTION(FACTION_BLUE, unit, {
        if ((unit->flags & UNIT_FLAG_DEAD) != 0)
            continue;

        if ((unit->flags & UNIT_FLAG_HIDDEN) == 0)
            continue;

        unit->flags |= UNIT_FLAG_NOT_DEPLOYED;
    })

    RefreshEntityMaps();
    RefreshUnitSprites();
}

int EvtCmd_LoadUnit(struct EventProc * proc)
{
    fu8 pid = SCR_LO16(proc->script[1]);
    fu8 jid = SCR_HI16(proc->script[1]);
    fu8 x = SCR_LO16(proc->script[2]);
    fu8 y = SCR_HI16(proc->script[2]);

    gMutableUnitInfo.pid_lead = UnitInfo_Dummy.pid_lead;
    gMutableUnitInfo.autolevel = UnitInfo_Dummy.autolevel;
    gMutableUnitInfo.faction_id = UnitInfo_Dummy.faction_id;
    gMutableUnitInfo.level = UnitInfo_Dummy.level;
    gMutableUnitInfo.item[0] = UnitInfo_Dummy.item[0];
    gMutableUnitInfo.item[1] = UnitInfo_Dummy.item[1];
    gMutableUnitInfo.item[2] = UnitInfo_Dummy.item[2];
    gMutableUnitInfo.item[3] = UnitInfo_Dummy.item[3];
    gMutableUnitInfo.ai[0] = UnitInfo_Dummy.ai[0];
    gMutableUnitInfo.ai[1] = UnitInfo_Dummy.ai[1];
    gMutableUnitInfo.ai[2] = UnitInfo_Dummy.ai[2];
    gMutableUnitInfo.ai[3] = UnitInfo_Dummy.ai[3];

    gMutableUnitInfo.pid = pid;
    gMutableUnitInfo.jid = jid;
    gMutableUnitInfo.x_load = x;
    gMutableUnitInfo.y_load = y;
    gMutableUnitInfo.x_move = x;
    gMutableUnitInfo.y_move = y;

    LoadUnitWrapper(&gMutableUnitInfo, NULL);

    return EVENT_CMDRET_YIELD;
}

void EventMovementWait(struct EventProc * proc)
{
    if (MuExistsActive())
        return;

    MapFill(gMapOther, 0);
    proc->idle_func = NULL;
}

int EvtCmd_WaitForMovement(struct EventProc * proc)
{
    if (MuExistsActive())
        return EVENT_CMDRET_REPEAT;

    MapFill(gMapOther, 0);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_UnitCameraOn(struct EventProc * proc)
{
    proc->flags |= EVENT_FLAG_FOLLOWMOVE;
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_UnitCameraOff(struct EventProc * proc)
{
    proc->flags &= ~EVENT_FLAG_FOLLOWMOVE;
    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_Func(struct EventProc * proc)
{
    typedef void Func(struct EventProc * proc);

    EventScr const * script_before = proc->script + 1;

    ((Func *)proc->script[1])(proc);

    if (script_before != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FuncIfnSkip(struct EventProc * proc)
{
    typedef void Func(struct EventProc * proc);

    EventScr const * script_before = proc->script + 1;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    ((Func *)proc->script[1])(proc);

    if (script_before != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_FuncIfnSkipTalk(struct EventProc * proc)
{
    typedef void Func(struct EventProc * proc);

    EventScr const * script_before = proc->script + 1;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    ((Func *)proc->script[1])(proc);

    if (script_before != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_FuncUntil(struct EventProc * proc)
{
    typedef bool Func(struct EventProc * proc);

    EventScr const * script_before = proc->script + 1;

    bool result = ((Func *)proc->script[1])(proc);

    if (script_before != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    if (result)
        return EVENT_CMDRET_CONTINUE;

    return EVENT_CMDRET_REPEAT;
}

int EvtCmd_FuncWhile(struct EventProc * proc)
{
    typedef bool Func(struct EventProc * proc);

    EventScr const * script_before = proc->script + 1;

    bool result = ((Func *)proc->script[1])(proc);

    if (script_before != proc->script + 1)
        return EVENT_CMDRET_JUMPED;

    if (result)
        return EVENT_CMDRET_REPEAT;

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_Stop(struct EventProc * proc)
{
    return EVENT_CMDRET_REPEAT;
}

int EvtCmd_Label(struct EventProc * proc)
{
    return EVENT_CMDRET_CONTINUE;
}

int EventGotoLabel(struct EventProc * proc, int label)
{
    EventScr const * cmd;

    for (cmd = proc->script_entry; cmd[0] != EVENT_CMD_END; cmd += gEventCmdTable[SCR_LO16(cmd[0])].size)
    {
        if (SCR_LO16(cmd[0]) == EVENT_CMD_LABEL && cmd[1] == label)
        {
            proc->script = cmd + gEventCmdTable[EVENT_CMD_LABEL].size;
            return EVENT_CMDRET_JUMPED;
        }
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_Goto(struct EventProc * proc)
{
    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfnAlive(struct EventProc * proc)
{
    fu16 pid = proc->script[2];

    FOR_UNITS_FACTION(FACTION_BLUE, unit, {
        if ((unit->flags & UNIT_FLAG_DEAD) != 0)
            continue;

        if (unit->pinfo->id == pid)
            return EVENT_CMDRET_CONTINUE;
    })

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfnInTeam(struct EventProc * proc)
{
    fu16 pid = proc->script[2];

    FOR_UNITS_FACTION(FACTION_BLUE, unit, {
        if ((unit->flags & (UNIT_FLAG_DEAD | UNIT_FLAG_NOT_DEPLOYED)) != 0)
            continue;

        if (unit->pinfo->id == pid)
            return EVENT_CMDRET_CONTINUE;
    })

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfyFunc(struct EventProc * proc)
{
    typedef bool Func(void);

    if (((Func *)proc->script[2])())
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnFunc(struct EventProc * proc)
{
    typedef bool Func(void);

    if (!((Func *)proc->script[2])())
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfySkip(struct EventProc * proc)
{
    if ((proc->flags & (EVENT_FLAG_SKIPPED | EVENT_FLAG_TALKSKIPPED)) != 0)
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfySkipText(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_TALKSKIPPED) != 0)
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfyFlag(struct EventProc * proc)
{
    // big code duplication

#if !BUGFIX
    EventScr const * cmd = proc->script_entry;
#endif

    int label = proc->script[1];

    if (!GetFlag(proc->script[2]))
        return EVENT_CMDRET_CONTINUE;

#if BUGFIX
    return EventGotoLabel(proc, label);
#else
    for (; cmd[0] != EVENT_CMD_END; cmd += gEventCmdTable[SCR_LO16(cmd[0])].size)
    {
        if (SCR_LO16(cmd[0]) == EVENT_CMD_LABEL && cmd[1] == label)
        {
            proc->script = cmd + gEventCmdTable[EVENT_CMD_LABEL].size;
            return EVENT_CMDRET_JUMPED;
        }
    }

    return EVENT_CMDRET_YIELD;
#endif
}

int EvtCmd_GotoIfnFlag(struct EventProc * proc)
{
    // big code duplication

#if !BUGFIX
    EventScr const * cmd = proc->script_entry;
#endif

    int label = proc->script[1];

    if (GetFlag(proc->script[2]))
        return EVENT_CMDRET_CONTINUE;

#if BUGFIX
    return EventGotoLabel(proc, label);
#else
    for (; cmd[0] != EVENT_CMD_END; cmd += gEventCmdTable[SCR_LO16(cmd[0])].size)
    {
        if (SCR_LO16(cmd[0]) == EVENT_CMD_LABEL && cmd[1] == label)
        {
            proc->script = cmd + gEventCmdTable[EVENT_CMD_LABEL].size;
            return EVENT_CMDRET_JUMPED;
        }
    }

    return EVENT_CMDRET_YIELD;
#endif
}

int EvtCmd_GotoIfyActive(struct EventProc * proc)
{
    // big code duplication

#if !BUGFIX
    EventScr const * cmd = proc->script_entry;
#endif

    int label = proc->script[1];

    if (SCR_HI16(proc->script[0]) != 0)
    {
        // inverted condition

        if (gActiveUnit->pinfo->id != (0xFF & proc->script[2]))
            return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        if (gActiveUnit->pinfo->id == (0xFF & proc->script[2]))
            return EVENT_CMDRET_CONTINUE;
    }

#if BUGFIX
    return EventGotoLabel(proc, label);
#else
    for (; cmd[0] != EVENT_CMD_END; cmd += gEventCmdTable[SCR_LO16(cmd[0])].size)
    {
        if (SCR_LO16(cmd[0]) == EVENT_CMD_LABEL && cmd[1] == label)
        {
            proc->script = cmd + gEventCmdTable[EVENT_CMD_LABEL].size;
            return EVENT_CMDRET_JUMPED;
        }
    }

    return EVENT_CMDRET_YIELD;
#endif
}

int EvtCmd_GotoIfyEliwoodMode(struct EventProc * proc)
{
    if (gPlayStatus.scenario == PLAY_SCENARIO_2)
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfyHectorMode(struct EventProc * proc)
{
    if (gPlayStatus.scenario == PLAY_SCENARIO_3)
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfyDifficulty(struct EventProc * proc)
{
    if (SCR_HI16(proc->script[0]) != 0)
    {
        if ((gPlayStatus.flags & PLAY_FLAG_HARD) != 0)
            return EventGotoLabel(proc, proc->script[1]);
    }
    else
    {
        if ((gPlayStatus.flags & PLAY_FLAG_HARD) == 0)
            return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnTalkYes(struct EventProc * proc)
{
    if (GetTalkResult() != TALK_RESULT_YES)
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnTalkYes2(struct EventProc * proc)
{
    // BUG: This is probably meant to check for TALK_RESULT_NO

    if (GetTalkResult() != TALK_RESULT_YES)
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnTutorial(struct EventProc * proc)
{
    if ((gPlayStatus.flags & PLAY_FLAG_HARD) != 0 || IsTutorialDisabled())
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfnDeadAndFlagOnce(struct EventProc * proc)
{
    fu16 pid = SCR_LO16(proc->script[2]);
    int flag_id = proc->script[3];

    FOR_UNITS_FACTION(FACTION_BLUE, unit, {
        if ((unit->flags & UNIT_FLAG_DEAD) == 0)
            continue;

        if (unit->pinfo->id != pid)
            continue;

        if (GetFlag(flag_id))
            break;

        SetFlag(flag_id);
        return EVENT_CMDRET_CONTINUE;
    });

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_GotoIfyTurnCountReached(struct EventProc * proc)
{
    if (gPlayStatus.turn >= SCR_HI16(proc->script[0]))
    {
        return EventGotoLabel(proc, proc->script[1]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GotoIfxDeployed(struct EventProc * proc)
{
    if (SCR_HI16(proc->script[0]) != 0)
    {
        // inverted condition

        if (!IsPidBlueDeployed(0xFF & proc->script[2]))
            return EVENT_CMDRET_CONTINUE;
    }
    else
    {
        if (IsPidBlueDeployed(0xFF & proc->script[2]))
            return EVENT_CMDRET_CONTINUE;
    }

    return EventGotoLabel(proc, proc->script[1]);
}

int EvtCmd_Jump(struct EventProc * proc)
{
    proc->script = (void const *)proc->script[1];
    proc->script_entry = proc->script;

    return EVENT_CMDRET_JUMPED;
}

int EvtCmd_SkipNIfyFunc(struct EventProc * proc)
{
    typedef bool Func(void);

    if (((Func *)proc->script[1])())
    {
        proc->ignore_count = SCR_HI16(proc->script[0]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_SkipNIfnFunc(struct EventProc * proc)
{
    typedef bool Func(void);

    if (!((Func *)proc->script[1])())
    {
        proc->ignore_count = SCR_HI16(proc->script[0]);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_GiveItem(struct EventProc * proc)
{
    fu16 iid = SCR_LO16(proc->script[1]);

    return EventGiveItem(gActiveUnit, iid, proc);
}

int EvtCmd_GiveItemToPid(struct EventProc * proc)
{
    fu16 pid = SCR_LO16(proc->script[1]);
    fu16 iid = SCR_LO16(proc->script[2]);

    if (pid == 0)
        pid = proc->pid_param;

    return EventGiveItem(GetUnitByPid(pid), iid, proc);
}

int EvtCmd_GiveItemToLeader(struct EventProc * proc)
{
    fu16 iid = SCR_LO16(proc->script[1]);

    return EventGiveItem(GetUnitByPid(GetLeaderPid()), iid, proc);
}

int EventGiveItem(struct Unit * unit, fu16 iid, struct EventProc * proc)
{
    if (iid == 0)
        iid = proc->iid_param;

    StartGiveItem(unit, iid, proc);

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChange(struct EventProc * proc)
{
    fu16 id = SCR_HI16(proc->script[0]);
    fu16 remove_previous;

    if (id == UINT16_MAX)
    {
        id = proc->map_change_param;
        remove_previous = FALSE;
    }
    else
    {
        id = id & 0x7FFF;
        remove_previous = (SCR_HI16(proc->script[0]) & 0x8000);
    }

    // Common with EvtCmd_MapChangePosition

    if (!proc->unk_4D)
    {
        RenderMapForFade();

        ApplyMapChange(id);

        if (remove_previous)
        {
            RemoveMapChangeTrap(id - 1);
        }

        AddMapChangeTrap(id);

        RefreshTerrainMap();
        UpdateRoofedUnits();
        RenderMap();

        StartMapFade(TRUE);
    }
    else
    {
        ApplyMapChange(id);

        if (remove_previous)
        {
            RemoveMapChangeTrap(id - 1);
        }

        AddMapChangeTrap(id);

        RefreshTerrainMap();
        UpdateRoofedUnits();
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChangeWithAutoWaterShadows(struct EventProc * proc)
{
    fu16 id = SCR_HI16(proc->script[0]);
    fu16 remove_previous;

    if (id == UINT16_MAX)
    {
        id = proc->map_change_param;
        remove_previous = FALSE;
    }
    else
    {
        id = id & 0x7FFF;
        remove_previous = (SCR_HI16(proc->script[0]) & 0x8000);
    }

    // Common with EvtCmd_MapChangePosition

    if (!proc->unk_4D)
    {
        RenderMapForFade();

        ApplyMapChange(id);

        if (remove_previous)
        {
            RemoveMapChangeTrap(id - 1);
            PlaySe(SONG_BD);
        }
        else
        {
            PlaySe(SONG_BE);
        }

        AddMapChangeTrap(id);

        RefreshTerrainMap();
        UpdateRoofedUnits();
        RefreshAutoWaterShadows();
        RenderMap();
        StartMapFade(TRUE);
    }
    else
    {
        ApplyMapChange(id);

        if (remove_previous)
        {
            RemoveMapChangeTrap(id - 1);
        }

        AddMapChangeTrap(id);

        RefreshTerrainMap();
        UpdateRoofedUnits();
        RefreshAutoWaterShadows();
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChangeInstant(struct EventProc * proc)
{
    fu16 id = SCR_HI16(proc->script[0]);

    if (id == UINT16_MAX)
    {
        id = proc->map_change_param;
    }

    ApplyMapChange(id);
    AddMapChangeTrap(id);
    RefreshTerrainMap();
    UpdateRoofedUnits();
    RenderMap();

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_MapChangeInstantNoRender(struct EventProc * proc)
{
    fu16 id = SCR_HI16(proc->script[0]);
    fu16 remove_previous;

    if (id == UINT16_MAX)
    {
        id = proc->map_change_param;
        remove_previous = FALSE;
    }
    else
    {
        id = id & 0x7FFF;
        remove_previous = (SCR_HI16(proc->script[0]) & 0x8000);
    }

    ApplyMapChange(id);

    if (remove_previous)
    {
        RemoveMapChangeTrap(id - 1);
    }
    else
    {
        AddMapChangeTrap(id);
    }

    return EVENT_CMDRET_CONTINUE;
}

int EvtCmd_ReRenderMap(struct EventProc * proc)
{
    RefreshTerrainMap();
    UpdateRoofedUnits();

    if (SCR_HI16(proc->script[0]) != 0)
    {
        RefreshAutoWaterShadows();
    }

    RenderMap();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_MapChangePosition(struct EventProc * proc)
{
    u32 script = proc->script[0];

    u8 x = (script >> 16);
    u8 y = (script >> 24);

    int id = GetMapChangeIdAt(x, y);

    if (id == -1)
    {
        id = proc->map_change_param;
    }

    if (!proc->unk_4D)
    {
        RenderMapForFade();

        ApplyMapChange(id);

        AddMapChangeTrap(id);

        RefreshTerrainMap();
        UpdateRoofedUnits();
        RenderMap();

        StartMapFade(TRUE);
    }
    else
    {
        ApplyMapChange(id);

        AddMapChangeTrap(id);

        RefreshTerrainMap();
        UpdateRoofedUnits();
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_SetFaction(struct EventProc * proc)
{
    fu8 pid = proc->script[1];
    int faction = proc->script[2];

    FOR_UNITS_ALL(unit, {
        if (unit->flags & UNIT_FLAG_DEAD)
            continue;

        if (unit->pinfo->id == pid)
            UnitChangeFaction(unit, faction);
    })

    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FlashCursorPosition(struct EventProc * proc)
{
    struct EventFlashCursorProc * flash_cursor_proc;

    fi16 x;
    fi16 y;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    x = SCR_LO16_SIGN(proc->script[1]);
    y = SCR_HI16_SIGN(proc->script[1]);

    flash_cursor_proc = SpawnProc(ProcScr_EventFlashCursor, proc);

    flash_cursor_proc->x = x;
    flash_cursor_proc->y = y;

    proc->idle_func = EventFlashCursorWait;

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_FlashCursorPid(struct EventProc * proc)
{
    struct EventFlashCursorProc * flash_cursor_proc;

    struct Unit * unit = GetUnitByPid(proc->script[1]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    flash_cursor_proc = SpawnProc(ProcScr_EventFlashCursor, proc);

    flash_cursor_proc->x = unit->x;
    flash_cursor_proc->y = unit->y;

    proc->idle_func = EventFlashCursorWait;

    return EVENT_CMDRET_YIELD;
}

void EventFlashCursorWait(struct EventProc * proc)
{
    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        Proc_EndEach(ProcScr_EventFlashCursor);
        proc->idle_func = NULL;
    }
    else
    {
        if (Proc_Find(ProcScr_EventFlashCursor) == NULL)
            proc->idle_func = NULL;
    }
}

void EventFlashCursor_OnInit(struct EventFlashCursorProc * proc)
{
    proc->clock = 60;
}

void EventFlashCursor_OnLoop(struct EventFlashCursorProc * proc)
{
    proc->clock--;

    if (proc->clock <= 0)
        Proc_Break(proc);

    PutMapCursor(proc->x << 4, proc->y << 4, MAP_CURSOR_DEFAULT);
}

int EvtCmd_PutCursor(struct EventProc * proc)
{
    struct EventCursorProc * cursor_proc;

    fi16 x;
    fi16 y;

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
        return EVENT_CMDRET_CONTINUE;

    x = SCR_LO16_SIGN(proc->script[1]);
    y = SCR_HI16_SIGN(proc->script[1]);

    cursor_proc = SpawnProc(ProcScr_EventCursor, proc);

    cursor_proc->x = x;
    cursor_proc->y = y;

    return EVENT_CMDRET_YIELD;
}

void EventCursor_Loop(struct EventCursorProc * proc)
{
    PutMapCursor(proc->x * 16, proc->y * 16, MAP_CURSOR_DEFAULT);
}

int EvtCmd_ClearCursors(struct EventProc * proc)
{
    Proc_EndEach(ProcScr_EventCursor);
    return EVENT_CMDRET_CONTINUE;
}

bool EventIsPidBlueForDisable(fu8 pid)
{
    FOR_UNITS_FACTION(FACTION_BLUE, unit, {
        if (unit->pinfo->id == pid)
            return TRUE;
    })

    return FALSE;
}

int EvtCmd_RemovePosition(struct EventProc * proc)
{
    fi16 x = SCR_LO16_SIGN(proc->script[1]);
    fi16 y = SCR_HI16_SIGN(proc->script[1]);

    struct Unit * unit = GetUnit(gMapUnit[y][x]);

    if (EventIsPidBlueForDisable(unit->pinfo->id))
    {
        unit->flags |= UNIT_FLAG_HIDDEN | UNIT_FLAG_NOT_DEPLOYED;
    }
    else
    {
        ClearUnit(unit);
    }

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RemovePid(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(proc->script[1]);

    if (EventIsPidBlueForDisable(proc->script[1]))
    {
        unit->flags |= UNIT_FLAG_HIDDEN | UNIT_FLAG_NOT_DEPLOYED;
    }
    else
    {
        ClearUnit(unit);
    }

    RefreshEntityMaps();
    RefreshUnitSprites();

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RemovePositionDisplayed(struct EventProc * proc)
{
    fi16 x = SCR_LO16_SIGN(proc->script[1]);
    fi16 y = SCR_HI16_SIGN(proc->script[1]);

    struct Unit * unit = GetUnit(gMapUnit[y][x]);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        if (EventIsPidBlueForDisable(unit->pinfo->id))
        {
            unit->flags |= UNIT_FLAG_HIDDEN | UNIT_FLAG_NOT_DEPLOYED;
        }
        else
        {
            ClearUnit(unit);
        }

        RefreshEntityMaps();
        RefreshUnitSprites();
    }
    else
    {
        Proc * mu;

        proc->pid_param = unit->pinfo->id;

        HideUnitSprite(unit);

        mu = StartMu(unit);

        SetAutoMuDefaultFacing();
        StartMuDeathFade(mu);

        proc->idle_func = EventRemoveDisplayedWait;
        proc->sleep_duration = 60;
    }

    return EVENT_CMDRET_YIELD;
}

int EvtCmd_RemovePidDisplayed(struct EventProc * proc)
{
    struct Unit * unit;

    proc->pid_param = proc->script[1];
    unit = GetUnitByPid(proc->pid_param);

    if ((proc->flags & EVENT_FLAG_SKIPPED) != 0)
    {
        if (EventIsPidBlueForDisable(unit->pinfo->id))
        {
            unit->flags |= UNIT_FLAG_HIDDEN | UNIT_FLAG_NOT_DEPLOYED;
        }
        else
        {
            ClearUnit(unit);
        }

        RefreshEntityMaps();
        RefreshUnitSprites();
    }
    else
    {
        Proc * mu;

        HideUnitSprite(unit);

        mu = StartMu(unit);

        SetAutoMuDefaultFacing();
        StartMuDeathFade(mu);

        proc->idle_func = EventRemoveDisplayedWait;
        proc->sleep_duration = 60;
    }

    return EVENT_CMDRET_YIELD;
}

void EventRemoveDisplayedWait(struct EventProc * proc)
{
    struct Unit * unit = GetUnitByPid(proc->pid_param);

    EndAllMus();

    // BUG: this behavior doesn't match what happens when skipping (see Remove[...]Displayed event commands)
    ClearUnit(unit);

    RefreshEntityMaps();
    RefreshUnitSprites();

    proc->idle_func = NULL;
}
