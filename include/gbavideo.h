#ifndef GBAVIDEO_H
#define GBAVIDEO_H

#include "prelude.h"

#define VRAM_ADDR 0x06000000
#define VRAM_SIZE 0x18000
#define VRAM ((void *)VRAM_ADDR)

#define PLTT_ADDR 0x05000000
#define PLTT_SIZE 0x400
#define PLTT ((void *)PLTT_ADDR)

#define OAM_ADDR 0x07000000
#define OAM_SIZE 0x400
#define OAM ((void *)OAM_ADDR)

#define BGVRAM (VRAM + 0x00000)
#define OBVRAM (VRAM + 0x10000)

#define BGPLTT (PLTT + 0x000)
#define OBPLTT (PLTT + 0x200)

#define OAM_COUNT 0x80
#define CHRS_PER_ROW 0x20
#define CHR4_SIZE 0x20
#define CHR8_SIZE 0x40

#define CHR_SIZE CHR4_SIZE

#endif // GBAVIDEO_H
