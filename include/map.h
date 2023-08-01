#ifndef MAP_H
#define MAP_H

#include "prelude.h"

#define MAP_BUFFER_SIZE 0x7B8
#define TILESET_METATILES 0x400

extern struct Vec2i gMapSize;

extern u8 ** gMapUnit;
extern u8 ** gMapTerrain;
extern u8 ** gMapMovement;
extern u8 ** gMapRange;
extern u8 ** gMapFog;
extern u8 ** gMapHidden;
extern u8 ** gMapOther;

#define gMapRangeSigned ((i8 **)gMapRange)
#define gMapMovementSigned ((i8 **)gMapMovement)

#endif // MAP_H
