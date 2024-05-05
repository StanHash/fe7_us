#ifndef BM_H
#define BM_H

#include "prelude.h"

struct BmStatus
{
    /* 00 */ i8 main_loop_ended;
    /* 01 */ i8 lock;
    /* 02 */ i8 lock_display;
    /* 03 */ STRUCT_PAD(0x03, 0x04);
    /* 04 */ u8 flags;
    /* 05 */ STRUCT_PAD(0x05, 0x06);
    /* 06 */ u16 main_loop_end_scanline;
    /* 08 */ STRUCT_PAD(0x08, 0x0C);
    /* 0C */ struct Vec2i camera;
    /* 10 */ struct Vec2i camera_previous;
    /* 14 */ struct Vec2i cursor;
    /* 18 */ struct Vec2i cursor_previous;
    /* 1C */ struct Vec2i cursor_sprite_target;
    /* 20 */ struct Vec2i cursor_sprite;
    /* 24 */ struct Vec2i map_render_anchor;
    /* 28 */ struct Vec2i camera_max;
    /* 2C */ u16 inventory_item_overflow;
    /* 2E */ u16 convoy_item_overflow;
    /* 30 */ i8 unk_30;
    /* 31 */ i8 unk_31;
    /* 32 */ i16 unk_32;
    /* 34 */ i16 unk_34;
    /* 36 */ i8 unk_36;
    /* 37 */ i8 unk_37;
    /* 38 */ u8 alt_blend_a_ca;
    /* 39 */ u8 alt_blend_a_cb;
    /* 3A */ u8 alt_blend_b_ca;
    /* 3B */ u8 alt_blend_b_cb;
    /* 3C */ u8 just_resumed;
    /* 3D */ u8 partial_actions_taken;
    /* 3E */ u8 swap_action_range_count;
    /* 3F */ i8 unk_3F;
};

struct PlayStatus
{
    /* 00 */ u32 time_saved;
    /* 04 */ u32 time_chapter_started;
    /* 08 */ i32 gold;
    /* 0C */ u8 save_id;
    /* 0D */ u8 vision;
    /* 0E */ i8 chapter;
    /* 0F */ u8 faction;
    /* 10 */ u16 turn;
    /* 12 */ u8 x_cursor, y_cursor;
    /* 14 */ u8 flags;
    /* 15 */ u8 weather;
    /* 16 */ u16 support_gain;
    /* 18 */ u8 playthrough_id;
    /* 19 */ u8 ending_id : 4;
    /* 19 */ u8 unk_19_4 : 4;
    /* 1A */ u8 last_sort_id;
    /* 1B */ u8 scenario;

    /* 1C */ STRUCT_PAD(0x1C, 0x40); // this is all fields new to fe7

    /* 40 */ // option bits
    /* bit  0 */ u32 unk_40_1 : 1;
    /* bit  1 */ u32 config_terrain_mapui : 1;
    /* bit  2 */ u32 config_unit_mapui : 2;
    /* bit  4 */ u32 config_no_auto_cursor : 1;
    /* bit  5 */ u32 config_talk_speed : 2;
    /* bit  7 */ u32 config_walk_speed : 1;
    /* bit  8 */ u32 config_bgm_disable : 1;
    /* bit  9 */ u32 config_se_disable : 1;
    /* bit 10 */ u32 config_window_theme : 2;
    /* bit 12 */ u32 unk_41_5 : 1;
    /* bit 13 */ u32 unk_41_6 : 1;
    /* bit 14 */ u32 config_no_auto_end_turn : 1;
    /* bit 15 */ u32 config_no_subtitle_help : 1;
    /* bit 16 */ u32 config_battle_anim : 2;
    /* bit 18 */ u32 config_battle_preview_kind : 2;
    /* bit 20 */ u32 unk_42_5 : 1;
    /* bit 21 */ u32 unk_42_6 : 1;
    /* bit 22 */ u32 debug_control_red : 2;
    /* bit 24 */ u32 debug_control_green : 2;
    /* bit 26 */ u32 unk_43_3 : 6;

    /* 44 */ STRUCT_PAD(0x44, 0x48);
};

extern struct BmStatus gBmStatus;
extern struct PlayStatus gPlayStatus;

extern struct Vec2i gLastCoordMapCursorDrawn;
extern u32 gLastTimeMapCursorDrawn;

extern i8 gCameraAnimTable[0x100];

#endif // BM_H
