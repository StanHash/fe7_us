#ifndef GBAIO_H
#define GBAIO_H

#include "prelude.h"

#define REG(type, addr) (*((type volatile *)(addr)))

#define REG_DISPCNT REG(u16, 0x04000000)
#define REG_DISPSTAT REG(u16, 0x04000004)
#define REG_VCOUNT REG(u16, 0x04000006)
#define REG_BG0CNT REG(u16, 0x04000008)
#define REG_BG1CNT REG(u16, 0x0400000A)
#define REG_BG2CNT REG(u16, 0x0400000C)
#define REG_BG3CNT REG(u16, 0x0400000E)
#define REG_BG0HOFS REG(u16, 0x04000010)
#define REG_BG0VOFS REG(u16, 0x04000012)
#define REG_BG1HOFS REG(u16, 0x04000014)
#define REG_BG1VOFS REG(u16, 0x04000016)
#define REG_BG2HOFS REG(u16, 0x04000018)
#define REG_BG2VOFS REG(u16, 0x0400001A)
#define REG_BG3HOFS REG(u16, 0x0400001C)
#define REG_BG3VOFS REG(u16, 0x0400001E)
#define REG_BG2PA REG(i16, 0x04000020)
#define REG_BG2PB REG(i16, 0x04000022)
#define REG_BG2PC REG(i16, 0x04000024)
#define REG_BG2PD REG(i16, 0x04000026)
#define REG_BG2X REG(i32, 0x04000028)
#define REG_BG2Y REG(i32, 0x0400002C)
#define REG_BG3PA REG(i16, 0x04000030)
#define REG_BG3PB REG(i16, 0x04000032)
#define REG_BG3PC REG(i16, 0x04000034)
#define REG_BG3PD REG(i16, 0x04000036)
#define REG_BG3X REG(i32, 0x04000038)
#define REG_BG3Y REG(i32, 0x0400003C)
#define REG_WIN0H REG(u16, 0x04000040)
#define REG_WIN1H REG(u16, 0x04000042)
#define REG_WIN0V REG(u16, 0x04000044)
#define REG_WIN1V REG(u16, 0x04000046)
#define REG_WININ REG(u16, 0x04000048)
#define REG_WINOUT REG(u16, 0x0400004A)
#define REG_MOSAIC REG(u16, 0x0400004C)
#define REG_BLDCNT REG(u16, 0x04000050)
#define REG_BLDALPHA REG(u16, 0x04000052)
#define REG_BLDCA REG(u8, 0x04000052 + 0)
#define REG_BLDCB REG(u8, 0x04000052 + 1)
#define REG_BLDY REG(u8, 0x04000054)

#define REG_SOUND1CNT_L REG(u16, 0x04000060)
#define REG_NR10 REG(u8, 0x04000060)
#define REG_SOUND1CNT_H REG(u16, 0x04000062)
#define REG_NR11 REG(u8, 0x04000062)
#define REG_NR12 REG(u8, 0x04000063)
#define REG_SOUND1CNT_X REG(u16, 0x04000064)
#define REG_NR13 REG(u8, 0x04000064)
#define REG_NR14 REG(u8, 0x04000065)
#define REG_SOUND2CNT_L REG(u16, 0x04000068)
#define REG_NR21 REG(u8, 0x04000068)
#define REG_NR22 REG(u8, 0x04000069)
#define REG_SOUND2CNT_H REG(u16, 0x0400006C)
#define REG_NR23 REG(u8, 0x0400006C)
#define REG_NR24 REG(u8, 0x0400006D)
#define REG_SOUND3CNT_L REG(u16, 0x04000070)
#define REG_NR30 REG(u8, 0x04000070)
#define REG_SOUND3CNT_H REG(u16, 0x04000072)
#define REG_NR31 REG(u8, 0x04000072)
#define REG_NR32 REG(u8, 0x04000073)
#define REG_SOUND3CNT_X REG(u16, 0x04000074)
#define REG_NR33 REG(u8, 0x04000074)
#define REG_NR34 REG(u8, 0x04000075)
#define REG_SOUND4CNT_L REG(u16, 0x04000078)
#define REG_NR41 REG(u8, 0x04000078)
#define REG_NR42 REG(u8, 0x04000079)
#define REG_SOUND4CNT_H REG(u16, 0x0400007C)
#define REG_NR43 REG(u8, 0x0400007C)
#define REG_NR44 REG(u8, 0x0400007D)
#define REG_SOUNDCNT_L REG(u16, 0x04000080)
#define REG_NR50 REG(u8, 0x04000080)
#define REG_NR51 REG(u8, 0x04000081)
#define REG_SOUNDCNT_H REG(u16, 0x04000082)
#define REG_SOUNDCNT_X REG(u16, 0x04000084)
#define REG_NR52 REG(u8, 0x04000084)
#define REG_SOUNDBIAS REG(u16, 0x04000088)
#define REG_SOUNDBIAS_L REG(u8, 0x04000088)
#define REG_SOUNDBIAS_H REG(u8, 0x04000089)
#define REG_WAVE_RAM0 REG(u32, 0x04000090)
#define REG_WAVE_RAM1 REG(u32, 0x04000094)
#define REG_WAVE_RAM2 REG(u32, 0x04000098)
#define REG_WAVE_RAM3 REG(u32, 0x0400009C)
#define REG_FIFO_A REG(u32, 0x040000A0)
#define REG_FIFO_B REG(u32, 0x040000A4)

#define REG_DMA0SAD REG(u32, 0x040000B0)
#define REG_DMA0DAD REG(u32, 0x040000B4)
#define REG_DMA0CNT REG(u32, 0x040000B8)
#define REG_DMA0CNT_L REG(u16, 0x040000B8)
#define REG_DMA0CNT_H REG(u16, 0x040000BA)

#define REG_DMA1SAD REG(u32, 0x040000BC)
#define REG_DMA1DAD REG(u32, 0x040000C0)
#define REG_DMA1CNT REG(u32, 0x040000C4)
#define REG_DMA1CNT_L REG(u16, 0x040000C4)
#define REG_DMA1CNT_H REG(u16, 0x040000C6)

#define REG_DMA2SAD REG(u32, 0x040000C8)
#define REG_DMA2DAD REG(u32, 0x040000CC)
#define REG_DMA2CNT REG(u32, 0x040000D0)
#define REG_DMA2CNT_L REG(u16, 0x040000D0)
#define REG_DMA2CNT_H REG(u16, 0x040000D2)

#define REG_DMA3SAD REG(u32, 0x040000D4)
#define REG_DMA3DAD REG(u32, 0x040000D8)
#define REG_DMA3CNT REG(u32, 0x040000DC)
#define REG_DMA3CNT_L REG(u16, 0x040000DC)
#define REG_DMA3CNT_H REG(u16, 0x040000DE)

#define REG_TM0CNT REG(u32, 0x04000100)
#define REG_TM0CNT_L REG(u16, 0x04000100)
#define REG_TM0CNT_H REG(u16, 0x04000102)
#define REG_TM1CNT REG(u32, 0x04000104)
#define REG_TM1CNT_L REG(u16, 0x04000104)
#define REG_TM1CNT_H REG(u16, 0x04000106)
#define REG_TM2CNT REG(u32, 0x04000108)
#define REG_TM2CNT_L REG(u16, 0x04000108)
#define REG_TM2CNT_H REG(u16, 0x0400010A)
#define REG_TM3CNT REG(u32, 0x0400010C)
#define REG_TM3CNT_L REG(u16, 0x0400010C)
#define REG_TM3CNT_H REG(u16, 0x0400010E)

#define REG_SIOCNT REG(u16, 0x04000128)
#define REG_SIODATA8 REG(u16, 0x0400012A)
#define REG_SIODATA32 REG(u32, 0x04000120)
#define REG_SIOMLT_SEND REG(u16, 0x0400012A)
#define REG_SIOMLT_RECV REG(u64, 0x04000120)
#define REG_SIOMULTI0 REG(u16, 0x04000120)
#define REG_SIOMULTI1 REG(u16, 0x04000122)
#define REG_SIOMULTI2 REG(u16, 0x04000124)
#define REG_SIOMULTI3 REG(u16, 0x04000126)

#define REG_KEYINPUT REG(u16, 0x04000130)
#define REG_KEYCNT REG(u16, 0x04000132)

#define REG_RCNT REG(u16, 0x04000134)

#define REG_IE REG(u16, 0x04000200)
#define REG_IF REG(u16, 0x04000202)
#define REG_IME REG(u16, 0x04000208)

#define REG_WAITCNT REG(u16, 0x04000204)

// SOUNDCNT_H

enum
{
    SOUND_CGB_MIX_QUARTER = 0x0000,
    SOUND_CGB_MIX_HALF = 0x0001,
    SOUND_CGB_MIX_FULL = 0x0002,
    SOUND_A_MIX_HALF = 0x0000,
    SOUND_A_MIX_FULL = 0x0004,
    SOUND_B_MIX_HALF = 0x0000,
    SOUND_B_MIX_FULL = 0x0008,
    SOUND_ALL_MIX_FULL = 0x000E,
    SOUND_A_RIGHT_OUTPUT = 0x0100,
    SOUND_A_LEFT_OUTPUT = 0x0200,
    SOUND_A_TIMER_0 = 0x0000,
    SOUND_A_TIMER_1 = 0x0400,
    SOUND_A_FIFO_RESET = 0x0800,
    SOUND_B_RIGHT_OUTPUT = 0x1000,
    SOUND_B_LEFT_OUTPUT = 0x2000,
    SOUND_B_TIMER_0 = 0x0000,
    SOUND_B_TIMER_1 = 0x4000,
    SOUND_B_FIFO_RESET = 0x8000,
};

// SOUNDCNT_X

enum
{
    SOUND_1_ON = 0x0001,
    SOUND_2_ON = 0x0002,
    SOUND_3_ON = 0x0004,
    SOUND_4_ON = 0x0008,
    SOUND_MASTER_ENABLE = 0x0080,
};

// DMA
#define DMA_DST_INC 0x0000
#define DMA_DST_DEC 0x0020
#define DMA_DST_FIXED 0x0040
#define DMA_DST_RELOAD 0x0060
#define DMA_SRC_INC 0x0000
#define DMA_SRC_DEC 0x0080
#define DMA_SRC_FIXED 0x0100
#define DMA_REPEAT 0x0200
#define DMA_16BIT 0x0000
#define DMA_32BIT 0x0400
#define DMA_DREQ_ON 0x0800
#define DMA_START_NOW 0x0000
#define DMA_START_VBLANK 0x1000
#define DMA_START_HBLANK 0x2000
#define DMA_START_SPECIAL 0x3000
#define DMA_START_MASK 0x3000
#define DMA_INTR_ENABLE 0x4000
#define DMA_ENABLE 0x8000

#define DmaSet(dma_num, src, dst, control)                                                                             \
    {                                                                                                                  \
        u32 volatile * dma_regs = (u32 volatile *)&REG_DMA##dma_num##SAD;                                              \
        dma_regs[0] = (u32 volatile)(src);                                                                             \
        dma_regs[1] = (u32 volatile)(dst);                                                                             \
        dma_regs[2] = (u32 volatile)(control);                                                                         \
        dma_regs[2];                                                                                                   \
    }

#define DMA_FILL(dma_num, value, dst, size, bit)                                                                       \
    {                                                                                                                  \
        u##bit volatile tmp = (u##bit volatile)(value);                                                                \
        DmaSet(                                                                                                        \
            dma_num, &tmp, dst,                                                                                        \
            (DMA_ENABLE | DMA_START_NOW | DMA_##bit##BIT | DMA_SRC_FIXED | DMA_DST_INC) << 16 | ((size) / (bit / 8))); \
    }

#define DmaFill16(dma_num, value, dst, size) DMA_FILL(dma_num, value, dst, size, 16)
#define DmaFill32(dma_num, value, dst, size) DMA_FILL(dma_num, value, dst, size, 32)

// Note that the DMA clear macros cause the DMA control value to be calculated
// at runtime rather than compile time. The size is divided by the DMA transfer
// unit size (2 or 4 bytes) and then combined with the DMA control flags using a
// bitwise OR operation.

#define DMA_CLEAR(dma_num, dst, size, bit)                                                                             \
    {                                                                                                                  \
        u##bit volatile * _dest = (u##bit volatile *)(dst);                                                            \
        u32 _size = size;                                                                                              \
        DmaFill##bit(dma_num, 0, _dest, _size);                                                                        \
    }

#define DmaClear16(dma_num, dst, size) DMA_CLEAR(dma_num, dst, size, 16)
#define DmaClear32(dma_num, dst, size) DMA_CLEAR(dma_num, dst, size, 32)

#define DMA_COPY(dma_num, src, dst, size, bit)                                                                         \
    DmaSet(                                                                                                            \
        dma_num, src, dst,                                                                                             \
        (DMA_ENABLE | DMA_START_NOW | DMA_##bit##BIT | DMA_SRC_INC | DMA_DST_INC) << 16 | ((size) / (bit / 8)))

#define DmaCopy16(dma_num, src, dst, size) DMA_COPY(dma_num, src, dst, size, 16)
#define DmaCopy32(dma_num, src, dst, size) DMA_COPY(dma_num, src, dst, size, 32)

// timer
#define TIMER_1CLK 0x00
#define TIMER_64CLK 0x01
#define TIMER_256CLK 0x02
#define TIMER_1024CLK 0x03
#define TIMER_INTR_ENABLE 0x40
#define TIMER_ENABLE 0x80

// waitcnt
#define WAITCNT_SRAM_4 (0 << 0)
#define WAITCNT_SRAM_3 (1 << 0)
#define WAITCNT_SRAM_2 (2 << 0)
#define WAITCNT_SRAM_8 (3 << 0)
#define WAITCNT_SRAM_MASK (3 << 0)

#define WAITCNT_WS0_N_4 (0 << 2)
#define WAITCNT_WS0_N_3 (1 << 2)
#define WAITCNT_WS0_N_2 (2 << 2)
#define WAITCNT_WS0_N_8 (3 << 2)
#define WAITCNT_WS0_N_MASK (3 << 2)

#define WAITCNT_WS0_S_2 (0 << 4)
#define WAITCNT_WS0_S_1 (1 << 4)

#define WAITCNT_WS1_N_4 (0 << 5)
#define WAITCNT_WS1_N_3 (1 << 5)
#define WAITCNT_WS1_N_2 (2 << 5)
#define WAITCNT_WS1_N_8 (3 << 5)
#define WAITCNT_WS1_N_MASK (3 << 5)

#define WAITCNT_WS1_S_4 (0 << 7)
#define WAITCNT_WS1_S_1 (1 << 7)

#define WAITCNT_WS2_N_4 (0 << 8)
#define WAITCNT_WS2_N_3 (1 << 8)
#define WAITCNT_WS2_N_2 (2 << 8)
#define WAITCNT_WS2_N_8 (3 << 8)
#define WAITCNT_WS2_N_MASK (3 << 8)

#define WAITCNT_WS2_S_8 (0 << 10)
#define WAITCNT_WS2_S_1 (1 << 10)

#define WAITCNT_PHI_OUT_NONE (0 << 11)
#define WAITCNT_PHI_OUT_4MHZ (1 << 11)
#define WAITCNT_PHI_OUT_8MHZ (2 << 11)
#define WAITCNT_PHI_OUT_16MHZ (3 << 11)
#define WAITCNT_PHI_OUT_MASK (3 << 11)

#define WAITCNT_PREFETCH_ENABLE (1 << 14)

// memory

#define EWRAM_ADDR 0x02000000
#define EWRAM_SIZE 0x00040000

#define IWRAM_ADDR 0x03000000
#define IWRAM_SIZE 0x00008000

#endif // GBAIO_H
