#ifndef UNIT_H
#define UNIT_H

#include "prelude.h"

#define FACTION_BLUE 0x00
#define UNITS_PER_FACTION 0x40

#define UNIT_COUNT_BLUE 62
#define UNIT_COUNT_RED 50
#define UNIT_COUNT_GREEN 20
#define UNIT_COUNT_PURPLE 5

enum
{
    UNIT_ATTR_MOUNTED = 1 << 0,
    UNIT_ATTR_CANTO = 1 << 1,
    UNIT_ATTR_STEAL = 1 << 2,
    UNIT_ATTR_THIEF = 1 << 3,
    UNIT_ATTR_DANCE = 1 << 4,
    UNIT_ATTR_PLAY = 1 << 5,
    UNIT_ATTR_CRIT_BONUS = 1 << 6,
    UNIT_ATTR_BALLISTA = 1 << 7,
    UNIT_ATTR_PROMOTED = 1 << 8,
    UNIT_ATTR_SUPPLY = 1 << 9,
    UNIT_ATTR_HORSE = 1 << 10,
    UNIT_ATTR_WYVERN = 1 << 11,
    UNIT_ATTR_PEGASUS = 1 << 12,
    UNIT_ATTR_LORD = 1 << 13,
    UNIT_ATTR_FEMALE = 1 << 14,
    UNIT_ATTR_BOSS = 1 << 15,
    UNIT_ATTR_LOCK_ROY = 1 << 16,
    UNIT_ATTR_LOCK_MYRM = 1 << 17,
    UNIT_ATTR_MONSTER = 1 << 18,
    UNIT_ATTR_MORPH = 1 << 19,
    UNIT_ATTR_UNSELECTABLE = 1 << 20,
    UNIT_ATTR_TRIANGLE_ATTACK_PEGASI = 1 << 21,
    UNIT_ATTR_TRIANGLE_ATTACK_ARMORS = 1 << 22,
    UNIT_ATTR_ALT_PINFO = 1 << 23,
    UNIT_ATTR_FINAL_BOSS = 1 << 24,
    UNIT_ATTR_ASSASSIN = 1 << 25,
    UNIT_ATTR_MAGIC_SEAL = 1 << 26,
    UNIT_ATTR_DROPS_ITEM = 1 << 27,
    UNIT_ATTR_LOCK_ELIWOOD = 1 << 28,
    UNIT_ATTR_LOCK_HECTOR = 1 << 29,
    UNIT_ATTR_LOCK_LYN = 1 << 30,
    UNIT_ATTR_LOCK_ATHOS = 1 << 31,

    // Helpers
    UNIT_ATTRS_REFRESH = UNIT_ATTR_DANCE | UNIT_ATTR_PLAY,
    UNIT_ATTRS_FLYING = UNIT_ATTR_WYVERN | UNIT_ATTR_PEGASUS,
    UNIT_ATTRS_TRIANGLE_ATTACK_ANY = UNIT_ATTR_TRIANGLE_ATTACK_PEGASI | UNIT_ATTR_TRIANGLE_ATTACK_ARMORS,
};

enum
{
    UNIT_FACTION_BLUE = 0x00,   // player units
    UNIT_FACTION_GREEN = 0x40,  // ally npc units
    UNIT_FACTION_RED = 0x80,    // enemy units
    UNIT_FACTION_PURPLE = 0xC0, // link arena 4th team
};

enum
{
    UNIT_FLAG_HIDDEN = 1 << 0,
    UNIT_FLAG_TURN_ENDED = 1 << 1,
    UNIT_FLAG_DEAD = 1 << 2,
    UNIT_FLAG_NOT_DEPLOYED = 1 << 3,
    UNIT_FLAG_RESCUING = 1 << 4,
    UNIT_FLAG_RESCUED = 1 << 5,
    UNIT_FLAG_HAS_MOVED = 1 << 6,
    UNIT_FLAG_UNDER_A_ROOF = 1 << 7,
    UNIT_FLAG_FOG_SEEN = 1 << 8,
    UNIT_FLAG_FOG_HIDDEN = 1 << 9,
    UNIT_FLAG_HAS_MOVED_AI = 1 << 10,
    UNIT_FLAG_IN_BALLISTA = 1 << 11,
    UNIT_FLAG_BIT12 = 1 << 12, // unk, checked by vanilla AiFillDangerMap. In fe8: UNIT_FLAG_DROPS_ITEM
    UNIT_FLAG_GROWTH_BOOST = 1 << 13,
    UNIT_FLAG_SOLOANIM_1 = 1 << 14,
    UNIT_FLAG_SOLOANIM_2 = 1 << 15,
    UNIT_FLAG_AWAY = 1 << 16,
    UNIT_FLAG_ARENA_A = 1 << 17,
    UNIT_FLAG_ARENA_B = 1 << 18,
    UNIT_FLAG_ARENA_C = 1 << 19,

    // Helpers
    UNIT_FLAGS_UNAVAILABLE = UNIT_FLAG_DEAD | UNIT_FLAG_NOT_DEPLOYED | UNIT_FLAG_AWAY,
};

enum
{
    UNIT_STATUS_NONE = 0,
    UNIT_STATUS_POISON = 1,
    UNIT_STATUS_SLEEP = 2,
    UNIT_STATUS_SILENCED = 3,
    UNIT_STATUS_BERSERK = 4,
    UNIT_STATUS_ATTACK = 5,
    UNIT_STATUS_DEFENSE = 6,
    UNIT_STATUS_CRIT = 7,
    UNIT_STATUS_AVOID = 8,
};

struct PInfo
{
    /* 00 */ u16 msg_name;
    /* 02 */ u16 msg_desc;
    /* 04 */ u8 id;
    /* 05 */ u8 jid_default;
    /* 06 */ u16 fid;
    /* 08 */ u8 chibi_id;
    /* 09 */ u8 affinity;
    /* 0A */ u8 sort_key;

    /* 0B */ i8 base_level;
    /* 0C */ i8 base_hp;
    /* 0D */ i8 base_pow;
    /* 0E */ i8 base_skl;
    /* 0F */ i8 base_spd;
    /* 10 */ i8 base_def;
    /* 11 */ i8 base_res;
    /* 12 */ i8 base_lck;
    /* 13 */ i8 bonus_con;

    /* 14 */ u8 wexp[8];

    /* 1C */ u8 growth_hp;
    /* 1D */ u8 growth_pow;
    /* 1E */ u8 growth_skl;
    /* 1F */ u8 growth_spd;
    /* 20 */ u8 growth_def;
    /* 21 */ u8 growth_res;
    /* 22 */ u8 growth_lck;

    /* 23 */ u8 banim_pal_a;
    /* 24 */ u8 banim_pal_b;
    /* 25 */ u8 banim_info_override[2];

    /* 27 */ ALIGN_PAD(0x27, 0x28);

    /* 28 */ u32 attributes;

    /* 2C */ struct SupportInfo const * support_info;

    /* 30 */ u8 generic_talk_tone;
};

struct JInfo
{
    /* 00 */ u16 msg_name;
    /* 02 */ u16 msg_desc;
    /* 04 */ u8 id;
    /* 05 */ u8 jid_promote;
    /* 06 */ u8 map_sprite;
    /* 07 */ u8 walk_speed;
    /* 08 */ u16 fid;
    /* 0A */ u8 sort_key;

    /* 0B */ i8 base_hp;
    /* 0C */ i8 base_pow;
    /* 0D */ i8 base_skl;
    /* 0E */ i8 base_spd;
    /* 0F */ i8 base_def;
    /* 10 */ i8 base_res;
    /* 11 */ i8 base_con;
    /* 12 */ i8 base_mov;

    /* 13 */ i8 max_hp;
    /* 14 */ i8 max_pow;
    /* 15 */ i8 max_skl;
    /* 16 */ i8 max_spd;
    /* 17 */ i8 max_def;
    /* 18 */ i8 max_res;
    /* 19 */ i8 max_con;

    /* 1A */ i8 power_level;

    /* 1B */ i8 growth_hp;
    /* 1C */ i8 growth_pow;
    /* 1D */ i8 growth_skl;
    /* 1E */ i8 growth_spd;
    /* 1F */ i8 growth_def;
    /* 20 */ i8 growth_res;
    /* 21 */ i8 growth_lck;

    /* 22 */ u8 promotion_hp;
    /* 23 */ u8 promotion_pow;
    /* 24 */ u8 promotion_skl;
    /* 25 */ u8 promotion_spd;
    /* 26 */ u8 promotion_def;
    /* 27 */ u8 promotion_res;

    /* 28 */ u32 attributes;

    /* 2C */ u8 wexp[8];

    /* 34 */ void const * banim_info;

    /* 38 */ i8 const * mov_table[3];
    /* 44 */ i8 const * avo_terrain_table;
    /* 48 */ i8 const * def_terrain_table;
    /* 4C */ i8 const * res_terrain_table;

    /* 50 */ void const * unk_50;
};

struct Unit
{
    /* 00 */ struct PInfo const * pinfo;
    /* 04 */ struct JInfo const * jinfo;
    /* 08 */ i8 level;
    /* 09 */ u8 exp;
    /* 0A */ u8 ai_flags;
    /* 0B */ i8 id;
    /* 0C */ u32 flags;
    /* 10 */ i8 x;
    /* 11 */ i8 y;
    /* 12 */ i8 max_hp;
    /* 13 */ i8 hp;
    /* 14 */ i8 pow;
    /* 15 */ i8 skl;
    /* 16 */ i8 spd;
    /* 17 */ i8 def;
    /* 18 */ i8 res;
    /* 19 */ i8 lck;
    /* 1A */ i8 bonus_con;
    /* 1B */ u8 rescue;
    /* 1C */ u8 ballista_trap;
    /* 1D */ i8 bonus_mov;
    /* 1E */ u16 items[5];
    /* 28 */ u8 wexp[8];
    /* 30 */ u8 status : 4;
    /* 30 */ u8 status_duration : 4;
    /* 31 */ u8 torch : 4;
    /* 31 */ u8 barrier : 4;
    /* 32 */ u8 supports[7];
    /* 39 */ u8 support_bits;
    /* 3A */ STRUCT_PAD(0x3A, 0x3C);
    /* 3C */ struct UnitSprite * map_sprite;
    /* 40 */ u16 ai_config;
    /* 42 */ u8 ai_a;
    /* 43 */ u8 ai_a_pc;
    /* 44 */ u8 ai_b;
    /* 45 */ u8 ai_b_pc;
    /* 46 */ u8 unk_46;
    /* 47 */ STRUCT_PAD(0x47, 0x48);
    /* 48 */ // end
};

struct UnitInfo
{
    /* 00 */ u8 pid;
    /* 01 */ u8 jid;
    /* 02 */ u8 pid_lead;
    /* 03 */ u8 autolevel : 1;
    /* 03 */ u8 faction_id : 2;
    /* 03 */ u8 level : 5;
    /* 04 */ u8 x_load, y_load;
    /* 06 */ u8 x_move, y_move;
    /* 08 */ u8 item[4];
    /* 0C */ u8 ai[4];
};

// ... func_080174D8(...)
// ... ClearUnit(...)
// ... func_08017530(...)
// ... func_0801754C(...)
// ... func_08017584(...)
// ... GetUnitVision(...)
// ... SetUnitStatus(...)
// ... func_08017600(...)
// ... func_08017610(...)
// ... UnitAddItem(...)
// ... func_08017674(...)
// ... UnitRemoveInvalidItems(...)
// ... GetUnitItemCount(...)
// ... func_080176F8(...)
// ... BatchCreateUnits(...)
// ... func_08017754(...)
// ... CreateUnit(...)
// ... UnitInitFromInfo(...)
// ... func_080178F4(...)
// ... UnitInitStats(...)
// ... func_080179BC(...)
// ... UnitInitSupports(...)
// ... UnitAutolevelWeaponExp(...)
// ... UnitAutolevelCore(...)
// ... UnitApplyBonusLevels(...)
// ... UnitAutolevel(...)
// ... UnitAutolevelPlayer(...)
// ... UnitCheckStatOverflow(...)
struct Unit * GetUnitByPid(int pid);
// ... func_08017D70(...)
// ... CanUnitCarry(...)
// ... UnitRescue(...)
// ... UnitDropRescue(...)
// ... UnitGiveRescue(...)
// ... KillUnit(...)
// ... UnitChangeFaction(...)
// ... UnitSyncMovement(...)
// ... func_08017F6C(...)
// ... UnitBeginAction(...)
// ... UnitBeginReMoveAction(...)
// ... func_080181D0(...)
// ... func_08018268(...)
// ... func_08018300(...)
// ... func_080183F4(...)
// ... UnitUpdateUsedItem(...)
// ... GetUnitAid(...)
// ... GetUnitMagRange(...)
// ... UnitKnowsMagic(...)
// ... func_08018504(...)
// ... GetUnitKeyItemSlotForTerrain(...)
// ... GetAidIconFromAttributes(...)
// ... func_080185AC(...)
// ... func_08018624(...)
// ... func_0801865C(...)
// ... func_0801871C(...)
// ... func_0801878C(...)
// ... func_080187BC(...)
// ... GetUnitMovementCost(...)
// ... func_08018814(...)
// ... func_08018830(...)
// ... func_08018888(...)
// ... func_080188D4(...)
// ... func_08018980(...)
// ... GetUnitCurrentHp(...)
// ... GetUnitMaxHp(...)
// ... GetUnitPower(...)
// ... GetUnitSkill(...)
// ... GetUnitSpeed(...)
// ... GetUnitDefense(...)
// ... GetUnitResistance(...)
// ... GetUnitLuck(...)
// ... GetUnitFid(...)
// ... func_08018BF4(...)
// ... func_08018C20(...)
// ... func_08018C38(...)
// ... func_08018C40(...)
// ... func_08018C7C(...)
// ... func_08018CC0(...)
// ... func_08018CF0(...)
struct Unit * GetUnit(int id);
// ... GetJobInfo(...)
// ... func_08018D38(...)
// ... func_08018D50(...)
// ... func_08018D68(...)

extern u8 gActiveUnitId;
extern struct Vec2i gActiveUnitMoveOrigin;

extern struct Unit * gActiveUnit;

extern struct Unit gBlueUnits[UNIT_COUNT_BLUE];
extern struct Unit gRedUnits[UNIT_COUNT_RED];
extern struct Unit gGreenUnits[UNIT_COUNT_GREEN];
extern struct Unit gPurpleUnits[UNIT_COUNT_PURPLE];

#define UNIT_ATTRIBUTES(unit) ((unit)->pinfo->attributes | ((unit)->jinfo->attributes))

#define FOR_UNITS(begin, end, var_name, body)                                                                          \
    {                                                                                                                  \
        int __unit_id;                                                                                                 \
        struct Unit * var_name;                                                                                        \
        for (__unit_id = (begin); __unit_id < (end); ++__unit_id)                                                      \
        {                                                                                                              \
            var_name = GetUnit(__unit_id);                                                                             \
            if (var_name == NULL)                                                                                      \
                continue;                                                                                              \
            if (var_name->pinfo == NULL)                                                                               \
                continue;                                                                                              \
            body                                                                                                       \
        }                                                                                                              \
    }

#define FOR_UNITS_FACTION(faction, var_name, body)                                                                     \
    FOR_UNITS((faction) + 1, (faction) + UNITS_PER_FACTION, var_name, body)

#define FOR_UNITS_ALL(var_name, body) FOR_UNITS(1, 0xC0, var_name, body)

#endif // UNIT_H
