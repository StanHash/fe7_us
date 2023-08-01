#include "banim_sprite.h"

// NOTE: data only

struct BanimSprite EWRAM_DATA gBanimSprites[BANIM_SPRITE_COUNT] = { 0 };
struct BanimSprite * EWRAM_DATA gHeadBanimSprite = NULL;
