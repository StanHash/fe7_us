#ifndef AUDIO_H
#define AUDIO_H

#include "prelude.h"

struct BgmStatus
{
    /* 00 */ STRUCT_PAD(0x00, 0x02);
    /* 02 */ u16 overwritten_song;
    /* 04 */ u16 song;
    /* 06 */ i8 is_song_playing;
    /* 07 */ u8 unk_07; // not in fe6
    /* 08 */ u8 unk_08; // not in fe6
};

extern struct BgmStatus gBgmStatus;

#endif // AUDIO_H
