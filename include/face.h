#ifndef FACE_H
#define FACE_H

#include "prelude.h"

#define FACE_COUNT 4

struct FaceConfigEnt
{
    /* 00 */ u32 chr_off;
    /* 04 */ u16 pal_id;
};

extern struct FaceConfigEnt gFaceConfig[FACE_COUNT];

#endif // FACE_H
