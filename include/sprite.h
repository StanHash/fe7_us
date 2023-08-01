#ifndef SPRITE_H
#define SPRITE_H

#include "prelude.h"

#include "gbavideo.h"

#define SPRITE_COUNT OAM_COUNT
#define SPRITE_LAYER_COUNT 0x10

struct SpriteEnt
{
    /* 00 */ struct SpriteEnt * next;
    /* 04 */ i16 oam1;
    /* 06 */ i16 oam0;
    /* 08 */ u16 oam2;
    /* 0A */ STRUCT_PAD(0x0A, 0x0C);
    /* 0C */ u16 const * sprite;
};

extern struct SpriteEnt gSpriteList[SPRITE_COUNT];
extern struct SpriteEnt gSpriteLayers[SPRITE_LAYER_COUNT];

#endif // SPRITE_H
