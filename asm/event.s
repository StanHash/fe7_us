    .include "asm_prelude.inc"

    thumb_func_start EvtCmd_HidePosition
EvtCmd_HidePosition: @ 0x0800E100
    push {lr}
    adds r2, r0, #0
    ldr r0, [r2, #0x30]
    ldr r1, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r1
    cmp r0, #0
    bne .L0800E118
    lsls r0, r1, #0x10
    lsrs r0, r0, #0x10
    b .L0800E11A
.L0800E118:
    ldr r0, .L0800E130 @ =0x0000FFFF
.L0800E11A:
    adds r1, r0, #0
    ldr r0, [r2, #0x30]
    ldrh r2, [r0, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800E134
    adds r0, r2, #0
    b .L0800E136
    .align 2, 0
.L0800E130: .4byte 0x0000FFFF
.L0800E134:
    ldr r0, .L0800E164 @ =0x0000FFFF
.L0800E136:
    lsls r2, r0, #0x10
    ldr r0, .L0800E168 @ =gMapUnit
    ldr r0, [r0]
    asrs r2, r2, #0xe
    adds r2, r2, r0
    lsls r1, r1, #0x10
    asrs r1, r1, #0x10
    ldr r0, [r2]
    adds r0, r0, r1
    ldrb r0, [r0]
    bl GetUnit
    ldr r1, [r0, #0xc]
    movs r2, #9
    orrs r1, r2
    str r1, [r0, #0xc]
    bl RefreshEntityMaps
    bl RefreshUnitSprites
    movs r0, #2
    pop {r1}
    bx r1
    .align 2, 0
.L0800E164: .4byte 0x0000FFFF
.L0800E168: .4byte gMapUnit
    func_end EvtCmd_HidePosition

    thumb_func_start EvtCmd_HidePid
EvtCmd_HidePid: @ 0x0800E16C
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    bl GetUnitByPid
    ldr r1, [r0, #0xc]
    movs r2, #9
    orrs r1, r2
    str r1, [r0, #0xc]
    bl RefreshEntityMaps
    bl RefreshUnitSprites
    movs r0, #2
    pop {r1}
    bx r1
    func_end EvtCmd_HidePid

    thumb_func_start EvtCmd_DisablePid
EvtCmd_DisablePid: @ 0x0800E18C
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    bl GetUnitByPid
    ldr r1, [r0, #0xc]
    ldr r2, .L0800E1A4 @ =0x04010000
    orrs r1, r2
    str r1, [r0, #0xc]
    movs r0, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0800E1A4: .4byte 0x04010000
    func_end EvtCmd_DisablePid

    thumb_func_start EvtCmd_EnablePid
EvtCmd_EnablePid: @ 0x0800E1A8
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    bl GetUnitByPid
    ldr r1, [r0, #0xc]
    ldr r2, .L0800E1C0 @ =0xFFBFFFFF
    ands r1, r2
    str r1, [r0, #0xc]
    movs r0, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0800E1C0: .4byte 0xFFBFFFFF
    func_end EvtCmd_EnablePid

    thumb_func_start EvtCmd_SetState
EvtCmd_SetState: @ 0x0800E1C4
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #4]
    bl GetUnitByPid
    ldr r1, [r4, #0x30]
    ldr r2, [r1, #8]
    ldr r1, [r0, #0xc]
    orrs r1, r2
    str r1, [r0, #0xc]
    bl RefreshEntityMaps
    bl RefreshUnitSprites
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_SetState

    thumb_func_start EvtCmd_ClearState
EvtCmd_ClearState: @ 0x0800E1EC
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #4]
    bl GetUnitByPid
    ldr r1, [r4, #0x30]
    ldr r2, [r1, #8]
    ldr r1, [r0, #0xc]
    bics r1, r2
    str r1, [r0, #0xc]
    bl RefreshEntityMaps
    bl RefreshUnitSprites
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_ClearState

    thumb_func_start EventSetUnitAi
EventSetUnitAi: @ 0x0800E214
    mov ip, r0
    lsls r1, r1, #0x18
    lsrs r1, r1, #0x18
    lsls r2, r2, #0x18
    lsrs r2, r2, #0x18
    cmp r1, #0x14
    beq .L0800E230
    mov r3, ip
    adds r3, #0x42
    movs r0, #0
    strb r1, [r3]
    mov r1, ip
    adds r1, #0x43
    strb r0, [r1]
.L0800E230:
    cmp r2, #0x23
    beq .L0800E250
    mov r0, ip
    adds r0, #0x44
    movs r1, #0
    strb r2, [r0]
    adds r0, #1
    strb r1, [r0]
    cmp r2, #0xc
    bne .L0800E250
    movs r0, #8
    mov r1, ip
    ldrb r1, [r1, #0xa]
    orrs r0, r1
    mov r2, ip
    strb r0, [r2, #0xa]
.L0800E250:
    bx lr
    func_end EventSetUnitAi

    thumb_func_start EvtCmd_SetAiPid
EvtCmd_SetAiPid: @ 0x0800E254
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    ldr r0, [r0, #0x30]
    ldrb r1, [r0, #4]
    mov r8, r1
    ldr r1, [r0, #8]
    ldrb r7, [r0, #8]
    movs r0, #0xff
    lsls r0, r0, #8
    ands r0, r1
    lsrs r6, r0, #8
    movs r0, #0xff
    lsls r0, r0, #0x10
    ands r1, r0
    lsrs r5, r1, #0x10
    movs r4, #1
.L0800E276:
    adds r0, r4, #0
    bl GetUnit
    adds r2, r0, #0
    cmp r2, #0
    beq .L0800E2A4
    ldr r3, [r2]
    cmp r3, #0
    beq .L0800E2A4
    ldr r0, [r2, #0xc]
    movs r1, #5
    ands r0, r1
    cmp r0, #0
    bne .L0800E2A4
    ldrb r3, [r3, #4]
    cmp r3, r8
    bne .L0800E2A4
    adds r0, r2, #0
    adds r1, r7, #0
    adds r2, r6, #0
    adds r3, r5, #0
    bl EventSetUnitAi
.L0800E2A4:
    adds r4, #1
    cmp r4, #0xbf
    ble .L0800E276
    movs r0, #0
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end EvtCmd_SetAiPid

    thumb_func_start EvtCmd_SetAiPosition
EvtCmd_SetAiPosition: @ 0x0800E2B8
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    ldr r2, [r0, #0x30]
    ldr r1, [r2, #8]
    ldrb r0, [r2, #8]
    mov sb, r0
    movs r0, #0xff
    lsls r0, r0, #8
    ands r0, r1
    lsrs r0, r0, #8
    mov r8, r0
    movs r0, #0xff
    lsls r0, r0, #0x10
    ands r1, r0
    lsrs r7, r1, #0x10
    movs r4, #0x41
    movs r6, #4
    ldrsb r6, [r2, r6]
    movs r5, #6
    ldrsb r5, [r2, r5]
.L0800E2E4:
    adds r0, r4, #0
    bl GetUnit
    adds r2, r0, #0
    cmp r2, #0
    beq .L0800E31C
    ldr r0, [r2]
    cmp r0, #0
    beq .L0800E31C
    ldr r0, [r2, #0xc]
    movs r1, #5
    ands r0, r1
    cmp r0, #0
    bne .L0800E31C
    movs r0, #0x10
    ldrsb r0, [r2, r0]
    cmp r0, r6
    bne .L0800E31C
    movs r0, #0x11
    ldrsb r0, [r2, r0]
    cmp r0, r5
    bne .L0800E31C
    adds r0, r2, #0
    mov r1, sb
    mov r2, r8
    adds r3, r7, #0
    bl EventSetUnitAi
.L0800E31C:
    adds r4, #1
    cmp r4, #0xbf
    ble .L0800E2E4
    movs r0, #0
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end EvtCmd_SetAiPosition

    thumb_func_start EvtCmd_SetFlag
EvtCmd_SetFlag: @ 0x0800E330
    push {lr}
    ldr r0, [r0, #0x30]
    ldrh r0, [r0, #2]
    bl SetFlag
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_SetFlag

    thumb_func_start EvtCmd_ClearFlag
EvtCmd_ClearFlag: @ 0x0800E340
    push {lr}
    ldr r0, [r0, #0x30]
    ldrh r0, [r0, #2]
    bl ClearFlag
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_ClearFlag

    thumb_func_start EvtCmd_PlayBgm
EvtCmd_PlayBgm: @ 0x0800E350
    push {lr}
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E372
    ldr r0, [r2, #0x30]
    ldrh r0, [r0, #2]
    movs r1, #1
    movs r2, #0
    bl StartBgmExt
    movs r0, #2
    b .L0800E374
.L0800E372:
    movs r0, #0
.L0800E374:
    pop {r1}
    bx r1
    func_end EvtCmd_PlayBgm

    thumb_func_start EvtCmd_PlaySongExt
EvtCmd_PlaySongExt: @ 0x0800E378
    push {lr}
    ldr r2, [r0, #0x30]
    ldrh r3, [r2, #2]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    beq .L0800E38E
    movs r0, #0
    b .L0800E418
.L0800E38E:
    ldr r0, [r2, #4]
    subs r0, #1
    cmp r0, #7
    bhi .L0800E40C
    lsls r0, r0, #2
    ldr r1, .L0800E3A0 @ =.L0800E3A4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0800E3A0: .4byte .L0800E3A4
.L0800E3A4: @ jump table
    .4byte .L0800E3C4 @ case 0
    .4byte .L0800E3CC @ case 1
    .4byte .L0800E3D4 @ case 2
    .4byte .L0800E3DC @ case 3
    .4byte .L0800E3E4 @ case 4
    .4byte .L0800E3EC @ case 5
    .4byte .L0800E3F4 @ case 6
    .4byte .L0800E3FC @ case 7
.L0800E3C4:
    ldr r2, .L0800E3C8 @ =0x03005D20
    b .L0800E3FE
    .align 2, 0
.L0800E3C8: .4byte 0x03005D20
.L0800E3CC:
    ldr r2, .L0800E3D0 @ =0x03005D60
    b .L0800E3FE
    .align 2, 0
.L0800E3D0: .4byte 0x03005D60
.L0800E3D4:
    ldr r2, .L0800E3D8 @ =0x03005E30
    b .L0800E3FE
    .align 2, 0
.L0800E3D8: .4byte 0x03005E30
.L0800E3DC:
    ldr r2, .L0800E3E0 @ =0x03005DA0
    b .L0800E3FE
    .align 2, 0
.L0800E3E0: .4byte 0x03005DA0
.L0800E3E4:
    ldr r2, .L0800E3E8 @ =0x03005A90
    b .L0800E3FE
    .align 2, 0
.L0800E3E8: .4byte 0x03005A90
.L0800E3EC:
    ldr r2, .L0800E3F0 @ =0x03005AD0
    b .L0800E3FE
    .align 2, 0
.L0800E3F0: .4byte 0x03005AD0
.L0800E3F4:
    ldr r2, .L0800E3F8 @ =0x03005CE0
    b .L0800E3FE
    .align 2, 0
.L0800E3F8: .4byte 0x03005CE0
.L0800E3FC:
    ldr r2, .L0800E408 @ =0x03005DF0
.L0800E3FE:
    adds r0, r3, #0
    movs r1, #1
    bl StartBgmExt
    b .L0800E416
    .align 2, 0
.L0800E408: .4byte 0x03005DF0
.L0800E40C:
    ldr r2, .L0800E41C @ =0x03005B10
    adds r0, r3, #0
    movs r1, #1
    bl StartBgmExt
.L0800E416:
    movs r0, #2
.L0800E418:
    pop {r1}
    bx r1
    .align 2, 0
.L0800E41C: .4byte 0x03005B10
    func_end EvtCmd_PlaySongExt

    thumb_func_start EvtCmd_OverrideBgm
EvtCmd_OverrideBgm: @ 0x0800E420
    push {r4, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E446
    ldr r0, [r4, #0x30]
    ldrh r0, [r0, #2]
    bl OverrideBgm
    adds r0, r4, #0
    movs r1, #0x21
    bl StartTemporaryLock
    movs r0, #2
    b .L0800E448
.L0800E446:
    movs r0, #0
.L0800E448:
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_OverrideBgm

    thumb_func_start EvtCmd_RestoreBgm
EvtCmd_RestoreBgm: @ 0x0800E450
    push {lr}
    ldr r0, [r0, #0x30]
    ldrh r0, [r0, #2]
    bl RestoreBgm
    movs r0, #2
    pop {r1}
    bx r1
    func_end EvtCmd_RestoreBgm

    thumb_func_start EvtCmd_FadeBgmIn
EvtCmd_FadeBgmIn: @ 0x0800E460
    push {lr}
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E47E
    ldr r1, [r2, #0x30]
    ldrh r0, [r1, #2]
    ldr r1, [r1, #4]
    movs r2, #0
    bl StartBgmFadeIn
.L0800E47E:
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_FadeBgmIn

    thumb_func_start EvtCmd_FadeBgmOut
EvtCmd_FadeBgmOut: @ 0x0800E484
    push {lr}
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E4A2
    ldr r0, [r2, #0x30]
    ldrh r0, [r0, #2]
    bl FadeBgmOut_2
    movs r0, #2
    b .L0800E4A4
.L0800E4A2:
    movs r0, #0
.L0800E4A4:
    pop {r1}
    bx r1
    func_end EvtCmd_FadeBgmOut

    thumb_func_start EvtCmd_LowerBgmVolume
EvtCmd_LowerBgmVolume: @ 0x0800E4A8
    push {lr}
    adds r3, r0, #0
    adds r1, r3, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E4CA
    movs r0, #0x80
    lsls r0, r0, #1
    movs r1, #0x90
    movs r2, #0xa
    bl StartBgmVolumeChange
    movs r0, #2
    b .L0800E4CC
.L0800E4CA:
    movs r0, #0
.L0800E4CC:
    pop {r1}
    bx r1
    func_end EvtCmd_LowerBgmVolume

    thumb_func_start EvtCmd_RestoreBgmVolume
EvtCmd_RestoreBgmVolume: @ 0x0800E4D0
    push {lr}
    adds r3, r0, #0
    adds r1, r3, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E4F2
    movs r1, #0x80
    lsls r1, r1, #1
    movs r0, #0x90
    movs r2, #0xa
    bl StartBgmVolumeChange
    movs r0, #2
    b .L0800E4FC
.L0800E4F2:
    movs r0, #0x80
    lsls r0, r0, #1
    bl SetBgmVolume
    movs r0, #0
.L0800E4FC:
    pop {r1}
    bx r1
    func_end EvtCmd_RestoreBgmVolume

    thumb_func_start EvtCmd_PlaySe
EvtCmd_PlaySe: @ 0x0800E500
    push {lr}
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E526
    ldr r0, .L0800E52C @ =gPlayStatus
    adds r0, #0x41
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    blt .L0800E526
    ldr r0, [r2, #0x30]
    ldrh r0, [r0, #2]
    bl m4aSongNumStart
.L0800E526:
    movs r0, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0800E52C: .4byte gPlayStatus
    func_end EvtCmd_PlaySe

    thumb_func_start EventEndBattleMap
EventEndBattleMap: @ 0x0800E530
    adds r0, #0x5e
    movs r1, #8
    ldrh r2, [r0]
    orrs r1, r2
    strh r1, [r0]
    movs r0, #0
    bx lr
    func_end EventEndBattleMap

    thumb_func_start EvtCmd_NextChapter
EvtCmd_NextChapter: @ 0x0800E540
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldrh r5, [r0, #2]
    bl EndAllMus
    adds r0, r5, #0
    bl SetNextChapter
    movs r0, #1
    bl SetNextGameAction
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #8
    ldrh r2, [r1]
    orrs r0, r2
    strh r0, [r1]
    movs r1, #4
    ands r0, r1
    cmp r0, #0
    bne .L0800E572
    adds r0, r4, #0
    bl StartSlowLockingFadeToBlack
.L0800E572:
    cmp r5, #0x2f
    beq .L0800E57C
    movs r0, #4
    bl FadeBgmOut
.L0800E57C:
    movs r0, #2
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end EvtCmd_NextChapter

    thumb_func_start EvtCmd_EndGame
EvtCmd_EndGame: @ 0x0800E584
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #2
    bl SetNextGameAction
    adds r0, r4, #0
    bl EventEndBattleMap
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_EndGame

    thumb_func_start EvtCmd_EndLynCampaign
EvtCmd_EndLynCampaign: @ 0x0800E59C
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #3
    bl SetNextGameAction
    adds r0, r4, #0
    bl EventEndBattleMap
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_EndLynCampaign

    thumb_func_start EvtCmd_SetMap
EvtCmd_SetMap: @ 0x0800E5B4
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x4c
    movs r0, #0xff
    strb r0, [r1]
    ldr r1, .L0800E5FC @ =gPlayStatus
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #4]
    strb r0, [r1, #0xe]
    bl func_0802E0F4
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #8]
    lsls r0, r0, #4
    bl GetCameraCenteredX
    ldr r5, .L0800E600 @ =gBmStatus
    strh r0, [r5, #0xc]
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0xc]
    lsls r0, r0, #4
    bl GetCameraCenteredY
    strh r0, [r5, #0xe]
    bl RefreshEntityMaps
    bl RenderMap
    bl RefreshUnitSprites
    movs r0, #0
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L0800E5FC: .4byte gPlayStatus
.L0800E600: .4byte gBmStatus
    func_end EvtCmd_SetMap

    thumb_func_start EvtCmd_SetMapId
EvtCmd_SetMapId: @ 0x0800E604
    ldr r1, .L0800E610 @ =gPlayStatus
    ldr r0, [r0, #0x30]
    ldrh r0, [r0, #2]
    strb r0, [r1, #0xe]
    movs r0, #0
    bx lr
    .align 2, 0
.L0800E610: .4byte gPlayStatus
    func_end EvtCmd_SetMapId

    thumb_func_start Event_EndSkip
Event_EndSkip: @ 0x0800E614
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r1, r5, #0
    adds r1, #0x5e
    ldr r0, .L0800E65C @ =0x0000FFFB
    ldrh r2, [r1]
    ands r0, r2
    movs r4, #0
    strh r0, [r1]
    bl ApplySystemGraphics
    bl ApplyChapterMapPalettes
    bl ApplyUnitSpritePalettes
    ldr r2, .L0800E660 @ =gDispIo
    movs r0, #1
    ldrb r1, [r2, #1]
    orrs r0, r1
    movs r1, #2
    orrs r0, r1
    movs r1, #4
    orrs r0, r1
    movs r1, #8
    orrs r0, r1
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r2, #1]
    adds r1, r5, #0
    adds r1, #0x4d
    movs r0, #1
    strb r0, [r1]
    str r4, [r5, #0x40]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800E65C: .4byte 0x0000FFFB
.L0800E660: .4byte gDispIo
    func_end Event_EndSkip

    thumb_func_start EvtCmd_NoSkip
EvtCmd_NoSkip: @ 0x0800E664
    push {r4, lr}
    adds r1, r0, #0
    adds r4, r1, #0
    adds r4, #0x5e
    movs r0, #4
    ldrh r2, [r4]
    ands r0, r2
    cmp r0, #0
    beq .L0800E67C
    adds r0, r1, #0
    bl Event_EndSkip
.L0800E67C:
    movs r0, #0x40
    ldrh r1, [r4]
    orrs r0, r1
    strh r0, [r4]
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_NoSkip

    thumb_func_start EvtCmd_NoSkipTalk
EvtCmd_NoSkipTalk: @ 0x0800E68C
    push {r4, lr}
    adds r1, r0, #0
    adds r4, r1, #0
    adds r4, #0x5e
    movs r0, #4
    ldrh r2, [r4]
    ands r0, r2
    cmp r0, #0
    beq .L0800E6A4
    adds r0, r1, #0
    bl Event_EndSkip
.L0800E6A4:
    movs r0, #0xc0
    ldrh r1, [r4]
    orrs r0, r1
    strh r0, [r4]
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_NoSkipTalk

    thumb_func_start EvtCmd_NoSkipTalkSlow
EvtCmd_NoSkipTalkSlow: @ 0x0800E6B4
    push {r4, lr}
    adds r1, r0, #0
    adds r4, r1, #0
    adds r4, #0x5e
    movs r0, #4
    ldrh r2, [r4]
    ands r0, r2
    cmp r0, #0
    beq .L0800E6CC
    adds r0, r1, #0
    bl Event_EndSkip
.L0800E6CC:
    movs r1, #0xe0
    lsls r1, r1, #1
    adds r0, r1, #0
    ldrh r2, [r4]
    orrs r0, r2
    strh r0, [r4]
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_NoSkipTalkSlow

    thumb_func_start EvtCmd_YesSkip
EvtCmd_YesSkip: @ 0x0800E6E0
    adds r2, r0, #0
    adds r2, #0x5e
    ldrh r1, [r2]
    movs r0, #4
    ands r0, r1
    cmp r0, #0
    bne .L0800E6FC
    ldr r0, .L0800E6F8 @ =0x0000FE1F
    ands r0, r1
    strh r0, [r2]
    movs r0, #2
    b .L0800E6FE
    .align 2, 0
.L0800E6F8: .4byte 0x0000FE1F
.L0800E6FC:
    movs r0, #0
.L0800E6FE:
    bx lr
    func_end EvtCmd_YesSkip

    thumb_func_start EvtCmd_SilentSkip
EvtCmd_SilentSkip: @ 0x0800E700
    adds r1, r0, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r2, [r1]
    ands r0, r2
    cmp r0, #0
    bne .L0800E716
    movs r0, #0x20
    strh r0, [r1]
    movs r0, #2
    b .L0800E718
.L0800E716:
    movs r0, #0
.L0800E718:
    bx lr
    func_end EvtCmd_SilentSkip

    thumb_func_start EvtCmd_NoSkipUnlessNewGamePlus
EvtCmd_NoSkipUnlessNewGamePlus: @ 0x0800E71C
    push {r4, lr}
    adds r1, r0, #0
    adds r4, r1, #0
    adds r4, #0x5e
    movs r0, #4
    ldrh r2, [r4]
    ands r0, r2
    cmp r0, #0
    beq .L0800E734
    adds r0, r1, #0
    bl Event_EndSkip
.L0800E734:
    bl WasGameBeatenAtLeastOnce
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800E746
    movs r0, #0x40
    ldrh r1, [r4]
    orrs r0, r1
    strh r0, [r4]
.L0800E746:
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_NoSkipUnlessNewGamePlus

    thumb_func_start EvtCmd_NoSkipTalkSlowUnlessNewGamePlus
EvtCmd_NoSkipTalkSlowUnlessNewGamePlus: @ 0x0800E750
    push {r4, lr}
    adds r1, r0, #0
    adds r4, r1, #0
    adds r4, #0x5e
    movs r0, #4
    ldrh r2, [r4]
    ands r0, r2
    cmp r0, #0
    beq .L0800E768
    adds r0, r1, #0
    bl Event_EndSkip
.L0800E768:
    bl WasGameBeatenAtLeastOnce
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0800E778
    movs r1, #0xa0
    lsls r1, r1, #1
    b .L0800E77C
.L0800E778:
    movs r1, #0xe0
    lsls r1, r1, #1
.L0800E77C:
    adds r0, r1, #0
    ldrh r2, [r4]
    orrs r0, r2
    strh r0, [r4]
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_NoSkipTalkSlowUnlessNewGamePlus

    thumb_func_start EvtCmd_NoSkipSlowUnlessNewGamePlus
EvtCmd_NoSkipSlowUnlessNewGamePlus: @ 0x0800E78C
    push {r4, lr}
    adds r1, r0, #0
    adds r4, r1, #0
    adds r4, #0x5e
    movs r0, #4
    ldrh r2, [r4]
    ands r0, r2
    cmp r0, #0
    beq .L0800E7A4
    adds r0, r1, #0
    bl Event_EndSkip
.L0800E7A4:
    bl WasGameBeatenAtLeastOnce
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0800E7B4
    movs r1, #0xc0
    lsls r1, r1, #1
    b .L0800E7B8
.L0800E7B4:
    movs r1, #0xe0
    lsls r1, r1, #1
.L0800E7B8:
    adds r0, r1, #0
    ldrh r2, [r4]
    orrs r0, r2
    strh r0, [r4]
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_NoSkipSlowUnlessNewGamePlus

    thumb_func_start EvtCmd_FadeToBlack
EvtCmd_FadeToBlack: @ 0x0800E7C8
    push {lr}
    adds r1, r0, #0
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    bne .L0800E7E6
    ldr r0, [r1, #0x30]
    ldrh r0, [r0, #2]
    bl StartLockingFadeToBlack
    movs r0, #2
    b .L0800E7E8
.L0800E7E6:
    movs r0, #0
.L0800E7E8:
    pop {r1}
    bx r1
    func_end EvtCmd_FadeToBlack

    thumb_func_start EvtCmd_FadeFromBlack
EvtCmd_FadeFromBlack: @ 0x0800E7EC
    push {lr}
    adds r1, r0, #0
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    bne .L0800E80A
    ldr r0, [r1, #0x30]
    ldrh r0, [r0, #2]
    bl StartLockingFadeFromBlack
    movs r0, #2
    b .L0800E80C
.L0800E80A:
    movs r0, #0
.L0800E80C:
    pop {r1}
    bx r1
    func_end EvtCmd_FadeFromBlack

    thumb_func_start EvtCmd_LynModeDeathFadeToBlack
EvtCmd_LynModeDeathFadeToBlack: @ 0x0800E810
    push {r4, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L0800E826
    movs r0, #0
    b .L0800E83E
.L0800E826:
    bl GetLynModeDeathFlag
    lsls r0, r0, #0x18
    movs r1, #4
    cmp r0, #0
    beq .L0800E834
    movs r1, #0x10
.L0800E834:
    adds r0, r1, #0
    adds r1, r4, #0
    bl StartLockingFadeToBlack
    movs r0, #2
.L0800E83E:
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_LynModeDeathFadeToBlack

    thumb_func_start EvtCmd_FadeToWhite
EvtCmd_FadeToWhite: @ 0x0800E844
    push {lr}
    adds r1, r0, #0
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    bne .L0800E862
    ldr r0, [r1, #0x30]
    ldrh r0, [r0, #2]
    bl StartLockingFadeToWhite
    movs r0, #2
    b .L0800E864
.L0800E862:
    movs r0, #0
.L0800E864:
    pop {r1}
    bx r1
    func_end EvtCmd_FadeToWhite

    thumb_func_start EvtCmd_FadeFromWhite
EvtCmd_FadeFromWhite: @ 0x0800E868
    push {lr}
    adds r1, r0, #0
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    bne .L0800E886
    ldr r0, [r1, #0x30]
    ldrh r0, [r0, #2]
    bl StartLockingFadeFromWhite
    movs r0, #2
    b .L0800E888
.L0800E886:
    movs r0, #0
.L0800E888:
    pop {r1}
    bx r1
    func_end EvtCmd_FadeFromWhite

    thumb_func_start EvtCmd_ExitMap
EvtCmd_ExitMap: @ 0x0800E88C
    push {lr}
    bl Event_SetExitMap
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_ExitMap

    thumb_func_start EvtCmd_EnterMap
EvtCmd_EnterMap: @ 0x0800E898
    push {lr}
    bl Event_SetEnterMap
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_EnterMap

    thumb_func_start func_0800E8A4
func_0800E8A4: @ 0x0800E8A4
    push {lr}
    adds r3, r0, #0
    adds r1, r3, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E8C6
    ldr r2, [r3, #0x30]
    ldr r0, [r2, #4]
    ldr r1, [r2, #8]
    ldr r2, [r2, #0xc]
    bl func_080AEC5C
    movs r0, #2
    b .L0800E8C8
.L0800E8C6:
    movs r0, #0
.L0800E8C8:
    pop {r1}
    bx r1
    func_end func_0800E8A4

    thumb_func_start func_0800E8CC
func_0800E8CC: @ 0x0800E8CC
    push {lr}
    adds r3, r0, #0
    adds r1, r3, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800E8EE
    ldr r2, [r3, #0x30]
    ldr r0, [r2, #4]
    ldr r1, [r2, #8]
    ldr r2, [r2, #0xc]
    bl func_080AECB0
    movs r0, #2
    b .L0800E8F0
.L0800E8EE:
    movs r0, #0
.L0800E8F0:
    pop {r1}
    bx r1
    func_end func_0800E8CC

    thumb_func_start EvtCmd_GiveGold
EvtCmd_GiveGold: @ 0x0800E8F4
    push {r4, r5, lr}
    adds r5, r0, #0
    ldr r0, [r5, #0x30]
    ldr r4, [r0, #4]
    cmp r4, #0
    bne .L0800E902
    ldr r4, [r5, #0x58]
.L0800E902:
    ldrh r0, [r0, #2]
    cmp r0, #0
    beq .L0800E91C
    bl GetGold
    adds r0, r0, r4
    bl SetGold
    adds r0, r4, #0
    adds r1, r5, #0
    bl StartPopup_800EE90
    b .L0800E93C
.L0800E91C:
    ldr r0, .L0800E944 @ =gActiveUnit
    ldr r1, [r0]
    movs r0, #0xc0
    ldrb r1, [r1, #0xb]
    ands r0, r1
    cmp r0, #0
    bne .L0800E934
    bl GetGold
    adds r0, r0, r4
    bl SetGold
.L0800E934:
    adds r0, r4, #0
    adds r1, r5, #0
    bl StartPopup_800EE4C
.L0800E93C:
    movs r0, #2
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L0800E944: .4byte gActiveUnit
    func_end EvtCmd_GiveGold

    thumb_func_start EvtCmd_FightScript
EvtCmd_FightScript: @ 0x0800E948
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    mov r8, r0
    bl func_08053428
    mov r1, r8
    ldr r0, [r1, #0x30]
    ldr r0, [r0, #4]
    bl GetUnitByPid
    mov sb, r0
    mov r2, r8
    ldr r0, [r2, #0x30]
    ldr r0, [r0, #8]
    bl GetUnitByPid
    mov sl, r0
    mov r1, r8
    ldr r0, [r1, #0x30]
    ldr r6, [r0, #0xc]
    movs r1, #0xff
    adds r4, r1, #0
    ldrh r2, [r0, #0x12]
    ands r4, r2
    ldrb r2, [r0, #0x13]
    ands r2, r1
    str r2, [sp]
    ldrh r7, [r0, #0x10]
    ldr r1, .L0800E994 @ =0x0203A85C
    cmp r2, #0
    bne .L0800E998
    str r6, [r1, #0x18]
    b .L0800E99C
    .align 2, 0
.L0800E994: .4byte 0x0203A85C
.L0800E998:
    movs r0, #0
    str r0, [r1, #0x18]
.L0800E99C:
    mov r1, sb
    ldrh r0, [r1, #0x1e]
    bl GetItemKind
    cmp r0, #4
    beq .L0800E9AC
    cmp r7, #0
    beq .L0800E9BC
.L0800E9AC:
    mov r0, sb
    movs r1, #0
    bl BattleInitItemEffect
    mov r0, sl
    bl BattleInitItemEffectTarget
    b .L0800E9D2
.L0800E9BC:
    cmp r4, #0
    bne .L0800E9CA
    mov r0, sb
    mov r1, sl
    bl BattleGenerateReal
    b .L0800E9D2
.L0800E9CA:
    mov r0, sb
    mov r1, sl
    bl BattleGenerateBallistaReal
.L0800E9D2:
    ldr r4, .L0800EA88 @ =0x0203A3F0
    adds r1, r4, #0
    adds r1, #0x6e
    movs r0, #0
    strb r0, [r1]
    ldr r5, .L0800EA8C @ =0x0203A470
    adds r1, r5, #0
    adds r1, #0x6e
    strb r0, [r1]
    mov r0, sb
    bl GetUnitEquippedWeapon
    ldr r2, .L0800EA90 @ =0x0203A438
    strh r0, [r2]
    adds r4, #0x4a
    strh r0, [r4]
    mov r0, sl
    bl GetUnitEquippedWeapon
    adds r1, r5, #0
    adds r1, #0x48
    strh r0, [r1]
    adds r1, #2
    strh r0, [r1]
    cmp r7, #0
    beq .L0800EA22
    movs r1, #0x80
    lsls r1, r1, #1
    adds r0, r7, r1
    ldr r2, .L0800EA90 @ =0x0203A438
    strh r0, [r2]
    strh r0, [r4]
    cmp r7, #0x7f
    bgt .L0800EA22
    cmp r7, #0x7c
    blt .L0800EA22
    ldr r1, .L0800EA94 @ =0x0203A3D8
    movs r0, #0x80
    lsls r0, r0, #2
    strh r0, [r1]
.L0800EA22:
    mov r7, r8
    adds r7, #0x5e
    ldr r0, [sp]
    cmp r0, #0
    bne .L0800EA60
    bl ClearBattleHits
    ldr r2, .L0800EA98 @ =0x0203A50C
    ldr r1, [r2]
    ldr r0, [r6]
    str r0, [r1]
    movs r0, #0x80
    ldrb r1, [r6, #2]
    ands r0, r1
    cmp r0, #0
    bne .L0800EA5C
    adds r4, r2, #0
    movs r5, #0x80
.L0800EA46:
    bl BattleHitAdvance
    adds r6, #4
    ldr r1, [r4]
    ldr r0, [r6]
    str r0, [r1]
    adds r0, r5, #0
    ldrb r2, [r6, #2]
    ands r0, r2
    cmp r0, #0
    beq .L0800EA46
.L0800EA5C:
    bl BattleHitTerminate
.L0800EA60:
    movs r0, #4
    ldrh r7, [r7]
    ands r0, r7
    cmp r0, #0
    bne .L0800EA78
    mov r0, r8
    adds r0, #0x4d
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #0
    beq .L0800EAA0
.L0800EA78:
    bl BattleApplyUnitUpdates
    bl func_08053434
    ldr r1, .L0800EA9C @ =0x0203A85C
    movs r0, #0
    str r0, [r1, #0x18]
    b .L0800EAE6
    .align 2, 0
.L0800EA88: .4byte 0x0203A3F0
.L0800EA8C: .4byte 0x0203A470
.L0800EA90: .4byte 0x0203A438
.L0800EA94: .4byte 0x0203A3D8
.L0800EA98: .4byte 0x0203A50C
.L0800EA9C: .4byte 0x0203A85C
.L0800EAA0:
    bl GetGameLock
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    mov r1, r8
    adds r1, #0x52
    strh r0, [r1]
    ldr r0, .L0800EAF8 @ =EventScriptedBattleWait
    mov r1, r8
    str r0, [r1, #0x40]
    mov r0, sb
    bl UnitBeginAction
    ldr r4, .L0800EAFC @ =gActiveUnit
    ldr r0, [r4]
    bl HideUnitSprite
    ldr r0, [r4]
    bl StartMu
    bl SetAutoMuDefaultFacing
    bl BeginBattleAnimations
    mov r0, r8
    movs r1, #7
    bl Proc_Mark
    ldr r1, .L0800EB00 @ =0x0203A97C
    mov r2, sb
    ldrb r0, [r2, #0x10]
    strb r0, [r1, #2]
    ldrb r0, [r2, #0x11]
    strb r0, [r1, #3]
    movs r0, #2
.L0800EAE6:
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0800EAF8: .4byte EventScriptedBattleWait
.L0800EAFC: .4byte gActiveUnit
.L0800EB00: .4byte 0x0203A97C
    func_end EvtCmd_FightScript

    thumb_func_start EventScriptedBattleWait
EventScriptedBattleWait: @ 0x0800EB04
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r0, #0x52
    movs r1, #0
    ldrsh r4, [r0, r1]
    bl GetGameLock
    lsls r0, r0, #0x18
    lsrs r0, r0, #0x18
    cmp r4, r0
    bne .L0800EB28
    ldr r0, .L0800EB30 @ =EventScriptedBattleWaitB
    str r0, [r5, #0x40]
    bl BattleApplyUnitUpdates
    ldr r1, .L0800EB34 @ =0x0203A85C
    movs r0, #0
    str r0, [r1, #0x18]
.L0800EB28:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EB30: .4byte EventScriptedBattleWaitB
.L0800EB34: .4byte 0x0203A85C
    func_end EventScriptedBattleWait

    thumb_func_start EventScriptedBattleWaitB
EventScriptedBattleWaitB: @ 0x0800EB38
    push {lr}
    movs r1, #0
    str r1, [r0, #0x40]
    movs r1, #6
    bl Proc_Mark
    bl AiEndMuAndRefreshUnits
    pop {r0}
    bx r0
    func_end EventScriptedBattleWaitB

    thumb_func_start EvtCmd_SetNoReloadGfx
EvtCmd_SetNoReloadGfx: @ 0x0800EB4C
    adds r0, #0x5e
    movs r1, #0x10
    ldrh r2, [r0]
    orrs r1, r2
    strh r1, [r0]
    movs r0, #0
    bx lr
    func_end EvtCmd_SetNoReloadGfx

    thumb_func_start EvtCmd_OnSkipFunc
EvtCmd_OnSkipFunc: @ 0x0800EB5C
    ldr r1, [r0, #0x30]
    ldr r1, [r1, #4]
    str r1, [r0, #0x3c]
    movs r0, #0
    bx lr
    func_end EvtCmd_OnSkipFunc

    thumb_func_start EvtCmd_ClearOnSkipFunc
EvtCmd_ClearOnSkipFunc: @ 0x0800EB68
    movs r1, #0
    str r1, [r0, #0x3c]
    movs r0, #0
    bx lr
    func_end EvtCmd_ClearOnSkipFunc

    thumb_func_start EvtCmd_SetWeatherWithFade
EvtCmd_SetWeatherWithFade: @ 0x0800EB70
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L0800EB8C @ =0x08B91A78
    adds r1, r4, #0
    bl SpawnProcLocking
    ldr r1, [r4, #0x30]
    ldrh r1, [r1, #2]
    adds r0, #0x64
    strh r1, [r0]
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0800EB8C: .4byte 0x08B91A78
    func_end EvtCmd_SetWeatherWithFade

    thumb_func_start EvtCmd_SetWeather
EvtCmd_SetWeather: @ 0x0800EB90
    push {r4, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L0800EBAC
    ldr r0, [r4, #0x30]
    ldrh r0, [r0, #2]
    bl SetWeather
    b .L0800EBBC
.L0800EBAC:
    ldr r0, .L0800EBC4 @ =0x08B91A78
    adds r1, r4, #0
    bl SpawnProcLocking
    ldr r1, [r4, #0x30]
    ldrh r1, [r1, #2]
    adds r0, #0x64
    strh r1, [r0]
.L0800EBBC:
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0800EBC4: .4byte 0x08B91A78
    func_end EvtCmd_SetWeather

    thumb_func_start EventWeatherChangeWithFade_SetWeather
EventWeatherChangeWithFade_SetWeather: @ 0x0800EBC8
    push {lr}
    adds r0, #0x64
    movs r1, #0
    ldrsh r0, [r0, r1]
    bl SetWeather
    pop {r0}
    bx r0
    func_end EventWeatherChangeWithFade_SetWeather

    thumb_func_start EvtCmd_SetVision
EvtCmd_SetVision: @ 0x0800EBD8
    push {lr}
    ldr r1, [r0, #0x30]
    ldrh r2, [r1, #2]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800EBF2
    adds r0, r2, #0
    bl SetVisionWithFade
    b .L0800EBF8
.L0800EBF2:
    adds r0, r2, #0
    bl SetVision
.L0800EBF8:
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_SetVision

    thumb_func_start EvtCmd_SetVisionInstant
EvtCmd_SetVisionInstant: @ 0x0800EC00
    push {lr}
    ldr r0, [r0, #0x30]
    ldrh r0, [r0, #2]
    bl SetVision
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_SetVisionInstant

    thumb_func_start EvtCmd_BreakItemSeal
EvtCmd_BreakItemSeal: @ 0x0800EC10
    push {r4, lr}
    adds r4, r0, #0
    ldr r1, [r4, #0x30]
    ldr r0, [r1, #4]
    ldrb r1, [r1, #8]
    bl BreakItemSealForPid
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0xc]
    bl SetFlag
    movs r0, #0
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_BreakItemSeal

    thumb_func_start EvtCmd_EnqueueEvent
EvtCmd_EnqueueEvent: @ 0x0800EC30
    push {lr}
    ldr r0, [r0, #0x30]
    adds r0, #4
    bl func_0800AF5C
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_EnqueueEvent

    thumb_func_start EvtCmd_End
EvtCmd_End: @ 0x0800EC40
    push {r4, r5, lr}
    adds r4, r0, #0
    movs r5, #0
    ldr r0, [r4, #0x34]
    cmp r0, #0
    beq .L0800EC5A
    str r0, [r4, #0x2c]
    ldr r0, [r4, #0x38]
    str r0, [r4, #0x30]
    str r5, [r4, #0x34]
    str r5, [r4, #0x38]
    movs r5, #1
    b .L0800EC60
.L0800EC5A:
    adds r0, r4, #0
    bl Proc_Break
.L0800EC60:
    adds r0, r4, #0
    adds r0, #0x5e
    ldrh r1, [r0]
    movs r0, #4
    ands r0, r1
    cmp r0, #0
    beq .L0800EC84
    ldr r0, .L0800EC80 @ =0x08B907C0
    bl Proc_Find
    cmp r0, #0
    beq .L0800EC92
    bl ClearTalk
    b .L0800EC92
    .align 2, 0
.L0800EC80: .4byte 0x08B907C0
.L0800EC84:
    movs r0, #0x10
    ands r0, r1
    cmp r0, #0
    bne .L0800EC92
    adds r0, r4, #0
    bl EventClearTalkDisplayed
.L0800EC92:
    cmp r5, #0
    bne .L0800EC9A
    movs r0, #2
    b .L0800EC9C
.L0800EC9A:
    movs r0, #1
.L0800EC9C:
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end EvtCmd_End

    thumb_func_start func_0800ECA4
func_0800ECA4: @ 0x0800ECA4
    push {lr}
    bl EvtCmd_End
    pop {r1}
    bx r1
    func_end func_0800ECA4

    thumb_func_start EventClearTalkDisplayed
EventClearTalkDisplayed: @ 0x0800ECB0
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r0, #0x4d
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #0
    beq .L0800ECC6
    bl ClearTalk
    b .L0800ECEE
.L0800ECC6:
    ldr r5, .L0800ECF4 @ =0x08B907C0
    adds r0, r5, #0
    bl Proc_Find
    cmp r0, #0
    beq .L0800ECEE
    bl ClearTalkBubble
    ldr r1, .L0800ECF8 @ =StartFaceFadeOut
    adds r0, r5, #0
    bl Proc_ForEach
    adds r1, r4, #0
    adds r1, #0x50
    movs r0, #8
    strh r0, [r1]
    adds r0, r4, #0
    movs r1, #8
    bl StartTemporaryLock
.L0800ECEE:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800ECF4: .4byte 0x08B907C0
.L0800ECF8: .4byte StartFaceFadeOut
    func_end EventClearTalkDisplayed

    thumb_func_start ClearTalk
ClearTalk: @ 0x0800ECFC
    push {lr}
    bl ClearTalkBubble
    ldr r0, .L0800ED14 @ =0x08B907C0
    bl Proc_EndEach
    bl InitFaces
    bl func_08007DD4
    pop {r0}
    bx r0
    .align 2, 0
.L0800ED14: .4byte 0x08B907C0
    func_end ClearTalk

    thumb_func_start func_0800ED18
func_0800ED18: @ 0x0800ED18
    bx lr
    func_end func_0800ED18

    thumb_func_start func_0800ED1C
func_0800ED1C: @ 0x0800ED1C
    bx lr
    func_end func_0800ED1C

    thumb_func_start func_0800ED20
func_0800ED20: @ 0x0800ED20
    push {lr}
    movs r0, #6
    bl func_080046F4
    cmp r0, #0
    beq .L0800ED2E
    movs r0, #1
.L0800ED2E:
    pop {r1}
    bx r1
    func_end func_0800ED20

    thumb_func_start func_0800ED34
func_0800ED34: @ 0x0800ED34
    push {lr}
    ldr r0, .L0800ED48 @ =0x08B90D88
    bl func_080046C8
    cmp r0, #0
    beq .L0800ED42
    movs r0, #1
.L0800ED42:
    pop {r1}
    bx r1
    .align 2, 0
.L0800ED48: .4byte 0x08B90D88
    func_end func_0800ED34

    thumb_func_start func_0800ED4C
func_0800ED4C: @ 0x0800ED4C
    push {lr}
    movs r0, #6
    bl func_08004834
    movs r0, #7
    bl func_08004834
    movs r0, #5
    bl func_08004834
    bl EndAllMus
    pop {r0}
    bx r0
    func_end func_0800ED4C

    thumb_func_start func_0800ED68
func_0800ED68: @ 0x0800ED68
    push {lr}
    ldr r0, .L0800ED74 @ =0x08B91AB8
    bl SetFaceConfig
    pop {r0}
    bx r0
    .align 2, 0
.L0800ED74: .4byte 0x08B91AB8
    func_end func_0800ED68

    thumb_func_start func_0800ED78
func_0800ED78: @ 0x0800ED78
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L0800ED8C @ =0x08B91AD8
    bl func_0800AF5C
    str r4, [r0, #0x48]
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0800ED8C: .4byte 0x08B91AD8
    func_end func_0800ED78

    thumb_func_start func_0800ED90
func_0800ED90: @ 0x0800ED90
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, .L0800EDA8 @ =0x08B91AE8
    bl func_0800AF5C
    str r4, [r0, #0x48]
    str r5, [r0, #0x58]
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L0800EDA8: .4byte 0x08B91AE8
    func_end func_0800ED90

    thumb_func_start func_0800EDAC
func_0800EDAC: @ 0x0800EDAC
    push {lr}
    ldr r0, [r0, #0x58]
    cmp r0, #0
    beq .L0800EDBC
    movs r1, #0
    bl StartBgm
    b .L0800EDC2
.L0800EDBC:
    movs r0, #0x90
    bl SetBgmVolume
.L0800EDC2:
    pop {r0}
    bx r0
    func_end func_0800EDAC

    thumb_func_start func_0800EDC8
func_0800EDC8: @ 0x0800EDC8
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L0800EDDC @ =0x08B91B10
    bl func_0800AF5C
    str r4, [r0, #0x48]
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0800EDDC: .4byte 0x08B91B10
    func_end func_0800EDC8

    thumb_func_start func_0800EDE0
func_0800EDE0: @ 0x0800EDE0
    push {r4, lr}
    adds r4, r1, #0
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bl func_0800AD28
    ldr r0, .L0800EE00 @ =0x08B91B34
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EE00: .4byte 0x08B91B34
    func_end func_0800EDE0

    thumb_func_start func_0800EE04
func_0800EE04: @ 0x0800EE04
    push {r4, lr}
    adds r4, r1, #0
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bl func_0800AD28
    ldr r0, .L0800EE24 @ =0x08B91B7C
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EE24: .4byte 0x08B91B7C
    func_end func_0800EE04

    thumb_func_start func_0800EE28
func_0800EE28: @ 0x0800EE28
    push {r4, lr}
    adds r4, r1, #0
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bl func_0800AD28
    ldr r0, .L0800EE48 @ =0x08B91BC4
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EE48: .4byte 0x08B91BC4
    func_end func_0800EE28

    thumb_func_start StartPopup_800EE4C
StartPopup_800EE4C: @ 0x0800EE4C
    push {r4, lr}
    adds r4, r1, #0
    bl func_0800AD34
    ldr r0, .L0800EE70 @ =gActiveUnit
    ldr r1, [r0]
    movs r0, #0xc0
    ldrb r1, [r1, #0xb]
    ands r0, r1
    cmp r0, #0
    bne .L0800EE78
    ldr r0, .L0800EE74 @ =0x08B91BE4
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
    b .L0800EE84
    .align 2, 0
.L0800EE70: .4byte gActiveUnit
.L0800EE74: .4byte 0x08B91BE4
.L0800EE78:
    ldr r0, .L0800EE8C @ =0x08B91C2C
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
.L0800EE84:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EE8C: .4byte 0x08B91C2C
    func_end StartPopup_800EE4C

    thumb_func_start StartPopup_800EE90
StartPopup_800EE90: @ 0x0800EE90
    push {r4, lr}
    adds r4, r1, #0
    bl func_0800AD34
    ldr r0, .L0800EEAC @ =0x08B91BE4
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EEAC: .4byte 0x08B91BE4
    func_end StartPopup_800EE90

    thumb_func_start StartPopup_800EEB0
StartPopup_800EEB0: @ 0x0800EEB0
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r0, r1, #0
    adds r5, r2, #0
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bl func_0800AD28
    movs r0, #0xc0
    ldrb r4, [r4, #0xb]
    ands r0, r4
    cmp r0, #0
    bne .L0800EEDC
    ldr r0, .L0800EED8 @ =0x08B91C64
    movs r1, #0x60
    movs r2, #0
    adds r3, r5, #0
    bl func_0800AD40
    b .L0800EEE8
    .align 2, 0
.L0800EED8: .4byte 0x08B91C64
.L0800EEDC:
    ldr r0, .L0800EEF0 @ =0x08B91CBC
    movs r1, #0x60
    movs r2, #0
    adds r3, r5, #0
    bl func_0800AD40
.L0800EEE8:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EEF0: .4byte 0x08B91CBC
    func_end StartPopup_800EEB0

    thumb_func_start func_0800EEF4
func_0800EEF4: @ 0x0800EEF4
    push {r4, lr}
    adds r4, r1, #0
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bl func_0800AD28
    ldr r0, .L0800EF1C @ =gActiveUnit
    ldr r1, [r0]
    movs r0, #0xc0
    ldrb r1, [r1, #0xb]
    ands r0, r1
    cmp r0, #0
    bne .L0800EF24
    ldr r0, .L0800EF20 @ =0x08B91D04
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
    b .L0800EF30
    .align 2, 0
.L0800EF1C: .4byte gActiveUnit
.L0800EF20: .4byte 0x08B91D04
.L0800EF24:
    ldr r0, .L0800EF38 @ =0x08B91D5C
    movs r1, #0x60
    movs r2, #0
    adds r3, r4, #0
    bl func_0800AD40
.L0800EF30:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EF38: .4byte 0x08B91D5C
    func_end func_0800EEF4

    thumb_func_start func_0800EF3C
func_0800EF3C: @ 0x0800EF3C
    push {lr}
    adds r3, r0, #0
    ldr r0, .L0800EF50 @ =0x08B91DA4
    movs r1, #0x60
    movs r2, #0
    bl func_0800AD40
    pop {r0}
    bx r0
    .align 2, 0
.L0800EF50: .4byte 0x08B91DA4
    func_end func_0800EF3C

    thumb_func_start StartGiveItem
StartGiveItem: @ 0x0800EF54
    push {r4, r5, lr}
    adds r4, r0, #0
    lsls r1, r1, #0x10
    lsrs r5, r1, #0x10
    cmp r2, #7
    bhi .L0800EF70
    ldr r0, .L0800EF6C @ =0x08B91DC4
    adds r1, r2, #0
    bl SpawnProc
    b .L0800EF78
    .align 2, 0
.L0800EF6C: .4byte 0x08B91DC4
.L0800EF70:
    ldr r0, .L0800EF98 @ =0x08B91DC4
    adds r1, r2, #0
    bl SpawnProcLocking
.L0800EF78:
    str r5, [r0, #0x58]
    str r4, [r0, #0x54]
    movs r0, #0xc0
    ldrb r1, [r4, #0xb]
    ands r0, r1
    cmp r0, #0x80
    bne .L0800EF90
    ldr r0, [r4, #0xc]
    movs r1, #0x80
    lsls r1, r1, #5
    orrs r0, r1
    str r0, [r4, #0xc]
.L0800EF90:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EF98: .4byte 0x08B91DC4
    func_end StartGiveItem

    thumb_func_start GiveItem_DoPopup
GiveItem_DoPopup: @ 0x0800EF9C
    push {lr}
    adds r2, r0, #0
    ldr r0, [r2, #0x54]
    ldr r1, [r2, #0x58]
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    bl StartPopup_800EEB0
    pop {r0}
    bx r0
    func_end GiveItem_DoPopup

    thumb_func_start GiveItem_DoGiveItem
GiveItem_DoGiveItem: @ 0x0800EFB0
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r5, [r4, #0x54]
    ldr r0, [r4, #0x58]
    bl CreateItem
    adds r1, r0, #0
    adds r0, r5, #0
    adds r2, r4, #0
    bl HandleGiveUnitItem
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end GiveItem_DoGiveItem

    thumb_func_start func_0800EFCC
func_0800EFCC: @ 0x0800EFCC
    push {r4, lr}
    adds r4, r0, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    ldr r0, .L0800EFE4 @ =0x08B91DF4
    bl func_0800AF5C
    adds r0, #0x5c
    strh r4, [r0]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800EFE4: .4byte 0x08B91DF4
    func_end func_0800EFCC

    thumb_func_start func_0800EFE8
func_0800EFE8: @ 0x0800EFE8
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    lsls r5, r5, #0x10
    lsrs r5, r5, #0x10
    ldr r0, .L0800F00C @ =0x08B91E0C
    bl func_0800AF5C
    adds r1, r0, #0
    adds r1, #0x55
    strb r4, [r1]
    adds r0, #0x5c
    strh r5, [r0]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800F00C: .4byte 0x08B91E0C
    func_end func_0800EFE8

    thumb_func_start func_0800F010
func_0800F010: @ 0x0800F010
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L0800F024 @ =0x08B91E28
    bl func_0800AF5C
    str r4, [r0, #0x58]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800F024: .4byte 0x08B91E28
    func_end func_0800F010

    thumb_func_start func_0800F028
func_0800F028: @ 0x0800F028
    push {r4, lr}
    adds r4, r0, #0
    lsls r4, r4, #0x18
    lsrs r4, r4, #0x18
    ldr r0, .L0800F040 @ =0x08B91E40
    bl func_0800AF5C
    adds r0, #0x4f
    strb r4, [r0]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800F040: .4byte 0x08B91E40
    func_end func_0800F028

    thumb_func_start func_0800F044
func_0800F044: @ 0x0800F044
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    lsls r5, r5, #0x18
    lsrs r5, r5, #0x18
    ldr r0, .L0800F068 @ =0x08B91E4C
    bl func_0800AF5C
    adds r1, r0, #0
    adds r1, #0x5c
    strh r4, [r1]
    adds r0, #0x4f
    strb r5, [r0]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800F068: .4byte 0x08B91E4C
    func_end func_0800F044

    thumb_func_start func_0800F06C
func_0800F06C: @ 0x0800F06C
    push {r4, r5, lr}
    adds r5, r0, #0
    lsls r4, r1, #0x18
    lsrs r4, r4, #0x18
    ldr r0, .L0800F088 @ =0x08B91E68
    bl func_0800AF5C
    str r5, [r0, #0x58]
    adds r0, #0x4f
    strb r4, [r0]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800F088: .4byte 0x08B91E68
    func_end func_0800F06C

    thumb_func_start func_0800F08C
func_0800F08C: @ 0x0800F08C
    push {lr}
    ldr r0, .L0800F0A8 @ =0x08B90D88
    bl Proc_Find
    cmp r0, #0
    beq .L0800F0A2
    adds r0, #0x5e
    movs r1, #2
    ldrh r2, [r0]
    orrs r1, r2
    strh r1, [r0]
.L0800F0A2:
    pop {r0}
    bx r0
    .align 2, 0
.L0800F0A8: .4byte 0x08B90D88
    func_end func_0800F08C

    thumb_func_start func_0800F0AC
func_0800F0AC: @ 0x0800F0AC
    push {lr}
    bl func_08079280
    adds r1, r0, #0
    movs r2, #0
    b .L0800F0BC
.L0800F0B8:
    adds r2, #1
    adds r1, #0x10
.L0800F0BC:
    ldrb r0, [r1]
    cmp r0, #0
    bne .L0800F0B8
    adds r0, r2, #0
    pop {r1}
    bx r1
    func_end func_0800F0AC

    thumb_func_start func_0800F0C8
func_0800F0C8: @ 0x0800F0C8
    push {r4, r5, r6, r7, lr}
    bl func_08079280
    adds r6, r0, #0
    movs r7, #1
.L0800F0D2:
    adds r0, r7, #0
    bl GetUnit
    adds r4, r0, #0
    cmp r4, #0
    beq .L0800F156
    ldr r2, [r4]
    cmp r2, #0
    beq .L0800F156
    ldrb r0, [r6]
    cmp r0, #0
    bne .L0800F0F0
    movs r0, #0xff
    strb r0, [r4, #0x10]
    b .L0800F156
.L0800F0F0:
    ldr r0, [r4, #0xc]
    ldr r1, .L0800F144 @ =0x0201000C
    ands r0, r1
    cmp r0, #0
    bne .L0800F156
    ldr r0, [r4, #4]
    ldr r1, [r2, #0x28]
    ldr r0, [r0, #0x28]
    orrs r1, r0
    movs r0, #0x80
    lsls r0, r0, #2
    ands r1, r0
    cmp r1, #0
    beq .L0800F14C
    ldr r5, .L0800F148 @ =gPlayStatus
    movs r0, #0xe
    ldrsb r0, [r5, r0]
    bl GetChapterInfo
    movs r1, #0
    ldrb r2, [r5, #0x1b]
    cmp r2, #3
    bne .L0800F120
    movs r1, #1
.L0800F120:
    adds r0, #0x86
    adds r0, r0, r1
    ldrb r0, [r0]
    strb r0, [r4, #0x10]
    movs r0, #0xe
    ldrsb r0, [r5, r0]
    bl GetChapterInfo
    movs r1, #0
    ldrb r5, [r5, #0x1b]
    cmp r5, #3
    bne .L0800F13A
    movs r1, #1
.L0800F13A:
    adds r0, #0x88
    adds r0, r0, r1
    ldrb r0, [r0]
    strb r0, [r4, #0x11]
    b .L0800F156
    .align 2, 0
.L0800F144: .4byte 0x0201000C
.L0800F148: .4byte gPlayStatus
.L0800F14C:
    ldrb r0, [r6, #6]
    strb r0, [r4, #0x10]
    ldrb r0, [r6, #7]
    strb r0, [r4, #0x11]
    adds r6, #0x10
.L0800F156:
    adds r7, #1
    cmp r7, #0x3f
    ble .L0800F0D2
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_0800F0C8

    thumb_func_start func_0800F164
func_0800F164: @ 0x0800F164
    push {r4, r5, lr}
    movs r4, #1
    movs r5, #1
    rsbs r5, r5, #0
.L0800F16C:
    adds r0, r4, #0
    bl GetUnit
    adds r2, r0, #0
    cmp r2, #0
    beq .L0800F1B2
    ldr r0, [r2]
    cmp r0, #0
    beq .L0800F1B2
    ldr r1, [r2, #0xc]
    movs r0, #4
    ands r0, r1
    cmp r0, #0
    bne .L0800F1B2
    movs r0, #8
    ands r0, r1
    cmp r0, #0
    beq .L0800F19C
    movs r0, #0xff
    strb r0, [r2, #0x10]
    movs r0, #1
    orrs r1, r0
    str r1, [r2, #0xc]
    b .L0800F1B2
.L0800F19C:
    movs r0, #2
    rsbs r0, r0, #0
    ands r1, r0
    str r1, [r2, #0xc]
    movs r0, #0x10
    ldrsb r0, [r2, r0]
    cmp r0, r5
    bne .L0800F1B2
    adds r0, r2, #0
    bl func_0800F1C0
.L0800F1B2:
    adds r4, #1
    cmp r4, #0x3f
    ble .L0800F16C
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_0800F164

    thumb_func_start func_0800F1C0
func_0800F1C0: @ 0x0800F1C0
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    bl func_08079280
    adds r4, r0, #0
    ldr r0, [r7]
    ldr r1, [r7, #4]
    ldr r0, [r0, #0x28]
    ldr r1, [r1, #0x28]
    orrs r0, r1
    movs r1, #0x80
    lsls r1, r1, #2
    ands r0, r1
    cmp r0, #0
    beq .L0800F26A
    ldr r4, .L0800F218 @ =gPlayStatus
    movs r0, #0xe
    ldrsb r0, [r4, r0]
    bl GetChapterInfo
    movs r1, #0
    ldrb r2, [r4, #0x1b]
    cmp r2, #3
    bne .L0800F1F2
    movs r1, #1
.L0800F1F2:
    adds r0, #0x86
    adds r0, r0, r1
    ldrb r0, [r0]
    strb r0, [r7, #0x10]
    movs r0, #0xe
    ldrsb r0, [r4, r0]
    bl GetChapterInfo
    movs r1, #0
    ldrb r4, [r4, #0x1b]
    cmp r4, #3
    bne .L0800F20C
    movs r1, #1
.L0800F20C:
    adds r0, #0x88
    adds r0, r0, r1
    ldrb r0, [r0]
    strb r0, [r7, #0x11]
    b .L0800F270
    .align 2, 0
.L0800F218: .4byte gPlayStatus
.L0800F21C:
    ldrb r0, [r4, #6]
    strb r0, [r7, #0x10]
    ldrb r0, [r4, #7]
    strb r0, [r7, #0x11]
    b .L0800F270
.L0800F226:
    movs r6, #0
    movs r5, #1
    b .L0800F22E
.L0800F22C:
    adds r5, #1
.L0800F22E:
    cmp r5, #0x3f
    bgt .L0800F264
    adds r0, r5, #0
    bl GetUnit
    adds r2, r0, #0
    cmp r2, #0
    beq .L0800F22C
    ldr r0, [r2]
    cmp r0, #0
    beq .L0800F22C
    ldr r0, [r2, #0xc]
    movs r1, #0xc
    ands r0, r1
    cmp r0, #0
    bne .L0800F22C
    movs r0, #0x10
    ldrsb r0, [r2, r0]
    ldrb r1, [r4, #6]
    cmp r0, r1
    bne .L0800F22C
    movs r0, #0x11
    ldrsb r0, [r2, r0]
    ldrb r2, [r4, #7]
    cmp r0, r2
    bne .L0800F22C
    movs r6, #1
.L0800F264:
    cmp r6, #0
    beq .L0800F21C
    adds r4, #0x10
.L0800F26A:
    ldrb r0, [r4]
    cmp r0, #0
    bne .L0800F226
.L0800F270:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_0800F1C0

    thumb_func_start func_0800F278
func_0800F278: @ 0x0800F278
    bx lr
    func_end func_0800F278

    thumb_func_start func_0800F27C
func_0800F27C: @ 0x0800F27C
    push {r4, r5, r6, lr}
    movs r6, #1
.L0800F280:
    adds r0, r6, #0
    bl GetUnit
    adds r4, r0, #0
    cmp r4, #0
    beq .L0800F2E4
    ldr r1, [r4]
    cmp r1, #0
    beq .L0800F2E4
    ldr r0, [r4, #4]
    ldr r1, [r1, #0x28]
    ldr r0, [r0, #0x28]
    orrs r1, r0
    movs r0, #0x80
    lsls r0, r0, #2
    ands r1, r0
    cmp r1, #0
    beq .L0800F2E4
    ldr r5, .L0800F2F0 @ =gPlayStatus
    movs r0, #0xe
    ldrsb r0, [r5, r0]
    bl GetChapterInfo
    movs r1, #0
    ldrb r2, [r5, #0x1b]
    cmp r2, #3
    bne .L0800F2B8
    movs r1, #1
.L0800F2B8:
    adds r0, #0x86
    adds r0, r0, r1
    ldrb r0, [r0]
    strb r0, [r4, #0x10]
    movs r0, #0xe
    ldrsb r0, [r5, r0]
    bl GetChapterInfo
    movs r1, #0
    ldrb r5, [r5, #0x1b]
    cmp r5, #3
    bne .L0800F2D2
    movs r1, #1
.L0800F2D2:
    adds r0, #0x88
    adds r0, r0, r1
    ldrb r0, [r0]
    strb r0, [r4, #0x11]
    ldr r0, [r4, #0xc]
    movs r1, #2
    rsbs r1, r1, #0
    ands r0, r1
    str r0, [r4, #0xc]
.L0800F2E4:
    adds r6, #1
    cmp r6, #0x3f
    ble .L0800F280
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800F2F0: .4byte gPlayStatus
    func_end func_0800F27C

    thumb_func_start Event_SetExitMap
Event_SetExitMap: @ 0x0800F2F4
    adds r0, #0x4d
    movs r1, #1
    strb r1, [r0]
    bx lr
    func_end Event_SetExitMap

    thumb_func_start Event_SetEnterMap
Event_SetEnterMap: @ 0x0800F2FC
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    lsls r0, r0, #0x10
    lsrs r1, r0, #0x10
    cmp r1, #0
    bne .L0800F316
    adds r0, r2, #0
    adds r0, #0x4d
    strb r1, [r0]
.L0800F316:
    bx lr
    func_end Event_SetEnterMap

    thumb_func_start func_0800F318
func_0800F318: @ 0x0800F318
    push {lr}
    movs r0, #0
    bl SetWeather
    pop {r0}
    bx r0
    func_end func_0800F318

    thumb_func_start func_0800F324
func_0800F324: @ 0x0800F324
    push {lr}
    movs r0, #6
    bl SetWeather
    pop {r0}
    bx r0
    func_end func_0800F324

    thumb_func_start func_0800F330
func_0800F330: @ 0x0800F330
    push {lr}
    ldr r0, .L0800F340 @ =0x03005D20
    movs r1, #3
    bl m4aMPlayFadeOut
    pop {r0}
    bx r0
    .align 2, 0
.L0800F340: .4byte 0x03005D20
    func_end func_0800F330

    thumb_func_start func_0800F344
func_0800F344: @ 0x0800F344
    push {lr}
    ldr r0, .L0800F354 @ =0x03005B10
    movs r1, #3
    bl m4aMPlayFadeOutTemporarily
    pop {r0}
    bx r0
    .align 2, 0
.L0800F354: .4byte 0x03005B10
    func_end func_0800F344

    thumb_func_start func_0800F358
func_0800F358: @ 0x0800F358
    push {lr}
    ldr r0, .L0800F368 @ =0x03005B10
    movs r1, #2
    bl m4aMPlayFadeIn
    pop {r0}
    bx r0
    .align 2, 0
.L0800F368: .4byte 0x03005B10
    func_end func_0800F358

    thumb_func_start EvtCmd_0800F36C
EvtCmd_0800F36C: @ 0x0800F36C
    push {r4, r5, r6, r7, lr}
    adds r3, r0, #0
    ldr r0, [r3, #0x30]
    ldr r7, [r0, #4]
    ldr r2, [r0, #8]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800F38C
    ldr r4, .L0800F388 @ =0x0000FFFF
    ands r4, r2
    b .L0800F390
    .align 2, 0
.L0800F388: .4byte 0x0000FFFF
.L0800F38C:
    movs r4, #1
    rsbs r4, r4, #0
.L0800F390:
    ldr r2, [r3, #0x30]
    ldrh r1, [r2, #0xa]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r1
    movs r6, #1
    rsbs r6, r6, #0
    cmp r0, #0
    bne .L0800F3A4
    adds r6, r1, #0
.L0800F3A4:
    ldr r5, [r2, #0xc]
    adds r1, r3, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800F3CC
    lsls r0, r7, #0x18
    lsrs r0, r0, #0x18
    adds r1, r4, #0
    adds r2, r6, #0
    adds r3, r5, #0
    bl func_080B5554
    adds r0, r5, #0
    bl func_080B55BC
    movs r0, #2
    b .L0800F3CE
.L0800F3CC:
    movs r0, #0
.L0800F3CE:
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end EvtCmd_0800F36C

    thumb_func_start EvtCmd_0800F3D4
EvtCmd_0800F3D4: @ 0x0800F3D4
    push {lr}
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800F3F0
    adds r0, r2, #0
    bl StartSlowLockingFadeToBlack
    movs r0, #2
    b .L0800F410
.L0800F3F0:
    ldr r2, .L0800F414 @ =gDispIo
    movs r0, #2
    rsbs r0, r0, #0
    ldrb r1, [r2, #1]
    ands r0, r1
    movs r1, #3
    rsbs r1, r1, #0
    ands r0, r1
    subs r1, #2
    ands r0, r1
    subs r1, #4
    ands r0, r1
    subs r1, #8
    ands r0, r1
    strb r0, [r2, #1]
    movs r0, #0
.L0800F410:
    pop {r1}
    bx r1
    .align 2, 0
.L0800F414: .4byte gDispIo
    func_end EvtCmd_0800F3D4

    thumb_func_start EvtCmd_0800F418
EvtCmd_0800F418: @ 0x0800F418
    push {lr}
    bl func_080B558C
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_0800F418

    thumb_func_start EvtCmd_0800F424
EvtCmd_0800F424: @ 0x0800F424
    push {r4, lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r2, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800F440
    ldr r3, .L0800F43C @ =0x0000FFFF
    ands r3, r2
    b .L0800F444
    .align 2, 0
.L0800F43C: .4byte 0x0000FFFF
.L0800F440:
    movs r3, #1
    rsbs r3, r3, #0
.L0800F444:
    ldr r0, [r1, #0x30]
    ldrh r2, [r0, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r4, #1
    rsbs r4, r4, #0
    cmp r0, #0
    bne .L0800F458
    adds r4, r2, #0
.L0800F458:
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800F470
    adds r0, r3, #0
    adds r1, r4, #0
    bl func_080B4F74
    movs r0, #2
    b .L0800F472
.L0800F470:
    movs r0, #0
.L0800F472:
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_0800F424

    thumb_func_start EvtCmd_0800F478
EvtCmd_0800F478: @ 0x0800F478
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800F48E
    bl func_080B4F70
    movs r0, #2
    b .L0800F490
.L0800F48E:
    movs r0, #0
.L0800F490:
    pop {r1}
    bx r1
    func_end EvtCmd_0800F478

    thumb_func_start func_0800F494
func_0800F494: @ 0x0800F494
    push {r4, r5, lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r2, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800F4B0
    ldr r4, .L0800F4AC @ =0x0000FFFF
    ands r4, r2
    b .L0800F4B4
    .align 2, 0
.L0800F4AC: .4byte 0x0000FFFF
.L0800F4B0:
    movs r4, #1
    rsbs r4, r4, #0
.L0800F4B4:
    ldr r3, [r1, #0x30]
    ldrh r2, [r3, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r5, #1
    rsbs r5, r5, #0
    cmp r0, #0
    bne .L0800F4C8
    adds r5, r2, #0
.L0800F4C8:
    ldr r2, [r3, #8]
    ldr r3, [r3, #0xc]
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800F4E4
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080B4F78
    movs r0, #2
    b .L0800F4E6
.L0800F4E4:
    movs r0, #0
.L0800F4E6:
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_0800F494

    thumb_func_start func_0800F4EC
func_0800F4EC: @ 0x0800F4EC
    push {r4, lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r2, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800F508
    ldr r3, .L0800F504 @ =0x0000FFFF
    ands r3, r2
    b .L0800F50C
    .align 2, 0
.L0800F504: .4byte 0x0000FFFF
.L0800F508:
    movs r3, #1
    rsbs r3, r3, #0
.L0800F50C:
    ldr r0, [r1, #0x30]
    ldrh r2, [r0, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r4, #1
    rsbs r4, r4, #0
    cmp r0, #0
    bne .L0800F520
    adds r4, r2, #0
.L0800F520:
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800F538
    adds r0, r3, #0
    adds r1, r4, #0
    bl func_080B5B44
    movs r0, #2
    b .L0800F53A
.L0800F538:
    movs r0, #0
.L0800F53A:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_0800F4EC

    thumb_func_start func_0800F540
func_0800F540: @ 0x0800F540
    push {r4, lr}
    adds r4, r0, #0
    bl func_080B5B6C
    adds r4, #0x5e
    movs r0, #4
    ldrh r4, [r4]
    ands r0, r4
    cmp r0, #0
    bne .L0800F558
    movs r0, #2
    b .L0800F55A
.L0800F558:
    movs r0, #0
.L0800F55A:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_0800F540

    thumb_func_start func_0800F560
func_0800F560: @ 0x0800F560
    push {r4, r5, lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r4, [r1, #4]
    ldr r5, [r1, #8]
    ldr r3, [r1, #0xc]
    ldr r2, [r1, #0x10]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    bne .L0800F5A2
    cmp r2, #0
    beq .L0800F596
    str r1, [sp]
    str r1, [sp, #4]
    str r3, [sp, #8]
    adds r0, r2, #0
    movs r1, #6
    adds r2, r4, #0
    adds r3, r5, #0
    bl func_080B5760
    b .L0800F5A2
.L0800F596:
    lsls r2, r3, #0x10
    lsrs r2, r2, #0x10
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080B4D4C
.L0800F5A2:
    movs r0, #0
    add sp, #0xc
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_0800F560

    thumb_func_start func_0800F5AC
func_0800F5AC: @ 0x0800F5AC
    bx lr
    func_end func_0800F5AC

    thumb_func_start func_0800F5B0
func_0800F5B0: @ 0x0800F5B0
    bx lr
    func_end func_0800F5B0

    thumb_func_start func_0800F5B4
func_0800F5B4: @ 0x0800F5B4
    push {r4, lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r2, [r1, #4]
    ldr r4, [r1, #8]
    ldr r3, [r1, #0xc]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    beq .L0800F5D8
    adds r0, r2, #0
    bl func_08006D50
    b .L0800F5F8
.L0800F5D8:
    cmp r3, #0
    beq .L0800F5EE
    str r1, [sp]
    str r1, [sp, #4]
    str r4, [sp, #8]
    adds r0, r3, #0
    movs r1, #7
    movs r3, #0
    bl func_080B5760
    b .L0800F5F8
.L0800F5EE:
    lsls r1, r4, #0x10
    lsrs r1, r1, #0x10
    adds r0, r2, #0
    bl func_080B4E88
.L0800F5F8:
    movs r0, #0
    add sp, #0xc
    pop {r4}
    pop {r1}
    bx r1
    func_end func_0800F5B4

    thumb_func_start func_0800F604
func_0800F604: @ 0x0800F604
    bx lr
    func_end func_0800F604

    thumb_func_start func_0800F608
func_0800F608: @ 0x0800F608
    bx lr
    func_end func_0800F608

    thumb_func_start func_0800F60C
func_0800F60C: @ 0x0800F60C
    push {lr}
    movs r1, #0x2a
    ldrsh r0, [r0, r1]
    bl func_08006D50
    pop {r0}
    bx r0
    func_end func_0800F60C

    thumb_func_start func_0800F61C
func_0800F61C: @ 0x0800F61C
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r4, #0
    adds r5, #0x5e
    movs r0, #4
    ldrh r1, [r5]
    ands r0, r1
    cmp r0, #0
    beq .L0800F632
    movs r0, #0
    b .L0800F650
.L0800F632:
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #4]
    bl func_080B4FE4
    ldr r0, .L0800F658 @ =EventTalkWait
    str r0, [r4, #0x40]
    movs r0, #0x80
    ldrh r5, [r5]
    ands r0, r5
    cmp r0, #0
    beq .L0800F64E
    movs r0, #4
    bl SetTalkFlag
.L0800F64E:
    movs r0, #2
.L0800F650:
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L0800F658: .4byte EventTalkWait
    func_end func_0800F61C

    thumb_func_start func_0800F65C
func_0800F65C: @ 0x0800F65C
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800F674
    movs r0, #1
    bl func_080B3D20
    movs r0, #2
    b .L0800F676
.L0800F674:
    movs r0, #0
.L0800F676:
    pop {r1}
    bx r1
    func_end func_0800F65C

    thumb_func_start func_0800F67C
func_0800F67C: @ 0x0800F67C
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800F694
    movs r0, #0
    bl func_080B3D20
    movs r0, #2
    b .L0800F696
.L0800F694:
    movs r0, #0
.L0800F696:
    pop {r1}
    bx r1
    func_end func_0800F67C

    thumb_func_start func_0800F69C
func_0800F69C: @ 0x0800F69C
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800F6B2
    bl func_080B3D78
    movs r0, #2
    b .L0800F6B4
.L0800F6B2:
    movs r0, #0
.L0800F6B4:
    pop {r1}
    bx r1
    func_end func_0800F69C

    thumb_func_start func_0800F6B8
func_0800F6B8: @ 0x0800F6B8
    push {r4, r5, r6, r7, lr}
    sub sp, #0xc
    adds r2, r0, #0
    ldr r0, [r2, #0x30]
    ldr r7, [r0, #4]
    ldr r3, [r0, #8]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r3
    cmp r0, #0
    bne .L0800F6D8
    ldr r4, .L0800F6D4 @ =0x0000FFFF
    ands r4, r3
    b .L0800F6DC
    .align 2, 0
.L0800F6D4: .4byte 0x0000FFFF
.L0800F6D8:
    movs r4, #1
    rsbs r4, r4, #0
.L0800F6DC:
    ldr r1, [r2, #0x30]
    ldrh r3, [r1, #0xa]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r3
    movs r5, #1
    rsbs r5, r5, #0
    cmp r0, #0
    bne .L0800F6F0
    adds r5, r3, #0
.L0800F6F0:
    ldr r6, [r1, #0xc]
    ldr r3, [r1, #0x10]
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800F726
    cmp r3, #0
    beq .L0800F71A
    str r4, [sp]
    str r5, [sp, #4]
    str r6, [sp, #8]
    adds r0, r3, #0
    movs r1, #0
    adds r2, r7, #0
    movs r3, #0
    bl func_080B5760
    b .L0800F726
.L0800F71A:
    adds r0, r7, #0
    adds r1, r4, #0
    adds r2, r5, #0
    adds r3, r6, #0
    bl func_080B4904
.L0800F726:
    movs r0, #0
    add sp, #0xc
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_0800F6B8

    thumb_func_start func_0800F730
func_0800F730: @ 0x0800F730
    push {lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r2, [r1, #4]
    ldr r3, [r1, #8]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    bne .L0800F766
    cmp r3, #0
    beq .L0800F760
    str r1, [sp]
    str r1, [sp, #4]
    str r1, [sp, #8]
    adds r0, r3, #0
    movs r1, #1
    movs r3, #0
    bl func_080B5760
    b .L0800F766
.L0800F760:
    adds r0, r2, #0
    bl func_080B4ADC
.L0800F766:
    movs r0, #0
    add sp, #0xc
    pop {r1}
    bx r1
    func_end func_0800F730

    thumb_func_start func_0800F770
func_0800F770: @ 0x0800F770
    push {r4, lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r3, [r1, #4]
    ldr r4, [r1, #8]
    ldr r2, [r1, #0xc]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    bne .L0800F7AC
    cmp r2, #0
    beq .L0800F7A4
    str r1, [sp]
    str r1, [sp, #4]
    str r1, [sp, #8]
    adds r0, r2, #0
    movs r1, #2
    adds r2, r3, #0
    adds r3, r4, #0
    bl func_080B5760
    b .L0800F7AC
.L0800F7A4:
    adds r0, r3, #0
    adds r1, r4, #0
    bl func_080B39D8
.L0800F7AC:
    movs r0, #0
    add sp, #0xc
    pop {r4}
    pop {r1}
    bx r1
    func_end func_0800F770

    thumb_func_start func_0800F7B8
func_0800F7B8: @ 0x0800F7B8
    push {lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r2, [r1, #4]
    ldr r3, [r1, #8]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    beq .L0800F7D6
    movs r0, #0
    b .L0800F7F4
.L0800F7D6:
    cmp r3, #0
    beq .L0800F7EC
    str r1, [sp]
    str r1, [sp, #4]
    str r1, [sp, #8]
    adds r0, r3, #0
    movs r1, #3
    movs r3, #0
    bl func_080B5760
    b .L0800F7F2
.L0800F7EC:
    adds r0, r2, #0
    bl func_080B3AFC
.L0800F7F2:
    movs r0, #2
.L0800F7F4:
    add sp, #0xc
    pop {r1}
    bx r1
    func_end func_0800F7B8

    thumb_func_start func_0800F7FC
func_0800F7FC: @ 0x0800F7FC
    movs r1, #0
    str r1, [r0, #0x40]
    bx lr
    func_end func_0800F7FC

    thumb_func_start func_0800F804
func_0800F804: @ 0x0800F804
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800F81A
    bl func_080B3B70
    movs r0, #2
    b .L0800F81C
.L0800F81A:
    movs r0, #0
.L0800F81C:
    pop {r1}
    bx r1
    func_end func_0800F804

    thumb_func_start func_0800F820
func_0800F820: @ 0x0800F820
    movs r1, #0
    str r1, [r0, #0x40]
    bx lr
    func_end func_0800F820

    thumb_func_start func_0800F828
func_0800F828: @ 0x0800F828
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800F83E
    bl func_080B3BE8
    movs r0, #2
    b .L0800F840
.L0800F83E:
    movs r0, #0
.L0800F840:
    pop {r1}
    bx r1
    func_end func_0800F828

    thumb_func_start func_0800F844
func_0800F844: @ 0x0800F844
    push {lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r3, [r1, #4]
    ldr r2, [r1, #8]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    bne .L0800F87C
    cmp r2, #0
    beq .L0800F876
    str r1, [sp]
    str r1, [sp, #4]
    str r3, [sp, #8]
    adds r0, r2, #0
    movs r1, #0xa
    movs r2, #0
    movs r3, #0
    bl func_080B5760
    b .L0800F87C
.L0800F876:
    adds r0, r3, #0
    bl func_080B5844
.L0800F87C:
    movs r0, #0
    add sp, #0xc
    pop {r1}
    bx r1
    func_end func_0800F844

    thumb_func_start func_0800F884
func_0800F884: @ 0x0800F884
    push {lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r3, [r1, #4]
    ldr r2, [r1, #8]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    bne .L0800F8BC
    cmp r2, #0
    beq .L0800F8B6
    str r1, [sp]
    str r1, [sp, #4]
    str r3, [sp, #8]
    adds r0, r2, #0
    movs r1, #9
    movs r2, #0
    movs r3, #0
    bl func_080B5760
    b .L0800F8BC
.L0800F8B6:
    adds r0, r3, #0
    bl func_080B5934
.L0800F8BC:
    movs r0, #0
    add sp, #0xc
    pop {r1}
    bx r1
    func_end func_0800F884

    thumb_func_start func_0800F8C4
func_0800F8C4: @ 0x0800F8C4
    push {lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r3, [r1, #4]
    ldr r2, [r1, #8]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    bne .L0800F8FC
    cmp r2, #0
    beq .L0800F8F6
    str r1, [sp]
    str r1, [sp, #4]
    str r3, [sp, #8]
    adds r0, r2, #0
    movs r1, #0xc
    movs r2, #0
    movs r3, #0
    bl func_080B5760
    b .L0800F8FC
.L0800F8F6:
    adds r0, r3, #0
    bl func_080B4890
.L0800F8FC:
    movs r0, #0
    add sp, #0xc
    pop {r1}
    bx r1
    func_end func_0800F8C4

    thumb_func_start func_0800F904
func_0800F904: @ 0x0800F904
    push {lr}
    sub sp, #0xc
    ldr r1, [r0, #0x30]
    ldr r3, [r1, #4]
    ldr r2, [r1, #8]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    cmp r1, #0
    bne .L0800F93C
    cmp r2, #0
    beq .L0800F936
    str r1, [sp]
    str r1, [sp, #4]
    str r3, [sp, #8]
    adds r0, r2, #0
    movs r1, #0xb
    movs r2, #0
    movs r3, #0
    bl func_080B5760
    b .L0800F93C
.L0800F936:
    adds r0, r3, #0
    bl func_080B4828
.L0800F93C:
    movs r0, #0
    add sp, #0xc
    pop {r1}
    bx r1
    func_end func_0800F904

    thumb_func_start func_0800F944
func_0800F944: @ 0x0800F944
    push {r4, r5, lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r2, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800F960
    ldr r4, .L0800F95C @ =0x0000FFFF
    ands r4, r2
    b .L0800F964
    .align 2, 0
.L0800F95C: .4byte 0x0000FFFF
.L0800F960:
    movs r4, #1
    rsbs r4, r4, #0
.L0800F964:
    ldr r2, [r1, #0x30]
    ldrh r3, [r2, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r3
    movs r5, #1
    rsbs r5, r5, #0
    cmp r0, #0
    bne .L0800F978
    adds r5, r3, #0
.L0800F978:
    ldr r2, [r2, #8]
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800F98E
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080B4F68
.L0800F98E:
    movs r0, #0
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_0800F944

    thumb_func_start func_0800F998
func_0800F998: @ 0x0800F998
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800F9AA
    bl func_080B4F6C
.L0800F9AA:
    movs r0, #0
    pop {r1}
    bx r1
    func_end func_0800F998

    thumb_func_start func_0800F9B0
func_0800F9B0: @ 0x0800F9B0
    push {r4, r5, r6, r7, lr}
    sub sp, #0xc
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldr r7, [r0, #4]
    ldr r2, [r0, #8]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800F9D0
    ldr r5, .L0800F9CC @ =0x0000FFFF
    ands r5, r2
    b .L0800F9D4
    .align 2, 0
.L0800F9CC: .4byte 0x0000FFFF
.L0800F9D0:
    movs r5, #1
    rsbs r5, r5, #0
.L0800F9D4:
    ldr r1, [r4, #0x30]
    ldrh r3, [r1, #0xa]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r3
    movs r6, #1
    rsbs r6, r6, #0
    cmp r0, #0
    bne .L0800F9E8
    adds r6, r3, #0
.L0800F9E8:
    ldr r3, [r1, #0xc]
    ldr r2, [r1, #0x10]
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800FA24
    cmp r2, #0
    beq .L0800FA12
    str r5, [sp]
    str r6, [sp, #4]
    str r3, [sp, #8]
    adds r0, r2, #0
    movs r1, #5
    adds r2, r7, #0
    movs r3, #0
    bl func_080B5760
    b .L0800FA24
.L0800FA12:
    lsls r1, r5, #0x10
    asrs r1, r1, #0x10
    lsls r2, r6, #0x10
    asrs r2, r2, #0x10
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    adds r0, r7, #0
    bl func_080B4C60
.L0800FA24:
    movs r0, #0
    add sp, #0xc
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_0800F9B0

    thumb_func_start func_0800FA30
func_0800FA30: @ 0x0800FA30
    push {lr}
    ldr r1, [r0, #0x30]
    ldr r2, [r1, #4]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800FA48
    adds r0, r2, #0
    bl func_080B4D14
.L0800FA48:
    movs r0, #0
    pop {r1}
    bx r1
    func_end func_0800FA30

    thumb_func_start func_0800FA50
func_0800FA50: @ 0x0800FA50
    push {r4, r5, r6, r7, lr}
    sub sp, #0xc
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldr r7, [r0, #4]
    ldr r2, [r0, #8]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800FA70
    ldr r5, .L0800FA6C @ =0x0000FFFF
    ands r5, r2
    b .L0800FA74
    .align 2, 0
.L0800FA6C: .4byte 0x0000FFFF
.L0800FA70:
    movs r5, #1
    rsbs r5, r5, #0
.L0800FA74:
    ldr r1, [r4, #0x30]
    ldrh r3, [r1, #0xa]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r3
    movs r6, #1
    rsbs r6, r6, #0
    cmp r0, #0
    bne .L0800FA88
    adds r6, r3, #0
.L0800FA88:
    ldr r3, [r1, #0xc]
    ldr r2, [r1, #0x10]
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800FAC4
    cmp r2, #0
    beq .L0800FAB2
    str r5, [sp]
    str r6, [sp, #4]
    str r3, [sp, #8]
    adds r0, r2, #0
    movs r1, #4
    adds r2, r7, #0
    movs r3, #0
    bl func_080B5760
    b .L0800FAC4
.L0800FAB2:
    lsls r1, r5, #0x10
    asrs r1, r1, #0x10
    lsls r2, r6, #0x10
    asrs r2, r2, #0x10
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    adds r0, r7, #0
    bl func_080B4B8C
.L0800FAC4:
    movs r0, #0
    add sp, #0xc
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_0800FA50

    thumb_func_start func_0800FAD0
func_0800FAD0: @ 0x0800FAD0
    push {lr}
    ldr r1, [r0, #0x30]
    ldr r2, [r1, #4]
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800FAE8
    adds r0, r2, #0
    bl func_080B4C28
.L0800FAE8:
    movs r0, #0
    pop {r1}
    bx r1
    func_end func_0800FAD0

    thumb_func_start func_0800FAF0
func_0800FAF0: @ 0x0800FAF0
    push {r4, r5, lr}
    sub sp, #0xc
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r2, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800FB10
    ldr r4, .L0800FB0C @ =0x0000FFFF
    ands r4, r2
    b .L0800FB14
    .align 2, 0
.L0800FB0C: .4byte 0x0000FFFF
.L0800FB10:
    movs r4, #1
    rsbs r4, r4, #0
.L0800FB14:
    ldr r3, [r1, #0x30]
    ldrh r2, [r3, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r5, #1
    rsbs r5, r5, #0
    cmp r0, #0
    bne .L0800FB28
    adds r5, r2, #0
.L0800FB28:
    ldr r2, [r3, #8]
    ldr r3, [r3, #0xc]
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L0800FB3C
    movs r0, #0
    b .L0800FB5E
.L0800FB3C:
    cmp r3, #0
    beq .L0800FB54
    str r4, [sp]
    str r5, [sp, #4]
    str r2, [sp, #8]
    adds r0, r3, #0
    movs r1, #8
    movs r2, #0
    movs r3, #0
    bl func_080B5760
    b .L0800FB5C
.L0800FB54:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080B4F9C
.L0800FB5C:
    movs r0, #2
.L0800FB5E:
    add sp, #0xc
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_0800FAF0

    thumb_func_start EvtCmd_SetKeyIgnore
EvtCmd_SetKeyIgnore: @ 0x0800FB68
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    bl func_08001CD0
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_SetKeyIgnore

    thumb_func_start EvtCmd_SetFightScriptOverride
EvtCmd_SetFightScriptOverride: @ 0x0800FB78
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    bl func_0802A830
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_SetFightScriptOverride

    thumb_func_start EvtCmd_ClearMenuOverrides
EvtCmd_ClearMenuOverrides: @ 0x0800FB88
    push {lr}
    bl ClearMenuOverrides
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_ClearMenuOverrides

    thumb_func_start EvtCmd_MenuOverrideHide
EvtCmd_MenuOverrideHide: @ 0x0800FB94
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    ldr r2, .L0800FBA8 @ =func_0804A900
    movs r1, #1
    bl SetMenuOverride
    movs r0, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0800FBA8: .4byte func_0804A900
    func_end EvtCmd_MenuOverrideHide

    thumb_func_start EvtCmd_MenuOverrideDisable
EvtCmd_MenuOverrideDisable: @ 0x0800FBAC
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #4]
    ldr r2, .L0800FBD0 @ =func_0804A8FC
    movs r1, #1
    bl SetMenuOverride
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #4]
    ldr r2, .L0800FBD4 @ =func_0801B244
    movs r1, #2
    bl SetMenuOverride
    movs r0, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L0800FBD0: .4byte func_0804A8FC
.L0800FBD4: .4byte func_0801B244
    func_end EvtCmd_MenuOverrideDisable

    thumb_func_start EvtCmd_MenuOverrideEnable
EvtCmd_MenuOverrideEnable: @ 0x0800FBD8
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    ldr r2, .L0800FBEC @ =func_0804A8F8
    movs r1, #1
    bl SetMenuOverride
    movs r0, #0
    pop {r1}
    bx r1
    .align 2, 0
.L0800FBEC: .4byte func_0804A8F8
    func_end EvtCmd_MenuOverrideEnable

    thumb_func_start EvtCmd_BoxTalk
EvtCmd_BoxTalk: @ 0x0800FBF0
    push {r4, r5, r6, lr}
    adds r2, r0, #0
    ldr r3, [r2, #0x30]
    ldrh r6, [r3, #2]
    movs r4, #0
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800FC8E
    ldr r1, [r3, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r1
    cmp r0, #0
    bne .L0800FC20
    ldr r3, .L0800FC1C @ =0x0000FFFF
    ands r3, r1
    b .L0800FC24
    .align 2, 0
.L0800FC1C: .4byte 0x0000FFFF
.L0800FC20:
    movs r3, #1
    rsbs r3, r3, #0
.L0800FC24:
    ldr r1, [r2, #0x30]
    ldrh r2, [r1, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r5, #1
    rsbs r5, r5, #0
    cmp r0, #0
    bne .L0800FC38
    adds r5, r2, #0
.L0800FC38:
    ldr r2, [r1, #8]
    adds r0, r3, #0
    adds r1, r5, #0
    movs r3, #0
    bl StartBoxTalk
    movs r0, #1
    ands r0, r6
    cmp r0, #0
    beq .L0800FC50
    movs r0, #0x10
    orrs r4, r0
.L0800FC50:
    movs r0, #2
    ands r0, r6
    cmp r0, #0
    beq .L0800FC60
    movs r0, #0x80
    orrs r4, r0
    lsls r0, r4, #0x10
    lsrs r4, r0, #0x10
.L0800FC60:
    movs r0, #4
    ands r0, r6
    cmp r0, #0
    beq .L0800FC74
    movs r1, #0x80
    lsls r1, r1, #1
    adds r0, r1, #0
    orrs r4, r0
    lsls r0, r4, #0x10
    lsrs r4, r0, #0x10
.L0800FC74:
    movs r0, #8
    ands r0, r6
    cmp r0, #0
    beq .L0800FC84
    movs r0, #0x20
    orrs r4, r0
    lsls r0, r4, #0x10
    lsrs r4, r0, #0x10
.L0800FC84:
    cmp r6, #0
    beq .L0800FC8E
    adds r0, r4, #0
    bl SetBoxTalkFlags
.L0800FC8E:
    movs r0, #0
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end EvtCmd_BoxTalk

    thumb_func_start EvtCmd_BoxTalkByTactGender
EvtCmd_BoxTalkByTactGender: @ 0x0800FC98
    push {r4, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800FD2A
    bl IsTactFemale
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800FCF0
    ldr r1, [r4, #0x30]
    ldr r2, [r1, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800FCCC
    ldr r3, .L0800FCC8 @ =0x0000FFFF
    ands r3, r2
    b .L0800FCD0
    .align 2, 0
.L0800FCC8: .4byte 0x0000FFFF
.L0800FCCC:
    movs r3, #1
    rsbs r3, r3, #0
.L0800FCD0:
    ldrh r2, [r1, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r4, #1
    rsbs r4, r4, #0
    cmp r0, #0
    bne .L0800FCE2
    adds r4, r2, #0
.L0800FCE2:
    ldr r2, [r1, #8]
    adds r0, r3, #0
    adds r1, r4, #0
    movs r3, #0
    bl StartBoxTalk
    b .L0800FD2A
.L0800FCF0:
    ldr r1, [r4, #0x30]
    ldr r2, [r1, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800FD08
    ldr r3, .L0800FD04 @ =0x0000FFFF
    ands r3, r2
    b .L0800FD0C
    .align 2, 0
.L0800FD04: .4byte 0x0000FFFF
.L0800FD08:
    movs r3, #1
    rsbs r3, r3, #0
.L0800FD0C:
    ldrh r2, [r1, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r4, #1
    rsbs r4, r4, #0
    cmp r0, #0
    bne .L0800FD1E
    adds r4, r2, #0
.L0800FD1E:
    ldr r2, [r1, #0xc]
    adds r0, r3, #0
    adds r1, r4, #0
    movs r3, #0
    bl StartBoxTalk
.L0800FD2A:
    movs r0, #0
    pop {r4}
    pop {r1}
    bx r1
    func_end EvtCmd_BoxTalkByTactGender

    thumb_func_start func_0800FD34
func_0800FD34: @ 0x0800FD34
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800FD48
    movs r0, #0
    bl StartNoBoxTalk
.L0800FD48:
    movs r0, #0
    pop {r1}
    bx r1
    func_end func_0800FD34

    thumb_func_start EvtCmd_TutorialCursorsTargetMove
EvtCmd_TutorialCursorsTargetMove: @ 0x0800FD50
    push {lr}
    movs r0, #0
    bl StartTutorialCursors
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_TutorialCursorsTargetMove

    thumb_func_start EvtCmd_TutorialCursors
EvtCmd_TutorialCursors: @ 0x0800FD60
    push {lr}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #4]
    cmp r0, #0
    bne .L0800FD72
    movs r0, #1
    bl StartTutorialCursors
    b .L0800FD76
.L0800FD72:
    bl StartTutorialCursors
.L0800FD76:
    movs r0, #0
    pop {r1}
    bx r1
    func_end EvtCmd_TutorialCursors

    thumb_func_start EvtCmd_Call
EvtCmd_Call: @ 0x0800FD7C
    ldr r1, [r0, #0x30]
    ldr r3, [r1, #4]
    ldr r2, [r0, #0x2c]
    str r2, [r0, #0x34]
    adds r1, #8
    str r1, [r0, #0x38]
    str r3, [r0, #0x30]
    str r3, [r0, #0x2c]
    movs r0, #1
    bx lr
    func_end EvtCmd_Call

    thumb_func_start func_0800FD90
func_0800FD90: @ 0x0800FD90
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldr r2, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L0800FDB0
    ldr r5, .L0800FDAC @ =0x0000FFFF
    ands r5, r2
    b .L0800FDB4
    .align 2, 0
.L0800FDAC: .4byte 0x0000FFFF
.L0800FDB0:
    movs r5, #1
    rsbs r5, r5, #0
.L0800FDB4:
    ldr r3, [r4, #0x30]
    ldrh r1, [r3, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r1
    movs r6, #1
    rsbs r6, r6, #0
    cmp r0, #0
    bne .L0800FDC8
    adds r6, r1, #0
.L0800FDC8:
    ldr r3, [r3, #8]
    adds r0, r4, #0
    adds r0, #0x5e
    ldrh r1, [r0]
    movs r0, #4
    ands r0, r1
    lsls r0, r0, #0x10
    lsrs r2, r0, #0x10
    cmp r2, #0
    beq .L0800FDE0
    movs r0, #0
    b .L0800FE10
.L0800FDE0:
    movs r0, #0x80
    lsls r0, r0, #1
    ands r0, r1
    cmp r0, #0
    beq .L0800FDFC
    lsls r3, r3, #0x18
    asrs r3, r3, #0x18
    str r2, [sp]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r6, #0
    bl StartWarpEffect_080209F4
    b .L0800FE0E
.L0800FDFC:
    lsls r3, r3, #0x18
    asrs r3, r3, #0x18
    movs r0, #1
    str r0, [sp]
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r6, #0
    bl StartWarpEffect_080209F4
.L0800FE0E:
    movs r0, #2
.L0800FE10:
    add sp, #4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end func_0800FD90

    thumb_func_start func_0800FE18
func_0800FE18: @ 0x0800FE18
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    ldr r6, [r0, #8]
    ldr r0, [r0, #4]
    bl GetUnitByPid
    adds r2, r0, #0
    adds r0, r4, #0
    adds r0, #0x5e
    ldrh r3, [r0]
    movs r0, #4
    ands r0, r3
    lsls r0, r0, #0x10
    lsrs r1, r0, #0x10
    cmp r1, #0
    beq .L0800FE40
    movs r0, #0
    b .L0800FE76
.L0800FE40:
    movs r5, #0x10
    ldrsb r5, [r2, r5]
    ldrb r2, [r2, #0x11]
    lsls r2, r2, #0x18
    asrs r2, r2, #0x18
    movs r0, #0x80
    lsls r0, r0, #1
    ands r0, r3
    cmp r0, #0
    beq .L0800FE64
    lsls r3, r6, #0x18
    asrs r3, r3, #0x18
    str r1, [sp]
    adds r0, r4, #0
    adds r1, r5, #0
    bl StartWarpEffect_080209F4
    b .L0800FE74
.L0800FE64:
    lsls r3, r6, #0x18
    asrs r3, r3, #0x18
    movs r0, #1
    str r0, [sp]
    adds r0, r4, #0
    adds r1, r5, #0
    bl StartWarpEffect_080209F4
.L0800FE74:
    movs r0, #2
.L0800FE76:
    add sp, #4
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end func_0800FE18

    thumb_func_start func_0800FE80
func_0800FE80: @ 0x0800FE80
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    ldr r0, [r5, #0x30]
    ldr r1, [r0, #4]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r1
    cmp r0, #0
    bne .L0800FE9C
    ldr r2, .L0800FE98 @ =0x0000FFFF
    ands r2, r1
    b .L0800FEA0
    .align 2, 0
.L0800FE98: .4byte 0x0000FFFF
.L0800FE9C:
    movs r2, #1
    rsbs r2, r2, #0
.L0800FEA0:
    ldr r3, [r5, #0x30]
    ldrh r1, [r3, #6]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r1
    movs r7, #1
    rsbs r7, r7, #0
    cmp r0, #0
    bne .L0800FEB4
    adds r7, r1, #0
.L0800FEB4:
    ldr r6, [r3, #8]
    adds r1, r5, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800FEE8
    adds r0, r2, #0
    bl func_080B6278
    adds r4, r0, #0
    subs r4, #0x10
    adds r0, r7, #0
    bl func_080B6288
    adds r2, r0, #0
    subs r2, #0x28
    lsls r3, r6, #0x18
    asrs r3, r3, #0x18
    adds r0, r5, #0
    adds r1, r4, #0
    bl StartWarpEffect_08020A64
    movs r0, #2
    b .L0800FEEA
.L0800FEE8:
    movs r0, #0
.L0800FEEA:
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_0800FE80

    thumb_func_start EventStartCgTalk
EventStartCgTalk: @ 0x0800FEF0
    push {r4, r5, r6, r7, lr}
    sub sp, #0x10
    adds r7, r0, #0
    adds r4, r1, #0
    adds r5, r2, #0
    adds r6, r3, #0
    bl ApplySystemObjectsGraphics
    movs r0, #0x80
    movs r1, #0
    movs r2, #1
    bl InitTalk
    movs r0, #1
    bl EnableBgSync
    cmp r4, #0
    beq .L0800FF1A
    cmp r4, #1
    beq .L0800FF34
    b .L0800FF50
.L0800FF1A:
    str r7, [sp]
    ldr r0, .L0800FF88 @ =0x06011000
    str r0, [sp, #4]
    movs r0, #1
    rsbs r0, r0, #0
    str r0, [sp, #8]
    str r4, [sp, #0xc]
    movs r0, #3
    movs r1, #2
    movs r2, #0x14
    movs r3, #4
    bl func_08087BFC
.L0800FF34:
    str r7, [sp]
    ldr r0, .L0800FF88 @ =0x06011000
    str r0, [sp, #4]
    movs r0, #1
    rsbs r0, r0, #0
    str r0, [sp, #8]
    movs r0, #0
    str r0, [sp, #0xc]
    movs r0, #3
    movs r1, #0x12
    movs r2, #0x14
    movs r3, #4
    bl func_08087BFC
.L0800FF50:
    ldr r0, .L0800FF8C @ =Event_CgTalkOnSkip
    str r0, [r6, #0x40]
    adds r0, r6, #0
    adds r0, #0x5e
    ldrh r1, [r0]
    movs r0, #0x80
    ands r0, r1
    cmp r0, #0
    beq .L0800FF66
    movs r0, #0x40
    orrs r5, r0
.L0800FF66:
    movs r0, #0x80
    lsls r0, r0, #1
    ands r0, r1
    cmp r0, #0
    beq .L0800FF7A
    ldr r0, .L0800FF90 @ =0x00002820
    orrs r5, r0
    adds r0, r6, #0
    bl EventForceSlowTextSpeed
.L0800FF7A:
    adds r0, r5, #0
    bl SetCgFlags
    add sp, #0x10
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800FF88: .4byte 0x06011000
.L0800FF8C: .4byte Event_CgTalkOnSkip
.L0800FF90: .4byte 0x00002820
    func_end EventStartCgTalk

    thumb_func_start EvtCmd_CgTalk
EvtCmd_CgTalk: @ 0x0800FF94
    push {r4, r5, lr}
    adds r3, r0, #0
    ldr r0, [r3, #0x30]
    ldr r2, [r0, #4]
    ldr r4, [r0, #8]
    adds r1, r3, #0
    adds r1, #0x5e
    ldr r0, .L0800FFC4 @ =0x0000FFFD
    ldrh r5, [r1]
    ands r0, r5
    strh r0, [r1]
    movs r1, #4
    ands r0, r1
    cmp r0, #0
    bne .L0800FFC8
    adds r0, r2, #0
    adds r1, r4, #0
    movs r2, #0x80
    lsls r2, r2, #3
    bl EventStartCgTalk
    movs r0, #2
    b .L0800FFCA
    .align 2, 0
.L0800FFC4: .4byte 0x0000FFFD
.L0800FFC8:
    movs r0, #0
.L0800FFCA:
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end EvtCmd_CgTalk

    thumb_func_start func_0800FFD0
func_0800FFD0: @ 0x0800FFD0
    push {r4, r5, r6, lr}
    adds r3, r0, #0
    ldr r0, [r3, #0x30]
    ldr r4, [r0, #4]
    ldr r5, [r0, #8]
    ldr r2, [r0, #0xc]
    movs r0, #0x80
    lsls r0, r0, #3
    orrs r2, r0
    adds r1, r3, #0
    adds r1, #0x5e
    ldr r0, .L08010004 @ =0x0000FFFD
    ldrh r6, [r1]
    ands r0, r6
    strh r0, [r1]
    movs r1, #4
    ands r0, r1
    cmp r0, #0
    bne .L08010008
    adds r0, r4, #0
    adds r1, r5, #0
    bl EventStartCgTalk
    movs r0, #2
    b .L0801000A
    .align 2, 0
.L08010004: .4byte 0x0000FFFD
.L08010008:
    movs r0, #0
.L0801000A:
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end func_0800FFD0

    thumb_func_start func_08010010
func_08010010: @ 0x08010010
    push {r4, lr}
    adds r3, r0, #0
    ldr r0, [r3, #0x30]
    ldr r1, [r0, #4]
    ldr r4, [r0, #8]
    adds r0, r3, #0
    adds r0, #0x5e
    ldrh r2, [r0]
    movs r0, #4
    ands r0, r2
    cmp r0, #0
    bne .L08010040
    movs r0, #2
    ands r0, r2
    cmp r0, #0
    bne .L08010040
    adds r0, r1, #0
    adds r1, r4, #0
    movs r2, #0x80
    lsls r2, r2, #3
    bl EventStartCgTalk
    movs r0, #2
    b .L08010042
.L08010040:
    movs r0, #0
.L08010042:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08010010

    thumb_func_start func_08010048
func_08010048: @ 0x08010048
    push {lr}
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0801005E
    bl func_08087D44
    movs r0, #2
    b .L08010060
.L0801005E:
    movs r0, #0
.L08010060:
    pop {r1}
    bx r1
    func_end func_08010048

    thumb_func_start EvtCmd_CgBackground
EvtCmd_CgBackground: @ 0x08010064
    push {r4, r5, lr}
    sub sp, #4
    adds r2, r0, #0
    ldr r0, [r2, #0x30]
    ldrh r5, [r0, #2]
    adds r1, r2, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L08010080
    movs r0, #0
    b .L080100C2
.L08010080:
    adds r4, r2, #0
    adds r4, #0x4c
    movs r1, #0
    ldrsb r1, [r4, r1]
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    bne .L08010098
    bl LockBmDisplay
    bl LockMus
.L08010098:
    movs r0, #0x61
    strb r0, [r4]
    movs r0, #3
    bl GetBgChrOffset
    adds r1, r0, #0
    ldr r0, .L080100CC @ =gBg3Tm
    str r5, [sp]
    movs r2, #8
    movs r3, #8
    bl PutCgBackground
    movs r0, #8
    bl EnableBgSync
    movs r0, #3
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    movs r0, #2
.L080100C2:
    add sp, #4
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L080100CC: .4byte gBg3Tm
    func_end EvtCmd_CgBackground

    thumb_func_start func_080100D0
func_080100D0: @ 0x080100D0
    adds r0, #0x5e
    movs r1, #4
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    beq .L080100DE
    movs r0, #0
.L080100DE:
    bx lr
    func_end func_080100D0

    thumb_func_start EvtCmd_PaletteFadeFromBlack
EvtCmd_PaletteFadeFromBlack: @ 0x080100E0
    push {lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldrh r3, [r0, #2]
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    beq .L080100FA
    movs r0, #0
    b .L08010132
.L080100FA:
    cmp r3, #1
    beq .L0801011A
    cmp r3, #1
    bgt .L08010108
    cmp r3, #0
    beq .L08010112
    b .L08010130
.L08010108:
    cmp r3, #2
    beq .L08010122
    cmp r3, #3
    beq .L0801012A
    b .L08010130
.L08010112:
    movs r0, #0x10
    bl StartLockingPaletteFadeFromBlack
    b .L08010130
.L0801011A:
    movs r0, #8
    bl StartLockingPaletteFadeFromBlack
    b .L08010130
.L08010122:
    movs r0, #4
    bl StartLockingPaletteFadeFromBlack
    b .L08010130
.L0801012A:
    movs r0, #2
    bl StartLockingPaletteFadeFromBlack
.L08010130:
    movs r0, #2
.L08010132:
    pop {r1}
    bx r1
    func_end EvtCmd_PaletteFadeFromBlack

    thumb_func_start EvtCmd_PaletteFadeToBlack
EvtCmd_PaletteFadeToBlack: @ 0x08010138
    push {lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldrh r3, [r0, #2]
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    beq .L08010152
    movs r0, #0
    b .L0801018A
.L08010152:
    cmp r3, #1
    beq .L08010172
    cmp r3, #1
    bgt .L08010160
    cmp r3, #0
    beq .L0801016A
    b .L08010188
.L08010160:
    cmp r3, #2
    beq .L0801017A
    cmp r3, #3
    beq .L08010182
    b .L08010188
.L0801016A:
    movs r0, #0x10
    bl StartLockingPaletteFadeToBlack
    b .L08010188
.L08010172:
    movs r0, #8
    bl StartLockingPaletteFadeToBlack
    b .L08010188
.L0801017A:
    movs r0, #4
    bl StartLockingPaletteFadeToBlack
    b .L08010188
.L08010182:
    movs r0, #2
    bl StartLockingPaletteFadeToBlack
.L08010188:
    movs r0, #2
.L0801018A:
    pop {r1}
    bx r1
    func_end EvtCmd_PaletteFadeToBlack

    thumb_func_start Event_CgTalkOnSkip
Event_CgTalkOnSkip: @ 0x08010190
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L080101B2
    bl func_08087D44
    adds r0, r4, #0
    bl func_0800AF20
    movs r0, #0
    str r0, [r4, #0x40]
    b .L080101C6
.L080101B2:
    bl func_08087D58
    lsls r0, r0, #0x18
    asrs r5, r0, #0x18
    cmp r5, #0
    bne .L080101C6
    adds r0, r4, #0
    bl func_0800AF20
    str r5, [r4, #0x40]
.L080101C6:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end Event_CgTalkOnSkip

    thumb_func_start func_080101CC
func_080101CC: @ 0x080101CC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r6, r0, #0
    ldr r2, [r6, #0x38]
    movs r1, #0x80
    lsls r1, r1, #3
    adds r0, r2, r1
    ldr r4, .L080102E4 @ =0x0001FFFF
    ands r0, r4
    lsrs r0, r0, #5
    str r0, [sp, #4]
    ldr r1, [r6, #0x3c]
    adds r0, r1, #1
    movs r3, #0xf
    ands r0, r3
    lsls r0, r0, #0xc
    ldr r5, [sp, #4]
    orrs r5, r0
    str r5, [sp, #4]
    ands r2, r4
    lsrs r7, r2, #5
    ands r1, r3
    lsls r1, r1, #0xc
    orrs r7, r1
    ldr r1, [r6, #0x30]
    adds r4, r6, #0
    adds r4, #0x48
    ldr r2, [r6, #0x34]
    ldrh r0, [r4]
    adds r2, r0, r2
    ldr r5, .L080102E8 @ =0x08B905E8
    str r7, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    ldr r0, [r6, #0x44]
    subs r0, #2
    lsls r0, r0, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r0
    ldr r2, [r6, #0x34]
    ldrh r3, [r4]
    adds r2, r3, r2
    adds r0, r7, #4
    str r0, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    ldr r1, [r6, #0x30]
    ldrh r0, [r4]
    adds r0, #0x18
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    adds r0, r7, #0
    adds r0, #0xd
    str r0, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    ldr r0, [r6, #0x44]
    subs r0, #2
    lsls r0, r0, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r0
    ldrh r0, [r4]
    adds r0, #0x18
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    adds r0, r7, #0
    adds r0, #0x11
    str r0, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    ldr r1, [r6, #0x30]
    ldrh r0, [r4]
    adds r0, #8
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    ldr r5, .L080102EC @ =0x08B905B0
    adds r0, r7, #6
    str r0, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    ldr r1, [r6, #0x30]
    ldrh r0, [r4]
    adds r0, #0x10
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    adds r0, r7, #0
    adds r0, #0xb
    str r0, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    ldr r0, [r6, #0x44]
    subs r0, #1
    lsls r0, r0, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r0
    ldrh r0, [r4]
    adds r0, #8
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    adds r0, r7, #0
    adds r0, #0xa
    str r0, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    ldr r0, [r6, #0x44]
    subs r0, #1
    lsls r0, r0, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r0
    ldrh r0, [r4]
    adds r0, #0x10
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    adds r0, r7, #0
    adds r0, #0xc
    str r0, [sp]
    movs r0, #4
    adds r3, r5, #0
    bl func_08006A34
    movs r5, #2
    b .L0801030E
    .align 2, 0
.L080102E4: .4byte 0x0001FFFF
.L080102E8: .4byte 0x08B905E8
.L080102EC: .4byte 0x08B905B0
.L080102F0:
    lsls r0, r5, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r0
    adds r0, r6, #0
    adds r0, #0x48
    ldr r2, [r6, #0x34]
    ldrh r0, [r0]
    adds r2, r0, r2
    adds r0, r7, #2
    str r0, [sp]
    movs r0, #4
    ldr r3, .L0801034C @ =0x08B905E8
    bl func_08006A34
    adds r5, #2
.L0801030E:
    ldr r0, [r6, #0x44]
    subs r0, #2
    cmp r5, r0
    blt .L080102F0
    ldr r0, [r6, #0x44]
    subs r0, #1
    movs r1, #0x48
    adds r1, r1, r6
    mov sl, r1
    cmp r5, r0
    bge .L08010348
.L08010324:
    lsls r0, r5, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r0
    ldr r2, [r6, #0x34]
    mov r3, sl
    ldrh r3, [r3]
    adds r2, r3, r2
    adds r0, r7, #2
    str r0, [sp]
    movs r0, #4
    ldr r3, .L08010350 @ =0x08B905B0
    bl func_08006A34
    adds r5, #1
    ldr r0, [r6, #0x44]
    subs r0, #1
    cmp r5, r0
    blt .L08010324
.L08010348:
    movs r5, #2
    b .L08010374
    .align 2, 0
.L0801034C: .4byte 0x08B905E8
.L08010350: .4byte 0x08B905B0
.L08010354:
    lsls r0, r5, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r0
    mov r2, sl
    ldrh r0, [r2]
    adds r0, #0x18
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    adds r0, r7, #0
    adds r0, #0xf
    str r0, [sp]
    movs r0, #4
    ldr r3, .L08010454 @ =0x08B905E8
    bl func_08006A34
    adds r5, #2
.L08010374:
    ldr r0, [r6, #0x44]
    subs r0, #2
    cmp r5, r0
    blt .L08010354
    movs r5, #1
    ldr r0, [r6, #0x44]
    subs r0, #2
    cmp r5, r0
    bge .L080103CE
    mov sb, sl
    movs r3, #8
    adds r3, r3, r7
    mov r8, r3
.L0801038E:
    lsls r4, r5, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r4
    mov r2, sb
    ldrh r0, [r2]
    adds r0, #8
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    mov r3, r8
    str r3, [sp]
    movs r0, #4
    ldr r3, .L08010454 @ =0x08B905E8
    bl func_08006A34
    ldr r1, [r6, #0x30]
    adds r1, r1, r4
    mov r2, sb
    ldrh r0, [r2]
    adds r0, #0x10
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    mov r3, r8
    str r3, [sp]
    movs r0, #4
    ldr r3, .L08010454 @ =0x08B905E8
    bl func_08006A34
    adds r5, #2
    ldr r0, [r6, #0x44]
    subs r0, #2
    cmp r5, r0
    blt .L0801038E
.L080103CE:
    ldr r0, [r6, #0x44]
    subs r0, #1
    cmp r5, r0
    bge .L0801041A
    mov r8, sl
    ldr r0, .L08010458 @ =0x08B905B0
    mov sb, r0
    adds r7, #8
.L080103DE:
    lsls r4, r5, #3
    ldr r1, [r6, #0x30]
    adds r1, r1, r4
    mov r2, r8
    ldrh r0, [r2]
    adds r0, #8
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    str r7, [sp]
    movs r0, #4
    mov r3, sb
    bl func_08006A34
    ldr r1, [r6, #0x30]
    adds r1, r1, r4
    mov r3, r8
    ldrh r0, [r3]
    adds r0, #0x10
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    str r7, [sp]
    movs r0, #4
    mov r3, sb
    bl func_08006A34
    adds r5, #1
    ldr r0, [r6, #0x44]
    subs r0, #1
    cmp r5, r0
    blt .L080103DE
.L0801041A:
    ldr r4, [sp, #4]
    movs r7, #8
    movs r5, #2
.L08010420:
    ldr r1, [r6, #0x30]
    adds r1, r1, r7
    mov r2, sl
    ldrh r0, [r2]
    adds r0, #8
    ldr r2, [r6, #0x34]
    adds r2, r2, r0
    str r4, [sp]
    movs r0, #0
    ldr r3, .L0801045C @ =0x08B905F8
    bl func_08006A34
    adds r4, #4
    adds r7, #0x20
    subs r5, #1
    cmp r5, #0
    bge .L08010420
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08010454: .4byte 0x08B905E8
.L08010458: .4byte 0x08B905B0
.L0801045C: .4byte 0x08B905F8
    func_end func_080101CC

    thumb_func_start func_08010460
func_08010460: @ 0x08010460
    bx lr
    func_end func_08010460

    thumb_func_start func_08010464
func_08010464: @ 0x08010464
    adds r2, r0, #0
    lsls r1, r1, #0x18
    lsrs r0, r1, #0x18
    cmp r2, #0
    beq .L08010488
    lsls r0, r0, #0x18
    asrs r1, r0, #0x18
    cmp r1, #0
    beq .L08010482
    adds r1, r2, #0
    adds r1, #0x48
    movs r0, #0x80
    lsls r0, r0, #3
    strh r0, [r1]
    b .L08010488
.L08010482:
    adds r0, r2, #0
    adds r0, #0x48
    strh r1, [r0]
.L08010488:
    bx lr
    func_end func_08010464

    thumb_func_start func_0801048C
func_0801048C: @ 0x0801048C
    push {lr}
    adds r0, #0x4c
    movs r3, #0
    movs r1, #0
    strh r1, [r0]
    ldr r0, .L080104F8 @ =gDispIo
    mov ip, r0
    mov r2, ip
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    mov r0, ip
    adds r0, #0x44
    strb r3, [r0]
    mov r1, ip
    adds r1, #0x45
    movs r0, #0x10
    strb r0, [r1]
    mov r0, ip
    adds r0, #0x46
    strb r3, [r0]
    ldr r0, .L080104FC @ =0x0000FFE0
    mov r3, ip
    ldrh r3, [r3, #0x3c]
    ands r0, r3
    ldr r1, .L08010500 @ =0x0000E0FF
    ands r0, r1
    movs r3, #0xf8
    lsls r3, r3, #5
    adds r1, r3, #0
    orrs r0, r1
    mov r1, ip
    strh r0, [r1, #0x3c]
    movs r0, #0x20
    ldrb r1, [r2]
    orrs r1, r0
    strb r1, [r2]
    mov r1, ip
    adds r1, #0x3d
    ldrb r2, [r1]
    orrs r0, r2
    strb r0, [r1]
    ldr r0, .L08010504 @ =0x08B91EDC
    bl Proc_Find
    movs r1, #1
    bl func_08010464
    pop {r0}
    bx r0
    .align 2, 0
.L080104F8: .4byte gDispIo
.L080104FC: .4byte 0x0000FFE0
.L08010500: .4byte 0x0000E0FF
.L08010504: .4byte 0x08B91EDC
    func_end func_0801048C

    thumb_func_start func_08010508
func_08010508: @ 0x08010508
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    adds r3, r0, #0
    adds r0, #0x4c
    ldrh r1, [r0]
    adds r1, #1
    movs r6, #0
    strh r1, [r0]
    movs r1, #0
    ldrsh r4, [r0, r1]
    ldr r2, .L08010588 @ =gDispIo
    adds r5, r2, #0
    adds r5, #0x3c
    movs r0, #0x3f
    mov sl, r0
    ldrb r1, [r5]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r5]
    movs r0, #0x44
    adds r0, r0, r2
    mov sb, r0
    strb r4, [r0]
    movs r0, #0x10
    subs r0, r0, r4
    movs r1, #0x45
    adds r1, r1, r2
    mov r8, r1
    strb r0, [r1]
    adds r7, r2, #0
    adds r7, #0x46
    strb r6, [r7]
    cmp r4, #0x10
    bne .L08010578
    adds r0, r3, #0
    bl Proc_Break
    mov r0, sl
    ldrb r1, [r5]
    ands r0, r1
    strb r0, [r5]
    mov r0, sb
    strb r4, [r0]
    mov r1, r8
    strb r6, [r1]
    strb r6, [r7]
    ldr r0, .L0801058C @ =0x08B91EDC
    bl Proc_Find
    movs r1, #0
    bl func_08010464
.L08010578:
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08010588: .4byte gDispIo
.L0801058C: .4byte 0x08B91EDC
    func_end func_08010508

    thumb_func_start func_08010590
func_08010590: @ 0x08010590
    push {lr}
    adds r0, #0x4c
    movs r3, #0
    movs r1, #0
    strh r1, [r0]
    ldr r0, .L080105FC @ =gDispIo
    mov ip, r0
    mov r2, ip
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    mov r1, ip
    adds r1, #0x44
    movs r0, #0x10
    strb r0, [r1]
    mov r0, ip
    adds r0, #0x45
    strb r3, [r0]
    adds r0, #1
    strb r3, [r0]
    ldr r0, .L08010600 @ =0x0000FFE0
    mov r3, ip
    ldrh r3, [r3, #0x3c]
    ands r0, r3
    ldr r1, .L08010604 @ =0x0000E0FF
    ands r0, r1
    movs r3, #0xf8
    lsls r3, r3, #5
    adds r1, r3, #0
    orrs r0, r1
    mov r1, ip
    strh r0, [r1, #0x3c]
    movs r0, #0x20
    ldrb r1, [r2]
    orrs r1, r0
    strb r1, [r2]
    mov r1, ip
    adds r1, #0x3d
    ldrb r2, [r1]
    orrs r0, r2
    strb r0, [r1]
    ldr r0, .L08010608 @ =0x08B91EDC
    bl Proc_Find
    movs r1, #1
    bl func_08010464
    pop {r0}
    bx r0
    .align 2, 0
.L080105FC: .4byte gDispIo
.L08010600: .4byte 0x0000FFE0
.L08010604: .4byte 0x0000E0FF
.L08010608: .4byte 0x08B91EDC
    func_end func_08010590

    thumb_func_start func_0801060C
func_0801060C: @ 0x0801060C
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r0, #0x4c
    ldrh r1, [r0]
    adds r1, #1
    movs r4, #0
    strh r1, [r0]
    movs r1, #0
    ldrsh r3, [r0, r1]
    ldr r0, .L08010660 @ =gDispIo
    mov ip, r0
    mov r2, ip
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    movs r0, #0x10
    subs r0, r0, r3
    mov r1, ip
    adds r1, #0x44
    strb r0, [r1]
    mov r0, ip
    adds r0, #0x45
    strb r3, [r0]
    adds r0, #1
    strb r4, [r0]
    cmp r3, #0x10
    bne .L0801065A
    ldr r0, .L08010664 @ =0x08B91EDC
    bl Proc_Find
    bl Proc_End
    adds r0, r5, #0
    bl Proc_Break
.L0801065A:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08010660: .4byte gDispIo
.L08010664: .4byte 0x08B91EDC
    func_end func_0801060C

    thumb_func_start func_08010668
func_08010668: @ 0x08010668
    ldr r3, .L0801068C @ =gDispIo
    adds r1, r3, #0
    adds r1, #0x3c
    movs r0, #0x3f
    ldrb r2, [r1]
    ands r0, r2
    strb r0, [r1]
    adds r1, #8
    movs r2, #0
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x45
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    bx lr
    .align 2, 0
.L0801068C: .4byte gDispIo
    func_end func_08010668

    thumb_func_start func_08010690
func_08010690: @ 0x08010690
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x20
    mov r8, r0
    mov sb, r1
    adds r4, r2, #0
    adds r5, r3, #0
    movs r6, #0
    ldr r0, .L08010788 @ =0x08B91EDC
    ldr r1, [sp, #0x44]
    bl SpawnProc
    adds r7, r0, #0
    adds r0, r4, #0
    bl GetMsg
    mov sl, r0
    mov r0, r8
    str r0, [r7, #0x30]
    mov r2, sb
    str r2, [r7, #0x34]
    str r5, [r7, #0x38]
    ldr r0, [sp, #0x40]
    str r0, [r7, #0x3c]
    str r4, [r7, #0x40]
    adds r0, r7, #0
    adds r0, #0x48
    strh r6, [r0]
    ldr r0, .L0801078C @ =0x08B91EFC
    ldr r1, [sp, #0x44]
    bl SpawnProcLocking
    ldr r0, .L08010790 @ =0x0842535C
    ldr r1, [r7, #0x3c]
    adds r1, #0x10
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r0, .L08010794 @ =0x08194674
    ldr r1, [r7, #0x3c]
    adds r1, #0x11
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r0, .L08010798 @ =0x084251BC
    ldr r1, [r7, #0x38]
    ldr r2, .L0801079C @ =0x06010000
    adds r1, r1, r2
    bl Decompress
    mov r0, sl
    bl func_080055FC
    adds r6, r0, #0
    cmp r6, #0
    bge .L0801070C
    adds r0, r6, #7
.L0801070C:
    asrs r5, r0, #3
    adds r6, r5, #5
    str r6, [r7, #0x44]
    ldr r0, [r7, #0x30]
    cmp r0, #0
    bge .L0801071C
    movs r0, #8
    str r0, [r7, #0x30]
.L0801071C:
    ldr r0, [r7, #0x44]
    lsls r1, r0, #3
    ldr r0, [r7, #0x30]
    adds r0, r0, r1
    cmp r0, #0xf0
    ble .L0801072E
    movs r0, #0xe8
    subs r0, r0, r1
    str r0, [r7, #0x30]
.L0801072E:
    ldr r1, [r7, #0x38]
    ldr r0, .L080107A0 @ =0x06010400
    adds r1, r1, r0
    ldr r2, [r7, #0x3c]
    adds r2, #0x12
    mov r0, sp
    bl InitSpriteTextFont
    mov r0, sp
    bl SetTextFont
    add r4, sp, #0x18
    adds r0, r4, #0
    bl InitSpriteText
    adds r0, r4, #0
    movs r1, #0
    bl func_08005CF8
    movs r0, #0
    bl SetTextFontGlyphs
    adds r0, r5, #3
    lsls r0, r0, #3
    mov r1, sl
    bl GetStringTextCenteredPos
    adds r1, r0, #0
    adds r0, r4, #0
    movs r2, #0
    mov r3, sl
    bl Text_InsertDrawString
    movs r0, #0
    bl SetTextFont
    add sp, #0x20
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08010788: .4byte 0x08B91EDC
.L0801078C: .4byte 0x08B91EFC
.L08010790: .4byte 0x0842535C
.L08010794: .4byte 0x08194674
.L08010798: .4byte 0x084251BC
.L0801079C: .4byte 0x06010000
.L080107A0: .4byte 0x06010400
    func_end func_08010690

    thumb_func_start func_080107A4
func_080107A4: @ 0x080107A4
    push {r4, r5, lr}
    sub sp, #8
    adds r2, r0, #0
    ldr r0, [r2, #0x30]
    ldr r5, [r0, #4]
    ldr r1, [r0, #8]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r1
    cmp r0, #0
    bne .L080107C4
    ldr r4, .L080107C0 @ =0x0000FFFF
    ands r4, r1
    b .L080107C8
    .align 2, 0
.L080107C0: .4byte 0x0000FFFF
.L080107C4:
    movs r4, #1
    rsbs r4, r4, #0
.L080107C8:
    ldr r0, [r2, #0x30]
    ldrh r3, [r0, #0xa]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r3
    movs r1, #1
    rsbs r1, r1, #0
    cmp r0, #0
    bne .L080107DC
    adds r1, r3, #0
.L080107DC:
    adds r3, r2, #0
    adds r3, #0x5e
    movs r0, #4
    ldrh r3, [r3]
    ands r0, r3
    cmp r0, #0
    bne .L08010800
    movs r3, #0xa0
    lsls r3, r3, #7
    movs r0, #9
    str r0, [sp]
    str r2, [sp, #4]
    adds r0, r4, #0
    adds r2, r5, #0
    bl func_08010690
    movs r0, #2
    b .L08010802
.L08010800:
    movs r0, #0
.L08010802:
    add sp, #8
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_080107A4

    thumb_func_start func_0801080C
func_0801080C: @ 0x0801080C
    push {lr}
    adds r1, r0, #0
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    beq .L08010830
    ldr r0, .L0801082C @ =0x08B91EDC
    bl Proc_Find
    bl Proc_End
    movs r0, #0
    b .L08010858
    .align 2, 0
.L0801082C: .4byte 0x08B91EDC
.L08010830:
    adds r0, r1, #0
    adds r0, #0x4d
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #0
    beq .L08010850
    ldr r0, .L0801084C @ =0x08B91EDC
    bl Proc_Find
    bl Proc_End
    b .L08010856
    .align 2, 0
.L0801084C: .4byte 0x08B91EDC
.L08010850:
    ldr r0, .L0801085C @ =0x08B91F14
    bl SpawnProcLocking
.L08010856:
    movs r0, #2
.L08010858:
    pop {r1}
    bx r1
    .align 2, 0
.L0801085C: .4byte 0x08B91F14
    func_end func_0801080C

    thumb_func_start func_08010860
func_08010860: @ 0x08010860
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    ldr r4, .L08010910 @ =gDispIo
    movs r6, #1
    ldrb r0, [r4, #1]
    orrs r0, r6
    movs r7, #2
    orrs r0, r7
    movs r1, #5
    rsbs r1, r1, #0
    ands r0, r1
    movs r1, #8
    orrs r0, r1
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r4, #1]
    adds r3, r4, #0
    adds r3, #0x3c
    movs r0, #0x3f
    ldrb r1, [r3]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r3]
    adds r1, r4, #0
    adds r1, #0x44
    movs r2, #0
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r4, #0
    adds r0, #0x45
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    ldr r0, .L08010914 @ =0x0000FFE0
    ldrh r2, [r4, #0x3c]
    ands r0, r2
    movs r1, #4
    orrs r0, r1
    ldr r1, .L08010918 @ =0x0000E0FF
    ands r0, r1
    movs r2, #0x80
    lsls r2, r2, #4
    adds r1, r2, #0
    orrs r0, r1
    strh r0, [r4, #0x3c]
    movs r0, #0x20
    ldrb r1, [r3]
    orrs r1, r0
    strb r1, [r3]
    adds r1, r4, #0
    adds r1, #0x3d
    ldrb r2, [r1]
    orrs r0, r2
    strb r0, [r1]
    movs r0, #2
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    ldr r0, [r5, #0x34]
    movs r1, #0x80
    lsls r1, r1, #1
    ands r0, r1
    cmp r0, #0
    bne .L0801091C
    movs r1, #4
    rsbs r1, r1, #0
    adds r0, r1, #0
    ldrb r2, [r4, #0xc]
    ands r0, r2
    strb r0, [r4, #0xc]
    adds r0, r1, #0
    ldrb r2, [r4, #0x10]
    ands r0, r2
    orrs r0, r6
    strb r0, [r4, #0x10]
    ldrb r0, [r4, #0x14]
    ands r1, r0
    orrs r1, r7
    strb r1, [r4, #0x14]
    movs r0, #3
    ldrb r1, [r4, #0x18]
    orrs r0, r1
    strb r0, [r4, #0x18]
    movs r0, #8
    b .L0801091E
    .align 2, 0
.L08010910: .4byte gDispIo
.L08010914: .4byte 0x0000FFE0
.L08010918: .4byte 0x0000E0FF
.L0801091C:
    movs r0, #6
.L0801091E:
    str r0, [r5, #0x44]
    movs r0, #0
    str r0, [r5, #0x30]
    ldr r0, .L08010934 @ =0x08B90D88
    bl Proc_Find
    str r0, [r5, #0x40]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08010934: .4byte 0x08B90D88
    func_end func_08010860

    thumb_func_start func_08010938
func_08010938: @ 0x08010938
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, .L080109A0 @ =0x06008000
    ldr r1, .L080109A4 @ =0x06001000
    movs r2, #0xa0
    lsls r2, r2, #5
    bl CpuFastSet
    ldr r0, .L080109A8 @ =0x02022960
    ldr r2, .L080109AC @ =0xFFFFFF00
    adds r1, r0, r2
    ldr r2, [r4, #0x44]
    lsls r2, r2, #3
    ldr r3, .L080109B0 @ =0x001FFFFF
    ands r2, r3
    bl CpuFastSet
    ldr r5, .L080109B4 @ =0x00008080
    adds r4, r5, #0
    ldr r3, .L080109B8 @ =gBg3Tm
    ldr r2, .L080109BC @ =gBg2Tm
    movs r1, #0x80
    lsls r1, r1, #3
.L08010966:
    ldrh r5, [r3]
    adds r0, r4, r5
    strh r0, [r2]
    adds r3, #2
    adds r2, #2
    subs r1, #1
    cmp r1, #0
    bne .L08010966
    movs r0, #4
    bl EnableBgSync
    bl EnablePalSync
    ldr r2, .L080109C0 @ =gDispIo
    movs r0, #1
    ldrb r1, [r2, #1]
    orrs r0, r1
    movs r1, #2
    orrs r0, r1
    movs r1, #4
    orrs r0, r1
    movs r1, #8
    orrs r0, r1
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r2, #1]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080109A0: .4byte 0x06008000
.L080109A4: .4byte 0x06001000
.L080109A8: .4byte 0x02022960
.L080109AC: .4byte 0xFFFFFF00
.L080109B0: .4byte 0x001FFFFF
.L080109B4: .4byte 0x00008080
.L080109B8: .4byte gBg3Tm
.L080109BC: .4byte gBg2Tm
.L080109C0: .4byte gDispIo
    func_end func_08010938

    thumb_func_start func_080109C4
func_080109C4: @ 0x080109C4
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #0
    beq .L08010A2C
    ldr r4, .L08010A20 @ =gBackgroundTable
    ldr r1, [r5, #0x2c]
    lsls r0, r1, #1
    adds r0, r0, r1
    lsls r0, r0, #2
    adds r0, r0, r4
    ldr r0, [r0]
    ldr r1, .L08010A24 @ =0x06008000
    bl Decompress
    ldr r0, .L08010A28 @ =gBg3Tm
    ldr r2, [r5, #0x2c]
    lsls r1, r2, #1
    adds r1, r1, r2
    lsls r1, r1, #2
    adds r2, r4, #4
    adds r1, r1, r2
    ldr r1, [r1]
    movs r2, #0x80
    lsls r2, r2, #8
    bl TmApplyTsa_thm
    ldr r1, [r5, #0x2c]
    lsls r0, r1, #1
    adds r0, r0, r1
    lsls r0, r0, #2
    adds r4, #8
    adds r0, r0, r4
    ldr r0, [r0]
    movs r1, #0x80
    lsls r1, r1, #1
    ldr r2, [r5, #0x44]
    lsls r2, r2, #5
    bl ApplyPaletteExt
    b .L08010A3E
    .align 2, 0
.L08010A20: .4byte gBackgroundTable
.L08010A24: .4byte 0x06008000
.L08010A28: .4byte gBg3Tm
.L08010A2C:
    ldr r0, .L08010A4C @ =gBg3Tm
    movs r1, #0x80
    lsls r1, r1, #8
    ldr r3, [r5, #0x44]
    ldr r2, [r5, #0x2c]
    str r2, [sp]
    movs r2, #8
    bl PutCgBackground
.L08010A3E:
    movs r0, #8
    bl EnableBgSync
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08010A4C: .4byte gBg3Tm
    func_end func_080109C4

    thumb_func_start func_08010A50
func_08010A50: @ 0x08010A50
    push {r4, lr}
    adds r4, r0, #0
    ldr r2, [r4, #0x30]
    ldr r0, [r4, #0x38]
    adds r2, r2, r0
    str r2, [r4, #0x30]
    asrs r2, r2, #4
    ldr r0, .L08010A98 @ =gDispIo
    mov ip, r0
    mov r3, ip
    adds r3, #0x3c
    movs r0, #0x3f
    ldrb r1, [r3]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r3]
    movs r0, #0x10
    subs r0, r0, r2
    mov r1, ip
    adds r1, #0x44
    movs r3, #0
    strb r0, [r1]
    mov r0, ip
    adds r0, #0x45
    strb r2, [r0]
    adds r0, #1
    strb r3, [r0]
    cmp r2, #0x10
    bne .L08010A92
    adds r0, r4, #0
    bl Proc_Break
.L08010A92:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08010A98: .4byte gDispIo
    func_end func_08010A50

    thumb_func_start func_08010A9C
func_08010A9C: @ 0x08010A9C
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #3
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    ldr r0, .L08010AF0 @ =gBg2Tm
    movs r1, #0
    bl TmFill
    movs r0, #4
    bl EnableBgSync
    ldr r3, .L08010AF4 @ =gDispIo
    adds r1, r3, #0
    adds r1, #0x3c
    movs r0, #0x3f
    ldrb r2, [r1]
    ands r0, r2
    strb r0, [r1]
    adds r1, #8
    movs r2, #0
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x45
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    ldr r0, [r4, #0x34]
    movs r1, #0x80
    lsls r1, r1, #1
    ands r0, r1
    cmp r0, #0
    bne .L08010AE8
    bl func_0801551C
.L08010AE8:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08010AF0: .4byte gBg2Tm
.L08010AF4: .4byte gDispIo
    func_end func_08010A9C

    thumb_func_start func_08010AF8
func_08010AF8: @ 0x08010AF8
    push {r4, r5, r6, lr}
    adds r6, r0, #0
    adds r4, r1, #0
    adds r5, r2, #0
    adds r1, r3, #0
    lsls r4, r4, #0x18
    lsrs r4, r4, #0x18
    ldr r0, .L08010B20 @ =0x08B91F34
    bl SpawnProcLocking
    str r5, [r0, #0x2c]
    str r6, [r0, #0x34]
    movs r1, #0xff
    ands r1, r6
    str r1, [r0, #0x38]
    adds r0, #0x3c
    strb r4, [r0]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08010B20: .4byte 0x08B91F34
    func_end func_08010AF8

    thumb_func_start func_08010B24
func_08010B24: @ 0x08010B24
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    ldr r7, .L08010BD8 @ =gDispIo
    movs r6, #1
    ldrb r0, [r7, #1]
    orrs r0, r6
    movs r1, #2
    orrs r0, r1
    movs r1, #5
    rsbs r1, r1, #0
    ands r0, r1
    movs r1, #8
    orrs r0, r1
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r7, #1]
    adds r2, r7, #0
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    adds r0, r7, #0
    adds r0, #0x44
    movs r4, #0
    strb r4, [r0]
    adds r1, r7, #0
    adds r1, #0x45
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r7, #0
    adds r0, #0x46
    strb r4, [r0]
    ldr r0, .L08010BDC @ =0x0000FFE0
    ldrh r3, [r7, #0x3c]
    ands r0, r3
    movs r1, #4
    orrs r0, r1
    ldr r1, .L08010BE0 @ =0x0000E0FF
    ands r0, r1
    movs r3, #0xc0
    lsls r3, r3, #5
    adds r1, r3, #0
    orrs r0, r1
    strh r0, [r7, #0x3c]
    movs r0, #0x20
    ldrb r1, [r2]
    orrs r1, r0
    strb r1, [r2]
    adds r1, r7, #0
    adds r1, #0x3d
    ldrb r2, [r1]
    orrs r0, r2
    strb r0, [r1]
    movs r0, #2
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    movs r1, #4
    rsbs r1, r1, #0
    adds r0, r1, #0
    ldrb r3, [r7, #0xc]
    ands r0, r3
    strb r0, [r7, #0xc]
    adds r0, r1, #0
    ldrb r2, [r7, #0x10]
    ands r0, r2
    orrs r0, r6
    strb r0, [r7, #0x10]
    ldrb r3, [r7, #0x14]
    ands r1, r3
    strb r1, [r7, #0x14]
    movs r0, #3
    ldrb r1, [r7, #0x18]
    orrs r0, r1
    strb r0, [r7, #0x18]
    movs r0, #6
    str r0, [r5, #0x44]
    str r4, [r5, #0x30]
    ldr r0, .L08010BE4 @ =0x08B90D88
    bl Proc_Find
    str r0, [r5, #0x40]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08010BD8: .4byte gDispIo
.L08010BDC: .4byte 0x0000FFE0
.L08010BE0: .4byte 0x0000E0FF
.L08010BE4: .4byte 0x08B90D88
    func_end func_08010B24

    thumb_func_start func_08010BE8
func_08010BE8: @ 0x08010BE8
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    adds r0, #0x3c
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #0
    beq .L08010C4C
    ldr r4, .L08010C40 @ =gBackgroundTable
    ldr r1, [r5, #0x2c]
    lsls r0, r1, #1
    adds r0, r0, r1
    lsls r0, r0, #2
    adds r0, r0, r4
    ldr r0, [r0]
    ldr r1, .L08010C44 @ =0x06001000
    bl Decompress
    ldr r0, .L08010C48 @ =gBg2Tm
    ldr r2, [r5, #0x2c]
    lsls r1, r2, #1
    adds r1, r1, r2
    lsls r1, r1, #2
    adds r2, r4, #4
    adds r1, r1, r2
    ldr r1, [r1]
    movs r2, #0x80
    bl TmApplyTsa_thm
    ldr r1, [r5, #0x2c]
    lsls r0, r1, #1
    adds r0, r0, r1
    lsls r0, r0, #2
    adds r4, #8
    adds r0, r0, r4
    ldr r0, [r0]
    ldr r2, [r5, #0x44]
    lsls r2, r2, #5
    movs r1, #0
    bl ApplyPaletteExt
    b .L08010C5E
    .align 2, 0
.L08010C40: .4byte gBackgroundTable
.L08010C44: .4byte 0x06001000
.L08010C48: .4byte gBg2Tm
.L08010C4C:
    ldr r0, .L08010C8C @ =gBg2Tm
    movs r1, #0x80
    lsls r1, r1, #5
    ldr r3, [r5, #0x44]
    ldr r2, [r5, #0x2c]
    str r2, [sp]
    movs r2, #0
    bl PutCgBackground
.L08010C5E:
    movs r0, #4
    bl EnableBgSync
    bl EnablePalSync
    ldr r2, .L08010C90 @ =gDispIo
    movs r0, #1
    ldrb r1, [r2, #1]
    orrs r0, r1
    movs r1, #2
    orrs r0, r1
    movs r1, #4
    orrs r0, r1
    movs r1, #8
    orrs r0, r1
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r2, #1]
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08010C8C: .4byte gBg2Tm
.L08010C90: .4byte gDispIo
    func_end func_08010BE8

    thumb_func_start func_08010C94
func_08010C94: @ 0x08010C94
    push {r4, lr}
    adds r4, r0, #0
    ldr r2, [r4, #0x30]
    ldr r0, [r4, #0x38]
    adds r2, r2, r0
    str r2, [r4, #0x30]
    asrs r2, r2, #4
    ldr r0, .L08010CDC @ =gDispIo
    mov ip, r0
    mov r3, ip
    adds r3, #0x3c
    movs r0, #0x3f
    ldrb r1, [r3]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r3]
    mov r0, ip
    adds r0, #0x44
    movs r1, #0
    strb r2, [r0]
    movs r0, #0x10
    subs r0, r0, r2
    adds r3, #9
    strb r0, [r3]
    mov r0, ip
    adds r0, #0x46
    strb r1, [r0]
    cmp r2, #0x10
    bne .L08010CD6
    adds r0, r4, #0
    bl Proc_Break
.L08010CD6:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08010CDC: .4byte gDispIo
    func_end func_08010C94

    thumb_func_start func_08010CE0
func_08010CE0: @ 0x08010CE0
    push {r4, r5, lr}
    adds r4, r0, #0
    bl LockBmDisplay
    bl LockMus
    movs r0, #3
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    ldr r0, .L08010D40 @ =0x06001000
    ldr r1, .L08010D44 @ =0x06008000
    movs r2, #0xa0
    lsls r2, r2, #5
    bl CpuFastSet
    ldr r0, .L08010D48 @ =gPal
    movs r2, #0x80
    lsls r2, r2, #1
    adds r1, r0, r2
    ldr r2, [r4, #0x44]
    lsls r2, r2, #3
    ldr r3, .L08010D4C @ =0x001FFFFF
    ands r2, r3
    bl CpuFastSet
    movs r5, #0xff
    lsls r5, r5, #7
    adds r4, r5, #0
    ldr r3, .L08010D50 @ =gBg2Tm
    ldr r2, .L08010D54 @ =gBg3Tm
    movs r1, #0x80
    lsls r1, r1, #3
.L08010D24:
    ldrh r5, [r3]
    adds r0, r4, r5
    strh r0, [r2]
    adds r3, #2
    adds r2, #2
    subs r1, #1
    cmp r1, #0
    bne .L08010D24
    movs r0, #8
    bl EnableBgSync
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08010D40: .4byte 0x06001000
.L08010D44: .4byte 0x06008000
.L08010D48: .4byte gPal
.L08010D4C: .4byte 0x001FFFFF
.L08010D50: .4byte gBg2Tm
.L08010D54: .4byte gBg3Tm
    func_end func_08010CE0

    thumb_func_start func_08010D58
func_08010D58: @ 0x08010D58
    push {lr}
    ldr r0, .L08010D90 @ =gBg2Tm
    movs r1, #0
    bl TmFill
    movs r0, #4
    bl EnableBgSync
    ldr r3, .L08010D94 @ =gDispIo
    adds r1, r3, #0
    adds r1, #0x3c
    movs r0, #0x3f
    ldrb r2, [r1]
    ands r0, r2
    strb r0, [r1]
    adds r1, #8
    movs r2, #0
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x45
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    bl func_0801551C
    pop {r0}
    bx r0
    .align 2, 0
.L08010D90: .4byte gBg2Tm
.L08010D94: .4byte gDispIo
    func_end func_08010D58

    thumb_func_start func_08010D98
func_08010D98: @ 0x08010D98
    push {r4, r5, r6, lr}
    adds r6, r0, #0
    adds r4, r1, #0
    adds r5, r2, #0
    adds r1, r3, #0
    lsls r4, r4, #0x18
    lsrs r4, r4, #0x18
    ldr r0, .L08010DC0 @ =0x08B91F84
    bl SpawnProcLocking
    str r5, [r0, #0x2c]
    str r6, [r0, #0x34]
    movs r1, #0xff
    ands r1, r6
    str r1, [r0, #0x38]
    adds r0, #0x3c
    strb r4, [r0]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08010DC0: .4byte 0x08B91F84
    func_end func_08010D98

    thumb_func_start func_08010DC4
func_08010DC4: @ 0x08010DC4
    push {r4, lr}
    adds r3, r0, #0
    ldr r0, [r3, #0x30]
    ldr r2, [r0, #4]
    ldr r4, [r0, #8]
    adds r1, r3, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L08010DEE
    adds r0, r3, #0
    adds r0, #0x4c
    strb r2, [r0]
    adds r0, r4, #0
    movs r1, #1
    bl func_08010AF8
    movs r0, #2
    b .L08010DF0
.L08010DEE:
    movs r0, #0
.L08010DF0:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08010DC4

    thumb_func_start func_08010DF8
func_08010DF8: @ 0x08010DF8
    push {r4, r5, r6, lr}
    adds r3, r0, #0
    ldr r0, [r3, #0x30]
    ldr r6, [r0, #4]
    ldr r4, [r0, #8]
    adds r1, r3, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L08010E14
    movs r0, #0
    b .L08010E42
.L08010E14:
    adds r0, r3, #0
    adds r0, #0x4c
    movs r2, #0
    ldrsb r2, [r0, r2]
    movs r1, #1
    rsbs r1, r1, #0
    adds r5, r0, #0
    cmp r2, r1
    bne .L08010E32
    adds r0, r4, #0
    movs r1, #0
    adds r2, r6, #0
    bl func_08010D98
    b .L08010E3C
.L08010E32:
    adds r0, r4, #0
    movs r1, #0
    adds r2, r6, #0
    bl func_08010AF8
.L08010E3C:
    movs r0, #0x61
    strb r0, [r5]
    movs r0, #2
.L08010E42:
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end func_08010DF8

    thumb_func_start func_08010E48
func_08010E48: @ 0x08010E48
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    ldr r7, .L08010EFC @ =gDispIo
    movs r6, #1
    ldrb r0, [r7, #1]
    orrs r0, r6
    movs r1, #2
    orrs r0, r1
    movs r1, #5
    rsbs r1, r1, #0
    ands r0, r1
    movs r1, #8
    orrs r0, r1
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r7, #1]
    adds r2, r7, #0
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    adds r0, r7, #0
    adds r0, #0x44
    movs r4, #0
    strb r4, [r0]
    adds r1, r7, #0
    adds r1, #0x45
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r7, #0
    adds r0, #0x46
    strb r4, [r0]
    ldr r0, .L08010F00 @ =0x0000FFE0
    ldrh r3, [r7, #0x3c]
    ands r0, r3
    movs r1, #4
    orrs r0, r1
    ldr r1, .L08010F04 @ =0x0000E0FF
    ands r0, r1
    movs r3, #0xc0
    lsls r3, r3, #5
    adds r1, r3, #0
    orrs r0, r1
    strh r0, [r7, #0x3c]
    movs r0, #0x20
    ldrb r1, [r2]
    orrs r1, r0
    strb r1, [r2]
    adds r1, r7, #0
    adds r1, #0x3d
    ldrb r2, [r1]
    orrs r0, r2
    strb r0, [r1]
    movs r0, #2
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    movs r1, #4
    rsbs r1, r1, #0
    adds r0, r1, #0
    ldrb r3, [r7, #0xc]
    ands r0, r3
    strb r0, [r7, #0xc]
    adds r0, r1, #0
    ldrb r2, [r7, #0x10]
    ands r0, r2
    orrs r0, r6
    strb r0, [r7, #0x10]
    ldrb r3, [r7, #0x14]
    ands r1, r3
    strb r1, [r7, #0x14]
    movs r0, #3
    ldrb r1, [r7, #0x18]
    orrs r0, r1
    strb r0, [r7, #0x18]
    movs r0, #6
    str r0, [r5, #0x44]
    str r4, [r5, #0x30]
    ldr r0, .L08010F08 @ =0x08B90D88
    bl Proc_Find
    str r0, [r5, #0x40]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08010EFC: .4byte gDispIo
.L08010F00: .4byte 0x0000FFE0
.L08010F04: .4byte 0x0000E0FF
.L08010F08: .4byte 0x08B90D88
    func_end func_08010E48

    thumb_func_start func_08010F0C
func_08010F0C: @ 0x08010F0C
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, .L08010F98 @ =0x06008000
    ldr r1, .L08010F9C @ =0x06001000
    movs r2, #0xa0
    lsls r2, r2, #5
    bl CpuFastSet
    ldr r0, .L08010FA0 @ =0x02022960
    ldr r2, .L08010FA4 @ =0xFFFFFF00
    adds r1, r0, r2
    ldr r2, [r4, #0x44]
    lsls r2, r2, #3
    ldr r3, .L08010FA8 @ =0x001FFFFF
    ands r2, r3
    bl CpuFastSet
    ldr r5, .L08010FAC @ =0x00008080
    adds r3, r5, #0
    ldr r2, .L08010FB0 @ =gBg3Tm
    ldr r1, .L08010FB4 @ =gBg2Tm
    movs r4, #0x80
    lsls r4, r4, #3
.L08010F3A:
    ldrh r5, [r2]
    adds r0, r3, r5
    strh r0, [r1]
    adds r2, #2
    adds r1, #2
    subs r4, #1
    cmp r4, #0
    bne .L08010F3A
    movs r0, #4
    bl EnableBgSync
    bl EnablePalSync
    ldr r3, .L08010FB8 @ =gDispIo
    movs r0, #1
    ldrb r1, [r3, #1]
    orrs r0, r1
    movs r1, #2
    orrs r0, r1
    movs r1, #4
    orrs r0, r1
    movs r1, #8
    orrs r0, r1
    movs r1, #0x10
    orrs r0, r1
    strb r0, [r3, #1]
    adds r2, r3, #0
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r5, [r2]
    ands r0, r5
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    adds r1, r3, #0
    adds r1, #0x44
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x45
    strb r4, [r0]
    adds r0, #1
    strb r4, [r0]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08010F98: .4byte 0x06008000
.L08010F9C: .4byte 0x06001000
.L08010FA0: .4byte 0x02022960
.L08010FA4: .4byte 0xFFFFFF00
.L08010FA8: .4byte 0x001FFFFF
.L08010FAC: .4byte 0x00008080
.L08010FB0: .4byte gBg3Tm
.L08010FB4: .4byte gBg2Tm
.L08010FB8: .4byte gDispIo
    func_end func_08010F0C

    thumb_func_start func_08010FBC
func_08010FBC: @ 0x08010FBC
    push {r4, r5, lr}
    adds r5, r0, #0
    ldr r4, .L08011004 @ =gPlayStatus
    movs r0, #0xe
    ldrsb r0, [r4, r0]
    bl ApplyChapterMapGraphics
    ldrb r0, [r4, #0x15]
    bl AllocWeatherParticles
    bl RenderMap
    bl RefreshUnitSprites
    bl ApplyUnitSpritePalettes
    ldr r0, [r5, #0x34]
    movs r1, #0x80
    lsls r1, r1, #2
    ands r0, r1
    cmp r0, #0
    beq .L08010FEC
    bl func_08024CE0
.L08010FEC:
    bl ForceSyncUnitSpriteSheet
    bl UnlockBmDisplay
    bl ReleaseMus
    movs r0, #8
    bl EnableBgSync
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08011004: .4byte gPlayStatus
    func_end func_08010FBC

    thumb_func_start func_08011008
func_08011008: @ 0x08011008
    push {r4, lr}
    adds r4, r0, #0
    ldr r2, [r4, #0x30]
    ldr r0, [r4, #0x38]
    adds r2, r2, r0
    str r2, [r4, #0x30]
    asrs r2, r2, #4
    ldr r0, .L08011050 @ =gDispIo
    mov ip, r0
    mov r3, ip
    adds r3, #0x3c
    movs r0, #0x3f
    ldrb r1, [r3]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r3]
    movs r0, #0x10
    subs r0, r0, r2
    mov r1, ip
    adds r1, #0x44
    movs r3, #0
    strb r0, [r1]
    mov r0, ip
    adds r0, #0x45
    strb r2, [r0]
    adds r0, #1
    strb r3, [r0]
    cmp r2, #0x10
    bne .L0801104A
    adds r0, r4, #0
    bl Proc_Break
.L0801104A:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08011050: .4byte gDispIo
    func_end func_08011008

    thumb_func_start func_08011054
func_08011054: @ 0x08011054
    push {lr}
    ldr r0, .L08011094 @ =gBg2Tm
    movs r1, #0
    bl TmFill
    movs r0, #4
    bl EnableBgSync
    ldr r3, .L08011098 @ =gDispIo
    adds r1, r3, #0
    adds r1, #0x3c
    movs r0, #0x3f
    ldrb r2, [r1]
    ands r0, r2
    strb r0, [r1]
    adds r1, #8
    movs r2, #0
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x45
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    bl func_0801551C
    bl ApplySystemGraphics
    bl InitSystemTextFont
    pop {r0}
    bx r0
    .align 2, 0
.L08011094: .4byte gBg2Tm
.L08011098: .4byte gDispIo
    func_end func_08011054

    thumb_func_start func_0801109C
func_0801109C: @ 0x0801109C
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L080110B4 @ =0x08B91FDC
    bl SpawnProcLocking
    str r4, [r0, #0x34]
    movs r1, #0xff
    ands r1, r4
    str r1, [r0, #0x38]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L080110B4: .4byte 0x08B91FDC
    func_end func_0801109C

    thumb_func_start func_080110B8
func_080110B8: @ 0x080110B8
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    ldr r0, [r5, #0x30]
    ldr r2, [r0, #4]
    adds r1, r5, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    lsls r0, r0, #0x10
    lsrs r6, r0, #0x10
    cmp r6, #0
    beq .L080110F8
    adds r4, r5, #0
    adds r4, #0x4c
    ldrb r2, [r4]
    movs r1, #0
    ldrsb r1, [r4, r1]
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    beq .L080110F4
    movs r0, #0xff
    strb r0, [r4]
    bl func_0802E368
    bl UnlockBmDisplay
    bl ReleaseMus
.L080110F4:
    movs r0, #0
    b .L08011110
.L080110F8:
    adds r4, r5, #0
    adds r4, #0x4c
    adds r0, r2, #0
    adds r1, r5, #0
    bl func_0801109C
    movs r0, #0xff
    strb r0, [r4]
    adds r0, r5, #0
    adds r0, #0x4d
    strb r6, [r0]
    movs r0, #2
.L08011110:
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end func_080110B8

    thumb_func_start func_08011118
func_08011118: @ 0x08011118
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r6, r0, #0
    ldr r3, .L080111B4 @ =gDispIo
    adds r2, r3, #0
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    adds r0, r3, #0
    adds r0, #0x44
    movs r5, #0
    strb r5, [r0]
    adds r1, r3, #0
    adds r1, #0x45
    movs r0, #0x10
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x46
    strb r5, [r0]
    ldr r0, .L080111B8 @ =0x0000FFE0
    ldrh r2, [r3, #0x3c]
    ands r0, r2
    movs r1, #4
    orrs r0, r1
    ldr r1, .L080111BC @ =0x0000E0FF
    ands r0, r1
    movs r2, #0xc0
    lsls r2, r2, #5
    adds r1, r2, #0
    orrs r0, r1
    strh r0, [r3, #0x3c]
    ldr r0, .L080111C0 @ =0x0819D22C
    ldr r1, .L080111C4 @ =0x06001000
    bl Decompress
    ldr r4, .L080111C8 @ =0x0819D6E4
    movs r1, #0xf0
    lsls r1, r1, #1
    adds r0, r4, #0
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r0, .L080111CC @ =gBg2Tm
    ldr r1, .L080111D0 @ =0x0819D724
    ldr r2, .L080111D4 @ =0x0000F080
    bl func_080AACD8
    movs r0, #4
    bl EnableBgSync
    adds r1, r4, #0
    adds r1, #0x20
    movs r0, #1
    str r0, [sp]
    str r6, [sp, #4]
    adds r0, r4, #0
    movs r2, #0x20
    movs r3, #0xf
    bl func_080AA92C
    str r5, [r6, #0x30]
    movs r0, #0x20
    str r0, [r6, #0x34]
    str r5, [r6, #0x3c]
    str r5, [r6, #0x40]
    movs r0, #2
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    add sp, #8
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080111B4: .4byte gDispIo
.L080111B8: .4byte 0x0000FFE0
.L080111BC: .4byte 0x0000E0FF
.L080111C0: .4byte 0x0819D22C
.L080111C4: .4byte 0x06001000
.L080111C8: .4byte 0x0819D6E4
.L080111CC: .4byte gBg2Tm
.L080111D0: .4byte 0x0819D724
.L080111D4: .4byte 0x0000F080
    func_end func_08011118

    thumb_func_start func_080111D8
func_080111D8: @ 0x080111D8
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    adds r0, #1
    str r0, [r4, #0x30]
    asrs r5, r0, #1
    ldr r3, .L08011254 @ =gDispIo
    adds r2, r3, #0
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    adds r0, r3, #0
    adds r0, #0x44
    movs r2, #0
    strb r5, [r0]
    movs r0, #0x10
    subs r0, r0, r5
    cmp r0, #0xd
    bge .L08011208
    movs r0, #0xd
.L08011208:
    adds r1, r3, #0
    adds r1, #0x45
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x46
    strb r2, [r0]
    cmp r5, #0x10
    bne .L08011220
    str r2, [r4, #0x30]
    adds r0, r4, #0
    bl Proc_Break
.L08011220:
    ldr r3, [r4, #0x34]
    adds r3, #1
    str r3, [r4, #0x34]
    lsls r0, r3, #1
    adds r0, r0, r3
    ldr r1, [r4, #0x3c]
    adds r1, r1, r0
    str r1, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    adds r2, r2, r3
    str r2, [r4, #0x40]
    asrs r1, r1, #5
    rsbs r1, r1, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    asrs r2, r2, #5
    rsbs r2, r2, #0
    lsls r2, r2, #0x10
    lsrs r2, r2, #0x10
    movs r0, #2
    bl SetBgOffset
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08011254: .4byte gDispIo
    func_end func_080111D8

    thumb_func_start func_08011258
func_08011258: @ 0x08011258
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    adds r0, #1
    str r0, [r4, #0x30]
    ldr r1, [r4, #0x2c]
    cmp r0, r1
    blt .L08011272
    movs r0, #0
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl Proc_Break
.L08011272:
    ldr r3, [r4, #0x34]
    lsls r0, r3, #1
    adds r0, r0, r3
    ldr r1, [r4, #0x3c]
    adds r1, r1, r0
    str r1, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    adds r2, r2, r3
    str r2, [r4, #0x40]
    asrs r1, r1, #5
    rsbs r1, r1, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    asrs r2, r2, #5
    rsbs r2, r2, #0
    lsls r2, r2, #0x10
    lsrs r2, r2, #0x10
    movs r0, #2
    bl SetBgOffset
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08011258

    thumb_func_start func_080112A0
func_080112A0: @ 0x080112A0
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    adds r0, #1
    str r0, [r4, #0x30]
    asrs r5, r0, #3
    ldr r3, .L08011318 @ =gDispIo
    adds r2, r3, #0
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    movs r0, #0x10
    subs r0, r0, r5
    adds r1, r3, #0
    adds r1, #0x44
    strb r0, [r1]
    adds r0, r5, #0
    adds r0, #0xd
    cmp r0, #0x10
    ble .L080112D2
    movs r0, #0x10
.L080112D2:
    adds r1, r3, #0
    adds r1, #0x45
    strb r0, [r1]
    adds r1, #1
    movs r0, #0
    strb r0, [r1]
    ldr r3, [r4, #0x34]
    lsls r0, r3, #1
    adds r0, r0, r3
    ldr r1, [r4, #0x3c]
    adds r1, r1, r0
    str r1, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    adds r2, r2, r3
    str r2, [r4, #0x40]
    asrs r1, r1, #5
    rsbs r1, r1, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    asrs r2, r2, #5
    rsbs r2, r2, #0
    lsls r2, r2, #0x10
    lsrs r2, r2, #0x10
    movs r0, #2
    bl SetBgOffset
    cmp r5, #0x10
    bne .L08011310
    adds r0, r4, #0
    bl Proc_Break
.L08011310:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08011318: .4byte gDispIo
    func_end func_080112A0

    thumb_func_start func_0801131C
func_0801131C: @ 0x0801131C
    push {lr}
    ldr r0, .L08011354 @ =gBg2Tm
    movs r1, #0
    bl TmFill
    movs r0, #4
    bl EnableBgSync
    ldr r2, .L08011358 @ =gDispIo
    adds r1, r2, #0
    adds r1, #0x3c
    movs r0, #0x3f
    ldrb r3, [r1]
    ands r0, r3
    strb r0, [r1]
    adds r0, r2, #0
    adds r0, #0x44
    movs r1, #0
    strb r1, [r0]
    adds r3, r2, #0
    adds r3, #0x45
    movs r0, #0x10
    strb r0, [r3]
    adds r0, r2, #0
    adds r0, #0x46
    strb r1, [r0]
    pop {r0}
    bx r0
    .align 2, 0
.L08011354: .4byte gBg2Tm
.L08011358: .4byte gDispIo
    func_end func_0801131C

    thumb_func_start func_0801135C
func_0801135C: @ 0x0801135C
    push {r4, lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r4, [r0, #4]
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    bne .L08011384
    ldr r0, .L08011380 @ =0x08B92034
    bl SpawnProcLocking
    str r4, [r0, #0x2c]
    movs r0, #2
    b .L08011386
    .align 2, 0
.L08011380: .4byte 0x08B92034
.L08011384:
    movs r0, #0
.L08011386:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_0801135C

    thumb_func_start func_0801138C
func_0801138C: @ 0x0801138C
    push {r4, r5, lr}
    sub sp, #0x14
    ldr r5, .L08011420 @ =gDispIo
    movs r2, #4
    rsbs r2, r2, #0
    adds r1, r2, #0
    ldrb r3, [r5, #0xc]
    ands r1, r3
    strb r1, [r5, #0xc]
    adds r1, r2, #0
    ldrb r3, [r5, #0x10]
    ands r1, r3
    movs r3, #1
    orrs r1, r3
    strb r1, [r5, #0x10]
    ldrb r1, [r5, #0x14]
    ands r2, r1
    strb r2, [r5, #0x14]
    movs r1, #3
    ldrb r2, [r5, #0x18]
    orrs r1, r2
    strb r1, [r5, #0x18]
    adds r3, r5, #0
    adds r3, #0x3c
    movs r1, #0x3f
    ldrb r2, [r3]
    ands r1, r2
    movs r2, #0x40
    orrs r1, r2
    strb r1, [r3]
    adds r2, r5, #0
    adds r2, #0x44
    movs r4, #0
    movs r1, #0x10
    strb r1, [r2]
    adds r2, #1
    strb r1, [r2]
    adds r1, r5, #0
    adds r1, #0x46
    strb r4, [r1]
    ldr r1, .L08011424 @ =0x0000FFE0
    ldrh r3, [r5, #0x3c]
    ands r1, r3
    movs r2, #4
    orrs r1, r2
    ldr r2, .L08011428 @ =0x0000E0FF
    ands r1, r2
    movs r3, #0xc0
    lsls r3, r3, #5
    adds r2, r3, #0
    orrs r1, r2
    strh r1, [r5, #0x3c]
    str r4, [r0, #0x30]
    ldr r5, .L0801142C @ =0x08B92074
    ldr r2, [r0, #0x3c]
    adds r2, #0x54
    ldr r3, [r0, #0x40]
    str r4, [sp]
    movs r1, #0x80
    lsls r1, r1, #6
    str r1, [sp, #4]
    movs r1, #0xf
    str r1, [sp, #8]
    str r4, [sp, #0xc]
    str r0, [sp, #0x10]
    adds r0, r5, #0
    movs r1, #2
    bl func_080AA78C
    add sp, #0x14
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08011420: .4byte gDispIo
.L08011424: .4byte 0x0000FFE0
.L08011428: .4byte 0x0000E0FF
.L0801142C: .4byte 0x08B92074
    func_end func_0801138C

    thumb_func_start func_08011430
func_08011430: @ 0x08011430
    push {lr}
    ldr r2, .L08011460 @ =gDispIo
    adds r1, r2, #0
    adds r1, #0x3c
    movs r0, #0x3f
    ldrb r3, [r1]
    ands r0, r3
    strb r0, [r1]
    adds r0, r2, #0
    adds r0, #0x44
    movs r1, #0
    strb r1, [r0]
    adds r3, r2, #0
    adds r3, #0x45
    movs r0, #0x10
    strb r0, [r3]
    adds r0, r2, #0
    adds r0, #0x46
    strb r1, [r0]
    bl func_0801551C
    pop {r0}
    bx r0
    .align 2, 0
.L08011460: .4byte gDispIo
    func_end func_08011430

    thumb_func_start func_08011464
func_08011464: @ 0x08011464
    push {r4, r5, lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r4, [r0, #4]
    ldr r5, [r0, #8]
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    bne .L08011490
    ldr r0, .L0801148C @ =0x08B92140
    bl SpawnProcLocking
    str r4, [r0, #0x3c]
    str r5, [r0, #0x40]
    movs r0, #2
    b .L08011492
    .align 2, 0
.L0801148C: .4byte 0x08B92140
.L08011490:
    movs r0, #0
.L08011492:
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_08011464

    thumb_func_start func_08011498
func_08011498: @ 0x08011498
    push {lr}
    ldr r0, .L080114A8 @ =0x08B92140
    bl Proc_Find
    cmp r0, #0
    bne .L080114AC
    movs r0, #0
    b .L080114AE
    .align 2, 0
.L080114A8: .4byte 0x08B92140
.L080114AC:
    movs r0, #1
.L080114AE:
    pop {r1}
    bx r1
    func_end func_08011498

    thumb_func_start func_080114B4
func_080114B4: @ 0x080114B4
    push {r4, lr}
    movs r3, #0
    str r3, [r0, #0x30]
    ldr r0, .L08011530 @ =gDispIo
    mov ip, r0
    movs r1, #4
    rsbs r1, r1, #0
    adds r0, r1, #0
    mov r2, ip
    ldrb r2, [r2, #0xc]
    ands r0, r2
    mov r4, ip
    strb r0, [r4, #0xc]
    adds r0, r1, #0
    ldrb r2, [r4, #0x10]
    ands r0, r2
    movs r2, #1
    orrs r0, r2
    strb r0, [r4, #0x10]
    ldrb r4, [r4, #0x14]
    ands r1, r4
    mov r0, ip
    strb r1, [r0, #0x14]
    movs r0, #3
    mov r1, ip
    ldrb r1, [r1, #0x18]
    orrs r0, r1
    mov r2, ip
    strb r0, [r2, #0x18]
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r4, [r2]
    ands r0, r4
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    mov r0, ip
    adds r0, #0x44
    movs r1, #0x10
    strb r1, [r0]
    adds r0, #1
    strb r1, [r0]
    adds r0, #1
    strb r3, [r0]
    ldr r0, .L08011534 @ =0x0000FFE0
    mov r1, ip
    ldrh r1, [r1, #0x3c]
    ands r0, r1
    movs r1, #4
    orrs r0, r1
    ldr r1, .L08011538 @ =0x0000E0FF
    ands r0, r1
    movs r2, #0xc0
    lsls r2, r2, #5
    adds r1, r2, #0
    orrs r0, r1
    mov r4, ip
    strh r0, [r4, #0x3c]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08011530: .4byte gDispIo
.L08011534: .4byte 0x0000FFE0
.L08011538: .4byte 0x0000E0FF
    func_end func_080114B4

    thumb_func_start func_0801153C
func_0801153C: @ 0x0801153C
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    adds r0, #1
    str r0, [r4, #0x30]
    movs r2, #0x80
    lsls r2, r2, #1
    subs r2, r2, r0
    ldr r3, .L0801156C @ =0xFFFFBFFF
    adds r0, r2, #0
    adds r1, r2, #0
    bl func_08013728
    ldr r0, [r4, #0x30]
    cmp r0, #0x40
    bne .L08011566
    movs r0, #0
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl Proc_Break
.L08011566:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0801156C: .4byte 0xFFFFBFFF
    func_end func_0801153C

    thumb_func_start func_08011570
func_08011570: @ 0x08011570
    push {r4, lr}
    adds r4, r0, #0
    ldr r2, [r4, #0x30]
    adds r0, r2, #1
    str r0, [r4, #0x30]
    adds r2, #0xc1
    ldr r3, .L0801159C @ =0xFFFFBFFF
    adds r0, r2, #0
    adds r1, r2, #0
    bl func_08013728
    ldr r0, [r4, #0x30]
    cmp r0, #0x40
    bne .L08011596
    movs r0, #0
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl Proc_Break
.L08011596:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0801159C: .4byte 0xFFFFBFFF
    func_end func_08011570

    thumb_func_start func_080115A0
func_080115A0: @ 0x080115A0
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    adds r0, #1
    str r0, [r4, #0x30]
    movs r1, #0xfa
    lsls r1, r1, #2
    cmp r0, r1
    bne .L080115BE
    movs r0, #0
    bl func_080AA76C
    adds r0, r4, #0
    bl Proc_Break
.L080115BE:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_080115A0

    thumb_func_start func_080115C4
func_080115C4: @ 0x080115C4
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r6, r0, #0
    ldr r0, .L08011610 @ =0x081AA680
    ldr r1, .L08011614 @ =0x06010800
    bl Decompress
    ldr r0, .L08011618 @ =0x081AA898
    movs r1, #0xa8
    lsls r1, r1, #2
    movs r2, #0x20
    bl ApplyPaletteExt
    movs r4, #0
.L080115E0:
    movs r5, #0
    str r5, [sp]
    movs r0, #4
    str r0, [sp, #4]
    ldr r0, .L0801161C @ =0x081AA8B8
    movs r1, #0xc0
    lsls r1, r1, #1
    movs r2, #0
    ldr r3, .L08011620 @ =0x00005040
    bl func_0801245C
    lsls r2, r4, #2
    adds r1, r6, #0
    adds r1, #0x44
    adds r1, r1, r2
    str r0, [r1]
    adds r4, #1
    cmp r4, #7
    ble .L080115E0
    str r5, [r6, #0x30]
    add sp, #8
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08011610: .4byte 0x081AA680
.L08011614: .4byte 0x06010800
.L08011618: .4byte 0x081AA898
.L0801161C: .4byte 0x081AA8B8
.L08011620: .4byte 0x00005040
    func_end func_080115C4

    thumb_func_start func_08011624
func_08011624: @ 0x08011624
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0xc
    adds r6, r0, #0
    ldr r4, [r6, #0x30]
    adds r4, #1
    str r4, [r6, #0x30]
    ldr r0, [r6, #0x3c]
    lsls r0, r0, #4
    ldr r2, .L0801172C @ =gBmStatus
    movs r3, #0xc
    ldrsh r1, [r2, r3]
    subs r0, r0, r1
    adds r0, #8
    str r0, [sp, #8]
    ldr r0, .L08011730 @ =0x000001FF
    ldr r1, [sp, #8]
    ands r1, r0
    str r1, [sp, #8]
    ldr r0, [r6, #0x40]
    lsls r0, r0, #4
    movs r3, #0xe
    ldrsh r1, [r2, r3]
    subs r0, r0, r1
    adds r0, #8
    mov sl, r0
    movs r0, #0xff
    mov r1, sl
    ands r1, r0
    mov sl, r1
    movs r2, #0xa0
    subs r4, r2, r4
    lsls r0, r4, #4
    subs r0, r0, r4
    lsls r0, r0, #3
    muls r0, r4, r0
    movs r5, #0xc8
    lsls r5, r5, #7
    adds r1, r5, #0
    bl __divsi3
    adds r7, r0, #0
    lsls r0, r4, #8
    muls r0, r4, r0
    adds r1, r5, #0
    bl __divsi3
    movs r1, #0x88
    lsls r1, r1, #1
    movs r5, #0
    ldr r3, .L08011734 @ =0x080C5A48
    mov sb, r3
    movs r2, #0xff
    mov r8, r2
    subs r4, r1, r0
.L08011698:
    adds r2, r4, #0
    mov r3, r8
    ands r2, r3
    adds r0, r2, #0
    adds r0, #0x40
    lsls r0, r0, #1
    add r0, sb
    movs r1, #0
    ldrsh r0, [r0, r1]
    muls r0, r7, r0
    asrs r0, r0, #0xc
    movs r1, #0x78
    subs r1, r1, r0
    lsls r2, r2, #1
    add r2, sb
    movs r3, #0
    ldrsh r0, [r2, r3]
    muls r0, r7, r0
    asrs r0, r0, #0xc
    movs r2, #0x50
    subs r2, r2, r0
    lsls r3, r5, #2
    adds r0, r6, #0
    adds r0, #0x44
    adds r0, r0, r3
    ldr r0, [r0]
    ldr r3, .L08011730 @ =0x000001FF
    ands r1, r3
    mov r3, r8
    ands r2, r3
    movs r3, #0x80
    lsls r3, r3, #3
    adds r2, r2, r3
    movs r3, #1
    rsbs r3, r3, #0
    bl func_080124DC
    adds r4, #0x20
    adds r5, #1
    cmp r5, #7
    ble .L08011698
    movs r0, #0xa0
    movs r1, #3
    bl __divsi3
    ldr r1, [r6, #0x30]
    cmp r1, r0
    bne .L08011710
    ldr r0, .L08011738 @ =0x081AA8B8
    movs r2, #0x80
    lsls r2, r2, #3
    add r2, sl
    ldr r3, .L0801173C @ =0x00005040
    movs r1, #1
    str r1, [sp]
    movs r1, #4
    str r1, [sp, #4]
    ldr r1, [sp, #8]
    bl func_0801245C
.L08011710:
    ldr r0, [r6, #0x30]
    cmp r0, #0xa0
    bne .L0801171C
    adds r0, r6, #0
    bl Proc_Break
.L0801171C:
    add sp, #0xc
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0801172C: .4byte gBmStatus
.L08011730: .4byte 0x000001FF
.L08011734: .4byte 0x080C5A48
.L08011738: .4byte 0x081AA8B8
.L0801173C: .4byte 0x00005040
    func_end func_08011624

    thumb_func_start func_08011740
func_08011740: @ 0x08011740
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r5, #0x44
    movs r4, #7
.L08011748:
    ldm r5!, {r0}
    bl func_080124F8
    subs r4, #1
    cmp r4, #0
    bge .L08011748
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08011740

    thumb_func_start func_0801175C
func_0801175C: @ 0x0801175C
    push {r4, r5, r6, lr}
    sub sp, #0x14
    adds r5, r0, #0
    ldr r2, [r5, #0x3c]
    lsls r2, r2, #4
    ldr r4, .L080117A8 @ =gBmStatus
    movs r1, #0xc
    ldrsh r0, [r4, r1]
    subs r2, r2, r0
    subs r2, #0x28
    movs r1, #0xff
    ands r2, r1
    ldr r3, [r5, #0x40]
    lsls r3, r3, #4
    movs r6, #0xe
    ldrsh r0, [r4, r6]
    subs r3, r3, r0
    subs r3, #0x28
    ands r3, r1
    ldr r0, .L080117AC @ =0x08B92168
    movs r4, #0
    str r4, [sp]
    movs r1, #0x80
    lsls r1, r1, #6
    str r1, [sp, #4]
    movs r1, #0xf
    str r1, [sp, #8]
    str r4, [sp, #0xc]
    str r5, [sp, #0x10]
    movs r1, #2
    bl func_080AA78C
    str r4, [r5, #0x30]
    add sp, #0x14
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080117A8: .4byte gBmStatus
.L080117AC: .4byte 0x08B92168
    func_end func_0801175C

    thumb_func_start func_080117B0
func_080117B0: @ 0x080117B0
    push {r4, r5, lr}
    sub sp, #0x10
    adds r4, r0, #0
    ldr r0, [r4, #0x30]
    adds r0, #1
    str r0, [r4, #0x30]
    movs r5, #0
    cmp r0, #0x14
    bne .L080117D8
    ldr r2, [r4, #0x3c]
    ldr r3, [r4, #0x40]
    str r2, [sp]
    str r3, [sp, #4]
    movs r0, #1
    str r0, [sp, #8]
    str r5, [sp, #0xc]
    movs r0, #0xdc
    movs r1, #0x40
    bl func_08011D34
.L080117D8:
    ldr r0, [r4, #0x30]
    cmp r0, #0x28
    bne .L080117EC
    str r5, [r4, #0x30]
    movs r0, #0
    bl func_080AA76C
    adds r0, r4, #0
    bl Proc_Break
.L080117EC:
    add sp, #0x10
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_080117B0

    thumb_func_start func_080117F4
func_080117F4: @ 0x080117F4
    push {lr}
    ldr r2, .L08011824 @ =gDispIo
    adds r1, r2, #0
    adds r1, #0x3c
    movs r0, #0x3f
    ldrb r3, [r1]
    ands r0, r3
    strb r0, [r1]
    adds r0, r2, #0
    adds r0, #0x44
    movs r1, #0
    strb r1, [r0]
    adds r3, r2, #0
    adds r3, #0x45
    movs r0, #0x10
    strb r0, [r3]
    adds r0, r2, #0
    adds r0, #0x46
    strb r1, [r0]
    bl func_0801551C
    pop {r0}
    bx r0
    .align 2, 0
.L08011824: .4byte gDispIo
    func_end func_080117F4

    thumb_func_start func_08011828
func_08011828: @ 0x08011828
    push {r4, r5, lr}
    sub sp, #0x10
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r4, [r0, #4]
    ldr r5, [r0, #8]
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    bne .L08011854
    ldr r0, .L08011850 @ =0x08B92354
    bl SpawnProcLocking
    str r4, [r0, #0x3c]
    str r5, [r0, #0x40]
    movs r0, #2
    b .L0801186E
    .align 2, 0
.L08011850: .4byte 0x08B92354
.L08011854:
    str r4, [sp]
    str r5, [sp, #4]
    movs r0, #1
    str r0, [sp, #8]
    movs r0, #0
    str r0, [sp, #0xc]
    movs r0, #0xdc
    movs r1, #0x54
    adds r2, r4, #0
    adds r3, r5, #0
    bl func_08011D34
    movs r0, #0
.L0801186E:
    add sp, #0x10
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_08011828

    thumb_func_start func_08011878
func_08011878: @ 0x08011878
    push {lr}
    movs r1, #0
    str r1, [r0, #0x3c]
    bl func_080136AC
    pop {r0}
    bx r0
    func_end func_08011878

    thumb_func_start func_08011888
func_08011888: @ 0x08011888
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r1, [r4, #0x3c]
    ldr r0, [r4, #0x34]
    adds r2, r1, r0
    str r2, [r4, #0x3c]
    cmp r2, #0xff
    bgt .L080118C4
    movs r0, #0x80
    lsls r0, r0, #1
    subs r0, r0, r2
    lsls r3, r0, #8
    ldr r0, [r4, #0x40]
    muls r0, r2, r0
    adds r0, r3, r0
    cmp r0, #0
    bge .L080118AC
    adds r0, #0xff
.L080118AC:
    asrs r5, r0, #8
    ldr r0, [r4, #0x48]
    muls r0, r2, r0
    adds r1, r3, r0
    cmp r1, #0
    bge .L080118BA
    adds r1, #0xff
.L080118BA:
    asrs r1, r1, #8
    ldr r0, [r4, #0x44]
    muls r0, r2, r0
    adds r0, r3, r0
    b .L080118F4
.L080118C4:
    movs r0, #0x80
    lsls r0, r0, #2
    subs r3, r0, r2
    ldr r0, [r4, #0x40]
    adds r1, r0, #0
    muls r1, r3, r1
    ldr r5, .L08011924 @ =0xFFFFFF00
    adds r0, r2, r5
    lsls r2, r0, #8
    adds r0, r1, r2
    cmp r0, #0
    bge .L080118DE
    adds r0, #0xff
.L080118DE:
    asrs r5, r0, #8
    ldr r0, [r4, #0x48]
    muls r0, r3, r0
    adds r0, r0, r2
    cmp r0, #0
    bge .L080118EC
    adds r0, #0xff
.L080118EC:
    asrs r1, r0, #8
    ldr r0, [r4, #0x44]
    muls r0, r3, r0
    adds r0, r0, r2
.L080118F4:
    cmp r0, #0
    bge .L080118FA
    adds r0, #0xff
.L080118FA:
    asrs r2, r0, #8
    ldr r3, [r4, #0x30]
    adds r0, r5, #0
    bl func_08013728
    ldr r1, [r4, #0x3c]
    movs r0, #0x80
    lsls r0, r0, #1
    cmp r1, r0
    bne .L08011928
    ldr r0, [r4, #0x2c]
    subs r0, #1
    str r0, [r4, #0x2c]
    cmp r0, #0
    bgt .L08011934
    movs r0, #0
    str r0, [r4, #0x3c]
    adds r0, r4, #0
    bl Proc_Break
    b .L08011934
    .align 2, 0
.L08011924: .4byte 0xFFFFFF00
.L08011928:
    movs r0, #0x80
    lsls r0, r0, #2
    cmp r1, r0
    bne .L08011934
    movs r0, #0
    str r0, [r4, #0x3c]
.L08011934:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08011888

    thumb_func_start func_0801193C
func_0801193C: @ 0x0801193C
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    ldr r1, [r4, #0x3c]
    ldr r0, [r4, #0x38]
    adds r1, r1, r0
    str r1, [r4, #0x3c]
    movs r7, #0x80
    lsls r7, r7, #1
    subs r2, r7, r1
    ldr r0, [r4, #0x40]
    muls r0, r2, r0
    lsls r1, r1, #8
    adds r0, r0, r1
    cmp r0, #0
    bge .L0801195C
    adds r0, #0xff
.L0801195C:
    asrs r6, r0, #8
    ldr r0, [r4, #0x48]
    muls r0, r2, r0
    adds r0, r0, r1
    cmp r0, #0
    bge .L0801196A
    adds r0, #0xff
.L0801196A:
    asrs r5, r0, #8
    ldr r0, [r4, #0x44]
    muls r0, r2, r0
    adds r0, r0, r1
    cmp r0, #0
    bge .L08011978
    adds r0, #0xff
.L08011978:
    asrs r2, r0, #8
    ldr r3, [r4, #0x30]
    adds r0, r6, #0
    adds r1, r5, #0
    bl func_08013728
    ldr r0, [r4, #0x3c]
    cmp r0, r7
    bne .L08011990
    adds r0, r4, #0
    bl Proc_Break
.L08011990:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_0801193C

    thumb_func_start func_08011998
func_08011998: @ 0x08011998
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    mov r8, r0
    adds r4, r1, #0
    adds r5, r2, #0
    adds r6, r3, #0
    ldr r7, [sp, #0x18]
    ldr r1, [sp, #0x24]
    ldr r0, .L080119D0 @ =0x08B923A4
    bl SpawnProcLocking
    str r4, [r0, #0x2c]
    mov r1, r8
    str r1, [r0, #0x30]
    str r5, [r0, #0x34]
    str r6, [r0, #0x38]
    str r7, [r0, #0x40]
    ldr r1, [sp, #0x1c]
    str r1, [r0, #0x48]
    ldr r1, [sp, #0x20]
    str r1, [r0, #0x44]
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080119D0: .4byte 0x08B923A4
    func_end func_08011998

    thumb_func_start func_080119D4
func_080119D4: @ 0x080119D4
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #0x10
    adds r7, r0, #0
    ldr r0, [r7, #0x30]
    ldr r1, [r0, #4]
    mov ip, r1
    ldr r1, [r0, #8]
    mov r8, r1
    ldr r1, [r0, #0xc]
    movs r2, #0xff
    adds r6, r1, #0
    ands r6, r2
    lsrs r5, r1, #0x10
    ands r5, r2
    ldr r0, [r0, #0x10]
    ldr r1, .L08011A2C @ =0x000003FF
    adds r4, r0, #0
    ands r4, r1
    lsrs r3, r0, #0xa
    ands r3, r1
    lsrs r2, r0, #0x14
    ands r2, r1
    adds r1, r7, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L08011A30
    str r4, [sp]
    str r3, [sp, #4]
    str r2, [sp, #8]
    str r7, [sp, #0xc]
    mov r0, ip
    mov r1, r8
    adds r2, r6, #0
    adds r3, r5, #0
    bl func_08011998
    movs r0, #2
    b .L08011A32
    .align 2, 0
.L08011A2C: .4byte 0x000003FF
.L08011A30:
    movs r0, #0
.L08011A32:
    add sp, #0x10
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_080119D4

    thumb_func_start func_08011A40
func_08011A40: @ 0x08011A40
    movs r1, #0
    str r1, [r0, #0x38]
    bx lr
    func_end func_08011A40

    thumb_func_start func_08011A48
func_08011A48: @ 0x08011A48
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x38]
    ldr r1, [r4, #0x34]
    adds r0, r0, r1
    str r0, [r4, #0x38]
    cmp r0, #0xff
    ble .L08011A64
    adds r0, r4, #0
    bl Proc_Break
    movs r0, #0x80
    lsls r0, r0, #1
    str r0, [r4, #0x38]
.L08011A64:
    ldr r2, [r4, #0x38]
    movs r0, #0x80
    lsls r0, r0, #1
    subs r3, r0, r2
    ldr r0, [r4, #0x3c]
    adds r1, r0, #0
    muls r1, r3, r1
    ldr r0, [r4, #0x48]
    muls r0, r2, r0
    adds r0, r1, r0
    cmp r0, #0
    bge .L08011A7E
    adds r0, #0xff
.L08011A7E:
    asrs r6, r0, #8
    ldr r0, [r4, #0x40]
    adds r1, r0, #0
    muls r1, r3, r1
    ldr r0, [r4, #0x4c]
    muls r0, r2, r0
    adds r1, r1, r0
    cmp r1, #0
    bge .L08011A92
    adds r1, #0xff
.L08011A92:
    asrs r5, r1, #8
    ldr r0, [r4, #0x44]
    adds r1, r0, #0
    muls r1, r3, r1
    ldr r0, [r4, #0x50]
    muls r0, r2, r0
    adds r0, r1, r0
    cmp r0, #0
    bge .L08011AA6
    adds r0, #0xff
.L08011AA6:
    asrs r2, r0, #8
    ldr r3, [r4, #0x30]
    adds r0, r6, #0
    adds r1, r5, #0
    bl func_08013728
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08011A48

    thumb_func_start func_08011AB8
func_08011AB8: @ 0x08011AB8
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    mov r8, r0
    adds r4, r1, #0
    adds r6, r2, #0
    adds r7, r3, #0
    ldr r1, [sp, #0x1c]
    ldr r0, .L08011B08 @ =0x08B923CC
    bl SpawnProcLocking
    adds r5, r0, #0
    movs r0, #0xff
    ands r0, r4
    cmp r0, #0x80
    bne .L08011ADC
    movs r0, #0x80
    lsls r0, r0, #1
.L08011ADC:
    str r0, [r5, #0x34]
    bl func_08013664
    str r0, [r5, #0x3c]
    bl func_08013670
    str r0, [r5, #0x40]
    bl func_08013680
    str r0, [r5, #0x44]
    mov r0, r8
    str r0, [r5, #0x30]
    str r6, [r5, #0x48]
    str r7, [r5, #0x4c]
    ldr r0, [sp, #0x18]
    str r0, [r5, #0x50]
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08011B08: .4byte 0x08B923CC
    func_end func_08011AB8

    thumb_func_start func_08011B0C
func_08011B0C: @ 0x08011B0C
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r5, r0, #0
    ldr r0, [r5, #0x30]
    ldr r6, [r0, #4]
    ldr r7, [r0, #8]
    ldr r0, [r0, #0xc]
    ldr r1, .L08011B48 @ =0x000003FF
    adds r4, r0, #0
    ands r4, r1
    lsrs r3, r0, #0xa
    ands r3, r1
    lsrs r2, r0, #0x14
    ands r2, r1
    adds r1, r5, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L08011B4C
    str r2, [sp]
    str r5, [sp, #4]
    adds r0, r6, #0
    adds r1, r7, #0
    adds r2, r4, #0
    bl func_08011AB8
    movs r0, #2
    b .L08011B4E
    .align 2, 0
.L08011B48: .4byte 0x000003FF
.L08011B4C:
    movs r0, #0
.L08011B4E:
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_08011B0C

    thumb_func_start func_08011B58
func_08011B58: @ 0x08011B58
    push {lr}
    bl func_080136AC
    movs r0, #2
    pop {r1}
    bx r1
    func_end func_08011B58

    thumb_func_start func_08011B64
func_08011B64: @ 0x08011B64
    push {lr}
    movs r2, #0x80
    lsls r2, r2, #1
    movs r3, #1
    rsbs r3, r3, #0
    adds r0, r2, #0
    adds r1, r2, #0
    bl func_08013728
    movs r0, #2
    pop {r1}
    bx r1
    func_end func_08011B64

    thumb_func_start func_08011B7C
func_08011B7C: @ 0x08011B7C
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    sub sp, #0x18
    mov r8, r0
    ldr r1, .L08011BDC @ =gBmStatus
    movs r2, #0xc
    ldrsh r0, [r1, r2]
    mov r5, r8
    ldr r3, [r5, #0x2c]
    subs r3, r3, r0
    adds r3, #8
    movs r2, #0xe
    ldrsh r0, [r1, r2]
    ldr r4, [r5, #0x30]
    subs r4, r4, r0
    adds r4, #8
    ldr r6, [r5, #0x38]
    ldr r0, [r6, #4]
    ldr r1, [r6]
    ldr r2, [r6, #8]
    ldr r5, .L08011BE0 @ =0x000001FF
    ands r3, r5
    movs r5, #0xff
    ands r4, r5
    ldrh r5, [r6, #0xc]
    adds r4, r5, r4
    str r4, [sp]
    movs r4, #0
    str r4, [sp, #4]
    ldrb r4, [r6, #0x10]
    str r4, [sp, #8]
    ldrb r4, [r6, #0x11]
    str r4, [sp, #0xc]
    ldrh r4, [r6, #0xe]
    str r4, [sp, #0x10]
    movs r4, #4
    str r4, [sp, #0x14]
    bl func_080AA978
    mov r1, r8
    str r0, [r1, #0x34]
    add sp, #0x18
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08011BDC: .4byte gBmStatus
.L08011BE0: .4byte 0x000001FF
    func_end func_08011B7C

    thumb_func_start func_08011BE4
func_08011BE4: @ 0x08011BE4
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    ldr r6, [r4, #0x34]
    ldr r5, [r6]
    cmp r5, #0
    beq .L08011C24
    ldr r2, .L08011C1C @ =gBmStatus
    movs r1, #0xc
    ldrsh r0, [r2, r1]
    ldr r1, [r4, #0x2c]
    subs r1, r1, r0
    adds r1, #8
    movs r3, #0xe
    ldrsh r0, [r2, r3]
    ldr r2, [r4, #0x30]
    subs r2, r2, r0
    adds r2, #8
    ldr r0, .L08011C20 @ =0x000001FF
    ands r1, r0
    movs r0, #0xff
    ands r2, r0
    movs r3, #1
    rsbs r3, r3, #0
    adds r0, r6, #0
    bl func_080124DC
    b .L08011C2C
    .align 2, 0
.L08011C1C: .4byte gBmStatus
.L08011C20: .4byte 0x000001FF
.L08011C24:
    adds r0, r4, #0
    bl Proc_Break
    str r5, [r4, #0x34]
.L08011C2C:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08011BE4

    thumb_func_start func_08011C34
func_08011C34: @ 0x08011C34
    push {lr}
    ldr r0, [r0, #0x34]
    cmp r0, #0
    beq .L08011C40
    bl func_080124F8
.L08011C40:
    pop {r0}
    bx r0
    func_end func_08011C34

    thumb_func_start func_08011C44
func_08011C44: @ 0x08011C44
    push {r4, r5, r6, lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    ldr r6, [r0, #4]
    ldr r2, [r0, #8]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    cmp r0, #0
    bne .L08011C64
    ldr r4, .L08011C60 @ =0x0000FFFF
    ands r4, r2
    b .L08011C68
    .align 2, 0
.L08011C60: .4byte 0x0000FFFF
.L08011C64:
    movs r4, #1
    rsbs r4, r4, #0
.L08011C68:
    ldr r0, [r1, #0x30]
    ldrh r2, [r0, #0xa]
    movs r0, #0x80
    lsls r0, r0, #8
    ands r0, r2
    movs r5, #1
    rsbs r5, r5, #0
    cmp r0, #0
    bne .L08011C7C
    adds r5, r2, #0
.L08011C7C:
    adds r2, r1, #0
    adds r2, #0x5e
    movs r0, #4
    ldrh r2, [r2]
    ands r0, r2
    cmp r0, #0
    beq .L08011C8E
    movs r0, #0
    b .L08011C9A
.L08011C8E:
    ldr r0, .L08011CA0 @ =0x08B923EC
    bl SpawnProc
    str r4, [r0, #0x2c]
    str r5, [r0, #0x30]
    str r6, [r0, #0x38]
.L08011C9A:
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    .align 2, 0
.L08011CA0: .4byte 0x08B923EC
    func_end func_08011C44

    thumb_func_start func_08011CA4
func_08011CA4: @ 0x08011CA4
    push {lr}
    ldr r0, .L08011CB4 @ =0x08B923EC
    bl Proc_Find
    bl Proc_End
    pop {r1}
    bx r1
    .align 2, 0
.L08011CB4: .4byte 0x08B923EC
    func_end func_08011CA4

    thumb_func_start func_08011CB8
func_08011CB8: @ 0x08011CB8
    push {lr}
    ldr r0, .L08011CD4 @ =0x08B923EC
    bl Proc_Find
    cmp r0, #0
    beq .L08011CD8
    ldr r0, [r0, #0x34]
    cmp r0, #0
    beq .L08011CD0
    ldr r0, [r0]
    cmp r0, #0
    bne .L08011CD8
.L08011CD0:
    movs r0, #0
    b .L08011CDA
    .align 2, 0
.L08011CD4: .4byte 0x08B923EC
.L08011CD8:
    movs r0, #1
.L08011CDA:
    pop {r1}
    bx r1
    func_end func_08011CB8

    thumb_func_start func_08011CE0
func_08011CE0: @ 0x08011CE0
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r5, r0, #0
    ldr r0, [r5, #0x30]
    ldr r6, [r0, #4]
    ldr r7, [r0, #8]
    ldr r4, [r0, #0xc]
    adds r1, r5, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L08011D00
    movs r0, #0
    b .L08011D1A
.L08011D00:
    movs r1, #0xff
    adds r2, r4, #0
    ands r2, r1
    asrs r3, r4, #0x10
    ands r3, r1
    asrs r0, r4, #0x18
    ands r0, r1
    str r0, [sp]
    str r5, [sp, #4]
    adds r0, r6, #0
    adds r1, r7, #0
    bl func_080AA92C
.L08011D1A:
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_08011CE0

    thumb_func_start func_08011D24
func_08011D24: @ 0x08011D24
    push {lr}
    bl func_080AA964
    movs r0, #0
    pop {r1}
    bx r1
    func_end func_08011D24

    thumb_func_start EvtCmd_08011D30
EvtCmd_08011D30: @ 0x08011D30
    movs r0, #0
    bx lr
    func_end EvtCmd_08011D30

    thumb_func_start func_08011D34
func_08011D34: @ 0x08011D34
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    adds r6, r0, #0
    mov r8, r1
    mov sb, r2
    mov sl, r3
    ldr r7, [sp, #0x24]
    ldr r5, [sp, #0x2c]
    movs r0, #0
    str r0, [sp]
    ldr r4, .L08011DA4 @ =gMutableUnitInfo
    ldr r2, .L08011DA8 @ =0x01000004
    mov r0, sp
    adds r1, r4, #0
    bl CpuFastSet
    movs r0, #3
    ands r5, r0
    lsls r5, r5, #1
    movs r0, #7
    rsbs r0, r0, #0
    ldrb r1, [r4, #3]
    ands r0, r1
    orrs r0, r5
    movs r1, #7
    ands r0, r1
    movs r1, #8
    orrs r0, r1
    strb r0, [r4, #3]
    strb r6, [r4]
    mov r0, r8
    strb r0, [r4, #1]
    mov r1, sb
    strb r1, [r4, #4]
    mov r0, sl
    strb r0, [r4, #5]
    strb r7, [r4, #6]
    add r1, sp, #0x28
    ldrb r1, [r1]
    strb r1, [r4, #7]
    adds r0, r4, #0
    ldr r1, [sp, #0x30]
    bl LoadUnitWrapper
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08011DA4: .4byte gMutableUnitInfo
.L08011DA8: .4byte 0x01000004
    func_end func_08011D34

    thumb_func_start func_08011DAC
func_08011DAC: @ 0x08011DAC
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r4, r0, #0
    adds r6, r1, #0
    movs r0, #0
    str r0, [sp]
    ldr r5, .L08011DFC @ =gMutableUnitInfo
    ldr r2, .L08011E00 @ =0x01000004
    mov r0, sp
    adds r1, r5, #0
    bl CpuFastSet
    ldrb r2, [r4, #3]
    movs r1, #6
    ands r1, r2
    movs r0, #7
    rsbs r0, r0, #0
    ldrb r3, [r5, #3]
    ands r0, r3
    orrs r0, r1
    lsrs r2, r2, #3
    lsls r2, r2, #3
    movs r1, #7
    ands r0, r1
    orrs r0, r2
    strb r0, [r5, #3]
    ldrb r0, [r4]
    strb r0, [r5]
    ldrb r0, [r4, #1]
    strb r0, [r5, #1]
    cmp r6, #0
    beq .L08011E04
    ldrb r0, [r4, #4]
    strb r0, [r5, #4]
    ldrb r0, [r4, #5]
    strb r0, [r5, #5]
    ldrb r1, [r4, #6]
    ldrb r2, [r4, #7]
    b .L08011E0E
    .align 2, 0
.L08011DFC: .4byte gMutableUnitInfo
.L08011E00: .4byte 0x01000004
.L08011E04:
    ldrb r1, [r4, #6]
    strb r1, [r5, #4]
    ldrb r0, [r4, #7]
    strb r0, [r5, #5]
    adds r2, r0, #0
.L08011E0E:
    ldr r0, .L08011E24 @ =gMutableUnitInfo
    strb r1, [r0, #6]
    strb r2, [r0, #7]
    adds r1, r6, #0
    bl LoadUnitWrapper
    add sp, #4
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08011E24: .4byte gMutableUnitInfo
    func_end func_08011DAC

    thumb_func_start func_08011E28
func_08011E28: @ 0x08011E28
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x10
    adds r7, r0, #0
    ldr r1, [r7, #0x54]
    ldrb r0, [r1]
    cmp r0, #0
    bne .L08011E46
    adds r0, r7, #0
    bl Proc_End
    b .L08011EEE
.L08011E46:
    ldrb r4, [r1, #6]
    str r4, [r7, #0x2c]
    ldrb r3, [r1, #7]
    str r3, [r7, #0x30]
    ldr r6, .L08011F00 @ =gMapUnit
    ldr r1, [r6]
    lsls r0, r3, #2
    adds r0, r0, r1
    ldr r0, [r0]
    adds r0, r0, r4
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08011EE4
    movs r0, #0xff
    mov sb, r0
    movs r1, #1
    rsbs r1, r1, #0
    mov sl, r1
    mov r2, sl
    str r2, [sp]
    ldr r2, .L08011F04 @ =0x08BE3888
    adds r0, r4, #0
    adds r1, r3, #0
    bl MapFloodExtended
    movs r5, #0
    ldr r0, .L08011F08 @ =gMapSize
    movs r3, #2
    ldrsh r1, [r0, r3]
    cmp r5, r1
    bge .L08011EDC
    movs r3, #0
    ldrsh r2, [r0, r3]
    str r2, [sp, #8]
    str r1, [sp, #4]
.L08011E8C:
    movs r3, #0
    adds r6, r5, #1
    mov ip, r6
    ldr r0, [sp, #8]
    cmp r3, r0
    bge .L08011ED4
    ldr r1, .L08011F0C @ =gMapMovement
    ldr r0, [r1]
    lsls r1, r5, #2
    adds r0, r1, r0
    ldr r0, [r0]
    str r0, [sp, #0xc]
    ldr r2, .L08011F08 @ =gMapSize
    movs r6, #0
    ldrsh r4, [r2, r6]
    ldr r0, .L08011F00 @ =gMapUnit
    mov r8, r0
.L08011EAE:
    ldr r2, [sp, #0xc]
    adds r0, r2, r3
    ldrb r2, [r0]
    cmp sb, r2
    ble .L08011ECE
    mov r6, r8
    ldr r0, [r6]
    adds r0, r1, r0
    ldr r0, [r0]
    adds r0, r0, r3
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08011ECE
    mov sb, r2
    str r3, [sp]
    mov sl, r5
.L08011ECE:
    adds r3, #1
    cmp r3, r4
    blt .L08011EAE
.L08011ED4:
    mov r5, ip
    ldr r0, [sp, #4]
    cmp r5, r0
    blt .L08011E8C
.L08011EDC:
    ldr r1, [sp]
    str r1, [r7, #0x2c]
    mov r2, sl
    str r2, [r7, #0x30]
.L08011EE4:
    ldr r1, [r7, #0x2c]
    ldr r2, [r7, #0x30]
    adds r0, r7, #0
    bl CameraMoveWatchPosition
.L08011EEE:
    add sp, #0x10
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08011F00: .4byte gMapUnit
.L08011F04: .4byte 0x08BE3888
.L08011F08: .4byte gMapSize
.L08011F0C: .4byte gMapMovement
    func_end func_08011E28

    thumb_func_start func_08011F10
func_08011F10: @ 0x08011F10
    push {r4, r5, r6, lr}
    sub sp, #0x14
    adds r4, r0, #0
    ldr r5, [r4, #0x54]
    ldr r1, [r4, #0x2c]
    ldr r2, [r4, #0x30]
    movs r0, #1
    str r0, [sp]
    adds r0, r4, #0
    movs r3, #1
    bl StartWarpEffect_080209F4
    add r1, sp, #4
    adds r0, r5, #0
    ldm r0!, {r2, r3, r6}
    stm r1!, {r2, r3, r6}
    ldr r0, [r0]
    str r0, [r1]
    add r2, sp, #4
    adds r1, r2, #0
    ldr r0, [r4, #0x2c]
    strb r0, [r1, #6]
    strb r0, [r2, #4]
    ldr r0, [r4, #0x30]
    strb r0, [r1, #7]
    strb r0, [r2, #5]
    adds r0, r1, #0
    bl CreateUnit
    adds r5, #0x10
    str r5, [r4, #0x54]
    add sp, #0x14
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08011F10

    thumb_func_start EvtCmd_WarpLoadUnits
EvtCmd_WarpLoadUnits: @ 0x08011F58
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L08011FA4 @ =gMapOther
    ldr r0, [r0]
    movs r1, #0
    bl MapFill
    ldr r0, .L08011FA8 @ =0x08B92414
    adds r1, r4, #0
    bl SpawnProcLocking
    adds r2, r0, #0
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #4]
    str r0, [r2, #0x54]
    movs r3, #0
    adds r0, r4, #0
    adds r0, #0x4d
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #0
    bne .L08011F94
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L08011F96
.L08011F94:
    movs r3, #1
.L08011F96:
    adds r0, r2, #0
    adds r0, #0x64
    strh r3, [r0]
    movs r0, #2
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08011FA4: .4byte gMapOther
.L08011FA8: .4byte 0x08B92414
    func_end EvtCmd_WarpLoadUnits
