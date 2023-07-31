    .syntax unified

    .macro func_start name:req
        .type \name , function
        .global \name
        .arm
    .endm

    .macro func_end name:req
        .align 2, 0
        .size \name , . - \name
    .endm

    .global ArmCodeStart
ArmCodeStart:

.L08000228: .4byte gPal
.L0800022C: .4byte gFadeComponents
.L08000230: .4byte gFadeComponentStep

    func_start ColorFadeTick
ColorFadeTick:
    push {r4, r5, r6, r7}
    mov r7, #0x3e0
.L0800023C:
    ldr r0, .L08000230 @ =gFadeComponentStep
    add r0, r0, r7, lsr #5
    ldrsb r5, [r0]
    tst r5, r5
    beq .L080002F4
    ldr r4, .L0800022C @ =gFadeComponents
    lsr r0, r7, #1
    add r0, r0, r0, lsl #1
    add r0, r0, #0x30
    add r4, r4, r0
    mov r6, #0x1e
.L08000268:
    sub r4, r4, #3
    ldrb r0, [r4]
    add r0, r0, r5
    strb r0, [r4]
    subs r0, r0, #0x20
    bpl .L08000284
    mov r0, #0
.L08000284:
    cmp r0, #0x20
    blo .L08000290
    mov r0, #0x1f
.L08000290:
    ldrb r1, [r4, #1]
    add r1, r1, r5
    strb r1, [r4, #1]
    subs r1, r1, #0x20
    bpl .L080002A8
    mov r1, #0
.L080002A8:
    cmp r1, #0x20
    blo .L080002B4
    mov r1, #0x1f
.L080002B4:
    ldrb r2, [r4, #2]
    add r2, r2, r5
    strb r2, [r4, #2]
    subs r2, r2, #0x20
    bpl .L080002CC
    mov r2, #0
.L080002CC:
    cmp r2, #0x20
    blo .L080002D8
    mov r2, #0x1f
.L080002D8:
    add r0, r0, r1, lsl #5
    add r0, r0, r2, lsl #10
    ldr r1, .L08000228 @ =gPal
    add r1, r1, r6
    strh r0, [r1, r7]
    subs r6, r6, #2
    bpl .L08000268
.L080002F4:
    subs r7, r7, #0x20
    bpl .L0800023C
    pop {r4, r5, r6, r7}
    bx lr

    func_end ColorFadeTick

    func_start ClearOam
ClearOam:
    lsr r1, r1, #4
    sub r1, r1, #1
    mov r2, #0xa0
.L08000310:
    str r2, [r0]
    str r2, [r0, #8]
    str r2, [r0, #0x10]
    str r2, [r0, #0x18]
    str r2, [r0, #0x20]
    str r2, [r0, #0x28]
    str r2, [r0, #0x30]
    str r2, [r0, #0x38]
    str r2, [r0, #0x40]
    str r2, [r0, #0x48]
    str r2, [r0, #0x50]
    str r2, [r0, #0x58]
    str r2, [r0, #0x60]
    str r2, [r0, #0x68]
    str r2, [r0, #0x70]
    str r2, [r0, #0x78]
    add r0, r0, #0x80
    subs r1, r1, #1
    bpl .L08000310
    bx lr

    func_end ClearOam

    func_start Checksum32
Checksum32:
    push {r4, r5, r6, r7}
    sub r1, r1, #2
    mov r2, #0
    mov r3, #0
.L08000370:
    ldrh r4, [r0]
    add r2, r2, r4
    eor r3, r3, r4
    add r0, r0, #2
    subs r1, r1, #2
    bpl .L08000370
    mov r0, #0x10000
    sub r0, r0, #1
    and r2, r2, r0
    lsl r3, r3, #0x10
    mov r0, r2
    add r0, r0, r3
    pop {r4, r5, r6, r7}
    bx lr

    func_end Checksum32

    func_start TmFillRect
TmFillRect:
    push {r4, r5, r6, r7}
    mov r4, r0
    sub r6, r2, #0
.L080003B4:
    sub r5, r1, #0
.L080003B8:
    strh r3, [r4]
    add r4, r4, #2
    subs r5, r5, #1
    bpl .L080003B8
    add r0, r0, #0x40
    mov r4, r0
    subs r6, r6, #1
    bpl .L080003B4
    pop {r4, r5, r6, r7}
    bx lr

    func_end TmFillRect

    func_start TmCopyRect
TmCopyRect:
    push {r4, r5, r6, r7}
    tst r2, r2
    beq .L08000434
    bmi .L08000434
    tst r3, r3
    beq .L08000434
    bmi .L08000434
    mov r4, #0x40
    sub r4, r4, r2, lsl #1
    sub r6, r3, #1
.L08000408:
    sub r5, r2, #1
.L0800040C:
    ldrh r7, [r0]
    strh r7, [r1]
    add r0, r0, #2
    add r1, r1, #2
    subs r5, r5, #1
    bpl .L0800040C
    add r0, r0, r4
    add r1, r1, r4
    subs r6, r6, #1
    bpl .L08000408
.L08000434:
    pop {r4, r5, r6, r7}
    bx lr

    func_end TmCopyRect

    func_start TmApplyTsa
TmApplyTsa:
    push {r4, r5, r6, r7}
    ldrb r3, [r1]
    ldrb r4, [r1, #1]
    add r1, r1, #2
    lsl r7, r4, #6
    add r0, r0, r7
    mov r6, r4
.L08000458:
    mov r5, r3
.L0800045C:
    ldrh r7, [r1]
    add r7, r7, r2
    strh r7, [r0]
    add r0, r0, #2
    add r1, r1, #2
    subs r5, r5, #1
    bpl .L0800045C
    sub r0, r0, r3, lsl #1
    sub r0, r0, #0x42
    subs r6, r6, #1
    bpl .L08000458
    pop {r4, r5, r6, r7}
    bx lr

    func_end TmApplyTsa

.L08000490: .4byte gOamHiPutIt

    func_start PutOamHi
PutOamHi: @ 0x08000494
    push {r4, r5, r6, r7}
    ldr r7, .L08000490 @ =gOamHiPutIt
.L0800049C:
    ldr r5, [r7]
    ldrh r4, [r2]
    tst r4, r4
    beq .L08000528
    bmi .L08000528
    add r2, r2, #2
    add r6, r5, r4, lsl #3
    str r6, [r7]
    mov r7, #0x10000
    sub r7, r7, #1
    and r0, r0, r7
    and r1, r1, r7
    orr r0, r0, r1, lsl #16
.L080004D0:
    ldrh r1, [r2]
    orr r6, r1, r0, lsr #16
    and r6, r6, #0xff00
    add r7, r1, r0, lsr #16
    and r7, r7, #0xff
    orr r6, r6, r7
    strh r6, [r5]
    ldrh r1, [r2, #2]
    orr r6, r1, r0
    and r6, r6, #0xfe00
    add r7, r1, r0
    lsl r7, r7, #0x17
    lsr r7, r7, #0x17
    orr r6, r6, r7
    strh r6, [r5, #2]
    ldrh r1, [r2, #4]
    add r6, r1, r3
    strh r6, [r5, #4]
    add r2, r2, #6
    add r5, r5, #8
    subs r4, r4, #1
    bne .L080004D0
.L08000528:
    pop {r4, r5, r6, r7}
    bx lr

    func_end PutOamHi

.L08000530: .4byte gOamLoPutIt

    func_start PutOamLo
PutOamLo: @ 0x08000534
    push {r4, r5, r6, r7}
    ldr r7, .L08000530 @ =gOamLoPutIt
    b .L0800049C

    func_end PutOamLo

.L08000540:
    .4byte 1 << 0
    .4byte 1 << 2
    .4byte 1 << 4
    .4byte 1 << 6
    .4byte 1 << 8
    .4byte 1 << 10
    .4byte 1 << 12
    .4byte 1 << 14

.L08000560: .4byte .L08000540

    func_start DrawGlyph
DrawGlyph: @ 0x08000564
    push {r4, r5, r6, r7, r8, sb, sl}
    mov sb, #0xf
    mov sl, #0x10000
    sub sl, sl, #1
.L08000574:
    ldr r4, .L08000560 @ =.L08000540
    ldr r5, [r4, r3, lsl #2]
    ldr r4, [r2]
    tst r4, r4
    beq .L080005E4
    mul r5, r4, r5
    mov r7, r5
    and r7, r7, #0xff
    ldr r7, [r0, r7, lsl #1]
    lsr r8, r5, #8
    and r8, r8, #0xff
    ldr r8, [r0, r8, lsl #1]
    and r7, r7, sl
    orr r7, r7, r8, lsl #16
    ldr r4, [r1]
    orr r4, r4, r7
    str r4, [r1]
    lsr r7, r5, #0x10
    and r7, r7, #0xff
    ldr r7, [r0, r7, lsl #1]
    lsr r8, r5, #0x18
    and r8, r8, #0xff
    ldr r8, [r0, r8, lsl #1]
    and r7, r7, sl
    orr r7, r7, r8, lsl #16
    ldr r4, [r1, #0x40]
    orr r4, r4, r7
    str r4, [r1, #0x40]
.L080005E4:
    add r1, r1, #4
    add r2, r2, #4
    subs sb, sb, #1
    bpl .L08000574
    pop {r4, r5, r6, r7, r8, sb, sl}
    bx lr

    func_end DrawGlyph

    @ to my knowledge, this func is unused.
    func_start func_080005FC
func_080005FC:
    push {r4, r5, r6, r7, r8, sb, sl}
    mov sb, #7
    mov sl, #0x10000
    sub sl, sl, #1
.L08000630:
    ldr r4, .L08000560 @ =.L08000540
    ldr r5, [r4, r3, lsl #2]
    ldr r4, [r2]
    umull r5, r6, r4, r5
    mov r7, r5
    and r7, r7, #0xff
    ldr r7, [r0, r7, lsl #1]
    lsr r8, r5, #8
    and r8, r8, #0xff
    ldr r8, [r0, r8, lsl #1]
    and r7, r7, sl
    orr r7, r7, r8, lsl #16
    ldr r4, [r1]
    orr r4, r4, r7
    str r4, [r1]
    lsr r7, r5, #0x10
    and r7, r7, #0xff
    ldr r7, [r0, r7, lsl #1]
    lsr r8, r5, #0x18
    and r8, r8, #0xff
    ldr r8, [r0, r8, lsl #1]
    and r7, r7, sl
    orr r7, r7, r8, lsl #16
    ldr r4, [r1, #0x40]
    orr r4, r4, r7
    str r4, [r1, #0x20]
    mov r7, r6
    and r7, r7, #0xff
    ldr r7, [r0, r7, lsl #1]
    lsr r8, r6, #8
    and r8, r8, #0xff
    ldr r8, [r0, r8, lsl #1]
    and r7, r7, sl
    orr r7, r7, r8, lsl #16
    ldr r4, [r1, #0x80]
    orr r4, r4, r7
    str r4, [r1, #0x40]
    add r1, r1, #4
    add r2, r2, #4
    subs sb, sb, #1
    bpl .L08000630
    pop {r4, r5, r6, r7, r8, sb, sl}
    bx lr

    func_end func_080005FC

.L080006B8: .4byte MsgHuffRoot
.L080006BC: .4byte MsgHuffNodes

    func_start DecodeString
DecodeString: @ 0x080006C0
    push {r4, r5, r6, r7}
    sub r3, r3, r3
    ldr r5, .L080006BC @ =MsgHuffNodes
    ldr r7, .L080006B8 @ =MsgHuffRoot
    ldr r7, [r7]
.L080006D4:
    mov r4, r7
.L080006D8:
    subs r3, r3, #1
    bpl .L080006EC
    ldrb r2, [r0]
    add r0, r0, #1
    mov r3, #7
.L080006EC:
    tst r2, #1
    beq .L080006FC
    ldrh r6, [r4, #2]
    b .L08000700
.L080006FC:
    ldrh r6, [r4]
.L08000700:
    add r4, r5, r6, lsl #2
    lsr r2, r2, #1
    ldr r6, [r4]
    tst r6, r6
    bpl .L080006D8
    tst r6, #0xff00
    beq .L08000730
    strb r6, [r1]
    lsr r6, r6, #8
    strb r6, [r1, #1]
    add r1, r1, #2
    b .L080006D4
.L08000730:
    strb r6, [r1]
    tst r6, #0xff
    beq .L08000744
    add r1, r1, #1
    b .L080006D4
.L08000744:
    pop {r4, r5, r6, r7}
    bx lr

    func_end DecodeString

.L0800074C: .4byte gWorkingMovTable
.L08000750: .4byte gMapFloodSt
.L08000754: .4byte gWorkingMap
.L08000758: .4byte gMapTerrain
.L0800075C: .4byte gMapUnit

    func_start MapFloodCoreStep
MapFloodCoreStep: @ 0x08000760
    push {r4, r5, r6, r7, r8, sb, sl}
    ldr r3, .L08000750 @ =gMapFloodSt
    ldr r4, [r3]
    ldrb r5, [r4]
    add r1, r1, r5
    ldrb r6, [r4, #1]
    add r2, r2, r6
    ldr r7, .L08000758 @ =gMapTerrain
    ldr r7, [r7]
    ldr r7, [r7, r2, lsl #2]
    ldrb r7, [r7, r1]
    ldr r8, .L0800074C @ =gWorkingMovTable
    ldrb sl, [r8, r7]
    ldr r7, .L08000754 @ =gWorkingMap
    ldr r7, [r7]
    ldr sb, [r7, r6, lsl #2]
    ldrb sb, [sb, r5]
    add sl, sl, sb
    ldr sb, [r7, r2, lsl #2]
    ldrb sb, [sb, r1]
    cmp sl, sb
    bhs .L08000824
    ldrb r4, [r3, #8]
    tst r4, r4
    beq .L080007EC
    ldr r7, .L0800075C @ =gMapUnit
    ldr r7, [r7]
    ldr r7, [r7, r2, lsl #2]
    ldrb r7, [r7, r1]
    tst r7, r7
    beq .L080007EC
    ldrb r4, [r3, #0xa]
    eor r4, r4, r7
    ands r4, r4, #0x80
    bne .L08000824
.L080007EC:
    ldrb r4, [r3, #9]
    cmp sl, r4
    bhi .L08000824
    ldr r4, [r3, #4]
    strb r1, [r4]
    strb r2, [r4, #1]
    strb r0, [r4, #2]
    strb sl, [r4, #3]
    add r4, r4, #4
    str r4, [r3, #4]
    ldr r7, .L08000754 @ =gWorkingMap
    ldr r7, [r7]
    ldr r7, [r7, r2, lsl #2]
    strb sl, [r7, r1]
.L08000824:
    pop {r4, r5, r6, r7, r8, sb, sl}
    bx lr

    func_end MapFloodCoreStep

.L0800082C: .4byte gMapFloodSquareBufB
.L08000830: .4byte gMapFloodSquareBufA

    @ unused
.L08000834:
    b .L08000870 @ 00
    b .L080009A4 @ 01
    b .L0800093C @ 02
    b .L08000908 @ 03
    b .L080009F0 @ 04
    b .L080008C4 @ 05

    @ unused
.L0800084C: .4byte .L08000834

    func_start MapFloodCore
MapFloodCore: @ 0x08000850
    push {r4, r5, r6, lr}
    mov r4, #0
    ldr r5, .L08000750 @ =gMapFloodSt
.L0800085C:
    eors r4, r4, #1
    beq .L08000878
    ldr r0, .L0800082C @ =gMapFloodSquareBufB
    str r0, [r5]
    ldr r0, .L08000830 @ =gMapFloodSquareBufA
    str r0, [r5, #4]
    b .L08000888
.L08000878:
    ldr r0, .L08000830 @ =gMapFloodSquareBufA
    str r0, [r5]
    ldr r0, .L0800082C @ =gMapFloodSquareBufB
    str r0, [r5, #4]
.L08000888:
    ldr r6, [r5]
    ldrb r6, [r6, #2]
    cmp r6, #4
    beq .L080009F4
.L08000898:
    ldr r6, [r5]
    ldrb r6, [r6, #2]
1:  mov r0, pc
    add r0, r0, .L080008B0 - (1b + 8)
    add r0, r0, r6, lsl #2
    bx r0

.L080008B0:
    b .L08000870 @ 00
    b .L080009A4 @ 01
    b .L0800093C @ 02
    b .L08000908 @ 03
    b .L080009F0 @ 04
@   b .L080008C4 @ 05 fallthrough

.L080008C4:
    mov r0, #3
    mov r1, #0
    mov r2, #-1
    bl MapFloodCoreStep

    mov r0, #2
    mov r1, #0
    mov r2, #+1
    bl MapFloodCoreStep

    mov r0, #0
    mov r1, #-1
    mov r2, #0
    bl MapFloodCoreStep

    mov r0, #1
    mov r1, #+1
    mov r2, #0
    bl MapFloodCoreStep

    b .L080009D4

.L08000908:
    mov r0, #3
    mov r1, #0
    mov r2, #-1
    bl MapFloodCoreStep

    mov r0, #0
    mov r1, #-1
    mov r2, #0
    bl MapFloodCoreStep

    mov r0, #1
    mov r1, #+1
    mov r2, #0
    bl MapFloodCoreStep

    b .L080009D4

.L0800093C:
    mov r0, #2
    mov r1, #0
    mov r2, #+1
    bl MapFloodCoreStep

    mov r0, #0
    mov r1, #-1
    mov r2, #0
    bl MapFloodCoreStep

    mov r0, #1
    mov r1, #+1
    mov r2, #0
    bl MapFloodCoreStep

    b .L080009D4

.L08000870:
    mov r0, #3
    mov r1, #0
    mov r2, #-1
    bl MapFloodCoreStep

    mov r0, #2
    mov r1, #0
    mov r2, #+1
    bl MapFloodCoreStep

    mov r0, #0
    mov r1, #-1
    mov r2, #0
    bl MapFloodCoreStep

    b .L080009D4

.L080009A4:
    mov r0, #3
    mov r1, #0
    mov r2, #-1
    bl MapFloodCoreStep

    mov r0, #2
    mov r1, #0
    mov r2, #+1
    bl MapFloodCoreStep

    mov r0, #1
    mov r1, #+1
    mov r2, #0
    bl MapFloodCoreStep

@   b .L080009D4 @ fallthrough

.L080009D4:
    ldr r6, [r5, #4]
    mov r0, #4
    strb r0, [r6, #2]
    ldr r6, [r5]
    add r6, r6, #4
    str r6, [r5]
    b .L08000898

.L080009F0:
    b .L0800085C

.L080009F4:
    pop {r4, r5, r6, lr}
    bx lr

    func_end MapFloodCore

    .global ArmCodeEnd
ArmCodeEnd:
