#ifndef PRELUDE_H
#define PRELUDE_H

#include "attributes.h"
#include "types.h"

// this is used to denote parts of a struct that are not used and only required to produce matching layouts.
// implicit padding due to alignment may also be denoted using this macro.
#define STRUCT_PAD(from, to) unsigned char _pad_##from[(to) - (from)]

struct Vec2i
{
    i16 x, y;
};

#endif // PRELUDE_H
