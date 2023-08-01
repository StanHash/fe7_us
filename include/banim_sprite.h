#ifndef BANIM_SPRITE_H
#define BANIM_SPRITE_H

#include "prelude.h"

#define BANIM_SPRITE_COUNT 50

struct BanimSprite
{
    /* 00 */ u16 flags;
    /* 02 */ i16 x;
    /* 04 */ i16 y;
    /* 06 */ i16 timer;
    /* 08 */ u16 oam2;
    /* 0A */ u16 layer;
    /* 0C */ u16 flags2;
    /* 0E */ u16 next_round_id; // ??
    /* 10 */ u16 flags3;
    /* 12 */ u8 current_round_type; // ??
    /* 13 */ u8 unk_13;

    // command queue
    /* 14 */ u8 commands_len;
    /* 15 */ u8 commands[7];

    /* 1C */ u32 oam01;

    /* 20 */ u32 const * script_pc;
    /* 24 */ u32 const * script;

    /* 28 */ void const * sheet_img;
    /* 2C */ void const * sheet_img_buf;
    /* 30 */ void const * sprite_data_base; // aka "OAM data"

    /* 34 */ struct BanimSprite * prev;
    /* 38 */ struct BanimSprite * next;

    /* 3C */ void const * sprite_data;
    /* 40 */ void const * unk_40;
    /* 44 */ void const * unk_44;
};

extern struct BanimSprite gBanimSprites[BANIM_SPRITE_COUNT];
extern struct BanimSprite * gHeadBanimSprite;

#endif // BANIM_SPRITE_H
