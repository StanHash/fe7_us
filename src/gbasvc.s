    .syntax unified

    @ ArcTan2

    .global ArcTan2
    .type ArcTan2, function

    .thumb
ArcTan2:
    svc   #0x0A
    bx    lr

    .align 2, 0
    .size ArcTan2, . - ArcTan2

    @ BgAffineSet

    .global BgAffineSet
    .type BgAffineSet, function

    .thumb
BgAffineSet:
    svc   #0x0E
    bx    lr

    .align 2, 0
    .size BgAffineSet, . - BgAffineSet

    @ CpuFastSet

    .global CpuSetFast
    .type CpuSetFast, function

    .thumb
CpuSetFast:
    svc   #0x0C
    bx    lr

    .align 2, 0
    .size CpuSetFast, . - CpuSetFast

    @ CpuSet

    .global CpuSet
    .type CpuSet, function

    .thumb
CpuSet:
    svc   #0x0B
    bx    lr

    .align 2, 0
    .size CpuSet, . - CpuSet

    @ Div

    .global Div
    .type Div, function

    .thumb
Div:
    svc   #0x06
    bx    lr

    .align 2, 0
    .size Div, . - Div

    @ DivRem

    .global DivRem
    .type DivRem, function

    .thumb
DivRem:
    svc   #0x06
    adds  r0, r1, #0
    bx    lr

    .align 2, 0
    .size DivRem, . - DivRem

    @ HuffUnComp

    .global HuffUnComp
    .type HuffUnComp, function

    .thumb
HuffUnComp:
    svc   #0x13
    bx    lr

    .align 2, 0
    .size HuffUnComp, . - HuffUnComp

    @ LZ77UnComp16bit

    .global LZ77UnComp16bit
    .type LZ77UnComp16bit, function

    .thumb
LZ77UnComp16bit:
    svc   #0x12
    bx    lr

    .align 2, 0
    .size LZ77UnComp16bit, . - LZ77UnComp16bit

    @ LZ77UnComp8bit

    .global LZ77UnComp8bit
    .type LZ77UnComp8bit, function

    .thumb
LZ77UnComp8bit:
    svc   #0x11
    bx    lr

    .align 2, 0
    .size LZ77UnComp8bit, . - LZ77UnComp8bit

    @ MultiBoot

    .global MultiBoot
    .type MultiBoot, function

    .thumb
MultiBoot:
    movs  r1, #1
    svc   #0x25
    bx    lr

    .align 2, 0
    .size MultiBoot, . - MultiBoot

    @ ObjAffineSet

    .global ObjAffineSet
    .type ObjAffineSet, function

    .thumb
ObjAffineSet:
    svc   #0x0F
    bx    lr

    .align 2, 0
    .size ObjAffineSet, . - ObjAffineSet

    @ RLUnComp16bit

    .global RLUnComp16bit
    .type RLUnComp16bit, function

    .thumb
RLUnComp16bit:
    svc   #0x15
    bx    lr

    .align 2, 0
    .size RLUnComp16bit, . - RLUnComp16bit

    @ RLUnComp8bit

    .global RLUnComp8bit
    .type RLUnComp8bit, function

    .thumb
RLUnComp8bit:
    svc   #0x14
    bx    lr

    .align 2, 0
    .size RLUnComp8bit, . - RLUnComp8bit

    @ SoftReset

    .global SoftReset
    .type SoftReset, function

    .thumb
SoftReset:
    ldr   r3, =0x04000208 @ IME
    movs  r2, #0
    strb  r2, [r3]
    ldr   r1, =0x03007F00
    mov   sp, r1
    svc   #0x01
    svc   #0x00

    .pool

    .align 2, 0
    .size SoftReset, . - SoftReset

    @ SoundBiasReset

    .global SoundBiasReset
    .type SoundBiasReset, function

    .thumb
SoundBiasReset:
    movs  r0, #0
    svc   #0x19
    bx    lr

    .align 2, 0
    .size SoundBiasReset, . - SoundBiasReset

    @ SoundBiasSet

    .global SoundBiasSet
    .type SoundBiasSet, function

    .thumb
SoundBiasSet:
    movs  r0, #1
    svc   #0x19
    bx    lr

    .align 2, 0
    .size SoundBiasSet, . - SoundBiasSet

    @ Sqrt

    .global Sqrt
    .type Sqrt, function

    .thumb
Sqrt:
    svc   #0x08
    bx    lr

    .align 2, 0
    .size Sqrt, . - Sqrt

    @ VBlankIntrWait

    .global VBlankIntrWait
    .type VBlankIntrWait, function

    .thumb
VBlankIntrWait:
    movs  r2, #0
    svc   #0x05
    bx    lr

    .align 2, 0
    .size VBlankIntrWait, . - VBlankIntrWait
