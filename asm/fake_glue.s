    .section "fake_glue", "ax"

    .type ClearOam_thm, function
    .global ClearOam_thm

    .thumb
ClearOam_thm: @ 0x080C57AC
    bx pc
    nop
    .arm
    b ClearOam

    .size ClearOam_thm, . - ClearOam_thm

    .type TmApplyTsa_thm, function
    .global TmApplyTsa_thm

    .thumb
TmApplyTsa_thm: @ 0x080C57B4
    bx pc
    nop
    .arm
    b TmApplyTsa

    .size TmApplyTsa_thm, . - TmApplyTsa_thm

    .type TmFillRect_thm, function
    .global TmFillRect_thm

    .thumb
TmFillRect_thm: @ 0x080C57BC
    bx pc
    nop
    .arm
    b TmFillRect

    .size TmFillRect_thm, . - TmFillRect_thm

    .type ColorFadeTick_thm, function
    .global ColorFadeTick_thm

    .thumb
ColorFadeTick_thm: @ 0x080C57C4
    bx pc
    nop
    .arm
    b ColorFadeTick

    .size ColorFadeTick_thm, . - ColorFadeTick_thm

    .type TmCopyRect_thm, function
    .global TmCopyRect_thm

    .thumb
TmCopyRect_thm: @ 0x080C57CC
    bx pc
    nop
    .arm
    b TmCopyRect

    .size TmCopyRect_thm, . - TmCopyRect_thm

    .type Checksum32_thm, function
    .global Checksum32_thm

    .thumb
Checksum32_thm: @ 0x080C57D4
    bx pc
    nop
    .arm
    b Checksum32

    .size Checksum32_thm, . - Checksum32_thm
