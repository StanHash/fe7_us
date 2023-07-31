#ifndef TEXT_H
#define TEXT_H

#include "prelude.h"

#define SPECIAL_CHARACTER_COUNT 0x40

struct Glyph; // TODO

struct Text
{
    /* 00 */ u16 chr_position;
    /* 02 */ u8 x;
    /* 03 */ u8 color;
    /* 04 */ u8 tile_width;
    /* 05 */ i8 db_enabled;
    /* 06 */ u8 db_id;
    /* 07 */ i8 is_printing;
};

struct Font
{
    /* 00 */ u8 * draw_dest;
    /* 04 */ struct Glyph const * const * glyphs;
    /* 08 */ void (*draw_glyph)(struct Text * text, struct Glyph const * glyph);
    /* 0C */ u8 * (*get_draw_dest)(struct Text * text);
    /* 10 */ u16 tileref;
    /* 12 */ u16 chr_counter;
    /* 14 */ u16 pal_id;
    /* 16 */ u8 lang;
};

struct SpecialCharEnt
{
    /* 00 */ i8 color;
    /* 01 */ i8 id;
    /* 02 */ i16 chr_position;
};

#endif // TEXT_H
