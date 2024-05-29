    .include "asm_prelude.inc"

    thumb_func_start NextRN
NextRN: @ 0x08000BE0
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    adds r0, r7, #0
    ldr r1, .L08000C9C @ =0x03000000
    ldrh r2, [r1, #2]
    lsls r1, r2, #0xb
    ldr r2, .L08000C9C @ =0x03000000
    ldrh r3, [r2]
    lsrs r2, r3, #5
    adds r1, r1, r2
    adds r2, r1, #0
    strh r2, [r0]
    ldr r0, .L08000C9C @ =0x03000000
    ldr r1, .L08000C9C @ =0x03000000
    ldrh r2, [r1, #4]
    lsls r1, r2, #1
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r0, .L08000C9C @ =0x03000000
    ldrh r1, [r0, #2]
    movs r2, #0x80
    lsls r2, r2, #8
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    cmp r0, #0
    beq .L08000C42
    ldr r1, .L08000C9C @ =0x03000000
    ldr r0, .L08000C9C @ =0x03000000
    ldr r1, .L08000C9C @ =0x03000000
    ldrh r2, [r1, #4]
    adds r1, r2, #1
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
.L08000C42:
    adds r0, r7, #0
    adds r1, r7, #0
    ldr r2, .L08000C9C @ =0x03000000
    ldrh r1, [r1]
    ldrh r2, [r2, #4]
    eors r1, r2
    adds r2, r1, #0
    strh r2, [r0]
    ldr r0, .L08000C9C @ =0x03000000
    ldr r1, .L08000C9C @ =0x03000000
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #2]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r0, .L08000C9C @ =0x03000000
    ldr r1, .L08000C9C @ =0x03000000
    ldrh r2, [r0, #2]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #2]
    ldr r0, .L08000C9C @ =0x03000000
    adds r1, r7, #0
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    adds r0, r7, #0
    ldrh r1, [r0]
    adds r0, r1, #0
    b .L08000CA0
    .align 2, 0
.L08000C9C: .4byte 0x03000000
.L08000CA0:
    add sp, #4
    pop {r7}
    pop {r1}
    bx r1
    func_end NextRN

    thumb_func_start RandInit
RandInit: @ 0x08000CA8
    push {r7, lr}
    sub sp, #0x1c
    mov r7, sp
    str r0, [r7]
    adds r0, r7, #4
    adds r1, r7, #4
    ldr r2, .L08000D58 @ =0x080C5820
    adds r0, r1, #0
    adds r1, r2, #0
    movs r2, #0x10
    bl memcpy
    ldr r1, [r7]
    adds r0, r1, #0
    movs r1, #7
    bl __modsi3
    str r0, [r7, #0x14]
    ldr r0, .L08000D5C @ =0x03000000
    adds r1, r7, #4
    ldr r2, [r7, #0x14]
    movs r3, #7
    ands r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, [r7, #0x14]
    adds r1, r0, #1
    str r1, [r7, #0x14]
    ldr r0, .L08000D5C @ =0x03000000
    adds r1, r7, #4
    ldr r2, [r7, #0x14]
    movs r3, #7
    ands r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r0, #2]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #2]
    ldr r0, [r7, #0x14]
    adds r1, r0, #1
    str r1, [r7, #0x14]
    ldr r0, .L08000D5C @ =0x03000000
    adds r1, r7, #4
    ldr r2, [r7, #0x14]
    movs r3, #7
    ands r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r1, [r7]
    adds r0, r1, #0
    movs r1, #0x17
    bl __modsi3
    str r0, [r7, #0x18]
    movs r0, #0
    str r0, [r7, #0x14]
.L08000D4E:
    ldr r0, [r7, #0x14]
    ldr r1, [r7, #0x18]
    cmp r0, r1
    blt .L08000D60
    b .L08000D6C
    .align 2, 0
.L08000D58: .4byte 0x080C5820
.L08000D5C: .4byte 0x03000000
.L08000D60:
    bl NextRN
    ldr r0, [r7, #0x14]
    adds r1, r0, #1
    str r1, [r7, #0x14]
    b .L08000D4E
.L08000D6C:
    add sp, #0x1c
    pop {r7}
    pop {r0}
    bx r0
    func_end RandInit

    thumb_func_start RandSetSt
RandSetSt: @ 0x08000D74
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r1, .L08000DCC @ =0x03000000
    ldr r0, [r7]
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r2, [r0]
    orrs r3, r2
    adds r2, r3, #0
    strh r2, [r1]
    adds r0, #2
    str r0, [r7]
    ldr r1, .L08000DCC @ =0x03000000
    ldr r0, [r7]
    ldrh r2, [r1, #2]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r2, [r0]
    orrs r3, r2
    adds r2, r3, #0
    strh r2, [r1, #2]
    adds r0, #2
    str r0, [r7]
    ldr r0, .L08000DCC @ =0x03000000
    ldr r1, [r7]
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08000DCC: .4byte 0x03000000
    func_end RandSetSt

    thumb_func_start RandGetSt
RandGetSt: @ 0x08000DD0
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    ldr r1, .L08000E00 @ =0x03000000
    ldrh r2, [r1]
    strh r2, [r0]
    adds r0, #2
    str r0, [r7]
    ldr r0, [r7]
    ldr r1, .L08000E00 @ =0x03000000
    ldrh r2, [r1, #2]
    strh r2, [r0]
    adds r0, #2
    str r0, [r7]
    ldr r0, [r7]
    ldr r1, .L08000E00 @ =0x03000000
    ldrh r2, [r1, #4]
    strh r2, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08000E00: .4byte 0x03000000
    func_end RandGetSt

    thumb_func_start RandNext_100
RandNext_100: @ 0x08000E04
    push {r7, lr}
    mov r7, sp
    bl NextRN
    movs r2, #0x64
    adds r1, r0, #0
    muls r1, r2, r1
    adds r0, r1, #0
    cmp r0, #0
    bge .L08000E1C
    ldr r1, .L08000E24 @ =0x0000FFFF
    adds r0, r0, r1
.L08000E1C:
    asrs r1, r0, #0x10
    adds r0, r1, #0
    b .L08000E28
    .align 2, 0
.L08000E24: .4byte 0x0000FFFF
.L08000E28:
    pop {r7}
    pop {r1}
    bx r1
    func_end RandNext_100

    thumb_func_start RandNext
RandNext: @ 0x08000E30
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    bl NextRN
    ldr r2, [r7]
    adds r1, r0, #0
    muls r1, r2, r1
    adds r0, r1, #0
    cmp r0, #0
    bge .L08000E4C
    ldr r1, .L08000E54 @ =0x0000FFFF
    adds r0, r0, r1
.L08000E4C:
    asrs r1, r0, #0x10
    adds r0, r1, #0
    b .L08000E58
    .align 2, 0
.L08000E54: .4byte 0x0000FFFF
.L08000E58:
    add sp, #4
    pop {r7}
    pop {r1}
    bx r1
    func_end RandNext

    thumb_func_start RandRoll
RandRoll: @ 0x08000E60
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    bl RandNext_100
    adds r1, r0, #0
    movs r0, #0
    ldr r2, [r7]
    cmp r2, r1
    ble .L08000E78
    movs r0, #1
.L08000E78:
    b .L08000E7A
.L08000E7A:
    add sp, #4
    pop {r7}
    pop {r1}
    bx r1
    func_end RandRoll

    thumb_func_start RandRoll2Rn
RandRoll2Rn: @ 0x08000E84
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    bl RandNext_100
    str r0, [r7, #4]
    bl RandNext_100
    ldr r1, [r7, #4]
    adds r0, r1, r0
    str r0, [r7, #4]
    ldr r0, [r7, #4]
    asrs r1, r0, #0x1f
    lsrs r2, r1, #0x1f
    adds r1, r0, r2
    asrs r0, r1, #1
    str r0, [r7, #4]
    movs r0, #0
    ldr r1, [r7]
    ldr r2, [r7, #4]
    cmp r1, r2
    ble .L08000EB4
    movs r0, #1
.L08000EB4:
    b .L08000EB6
.L08000EB6:
    add sp, #8
    pop {r7}
    pop {r1}
    bx r1
    func_end RandRoll2Rn

    thumb_func_start RandInitB
RandInitB: @ 0x08000EC0
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08000ED8 @ =0x03000008
    ldr r1, [r7]
    str r1, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08000ED8: .4byte 0x03000008
    func_end RandInitB

    thumb_func_start RandNextB
RandNextB: @ 0x08000EDC
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    ldr r0, .L08000F08 @ =0x03000008
    ldr r1, [r0]
    lsls r0, r1, #2
    adds r1, r0, #2
    str r1, [r7]
    ldr r1, [r7]
    adds r0, r1, #1
    ldr r1, [r7]
    muls r0, r1, r0
    str r0, [r7]
    ldr r0, [r7]
    lsrs r1, r0, #2
    str r1, [r7]
    ldr r0, .L08000F08 @ =0x03000008
    ldr r1, [r7]
    str r1, [r0]
    ldr r1, [r7]
    adds r0, r1, #0
    b .L08000F0C
    .align 2, 0
.L08000F08: .4byte 0x03000008
.L08000F0C:
    add sp, #4
    pop {r7}
    pop {r1}
    bx r1
    func_end RandNextB

    thumb_func_start GetGameTime
GetGameTime: @ 0x08000F14
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08000F20 @ =0x03000010
    ldr r1, [r0]
    adds r0, r1, #0
    b .L08000F24
    .align 2, 0
.L08000F20: .4byte 0x03000010
.L08000F24:
    pop {r7}
    pop {r1}
    bx r1
    func_end GetGameTime

    thumb_func_start SetGameTime
SetGameTime: @ 0x08000F2C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08000F44 @ =0x03000010
    ldr r1, [r7]
    str r1, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08000F44: .4byte 0x03000010
    func_end SetGameTime

    thumb_func_start IncGameTime
IncGameTime: @ 0x08000F48
    push {r7, lr}
    mov r7, sp
    ldr r1, .L08000F6C @ =0x03000010
    ldr r0, .L08000F6C @ =0x03000010
    ldr r1, .L08000F6C @ =0x03000010
    ldr r2, [r1]
    adds r1, r2, #1
    str r1, [r0]
    ldr r0, .L08000F6C @ =0x03000010
    ldr r1, [r0]
    ldr r0, .L08000F70 @ =0x0CDFE5FF
    cmp r1, r0
    bls .L08000F78
    ldr r0, .L08000F6C @ =0x03000010
    ldr r1, .L08000F74 @ =0x0CBEF080
    str r1, [r0]
    b .L08000F78
    .align 2, 0
.L08000F6C: .4byte 0x03000010
.L08000F70: .4byte 0x0CDFE5FF
.L08000F74: .4byte 0x0CBEF080
.L08000F78:
    pop {r7}
    pop {r0}
    bx r0
    func_end IncGameTime

    thumb_func_start FormatTime
FormatTime: @ 0x08000F80
    push {r4, r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r4, [r7, #0xc]
    ldr r1, [r7]
    adds r0, r1, #0
    movs r1, #0x3c
    bl __udivsi3
    adds r1, r0, #0
    adds r0, r1, #0
    movs r1, #0x3c
    bl __umodsi3
    adds r1, r0, #0
    strh r1, [r4]
    ldr r4, [r7, #8]
    ldr r1, [r7]
    adds r0, r1, #0
    movs r1, #0xe1
    lsls r1, r1, #4
    bl __udivsi3
    adds r1, r0, #0
    adds r0, r1, #0
    movs r1, #0x3c
    bl __umodsi3
    adds r1, r0, #0
    strh r1, [r4]
    ldr r4, [r7, #4]
    ldr r1, [r7]
    adds r0, r1, #0
    ldr r1, .L08000FF0 @ =0x00034BC0
    bl __udivsi3
    adds r1, r0, #0
    strh r1, [r4]
    ldr r1, [r7]
    adds r0, r1, #0
    movs r1, #0x1e
    bl __udivsi3
    adds r1, r0, #0
    movs r2, #1
    adds r0, r1, #0
    ands r0, r2
    adds r1, r0, #0
    lsls r0, r1, #0x18
    asrs r1, r0, #0x18
    adds r0, r1, #0
    b .L08000FF4
    .align 2, 0
.L08000FF0: .4byte 0x00034BC0
.L08000FF4:
    add sp, #0x10
    pop {r4, r7}
    pop {r1}
    bx r1
    func_end FormatTime

    thumb_func_start EnableBgSync
EnableBgSync: @ 0x08000FFC
    push {r7, lr}
    mov r7, sp
    ldr r1, .L08001014 @ =0x0300000C
    ldr r2, .L08001014 @ =0x0300000C
    ldrb r3, [r2]
    adds r2, r0, #0
    orrs r3, r2
    adds r2, r3, #0
    strb r2, [r1]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001014: .4byte 0x0300000C
    func_end EnableBgSync

    thumb_func_start func_08001018
func_08001018: @ 0x08001018
    push {r4, r7, lr}
    mov r7, sp
    ldr r1, .L08001034 @ =0x0300000C
    ldr r2, .L08001034 @ =0x0300000C
    movs r4, #1
    adds r3, r4, #0
    lsls r3, r0
    ldrb r2, [r2]
    orrs r2, r3
    adds r3, r2, #0
    strb r3, [r1]
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001034: .4byte 0x0300000C
    func_end func_08001018

    thumb_func_start func_08001038
func_08001038: @ 0x08001038
    push {r4, r7, lr}
    mov r7, sp
    ldr r1, .L08001058 @ =0x0300000C
    ldr r2, .L08001058 @ =0x0300000C
    adds r3, r0, #0
    mvns r4, r3
    ldrb r2, [r2]
    adds r3, r4, #0
    adds r4, r3, #0
    ands r2, r4
    adds r3, r2, #0
    strb r3, [r1]
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001058: .4byte 0x0300000C
    func_end func_08001038

    thumb_func_start EnablePalSync
EnablePalSync: @ 0x0800105C
    push {r7, lr}
    mov r7, sp
    ldr r0, .L0800106C @ =0x0300000D
    movs r1, #1
    strb r1, [r0]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800106C: .4byte 0x0300000D
    func_end EnablePalSync

    thumb_func_start func_08001070
func_08001070: @ 0x08001070
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08001080 @ =0x0300000D
    movs r1, #0
    strb r1, [r0]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001080: .4byte 0x0300000D
    func_end func_08001070

    thumb_func_start ApplyPaletteExt
ApplyPaletteExt: @ 0x08001084
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r0, [r7, #8]
    movs r1, #0x1f
    ands r0, r1
    cmp r0, #0
    beq .L080010C0
    ldr r1, [r7, #4]
    asrs r0, r1, #1
    adds r1, r0, #0
    lsls r0, r1, #1
    ldr r2, .L080010BC @ =gPal
    adds r1, r0, r2
    ldr r0, [r7, #8]
    asrs r2, r0, #0x1f
    lsrs r3, r2, #0x1f
    adds r2, r0, r3
    asrs r0, r2, #1
    lsls r3, r0, #0xb
    lsrs r2, r3, #0xb
    ldr r0, [r7]
    bl CpuSet
    b .L080010E2
    .align 2, 0
.L080010BC: .4byte gPal
.L080010C0:
    ldr r1, [r7, #4]
    asrs r0, r1, #1
    adds r1, r0, #0
    lsls r0, r1, #1
    ldr r2, .L080010F0 @ =gPal
    adds r1, r0, r2
    ldr r2, [r7, #8]
    adds r0, r2, #0
    cmp r0, #0
    bge .L080010D6
    adds r0, #3
.L080010D6:
    asrs r0, r0, #2
    lsls r3, r0, #0xb
    lsrs r2, r3, #0xb
    ldr r0, [r7]
    bl CpuFastSet
.L080010E2:
    bl EnablePalSync
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080010F0: .4byte gPal
    func_end ApplyPaletteExt

    thumb_func_start func_080010F4
func_080010F4: @ 0x080010F4
    push {r4, r7, lr}
    sub sp, #0x1c
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r1, [r7, #4]
    asrs r0, r1, #1
    adds r1, r0, #0
    lsls r0, r1, #1
    ldr r1, .L08001124 @ =gPal
    adds r0, r1, r0
    str r0, [r7, #0x14]
    ldr r0, [r7]
    str r0, [r7, #0x18]
    movs r0, #0
    str r0, [r7, #0x10]
.L08001118:
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #8]
    cmp r0, r1
    blt .L08001128
    b .L080011A2
    .align 2, 0
.L08001124: .4byte gPal
.L08001128:
    ldr r0, [r7, #0x14]
    ldr r1, [r7, #0x18]
    ldrh r2, [r1]
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    adds r3, r1, #0
    lsls r2, r3, #0x10
    lsrs r1, r2, #0x10
    ldr r2, [r7, #0xc]
    muls r1, r2, r1
    asrs r2, r1, #6
    adds r1, r2, #0
    movs r2, #0x1f
    ands r1, r2
    ldr r2, [r7, #0x18]
    ldrh r3, [r2]
    movs r4, #0xf8
    lsls r4, r4, #2
    adds r2, r3, #0
    ands r2, r4
    adds r4, r2, #0
    lsls r3, r4, #0x10
    lsrs r2, r3, #0x10
    ldr r3, [r7, #0xc]
    muls r2, r3, r2
    asrs r3, r2, #6
    adds r2, r3, #0
    movs r3, #0xf8
    lsls r3, r3, #2
    ands r2, r3
    adds r1, r1, r2
    ldr r2, [r7, #0x18]
    ldrh r3, [r2]
    movs r4, #0xf8
    lsls r4, r4, #7
    adds r2, r3, #0
    ands r2, r4
    adds r4, r2, #0
    lsls r3, r4, #0x10
    lsrs r2, r3, #0x10
    ldr r3, [r7, #0xc]
    muls r2, r3, r2
    asrs r3, r2, #6
    adds r2, r3, #0
    movs r3, #0xf8
    lsls r3, r3, #7
    ands r2, r3
    adds r1, r1, r2
    adds r2, r1, #0
    strh r2, [r0]
    ldr r0, [r7, #0x14]
    adds r1, r0, #2
    str r1, [r7, #0x14]
    ldr r0, [r7, #0x18]
    adds r1, r0, #2
    str r1, [r7, #0x18]
    ldr r0, [r7, #0x10]
    adds r1, r0, #1
    str r1, [r7, #0x10]
    b .L08001118
.L080011A2:
    bl EnablePalSync
    add sp, #0x1c
    pop {r4, r7}
    pop {r0}
    bx r0
    func_end func_080010F4

    thumb_func_start func_080011B0
func_080011B0: @ 0x080011B0
    push {r7, lr}
    mov r7, sp
    movs r0, #0x80
    lsls r0, r0, #0x13
    ldr r1, .L08001284 @ =gDispIo
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L08001288 @ =0x04000004
    ldr r1, .L0800128C @ =0x03002874
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L08001290 @ =0x04000008
    ldr r1, .L08001294 @ =0x0300287C
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L08001298 @ =0x0400000A
    ldr r1, .L0800129C @ =0x03002880
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L080012A0 @ =0x0400000C
    ldr r1, .L080012A4 @ =0x03002884
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L080012A8 @ =0x0400000E
    ldr r1, .L080012AC @ =0x03002888
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L080012B0 @ =0x04000010
    ldr r1, .L080012B4 @ =0x0300288C
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L080012B8 @ =0x04000014
    ldr r1, .L080012BC @ =0x03002890
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L080012C0 @ =0x04000018
    ldr r1, .L080012C4 @ =0x03002894
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L080012C8 @ =0x0400001C
    ldr r1, .L080012CC @ =0x03002898
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L080012D0 @ =0x04000040
    ldr r1, .L080012D4 @ =0x0300289C
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L080012D8 @ =0x04000044
    ldr r1, .L080012DC @ =0x030028A0
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L080012E0 @ =0x04000048
    ldr r1, .L080012E4 @ =0x030028A4
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L080012E8 @ =0x0400004C
    ldr r1, .L080012EC @ =0x030028A8
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L080012F0 @ =0x04000050
    ldr r1, .L080012F4 @ =0x030028AC
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L080012F8 @ =0x04000052
    ldr r1, .L080012FC @ =0x030028B4
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L08001300 @ =0x04000054
    ldr r1, .L08001304 @ =0x030028B6
    ldrb r2, [r1]
    strb r2, [r0]
    ldr r0, .L08001308 @ =0x04000020
    ldr r1, .L0800130C @ =0x030028B8
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L08001310 @ =0x04000024
    ldr r1, .L08001314 @ =0x030028BC
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L08001318 @ =0x04000028
    ldr r1, .L0800131C @ =0x030028C0
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L08001320 @ =0x0400002C
    ldr r1, .L08001324 @ =0x030028C4
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L08001328 @ =0x04000030
    ldr r1, .L0800132C @ =0x030028C8
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L08001330 @ =0x04000034
    ldr r1, .L08001334 @ =0x030028CC
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L08001338 @ =0x04000038
    ldr r1, .L0800133C @ =0x030028D0
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L08001340 @ =0x0400003C
    ldr r1, .L08001344 @ =0x030028D4
    ldr r2, [r1]
    str r2, [r0]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001284: .4byte gDispIo
.L08001288: .4byte 0x04000004
.L0800128C: .4byte 0x03002874
.L08001290: .4byte 0x04000008
.L08001294: .4byte 0x0300287C
.L08001298: .4byte 0x0400000A
.L0800129C: .4byte 0x03002880
.L080012A0: .4byte 0x0400000C
.L080012A4: .4byte 0x03002884
.L080012A8: .4byte 0x0400000E
.L080012AC: .4byte 0x03002888
.L080012B0: .4byte 0x04000010
.L080012B4: .4byte 0x0300288C
.L080012B8: .4byte 0x04000014
.L080012BC: .4byte 0x03002890
.L080012C0: .4byte 0x04000018
.L080012C4: .4byte 0x03002894
.L080012C8: .4byte 0x0400001C
.L080012CC: .4byte 0x03002898
.L080012D0: .4byte 0x04000040
.L080012D4: .4byte 0x0300289C
.L080012D8: .4byte 0x04000044
.L080012DC: .4byte 0x030028A0
.L080012E0: .4byte 0x04000048
.L080012E4: .4byte 0x030028A4
.L080012E8: .4byte 0x0400004C
.L080012EC: .4byte 0x030028A8
.L080012F0: .4byte 0x04000050
.L080012F4: .4byte 0x030028AC
.L080012F8: .4byte 0x04000052
.L080012FC: .4byte 0x030028B4
.L08001300: .4byte 0x04000054
.L08001304: .4byte 0x030028B6
.L08001308: .4byte 0x04000020
.L0800130C: .4byte 0x030028B8
.L08001310: .4byte 0x04000024
.L08001314: .4byte 0x030028BC
.L08001318: .4byte 0x04000028
.L0800131C: .4byte 0x030028C0
.L08001320: .4byte 0x0400002C
.L08001324: .4byte 0x030028C4
.L08001328: .4byte 0x04000030
.L0800132C: .4byte 0x030028C8
.L08001330: .4byte 0x04000034
.L08001334: .4byte 0x030028CC
.L08001338: .4byte 0x04000038
.L0800133C: .4byte 0x030028D0
.L08001340: .4byte 0x0400003C
.L08001344: .4byte 0x030028D4
    func_end func_080011B0

    thumb_func_start func_08001348
func_08001348: @ 0x08001348
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    adds r1, r7, #0
    strh r0, [r1]
    adds r1, r7, #0
    ldrh r0, [r1]
    cmp r0, #1
    beq .L08001378
    cmp r0, #1
    bgt .L08001364
    cmp r0, #0
    beq .L0800136E
    b .L08001390
.L08001364:
    cmp r0, #2
    beq .L08001380
    cmp r0, #3
    beq .L08001388
    b .L08001390
.L0800136E:
    ldr r0, .L08001374 @ =0x0300287C
    b .L08001390
    .align 2, 0
.L08001374: .4byte 0x0300287C
.L08001378:
    ldr r0, .L0800137C @ =0x03002880
    b .L08001390
    .align 2, 0
.L0800137C: .4byte 0x03002880
.L08001380:
    ldr r0, .L08001384 @ =0x03002884
    b .L08001390
    .align 2, 0
.L08001384: .4byte 0x03002884
.L08001388:
    ldr r0, .L0800138C @ =0x03002888
    b .L08001390
    .align 2, 0
.L0800138C: .4byte 0x03002888
.L08001390:
    add sp, #4
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08001348

    thumb_func_start GetBgChrOffset
GetBgChrOffset: @ 0x08001398
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    ldr r1, [r7]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    bl func_08001348
    str r0, [r7, #4]
    ldr r0, [r7, #4]
    ldr r1, [r0]
    lsls r0, r1, #0x1c
    lsrs r2, r0, #0x1e
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    adds r1, r0, #0
    lsls r2, r1, #0xe
    adds r0, r2, #0
    b .L080013C4
.L080013C4:
    add sp, #8
    pop {r7}
    pop {r1}
    bx r1
    func_end GetBgChrOffset

    thumb_func_start func_080013CC
func_080013CC: @ 0x080013CC
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r0, [r7, #4]
    lsls r1, r0, #0x10
    lsrs r0, r1, #0x10
    str r0, [r7, #4]
    ldr r0, [r7]
    bl GetBgChrOffset
    ldr r2, [r7, #4]
    subs r1, r2, r0
    adds r0, r1, #0
    cmp r0, #0
    bge .L080013F0
    adds r0, #0x1f
.L080013F0:
    asrs r1, r0, #5
    adds r0, r1, #0
    b .L080013F6
.L080013F6:
    add sp, #8
    pop {r7}
    pop {r1}
    bx r1
    func_end func_080013CC

    thumb_func_start func_08001400
func_08001400: @ 0x08001400
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    ldr r1, [r7]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    bl func_08001348
    str r0, [r7, #4]
    ldr r0, [r7, #4]
    ldr r1, [r0]
    lsls r0, r1, #0x13
    lsrs r2, r0, #0x1b
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    adds r1, r0, #0
    lsls r2, r1, #0xb
    adds r0, r2, #0
    b .L0800142C
.L0800142C:
    add sp, #8
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08001400

    thumb_func_start SetBgChrOffset
SetBgChrOffset: @ 0x08001434
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r1, [r7]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    bl func_08001348
    str r0, [r7, #8]
    ldr r0, [r7, #8]
    ldr r2, [r7, #4]
    asrs r1, r2, #0xe
    adds r2, r1, #0
    movs r3, #3
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    lsls r1, r2, #2
    ldrb r2, [r0]
    movs r3, #0xf3
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end SetBgChrOffset

    thumb_func_start func_08001478
func_08001478: @ 0x08001478
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r1, [r7]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    bl func_08001348
    str r0, [r7, #8]
    ldr r0, [r7, #4]
    lsls r1, r0, #0x15
    lsrs r0, r1, #0x15
    cmp r0, #0
    beq .L0800149E
    b .L080014D0
.L0800149E:
    ldr r0, [r7, #8]
    ldr r2, [r7, #4]
    asrs r1, r2, #0xb
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    ldrb r2, [r0, #1]
    movs r3, #0xe0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0, #1]
    ldr r0, .L080014D8 @ =gBgMapVramTable
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #2
    adds r0, r0, r1
    ldr r1, [r7, #4]
    movs r2, #0xc0
    lsls r2, r2, #0x13
    orrs r1, r2
    str r1, [r0]
.L080014D0:
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080014D8: .4byte gBgMapVramTable
    func_end func_08001478

    thumb_func_start func_080014DC
func_080014DC: @ 0x080014DC
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r1, [r7]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    bl func_08001348
    str r0, [r7, #8]
    ldr r0, [r7, #8]
    ldr r2, [r7, #4]
    adds r1, r2, #0
    adds r2, r1, #0
    lsls r1, r2, #6
    ldrb r2, [r0, #1]
    movs r3, #0x3f
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0, #1]
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end func_080014DC

    thumb_func_start func_08001518
func_08001518: @ 0x08001518
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r1, [r7]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    bl func_08001348
    str r0, [r7, #8]
    ldr r0, [r7, #8]
    movs r1, #0
    ldr r2, [r7, #4]
    cmp r2, #8
    bne .L0800153E
    movs r1, #1
.L0800153E:
    adds r2, r1, #0
    lsls r1, r2, #7
    ldrb r2, [r0]
    movs r3, #0x7f
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08001518

    thumb_func_start func_0800155C
func_0800155C: @ 0x0800155C
    push {r7, lr}
    sub sp, #0x1c
    mov r7, sp
    str r0, [r7]
    ldr r0, .L0800157C @ =gPal
    str r0, [r7, #4]
    movs r0, #0xa0
    lsls r0, r0, #0x13
    str r0, [r7, #8]
    movs r0, #0
    str r0, [r7, #0xc]
.L08001572:
    ldr r0, [r7, #0xc]
    ldr r1, .L08001580 @ =0x000001FF
    cmp r0, r1
    ble .L08001584
    b .L0800161C
    .align 2, 0
.L0800157C: .4byte gPal
.L08001580: .4byte 0x000001FF
.L08001584:
    ldr r0, [r7, #4]
    ldrh r1, [r0]
    movs r2, #0x1f
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    ldr r1, [r7]
    adds r0, r0, r1
    str r0, [r7, #0x10]
    ldr r0, [r7, #4]
    ldrh r1, [r0]
    lsrs r0, r1, #5
    adds r1, r0, #0
    movs r2, #0x1f
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    ldr r1, [r7]
    adds r0, r0, r1
    str r0, [r7, #0x14]
    ldr r0, [r7, #4]
    ldrh r1, [r0]
    lsrs r0, r1, #0xa
    adds r1, r0, #0
    movs r2, #0x1f
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    ldr r1, [r7]
    adds r0, r0, r1
    str r0, [r7, #0x18]
    ldr r0, [r7, #0x10]
    cmp r0, #0x1f
    ble .L080015D8
    movs r0, #0x1f
    str r0, [r7, #0x10]
.L080015D8:
    ldr r0, [r7, #0x14]
    cmp r0, #0x1f
    ble .L080015E2
    movs r0, #0x1f
    str r0, [r7, #0x14]
.L080015E2:
    ldr r0, [r7, #0x18]
    cmp r0, #0x1f
    ble .L080015EC
    movs r0, #0x1f
    str r0, [r7, #0x18]
.L080015EC:
    ldr r0, [r7, #8]
    ldr r1, [r7, #0x18]
    adds r2, r1, #0
    lsls r1, r2, #0xa
    ldr r3, [r7, #0x14]
    adds r2, r3, #0
    lsls r3, r2, #5
    adds r2, r3, #0
    adds r1, r1, r2
    ldr r3, [r7, #0x10]
    adds r2, r3, #0
    adds r2, r1, r2
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, [r7, #4]
    adds r1, r0, #2
    str r1, [r7, #4]
    ldr r0, [r7, #8]
    adds r1, r0, #2
    str r1, [r7, #8]
    ldr r0, [r7, #0xc]
    adds r1, r0, #1
    str r1, [r7, #0xc]
    b .L08001572
.L0800161C:
    add sp, #0x1c
    pop {r7}
    pop {r0}
    bx r0
    func_end func_0800155C

    thumb_func_start func_08001624
func_08001624: @ 0x08001624
    push {r7, lr}
    sub sp, #0x1c
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08001644 @ =gPal
    str r0, [r7, #4]
    movs r0, #0xa0
    lsls r0, r0, #0x13
    str r0, [r7, #8]
    movs r0, #0
    str r0, [r7, #0xc]
.L0800163A:
    ldr r0, [r7, #0xc]
    ldr r1, .L08001648 @ =0x000001FF
    cmp r0, r1
    ble .L0800164C
    b .L080016E4
    .align 2, 0
.L08001644: .4byte gPal
.L08001648: .4byte 0x000001FF
.L0800164C:
    ldr r0, [r7, #4]
    ldrh r1, [r0]
    movs r2, #0x1f
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    ldr r1, [r7]
    adds r0, r0, r1
    str r0, [r7, #0x10]
    ldr r0, [r7, #4]
    ldrh r1, [r0]
    lsrs r0, r1, #5
    adds r1, r0, #0
    movs r2, #0x1f
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    ldr r1, [r7]
    adds r0, r0, r1
    str r0, [r7, #0x14]
    ldr r0, [r7, #4]
    ldrh r1, [r0]
    lsrs r0, r1, #0xa
    adds r1, r0, #0
    movs r2, #0x1f
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    ldr r1, [r7]
    adds r0, r0, r1
    str r0, [r7, #0x18]
    ldr r0, [r7, #0x10]
    cmp r0, #0
    bge .L080016A0
    movs r0, #0
    str r0, [r7, #0x10]
.L080016A0:
    ldr r0, [r7, #0x14]
    cmp r0, #0
    bge .L080016AA
    movs r0, #0
    str r0, [r7, #0x14]
.L080016AA:
    ldr r0, [r7, #0x18]
    cmp r0, #0
    bge .L080016B4
    movs r0, #0
    str r0, [r7, #0x18]
.L080016B4:
    ldr r0, [r7, #8]
    ldr r1, [r7, #0x18]
    adds r2, r1, #0
    lsls r1, r2, #0xa
    ldr r3, [r7, #0x14]
    adds r2, r3, #0
    lsls r3, r2, #5
    adds r2, r3, #0
    adds r1, r1, r2
    ldr r3, [r7, #0x10]
    adds r2, r3, #0
    adds r2, r1, r2
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, [r7, #4]
    adds r1, r0, #2
    str r1, [r7, #4]
    ldr r0, [r7, #8]
    adds r1, r0, #2
    str r1, [r7, #8]
    ldr r0, [r7, #0xc]
    adds r1, r0, #1
    str r1, [r7, #0xc]
    b .L0800163A
.L080016E4:
    add sp, #0x1c
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08001624

    thumb_func_start func_080016EC
func_080016EC: @ 0x080016EC
    push {r7, lr}
    mov r7, sp
    ldr r0, .L080017AC @ =0x0300000C
    ldrb r1, [r0]
    movs r2, #1
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x18
    lsrs r0, r1, #0x18
    cmp r0, #0
    beq .L08001712
    ldr r0, .L080017B0 @ =gBg0Tm
    ldr r2, .L080017B4 @ =gBgMapVramTable
    ldr r1, [r2]
    movs r2, #0x80
    lsls r2, r2, #2
    bl CpuFastSet
.L08001712:
    ldr r0, .L080017AC @ =0x0300000C
    ldrb r1, [r0]
    movs r2, #2
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x18
    lsrs r0, r1, #0x18
    cmp r0, #0
    beq .L08001734
    ldr r0, .L080017B8 @ =gBg1Tm
    ldr r2, .L080017B4 @ =gBgMapVramTable
    ldr r1, [r2, #4]
    movs r2, #0x80
    lsls r2, r2, #2
    bl CpuFastSet
.L08001734:
    ldr r0, .L080017AC @ =0x0300000C
    ldrb r1, [r0]
    movs r2, #4
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x18
    lsrs r0, r1, #0x18
    cmp r0, #0
    beq .L08001756
    ldr r0, .L080017BC @ =gBg2Tm
    ldr r2, .L080017B4 @ =gBgMapVramTable
    ldr r1, [r2, #8]
    movs r2, #0x80
    lsls r2, r2, #2
    bl CpuFastSet
.L08001756:
    ldr r0, .L080017AC @ =0x0300000C
    ldrb r1, [r0]
    movs r2, #8
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x18
    lsrs r0, r1, #0x18
    cmp r0, #0
    beq .L08001778
    ldr r0, .L080017C0 @ =gBg3Tm
    ldr r2, .L080017B4 @ =gBgMapVramTable
    ldr r1, [r2, #0xc]
    movs r2, #0x80
    lsls r2, r2, #2
    bl CpuFastSet
.L08001778:
    ldr r0, .L080017AC @ =0x0300000C
    movs r1, #0
    strb r1, [r0]
    ldr r0, .L080017C4 @ =0x0300000D
    movs r1, #0
    ldrsb r1, [r0, r1]
    cmp r1, #1
    bne .L08001804
    ldr r0, .L080017C4 @ =0x0300000D
    movs r1, #0
    strb r1, [r0]
    ldr r1, .L080017C8 @ =gDispIo
    adds r0, r1, #0
    adds r1, #0x68
    movs r0, #0
    ldrsb r0, [r1, r0]
    cmp r0, #0
    bne .L080017D0
    ldr r0, .L080017CC @ =gPal
    movs r1, #0xa0
    lsls r1, r1, #0x13
    movs r2, #0x80
    lsls r2, r2, #1
    bl CpuFastSet
    b .L08001804
    .align 2, 0
.L080017AC: .4byte 0x0300000C
.L080017B0: .4byte gBg0Tm
.L080017B4: .4byte gBgMapVramTable
.L080017B8: .4byte gBg1Tm
.L080017BC: .4byte gBg2Tm
.L080017C0: .4byte gBg3Tm
.L080017C4: .4byte 0x0300000D
.L080017C8: .4byte gDispIo
.L080017CC: .4byte gPal
.L080017D0:
    ldr r1, .L080017F0 @ =gDispIo
    adds r0, r1, #0
    adds r1, #0x68
    movs r0, #0
    ldrsb r0, [r1, r0]
    cmp r0, #0
    ble .L080017F4
    ldr r1, .L080017F0 @ =gDispIo
    adds r0, r1, #0
    adds r1, #0x68
    movs r2, #0
    ldrsb r2, [r1, r2]
    adds r0, r2, #0
    bl func_0800155C
    b .L08001804
    .align 2, 0
.L080017F0: .4byte gDispIo
.L080017F4:
    ldr r1, .L0800180C @ =gDispIo
    adds r0, r1, #0
    adds r1, #0x68
    movs r2, #0
    ldrsb r2, [r1, r2]
    adds r0, r2, #0
    bl func_08001624
.L08001804:
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800180C: .4byte gDispIo
    func_end func_080016EC

    thumb_func_start TmFill
TmFill: @ 0x08001810
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r1, [r7, #4]
    lsls r0, r1, #0x10
    ldr r1, [r7, #4]
    adds r0, r1, r0
    str r0, [r7, #4]
    ldr r0, [r7, #4]
    str r0, [r7, #8]
    adds r0, r7, #0
    adds r0, #8
    ldr r2, .L0800183C @ =0x01000200
    ldr r1, [r7]
    bl CpuFastSet
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800183C: .4byte 0x01000200
    func_end TmFill

    thumb_func_start SetBlankChr
SetBlankChr: @ 0x08001840
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    adds r1, r0, #0
    lsls r0, r1, #5
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r1, r0, r2
    movs r0, #0
    movs r2, #0x20
    bl RegisterDataFill
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    func_end SetBlankChr

    thumb_func_start SetOnVBlank
SetOnVBlank: @ 0x08001864
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    cmp r0, #0
    beq .L080018A0
    ldr r0, .L08001898 @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #8
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    movs r0, #0
    ldr r1, [r7]
    bl SetIrqFunc
    ldr r0, .L0800189C @ =0x04000200
    ldr r1, .L0800189C @ =0x04000200
    ldrh r2, [r1]
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    b .L080018BC
    .align 2, 0
.L08001898: .4byte gDispIo
.L0800189C: .4byte 0x04000200
.L080018A0:
    ldr r0, .L080018C4 @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #0xf7
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    ldr r0, .L080018C8 @ =0x04000200
    ldr r1, .L080018C8 @ =0x04000200
    ldrh r2, [r1]
    ldr r3, .L080018CC @ =0x0000FFFE
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    strh r2, [r0]
.L080018BC:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080018C4: .4byte gDispIo
.L080018C8: .4byte 0x04000200
.L080018CC: .4byte 0x0000FFFE
    func_end SetOnVBlank

    thumb_func_start func_080018D0
func_080018D0: @ 0x080018D0
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    cmp r0, #0
    beq .L0800190C
    ldr r0, .L08001904 @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #0x20
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    movs r0, #2
    ldr r1, [r7]
    bl SetIrqFunc
    ldr r0, .L08001908 @ =0x04000200
    ldr r1, .L08001908 @ =0x04000200
    ldrh r2, [r1]
    movs r3, #4
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    b .L08001934
    .align 2, 0
.L08001904: .4byte gDispIo
.L08001908: .4byte 0x04000200
.L0800190C:
    ldr r0, .L0800193C @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #0xdf
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    ldr r0, .L08001940 @ =0x04000200
    ldr r1, .L08001940 @ =0x04000200
    ldrh r2, [r1]
    ldr r3, .L08001944 @ =0x0000FFFB
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    ldr r0, .L0800193C @ =gDispIo
    ldrb r1, [r0, #5]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #5]
.L08001934:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800193C: .4byte gDispIo
.L08001940: .4byte 0x04000200
.L08001944: .4byte 0x0000FFFB
    func_end func_080018D0

    thumb_func_start func_08001948
func_08001948: @ 0x08001948
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    adds r0, r7, #4
    ldr r1, .L0800198C @ =0x04000004
    ldrh r2, [r1]
    strh r2, [r0]
    adds r0, r7, #4
    adds r1, r7, #4
    ldrh r2, [r1]
    movs r3, #0xff
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    adds r0, r7, #4
    adds r1, r7, #4
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #8
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r1, r2
    adds r2, r1, #0
    strh r2, [r0]
    ldr r0, .L0800198C @ =0x04000004
    adds r1, r7, #4
    ldrh r2, [r1]
    strh r2, [r0]
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800198C: .4byte 0x04000004
    func_end func_08001948

    thumb_func_start func_08001990
func_08001990: @ 0x08001990
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L080019B4 @ =gDispIo
    ldr r2, [r7]
    adds r1, r2, #0
    ldrb r2, [r0, #5]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #5]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080019B4: .4byte gDispIo
    func_end func_08001990

    thumb_func_start func_080019B8
func_080019B8: @ 0x080019B8
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L080019D0 @ =gMainFunc
    ldr r1, [r7]
    str r1, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080019D0: .4byte gMainFunc
    func_end func_080019B8

    thumb_func_start RunMainFunc
RunMainFunc: @ 0x080019D4
    push {r4, r7, lr}
    mov r7, sp
    ldr r0, .L080019F0 @ =gMainFunc
    ldr r1, [r0]
    cmp r1, #0
    beq .L080019E8
    ldr r0, .L080019F0 @ =gMainFunc
    ldr r4, [r0]
    bl _call_via_r4
.L080019E8:
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080019F0: .4byte gMainFunc
    func_end RunMainFunc

    thumb_func_start func_080019F4
func_080019F4: @ 0x080019F4
    push {r4, r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    adds r0, r1, #0
    adds r1, r7, #4
    strh r0, [r1]
    ldr r0, [r7]
    ldr r1, [r7]
    ldrh r2, [r0, #0xa]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #4]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0xa]
    ldr r0, [r7]
    adds r1, r7, #4
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r0, [r7]
    ldr r1, [r7]
    ldr r2, [r7]
    ldr r3, [r7]
    ldrh r2, [r2, #4]
    ldrh r3, [r3, #0xa]
    eors r2, r3
    ldr r3, [r7]
    ldrh r3, [r3, #4]
    adds r4, r3, #0
    ands r2, r4
    ldrh r3, [r1, #6]
    movs r4, #0
    ands r3, r4
    adds r4, r3, #0
    adds r3, r2, #0
    orrs r4, r3
    adds r3, r4, #0
    strh r3, [r1, #6]
    adds r1, r2, #0
    movs r2, #0
    bics r1, r2
    ldrh r2, [r0, #8]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #8]
    ldr r0, [r7]
    ldrh r1, [r0, #8]
    cmp r1, #0
    beq .L08001A88
    ldr r0, [r7]
    ldr r1, [r7]
    ldrh r2, [r0, #0xc]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #4]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0xc]
.L08001A88:
    ldr r0, [r7]
    ldrh r1, [r0, #0xe]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #0xe]
    ldr r0, [r7]
    ldrh r1, [r0, #4]
    cmp r1, #0
    bne .L08001AD0
    ldr r0, [r7]
    ldrh r1, [r0, #0xc]
    cmp r1, #0
    beq .L08001AD0
    ldr r0, [r7]
    ldr r1, [r7]
    ldrh r2, [r1, #0xa]
    ldr r3, .L08001B34 @ =0x00000303
    adds r1, r2, #0
    ands r1, r3
    ldrh r0, [r0, #0xc]
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    cmp r0, r1
    bne .L08001AD0
    ldr r0, [r7]
    ldr r1, [r7]
    ldrh r2, [r0, #0xe]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #0xa]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0xe]
.L08001AD0:
    ldr r0, [r7]
    ldrh r1, [r0, #4]
    cmp r1, #0
    beq .L08001B38
    ldr r0, [r7]
    ldr r1, [r7]
    ldrh r0, [r0, #4]
    ldrh r1, [r1, #0xa]
    cmp r0, r1
    bne .L08001B38
    ldr r1, [r7]
    ldr r0, [r7]
    ldr r1, [r7]
    ldrb r2, [r1, #2]
    subs r1, r2, #1
    ldrb r2, [r0, #2]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0, #2]
    ldr r0, [r7]
    ldrb r1, [r0, #2]
    cmp r1, #0
    bne .L08001B32
    ldr r0, [r7]
    ldr r1, [r7]
    ldrh r2, [r0, #6]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #4]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #6]
    ldr r0, [r7]
    ldr r1, [r7]
    ldrb r2, [r0, #2]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrb r1, [r1, #1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0, #2]
.L08001B32:
    b .L08001B4E
    .align 2, 0
.L08001B34: .4byte 0x00000303
.L08001B38:
    ldr r0, [r7]
    ldr r1, [r7]
    ldrb r2, [r0, #2]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrb r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0, #2]
.L08001B4E:
    ldr r0, [r7]
    ldr r1, [r7]
    ldr r2, [r7]
    ldrh r1, [r1, #4]
    ldrh r2, [r2, #0x10]
    eors r1, r2
    ldr r2, [r7]
    ldrh r2, [r2, #4]
    adds r3, r2, #0
    ands r1, r3
    ldrh r2, [r0, #0x10]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x10]
    adds r0, r7, #4
    ldrh r1, [r0]
    ldr r2, .L08001B94 @ =0x000003F3
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    asrs r0, r1, #0x10
    cmp r0, #0
    beq .L08001B98
    ldr r0, [r7]
    ldrh r1, [r0, #0x12]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #0x12]
    b .L08001BBC
    .align 2, 0
.L08001B94: .4byte 0x000003F3
.L08001B98:
    ldr r0, [r7]
    ldrh r1, [r0, #0x12]
    ldr r0, .L08001BC4 @ =0x0000FFFE
    cmp r1, r0
    bhi .L08001BBC
    ldr r1, [r7]
    ldr r0, [r7]
    ldr r1, [r7]
    ldrh r2, [r1, #0x12]
    adds r1, r2, #1
    ldrh r2, [r0, #0x12]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x12]
.L08001BBC:
    add sp, #8
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001BC4: .4byte 0x0000FFFE
    func_end func_080019F4

    thumb_func_start RefreshKeySt
RefreshKeySt: @ 0x08001BC8
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08001C14 @ =0x04000130
    ldrh r1, [r0]
    mvns r0, r1
    adds r2, r0, #0
    lsls r1, r2, #0x10
    lsrs r0, r1, #0x10
    str r0, [r7, #4]
    ldr r0, [r7, #4]
    lsls r1, r0, #0x16
    lsrs r0, r1, #0x16
    str r0, [r7, #4]
    ldr r0, [r7, #4]
    movs r1, #0xf
    ands r0, r1
    cmp r0, #0xf
    beq .L08001BFC
    ldr r0, .L08001C18 @ =0x0300000E
    ldrh r1, [r0]
    mvns r0, r1
    ldr r1, [r7, #4]
    ands r0, r1
    str r0, [r7, #4]
.L08001BFC:
    ldr r1, [r7, #4]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    asrs r1, r2, #0x10
    ldr r0, [r7]
    bl func_080019F4
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001C14: .4byte 0x04000130
.L08001C18: .4byte 0x0300000E
    func_end RefreshKeySt

    thumb_func_start func_08001C1C
func_08001C1C: @ 0x08001C1C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    ldrh r1, [r0, #8]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #8]
    ldr r0, [r7]
    ldrh r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #6]
    ldr r0, [r7]
    ldrh r1, [r0, #4]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #4]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08001C1C

    thumb_func_start InitKeySt
InitKeySt: @ 0x08001C50
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    ldrb r1, [r0]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #0xc
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0]
    ldr r0, [r7]
    ldrb r1, [r0, #1]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #4
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, [r7]
    ldrh r1, [r0, #0xa]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #0xa]
    ldr r0, [r7]
    ldrh r1, [r0, #4]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #4]
    ldr r0, [r7]
    ldrh r1, [r0, #8]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #8]
    ldr r0, [r7]
    ldrb r1, [r0, #2]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #2]
    ldr r0, [r7]
    ldrh r1, [r0, #0x12]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #0x12]
    ldr r0, .L08001CCC @ =0x0300000E
    movs r1, #0
    strh r1, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001CCC: .4byte 0x0300000E
    func_end InitKeySt

    thumb_func_start func_08001CD0
func_08001CD0: @ 0x08001CD0
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08001CE8 @ =0x0300000E
    ldr r1, [r7]
    adds r2, r1, #0
    strh r2, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001CE8: .4byte 0x0300000E
    func_end func_08001CD0

    thumb_func_start func_08001CEC
func_08001CEC: @ 0x08001CEC
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r1, .L08001D50 @ =gKeys
    ldr r0, [r1]
    ldr r1, [r7]
    adds r2, r1, #0
    adds r1, #0x64
    ldrh r2, [r0, #8]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #8]
    ldr r1, .L08001D50 @ =gKeys
    ldr r0, [r1]
    ldr r1, [r7]
    adds r2, r1, #0
    adds r1, #0x64
    ldrh r2, [r0, #6]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #6]
    ldr r1, .L08001D50 @ =gKeys
    ldr r0, [r1]
    ldr r1, [r7]
    adds r2, r1, #0
    adds r1, #0x64
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001D50: .4byte gKeys
    func_end func_08001CEC

    thumb_func_start func_08001D54
func_08001D54: @ 0x08001D54
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    ldr r1, .L08001D88 @ =0x08B857FC
    adds r0, r1, #0
    movs r1, #1
    bl SpawnProc
    str r0, [r7, #4]
    ldr r1, [r7, #4]
    ldr r2, [r7]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x64
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001D88: .4byte 0x08B857FC
    func_end func_08001D54

    thumb_func_start SetBgOffset
SetBgOffset: @ 0x08001D8C
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    adds r3, r0, #0
    adds r0, r2, #0
    adds r2, r7, #0
    strh r3, [r2]
    adds r2, r7, #2
    strh r1, [r2]
    adds r1, r7, #4
    strh r0, [r1]
    adds r1, r7, #0
    ldrh r0, [r1]
    cmp r0, #1
    beq .L08001DF0
    cmp r0, #1
    bgt .L08001DB4
    cmp r0, #0
    beq .L08001DBE
    b .L08001E8C
.L08001DB4:
    cmp r0, #2
    beq .L08001E24
    cmp r0, #3
    beq .L08001E58
    b .L08001E8C
.L08001DBE:
    ldr r0, .L08001DEC @ =gDispIo
    adds r1, r7, #2
    ldrh r2, [r0, #0x1c]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x1c]
    ldr r0, .L08001DEC @ =gDispIo
    adds r1, r7, #4
    ldrh r2, [r0, #0x1e]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x1e]
    b .L08001E8C
    .align 2, 0
.L08001DEC: .4byte gDispIo
.L08001DF0:
    ldr r0, .L08001E20 @ =gDispIo
    adds r1, r7, #2
    ldrh r2, [r0, #0x20]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x20]
    ldr r0, .L08001E20 @ =gDispIo
    adds r1, r7, #4
    ldrh r2, [r0, #0x22]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x22]
    b .L08001E8C
    .align 2, 0
.L08001E20: .4byte gDispIo
.L08001E24:
    ldr r0, .L08001E54 @ =gDispIo
    adds r1, r7, #2
    ldrh r2, [r0, #0x24]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x24]
    ldr r0, .L08001E54 @ =gDispIo
    adds r1, r7, #4
    ldrh r2, [r0, #0x26]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x26]
    b .L08001E8C
    .align 2, 0
.L08001E54: .4byte gDispIo
.L08001E58:
    ldr r0, .L08001E88 @ =gDispIo
    adds r1, r7, #2
    ldrh r2, [r0, #0x28]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x28]
    ldr r0, .L08001E88 @ =gDispIo
    adds r1, r7, #4
    ldrh r2, [r0, #0x2a]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0x2a]
    b .L08001E8C
    .align 2, 0
.L08001E88: .4byte gDispIo
.L08001E8C:
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    func_end SetBgOffset

    thumb_func_start func_08001E94
func_08001E94: @ 0x08001E94
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08001EBC @ =0x03000014
    ldr r1, .L08001EC0 @ =0x03000015
    movs r2, #0
    strb r2, [r1]
    movs r1, #0
    strb r1, [r0]
    ldr r1, .L08001EC4 @ =gBg0Tm
    adds r0, r1, #0
    movs r1, #0
    bl TmFill
    movs r0, #1
    bl EnableBgSync
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001EBC: .4byte 0x03000014
.L08001EC0: .4byte 0x03000015
.L08001EC4: .4byte gBg0Tm
    func_end func_08001E94

    thumb_func_start func_08001EC8
func_08001EC8: @ 0x08001EC8
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    adds r2, r0, #0
    adds r0, r1, #0
    adds r1, r7, #0
    strb r2, [r1]
    adds r1, r7, #1
    strb r0, [r1]
    ldr r0, .L08001EF4 @ =0x03000014
    adds r1, r7, #0
    ldrb r2, [r1]
    strb r2, [r0]
    ldr r0, .L08001EF8 @ =0x03000015
    adds r1, r7, #1
    ldrb r2, [r1]
    strb r2, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08001EF4: .4byte 0x03000014
.L08001EF8: .4byte 0x03000015
    func_end func_08001EC8

    thumb_func_start func_08001EFC
func_08001EFC: @ 0x08001EFC
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r0, .L08001F14 @ =0x0000027F
    str r0, [r7, #8]
.L08001F0A:
    ldr r0, [r7, #8]
    cmp r0, #0
    bge .L08001F18
    b .L08001F32
    .align 2, 0
.L08001F14: .4byte 0x0000027F
.L08001F18:
    ldr r0, [r7]
    adds r1, r7, #4
    ldr r2, [r1]
    ldrh r3, [r2]
    strh r3, [r0]
    adds r2, #2
    str r2, [r1]
    adds r0, #2
    str r0, [r7]
    ldr r0, [r7, #8]
    subs r1, r0, #1
    str r1, [r7, #8]
    b .L08001F0A
.L08001F32:
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08001EFC

    thumb_func_start func_08001F3C
func_08001F3C: @ 0x08001F3C
    push {r4, r5, r7, lr}
    sub sp, #0x18
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    adds r1, r2, #0
    adds r0, r3, #0
    adds r2, r7, #0
    adds r2, #8
    strb r1, [r2]
    adds r1, r7, #0
    adds r1, #9
    strb r0, [r1]
    ldr r0, [r7, #4]
    adds r1, r0, #2
    str r1, [r7, #0xc]
    adds r0, r7, #0
    adds r0, #0x14
    ldr r1, [r7, #4]
    ldr r2, [r1]
    adds r1, r2, #0
    strb r1, [r0]
    adds r0, r7, #0
    adds r0, #0x15
    ldr r1, [r7, #4]
    ldr r2, [r1]
    lsrs r1, r2, #8
    adds r2, r1, #0
    strb r2, [r0]
    adds r0, r7, #0
    adds r0, #0x17
    adds r1, r7, #0
    adds r1, #0x15
    ldrb r2, [r1]
    strb r2, [r0]
.L08001F82:
    adds r0, r7, #0
    adds r0, #0x17
    movs r1, #0
    ldrsb r1, [r0, r1]
    cmp r1, #0
    bge .L08001F90
    b .L0800200E
.L08001F90:
    adds r1, r7, #0
    adds r1, #0x17
    movs r0, #0
    ldrsb r0, [r1, r0]
    adds r1, r7, #0
    adds r1, #9
    ldrb r2, [r1]
    lsls r0, r2
    ldr r1, [r7]
    adds r0, r1, r0
    str r0, [r7, #0x10]
    adds r0, r7, #0
    adds r0, #0x16
    adds r1, r7, #0
    adds r1, #0x14
    ldrb r2, [r1]
    strb r2, [r0]
.L08001FB2:
    adds r0, r7, #0
    adds r0, #0x16
    movs r1, #0
    ldrsb r1, [r0, r1]
    cmp r1, #0
    bge .L08001FC0
    b .L08001FF8
.L08001FC0:
    adds r0, r7, #0
    adds r0, #0x10
    ldr r1, [r0]
    adds r2, r7, #0
    adds r2, #0xc
    ldr r3, [r2]
    adds r4, r7, #0
    adds r4, #8
    ldrb r5, [r3]
    ldrb r4, [r4]
    adds r5, r5, r4
    adds r4, r5, #0
    strb r4, [r1]
    adds r3, #1
    str r3, [r2]
    adds r1, #1
    str r1, [r0]
    adds r1, r7, #0
    adds r1, #0x16
    adds r0, r7, #0
    adds r0, #0x16
    adds r1, r7, #0
    adds r1, #0x16
    ldrb r2, [r1]
    subs r1, r2, #1
    adds r2, r1, #0
    strb r2, [r0]
    b .L08001FB2
.L08001FF8:
    adds r1, r7, #0
    adds r1, #0x17
    adds r0, r7, #0
    adds r0, #0x17
    adds r1, r7, #0
    adds r1, #0x17
    ldrb r2, [r1]
    subs r1, r2, #1
    adds r2, r1, #0
    strb r2, [r0]
    b .L08001F82
.L0800200E:
    add sp, #0x18
    pop {r4, r5, r7}
    pop {r0}
    bx r0
    func_end func_08001F3C

    thumb_func_start func_08002018
func_08002018: @ 0x08002018
    push {r7, lr}
    sub sp, #0x24
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r0, [r7, #4]
    ldrh r1, [r0]
    movs r2, #0xff
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    asrs r0, r1, #0x10
    str r0, [r7, #0xc]
    ldr r0, [r7, #4]
    movs r2, #0
    ldrsh r1, [r0, r2]
    asrs r0, r1, #8
    adds r1, r0, #0
    movs r2, #0xff
    adds r0, r1, #0
    ands r0, r2
    adds r2, r0, #0
    lsls r1, r2, #0x10
    asrs r0, r1, #0x10
    str r0, [r7, #0x10]
    movs r0, #0
    str r0, [r7, #0x1c]
    ldr r0, [r7, #4]
    adds r1, r0, #2
    str r1, [r7, #4]
    movs r0, #0
    str r0, [r7, #0x18]
.L0800205C:
    ldr r0, [r7, #0x18]
    ldr r1, [r7, #0x10]
    cmp r0, r1
    blt .L08002066
    b .L080020B4
.L08002066:
    ldr r1, [r7, #0x18]
    lsls r0, r1, #5
    adds r1, r0, #0
    lsls r0, r1, #1
    ldr r1, [r7]
    adds r0, r1, r0
    str r0, [r7, #0x20]
    movs r0, #0
    str r0, [r7, #0x14]
.L08002078:
    ldr r0, [r7, #0x14]
    ldr r1, [r7, #0xc]
    cmp r0, r1
    blt .L08002082
    b .L080020AC
.L08002082:
    adds r0, r7, #4
    ldr r1, [r0]
    movs r3, #0
    ldrsh r2, [r1, r3]
    ldr r3, [r7, #0x1c]
    adds r2, r3, r2
    str r2, [r7, #0x1c]
    adds r1, #2
    str r1, [r0]
    adds r0, r7, #0
    adds r0, #0x20
    ldr r1, [r0]
    ldr r3, [r7, #0x1c]
    adds r2, r3, #0
    strh r2, [r1]
    adds r1, #2
    str r1, [r0]
    ldr r0, [r7, #0x14]
    adds r1, r0, #1
    str r1, [r7, #0x14]
    b .L08002078
.L080020AC:
    ldr r0, [r7, #0x18]
    adds r1, r0, #1
    str r1, [r7, #0x18]
    b .L0800205C
.L080020B4:
    add sp, #0x24
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08002018

    thumb_func_start func_080020BC
func_080020BC: @ 0x080020BC
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    movs r0, #0x1f
    str r0, [r7]
.L080020C6:
    ldr r0, [r7]
    cmp r0, #0
    bge .L080020CE
    b .L080020EC
.L080020CE:
    ldr r0, .L080020E8 @ =gFadeComponentStep
    ldr r1, [r7]
    adds r0, r0, r1
    ldrb r1, [r0]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0]
    ldr r0, [r7]
    subs r1, r0, #1
    str r1, [r7]
    b .L080020C6
    .align 2, 0
.L080020E8: .4byte gFadeComponentStep
.L080020EC:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    func_end func_080020BC

    thumb_func_start func_080020F4
func_080020F4: @ 0x080020F4
    push {r4, r5, r7, lr}
    sub sp, #0x20
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r0, [r7, #0xc]
    cmp r0, #0
    bge .L0800210C
    movs r0, #0x20
    b .L0800210E
.L0800210C:
    movs r0, #0
.L0800210E:
    str r0, [r7, #0x18]
    ldr r0, [r7, #4]
    adds r2, r0, #0
    lsls r1, r2, #1
    adds r1, r1, r0
    lsls r0, r1, #4
    str r0, [r7, #0x1c]
    movs r0, #0
    str r0, [r7, #0x10]
.L08002120:
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #8]
    cmp r0, r1
    blt .L0800212A
    b .L08002210
.L0800212A:
    ldr r0, .L08002154 @ =gFadeComponentStep
    ldr r1, [r7, #4]
    ldr r2, [r7, #0x10]
    adds r1, r1, r2
    adds r0, r0, r1
    ldr r2, [r7, #0xc]
    adds r1, r2, #0
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0]
    movs r0, #0
    str r0, [r7, #0x14]
.L0800214A:
    ldr r0, [r7, #0x14]
    cmp r0, #0xf
    ble .L08002158
    b .L08002208
    .align 2, 0
.L08002154: .4byte gFadeComponentStep
.L08002158:
    ldr r2, .L08002204 @ =gFadeComponents
    adds r0, r7, #0
    adds r0, #0x1c
    ldr r1, [r0]
    adds r3, r1, #0
    adds r2, r2, r3
    ldr r3, [r7]
    ldrh r4, [r3]
    adds r3, r4, #0
    movs r4, #0x1f
    ands r3, r4
    ldr r5, [r7, #0x18]
    adds r4, r5, #0
    adds r5, r3, #0
    adds r3, r4, r5
    ldrb r4, [r2]
    movs r5, #0
    ands r4, r5
    adds r5, r4, #0
    adds r4, r5, #0
    orrs r4, r3
    adds r3, r4, #0
    strb r3, [r2]
    adds r1, #1
    str r1, [r0]
    ldr r2, .L08002204 @ =gFadeComponents
    adds r0, r7, #0
    adds r0, #0x1c
    ldr r1, [r0]
    adds r3, r1, #0
    adds r2, r2, r3
    ldr r3, [r7]
    ldrh r4, [r3]
    lsrs r3, r4, #5
    adds r4, r3, #0
    movs r5, #0x1f
    adds r3, r4, #0
    ands r3, r5
    ldr r5, [r7, #0x18]
    adds r4, r5, #0
    adds r5, r3, #0
    adds r3, r4, r5
    ldrb r4, [r2]
    movs r5, #0
    ands r4, r5
    adds r5, r4, #0
    adds r4, r5, #0
    orrs r4, r3
    adds r3, r4, #0
    strb r3, [r2]
    adds r1, #1
    str r1, [r0]
    ldr r2, .L08002204 @ =gFadeComponents
    adds r0, r7, #0
    adds r0, #0x1c
    ldr r1, [r0]
    adds r3, r1, #0
    adds r2, r2, r3
    ldr r3, [r7]
    ldrh r4, [r3]
    lsrs r3, r4, #0xa
    adds r4, r3, #0
    movs r5, #0x1f
    adds r3, r4, #0
    ands r3, r5
    ldr r5, [r7, #0x18]
    adds r4, r5, #0
    adds r5, r3, #0
    adds r3, r4, r5
    ldrb r4, [r2]
    movs r5, #0
    ands r4, r5
    adds r5, r4, #0
    adds r4, r5, #0
    orrs r4, r3
    adds r3, r4, #0
    strb r3, [r2]
    adds r1, #1
    str r1, [r0]
    ldr r0, [r7]
    adds r1, r0, #2
    str r1, [r7]
    ldr r0, [r7, #0x14]
    adds r1, r0, #1
    str r1, [r7, #0x14]
    b .L0800214A
    .align 2, 0
.L08002204: .4byte gFadeComponents
.L08002208:
    ldr r0, [r7, #0x10]
    adds r1, r0, #1
    str r1, [r7, #0x10]
    b .L08002120
.L08002210:
    add sp, #0x20
    pop {r4, r5, r7}
    pop {r0}
    bx r0
    func_end func_080020F4

    thumb_func_start func_08002218
func_08002218: @ 0x08002218
    push {r4, r5, r7, lr}
    sub sp, #0x20
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r0, [r7]
    adds r1, r0, #0
    lsls r0, r1, #4
    str r0, [r7, #0x18]
    ldr r0, [r7, #0x18]
    adds r1, r0, #0
    lsls r0, r1, #1
    ldr r1, .L08002248 @ =gPal
    adds r0, r1, r0
    str r0, [r7, #0x1c]
    movs r0, #0
    str r0, [r7, #0x10]
.L0800223E:
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #4]
    cmp r0, r1
    blt .L0800224C
    b .L08002330
    .align 2, 0
.L08002248: .4byte gPal
.L0800224C:
    ldr r0, .L08002274 @ =gFadeComponentStep
    ldr r1, [r7]
    ldr r2, [r7, #0x10]
    adds r1, r1, r2
    adds r0, r0, r1
    ldr r2, [r7, #0xc]
    adds r1, r2, #0
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0]
    movs r0, #0
    str r0, [r7, #0x14]
.L0800226C:
    ldr r0, [r7, #0x14]
    cmp r0, #0xf
    ble .L08002278
    b .L08002328
    .align 2, 0
.L08002274: .4byte gFadeComponentStep
.L08002278:
    ldr r2, .L08002324 @ =gFadeComponents
    adds r0, r7, #0
    adds r0, #0x18
    ldr r1, [r0]
    adds r3, r1, #0
    adds r2, r2, r3
    ldr r3, [r7, #0x1c]
    ldrh r4, [r3]
    adds r3, r4, #0
    movs r4, #0x1f
    ands r3, r4
    ldr r5, [r7, #8]
    adds r4, r5, #0
    adds r5, r3, #0
    adds r3, r4, r5
    ldrb r4, [r2]
    movs r5, #0
    ands r4, r5
    adds r5, r4, #0
    adds r4, r5, #0
    orrs r4, r3
    adds r3, r4, #0
    strb r3, [r2]
    adds r1, #1
    str r1, [r0]
    ldr r2, .L08002324 @ =gFadeComponents
    adds r0, r7, #0
    adds r0, #0x18
    ldr r1, [r0]
    adds r3, r1, #0
    adds r2, r2, r3
    ldr r3, [r7, #0x1c]
    ldrh r4, [r3]
    lsrs r3, r4, #5
    adds r4, r3, #0
    movs r5, #0x1f
    adds r3, r4, #0
    ands r3, r5
    ldr r5, [r7, #8]
    adds r4, r5, #0
    adds r5, r3, #0
    adds r3, r4, r5
    ldrb r4, [r2]
    movs r5, #0
    ands r4, r5
    adds r5, r4, #0
    adds r4, r5, #0
    orrs r4, r3
    adds r3, r4, #0
    strb r3, [r2]
    adds r1, #1
    str r1, [r0]
    ldr r2, .L08002324 @ =gFadeComponents
    adds r0, r7, #0
    adds r0, #0x18
    ldr r1, [r0]
    adds r3, r1, #0
    adds r2, r2, r3
    ldr r3, [r7, #0x1c]
    ldrh r4, [r3]
    lsrs r3, r4, #0xa
    adds r4, r3, #0
    movs r5, #0x1f
    adds r3, r4, #0
    ands r3, r5
    ldr r5, [r7, #8]
    adds r4, r5, #0
    adds r5, r3, #0
    adds r3, r4, r5
    ldrb r4, [r2]
    movs r5, #0
    ands r4, r5
    adds r5, r4, #0
    adds r4, r5, #0
    orrs r4, r3
    adds r3, r4, #0
    strb r3, [r2]
    adds r1, #1
    str r1, [r0]
    ldr r0, [r7, #0x1c]
    adds r1, r0, #2
    str r1, [r7, #0x1c]
    ldr r0, [r7, #0x14]
    adds r1, r0, #1
    str r1, [r7, #0x14]
    b .L0800226C
    .align 2, 0
.L08002324: .4byte gFadeComponents
.L08002328:
    ldr r0, [r7, #0x10]
    adds r1, r0, #1
    str r1, [r7, #0x10]
    b .L0800223E
.L08002330:
    add sp, #0x20
    pop {r4, r5, r7}
    pop {r0}
    bx r0
    func_end func_08002218

    thumb_func_start func_08002338
func_08002338: @ 0x08002338
    push {r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r0, [r7]
    str r0, [r7, #0xc]
.L08002348:
    ldr r0, [r7]
    ldr r1, [r7, #4]
    adds r0, r0, r1
    ldr r1, [r7, #0xc]
    cmp r1, r0
    blt .L08002356
    b .L0800237C
.L08002356:
    ldr r0, .L08002378 @ =gFadeComponentStep
    ldr r1, [r7, #0xc]
    adds r0, r0, r1
    ldr r2, [r7, #8]
    adds r1, r2, #0
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0]
    ldr r0, [r7, #0xc]
    adds r1, r0, #1
    str r1, [r7, #0xc]
    b .L08002348
    .align 2, 0
.L08002378: .4byte gFadeComponentStep
.L0800237C:
    add sp, #0x10
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08002338

    thumb_func_start func_08002384
func_08002384: @ 0x08002384
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    adds r1, r7, #0
    strb r0, [r1]
    movs r0, #0x1f
    str r0, [r7, #4]
.L08002392:
    ldr r0, [r7, #4]
    cmp r0, #0
    bge .L0800239A
    b .L080024B4
.L0800239A:
    ldr r0, .L080023C0 @ =gFadeComponentStep
    ldr r1, [r7, #4]
    adds r0, r0, r1
    adds r1, r7, #0
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrb r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    movs r0, #0
    str r0, [r7, #8]
.L080023B8:
    ldr r0, [r7, #8]
    cmp r0, #0xf
    ble .L080023C4
    b .L080024AC
    .align 2, 0
.L080023C0: .4byte gFadeComponentStep
.L080023C4:
    ldr r0, .L080024A4 @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r0, r0, r2
    ldr r1, .L080024A8 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    adds r1, r2, #0
    movs r2, #0x1f
    ands r1, r2
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x20
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L080024A4 @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #1
    adds r0, r0, r1
    ldr r1, .L080024A8 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #5
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x20
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L080024A4 @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #2
    adds r0, r0, r1
    ldr r1, .L080024A8 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #0xa
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x20
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, [r7, #8]
    adds r1, r0, #1
    str r1, [r7, #8]
    b .L080023B8
    .align 2, 0
.L080024A4: .4byte gFadeComponents
.L080024A8: .4byte gPal
.L080024AC:
    ldr r0, [r7, #4]
    subs r1, r0, #1
    str r1, [r7, #4]
    b .L08002392
.L080024B4:
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08002384

    thumb_func_start func_080024BC
func_080024BC: @ 0x080024BC
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    adds r1, r7, #0
    strb r0, [r1]
    movs r0, #0x1f
    str r0, [r7, #4]
.L080024CA:
    ldr r0, [r7, #4]
    cmp r0, #0
    bge .L080024D2
    b .L080025DC
.L080024D2:
    ldr r0, .L080024F8 @ =gFadeComponentStep
    ldr r1, [r7, #4]
    adds r0, r0, r1
    adds r1, r7, #0
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrb r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    movs r0, #0
    str r0, [r7, #8]
.L080024F0:
    ldr r0, [r7, #8]
    cmp r0, #0xf
    ble .L080024FC
    b .L080025D4
    .align 2, 0
.L080024F8: .4byte gFadeComponentStep
.L080024FC:
    ldr r0, .L080025CC @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r0, r0, r2
    ldr r1, .L080025D0 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    adds r1, r2, #0
    movs r2, #0x1f
    ands r1, r2
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L080025CC @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #1
    adds r0, r0, r1
    ldr r1, .L080025D0 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #5
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L080025CC @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #2
    adds r0, r0, r1
    ldr r1, .L080025D0 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #0xa
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, [r7, #8]
    adds r1, r0, #1
    str r1, [r7, #8]
    b .L080024F0
    .align 2, 0
.L080025CC: .4byte gFadeComponents
.L080025D0: .4byte gPal
.L080025D4:
    ldr r0, [r7, #4]
    subs r1, r0, #1
    str r1, [r7, #4]
    b .L080024CA
.L080025DC:
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end func_080024BC

    thumb_func_start func_080025E4
func_080025E4: @ 0x080025E4
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    adds r1, r7, #0
    strb r0, [r1]
    movs r0, #0x1f
    str r0, [r7, #4]
.L080025F2:
    ldr r0, [r7, #4]
    cmp r0, #0
    bge .L080025FA
    b .L08002714
.L080025FA:
    ldr r0, .L08002620 @ =gFadeComponentStep
    ldr r1, [r7, #4]
    adds r0, r0, r1
    adds r1, r7, #0
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrb r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    movs r0, #0
    str r0, [r7, #8]
.L08002618:
    ldr r0, [r7, #8]
    cmp r0, #0xf
    ble .L08002624
    b .L0800270C
    .align 2, 0
.L08002620: .4byte gFadeComponentStep
.L08002624:
    ldr r0, .L08002704 @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r0, r0, r2
    ldr r1, .L08002708 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    adds r1, r2, #0
    movs r2, #0x1f
    ands r1, r2
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x20
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L08002704 @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #1
    adds r0, r0, r1
    ldr r1, .L08002708 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #5
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x20
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L08002704 @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #2
    adds r0, r0, r1
    ldr r1, .L08002708 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #0xa
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x20
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, [r7, #8]
    adds r1, r0, #1
    str r1, [r7, #8]
    b .L08002618
    .align 2, 0
.L08002704: .4byte gFadeComponents
.L08002708: .4byte gPal
.L0800270C:
    ldr r0, [r7, #4]
    subs r1, r0, #1
    str r1, [r7, #4]
    b .L080025F2
.L08002714:
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end func_080025E4

    thumb_func_start func_0800271C
func_0800271C: @ 0x0800271C
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    adds r1, r7, #0
    strb r0, [r1]
    movs r0, #0x1f
    str r0, [r7, #4]
.L0800272A:
    ldr r0, [r7, #4]
    cmp r0, #0
    bge .L08002732
    b .L0800284C
.L08002732:
    ldr r0, .L08002758 @ =gFadeComponentStep
    ldr r1, [r7, #4]
    adds r0, r0, r1
    adds r1, r7, #0
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrb r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    movs r0, #0
    str r0, [r7, #8]
.L08002750:
    ldr r0, [r7, #8]
    cmp r0, #0xf
    ble .L0800275C
    b .L08002844
    .align 2, 0
.L08002758: .4byte gFadeComponentStep
.L0800275C:
    ldr r0, .L0800283C @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r0, r0, r2
    ldr r1, .L08002840 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    adds r1, r2, #0
    movs r2, #0x1f
    ands r1, r2
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x40
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L0800283C @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #1
    adds r0, r0, r1
    ldr r1, .L08002840 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #5
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x40
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L0800283C @ =gFadeComponents
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    adds r1, r1, r2
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #2
    adds r0, r0, r1
    ldr r1, .L08002840 @ =gPal
    ldr r2, [r7, #4]
    adds r3, r2, #0
    lsls r2, r3, #4
    ldr r3, [r7, #8]
    adds r2, r2, r3
    adds r3, r2, #0
    lsls r2, r3, #1
    adds r1, r1, r2
    ldrh r2, [r1]
    lsrs r1, r2, #0xa
    adds r2, r1, #0
    movs r3, #0x1f
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    adds r1, r2, #0
    adds r1, #0x40
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, [r7, #8]
    adds r1, r0, #1
    str r1, [r7, #8]
    b .L08002750
    .align 2, 0
.L0800283C: .4byte gFadeComponents
.L08002840: .4byte gPal
.L08002844:
    ldr r0, [r7, #4]
    subs r1, r0, #1
    str r1, [r7, #4]
    b .L0800272A
.L0800284C:
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end func_0800271C

    thumb_func_start func_08002854
func_08002854: @ 0x08002854
    push {r4, r7, lr}
    sub sp, #0x14
    mov r7, sp
    movs r0, #0x1f
    str r0, [r7]
.L0800285E:
    ldr r0, [r7]
    cmp r0, #0
    bge .L08002866
    b .L08002A60
.L08002866:
    ldr r0, .L08002878 @ =gFadeComponentStep
    ldr r1, [r7]
    adds r0, r0, r1
    movs r1, #0
    ldrsb r1, [r0, r1]
    cmp r1, #0
    bne .L0800287C
    b .L08002A58
    .align 2, 0
.L08002878: .4byte gFadeComponentStep
.L0800287C:
    movs r0, #0xf
    str r0, [r7, #4]
.L08002880:
    ldr r0, [r7, #4]
    cmp r0, #0
    bge .L08002888
    b .L08002A58
.L08002888:
    ldr r0, [r7]
    adds r1, r0, #0
    lsls r0, r1, #4
    ldr r1, [r7, #4]
    adds r0, r0, r1
    str r0, [r7, #0x10]
    ldr r0, .L08002A4C @ =gFadeComponents
    ldr r1, [r7, #0x10]
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r0, r0, r2
    ldr r1, .L08002A4C @ =gFadeComponents
    ldr r2, [r7, #0x10]
    adds r4, r2, #0
    lsls r3, r4, #1
    adds r3, r3, r2
    adds r1, r1, r3
    ldr r2, .L08002A50 @ =gFadeComponentStep
    ldr r3, [r7]
    adds r2, r2, r3
    ldrb r1, [r1]
    ldrb r2, [r2]
    adds r1, r1, r2
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L08002A4C @ =gFadeComponents
    ldr r1, [r7, #0x10]
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #1
    adds r0, r0, r1
    ldr r1, .L08002A4C @ =gFadeComponents
    ldr r2, [r7, #0x10]
    adds r4, r2, #0
    lsls r3, r4, #1
    adds r3, r3, r2
    adds r2, r3, #1
    adds r1, r1, r2
    ldr r2, .L08002A50 @ =gFadeComponentStep
    ldr r3, [r7]
    adds r2, r2, r3
    ldrb r1, [r1]
    ldrb r2, [r2]
    adds r1, r1, r2
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    ldr r0, .L08002A4C @ =gFadeComponents
    ldr r1, [r7, #0x10]
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    adds r1, r2, #2
    adds r0, r0, r1
    ldr r1, .L08002A4C @ =gFadeComponents
    ldr r2, [r7, #0x10]
    adds r4, r2, #0
    lsls r3, r4, #1
    adds r3, r3, r2
    adds r2, r3, #2
    adds r1, r1, r2
    ldr r2, .L08002A50 @ =gFadeComponentStep
    ldr r3, [r7]
    adds r2, r2, r3
    ldrb r1, [r1]
    ldrb r2, [r2]
    adds r1, r1, r2
    ldrb r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strb r1, [r0]
    adds r0, r7, #0
    adds r0, #8
    ldr r1, .L08002A4C @ =gFadeComponents
    ldr r2, [r7, #0x10]
    adds r4, r2, #0
    lsls r3, r4, #1
    adds r3, r3, r2
    adds r1, r1, r3
    movs r2, #0
    ldrsb r2, [r1, r2]
    adds r1, r2, #0
    adds r2, r1, #0
    subs r2, #0x20
    adds r1, r2, #0
    strh r1, [r0]
    adds r0, r7, #0
    adds r0, #8
    movs r2, #0
    ldrsh r1, [r0, r2]
    cmp r1, #0x1f
    ble .L0800296A
    adds r0, r7, #0
    adds r0, #8
    movs r1, #0x1f
    strh r1, [r0]
.L0800296A:
    adds r0, r7, #0
    adds r0, #8
    movs r2, #0
    ldrsh r1, [r0, r2]
    cmp r1, #0
    bge .L0800297E
    adds r0, r7, #0
    adds r0, #8
    movs r1, #0
    strh r1, [r0]
.L0800297E:
    adds r0, r7, #0
    adds r0, #0xa
    ldr r1, .L08002A4C @ =gFadeComponents
    ldr r2, [r7, #0x10]
    adds r4, r2, #0
    lsls r3, r4, #1
    adds r3, r3, r2
    adds r2, r3, #1
    adds r1, r1, r2
    movs r2, #0
    ldrsb r2, [r1, r2]
    adds r1, r2, #0
    adds r2, r1, #0
    subs r2, #0x20
    adds r1, r2, #0
    strh r1, [r0]
    adds r0, r7, #0
    adds r0, #0xa
    movs r2, #0
    ldrsh r1, [r0, r2]
    cmp r1, #0x1f
    ble .L080029B2
    adds r0, r7, #0
    adds r0, #0xa
    movs r1, #0x1f
    strh r1, [r0]
.L080029B2:
    adds r0, r7, #0
    adds r0, #0xa
    movs r2, #0
    ldrsh r1, [r0, r2]
    cmp r1, #0
    bge .L080029C6
    adds r0, r7, #0
    adds r0, #0xa
    movs r1, #0
    strh r1, [r0]
.L080029C6:
    adds r0, r7, #0
    adds r0, #0xc
    ldr r1, .L08002A4C @ =gFadeComponents
    ldr r2, [r7, #0x10]
    adds r4, r2, #0
    lsls r3, r4, #1
    adds r3, r3, r2
    adds r2, r3, #2
    adds r1, r1, r2
    movs r2, #0
    ldrsb r2, [r1, r2]
    adds r1, r2, #0
    adds r2, r1, #0
    subs r2, #0x20
    adds r1, r2, #0
    strh r1, [r0]
    adds r0, r7, #0
    adds r0, #0xc
    movs r2, #0
    ldrsh r1, [r0, r2]
    cmp r1, #0x1f
    ble .L080029FA
    adds r0, r7, #0
    adds r0, #0xc
    movs r1, #0x1f
    strh r1, [r0]
.L080029FA:
    adds r0, r7, #0
    adds r0, #0xc
    movs r2, #0
    ldrsh r1, [r0, r2]
    cmp r1, #0
    bge .L08002A0E
    adds r0, r7, #0
    adds r0, #0xc
    movs r1, #0
    strh r1, [r0]
.L08002A0E:
    ldr r0, .L08002A54 @ =gPal
    ldr r1, [r7, #0x10]
    adds r2, r1, #0
    lsls r1, r2, #1
    adds r0, r0, r1
    adds r1, r7, #0
    adds r1, #0xc
    ldrh r2, [r1]
    lsls r1, r2, #0xa
    adds r2, r7, #0
    adds r2, #0xa
    ldrh r3, [r2]
    lsls r2, r3, #5
    adds r1, r1, r2
    adds r2, r7, #0
    adds r2, #8
    ldrh r2, [r2]
    adds r1, r1, r2
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, [r7, #4]
    subs r1, r0, #1
    str r1, [r7, #4]
    b .L08002880
    .align 2, 0
.L08002A4C: .4byte gFadeComponents
.L08002A50: .4byte gFadeComponentStep
.L08002A54: .4byte gPal
.L08002A58:
    ldr r0, [r7]
    subs r1, r0, #1
    str r1, [r7]
    b .L0800285E
.L08002A60:
    bl EnablePalSync
    add sp, #0x14
    pop {r4, r7}
    pop {r0}
    bx r0
    func_end func_08002854

    thumb_func_start InitBgs
InitBgs: @ 0x08002A6C
    push {r4, r7, lr}
    sub sp, #0x24
    mov r7, sp
    str r0, [r7]
    adds r0, r7, #4
    adds r1, r7, #4
    ldr r2, .L08002AB4 @ =0x080C59AC
    adds r0, r1, #0
    adds r1, r2, #0
    movs r2, #0x18
    bl memcpy
    ldr r0, [r7]
    cmp r0, #0
    bne .L08002A8E
    adds r0, r7, #4
    str r0, [r7]
.L08002A8E:
    ldr r0, .L08002AB8 @ =0x0300287C
    movs r1, #0
    strh r1, [r0]
    ldr r0, .L08002ABC @ =0x03002880
    movs r1, #0
    strh r1, [r0]
    ldr r0, .L08002AC0 @ =0x03002884
    movs r1, #0
    strh r1, [r0]
    ldr r0, .L08002AC4 @ =0x03002888
    movs r1, #0
    strh r1, [r0]
    movs r0, #0
    str r0, [r7, #0x1c]
.L08002AAA:
    ldr r0, [r7, #0x1c]
    cmp r0, #3
    ble .L08002AC8
    b .L08002B40
    .align 2, 0
.L08002AB4: .4byte 0x080C59AC
.L08002AB8: .4byte 0x0300287C
.L08002ABC: .4byte 0x03002880
.L08002AC0: .4byte 0x03002884
.L08002AC4: .4byte 0x03002888
.L08002AC8:
    ldr r0, [r7, #0x1c]
    ldr r2, [r7]
    ldrh r1, [r2]
    adds r2, #2
    str r2, [r7]
    bl SetBgChrOffset
    ldr r0, [r7, #0x1c]
    ldr r2, [r7]
    ldrh r1, [r2]
    adds r2, #2
    str r2, [r7]
    bl func_08001478
    ldr r0, [r7, #0x1c]
    ldr r2, [r7]
    ldrh r1, [r2]
    adds r2, #2
    str r2, [r7]
    bl func_080014DC
    ldr r1, [r7, #0x1c]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    ldr r1, [r7, #0x1c]
    adds r0, r1, #0
    bl func_08002BE8
    adds r1, r0, #0
    adds r0, r1, #0
    movs r1, #0
    bl TmFill
    movs r0, #0
    str r0, [r7, #0x20]
    adds r4, r7, #0
    adds r4, #0x20
    ldr r1, [r7, #0x1c]
    adds r0, r1, #0
    bl GetBgChrOffset
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r1, r0, r2
    ldr r2, .L08002B3C @ =0x01000010
    adds r0, r4, #0
    bl CpuFastSet
    ldr r0, [r7, #0x1c]
    adds r1, r0, #1
    str r1, [r7, #0x1c]
    b .L08002AAA
    .align 2, 0
.L08002B3C: .4byte 0x01000010
.L08002B40:
    bl func_0801551C
    movs r0, #0xf
    bl EnableBgSync
    movs r0, #0
    bl func_0800322C
    ldr r0, .L08002BE0 @ =gPal
    ldrh r1, [r0]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0]
    bl EnablePalSync
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0]
    movs r2, #0x7f
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0]
    movs r2, #0xf8
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #0xdf
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #0xbf
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #0x7f
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #1
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #2
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #4
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #8
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    ldr r0, .L08002BE4 @ =gDispIo
    ldrb r1, [r0, #1]
    movs r2, #0x10
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #1]
    add sp, #0x24
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002BE0: .4byte gPal
.L08002BE4: .4byte gDispIo
    func_end InitBgs

    thumb_func_start func_08002BE8
func_08002BE8: @ 0x08002BE8
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08002C00 @ =0x08B85814
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #2
    adds r0, r0, r1
    ldr r1, [r0]
    adds r0, r1, #0
    b .L08002C04
    .align 2, 0
.L08002C00: .4byte 0x08B85814
.L08002C04:
    add sp, #4
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08002BE8

    thumb_func_start func_08002C0C
func_08002C0C: @ 0x08002C0C
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08002C18 @ =gUnk_02024C8C
    ldr r1, [r0]
    adds r0, r1, #0
    b .L08002C1C
    .align 2, 0
.L08002C18: .4byte gUnk_02024C8C
.L08002C1C:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08002C0C

    thumb_func_start func_08002C24
func_08002C24: @ 0x08002C24
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08002C30 @ =gUnk_02024C90
    ldr r1, [r0]
    adds r0, r1, #0
    b .L08002C34
    .align 2, 0
.L08002C30: .4byte gUnk_02024C90
.L08002C34:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08002C24

    thumb_func_start func_08002C3C
func_08002C3C: @ 0x08002C3C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08002C54 @ =gUnk_02024C8C
    ldr r1, [r7]
    str r1, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002C54: .4byte gUnk_02024C8C
    func_end func_08002C3C

    thumb_func_start func_08002C58
func_08002C58: @ 0x08002C58
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08002C70 @ =gUnk_02024C90
    ldr r1, [r7]
    str r1, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002C70: .4byte gUnk_02024C90
    func_end func_08002C58

    thumb_func_start func_08002C74
func_08002C74: @ 0x08002C74
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08002C84 @ =gUnk_02024C8C
    ldr r1, .L08002C88 @ =0x3CC35AA5
    str r1, [r0]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002C84: .4byte gUnk_02024C8C
.L08002C88: .4byte 0x3CC35AA5
    func_end func_08002C74

    thumb_func_start func_08002C8C
func_08002C8C: @ 0x08002C8C
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08002C9C @ =gUnk_02024C90
    ldr r1, .L08002CA0 @ =0x3CC35AA5
    str r1, [r0]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002C9C: .4byte gUnk_02024C90
.L08002CA0: .4byte 0x3CC35AA5
    func_end func_08002C8C

    thumb_func_start func_08002CA4
func_08002CA4: @ 0x08002CA4
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08002CB8 @ =gUnk_02024C8C
    ldr r1, [r0]
    ldr r0, .L08002CBC @ =0x3CC35AA5
    cmp r1, r0
    beq .L08002CC0
    movs r0, #0
    b .L08002CC4
    .align 2, 0
.L08002CB8: .4byte gUnk_02024C8C
.L08002CBC: .4byte 0x3CC35AA5
.L08002CC0:
    movs r0, #1
    b .L08002CC4
.L08002CC4:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08002CA4

    thumb_func_start func_08002CCC
func_08002CCC: @ 0x08002CCC
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08002CE0 @ =gUnk_02024C90
    ldr r1, [r0]
    ldr r0, .L08002CE4 @ =0x3CC35AA5
    cmp r1, r0
    beq .L08002CE8
    movs r0, #0
    b .L08002CEC
    .align 2, 0
.L08002CE0: .4byte gUnk_02024C90
.L08002CE4: .4byte 0x3CC35AA5
.L08002CE8:
    movs r0, #1
    b .L08002CEC
.L08002CEC:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08002CCC

    thumb_func_start SoftResetIfKeyCombo
SoftResetIfKeyCombo: @ 0x08002CF4
    push {r7, lr}
    mov r7, sp
    bl func_08002CA4
    lsls r1, r0, #0x18
    asrs r0, r1, #0x18
    cmp r0, #0
    beq .L08002D40
    ldr r1, .L08002D1C @ =gKeys
    ldr r0, [r1]
    ldrh r1, [r0, #4]
    ldr r0, .L08002D20 @ =0x00000303
    cmp r1, r0
    bne .L08002D24
    bl func_08002C8C
    movs r0, #0xfe
    bl SoftReset
    b .L08002D40
    .align 2, 0
.L08002D1C: .4byte gKeys
.L08002D20: .4byte 0x00000303
.L08002D24:
    ldr r1, .L08002D3C @ =gKeys
    ldr r0, [r1]
    ldrh r1, [r0, #4]
    cmp r1, #0xf
    bne .L08002D40
    bl func_08002C8C
    movs r0, #0xfe
    bl SoftReset
    b .L08002D40
    .align 2, 0
.L08002D3C: .4byte gKeys
.L08002D40:
    pop {r7}
    pop {r0}
    bx r0
    func_end SoftResetIfKeyCombo

    thumb_func_start func_08002D48
func_08002D48: @ 0x08002D48
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    adds r0, r7, #4
    ldr r1, .L08002DB8 @ =0x04000200
    ldrh r2, [r1]
    strh r2, [r0]
    ldr r0, .L08002DBC @ =0x04000132
    ldr r2, [r7]
    adds r1, r2, #0
    ldr r3, .L08002DC0 @ =0xFFFFC000
    adds r2, r1, r3
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, .L08002DB8 @ =0x04000200
    ldr r1, .L08002DB8 @ =0x04000200
    ldrh r2, [r1]
    ldr r3, .L08002DC4 @ =0x0000DF7F
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    ldr r0, .L08002DB8 @ =0x04000200
    ldr r1, .L08002DB8 @ =0x04000200
    ldrh r2, [r1]
    movs r3, #0x80
    lsls r3, r3, #5
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    movs r0, #0x80
    lsls r0, r0, #0x13
    movs r1, #0x80
    lsls r1, r1, #0x13
    ldrh r2, [r1]
    movs r3, #0x80
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    bl SoundBiasReset
    svc #3
    bl SoundBiasSet
    ldr r0, .L08002DB8 @ =0x04000200
    adds r1, r7, #4
    ldrh r2, [r1]
    strh r2, [r0]
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002DB8: .4byte 0x04000200
.L08002DBC: .4byte 0x04000132
.L08002DC0: .4byte 0xFFFFC000
.L08002DC4: .4byte 0x0000DF7F
    func_end func_08002D48

    thumb_func_start OnHBlankBoth
OnHBlankBoth: @ 0x08002DC8
    push {r4, r7, lr}
    mov r7, sp
    ldr r0, .L08002DF4 @ =0x03002924
    ldr r1, [r0]
    cmp r1, #0
    beq .L08002DDC
    ldr r0, .L08002DF4 @ =0x03002924
    ldr r4, [r0]
    bl _call_via_r4
.L08002DDC:
    ldr r0, .L08002DF8 @ =0x03002F38
    ldr r1, [r0]
    cmp r1, #0
    beq .L08002DEC
    ldr r0, .L08002DF8 @ =0x03002F38
    ldr r4, [r0]
    bl _call_via_r4
.L08002DEC:
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002DF4: .4byte 0x03002924
.L08002DF8: .4byte 0x03002F38
    func_end OnHBlankBoth

    thumb_func_start RefreshOnHBlank
RefreshOnHBlank: @ 0x08002DFC
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    movs r0, #0
    str r0, [r7]
    ldr r0, .L08002E34 @ =0x03002924
    ldr r1, [r0]
    cmp r1, #0
    beq .L08002E14
    ldr r0, [r7]
    adds r1, r0, #1
    str r1, [r7]
.L08002E14:
    ldr r0, .L08002E38 @ =0x03002F38
    ldr r1, [r0]
    cmp r1, #0
    beq .L08002E22
    ldr r0, [r7]
    adds r1, r0, #2
    str r1, [r7]
.L08002E22:
    ldr r0, [r7]
    cmp r0, #1
    beq .L08002E70
    cmp r0, #1
    bgt .L08002E3C
    cmp r0, #0
    beq .L08002E46
    b .L08002F0C
    .align 2, 0
.L08002E34: .4byte 0x03002924
.L08002E38: .4byte 0x03002F38
.L08002E3C:
    cmp r0, #2
    beq .L08002EA4
    cmp r0, #3
    beq .L08002ED8
    b .L08002F0C
.L08002E46:
    ldr r0, .L08002E64 @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #0xef
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    ldr r0, .L08002E68 @ =0x04000200
    ldr r1, .L08002E68 @ =0x04000200
    ldrh r2, [r1]
    ldr r3, .L08002E6C @ =0x0000FFFD
    adds r1, r2, #0
    ands r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    b .L08002F0C
    .align 2, 0
.L08002E64: .4byte gDispIo
.L08002E68: .4byte 0x04000200
.L08002E6C: .4byte 0x0000FFFD
.L08002E70:
    ldr r0, .L08002E98 @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #0x10
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    ldr r0, .L08002E9C @ =0x03002924
    ldr r1, [r0]
    movs r0, #1
    bl SetIrqFunc
    ldr r0, .L08002EA0 @ =0x04000200
    ldr r1, .L08002EA0 @ =0x04000200
    ldrh r2, [r1]
    movs r3, #2
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    b .L08002F0C
    .align 2, 0
.L08002E98: .4byte gDispIo
.L08002E9C: .4byte 0x03002924
.L08002EA0: .4byte 0x04000200
.L08002EA4:
    ldr r0, .L08002ECC @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #0x10
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    ldr r0, .L08002ED0 @ =0x03002F38
    ldr r1, [r0]
    movs r0, #1
    bl SetIrqFunc
    ldr r0, .L08002ED4 @ =0x04000200
    ldr r1, .L08002ED4 @ =0x04000200
    ldrh r2, [r1]
    movs r3, #2
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    b .L08002F0C
    .align 2, 0
.L08002ECC: .4byte gDispIo
.L08002ED0: .4byte 0x03002F38
.L08002ED4: .4byte 0x04000200
.L08002ED8:
    ldr r0, .L08002F00 @ =gDispIo
    ldrb r1, [r0, #4]
    movs r2, #0x10
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #4]
    ldr r1, .L08002F04 @ =OnHBlankBoth
    movs r0, #1
    bl SetIrqFunc
    ldr r0, .L08002F08 @ =0x04000200
    ldr r1, .L08002F08 @ =0x04000200
    ldrh r2, [r1]
    movs r3, #2
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0]
    b .L08002F0C
    .align 2, 0
.L08002F00: .4byte gDispIo
.L08002F04: .4byte OnHBlankBoth
.L08002F08: .4byte 0x04000200
.L08002F0C:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    func_end RefreshOnHBlank

    thumb_func_start SetOnHBlankA
SetOnHBlankA: @ 0x08002F14
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08002F30 @ =0x03002924
    ldr r1, [r7]
    str r1, [r0]
    bl RefreshOnHBlank
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002F30: .4byte 0x03002924
    func_end SetOnHBlankA

    thumb_func_start SetOnHBlankB
SetOnHBlankB: @ 0x08002F34
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08002F50 @ =0x03002F38
    ldr r1, [r7]
    str r1, [r0]
    bl RefreshOnHBlank
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08002F50: .4byte 0x03002F38
    func_end SetOnHBlankB

    thumb_func_start func_08002F54
func_08002F54: @ 0x08002F54
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    ldr r1, .L08002F70 @ =gBg0Tm
    cmp r0, r1
    blo .L08002F78
    ldr r0, [r7]
    ldr r1, .L08002F74 @ =gBg1Tm
    cmp r0, r1
    bhs .L08002F78
    movs r0, #0
    b .L08002FD2
    .align 2, 0
.L08002F70: .4byte gBg0Tm
.L08002F74: .4byte gBg1Tm
.L08002F78:
    ldr r0, [r7]
    ldr r1, .L08002F8C @ =gBg1Tm
    cmp r0, r1
    blo .L08002F94
    ldr r0, [r7]
    ldr r1, .L08002F90 @ =gBg2Tm
    cmp r0, r1
    bhs .L08002F94
    movs r0, #1
    b .L08002FD2
    .align 2, 0
.L08002F8C: .4byte gBg1Tm
.L08002F90: .4byte gBg2Tm
.L08002F94:
    ldr r0, [r7]
    ldr r1, .L08002FA8 @ =gBg2Tm
    cmp r0, r1
    blo .L08002FB0
    ldr r0, [r7]
    ldr r1, .L08002FAC @ =gBg3Tm
    cmp r0, r1
    bhs .L08002FB0
    movs r0, #2
    b .L08002FD2
    .align 2, 0
.L08002FA8: .4byte gBg2Tm
.L08002FAC: .4byte gBg3Tm
.L08002FB0:
    ldr r0, [r7]
    ldr r1, .L08002FC4 @ =gBg3Tm
    cmp r0, r1
    blo .L08002FCC
    ldr r0, [r7]
    ldr r1, .L08002FC8 @ =gBgMapVramTable
    cmp r0, r1
    bhs .L08002FCC
    movs r0, #3
    b .L08002FD2
    .align 2, 0
.L08002FC4: .4byte gBg3Tm
.L08002FC8: .4byte gBgMapVramTable
.L08002FCC:
    movs r0, #1
    rsbs r0, r0, #0
    b .L08002FD2
.L08002FD2:
    add sp, #4
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08002F54

    thumb_func_start func_08002FDC
func_08002FDC: @ 0x08002FDC
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    ldr r0, .L08002FFC @ =gAsyncUploadInfo
    movs r1, #0
    str r1, [r0]
    ldr r0, .L08002FFC @ =gAsyncUploadInfo
    movs r1, #0
    str r1, [r0, #4]
    movs r0, #0
    str r0, [r7]
.L08002FF2:
    ldr r0, [r7]
    cmp r0, #0x1f
    ble .L08003000
    b .L08003064
    .align 2, 0
.L08002FFC: .4byte gAsyncUploadInfo
.L08003000:
    ldr r0, .L08003060 @ =gAsyncUploadList
    ldr r1, [r7]
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    lsls r1, r2, #2
    adds r0, r0, r1
    movs r1, #0
    str r1, [r0]
    ldr r0, .L08003060 @ =gAsyncUploadList
    ldr r1, [r7]
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    lsls r1, r2, #2
    adds r0, #4
    adds r1, r0, r1
    movs r0, #0
    str r0, [r1]
    ldr r0, .L08003060 @ =gAsyncUploadList
    ldr r1, [r7]
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    lsls r1, r2, #2
    adds r0, r0, r1
    ldrh r1, [r0, #8]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #8]
    ldr r0, .L08003060 @ =gAsyncUploadList
    ldr r1, [r7]
    adds r3, r1, #0
    lsls r2, r3, #1
    adds r2, r2, r1
    lsls r1, r2, #2
    adds r0, r0, r1
    ldrh r1, [r0, #0xa]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #0xa]
    ldr r0, [r7]
    adds r1, r0, #1
    str r1, [r7]
    b .L08002FF2
    .align 2, 0
.L08003060: .4byte gAsyncUploadList
.L08003064:
    ldr r0, .L08003074 @ =gAsyncUploadList
    movs r1, #0
    str r1, [r0]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003074: .4byte gAsyncUploadList
    func_end func_08002FDC

    thumb_func_start RegisterDataMove
RegisterDataMove: @ 0x08003078
    push {r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r1, .L080030F4 @ =gAsyncUploadInfo
    ldr r0, [r1]
    adds r2, r0, #0
    lsls r1, r2, #1
    adds r1, r1, r0
    lsls r0, r1, #2
    ldr r1, .L080030F8 @ =gAsyncUploadList
    adds r0, r1, r0
    str r0, [r7, #0xc]
    ldr r0, [r7, #0xc]
    ldr r1, [r7]
    str r1, [r0]
    ldr r0, [r7, #0xc]
    ldr r1, [r7, #4]
    str r1, [r0, #4]
    ldr r0, [r7, #0xc]
    ldr r2, [r7, #8]
    adds r1, r2, #0
    ldrh r2, [r0, #8]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0, #8]
    ldr r0, [r7, #0xc]
    movs r1, #0
    ldr r2, [r7, #8]
    movs r3, #0x1f
    ands r2, r3
    cmp r2, #0
    bne .L080030C6
    movs r1, #1
.L080030C6:
    ldrh r2, [r0, #0xa]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0, #0xa]
    ldr r0, .L080030F4 @ =gAsyncUploadInfo
    ldr r1, .L080030F4 @ =gAsyncUploadInfo
    ldr r2, [r1, #4]
    ldr r1, [r7, #8]
    adds r2, r2, r1
    str r2, [r0, #4]
    ldr r1, .L080030F4 @ =gAsyncUploadInfo
    ldr r0, .L080030F4 @ =gAsyncUploadInfo
    ldr r1, .L080030F4 @ =gAsyncUploadInfo
    ldr r2, [r1]
    adds r1, r2, #1
    str r1, [r0]
    add sp, #0x10
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080030F4: .4byte gAsyncUploadInfo
.L080030F8: .4byte gAsyncUploadList
    func_end RegisterDataMove

    thumb_func_start RegisterDataFill
RegisterDataFill: @ 0x080030FC
    push {r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r1, .L08003170 @ =gAsyncUploadInfo
    ldr r0, [r1]
    adds r2, r0, #0
    lsls r1, r2, #1
    adds r1, r1, r0
    lsls r0, r1, #2
    ldr r1, .L08003174 @ =gAsyncUploadList
    adds r0, r1, r0
    str r0, [r7, #0xc]
    ldr r0, [r7, #0xc]
    ldr r1, [r7]
    str r1, [r0]
    ldr r0, [r7, #0xc]
    ldr r1, [r7, #4]
    str r1, [r0, #4]
    ldr r0, [r7, #0xc]
    ldr r2, [r7, #8]
    adds r1, r2, #0
    ldrh r2, [r0, #8]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0, #8]
    ldr r0, [r7, #0xc]
    ldrh r1, [r0, #0xa]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #2
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0, #0xa]
    ldr r0, .L08003170 @ =gAsyncUploadInfo
    ldr r1, .L08003170 @ =gAsyncUploadInfo
    ldr r2, [r1, #4]
    ldr r1, [r7, #8]
    adds r2, r2, r1
    str r2, [r0, #4]
    ldr r1, .L08003170 @ =gAsyncUploadInfo
    ldr r0, .L08003170 @ =gAsyncUploadInfo
    ldr r1, .L08003170 @ =gAsyncUploadInfo
    ldr r2, [r1]
    adds r1, r2, #1
    str r1, [r0]
    add sp, #0x10
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003170: .4byte gAsyncUploadInfo
.L08003174: .4byte gAsyncUploadList
    func_end RegisterDataFill

    thumb_func_start func_08003178
func_08003178: @ 0x08003178
    push {r4, r7, lr}
    sub sp, #0xc
    mov r7, sp
    ldr r0, .L08003194 @ =gAsyncUploadList
    str r0, [r7]
    movs r0, #0
    str r0, [r7, #4]
.L08003186:
    ldr r0, .L08003198 @ =gAsyncUploadInfo
    ldr r1, [r7, #4]
    ldr r0, [r0]
    cmp r1, r0
    blt .L0800319C
    b .L0800321E
    .align 2, 0
.L08003194: .4byte gAsyncUploadList
.L08003198: .4byte gAsyncUploadInfo
.L0800319C:
    ldr r1, [r7]
    ldrh r0, [r1, #0xa]
    cmp r0, #1
    beq .L080031CE
    cmp r0, #1
    bgt .L080031AE
    cmp r0, #0
    beq .L080031B4
    b .L0800320E
.L080031AE:
    cmp r0, #2
    beq .L080031E8
    b .L0800320E
.L080031B4:
    ldr r1, [r7]
    ldr r0, [r1]
    ldr r2, [r7]
    ldr r1, [r2, #4]
    ldr r2, [r7]
    ldrh r3, [r2, #8]
    lsrs r2, r3, #1
    adds r4, r2, #0
    lsls r3, r4, #0x10
    lsrs r2, r3, #0x10
    bl CpuSet
    b .L0800320E
.L080031CE:
    ldr r1, [r7]
    ldr r0, [r1]
    ldr r2, [r7]
    ldr r1, [r2, #4]
    ldr r2, [r7]
    ldrh r3, [r2, #8]
    lsrs r2, r3, #2
    adds r4, r2, #0
    lsls r3, r4, #0x10
    lsrs r2, r3, #0x10
    bl CpuFastSet
    b .L0800320E
.L080031E8:
    ldr r0, [r7]
    ldr r1, [r0]
    str r1, [r7, #8]
    adds r0, r7, #0
    adds r0, #8
    ldr r2, [r7]
    ldr r1, [r2, #4]
    ldr r2, [r7]
    ldrh r3, [r2, #8]
    lsrs r2, r3, #2
    adds r4, r2, #0
    lsls r3, r4, #0x10
    lsrs r2, r3, #0x10
    movs r3, #0x80
    lsls r3, r3, #0x11
    orrs r2, r3
    bl CpuFastSet
    b .L0800320E
.L0800320E:
    ldr r0, [r7]
    adds r1, r0, #0
    adds r1, #0xc
    str r1, [r7]
    ldr r0, [r7, #4]
    adds r1, r0, #1
    str r1, [r7, #4]
    b .L08003186
.L0800321E:
    bl func_08002FDC
    add sp, #0xc
    pop {r4, r7}
    pop {r0}
    bx r0
    func_end func_08003178

    thumb_func_start func_0800322C
func_0800322C: @ 0x0800322C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L080032BC @ =0x03000028
    ldr r1, .L080032C0 @ =0x03002930
    str r1, [r0]
    ldr r0, .L080032BC @ =0x03000028
    movs r1, #0xe0
    lsls r1, r1, #0x13
    str r1, [r0, #4]
    ldr r0, .L080032BC @ =0x03000028
    ldrh r1, [r0, #8]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #8]
    ldr r0, .L080032BC @ =0x03000028
    ldr r2, [r7]
    adds r1, r2, #0
    ldrh r2, [r0, #0xa]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0, #0xa]
    ldr r0, .L080032C4 @ =0x03000018
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #3
    ldr r2, .L080032C0 @ =0x03002930
    adds r1, r2, r1
    str r1, [r0]
    ldr r0, .L080032C4 @ =0x03000018
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #3
    movs r3, #0xe0
    lsls r3, r3, #0x13
    adds r2, r1, r3
    str r2, [r0, #4]
    ldr r0, .L080032C4 @ =0x03000018
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #3
    ldrh r2, [r0, #8]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #8]
    ldr r0, .L080032C4 @ =0x03000018
    ldr r2, [r7]
    adds r1, r2, #0
    movs r2, #0x80
    subs r1, r2, r1
    ldrh r2, [r0, #0xa]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #0xa]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080032BC: .4byte 0x03000028
.L080032C0: .4byte 0x03002930
.L080032C4: .4byte 0x03000018
    func_end func_0800322C

    thumb_func_start func_080032C8
func_080032C8: @ 0x080032C8
    push {r7, lr}
    mov r7, sp
    ldr r0, .L080032D4 @ =0x03000028
    ldrh r1, [r0, #0xa]
    adds r0, r1, #0
    b .L080032D8
    .align 2, 0
.L080032D4: .4byte 0x03000028
.L080032D8:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_080032C8

    thumb_func_start func_080032E0
func_080032E0: @ 0x080032E0
    push {r4, r7, lr}
    mov r7, sp
    ldr r1, .L08003324 @ =0x03000018
    ldr r0, [r1]
    ldr r2, .L08003324 @ =0x03000018
    ldr r1, [r2, #4]
    ldr r2, .L08003324 @ =0x03000018
    ldrh r3, [r2, #0xa]
    adds r2, r3, #0
    lsls r3, r2, #1
    lsls r4, r3, #0xb
    lsrs r2, r4, #0xb
    bl CpuFastSet
    ldr r1, .L08003324 @ =0x03000018
    ldr r0, [r1]
    ldr r1, .L08003324 @ =0x03000018
    ldrh r2, [r1, #0xa]
    adds r1, r2, #0
    bl ClearOam_thm
    ldr r0, .L08003328 @ =gOamHiPutIt
    ldr r1, .L08003324 @ =0x03000018
    ldr r2, [r1]
    str r2, [r0]
    ldr r0, .L0800332C @ =0x03003948
    ldr r1, .L08003330 @ =0x03002930
    str r1, [r0]
    ldr r0, .L08003334 @ =0x0300291C
    movs r1, #0
    strh r1, [r0]
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003324: .4byte 0x03000018
.L08003328: .4byte gOamHiPutIt
.L0800332C: .4byte 0x03003948
.L08003330: .4byte 0x03002930
.L08003334: .4byte 0x0300291C
    func_end func_080032E0

    thumb_func_start func_08003338
func_08003338: @ 0x08003338
    push {r4, r7, lr}
    mov r7, sp
    ldr r0, .L08003348 @ =0x03000028
    ldrh r1, [r0, #0xa]
    cmp r1, #0
    bne .L0800334C
    b .L0800337A
    .align 2, 0
.L08003348: .4byte 0x03000028
.L0800334C:
    ldr r1, .L08003380 @ =0x03000028
    ldr r0, [r1]
    ldr r2, .L08003380 @ =0x03000028
    ldr r1, [r2, #4]
    ldr r2, .L08003380 @ =0x03000028
    ldrh r3, [r2, #0xa]
    adds r2, r3, #0
    lsls r3, r2, #1
    lsls r4, r3, #0xb
    lsrs r2, r4, #0xb
    bl CpuFastSet
    ldr r1, .L08003380 @ =0x03000028
    ldr r0, [r1]
    ldr r1, .L08003380 @ =0x03000028
    ldrh r2, [r1, #0xa]
    adds r1, r2, #0
    bl ClearOam_thm
    ldr r0, .L08003384 @ =gOamLoPutIt
    ldr r1, .L08003380 @ =0x03000028
    ldr r2, [r1]
    str r2, [r0]
.L0800337A:
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003380: .4byte 0x03000028
.L08003384: .4byte gOamLoPutIt
    func_end func_08003338

    thumb_func_start func_08003388
func_08003388: @ 0x08003388
    push {r4, r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    adds r4, r1, #0
    adds r1, r3, #0
    ldr r0, [r7, #0x18]
    adds r3, r7, #4
    strh r4, [r3]
    adds r3, r7, #6
    strh r2, [r3]
    adds r2, r7, #0
    adds r2, #8
    strh r1, [r2]
    adds r1, r7, #0
    adds r1, #0xa
    strh r0, [r1]
    ldr r0, .L0800344C @ =0x03002930
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #4
    adds r2, r1, #3
    adds r1, r2, #0
    lsls r2, r1, #1
    adds r0, r0, r2
    adds r1, r7, #4
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, .L0800344C @ =0x03002930
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #4
    adds r2, r1, #7
    adds r1, r2, #0
    lsls r2, r1, #1
    adds r0, r0, r2
    adds r1, r7, #6
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, .L0800344C @ =0x03002930
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #4
    adds r2, r1, #0
    adds r2, #0xb
    adds r1, r2, #0
    lsls r2, r1, #1
    adds r0, r0, r2
    adds r1, r7, #0
    adds r1, #8
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, .L0800344C @ =0x03002930
    ldr r1, [r7]
    adds r2, r1, #0
    lsls r1, r2, #4
    adds r2, r1, #0
    adds r2, #0xf
    adds r1, r2, #0
    lsls r2, r1, #1
    adds r0, r0, r2
    adds r1, r7, #0
    adds r1, #0xa
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    add sp, #0xc
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800344C: .4byte 0x03002930
    func_end func_08003388

    thumb_func_start func_08003450
func_08003450: @ 0x08003450
    push {r4, r7, lr}
    sub sp, #0x14
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
.L0800345C:
    b .L08003460
.L0800345E:
    .byte 0x39, 0xE0
.L08003460:
    ldr r0, [r7]
    ldr r1, [r0]
    cmp r1, #1
    beq .L0800347C
    ldr r0, .L08003474 @ =gOamHiPutIt
    ldr r1, [r0]
    ldr r0, .L08003478 @ =0x03002A30
    cmp r1, r0
    bhs .L0800347C
    b .L0800347E
    .align 2, 0
.L08003474: .4byte gOamHiPutIt
.L08003478: .4byte 0x03002A30
.L0800347C:
    b .L080034D4
.L0800347E:
    ldr r0, [r7]
    movs r2, #6
    ldrsh r1, [r0, r2]
    ldr r2, [r7, #4]
    adds r0, r1, r2
    lsls r1, r0, #0x17
    lsrs r0, r1, #0x17
    str r0, [r7, #0xc]
    ldr r0, [r7]
    movs r2, #8
    ldrsh r1, [r0, r2]
    ldr r2, [r7, #8]
    adds r0, r1, r2
    movs r1, #0xff
    ands r0, r1
    str r0, [r7, #0x10]
    ldr r0, .L080034D0 @ =gOamHiPutIt
    ldr r1, [r0]
    ldr r2, [r7]
    ldr r4, [r7, #0xc]
    lsls r3, r4, #0x10
    ldr r4, [r2]
    adds r2, r3, #0
    orrs r2, r4
    ldr r3, [r7, #0x10]
    orrs r2, r3
    str r2, [r1]
    adds r1, #4
    str r1, [r0]
    ldr r0, .L080034D0 @ =gOamHiPutIt
    ldr r1, [r0]
    ldr r2, [r7]
    ldrh r3, [r2, #4]
    strh r3, [r1]
    adds r1, #4
    str r1, [r0]
    ldr r0, [r7]
    adds r1, r0, #0
    adds r1, #0xc
    str r1, [r7]
    b .L0800345C
    .align 2, 0
.L080034D0: .4byte gOamHiPutIt
.L080034D4:
    add sp, #0x14
    pop {r4, r7}
    pop {r0}
    bx r0
    func_end func_08003450

    thumb_func_start GetCurrentBgmSong
GetCurrentBgmSong: @ 0x080034DC
    push {r7, lr}
    mov r7, sp
    ldr r0, .L080034E8 @ =gBgmStatus
    ldrh r1, [r0, #4]
    adds r0, r1, #0
    b .L080034EC
    .align 2, 0
.L080034E8: .4byte gBgmStatus
.L080034EC:
    pop {r7}
    pop {r1}
    bx r1
    func_end GetCurrentBgmSong

    thumb_func_start func_080034F4
func_080034F4: @ 0x080034F4
    push {r7, lr}
    mov r7, sp
    ldr r0, .L08003504 @ =gBgmStatus
    movs r1, #6
    ldrsb r1, [r0, r1]
    adds r0, r1, #0
    b .L08003508
    .align 2, 0
.L08003504: .4byte gBgmStatus
.L08003508:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_080034F4

    thumb_func_start func_08003510
func_08003510: @ 0x08003510
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08003590 @ =0x03005D60
    ldr r1, .L08003594 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L08003598 @ =0x03005E30
    ldr r1, .L08003594 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L0800359C @ =0x03005DA0
    ldr r1, .L08003594 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L080035A0 @ =0x03005A90
    ldr r1, .L08003594 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L080035A4 @ =0x03005AD0
    ldr r1, .L08003594 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L080035A8 @ =0x03005CE0
    ldr r1, .L08003594 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L080035AC @ =0x03005DF0
    ldr r1, .L08003594 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003590: .4byte 0x03005D60
.L08003594: .4byte 0x0000FFFF
.L08003598: .4byte 0x03005E30
.L0800359C: .4byte 0x03005DA0
.L080035A0: .4byte 0x03005A90
.L080035A4: .4byte 0x03005AD0
.L080035A8: .4byte 0x03005CE0
.L080035AC: .4byte 0x03005DF0
    func_end func_08003510

    thumb_func_start SetBgmVolume
SetBgmVolume: @ 0x080035B0
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L080035E0 @ =0x03005B10
    ldr r1, .L080035E4 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L080035E8 @ =0x03005D20
    ldr r1, .L080035E4 @ =0x0000FFFF
    ldr r3, [r7]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080035E0: .4byte 0x03005B10
.L080035E4: .4byte 0x0000FFFF
.L080035E8: .4byte 0x03005D20
    func_end SetBgmVolume

    thumb_func_start FadeBgmOut
FadeBgmOut: @ 0x080035EC
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    cmp r0, #0
    bge .L080035FE
    movs r0, #6
    str r0, [r7]
.L080035FE:
    ldr r0, .L08003660 @ =0x03000038
    ldr r1, [r0]
    cmp r1, #0
    beq .L08003616
    ldr r0, .L08003660 @ =0x03000038
    ldr r1, [r0]
    adds r0, r1, #0
    bl Proc_Break
    ldr r0, .L08003660 @ =0x03000038
    movs r1, #0
    str r1, [r0]
.L08003616:
    ldr r0, .L08003664 @ =0x0300003C
    ldr r1, [r0]
    cmp r1, #0
    beq .L0800362E
    ldr r0, .L08003664 @ =0x0300003C
    ldr r1, [r0]
    adds r0, r1, #0
    bl Proc_Break
    ldr r0, .L08003664 @ =0x0300003C
    movs r1, #0
    str r1, [r0]
.L0800362E:
    ldr r0, .L08003668 @ =0x03005B10
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L0800366C @ =0x03005D20
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L08003670 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #6]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003660: .4byte 0x03000038
.L08003664: .4byte 0x0300003C
.L08003668: .4byte 0x03005B10
.L0800366C: .4byte 0x03005D20
.L08003670: .4byte gBgmStatus
    func_end FadeBgmOut

    thumb_func_start FadeBgmOut_2
FadeBgmOut_2: @ 0x08003674
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    cmp r0, #0
    bge .L08003686
    movs r0, #6
    str r0, [r7]
.L08003686:
    ldr r0, .L080036FC @ =0x03000038
    ldr r1, [r0]
    cmp r1, #0
    beq .L0800369E
    ldr r0, .L080036FC @ =0x03000038
    ldr r1, [r0]
    adds r0, r1, #0
    bl Proc_Break
    ldr r0, .L080036FC @ =0x03000038
    movs r1, #0
    str r1, [r0]
.L0800369E:
    ldr r0, .L08003700 @ =0x0300003C
    ldr r1, [r0]
    cmp r1, #0
    beq .L080036B6
    ldr r0, .L08003700 @ =0x0300003C
    ldr r1, [r0]
    adds r0, r1, #0
    bl Proc_Break
    ldr r0, .L08003700 @ =0x0300003C
    movs r1, #0
    str r1, [r0]
.L080036B6:
    ldr r0, .L08003704 @ =0x03005B10
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L08003708 @ =0x03005D20
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOutTemporarily
    ldr r0, .L0800370C @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L0800370C @ =gBgmStatus
    ldrb r1, [r0, #7]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #7]
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080036FC: .4byte 0x03000038
.L08003700: .4byte 0x0300003C
.L08003704: .4byte 0x03005B10
.L08003708: .4byte 0x03005D20
.L0800370C: .4byte gBgmStatus
    func_end FadeBgmOut_2

    thumb_func_start func_08003710
func_08003710: @ 0x08003710
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    cmp r0, #0
    bne .L08003722
    movs r0, #6
    str r0, [r7]
.L08003722:
    ldr r0, .L0800378C @ =0x03005D60
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L08003790 @ =0x03005E30
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L08003794 @ =0x03005DA0
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L08003798 @ =0x03005A90
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L0800379C @ =0x03005AD0
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L080037A0 @ =0x03005CE0
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    ldr r0, .L080037A4 @ =0x03005DF0
    ldr r2, [r7]
    adds r1, r2, #0
    lsls r2, r1, #0x10
    lsrs r1, r2, #0x10
    bl m4aMPlayFadeOut
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800378C: .4byte 0x03005D60
.L08003790: .4byte 0x03005E30
.L08003794: .4byte 0x03005DA0
.L08003798: .4byte 0x03005A90
.L0800379C: .4byte 0x03005AD0
.L080037A0: .4byte 0x03005CE0
.L080037A4: .4byte 0x03005DF0
    func_end func_08003710

    thumb_func_start StartBgmCore
StartBgmCore: @ 0x080037A8
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r0, .L08003808 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003808 @ =gBgmStatus
    ldrb r1, [r0, #7]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #7]
    ldr r0, .L08003808 @ =gBgmStatus
    ldr r2, [r7]
    adds r1, r2, #0
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0, #4]
    ldr r1, [r7, #4]
    ldr r0, [r7]
    bl PlaySongCore
    ldr r1, .L0800380C @ =0x03005B10
    adds r0, r1, #0
    bl m4aMPlayImmInit
    ldr r1, .L08003810 @ =0x03005D20
    adds r0, r1, #0
    bl m4aMPlayImmInit
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003808: .4byte gBgmStatus
.L0800380C: .4byte 0x03005B10
.L08003810: .4byte 0x03005D20
    func_end StartBgmCore

    thumb_func_start StartOrChangeBgm
StartOrChangeBgm: @ 0x08003814
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r0, .L08003838 @ =gBgmStatus
    movs r1, #6
    ldrsb r1, [r0, r1]
    cmp r1, #0
    beq .L0800383C
    bl GetCurrentBgmSong
    ldr r1, [r7]
    cmp r0, r1
    bne .L0800383C
    b .L08003888
    .align 2, 0
.L08003838: .4byte gBgmStatus
.L0800383C:
    ldr r1, .L08003850 @ =gPlayStatus
    adds r0, r1, #0
    adds r1, #0x41
    ldrb r0, [r1]
    lsls r1, r0, #0x1f
    lsrs r0, r1, #0x1f
    cmp r0, #0
    beq .L08003854
    b .L08003888
    .align 2, 0
.L08003850: .4byte gPlayStatus
.L08003854:
    bl func_0800421C
    ldr r0, .L0800387C @ =gBgmStatus
    movs r1, #6
    ldrsb r1, [r0, r1]
    cmp r1, #0
    beq .L08003880
    ldr r1, [r7, #4]
    adds r0, r1, #0
    bl FadeBgmOut
    ldr r0, [r7, #4]
    adds r2, r0, #0
    lsls r1, r2, #4
    ldr r2, [r7, #8]
    ldr r0, [r7]
    bl PlaySongDelayed
    b .L08003888
    .align 2, 0
.L0800387C: .4byte gBgmStatus
.L08003880:
    ldr r1, [r7, #8]
    ldr r0, [r7]
    bl StartBgmCore
.L08003888:
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end StartOrChangeBgm

    thumb_func_start StartBgm
StartBgm: @ 0x08003890
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r2, [r7, #4]
    ldr r0, [r7]
    movs r1, #3
    bl StartOrChangeBgm
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    func_end StartBgm

    thumb_func_start StartBgmExt
StartBgmExt: @ 0x080038AC
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r1, [r7, #4]
    ldr r2, [r7, #8]
    ldr r0, [r7]
    bl StartOrChangeBgm
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    func_end StartBgmExt

    thumb_func_start func_080038CC
func_080038CC: @ 0x080038CC
    push {r4, r7, lr}
    sub sp, #0xc
    add r7, sp, #4
    str r0, [r7]
    movs r2, #0x80
    lsls r2, r2, #1
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x4c
    movs r0, #0
    ldrsh r3, [r1, r0]
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x4e
    movs r4, #0
    ldrsh r0, [r1, r4]
    str r0, [sp]
    movs r0, #0
    movs r1, #0
    bl func_08012FE8
    str r0, [r7, #4]
    ldr r0, .L0800396C @ =0x03005B10
    ldr r1, .L08003970 @ =0x0000FFFF
    ldr r3, [r7, #4]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r0, .L08003974 @ =0x03005D20
    ldr r1, .L08003970 @ =0x0000FFFF
    ldr r3, [r7, #4]
    adds r2, r3, #0
    lsls r3, r2, #0x10
    lsrs r2, r3, #0x10
    bl m4aMPlayVolumeControl
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x4c
    ldr r0, [r7]
    ldr r2, [r7]
    adds r1, r2, #0
    adds r2, #0x4c
    ldrh r3, [r2]
    adds r1, r3, #1
    adds r2, r0, #0
    adds r0, #0x4c
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, [r7]
    adds r1, r0, #0
    adds r0, #0x4c
    ldr r2, [r7]
    adds r1, r2, #0
    adds r2, #0x4e
    movs r1, #0
    ldrsh r0, [r0, r1]
    movs r3, #0
    ldrsh r1, [r2, r3]
    cmp r0, r1
    blt .L08003962
    ldr r0, [r7]
    bl Proc_Break
    ldr r0, .L08003978 @ =0x03000038
    movs r1, #0
    str r1, [r0]
.L08003962:
    add sp, #0xc
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800396C: .4byte 0x03005B10
.L08003970: .4byte 0x0000FFFF
.L08003974: .4byte 0x03005D20
.L08003978: .4byte 0x03000038
    func_end func_080038CC

    thumb_func_start StartBgmFadeIn
StartBgmFadeIn: @ 0x0800397C
    push {r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r1, .L0800399C @ =gPlayStatus
    adds r0, r1, #0
    adds r1, #0x41
    ldrb r0, [r1]
    lsls r1, r0, #0x1f
    lsrs r0, r1, #0x1f
    cmp r0, #0
    beq .L080039A0
    b .L08003A4E
    .align 2, 0
.L0800399C: .4byte gPlayStatus
.L080039A0:
    ldr r0, .L08003A58 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003A58 @ =gBgmStatus
    ldrb r1, [r0, #7]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #7]
    ldr r0, .L08003A58 @ =gBgmStatus
    ldr r2, [r7]
    adds r1, r2, #0
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strh r2, [r0, #4]
    ldr r1, .L08003A5C @ =0x08B85824
    adds r0, r1, #0
    movs r1, #3
    bl SpawnProc
    str r0, [r7, #0xc]
    ldr r1, .L08003A60 @ =0x03005B10
    adds r0, r1, #0
    bl m4aMPlayStop
    ldr r1, .L08003A64 @ =0x03005D20
    adds r0, r1, #0
    bl m4aMPlayStop
    ldr r1, [r7, #8]
    ldr r0, [r7]
    bl PlaySongCore
    ldr r1, .L08003A60 @ =0x03005B10
    adds r0, r1, #0
    bl m4aMPlayImmInit
    ldr r1, .L08003A64 @ =0x03005D20
    adds r0, r1, #0
    bl m4aMPlayImmInit
    ldr r0, .L08003A60 @ =0x03005B10
    ldr r1, .L08003A68 @ =0x0000FFFF
    movs r2, #0
    bl m4aMPlayVolumeControl
    ldr r0, .L08003A64 @ =0x03005D20
    ldr r1, .L08003A68 @ =0x0000FFFF
    movs r2, #0
    bl m4aMPlayVolumeControl
    ldr r0, [r7, #0xc]
    adds r1, r0, #0
    adds r0, #0x4c
    ldrh r1, [r0]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0]
    ldr r0, [r7, #0xc]
    ldr r1, [r7, #4]
    adds r2, r1, #0
    lsls r1, r2, #4
    adds r2, r0, #0
    adds r0, #0x4e
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, .L08003A6C @ =0x03000038
    ldr r1, [r7, #0xc]
    str r1, [r0]
.L08003A4E:
    add sp, #0x10
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003A58: .4byte gBgmStatus
.L08003A5C: .4byte 0x08B85824
.L08003A60: .4byte 0x03005B10
.L08003A64: .4byte 0x03005D20
.L08003A68: .4byte 0x0000FFFF
.L08003A6C: .4byte 0x03000038
    func_end StartBgmFadeIn

    thumb_func_start OverrideBgm
OverrideBgm: @ 0x08003A70
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r1, .L08003A8C @ =gPlayStatus
    adds r0, r1, #0
    adds r1, #0x41
    ldrb r0, [r1]
    lsls r1, r0, #0x1f
    lsrs r0, r1, #0x1f
    cmp r0, #0
    beq .L08003A90
    b .L08003AE2
    .align 2, 0
.L08003A8C: .4byte gPlayStatus
.L08003A90:
    ldr r0, .L08003AEC @ =gBgmStatus
    ldr r1, .L08003AEC @ =gBgmStatus
    ldrh r2, [r0, #2]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #4]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #2]
    ldr r0, .L08003AEC @ =gBgmStatus
    movs r1, #7
    ldrsb r1, [r0, r1]
    cmp r1, #0
    bne .L08003ABA
    ldr r1, .L08003AF0 @ =0x03005D20
    adds r0, r1, #0
    movs r1, #3
    bl m4aMPlayFadeOutTemporarily
.L08003ABA:
    ldr r0, .L08003AEC @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003AEC @ =gBgmStatus
    ldrb r1, [r0, #7]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #7]
    ldr r0, [r7]
    cmp r0, #0
    beq .L08003AE2
    ldr r2, .L08003AF4 @ =0x03005B10
    ldr r0, [r7]
    movs r1, #0x20
    bl PlaySongDelayed
.L08003AE2:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003AEC: .4byte gBgmStatus
.L08003AF0: .4byte 0x03005D20
.L08003AF4: .4byte 0x03005B10
    func_end OverrideBgm

    thumb_func_start func_08003AF8
func_08003AF8: @ 0x08003AF8
    push {r7, lr}
    mov r7, sp
    ldr r1, .L08003B10 @ =gPlayStatus
    adds r0, r1, #0
    adds r1, #0x41
    ldrb r0, [r1]
    lsls r1, r0, #0x1f
    lsrs r0, r1, #0x1f
    cmp r0, #0
    beq .L08003B14
    b .L08003B7A
    .align 2, 0
.L08003B10: .4byte gPlayStatus
.L08003B14:
    ldr r0, .L08003B20 @ =gBgmStatus
    ldrh r1, [r0, #2]
    cmp r1, #0
    bne .L08003B24
    b .L08003B7A
    .align 2, 0
.L08003B20: .4byte gBgmStatus
.L08003B24:
    ldr r1, .L08003B80 @ =0x03005B10
    adds r0, r1, #0
    movs r1, #3
    bl m4aMPlayFadeOut
    ldr r1, .L08003B84 @ =0x03005D20
    adds r0, r1, #0
    movs r1, #6
    bl m4aMPlayFadeIn
    ldr r0, .L08003B88 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003B88 @ =gBgmStatus
    ldrb r1, [r0, #7]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #7]
    ldr r0, .L08003B88 @ =gBgmStatus
    ldr r1, .L08003B88 @ =gBgmStatus
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #2]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r0, .L08003B88 @ =gBgmStatus
    ldrh r1, [r0, #2]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #2]
.L08003B7A:
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003B80: .4byte 0x03005B10
.L08003B84: .4byte 0x03005D20
.L08003B88: .4byte gBgmStatus
    func_end func_08003AF8

    thumb_func_start RestoreBgm
RestoreBgm: @ 0x08003B8C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    adds r1, r7, #0
    strh r0, [r1]
    ldr r1, .L08003BA8 @ =gPlayStatus
    adds r0, r1, #0
    adds r1, #0x41
    ldrb r0, [r1]
    lsls r1, r0, #0x1f
    lsrs r0, r1, #0x1f
    cmp r0, #0
    beq .L08003BAC
    b .L08003C14
    .align 2, 0
.L08003BA8: .4byte gPlayStatus
.L08003BAC:
    ldr r0, .L08003BB8 @ =gBgmStatus
    ldrh r1, [r0, #2]
    cmp r1, #0
    bne .L08003BBC
    b .L08003C14
    .align 2, 0
.L08003BB8: .4byte gBgmStatus
.L08003BBC:
    ldr r1, .L08003C1C @ =0x03005B10
    adds r0, r1, #0
    movs r1, #3
    bl m4aMPlayFadeOut
    ldr r0, .L08003C20 @ =0x03005D20
    adds r1, r7, #0
    ldrh r2, [r1]
    adds r1, r2, #0
    bl m4aMPlayFadeIn
    ldr r0, .L08003C24 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003C24 @ =gBgmStatus
    ldrb r1, [r0, #7]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #7]
    ldr r0, .L08003C24 @ =gBgmStatus
    ldr r1, .L08003C24 @ =gBgmStatus
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #2]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r0, .L08003C24 @ =gBgmStatus
    ldrh r1, [r0, #2]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #2]
.L08003C14:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003C1C: .4byte 0x03005B10
.L08003C20: .4byte 0x03005D20
.L08003C24: .4byte gBgmStatus
    func_end RestoreBgm

    thumb_func_start func_08003C28
func_08003C28: @ 0x08003C28
    push {r7, lr}
    mov r7, sp
    ldr r1, .L08003C40 @ =gPlayStatus
    adds r0, r1, #0
    adds r1, #0x41
    ldrb r0, [r1]
    lsls r1, r0, #0x1f
    lsrs r0, r1, #0x1f
    cmp r0, #0
    beq .L08003C44
    b .L08003C66
    .align 2, 0
.L08003C40: .4byte gPlayStatus
.L08003C44:
    ldr r0, .L08003C6C @ =gBgmStatus
    ldr r1, .L08003C6C @ =gBgmStatus
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1, #2]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r0, .L08003C6C @ =gBgmStatus
    ldrh r1, [r0, #2]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #2]
.L08003C66:
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003C6C: .4byte gBgmStatus
    func_end func_08003C28

    thumb_func_start StartBgmVolumeChange
StartBgmVolumeChange: @ 0x08003C70
    push {r7, lr}
    sub sp, #0x14
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r0, [r7, #0xc]
    cmp r0, #0
    beq .L08003C94
    ldr r0, .L08003C90 @ =0x08B8583C
    ldr r1, [r7, #0xc]
    bl SpawnProcLocking
    str r0, [r7, #0x10]
    b .L08003CA0
    .align 2, 0
.L08003C90: .4byte 0x08B8583C
.L08003C94:
    ldr r1, .L08003D18 @ =0x08B8583C
    adds r0, r1, #0
    movs r1, #3
    bl SpawnProc
    str r0, [r7, #0x10]
.L08003CA0:
    ldr r1, [r7, #0x10]
    ldr r2, [r7]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x64
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
    ldr r1, [r7, #0x10]
    ldr r2, [r7, #4]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x66
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
    ldr r0, [r7, #0x10]
    adds r1, r0, #0
    adds r0, #0x68
    ldrh r1, [r0]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0]
    ldr r1, [r7, #0x10]
    ldr r2, [r7, #8]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x6a
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
    ldr r0, [r7]
    cmp r0, #0
    bne .L08003D02
    movs r0, #1
    str r0, [r7]
.L08003D02:
    ldr r0, [r7]
    bl SetBgmVolume
    ldr r0, .L08003D1C @ =0x0300003C
    ldr r1, [r7, #0x10]
    str r1, [r0]
    add sp, #0x14
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003D18: .4byte 0x08B8583C
.L08003D1C: .4byte 0x0300003C
    func_end StartBgmVolumeChange

    thumb_func_start func_08003D20
func_08003D20: @ 0x08003D20
    push {r4, r5, r7, lr}
    sub sp, #0xc
    add r7, sp, #4
    str r0, [r7]
    ldr r1, [r7]
    adds r0, r1, #0
    adds r2, r1, #0
    adds r2, #0x64
    movs r0, #0
    ldrsh r1, [r2, r0]
    ldr r2, [r7]
    adds r0, r2, #0
    adds r3, r2, #0
    adds r3, #0x66
    movs r5, #0
    ldrsh r2, [r3, r5]
    ldr r0, [r7]
    adds r3, r0, #0
    adds r0, #0x68
    ldrh r3, [r0]
    adds r4, r3, #1
    adds r5, r4, #0
    strh r5, [r0]
    lsls r0, r3, #0x10
    asrs r3, r0, #0x10
    ldr r4, [r7]
    adds r0, r4, #0
    adds r4, #0x6a
    movs r5, #0
    ldrsh r0, [r4, r5]
    str r0, [sp]
    movs r0, #4
    bl func_08012FE8
    str r0, [r7, #4]
    ldr r1, [r7, #4]
    adds r0, r1, #0
    bl SetBgmVolume
    ldr r0, [r7]
    adds r1, r0, #0
    adds r0, #0x68
    ldr r2, [r7]
    adds r1, r2, #0
    adds r2, #0x6a
    movs r1, #0
    ldrsh r0, [r0, r1]
    movs r3, #0
    ldrsh r1, [r2, r3]
    cmp r0, r1
    blt .L08003DFC
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x66
    movs r5, #0
    ldrsh r0, [r1, r5]
    cmp r0, #0
    bne .L08003DDC
    bl GetCurrentBgmSong
    adds r1, r0, #0
    lsls r0, r1, #0x10
    lsrs r1, r0, #0x10
    adds r0, r1, #0
    bl m4aSongNumStop
    ldr r0, .L08003DD8 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003DD8 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003DD8 @ =gBgmStatus
    ldrh r1, [r0, #2]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #2]
    ldr r0, .L08003DD8 @ =gBgmStatus
    ldrh r1, [r0, #4]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #4]
    b .L08003DF0
    .align 2, 0
.L08003DD8: .4byte gBgmStatus
.L08003DDC:
    ldr r0, .L08003E04 @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #6]
.L08003DF0:
    ldr r0, [r7]
    bl Proc_Break
    ldr r0, .L08003E08 @ =0x0300003C
    movs r1, #0
    str r1, [r0]
.L08003DFC:
    add sp, #0xc
    pop {r4, r5, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003E04: .4byte gBgmStatus
.L08003E08: .4byte 0x0300003C
    func_end func_08003D20

    thumb_func_start func_08003E0C
func_08003E0C: @ 0x08003E0C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x4c
    ldr r0, [r7]
    ldr r2, [r7]
    adds r1, r2, #0
    adds r2, #0x4c
    ldrh r3, [r2]
    subs r1, r3, #1
    adds r2, r0, #0
    adds r0, #0x4c
    ldrh r2, [r0]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0]
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x4c
    movs r2, #0
    ldrsh r0, [r1, r2]
    cmp r0, #0
    blt .L08003E4A
    b .L08003E92
.L08003E4A:
    ldr r0, .L08003E9C @ =gBgmStatus
    ldrb r1, [r0, #6]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    movs r3, #1
    adds r1, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #6]
    ldr r0, .L08003E9C @ =gBgmStatus
    ldr r1, [r7]
    adds r2, r1, #0
    adds r1, #0x4a
    ldrh r2, [r0, #4]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    ldrh r1, [r1]
    adds r2, r3, #0
    orrs r2, r1
    adds r1, r2, #0
    strh r1, [r0, #4]
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x4a
    movs r2, #0
    ldrsh r0, [r1, r2]
    ldr r1, [r7]
    ldr r2, [r1, #0x54]
    adds r1, r2, #0
    bl PlaySongCore
    ldr r0, [r7]
    bl Proc_End
.L08003E92:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003E9C: .4byte gBgmStatus
    func_end func_08003E0C

    thumb_func_start PlaySongDelayed
PlaySongDelayed: @ 0x08003EA0
    push {r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r1, .L08003EC0 @ =gPlayStatus
    adds r0, r1, #0
    adds r1, #0x41
    ldrb r0, [r1]
    lsls r1, r0, #0x1f
    lsrs r0, r1, #0x1f
    cmp r0, #0
    beq .L08003EC4
    b .L08003F06
    .align 2, 0
.L08003EC0: .4byte gPlayStatus
.L08003EC4:
    ldr r1, .L08003F10 @ =0x08B85854
    adds r0, r1, #0
    movs r1, #3
    bl SpawnProc
    str r0, [r7, #0xc]
    ldr r1, [r7, #0xc]
    ldr r2, [r7, #4]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x4c
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
    ldr r1, [r7, #0xc]
    ldr r2, [r7]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x4a
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
    ldr r0, [r7, #0xc]
    ldr r1, [r7, #8]
    str r1, [r0, #0x54]
.L08003F06:
    add sp, #0x10
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003F10: .4byte 0x08B85854
    func_end PlaySongDelayed

    thumb_func_start PlaySongCore
PlaySongCore: @ 0x08003F14
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r0, [r7]
    cmp r0, #0x7f
    bgt .L08003F32
    ldr r0, [r7]
    bl func_08003FC0
    movs r0, #0
    ldr r1, [r7]
    bl func_0809F748
.L08003F32:
    ldr r0, [r7, #4]
    cmp r0, #0
    beq .L08003F54
    ldr r0, [r7, #4]
    ldr r1, .L08003F50 @ =0x0869D6E0
    ldr r2, [r7]
    adds r3, r2, #0
    lsls r2, r3, #3
    adds r1, r1, r2
    ldr r2, [r1]
    adds r1, r2, #0
    bl m4aMPlayStart
    b .L08003F62
    .align 2, 0
.L08003F50: .4byte 0x0869D6E0
.L08003F54:
    ldr r1, [r7]
    adds r0, r1, #0
    lsls r2, r0, #0x10
    lsrs r1, r2, #0x10
    adds r0, r1, #0
    bl m4aSongNumStart
.L08003F62:
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    func_end PlaySongCore

    thumb_func_start func_08003F6C
func_08003F6C: @ 0x08003F6C
    push {r7, lr}
    mov r7, sp
    movs r0, #7
    bl func_08003F8C
    ldr r0, .L08003F88 @ =gBgmStatus
    ldrb r1, [r0, #8]
    movs r2, #0xff
    orrs r1, r2
    adds r2, r1, #0
    strb r2, [r0, #8]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003F88: .4byte gBgmStatus
    func_end func_08003F6C

    thumb_func_start func_08003F8C
func_08003F8C: @ 0x08003F8C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08003FBC @ =gBgmStatus
    ldr r2, [r7]
    adds r1, r2, #0
    ldrb r2, [r0, #8]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r1, r3
    adds r2, r1, #0
    strb r2, [r0, #8]
    ldr r0, [r7]
    lsls r1, r0, #8
    adds r0, r1, #0
    bl m4aSoundMode
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08003FBC: .4byte gBgmStatus
    func_end func_08003F8C

    thumb_func_start func_08003FC0
func_08003FC0: @ 0x08003FC0
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    cmp r0, #0x5a
    beq .L08003FF0
    cmp r0, #0x5a
    bgt .L08003FDC
    cmp r0, #0x2a
    bgt .L08004008
    cmp r0, #0x29
    blt .L08004008
    b .L08003FF0
.L08003FDC:
    cmp r0, #0x5f
    beq .L08003FF0
    cmp r0, #0x5f
    bgt .L08003FEA
    cmp r0, #0x5c
    beq .L08003FF0
    b .L08004008
.L08003FEA:
    cmp r0, #0x74
    beq .L08003FF0
    b .L08004008
.L08003FF0:
    ldr r0, .L08004004 @ =gBgmStatus
    movs r1, #8
    ldrsb r1, [r0, r1]
    cmp r1, #8
    beq .L08004000
    movs r0, #8
    bl func_08003F8C
.L08004000:
    b .L08004020
    .align 2, 0
.L08004004: .4byte gBgmStatus
.L08004008:
    ldr r0, .L0800401C @ =gBgmStatus
    movs r1, #8
    ldrsb r1, [r0, r1]
    movs r0, #1
    cmn r1, r0
    beq .L08004018
    bl func_08003F6C
.L08004018:
    b .L08004020
    .align 2, 0
.L0800401C: .4byte gBgmStatus
.L08004020:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    func_end func_08003FC0

    thumb_func_start func_08004028
func_08004028: @ 0x08004028
    push {r7, lr}
    mov r7, sp
    ldr r1, .L0800403C @ =0x08B8583C
    adds r0, r1, #0
    bl Proc_Find
    cmp r0, #0
    beq .L08004040
    movs r0, #1
    b .L08004044
    .align 2, 0
.L0800403C: .4byte 0x08B8583C
.L08004040:
    movs r0, #0
    b .L08004044
.L08004044:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_08004028

    thumb_func_start func_0800404C
func_0800404C: @ 0x0800404C
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    bl func_080034F4
    lsls r1, r0, #0x18
    asrs r0, r1, #0x18
    cmp r0, #0
    beq .L080040AE
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x64
    movs r2, #0
    ldrsh r0, [r1, r2]
    cmp r0, #0
    beq .L080040AE
    ldr r0, [r7]
    ldr r1, [r0, #0x5c]
    movs r0, #1
    cmn r1, r0
    bne .L08004098
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x64
    movs r3, #0
    ldrsh r0, [r1, r3]
    ldr r2, [r7]
    adds r1, r2, #0
    adds r2, #0x66
    movs r3, #0
    ldrsh r1, [r2, r3]
    ldr r3, [r7]
    ldr r2, [r3, #0x58]
    ldr r3, [r7]
    bl StartBgmVolumeChange
    b .L080040AE
.L08004098:
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x64
    movs r2, #0
    ldrsh r0, [r1, r2]
    ldr r1, [r7]
    ldr r2, [r1, #0x58]
    movs r1, #0
    ldr r3, [r7]
    bl StartBgmVolumeChange
.L080040AE:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    func_end func_0800404C

    thumb_func_start func_080040B8
func_080040B8: @ 0x080040B8
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, [r7]
    ldr r1, [r0, #0x5c]
    cmp r1, #0
    ble .L080040E6
    ldr r0, [r7]
    ldr r1, [r0, #0x5c]
    adds r0, r1, #0
    movs r1, #0
    bl StartBgm
    ldr r1, [r7]
    adds r0, r1, #0
    adds r1, #0x66
    movs r0, #0
    ldrsh r2, [r1, r0]
    adds r0, r2, #0
    bl SetBgmVolume
    b .L080040EE
.L080040E6:
    ldr r0, [r7]
    movs r1, #0
    bl Proc_Goto
.L080040EE:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    func_end func_080040B8

    thumb_func_start func_080040F8
func_080040F8: @ 0x080040F8
    push {r7, lr}
    sub sp, #0x14
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    bl func_080034F4
    lsls r1, r0, #0x18
    asrs r0, r1, #0x18
    cmp r0, #0
    beq .L0800412C
    ldr r0, .L08004128 @ =gBgmStatus
    ldrh r1, [r0, #4]
    ldr r0, [r7]
    cmp r0, r1
    bne .L0800412C
    ldr r0, [r7, #4]
    ldr r1, [r7, #8]
    cmp r0, r1
    bne .L0800412C
    b .L080041B6
    .align 2, 0
.L08004128: .4byte gBgmStatus
.L0800412C:
    ldr r0, [r7, #0x1c]
    cmp r0, #0
    beq .L08004144
    ldr r1, .L08004140 @ =0x08B85864
    adds r0, r1, #0
    ldr r1, [r7, #0x1c]
    bl SpawnProcLocking
    str r0, [r7, #0x10]
    b .L08004150
    .align 2, 0
.L08004140: .4byte 0x08B85864
.L08004144:
    ldr r1, .L08004178 @ =0x08B85864
    adds r0, r1, #0
    movs r1, #3
    bl SpawnProc
    str r0, [r7, #0x10]
.L08004150:
    ldr r0, [r7, #0x10]
    ldr r1, [r7, #0xc]
    str r1, [r0, #0x58]
    bl func_080034F4
    lsls r1, r0, #0x18
    asrs r0, r1, #0x18
    cmp r0, #0
    beq .L08004180
    ldr r0, .L0800417C @ =gBgmStatus
    ldrh r1, [r0, #4]
    ldr r0, [r7]
    cmp r0, r1
    bne .L08004180
    ldr r0, [r7, #0x10]
    movs r1, #1
    rsbs r1, r1, #0
    str r1, [r0, #0x5c]
    b .L08004186
    .align 2, 0
.L08004178: .4byte 0x08B85864
.L0800417C: .4byte gBgmStatus
.L08004180:
    ldr r0, [r7, #0x10]
    ldr r1, [r7]
    str r1, [r0, #0x5c]
.L08004186:
    ldr r1, [r7, #0x10]
    ldr r2, [r7, #4]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x64
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
    ldr r1, [r7, #0x10]
    ldr r2, [r7, #8]
    adds r0, r2, #0
    adds r2, r1, #0
    adds r1, #0x66
    ldrh r2, [r1]
    movs r3, #0
    ands r2, r3
    adds r3, r2, #0
    orrs r0, r3
    adds r2, r0, #0
    strh r2, [r1]
.L080041B6:
    add sp, #0x14
    pop {r7}
    pop {r0}
    bx r0
    func_end func_080040F8

    thumb_func_start func_080041C0
func_080041C0: @ 0x080041C0
    push {r7, lr}
    mov r7, sp
    ldr r1, .L080041D4 @ =0x08B85864
    adds r0, r1, #0
    bl Proc_Find
    cmp r0, #0
    beq .L080041D8
    movs r0, #1
    b .L080041DC
    .align 2, 0
.L080041D4: .4byte 0x08B85864
.L080041D8:
    movs r0, #0
    b .L080041DC
.L080041DC:
    pop {r7}
    pop {r1}
    bx r1
    func_end func_080041C0

    thumb_func_start func_080041E4
func_080041E4: @ 0x080041E4
    push {r7, lr}
    sub sp, #4
    mov r7, sp
    str r0, [r7]
    ldr r0, .L08004218 @ =gBgmStatus
    ldrh r1, [r0, #4]
    ldr r0, [r7]
    cmp r0, r1
    beq .L08004210
    bl func_080034F4
    lsls r1, r0, #0x18
    asrs r0, r1, #0x18
    cmp r0, #0
    beq .L08004208
    movs r0, #0
    bl SetBgmVolume
.L08004208:
    ldr r0, [r7]
    movs r1, #0
    bl StartBgmCore
.L08004210:
    add sp, #4
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004218: .4byte gBgmStatus
    func_end func_080041E4

    thumb_func_start func_0800421C
func_0800421C: @ 0x0800421C
    push {r7, lr}
    mov r7, sp
    ldr r1, .L08004230 @ =0x08B85854
    adds r0, r1, #0
    bl Proc_EndEach
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004230: .4byte 0x08B85854
    func_end func_0800421C

    thumb_func_start func_08004234
func_08004234: @ 0x08004234
    push {r7, lr}
    mov r7, sp
    bl func_0800421C
    ldr r1, .L08004270 @ =0x03005B10
    adds r0, r1, #0
    movs r1, #1
    bl m4aMPlayFadeOut
    ldr r1, .L08004274 @ =0x03005D20
    adds r0, r1, #0
    movs r1, #1
    bl m4aMPlayFadeOut
    ldr r0, .L08004278 @ =gBgmStatus
    ldrh r1, [r0, #2]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #2]
    ldr r0, .L08004278 @ =gBgmStatus
    ldrh r1, [r0, #4]
    movs r2, #0
    ands r1, r2
    adds r2, r1, #0
    strh r2, [r0, #4]
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004270: .4byte 0x03005B10
.L08004274: .4byte 0x03005D20
.L08004278: .4byte gBgmStatus
    func_end func_08004234

    thumb_func_start InitRamFuncs
InitRamFuncs: @ 0x0800427C
    push {r4, r7, lr}
    sub sp, #4
    mov r7, sp
    ldr r0, .L080042FC @ =ArmCodeEnd
    ldr r1, .L08004300 @ =ArmCodeStart
    subs r0, r0, r1
    str r0, [r7]
    ldr r0, .L08004300 @ =ArmCodeStart
    ldr r1, .L08004304 @ =0x03002F40
    ldr r2, [r7]
    asrs r3, r2, #0x1f
    lsrs r4, r3, #0x1f
    adds r3, r2, r4
    asrs r2, r3, #1
    lsls r3, r2, #0xb
    lsrs r2, r3, #0xb
    bl CpuSet
    ldr r0, .L08004308 @ =0x03002F30
    ldr r1, .L0800430C @ =DrawGlyph
    ldr r2, .L08004300 @ =ArmCodeStart
    subs r1, r1, r2
    ldr r2, .L08004304 @ =0x03002F40
    adds r1, r2, r1
    str r1, [r0]
    ldr r0, .L08004310 @ =0x03003940
    ldr r1, .L08004314 @ =DecodeString
    ldr r2, .L08004300 @ =ArmCodeStart
    subs r1, r1, r2
    ldr r2, .L08004304 @ =0x03002F40
    adds r1, r2, r1
    str r1, [r0]
    ldr r0, .L08004318 @ =0x03002920
    ldr r1, .L0800431C @ =PutOamHi
    ldr r2, .L08004300 @ =ArmCodeStart
    subs r1, r1, r2
    ldr r2, .L08004304 @ =0x03002F40
    adds r1, r2, r1
    str r1, [r0]
    ldr r0, .L08004320 @ =0x03003944
    ldr r1, .L08004324 @ =PutOamLo
    ldr r2, .L08004300 @ =ArmCodeStart
    subs r1, r1, r2
    ldr r2, .L08004304 @ =0x03002F40
    adds r1, r2, r1
    str r1, [r0]
    ldr r0, .L08004328 @ =0x03004150
    ldr r1, .L0800432C @ =MapFloodCoreStep
    ldr r2, .L08004300 @ =ArmCodeStart
    subs r1, r1, r2
    ldr r2, .L08004304 @ =0x03002F40
    adds r1, r2, r1
    str r1, [r0]
    ldr r0, .L08004330 @ =0x03002918
    ldr r1, .L08004334 @ =MapFloodCore
    ldr r2, .L08004300 @ =ArmCodeStart
    subs r1, r1, r2
    ldr r2, .L08004304 @ =0x03002F40
    adds r1, r2, r1
    str r1, [r0]
    add sp, #4
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080042FC: .4byte ArmCodeEnd
.L08004300: .4byte ArmCodeStart
.L08004304: .4byte 0x03002F40
.L08004308: .4byte 0x03002F30
.L0800430C: .4byte DrawGlyph
.L08004310: .4byte 0x03003940
.L08004314: .4byte DecodeString
.L08004318: .4byte 0x03002920
.L0800431C: .4byte PutOamHi
.L08004320: .4byte 0x03003944
.L08004324: .4byte PutOamLo
.L08004328: .4byte 0x03004150
.L0800432C: .4byte MapFloodCoreStep
.L08004330: .4byte 0x03002918
.L08004334: .4byte MapFloodCore
    func_end InitRamFuncs

    thumb_func_start DrawGlyphRam
DrawGlyphRam: @ 0x08004338
    push {r4, r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r0, .L08004360 @ =0x03002F30
    ldr r1, [r7, #4]
    ldr r2, [r7, #8]
    ldr r3, [r7, #0xc]
    ldr r4, [r0]
    ldr r0, [r7]
    bl _call_via_r4
    add sp, #0x10
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004360: .4byte 0x03002F30
    func_end DrawGlyphRam

    thumb_func_start DecodeStringRam
DecodeStringRam: @ 0x08004364
    push {r7, lr}
    sub sp, #8
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    ldr r0, .L08004384 @ =0x03003940
    ldr r1, [r7, #4]
    ldr r2, [r0]
    ldr r0, [r7]
    bl _call_via_r2
    add sp, #8
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004384: .4byte 0x03003940
    func_end DecodeStringRam

    thumb_func_start PutOamHiRam
PutOamHiRam: @ 0x08004388
    push {r4, r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r0, .L080043B0 @ =0x03002920
    ldr r1, [r7, #4]
    ldr r2, [r7, #8]
    ldr r3, [r7, #0xc]
    ldr r4, [r0]
    ldr r0, [r7]
    bl _call_via_r4
    add sp, #0x10
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080043B0: .4byte 0x03002920
    func_end PutOamHiRam

    thumb_func_start PutOamLoRam
PutOamLoRam: @ 0x080043B4
    push {r4, r7, lr}
    sub sp, #0x10
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    str r3, [r7, #0xc]
    ldr r0, .L080043DC @ =0x03003944
    ldr r1, [r7, #4]
    ldr r2, [r7, #8]
    ldr r3, [r7, #0xc]
    ldr r4, [r0]
    ldr r0, [r7]
    bl _call_via_r4
    add sp, #0x10
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080043DC: .4byte 0x03003944
    func_end PutOamLoRam

    thumb_func_start func_080043E0
func_080043E0: @ 0x080043E0
    push {r7, lr}
    sub sp, #0xc
    mov r7, sp
    str r0, [r7]
    str r1, [r7, #4]
    str r2, [r7, #8]
    ldr r0, .L08004404 @ =0x03004150
    ldr r1, [r7, #4]
    ldr r2, [r7, #8]
    ldr r3, [r0]
    ldr r0, [r7]
    bl _call_via_r3
    add sp, #0xc
    pop {r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004404: .4byte 0x03004150
    func_end func_080043E0

    thumb_func_start MapFloodCoreRam
MapFloodCoreRam: @ 0x08004408
    push {r4, r7, lr}
    mov r7, sp
    ldr r0, .L0800441C @ =0x03002918
    ldr r4, [r0]
    bl _call_via_r4
    pop {r4, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800441C: .4byte 0x03002918
    func_end MapFloodCoreRam

    thumb_func_start InitProcs
InitProcs: @ 0x08004420
    push {r4, r5, r6, r7, lr}
    movs r4, #0
    ldr r7, .L08004484 @ =gProcs
    ldr r5, .L08004488 @ =gProcAllocList
    ldr r0, .L0800448C @ =gProcAllocHead
    mov ip, r0
    movs r2, #0
    adds r6, r5, #0
    movs r3, #0
.L08004432:
    adds r1, r3, r7
    str r2, [r1]
    str r2, [r1, #4]
    str r2, [r1, #8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    str r2, [r1, #0x14]
    str r2, [r1, #0x18]
    str r2, [r1, #0x1c]
    str r2, [r1, #0x20]
    strh r2, [r1, #0x24]
    adds r0, r1, #0
    adds r0, #0x26
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    adds r0, #1
    strb r2, [r0]
    stm r6!, {r1}
    adds r3, #0x6c
    adds r4, #1
    cmp r4, #0x3f
    ble .L08004432
    movs r0, #0x80
    lsls r0, r0, #1
    adds r1, r5, r0
    movs r0, #0
    str r0, [r1]
    mov r0, ip
    str r5, [r0]
    ldr r1, .L08004490 @ =gProcTreeRoots
    movs r2, #0
    adds r0, r1, #0
    adds r0, #0x1c
.L08004476:
    str r2, [r0]
    subs r0, #4
    cmp r0, r1
    bge .L08004476
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004484: .4byte gProcs
.L08004488: .4byte gProcAllocList
.L0800448C: .4byte gProcAllocHead
.L08004490: .4byte gProcTreeRoots
    func_end InitProcs

    thumb_func_start SpawnProc
SpawnProc: @ 0x08004494
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r6, r1, #0
    bl func_0800459C
    adds r5, r0, #0
    str r4, [r5]
    str r4, [r5, #4]
    movs r0, #0
    str r0, [r5, #8]
    str r0, [r5, #0xc]
    str r0, [r5, #0x14]
    str r0, [r5, #0x18]
    str r0, [r5, #0x1c]
    str r0, [r5, #0x20]
    movs r1, #0
    strh r0, [r5, #0x24]
    adds r0, r5, #0
    adds r0, #0x26
    strb r1, [r0]
    adds r0, #2
    strb r1, [r0]
    adds r1, r5, #0
    adds r1, #0x27
    movs r0, #8
    strb r0, [r1]
    cmp r6, #7
    bgt .L080044D6
    adds r0, r5, #0
    adds r1, r6, #0
    bl func_080045BC
    b .L080044DE
.L080044D6:
    adds r0, r5, #0
    adds r1, r6, #0
    bl func_080045DC
.L080044DE:
    adds r0, r5, #0
    bl func_08004B84
    adds r1, r5, #0
    adds r1, #0x27
    movs r0, #0xf7
    ldrb r2, [r1]
    ands r0, r2
    strb r0, [r1]
    adds r0, r5, #0
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end SpawnProc

    thumb_func_start SpawnProcLocking
SpawnProcLocking: @ 0x080044F8
    push {lr}
    bl SpawnProc
    adds r2, r0, #0
    ldr r0, [r2]
    cmp r0, #0
    beq .L08004520
    adds r1, r2, #0
    adds r1, #0x27
    movs r0, #2
    ldrb r3, [r1]
    orrs r0, r3
    strb r0, [r1]
    ldr r0, [r2, #0x14]
    adds r0, #0x28
    ldrb r1, [r0]
    adds r1, #1
    strb r1, [r0]
    adds r0, r2, #0
    b .L08004522
.L08004520:
    movs r0, #0
.L08004522:
    pop {r1}
    bx r1
    func_end SpawnProcLocking

    thumb_func_start func_08004528
func_08004528: @ 0x08004528
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x20]
    cmp r0, #0
    beq .L08004536
    bl func_08004528
.L08004536:
    ldr r0, [r4, #0x18]
    cmp r0, #0
    beq .L08004540
    bl func_08004528
.L08004540:
    adds r6, r4, #0
    adds r6, #0x27
    movs r5, #1
    ldrb r0, [r6]
    ands r5, r0
    cmp r5, #0
    bne .L0800457E
    ldr r1, [r4, #8]
    cmp r1, #0
    beq .L0800455A
    adds r0, r4, #0
    bl _call_via_r1
.L0800455A:
    adds r0, r4, #0
    bl func_080045AC
    str r5, [r4]
    str r5, [r4, #0xc]
    movs r0, #1
    ldrb r1, [r6]
    orrs r0, r1
    strb r0, [r6]
    movs r1, #2
    ands r0, r1
    cmp r0, #0
    beq .L0800457E
    ldr r0, [r4, #0x14]
    adds r0, #0x28
    ldrb r1, [r0]
    subs r1, #1
    strb r1, [r0]
.L0800457E:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08004528

    thumb_func_start Proc_End
Proc_End: @ 0x08004584
    push {r4, lr}
    adds r4, r0, #0
    cmp r4, #0
    beq .L08004596
    bl func_080045F0
    adds r0, r4, #0
    bl func_08004528
.L08004596:
    pop {r4}
    pop {r0}
    bx r0
    func_end Proc_End

    thumb_func_start func_0800459C
func_0800459C: @ 0x0800459C
    ldr r1, .L080045A8 @ =gProcAllocHead
    ldr r2, [r1]
    ldm r2!, {r0}
    str r2, [r1]
    bx lr
    .align 2, 0
.L080045A8: .4byte gProcAllocHead
    func_end func_0800459C

    thumb_func_start func_080045AC
func_080045AC: @ 0x080045AC
    ldr r2, .L080045B8 @ =gProcAllocHead
    ldr r1, [r2]
    subs r1, #4
    str r1, [r2]
    str r0, [r1]
    bx lr
    .align 2, 0
.L080045B8: .4byte gProcAllocHead
    func_end func_080045AC

    thumb_func_start func_080045BC
func_080045BC: @ 0x080045BC
    adds r2, r0, #0
    adds r3, r1, #0
    lsls r1, r3, #2
    ldr r0, .L080045D8 @ =gProcTreeRoots
    adds r1, r1, r0
    ldr r0, [r1]
    cmp r0, #0
    beq .L080045D0
    str r2, [r0, #0x1c]
    str r0, [r2, #0x20]
.L080045D0:
    str r3, [r2, #0x14]
    str r2, [r1]
    bx lr
    .align 2, 0
.L080045D8: .4byte gProcTreeRoots
    func_end func_080045BC

    thumb_func_start func_080045DC
func_080045DC: @ 0x080045DC
    adds r2, r0, #0
    ldr r0, [r1, #0x18]
    cmp r0, #0
    beq .L080045EA
    str r2, [r0, #0x1c]
    ldr r0, [r1, #0x18]
    str r0, [r2, #0x20]
.L080045EA:
    str r2, [r1, #0x18]
    str r1, [r2, #0x14]
    bx lr
    func_end func_080045DC

    thumb_func_start func_080045F0
func_080045F0: @ 0x080045F0
    adds r2, r0, #0
    ldr r1, [r2, #0x1c]
    cmp r1, #0
    beq .L080045FC
    ldr r0, [r2, #0x20]
    str r0, [r1, #0x20]
.L080045FC:
    ldr r1, [r2, #0x20]
    cmp r1, #0
    beq .L08004606
    ldr r0, [r2, #0x1c]
    str r0, [r1, #0x1c]
.L08004606:
    ldr r1, [r2, #0x14]
    cmp r1, #8
    ble .L08004618
    ldr r0, [r1, #0x18]
    cmp r0, r2
    bne .L08004628
    ldr r0, [r2, #0x20]
    str r0, [r1, #0x18]
    b .L08004628
.L08004618:
    lsls r0, r1, #2
    ldr r1, .L08004630 @ =gProcTreeRoots
    adds r1, r0, r1
    ldr r0, [r1]
    cmp r0, r2
    bne .L08004628
    ldr r0, [r2, #0x20]
    str r0, [r1]
.L08004628:
    movs r0, #0
    str r0, [r2, #0x1c]
    str r0, [r2, #0x20]
    bx lr
    .align 2, 0
.L08004630: .4byte gProcTreeRoots
    func_end func_080045F0

    thumb_func_start func_08004634
func_08004634: @ 0x08004634
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x20]
    cmp r0, #0
    beq .L08004642
    bl func_08004634
.L08004642:
    adds r0, r4, #0
    adds r0, #0x28
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08004680
    adds r1, r4, #0
    adds r1, #0x27
    movs r0, #8
    ldrb r2, [r1]
    ands r0, r2
    adds r5, r1, #0
    cmp r0, #0
    bne .L08004680
    ldr r0, [r4, #0xc]
    cmp r0, #0
    bne .L0800466E
    adds r0, r4, #0
    bl func_08004B84
    ldr r0, [r4, #0xc]
    cmp r0, #0
    beq .L08004676
.L0800466E:
    ldr r1, [r4, #0xc]
    adds r0, r4, #0
    bl _call_via_r1
.L08004676:
    movs r0, #1
    ldrb r5, [r5]
    ands r0, r5
    cmp r0, #0
    bne .L0800468A
.L08004680:
    ldr r0, [r4, #0x18]
    cmp r0, #0
    beq .L0800468A
    bl func_08004634
.L0800468A:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08004634

    thumb_func_start func_08004690
func_08004690: @ 0x08004690
    push {lr}
    cmp r0, #0
    beq .L0800469A
    bl func_08004634
.L0800469A:
    pop {r0}
    bx r0
    func_end func_08004690

    thumb_func_start Proc_Break
Proc_Break: @ 0x080046A0
    movs r1, #0
    str r1, [r0, #0xc]
    bx lr
    func_end Proc_Break

    thumb_func_start Proc_Find
Proc_Find: @ 0x080046A8
    adds r3, r0, #0
    ldr r1, .L080046B8 @ =gProcs
    movs r2, #0
.L080046AE:
    ldr r0, [r1]
    cmp r0, r3
    bne .L080046BC
    adds r0, r1, #0
    b .L080046C6
    .align 2, 0
.L080046B8: .4byte gProcs
.L080046BC:
    adds r2, #1
    adds r1, #0x6c
    cmp r2, #0x3f
    ble .L080046AE
    movs r0, #0
.L080046C6:
    bx lr
    func_end Proc_Find

    thumb_func_start func_080046C8
func_080046C8: @ 0x080046C8
    adds r3, r0, #0
    ldr r1, .L080046E4 @ =gProcs
    movs r2, #0
.L080046CE:
    ldr r0, [r1]
    cmp r0, r3
    bne .L080046E8
    adds r0, r1, #0
    adds r0, #0x28
    ldrb r0, [r0]
    cmp r0, #0
    bne .L080046E8
    adds r0, r1, #0
    b .L080046F2
    .align 2, 0
.L080046E4: .4byte gProcs
.L080046E8:
    adds r2, #1
    adds r1, #0x6c
    cmp r2, #0x3f
    ble .L080046CE
    movs r0, #0
.L080046F2:
    bx lr
    func_end func_080046C8

    thumb_func_start func_080046F4
func_080046F4: @ 0x080046F4
    adds r3, r0, #0
    ldr r1, .L08004710 @ =gProcs
    movs r2, #0
.L080046FA:
    ldr r0, [r1]
    cmp r0, #0
    beq .L08004714
    adds r0, r1, #0
    adds r0, #0x26
    ldrb r0, [r0]
    cmp r0, r3
    bne .L08004714
    adds r0, r1, #0
    b .L0800471E
    .align 2, 0
.L08004710: .4byte gProcs
.L08004714:
    adds r2, #1
    adds r1, #0x6c
    cmp r2, #0x3f
    ble .L080046FA
    movs r0, #0
.L0800471E:
    bx lr
    func_end func_080046F4

    thumb_func_start Proc_Goto
Proc_Goto: @ 0x08004720
    push {r4, r5, r6, lr}
    adds r4, r1, #0
    adds r1, r0, #0
    ldr r2, [r1]
    ldrh r3, [r2]
    movs r5, #0
    ldrsh r0, [r2, r5]
    cmp r0, #0
    beq .L08004752
    movs r5, #0
.L08004734:
    cmp r3, #0xb
    bne .L08004746
    movs r6, #2
    ldrsh r0, [r2, r6]
    cmp r0, r4
    bne .L08004746
    str r2, [r1, #4]
    str r5, [r1, #0xc]
    b .L08004752
.L08004746:
    adds r2, #8
    ldrh r3, [r2]
    movs r6, #0
    ldrsh r0, [r2, r6]
    cmp r0, #0
    bne .L08004734
.L08004752:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end Proc_Goto

    thumb_func_start func_08004758
func_08004758: @ 0x08004758
    str r1, [r0, #4]
    movs r1, #0
    str r1, [r0, #0xc]
    bx lr
    func_end func_08004758

    thumb_func_start Proc_Mark
Proc_Mark: @ 0x08004760
    adds r0, #0x26
    strb r1, [r0]
    bx lr
    func_end Proc_Mark

    thumb_func_start func_08004768
func_08004768: @ 0x08004768
    str r1, [r0, #8]
    bx lr
    func_end func_08004768

    thumb_func_start func_0800476C
func_0800476C: @ 0x0800476C
    push {r4, r5, r6, lr}
    adds r6, r0, #0
    ldr r4, .L08004790 @ =gProcs
    movs r5, #0x3f
.L08004774:
    ldr r0, [r4]
    cmp r0, #0
    beq .L08004780
    adds r0, r4, #0
    bl _call_via_r6
.L08004780:
    subs r5, #1
    adds r4, #0x6c
    cmp r5, #0
    bge .L08004774
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08004790: .4byte gProcs
    func_end func_0800476C

    thumb_func_start Proc_ForEach
Proc_ForEach: @ 0x08004794
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    adds r6, r1, #0
    ldr r4, .L080047B8 @ =gProcs
    movs r5, #0x3f
.L0800479E:
    ldr r0, [r4]
    cmp r0, r7
    bne .L080047AA
    adds r0, r4, #0
    bl _call_via_r6
.L080047AA:
    subs r5, #1
    adds r4, #0x6c
    cmp r5, #0
    bge .L0800479E
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080047B8: .4byte gProcs
    func_end Proc_ForEach

    thumb_func_start func_080047BC
func_080047BC: @ 0x080047BC
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    adds r6, r1, #0
    ldr r4, .L080047E4 @ =gProcs
    movs r5, #0x3f
.L080047C6:
    adds r0, r4, #0
    adds r0, #0x26
    ldrb r0, [r0]
    cmp r0, r7
    bne .L080047D6
    adds r0, r4, #0
    bl _call_via_r6
.L080047D6:
    subs r5, #1
    adds r4, #0x6c
    cmp r5, #0
    bge .L080047C6
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080047E4: .4byte gProcs
    func_end func_080047BC

    thumb_func_start Proc_LockEachMarked
Proc_LockEachMarked: @ 0x080047E8
    adds r3, r0, #0
    movs r2, #0x3f
    ldr r0, .L08004808 @ =gProcs
    adds r1, r0, #0
    adds r1, #0x26
.L080047F2:
    ldrb r0, [r1]
    cmp r0, r3
    bne .L080047FE
    ldrb r0, [r1, #2]
    adds r0, #1
    strb r0, [r1, #2]
.L080047FE:
    subs r2, #1
    adds r1, #0x6c
    cmp r2, #0
    bge .L080047F2
    bx lr
    .align 2, 0
.L08004808: .4byte gProcs
    func_end Proc_LockEachMarked

    thumb_func_start func_0800480C
func_0800480C: @ 0x0800480C
    adds r3, r0, #0
    movs r2, #0x3f
    ldr r0, .L08004830 @ =gProcs
    adds r1, r0, #0
    adds r1, #0x26
.L08004816:
    ldrb r0, [r1]
    cmp r0, r3
    bne .L08004826
    ldrb r0, [r1, #2]
    cmp r0, #0
    beq .L08004826
    subs r0, #1
    strb r0, [r1, #2]
.L08004826:
    subs r2, #1
    adds r1, #0x6c
    cmp r2, #0
    bge .L08004816
    bx lr
    .align 2, 0
.L08004830: .4byte gProcs
    func_end func_0800480C

    thumb_func_start func_08004834
func_08004834: @ 0x08004834
    push {r4, r5, r6, lr}
    adds r6, r0, #0
    ldr r4, .L0800485C @ =gProcs
    movs r5, #0x3f
.L0800483C:
    adds r0, r4, #0
    adds r0, #0x26
    ldrb r0, [r0]
    cmp r0, r6
    bne .L0800484C
    adds r0, r4, #0
    bl Proc_End
.L0800484C:
    subs r5, #1
    adds r4, #0x6c
    cmp r5, #0
    bge .L0800483C
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800485C: .4byte gProcs
    func_end func_08004834

    thumb_func_start func_08004860
func_08004860: @ 0x08004860
    push {lr}
    bl Proc_End
    pop {r0}
    bx r0
    func_end func_08004860

    thumb_func_start Proc_EndEach
Proc_EndEach: @ 0x0800486C
    push {lr}
    ldr r1, .L08004878 @ =func_08004860
    bl Proc_ForEach
    pop {r0}
    bx r0
    .align 2, 0
.L08004878: .4byte func_08004860
    func_end Proc_EndEach

    thumb_func_start func_0800487C
func_0800487C: @ 0x0800487C
    push {lr}
    bl Proc_Break
    pop {r0}
    bx r0
    func_end func_0800487C

    thumb_func_start func_08004888
func_08004888: @ 0x08004888
    push {lr}
    ldr r1, .L08004894 @ =func_0800487C
    bl Proc_ForEach
    pop {r0}
    bx r0
    .align 2, 0
.L08004894: .4byte func_0800487C
    func_end func_08004888

    thumb_func_start func_08004898
func_08004898: @ 0x08004898
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, [r4, #0x20]
    cmp r0, #0
    beq .L080048A8
    bl func_08004898
.L080048A8:
    adds r0, r4, #0
    bl _call_via_r5
    ldr r0, [r4, #0x18]
    cmp r0, #0
    beq .L080048BA
    adds r1, r5, #0
    bl func_08004898
.L080048BA:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08004898

    thumb_func_start func_080048C0
func_080048C0: @ 0x080048C0
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    bl _call_via_r5
    ldr r0, [r4, #0x18]
    cmp r0, #0
    beq .L080048D6
    adds r1, r5, #0
    bl func_08004898
.L080048D6:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_080048C0

    thumb_func_start func_080048DC
func_080048DC: @ 0x080048DC
    push {lr}
    bl Proc_End
    movs r0, #0
    pop {r1}
    bx r1
    func_end func_080048DC

    thumb_func_start func_080048E8
func_080048E8: @ 0x080048E8
    ldr r1, [r0, #4]
    ldr r2, [r1, #4]
    str r2, [r0, #0x10]
    adds r1, #8
    str r1, [r0, #4]
    movs r0, #1
    bx lr
    func_end func_080048E8

    thumb_func_start func_080048F8
func_080048F8: @ 0x080048F8
    push {lr}
    ldr r1, [r0, #4]
    ldr r2, [r1, #4]
    adds r1, #8
    str r1, [r0, #4]
    bl _call_via_r2
    movs r0, #1
    pop {r1}
    bx r1
    func_end func_080048F8

    thumb_func_start func_0800490C
func_0800490C: @ 0x0800490C
    push {lr}
    ldr r1, [r0, #4]
    ldr r2, [r1, #4]
    adds r1, #8
    str r1, [r0, #4]
    bl _call_via_r2
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    pop {r1}
    bx r1
    func_end func_0800490C

    thumb_func_start func_08004924
func_08004924: @ 0x08004924
    push {lr}
    adds r1, r0, #0
    ldr r2, [r1, #4]
    ldrh r0, [r2, #2]
    ldr r3, [r2, #4]
    adds r2, #8
    str r2, [r1, #4]
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    bl _call_via_r3
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    pop {r1}
    bx r1
    func_end func_08004924

    thumb_func_start func_08004944
func_08004944: @ 0x08004944
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r1, [r0, #4]
    adds r0, #8
    str r0, [r4, #4]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #1
    beq .L08004962
    movs r0, #1
    b .L0800496A
.L08004962:
    ldr r0, [r4, #4]
    subs r0, #8
    str r0, [r4, #4]
    movs r0, #0
.L0800496A:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08004944

    thumb_func_start func_08004970
func_08004970: @ 0x08004970
    ldr r1, [r0, #4]
    ldr r2, [r1, #4]
    str r2, [r0, #0xc]
    adds r1, #8
    str r1, [r0, #4]
    movs r0, #0
    bx lr
    func_end func_08004970

    thumb_func_start func_08004980
func_08004980: @ 0x08004980
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r1, [r0, #4]
    adds r0, r4, #0
    bl func_08004768
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #1
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08004980

    thumb_func_start func_0800499C
func_0800499C: @ 0x0800499C
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r0, [r0, #4]
    adds r1, r4, #0
    bl SpawnProc
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #1
    pop {r4}
    pop {r1}
    bx r1
    func_end func_0800499C

    thumb_func_start func_080049B8
func_080049B8: @ 0x080049B8
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r0, [r0, #4]
    adds r1, r4, #0
    bl SpawnProcLocking
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #0
    pop {r4}
    pop {r1}
    bx r1
    func_end func_080049B8

    thumb_func_start func_080049D4
func_080049D4: @ 0x080049D4
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r0, [r0, #4]
    movs r2, #0x24
    ldrsh r1, [r4, r2]
    bl SpawnProc
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #1
    pop {r4}
    pop {r1}
    bx r1
    func_end func_080049D4

    thumb_func_start func_080049F4
func_080049F4: @ 0x080049F4
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r0, [r0, #4]
    bl Proc_Find
    rsbs r1, r0, #0
    orrs r1, r0
    cmp r1, #0
    blt .L08004A12
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #1
    b .L08004A14
.L08004A12:
    movs r0, #0
.L08004A14:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_080049F4

    thumb_func_start func_08004A1C
func_08004A1C: @ 0x08004A1C
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r0, [r0, #4]
    bl Proc_EndEach
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #1
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08004A1C

    thumb_func_start func_08004A38
func_08004A38: @ 0x08004A38
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #4]
    ldr r0, [r0, #4]
    bl func_08004888
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #1
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08004A38

    thumb_func_start func_08004A54
func_08004A54: @ 0x08004A54
    ldr r1, [r0, #4]
    adds r1, #8
    str r1, [r0, #4]
    movs r0, #1
    bx lr
    func_end func_08004A54

    thumb_func_start func_08004A60
func_08004A60: @ 0x08004A60
    push {lr}
    ldr r1, [r0, #4]
    ldr r1, [r1, #4]
    bl func_08004758
    movs r0, #1
    pop {r1}
    bx r1
    func_end func_08004A60

    thumb_func_start func_08004A70
func_08004A70: @ 0x08004A70
    push {lr}
    ldr r1, [r0, #4]
    movs r2, #2
    ldrsh r1, [r1, r2]
    bl Proc_Goto
    movs r0, #1
    pop {r1}
    bx r1
    func_end func_08004A70

    thumb_func_start func_08004A84
func_08004A84: @ 0x08004A84
    push {lr}
    adds r1, r0, #0
    ldrh r0, [r1, #0x24]
    subs r0, #1
    strh r0, [r1, #0x24]
    lsls r0, r0, #0x10
    cmp r0, #0
    bne .L08004A9A
    adds r0, r1, #0
    bl Proc_Break
.L08004A9A:
    pop {r0}
    bx r0
    func_end func_08004A84

    thumb_func_start func_08004AA0
func_08004AA0: @ 0x08004AA0
    adds r1, r0, #0
    ldr r0, [r1, #4]
    ldrh r2, [r0, #2]
    movs r3, #2
    ldrsh r0, [r0, r3]
    cmp r0, #0
    beq .L08004AB4
    strh r2, [r1, #0x24]
    ldr r0, .L08004AC0 @ =func_08004A84
    str r0, [r1, #0xc]
.L08004AB4:
    ldr r0, [r1, #4]
    adds r0, #8
    str r0, [r1, #4]
    movs r0, #0
    bx lr
    .align 2, 0
.L08004AC0: .4byte func_08004A84
    func_end func_08004AA0

    thumb_func_start func_08004AC4
func_08004AC4: @ 0x08004AC4
    ldr r1, [r0, #4]
    ldrh r1, [r1, #2]
    adds r2, r0, #0
    adds r2, #0x26
    strb r1, [r2]
    ldr r1, [r0, #4]
    adds r1, #8
    str r1, [r0, #4]
    movs r0, #1
    bx lr
    func_end func_08004AC4

    thumb_func_start func_08004AD8
func_08004AD8: @ 0x08004AD8
    ldr r1, [r0, #4]
    adds r1, #8
    str r1, [r0, #4]
    movs r0, #1
    bx lr
    func_end func_08004AD8

    thumb_func_start func_08004AE4
func_08004AE4: @ 0x08004AE4
    movs r0, #0
    bx lr
    func_end func_08004AE4

    thumb_func_start func_08004AE8
func_08004AE8: @ 0x08004AE8
    push {r4, r5, lr}
    adds r3, r0, #0
    ldr r2, .L08004B14 @ =gProcs
    movs r4, #0
    ldr r5, [r3]
    movs r1, #0x3f
.L08004AF4:
    ldr r0, [r2]
    cmp r0, r5
    bne .L08004AFC
    adds r4, #1
.L08004AFC:
    subs r1, #1
    adds r2, #0x6c
    cmp r1, #0
    bge .L08004AF4
    cmp r4, #1
    bgt .L08004B18
    ldr r0, [r3, #4]
    adds r0, #8
    str r0, [r3, #4]
    movs r0, #1
    b .L08004B20
    .align 2, 0
.L08004B14: .4byte gProcs
.L08004B18:
    adds r0, r3, #0
    bl Proc_End
    movs r0, #0
.L08004B20:
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_08004AE8

    thumb_func_start func_08004B28
func_08004B28: @ 0x08004B28
    push {r4, lr}
    adds r4, r0, #0
    ldr r2, .L08004B34 @ =gProcs
    movs r3, #0
    b .L08004B3C
    .align 2, 0
.L08004B34: .4byte gProcs
.L08004B38:
    adds r3, #1
    adds r2, #0x6c
.L08004B3C:
    cmp r3, #0x3f
    bgt .L08004B52
    cmp r2, r4
    beq .L08004B38
    ldr r1, [r2]
    ldr r0, [r4]
    cmp r1, r0
    bne .L08004B38
    adds r0, r2, #0
    bl Proc_End
.L08004B52:
    ldr r0, [r4, #4]
    adds r0, #8
    str r0, [r4, #4]
    movs r0, #1
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08004B28

    thumb_func_start func_08004B60
func_08004B60: @ 0x08004B60
    ldr r1, [r0, #4]
    adds r1, #8
    str r1, [r0, #4]
    movs r0, #1
    bx lr
    func_end func_08004B60

    thumb_func_start func_08004B6C
func_08004B6C: @ 0x08004B6C
    adds r2, r0, #0
    adds r2, #0x27
    movs r1, #4
    ldrb r3, [r2]
    orrs r1, r3
    strb r1, [r2]
    ldr r1, [r0, #4]
    adds r1, #8
    str r1, [r0, #4]
    movs r0, #1
    bx lr
    func_end func_08004B6C

    thumb_func_start func_08004B84
func_08004B84: @ 0x08004B84
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4]
    cmp r0, #0
    beq .L08004BC6
    adds r0, r4, #0
    adds r0, #0x28
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08004BC6
    ldr r0, [r4, #0xc]
    cmp r0, #0
    bne .L08004BC6
    ldr r5, .L08004BA4 @ =0x08B858A4
    b .L08004BAE
    .align 2, 0
.L08004BA4: .4byte 0x08B858A4
.L08004BA8:
    ldr r0, [r4]
    cmp r0, #0
    beq .L08004BC6
.L08004BAE:
    ldr r0, [r4, #4]
    movs r1, #0
    ldrsh r0, [r0, r1]
    lsls r0, r0, #2
    adds r0, r0, r5
    ldr r1, [r0]
    adds r0, r4, #0
    bl _call_via_r1
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L08004BA8
.L08004BC6:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08004B84

    thumb_func_start func_08004BCC
func_08004BCC: @ 0x08004BCC
    bx lr
    func_end func_08004BCC

    thumb_func_start func_08004BD0
func_08004BD0: @ 0x08004BD0
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, [r4, #0x20]
    cmp r0, #0
    beq .L08004BE0
    bl func_08004BD0
.L08004BE0:
    adds r0, r4, #0
    bl func_08004BCC
    ldr r1, [r4, #0x18]
    cmp r1, #0
    beq .L08004C00
    ldr r0, [r5]
    adds r0, #2
    str r0, [r5]
    adds r0, r1, #0
    adds r1, r5, #0
    bl func_08004BD0
    ldr r0, [r5]
    subs r0, #2
    str r0, [r5]
.L08004C00:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08004BD0

    thumb_func_start func_08004C08
func_08004C08: @ 0x08004C08
    push {r4, lr}
    sub sp, #4
    adds r4, r0, #0
    movs r0, #4
    str r0, [sp]
    adds r0, r4, #0
    bl func_08004BCC
    ldr r1, [r4, #0x18]
    cmp r1, #0
    beq .L08004C32
    ldr r0, [sp]
    adds r0, #2
    str r0, [sp]
    adds r0, r1, #0
    mov r1, sp
    bl func_08004BD0
    ldr r0, [sp]
    subs r0, #2
    str r0, [sp]
.L08004C32:
    add sp, #4
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08004C08

    thumb_func_start func_08004C3C
func_08004C3C: @ 0x08004C3C
    bx lr
    func_end func_08004C3C

    thumb_func_start func_08004C40
func_08004C40: @ 0x08004C40
    str r1, [r0, #0xc]
    bx lr
    func_end func_08004C40

    thumb_func_start func_08004C44
func_08004C44: @ 0x08004C44
    adds r0, #0x28
    ldrb r1, [r0]
    adds r1, #1
    strb r1, [r0]
    bx lr
    func_end func_08004C44

    thumb_func_start func_08004C50
func_08004C50: @ 0x08004C50
    adds r0, #0x28
    ldrb r1, [r0]
    subs r1, #1
    strb r1, [r0]
    bx lr
    func_end func_08004C50

    thumb_func_start func_08004C5C
func_08004C5C: @ 0x08004C5C
    adds r3, r0, #0
    cmp r1, #0
    bne .L08004C70
    ldr r1, .L08004C68 @ =gProcs
    b .L08004C72
    .align 2, 0
.L08004C68: .4byte gProcs
.L08004C6C:
    adds r0, r1, #0
    b .L08004C88
.L08004C70:
    adds r1, #0x6c
.L08004C72:
    ldr r0, .L08004C8C @ =gProcAllocList
    cmp r1, r0
    bhs .L08004C86
    adds r2, r0, #0
.L08004C7A:
    ldr r0, [r1]
    cmp r0, r3
    beq .L08004C6C
    adds r1, #0x6c
    cmp r1, r2
    blo .L08004C7A
.L08004C86:
    movs r0, #0
.L08004C88:
    bx lr
    .align 2, 0
.L08004C8C: .4byte gProcAllocList
    func_end func_08004C5C

    thumb_func_start func_08004C90
func_08004C90: @ 0x08004C90
    adds r2, r0, #0
    cmp r2, #0
    bne .L08004CA4
    ldr r2, .L08004C9C @ =gProcs
    b .L08004CA6
    .align 2, 0
.L08004C9C: .4byte gProcs
.L08004CA0:
    adds r0, r2, #0
    b .L08004CBC
.L08004CA4:
    adds r2, #0x6c
.L08004CA6:
    ldr r0, .L08004CC0 @ =gProcAllocList
    cmp r2, r0
    bhs .L08004CBA
    adds r3, r0, #0
.L08004CAE:
    ldr r0, [r2, #0x14]
    cmp r0, r1
    beq .L08004CA0
    adds r2, #0x6c
    cmp r2, r3
    blo .L08004CAE
.L08004CBA:
    movs r0, #0
.L08004CBC:
    bx lr
    .align 2, 0
.L08004CC0: .4byte gProcAllocList
    func_end func_08004C90

    thumb_func_start func_08004CC4
func_08004CC4: @ 0x08004CC4
    movs r2, #0x40
    ldr r1, .L08004CE0 @ =gProcs
    ldr r0, .L08004CE4 @ =0x00001A94
    adds r3, r1, r0
.L08004CCC:
    ldr r0, [r1]
    cmp r0, #0
    beq .L08004CD4
    subs r2, #1
.L08004CD4:
    adds r1, #0x6c
    cmp r1, r3
    ble .L08004CCC
    adds r0, r2, #0
    bx lr
    .align 2, 0
.L08004CE0: .4byte gProcs
.L08004CE4: .4byte 0x00001A94
    func_end func_08004CC4

    thumb_func_start InitIcons
InitIcons: @ 0x08004CE8
    push {lr}
    bl ClearIcons
    pop {r0}
    bx r0
    func_end InitIcons

    thumb_func_start ClearIcons
ClearIcons: @ 0x08004CF4
    push {r4, lr}
    sub sp, #4
    mov r0, sp
    movs r4, #0
    strh r4, [r0]
    ldr r1, .L08004D1C @ =gIconStatusTable
    ldr r2, .L08004D20 @ =0x01000160
    bl CpuSet
    mov r0, sp
    adds r0, #2
    strh r4, [r0]
    ldr r1, .L08004D24 @ =gIconDisplayList
    ldr r2, .L08004D28 @ =0x01000010
    bl CpuSet
    add sp, #4
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08004D1C: .4byte gIconStatusTable
.L08004D20: .4byte 0x01000160
.L08004D24: .4byte gIconDisplayList
.L08004D28: .4byte 0x01000010
    func_end ClearIcons

    thumb_func_start ApplyIconPalettes
ApplyIconPalettes: @ 0x08004D2C
    push {lr}
    adds r1, r0, #0
    ldr r0, .L08004D40 @ =0x080CBEA4
    lsls r1, r1, #5
    movs r2, #0x40
    bl ApplyPaletteExt
    pop {r0}
    bx r0
    .align 2, 0
.L08004D40: .4byte 0x080CBEA4
    func_end ApplyIconPalettes

    thumb_func_start ApplyIconPalette
ApplyIconPalette: @ 0x08004D44
    push {lr}
    lsls r0, r0, #5
    ldr r2, .L08004D58 @ =0x080CBEA4
    adds r0, r0, r2
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    pop {r0}
    bx r0
    .align 2, 0
.L08004D58: .4byte 0x080CBEA4
    func_end ApplyIconPalette

    thumb_func_start CountActiveIcons
CountActiveIcons: @ 0x08004D5C
    movs r2, #0
    movs r1, #0x1f
    ldr r3, .L08004D78 @ =gIconDisplayList
.L08004D62:
    adds r0, r1, r3
    ldrb r0, [r0]
    cmp r0, #0
    beq .L08004D6C
    adds r2, #1
.L08004D6C:
    subs r1, #1
    cmp r1, #0
    bge .L08004D62
    adds r0, r2, #0
    bx lr
    .align 2, 0
.L08004D78: .4byte gIconDisplayList
    func_end CountActiveIcons

    thumb_func_start IconSlot2Chr
IconSlot2Chr: @ 0x08004D7C
    adds r1, r0, #0
    lsls r1, r1, #2
    movs r2, #0xc0
    lsls r2, r2, #2
    adds r0, r2, #0
    subs r0, r0, r1
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    bx lr
    func_end IconSlot2Chr

    thumb_func_start GetNewIconSlot
GetNewIconSlot: @ 0x08004D90
    push {r4, lr}
    movs r2, #0
    ldr r4, .L08004DA8 @ =gIconDisplayList
    adds r3, r0, #1
.L08004D98:
    adds r1, r2, r4
    ldrb r0, [r1]
    cmp r0, #0
    bne .L08004DAC
    strb r3, [r1]
    adds r0, r2, #0
    b .L08004DB6
    .align 2, 0
.L08004DA8: .4byte gIconDisplayList
.L08004DAC:
    adds r2, #1
    cmp r2, #0x1f
    ble .L08004D98
    movs r0, #1
    rsbs r0, r0, #0
.L08004DB6:
    pop {r4}
    pop {r1}
    bx r1
    func_end GetNewIconSlot

    thumb_func_start GetIconChr
GetIconChr: @ 0x08004DBC
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, .L08004DD8 @ =gIconStatusTable
    lsls r1, r4, #2
    adds r5, r1, r0
    ldrb r0, [r5, #1]
    cmp r0, #0
    beq .L08004DDC
    ldrb r0, [r5]
    cmp r0, #0xfe
    bhi .L08004E10
    adds r0, #1
    strb r0, [r5]
    b .L08004E10
    .align 2, 0
.L08004DD8: .4byte gIconStatusTable
.L08004DDC:
    ldrb r0, [r5]
    adds r0, #1
    strb r0, [r5]
    adds r0, r4, #0
    bl GetNewIconSlot
    adds r0, #1
    strb r0, [r5, #1]
    lsls r4, r4, #7
    ldr r0, .L08004E20 @ =0x080C5EA4
    adds r4, r4, r0
    ldrb r0, [r5, #1]
    bl IconSlot2Chr
    adds r1, r0, #0
    lsls r1, r1, #0x10
    lsrs r1, r1, #0xb
    movs r2, #0xc0
    lsls r2, r2, #0x13
    ldr r0, .L08004E24 @ =0x0001FFE0
    ands r1, r0
    adds r1, r1, r2
    adds r0, r4, #0
    movs r2, #0x80
    bl RegisterDataMove
.L08004E10:
    ldrb r0, [r5, #1]
    bl IconSlot2Chr
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08004E20: .4byte 0x080C5EA4
.L08004E24: .4byte 0x0001FFE0
    func_end GetIconChr

    thumb_func_start PutIcon
PutIcon: @ 0x08004E28
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r0, r1, #0
    adds r5, r2, #0
    cmp r0, #0
    bge .L08004E44
    movs r0, #0
    strh r0, [r4]
    strh r0, [r4, #2]
    adds r1, r4, #0
    adds r1, #0x40
    strh r0, [r1]
    adds r1, #2
    b .L08004E70
.L08004E44:
    bl GetIconChr
    adds r0, r0, r5
    lsls r0, r0, #0x10
    lsrs r1, r0, #0x10
    movs r2, #0x80
    lsls r2, r2, #9
    adds r0, r0, r2
    strh r1, [r4]
    lsrs r1, r0, #0x10
    adds r0, r0, r2
    strh r1, [r4, #2]
    adds r2, r4, #0
    adds r2, #0x40
    lsrs r1, r0, #0x10
    movs r3, #0x80
    lsls r3, r3, #9
    adds r0, r0, r3
    lsrs r0, r0, #0x10
    strh r1, [r2]
    adds r1, r4, #0
    adds r1, #0x42
.L08004E70:
    strh r0, [r1]
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end PutIcon

    thumb_func_start ClearIcon
ClearIcon: @ 0x08004E78
    ldr r2, .L08004E90 @ =gIconDisplayList
    ldr r1, .L08004E94 @ =gIconStatusTable
    lsls r0, r0, #2
    adds r0, r0, r1
    ldrb r1, [r0, #1]
    subs r1, #1
    adds r1, r1, r2
    movs r2, #0
    strb r2, [r1]
    strb r2, [r0, #1]
    bx lr
    .align 2, 0
.L08004E90: .4byte gIconDisplayList
.L08004E94: .4byte gIconStatusTable
    func_end ClearIcon

    thumb_func_start ApplyIconObjImg
ApplyIconObjImg: @ 0x08004E98
    push {r4, r5, lr}
    adds r2, r0, #0
    ldr r5, .L08004EC4 @ =0x06010000
    ldr r0, .L08004EC8 @ =0x000003FF
    ands r0, r1
    lsls r0, r0, #5
    adds r5, r0, r5
    cmp r2, #0
    bge .L08004ECC
    movs r0, #0
    adds r1, r5, #0
    movs r2, #0x40
    bl RegisterDataFill
    movs r0, #0x80
    lsls r0, r0, #3
    adds r1, r5, r0
    movs r0, #0
    movs r2, #0x40
    bl RegisterDataFill
    b .L08004EEC
    .align 2, 0
.L08004EC4: .4byte 0x06010000
.L08004EC8: .4byte 0x000003FF
.L08004ECC:
    ldr r4, .L08004EF4 @ =0x080C5EA4
    lsls r0, r2, #7
    adds r4, r0, r4
    adds r0, r4, #0
    adds r1, r5, #0
    movs r2, #0x40
    bl RegisterDataMove
    adds r4, #0x40
    movs r0, #0x80
    lsls r0, r0, #3
    adds r1, r5, r0
    adds r0, r4, #0
    movs r2, #0x40
    bl RegisterDataMove
.L08004EEC:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08004EF4: .4byte 0x080C5EA4
    func_end ApplyIconObjImg

    thumb_func_start func_08004EF8
func_08004EF8: @ 0x08004EF8
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    adds r6, r1, #0
    cmp r6, #0
    bne .L08004F06
    movs r6, #0xb0
    lsls r6, r6, #7
.L08004F06:
    adds r0, r5, #0
    movs r1, #0
    bl SetBgChrOffset
    adds r0, r5, #0
    movs r1, #0
    bl func_080014DC
    ldr r0, .L08004F5C @ =0x08B8590C
    ldr r1, .L08004F60 @ =0x0001FFFF
    ands r1, r6
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r1, r1, r2
    movs r2, #0x80
    lsls r2, r2, #4
    bl RegisterDataMove
    ldr r1, .L08004F64 @ =gPal
    movs r0, #0
    strh r0, [r1]
    ldr r0, .L08004F68 @ =0x00007FFF
    strh r0, [r1, #4]
    bl EnablePalSync
    adds r0, r5, #0
    bl func_08002BE8
    movs r1, #0
    bl TmFill
    ldr r4, .L08004F6C @ =gDebugText
    strh r5, [r4, #4]
    str r6, [r4]
    adds r0, r5, #0
    adds r1, r6, #0
    bl func_080013CC
    strh r0, [r4, #6]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08004F5C: .4byte 0x08B8590C
.L08004F60: .4byte 0x0001FFFF
.L08004F64: .4byte gPal
.L08004F68: .4byte 0x00007FFF
.L08004F6C: .4byte gDebugText
    func_end func_08004EF8

    thumb_func_start DebugPutStr
DebugPutStr: @ 0x08004F70
    push {r4, r5, r6, r7, lr}
    adds r2, r0, #0
    ldrb r0, [r1]
    ldr r5, .L08004F90 @ =gDebugText
    cmp r0, #0
    beq .L08004FAE
    adds r3, r5, #0
    ldr r4, .L08004F94 @ =0x0000FFC0
.L08004F80:
    cmp r0, #0x60
    bls .L08004F98
    ldrh r6, [r3, #6]
    adds r0, r6, r4
    ldrb r7, [r1]
    adds r0, r7, r0
    b .L08004FA2
    .align 2, 0
.L08004F90: .4byte gDebugText
.L08004F94: .4byte 0x0000FFC0
.L08004F98:
    ldrh r6, [r3, #6]
    ldr r7, .L08004FBC @ =0x0000FFE0
    adds r0, r6, r7
    ldrb r6, [r1]
    adds r0, r6, r0
.L08004FA2:
    strh r0, [r2]
    adds r2, #2
    adds r1, #1
    ldrb r0, [r1]
    cmp r0, #0
    bne .L08004F80
.L08004FAE:
    movs r7, #4
    ldrsh r0, [r5, r7]
    bl func_08001018
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08004FBC: .4byte 0x0000FFE0
    func_end DebugPutStr

    thumb_func_start func_08004FC0
func_08004FC0: @ 0x08004FC0
    push {r1, r2, r3}
    push {lr}
    sub sp, #0x100
    mov r1, sp
    bl DebugPutStr
    add sp, #0x100
    pop {r3}
    add sp, #0xc
    bx r3
    func_end func_08004FC0

    thumb_func_start func_08004FD4
func_08004FD4: @ 0x08004FD4
    push {r4, r5, r6, lr}
    movs r1, #0
    ldr r2, .L08005010 @ =gDebugText
    ldr r6, .L08005014 @ =gBg2Tm
    movs r5, #0xff
    adds r4, r2, #0
    adds r4, #0x14
    movs r3, #0
.L08004FE4:
    adds r0, r1, #0
    ands r0, r5
    lsls r0, r0, #5
    adds r0, r0, r4
    strb r3, [r0]
    adds r1, #1
    cmp r1, #0xff
    ble .L08004FE4
    movs r0, #0
    str r0, [r2, #8]
    str r0, [r2, #0xc]
    adds r0, r6, #0
    movs r1, #0
    bl TmFill
    movs r0, #4
    bl EnableBgSync
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08005010: .4byte gDebugText
.L08005014: .4byte gBg2Tm
    func_end func_08004FD4

    thumb_func_start func_08005018
func_08005018: @ 0x08005018
    push {r0, r1, r2, r3}
    push {lr}
    sub sp, #0x100
    mov r0, sp
    bl func_08005134
    add sp, #0x100
    pop {r3}
    add sp, #0x10
    bx r3
    func_end func_08005018

    thumb_func_start func_0800502C
func_0800502C: @ 0x0800502C
    ldr r1, .L0800503C @ =gNumberStr
    ldr r0, .L08005040 @ =0x20202020
    stm r1!, {r0}
    str r0, [r1]
    ldr r1, .L0800503C @ =gNumberStr
    movs r0, #0
    strb r0, [r1, #8]
    bx lr
    .align 2, 0
.L0800503C: .4byte gNumberStr
.L08005040: .4byte 0x20202020
    func_end func_0800502C

    thumb_func_start func_08005044
func_08005044: @ 0x08005044
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    bl func_0800502C
    movs r6, #7
    b .L08005056
.L08005050:
    subs r6, #1
    cmp r6, #0
    blt .L08005074
.L08005056:
    ldr r4, .L0800507C @ =gNumberStr
    adds r4, r6, r4
    adds r0, r5, #0
    movs r1, #0xa
    bl __modsi3
    adds r0, #0x30
    strb r0, [r4]
    adds r0, r5, #0
    movs r1, #0xa
    bl __divsi3
    adds r5, r0, #0
    cmp r5, #0
    bne .L08005050
.L08005074:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800507C: .4byte gNumberStr
    func_end func_08005044

    thumb_func_start func_08005080
func_08005080: @ 0x08005080
    push {r4, lr}
    adds r4, r0, #0
    bl func_0800502C
    cmp r4, #0xff
    beq .L08005094
    movs r0, #1
    rsbs r0, r0, #0
    cmp r4, r0
    bne .L080050A4
.L08005094:
    ldr r1, .L080050A0 @ =gNumberStr
    movs r0, #0x3a
    strb r0, [r1, #7]
    strb r0, [r1, #6]
    b .L080050AA
    .align 2, 0
.L080050A0: .4byte gNumberStr
.L080050A4:
    adds r0, r4, #0
    bl func_08005044
.L080050AA:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08005080

    thumb_func_start func_080050B0
func_080050B0: @ 0x080050B0
    push {r4, lr}
    adds r4, r1, #0
    bl func_08005044
    ldr r0, .L080050C8 @ =0x02028D4C
    subs r0, r0, r4
    bl func_08005134
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L080050C8: .4byte 0x02028D4C
    func_end func_080050B0

    thumb_func_start func_080050CC
func_080050CC: @ 0x080050CC
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    bl func_0800502C
    movs r2, #7
    ldr r1, .L08005110 @ =gNumberStr
    ldr r3, .L08005114 @ =0x08193D8C
    movs r0, #0xf
    ands r0, r4
    adds r0, r0, r3
    ldrb r0, [r0]
    strb r0, [r1, #7]
    asrs r4, r4, #4
    cmp r4, #0
    beq .L08005108
    adds r6, r1, #0
    adds r5, r3, #0
    movs r3, #0xf
.L080050F0:
    subs r2, #1
    cmp r2, #0
    blt .L08005108
    adds r0, r2, r6
    adds r1, r4, #0
    ands r1, r3
    adds r1, r1, r5
    ldrb r1, [r1]
    strb r1, [r0]
    asrs r4, r4, #4
    cmp r4, #0
    bne .L080050F0
.L08005108:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08005110: .4byte gNumberStr
.L08005114: .4byte 0x08193D8C
    func_end func_080050CC

    thumb_func_start func_08005118
func_08005118: @ 0x08005118
    push {r4, lr}
    adds r4, r1, #0
    bl func_080050CC
    ldr r0, .L08005130 @ =0x02028D4C
    subs r0, r0, r4
    bl func_08005134
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08005130: .4byte 0x02028D4C
    func_end func_08005118

    thumb_func_start func_08005134
func_08005134: @ 0x08005134
    push {r4, lr}
    adds r4, r0, #0
    ldrb r0, [r4]
    ldr r1, .L08005150 @ =gDebugText
    mov ip, r1
    cmp r0, #0
    beq .L08005186
    mov r3, ip
.L08005144:
    ldrb r2, [r4]
    ldr r0, [r3, #8]
    cmp r0, #0x30
    bne .L08005154
    movs r2, #0
    b .L08005156
    .align 2, 0
.L08005150: .4byte gDebugText
.L08005154:
    adds r4, #1
.L08005156:
    cmp r2, #0xa
    bne .L0800515C
    movs r2, #0
.L0800515C:
    ldrb r0, [r3, #0xc]
    lsls r1, r0, #5
    ldr r0, [r3, #8]
    adds r0, r0, r1
    adds r1, r3, #0
    adds r1, #0x14
    adds r0, r0, r1
    strb r2, [r0]
    ldr r0, [r3, #8]
    adds r0, #1
    str r0, [r3, #8]
    cmp r2, #0
    bne .L08005180
    mov r1, ip
    str r2, [r1, #8]
    ldr r0, [r1, #0xc]
    adds r0, #1
    str r0, [r1, #0xc]
.L08005180:
    ldrb r0, [r4]
    cmp r0, #0
    bne .L08005144
.L08005186:
    mov r2, ip
    ldr r0, [r2, #0x10]
    adds r0, #0x14
    ldr r1, [r2, #0xc]
    cmp r1, r0
    bls .L08005198
    adds r0, r1, #0
    subs r0, #0x14
    str r0, [r2, #0x10]
.L08005198:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08005134

    thumb_func_start func_080051A0
func_080051A0: @ 0x080051A0
    push {r4, r5, r6, r7, lr}
    ldr r0, .L080051E8 @ =gBg2Tm
    movs r1, #0
    bl TmFill
    movs r3, #0
    ldr r7, .L080051EC @ =gDebugText
    movs r0, #0x14
    adds r0, r0, r7
    mov ip, r0
    movs r6, #0xff
.L080051B6:
    lsls r1, r3, #6
    ldr r0, .L080051E8 @ =gBg2Tm
    adds r2, r1, r0
    ldr r0, [r7, #0x10]
    adds r0, r3, r0
    ands r0, r6
    lsls r0, r0, #5
    add r0, ip
    ldrb r0, [r0]
    adds r5, r3, #1
    cmp r0, #0
    beq .L08005206
    ldr r4, .L080051EC @ =gDebugText
    ldr r0, [r4, #0x10]
    adds r0, r3, r0
    ands r0, r6
    lsls r0, r0, #5
    adds r1, r4, #0
    adds r1, #0x14
    adds r1, r0, r1
.L080051DE:
    ldrb r0, [r1]
    cmp r0, #0x60
    bls .L080051F0
    subs r0, #0x40
    b .L080051F2
    .align 2, 0
.L080051E8: .4byte gBg2Tm
.L080051EC: .4byte gDebugText
.L080051F0:
    subs r0, #0x20
.L080051F2:
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    ldrh r3, [r4, #6]
    adds r0, r3, r0
    strh r0, [r2]
    adds r2, #2
    adds r1, #1
    ldrb r0, [r1]
    cmp r0, #0
    bne .L080051DE
.L08005206:
    adds r3, r5, #0
    cmp r3, #0x13
    ble .L080051B6
    movs r0, #4
    bl EnableBgSync
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_080051A0

    thumb_func_start func_08005218
func_08005218: @ 0x08005218
    push {r4, lr}
    lsls r0, r0, #0x10
    lsrs r4, r0, #0x10
    lsls r1, r1, #0x10
    lsrs r1, r1, #0x10
    movs r0, #2
    ands r1, r0
    cmp r1, #0
    beq .L0800522E
    movs r0, #0
    b .L08005272
.L0800522E:
    bl func_080051A0
    ldr r3, .L08005278 @ =gDebugText
    ldr r0, [r3, #0xc]
    ldr r2, .L0800527C @ =0xFFFFFF00
    adds r1, r0, r2
    cmp r1, #0
    bge .L08005240
    movs r1, #0
.L08005240:
    adds r2, r0, #0
    subs r2, #0x14
    cmp r2, #0
    bge .L0800524A
    movs r2, #0
.L0800524A:
    movs r0, #0x40
    ands r0, r4
    cmp r0, #0
    beq .L0800525C
    ldr r0, [r3, #0x10]
    cmp r1, r0
    bhs .L0800525C
    subs r0, #1
    str r0, [r3, #0x10]
.L0800525C:
    movs r0, #0x80
    ands r0, r4
    cmp r0, #0
    beq .L08005270
    ldr r1, .L08005278 @ =gDebugText
    ldr r0, [r1, #0x10]
    cmp r2, r0
    bls .L08005270
    adds r0, #1
    str r0, [r1, #0x10]
.L08005270:
    movs r0, #1
.L08005272:
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08005278: .4byte gDebugText
.L0800527C: .4byte 0xFFFFFF00
    func_end func_08005218

    thumb_func_start func_08005280
func_08005280: @ 0x08005280
    push {r4, lr}
    adds r2, r0, #0
    adds r4, r1, #0
    cmp r2, #0
    bge .L0800528E
    movs r2, #0xc0
    lsls r2, r2, #6
.L0800528E:
    ldr r0, .L080052F0 @ =0x0000FFFF
    ands r2, r0
    ldr r1, .L080052F4 @ =gDebugOam2Chr
    adds r0, r2, #0
    asrs r0, r0, #5
    str r0, [r1]
    ldr r1, .L080052F8 @ =gDebugOam2Pal
    movs r0, #0xf
    ands r0, r4
    lsls r0, r0, #0xc
    str r0, [r1]
    ldr r0, .L080052FC @ =0x08B8590C
    movs r3, #0x80
    lsls r3, r3, #9
    adds r1, r2, r3
    ldr r2, .L08005300 @ =0x0001FFFF
    ands r1, r2
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r1, r1, r2
    movs r2, #0x80
    lsls r2, r2, #4
    bl RegisterDataMove
    ldr r3, .L08005304 @ =gPal
    adds r1, r4, #0
    adds r1, #0x10
    lsls r0, r1, #5
    adds r0, r0, r3
    movs r2, #0
    strh r2, [r0]
    lsls r1, r1, #4
    adds r0, r1, #1
    lsls r0, r0, #1
    adds r0, r0, r3
    movs r2, #0xf8
    lsls r2, r2, #7
    strh r2, [r0]
    adds r1, #2
    lsls r1, r1, #1
    adds r1, r1, r3
    ldr r0, .L08005308 @ =0x00007FFF
    strh r0, [r1]
    bl EnablePalSync
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L080052F0: .4byte 0x0000FFFF
.L080052F4: .4byte gDebugOam2Chr
.L080052F8: .4byte gDebugOam2Pal
.L080052FC: .4byte 0x08B8590C
.L08005300: .4byte 0x0001FFFF
.L08005304: .4byte gPal
.L08005308: .4byte 0x00007FFF
    func_end func_08005280

    thumb_func_start func_0800530C
func_0800530C: @ 0x0800530C
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    adds r6, r1, #0
    adds r4, r2, #0
    b .L0800533E
.L08005316:
    cmp r0, #0x60
    bls .L0800531E
    subs r0, #0x40
    b .L08005320
.L0800531E:
    subs r0, #0x20
.L08005320:
    lsls r0, r0, #0x18
    lsrs r1, r0, #0x18
    ldr r0, .L0800534C @ =gDebugOam2Chr
    ldr r3, [r0]
    adds r3, r1, r3
    ldr r0, .L08005350 @ =gDebugOam2Pal
    ldr r0, [r0]
    adds r3, r3, r0
    adds r0, r5, #0
    adds r1, r6, #0
    ldr r2, .L08005354 @ =0x08B905B0
    bl PutOamHiRam
    adds r5, #8
    adds r4, #1
.L0800533E:
    ldrb r0, [r4]
    cmp r0, #0
    bne .L08005316
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800534C: .4byte gDebugOam2Chr
.L08005350: .4byte gDebugOam2Pal
.L08005354: .4byte 0x08B905B0
    func_end func_0800530C

    thumb_func_start func_08005358
func_08005358: @ 0x08005358
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    adds r6, r1, #0
    adds r0, r2, #0
    adds r4, r3, #0
    bl func_08005044
    ldr r2, .L08005378 @ =0x02028D4C
    subs r2, r2, r4
    adds r0, r5, #0
    adds r1, r6, #0
    bl func_0800530C
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08005378: .4byte 0x02028D4C
    func_end func_08005358

    thumb_func_start func_0800537C
func_0800537C: @ 0x0800537C
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    adds r6, r1, #0
    adds r0, r2, #0
    adds r4, r3, #0
    bl func_080050CC
    ldr r2, .L0800539C @ =0x02028D4C
    subs r2, r2, r4
    adds r0, r5, #0
    adds r1, r6, #0
    bl func_0800530C
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800539C: .4byte 0x02028D4C
    func_end func_0800537C

    thumb_func_start GetLang
GetLang: @ 0x080053A0
    movs r0, #0
    bx lr
    func_end GetLang

    thumb_func_start SetLang
SetLang: @ 0x080053A4
    ldr r1, .L080053AC @ =gLang
    strb r0, [r1]
    bx lr
    .align 2, 0
.L080053AC: .4byte gLang
    func_end SetLang

    thumb_func_start ResetText
ResetText: @ 0x080053B0
    push {lr}
    ldr r0, .L080053C8 @ =gDefaultFont
    ldr r1, .L080053CC @ =0x06001000
    movs r2, #0x80
    movs r3, #0
    bl InitTextFont
    ldr r1, .L080053D0 @ =gSpecialCharList
    movs r0, #0xff
    strb r0, [r1]
    pop {r0}
    bx r0
    .align 2, 0
.L080053C8: .4byte gDefaultFont
.L080053CC: .4byte 0x06001000
.L080053D0: .4byte gSpecialCharList
    func_end ResetText

    thumb_func_start InitTextFont
InitTextFont: @ 0x080053D4
    push {r4, lr}
    adds r4, r0, #0
    cmp r4, #0
    bne .L080053DE
    ldr r4, .L08005408 @ =gDefaultFont
.L080053DE:
    str r1, [r4]
    ldr r0, .L0800540C @ =func_0800587C
    str r0, [r4, #0xc]
    movs r1, #0
    strh r3, [r4, #0x14]
    lsls r0, r3, #0xc
    adds r0, r2, r0
    strh r0, [r4, #0x10]
    strh r1, [r4, #0x12]
    bl GetLang
    strb r0, [r4, #0x16]
    adds r0, r4, #0
    bl SetTextFont
    bl InitSystemTextFont
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08005408: .4byte gDefaultFont
.L0800540C: .4byte func_0800587C
    func_end InitTextFont

    thumb_func_start SetTextFontGlyphs
SetTextFontGlyphs: @ 0x08005410
    cmp r0, #0
    bne .L08005424
    ldr r0, .L0800541C @ =gFont
    ldr r1, [r0]
    ldr r0, .L08005420 @ =0x08B896B0
    b .L0800542A
    .align 2, 0
.L0800541C: .4byte gFont
.L08005420: .4byte 0x08B896B0
.L08005424:
    ldr r0, .L08005430 @ =gFont
    ldr r1, [r0]
    ldr r0, .L08005434 @ =0x08B8B5B0
.L0800542A:
    str r0, [r1, #4]
    bx lr
    .align 2, 0
.L08005430: .4byte gFont
.L08005434: .4byte 0x08B8B5B0
    func_end SetTextFontGlyphs

    thumb_func_start ResetTextFont
ResetTextFont: @ 0x08005438
    ldr r0, .L08005448 @ =gFont
    ldr r1, [r0]
    movs r0, #0
    strh r0, [r1, #0x12]
    ldr r1, .L0800544C @ =gSpecialCharList
    movs r0, #0xff
    strb r0, [r1]
    bx lr
    .align 2, 0
.L08005448: .4byte gFont
.L0800544C: .4byte gSpecialCharList
    func_end ResetTextFont

    thumb_func_start SetTextFont
SetTextFont: @ 0x08005450
    adds r1, r0, #0
    cmp r1, #0
    bne .L08005468
    ldr r1, .L08005460 @ =gFont
    ldr r0, .L08005464 @ =gDefaultFont
    str r0, [r1]
    b .L0800546C
    .align 2, 0
.L08005460: .4byte gFont
.L08005464: .4byte gDefaultFont
.L08005468:
    ldr r0, .L08005470 @ =gFont
    str r1, [r0]
.L0800546C:
    bx lr
    .align 2, 0
.L08005470: .4byte gFont
    func_end SetTextFont

    thumb_func_start InitText
InitText: @ 0x08005474
    push {r4, lr}
    ldr r2, .L08005498 @ =gFont
    ldr r4, [r2]
    ldrh r3, [r4, #0x12]
    movs r2, #0
    strh r3, [r0]
    strb r1, [r0, #4]
    strb r2, [r0, #6]
    strb r2, [r0, #5]
    strb r2, [r0, #7]
    ldrh r2, [r4, #0x12]
    adds r1, r2, r1
    strh r1, [r4, #0x12]
    bl ClearText
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08005498: .4byte gFont
    func_end InitText

    thumb_func_start func_0800549C
func_0800549C: @ 0x0800549C
    push {r4, lr}
    ldr r2, .L080054C0 @ =gFont
    ldr r3, [r2]
    ldrh r2, [r3, #0x12]
    movs r4, #0
    strh r2, [r0]
    strb r1, [r0, #4]
    strb r4, [r0, #6]
    movs r2, #1
    strb r2, [r0, #5]
    strb r4, [r0, #7]
    lsls r1, r1, #1
    ldrh r0, [r3, #0x12]
    adds r1, r0, r1
    strh r1, [r3, #0x12]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L080054C0: .4byte gFont
    func_end func_0800549C

    thumb_func_start func_080054C4
func_080054C4: @ 0x080054C4
    push {r4, lr}
    adds r4, r0, #0
    b .L080054D4
.L080054CA:
    ldr r0, [r4]
    ldrb r1, [r4, #4]
    bl InitText
    adds r4, #8
.L080054D4:
    ldr r0, [r4]
    cmp r0, #0
    bne .L080054CA
    pop {r4}
    pop {r0}
    bx r0
    func_end func_080054C4

    thumb_func_start ClearText
ClearText: @ 0x080054E0
    push {r4, lr}
    sub sp, #4
    adds r4, r0, #0
    movs r0, #0
    strb r0, [r4, #2]
    strb r0, [r4, #3]
    str r0, [sp]
    ldr r0, .L08005514 @ =gFont
    ldr r0, [r0]
    ldr r1, [r0, #0xc]
    adds r0, r4, #0
    bl _call_via_r1
    adds r1, r0, #0
    ldrb r4, [r4, #4]
    lsls r2, r4, #4
    movs r0, #0x80
    lsls r0, r0, #0x11
    orrs r2, r0
    mov r0, sp
    bl CpuFastSet
    add sp, #4
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08005514: .4byte gFont
    func_end ClearText

    thumb_func_start func_08005518
func_08005518: @ 0x08005518
    push {r4, r5, r6, lr}
    sub sp, #4
    ldr r3, .L08005554 @ =gFont
    ldr r4, [r3]
    ldrb r5, [r0, #4]
    ldrb r6, [r0, #6]
    adds r3, r5, #0
    muls r3, r6, r3
    ldrh r0, [r0]
    adds r3, r0, r3
    adds r3, r3, r1
    lsls r3, r3, #6
    ldr r1, [r4]
    adds r1, r1, r3
    movs r0, #0
    str r0, [sp]
    lsls r2, r2, #4
    ldr r0, .L08005558 @ =0x001FFFFF
    ands r2, r0
    movs r0, #0x80
    lsls r0, r0, #0x11
    orrs r2, r0
    mov r0, sp
    bl CpuFastSet
    add sp, #4
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08005554: .4byte gFont
.L08005558: .4byte 0x001FFFFF
    func_end func_08005518

    thumb_func_start func_0800555C
func_0800555C: @ 0x0800555C
    ldrb r2, [r0, #4]
    ldrb r3, [r0, #6]
    adds r1, r2, #0
    muls r1, r3, r1
    ldrh r0, [r0]
    adds r1, r0, r1
    lsls r1, r1, #1
    adds r0, r1, #0
    bx lr
    func_end func_0800555C

    thumb_func_start func_08005570
func_08005570: @ 0x08005570
    ldrb r0, [r0, #2]
    bx lr
    func_end func_08005570

    thumb_func_start Text_SetCursor
Text_SetCursor: @ 0x08005574
    strb r1, [r0, #2]
    bx lr
    func_end Text_SetCursor

    thumb_func_start Text_Skip
Text_Skip: @ 0x08005578
    ldrb r2, [r0, #2]
    adds r1, r2, r1
    strb r1, [r0, #2]
    bx lr
    func_end Text_Skip

    thumb_func_start Text_SetColor
Text_SetColor: @ 0x08005580
    strb r1, [r0, #3]
    bx lr
    func_end Text_SetColor

    thumb_func_start func_08005584
func_08005584: @ 0x08005584
    ldrb r0, [r0, #3]
    bx lr
    func_end func_08005584

    thumb_func_start func_08005588
func_08005588: @ 0x08005588
    strb r1, [r0, #2]
    strb r2, [r0, #3]
    bx lr
    func_end func_08005588

    thumb_func_start func_08005590
func_08005590: @ 0x08005590
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r2, r1, #0
    ldr r0, .L080055DC @ =gFont
    ldr r1, [r0]
    ldrb r3, [r4, #4]
    ldrb r5, [r4, #6]
    adds r0, r5, #0
    muls r0, r3, r0
    ldrh r5, [r4]
    adds r0, r5, r0
    lsls r0, r0, #1
    ldrh r1, [r1, #0x10]
    adds r1, r1, r0
    cmp r3, #0
    beq .L080055C4
.L080055B0:
    strh r1, [r2]
    adds r1, #1
    adds r0, r2, #0
    adds r0, #0x40
    strh r1, [r0]
    adds r1, #1
    adds r2, #2
    subs r3, #1
    cmp r3, #0
    bne .L080055B0
.L080055C4:
    movs r0, #5
    ldrsb r0, [r4, r0]
    cmp r0, #0
    beq .L080055D4
    movs r0, #1
    ldrb r1, [r4, #6]
    eors r0, r1
    strb r0, [r4, #6]
.L080055D4:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080055DC: .4byte gFont
    func_end func_08005590

    thumb_func_start func_080055E0
func_080055E0: @ 0x080055E0
    ldrb r0, [r0, #4]
    cmp r0, #0
    beq .L080055FA
    movs r3, #0
    adds r2, r0, #0
.L080055EA:
    strh r3, [r1]
    adds r0, r1, #0
    adds r0, #0x40
    strh r3, [r0]
    adds r1, #2
    subs r2, #1
    cmp r2, #0
    bne .L080055EA
.L080055FA:
    bx lr
    func_end func_080055E0

    thumb_func_start func_080055FC
func_080055FC: @ 0x080055FC
    push {r4, r5, lr}
    adds r2, r0, #0
    movs r4, #0
    ldr r0, .L08005618 @ =gFont
    ldr r1, [r0]
    adds r5, r0, #0
    ldrb r1, [r1, #0x16]
    cmp r1, #5
    beq .L08005644
    adds r0, r2, #0
    bl func_08005C00
    b .L0800564C
    .align 2, 0
.L08005618: .4byte gFont
.L0800561C:
    ldrb r3, [r2]
    adds r2, #1
    cmp r3, #0x1f
    bls .L08005644
    ldrb r0, [r2]
    adds r2, #1
    ldr r1, [r5]
    ldr r1, [r1, #4]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r1, .L08005654 @ =0xFFFFFF00
    adds r0, r0, r1
.L08005634:
    ldr r0, [r0]
    cmp r0, #0
    beq .L08005644
    ldrb r1, [r0, #4]
    cmp r1, r3
    bne .L08005634
    ldrb r0, [r0, #5]
    adds r4, r0, r4
.L08005644:
    ldrb r0, [r2]
    cmp r0, #1
    bhi .L0800561C
    adds r0, r4, #0
.L0800564C:
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08005654: .4byte 0xFFFFFF00
    func_end func_080055FC

    thumb_func_start func_08005658
func_08005658: @ 0x08005658
    push {r4, lr}
    adds r2, r0, #0
    adds r4, r1, #0
    ldr r0, .L08005674 @ =gFont
    ldr r1, [r0]
    ldrb r0, [r1, #0x16]
    cmp r0, #5
    beq .L08005678
    adds r0, r2, #0
    adds r1, r4, #0
    bl func_08005BD0
    b .L0800569C
    .align 2, 0
.L08005674: .4byte gFont
.L08005678:
    ldrb r3, [r2]
    adds r2, #1
    ldrb r0, [r2]
    adds r2, #1
    ldr r1, [r1, #4]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r1, .L080056A4 @ =0xFFFFFF00
    adds r0, r0, r1
.L0800568A:
    ldr r0, [r0]
    cmp r0, #0
    beq .L0800569A
    ldrb r1, [r0, #4]
    cmp r1, r3
    bne .L0800568A
    ldrb r0, [r0, #5]
    str r0, [r4]
.L0800569A:
    adds r0, r2, #0
.L0800569C:
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L080056A4: .4byte 0xFFFFFF00
    func_end func_08005658

    thumb_func_start GetStringTextCenteredPos
GetStringTextCenteredPos: @ 0x080056A8
    push {r4, lr}
    adds r4, r0, #0
    adds r0, r1, #0
    bl func_080055FC
    subs r4, r4, r0
    lsrs r0, r4, #0x1f
    adds r4, r4, r0
    asrs r4, r4, #1
    adds r0, r4, #0
    pop {r4}
    pop {r1}
    bx r1
    func_end GetStringTextCenteredPos

    thumb_func_start func_080056C4
func_080056C4: @ 0x080056C4
    push {r4, r5, r6, lr}
    adds r6, r1, #0
    adds r5, r2, #0
    movs r0, #0
    str r0, [r6]
    str r0, [r5]
    bl MsgExpand
    adds r4, r0, #0
    b .L080056DA
.L080056D8:
    adds r4, #1
.L080056DA:
    ldrb r0, [r4]
    cmp r0, #1
    bls .L08005704
    adds r0, r4, #0
    bl func_080055FC
    adds r1, r0, #0
    ldr r0, [r6]
    cmp r0, r1
    bge .L080056F0
    str r1, [r6]
.L080056F0:
    ldr r0, [r5]
    adds r0, #0x10
    str r0, [r5]
    adds r0, r4, #0
    bl func_0800570C
    adds r4, r0, #0
    ldrb r0, [r4]
    cmp r0, #0
    bne .L080056D8
.L08005704:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_080056C4

    thumb_func_start func_0800570C
func_0800570C: @ 0x0800570C
    b .L08005710
.L0800570E:
    adds r0, #1
.L08005710:
    ldrb r1, [r0]
    cmp r1, #1
    bhi .L0800570E
    bx lr
    func_end func_0800570C

    thumb_func_start Text_DrawString
Text_DrawString: @ 0x08005718
    push {r4, r5, r6, lr}
    adds r6, r0, #0
    adds r4, r1, #0
    ldr r0, .L08005730 @ =gFont
    ldr r0, [r0]
    ldrb r0, [r0, #0x16]
    cmp r0, #5
    beq .L08005734
    adds r0, r6, #0
    bl func_08005B60
    b .L08005786
    .align 2, 0
.L08005730: .4byte gFont
.L08005734:
    ldrb r0, [r4]
    cmp r0, #1
    bls .L08005786
.L0800573A:
    ldrb r3, [r4]
    adds r4, #1
    cmp r3, #0x1f
    bls .L08005780
    ldrb r2, [r4]
    adds r4, #1
    ldr r5, .L0800575C @ =gFont
.L08005748:
    ldr r0, [r5]
    ldr r1, [r0, #4]
    lsls r0, r2, #2
    adds r0, r0, r1
    ldr r1, .L08005760 @ =0xFFFFFF00
    adds r0, r0, r1
    ldr r1, [r0]
    cmp r1, #0
    beq .L08005780
    b .L08005770
    .align 2, 0
.L0800575C: .4byte gFont
.L08005760: .4byte 0xFFFFFF00
.L08005764:
    ldr r1, [r1]
    cmp r1, #0
    bne .L08005770
    movs r3, #0x81
    movs r2, #0xa7
    b .L08005748
.L08005770:
    ldrb r0, [r1, #4]
    cmp r0, r3
    bne .L08005764
    ldr r0, [r5]
    ldr r2, [r0, #8]
    adds r0, r6, #0
    bl _call_via_r2
.L08005780:
    ldrb r1, [r4]
    cmp r1, #1
    bhi .L0800573A
.L08005786:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end Text_DrawString

    thumb_func_start Text_DrawNumber
Text_DrawNumber: @ 0x0800578C
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    adds r4, r1, #0
    cmp r4, #0
    bne .L080057A4
    ldr r1, .L080057A0 @ =0x08193DA0
    bl Text_DrawCharacter
    b .L080057CE
    .align 2, 0
.L080057A0: .4byte 0x08193DA0
.L080057A4:
    adds r0, r4, #0
    movs r1, #0xa
    bl __modsi3
    adds r0, #0x30
    mov r1, sp
    strh r0, [r1]
    adds r0, r4, #0
    movs r1, #0xa
    bl __divsi3
    adds r4, r0, #0
    adds r0, r5, #0
    mov r1, sp
    bl Text_DrawCharacter
    ldrb r0, [r5, #2]
    subs r0, #0xf
    strb r0, [r5, #2]
    cmp r4, #0
    bne .L080057A4
.L080057CE:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end Text_DrawNumber

    thumb_func_start Text_DrawNumberOrBlank
Text_DrawNumberOrBlank: @ 0x080057D8
    push {r4, lr}
    adds r4, r0, #0
    cmp r1, #0xff
    beq .L080057E8
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    bne .L08005808
.L080057E8:
    movs r1, #8
    rsbs r1, r1, #0
    adds r0, r4, #0
    bl Text_Skip
    ldr r0, .L08005804 @ =0x0000127C
    bl GetMsg
    adds r1, r0, #0
    adds r0, r4, #0
    bl Text_DrawString
    b .L0800580E
    .align 2, 0
.L08005804: .4byte 0x0000127C
.L08005808:
    adds r0, r4, #0
    bl Text_DrawNumber
.L0800580E:
    pop {r4}
    pop {r0}
    bx r0
    func_end Text_DrawNumberOrBlank

    thumb_func_start Text_DrawCharacter
Text_DrawCharacter: @ 0x08005814
    push {r4, r5, r6, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    ldr r0, .L08005830 @ =gFont
    ldr r1, [r0]
    adds r6, r0, #0
    ldrb r1, [r1, #0x16]
    cmp r1, #5
    beq .L08005834
    adds r0, r5, #0
    adds r1, r4, #0
    bl func_08005B9C
    b .L08005876
    .align 2, 0
.L08005830: .4byte gFont
.L08005834:
    ldrb r3, [r4]
    adds r4, #1
    ldrb r2, [r4]
    adds r4, #1
.L0800583C:
    ldr r0, [r6]
    ldr r1, [r0, #4]
    lsls r0, r2, #2
    adds r0, r0, r1
    ldr r1, .L0800584C @ =0xFFFFFF00
    adds r0, r0, r1
    ldr r1, [r0]
    b .L08005852
    .align 2, 0
.L0800584C: .4byte 0xFFFFFF00
.L08005850:
    ldr r1, [r1]
.L08005852:
    cmp r1, #0
    bne .L08005864
    movs r3, #0x81
    movs r2, #0xa7
    ldr r6, .L08005860 @ =gFont
    b .L0800583C
    .align 2, 0
.L08005860: .4byte gFont
.L08005864:
    ldrb r0, [r1, #4]
    cmp r0, r3
    bne .L08005850
    ldr r0, [r6]
    ldr r2, [r0, #8]
    adds r0, r5, #0
    bl _call_via_r2
    adds r0, r4, #0
.L08005876:
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end Text_DrawCharacter

    thumb_func_start func_0800587C
func_0800587C: @ 0x0800587C
    ldrb r2, [r0, #4]
    ldrb r3, [r0, #6]
    adds r1, r2, #0
    muls r1, r3, r1
    ldrh r2, [r0]
    adds r1, r2, r1
    ldrb r0, [r0, #2]
    lsrs r0, r0, #3
    adds r1, r1, r0
    ldr r0, .L0800589C @ =gFont
    ldr r0, [r0]
    lsls r1, r1, #6
    ldr r0, [r0]
    adds r0, r0, r1
    bx lr
    .align 2, 0
.L0800589C: .4byte gFont
    func_end func_0800587C

    thumb_func_start func_080058A0
func_080058A0: @ 0x080058A0
    ldr r1, .L080058AC @ =0x08B8610C
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r0, [r0]
    bx lr
    .align 2, 0
.L080058AC: .4byte 0x08B8610C
    func_end func_080058A0

    thumb_func_start func_080058B0
func_080058B0: @ 0x080058B0
    push {r4, r5, r6, lr}
    mov r6, sb
    mov r5, r8
    push {r5, r6}
    adds r5, r0, #0
    mov sb, r1
    ldr r0, .L080058FC @ =gFont
    ldr r0, [r0]
    ldr r1, [r0, #0xc]
    adds r0, r5, #0
    bl _call_via_r1
    mov r8, r0
    movs r4, #7
    ldrb r0, [r5, #2]
    ands r4, r0
    mov r6, sb
    adds r6, #8
    ldrb r0, [r5, #3]
    bl func_080058A0
    mov r1, r8
    adds r2, r6, #0
    adds r3, r4, #0
    bl DrawGlyphRam
    ldrb r2, [r5, #2]
    mov r1, sb
    ldrb r1, [r1, #5]
    adds r0, r2, r1
    strb r0, [r5, #2]
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080058FC: .4byte gFont
    func_end func_080058B0

    thumb_func_start func_08005900
func_08005900: @ 0x08005900
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x18
    str r0, [sp]
    str r1, [sp, #4]
    ldr r0, .L08005A3C @ =gFont
    ldr r0, [r0]
    ldr r1, [r0, #0xc]
    ldr r0, [sp]
    bl _call_via_r1
    str r0, [sp, #0xc]
    movs r0, #7
    ldr r1, [sp]
    ldrb r2, [r1, #2]
    ands r2, r0
    str r2, [sp, #0x10]
    ldr r3, [sp, #4]
    adds r3, #8
    str r3, [sp, #0x14]
    movs r0, #9
    bl func_080058A0
    mov sl, r0
    ldr r6, [sp]
    ldrb r0, [r6, #3]
    bl func_080058A0
    mov sb, r0
    movs r0, #0xf
    str r0, [sp, #8]
    ldr r7, [sp, #0xc]
    adds r7, #0x40
.L08005948:
    ldr r2, [sp, #0x14]
    ldm r2!, {r0}
    str r2, [sp, #0x14]
    movs r1, #0
    ldr r3, [sp, #0x10]
    lsls r2, r3, #1
    bl __ashldi3
    movs r5, #0xff
    ands r5, r0
    lsls r5, r5, #1
    adds r6, r5, #0
    add r6, sl
    mov r8, r6
    lsls r6, r1, #0x18
    lsrs r4, r0, #8
    adds r2, r6, #0
    orrs r2, r4
    movs r4, #0xff
    ands r4, r2
    lsls r4, r4, #1
    mov r3, sl
    adds r2, r4, r3
    ldrh r2, [r2]
    lsls r2, r2, #0x10
    mov r6, r8
    ldrh r6, [r6]
    orrs r2, r6
    ldr r6, [sp, #0xc]
    ldr r3, [r6]
    ands r3, r2
    str r3, [r6]
    add r5, sb
    add r4, sb
    ldrh r4, [r4]
    lsls r2, r4, #0x10
    ldrh r5, [r5]
    orrs r2, r5
    orrs r3, r2
    stm r6!, {r3}
    str r6, [sp, #0xc]
    lsls r5, r1, #0x10
    lsrs r4, r0, #0x10
    adds r2, r5, #0
    orrs r2, r4
    movs r5, #0xff
    ands r5, r2
    lsls r5, r5, #1
    adds r2, r5, #0
    add r2, sl
    mov r8, r2
    lsls r6, r1, #8
    lsrs r4, r0, #0x18
    adds r2, r6, #0
    orrs r2, r4
    movs r4, #0xff
    ands r4, r2
    lsls r4, r4, #1
    mov r3, sl
    adds r2, r4, r3
    ldrh r2, [r2]
    lsls r2, r2, #0x10
    mov r6, r8
    ldrh r6, [r6]
    orrs r2, r6
    ldr r3, [r7]
    ands r3, r2
    add r5, sb
    add r4, sb
    ldrh r4, [r4]
    lsls r2, r4, #0x10
    ldrh r5, [r5]
    orrs r2, r5
    orrs r3, r2
    str r3, [r7]
    adds r2, r1, #0
    movs r4, #0xff
    ands r4, r2
    lsls r4, r4, #1
    mov r2, sl
    adds r5, r4, r2
    lsrs r2, r1, #8
    movs r1, #0xff
    ands r1, r2
    lsls r1, r1, #1
    mov r3, sl
    adds r0, r1, r3
    ldrh r0, [r0]
    lsls r0, r0, #0x10
    ldrh r5, [r5]
    orrs r0, r5
    ldr r2, [r7, #0x40]
    ands r2, r0
    add r4, sb
    add r1, sb
    ldrh r1, [r1]
    lsls r0, r1, #0x10
    ldrh r4, [r4]
    orrs r0, r4
    orrs r2, r0
    str r2, [r7, #0x40]
    adds r7, #4
    ldr r6, [sp, #8]
    subs r6, #1
    str r6, [sp, #8]
    cmp r6, #0
    bge .L08005948
    ldr r1, [sp]
    ldrb r2, [r1, #2]
    ldr r1, [sp, #4]
    ldrb r1, [r1, #5]
    adds r0, r2, r1
    ldr r2, [sp]
    strb r0, [r2, #2]
    add sp, #0x18
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08005A3C: .4byte gFont
    func_end func_08005900

    thumb_func_start InitSystemTextFont
InitSystemTextFont: @ 0x08005A40
    push {r4, lr}
    ldr r0, .L08005A70 @ =0x08194674
    ldr r4, .L08005A74 @ =gFont
    ldr r1, [r4]
    ldrh r1, [r1, #0x14]
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r1, .L08005A78 @ =gPal
    ldr r2, [r4]
    ldrh r3, [r2, #0x14]
    lsls r0, r3, #5
    adds r0, r0, r1
    movs r1, #0
    strh r1, [r0]
    ldr r0, .L08005A7C @ =func_080058B0
    str r0, [r2, #8]
    movs r0, #0
    bl SetTextFontGlyphs
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08005A70: .4byte 0x08194674
.L08005A74: .4byte gFont
.L08005A78: .4byte gPal
.L08005A7C: .4byte func_080058B0
    func_end InitSystemTextFont

    thumb_func_start func_08005A80
func_08005A80: @ 0x08005A80
    push {r4, lr}
    ldr r0, .L08005AB0 @ =0x08194694
    ldr r4, .L08005AB4 @ =gFont
    ldr r1, [r4]
    ldrh r1, [r1, #0x14]
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r1, .L08005AB8 @ =gPal
    ldr r2, [r4]
    ldrh r3, [r2, #0x14]
    lsls r0, r3, #5
    adds r0, r0, r1
    movs r1, #0
    strh r1, [r0]
    ldr r0, .L08005ABC @ =func_080058B0
    str r0, [r2, #8]
    movs r0, #1
    bl SetTextFontGlyphs
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08005AB0: .4byte 0x08194694
.L08005AB4: .4byte gFont
.L08005AB8: .4byte gPal
.L08005ABC: .4byte func_080058B0
    func_end func_08005A80

    thumb_func_start func_08005AC0
func_08005AC0: @ 0x08005AC0
    ldr r0, .L08005ACC @ =gFont
    ldr r1, [r0]
    ldr r0, .L08005AD0 @ =func_08005900
    str r0, [r1, #8]
    bx lr
    .align 2, 0
.L08005ACC: .4byte gFont
.L08005AD0: .4byte func_08005900
    func_end func_08005AC0

    thumb_func_start func_08005AD4
func_08005AD4: @ 0x08005AD4
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r4, r0, #0
    adds r7, r1, #0
    adds r6, r2, #0
    adds r5, r3, #0
    cmp r4, #0
    bne .L08005AEE
    mov r4, sp
    mov r0, sp
    ldr r1, [sp, #0x1c]
    bl InitText
.L08005AEE:
    adds r0, r4, #0
    adds r1, r5, #0
    bl Text_SetCursor
    adds r0, r4, #0
    adds r1, r6, #0
    bl Text_SetColor
    adds r0, r4, #0
    ldr r1, [sp, #0x20]
    bl Text_DrawString
    adds r0, r4, #0
    adds r1, r7, #0
    bl func_08005590
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_08005AD4

    thumb_func_start Text_InsertDrawString
Text_InsertDrawString: @ 0x08005B18
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r2, #0
    adds r6, r3, #0
    bl Text_SetCursor
    adds r0, r4, #0
    adds r1, r5, #0
    bl Text_SetColor
    adds r0, r4, #0
    adds r1, r6, #0
    bl Text_DrawString
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end Text_InsertDrawString

    thumb_func_start Text_InsertDrawNumberOrBlank
Text_InsertDrawNumberOrBlank: @ 0x08005B3C
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r2, #0
    adds r6, r3, #0
    bl Text_SetCursor
    adds r0, r4, #0
    adds r1, r5, #0
    bl Text_SetColor
    adds r0, r4, #0
    adds r1, r6, #0
    bl Text_DrawNumberOrBlank
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end Text_InsertDrawNumberOrBlank

    thumb_func_start func_08005B60
func_08005B60: @ 0x08005B60
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    b .L08005B8A
.L08005B68:
    ldr r0, .L08005B98 @ =gFont
    ldr r3, [r0]
    ldr r2, [r3, #4]
    ldrb r1, [r4]
    lsls r0, r1, #2
    adds r0, r0, r2
    ldr r1, [r0]
    adds r4, #1
    cmp r1, #0
    bne .L08005B82
    adds r0, r2, #0
    adds r0, #0xfc
    ldr r1, [r0]
.L08005B82:
    ldr r2, [r3, #8]
    adds r0, r5, #0
    bl _call_via_r2
.L08005B8A:
    ldrb r0, [r4]
    cmp r0, #1
    bhi .L08005B68
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08005B98: .4byte gFont
    func_end func_08005B60

    thumb_func_start func_08005B9C
func_08005B9C: @ 0x08005B9C
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    ldr r0, .L08005BCC @ =gFont
    ldr r3, [r0]
    ldr r2, [r3, #4]
    ldrb r1, [r4]
    lsls r0, r1, #2
    adds r0, r0, r2
    ldr r1, [r0]
    adds r4, #1
    cmp r1, #0
    bne .L08005BBC
    adds r0, r2, #0
    adds r0, #0xfc
    ldr r1, [r0]
.L08005BBC:
    ldr r2, [r3, #8]
    adds r0, r5, #0
    bl _call_via_r2
    adds r0, r4, #0
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08005BCC: .4byte gFont
    func_end func_08005B9C

    thumb_func_start func_08005BD0
func_08005BD0: @ 0x08005BD0
    push {r4, lr}
    adds r2, r0, #0
    ldr r0, .L08005BFC @ =gFont
    ldr r0, [r0]
    ldr r3, [r0, #4]
    ldrb r4, [r2]
    lsls r0, r4, #2
    adds r0, r0, r3
    ldr r0, [r0]
    adds r2, #1
    cmp r0, #0
    bne .L08005BEE
    adds r0, r3, #0
    adds r0, #0xfc
    ldr r0, [r0]
.L08005BEE:
    ldrb r0, [r0, #5]
    str r0, [r1]
    adds r0, r2, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08005BFC: .4byte gFont
    func_end func_08005BD0

    thumb_func_start func_08005C00
func_08005C00: @ 0x08005C00
    push {r4, lr}
    adds r1, r0, #0
    movs r2, #0
    ldrb r0, [r1]
    cmp r0, #1
    bls .L08005C26
    ldr r0, .L08005C30 @ =gFont
    ldr r0, [r0]
    ldr r3, [r0, #4]
.L08005C12:
    ldrb r4, [r1]
    lsls r0, r4, #2
    adds r0, r0, r3
    ldr r0, [r0]
    adds r1, #1
    ldrb r0, [r0, #5]
    adds r2, r0, r2
    ldrb r0, [r1]
    cmp r0, #1
    bhi .L08005C12
.L08005C26:
    adds r0, r2, #0
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08005C30: .4byte gFont
    func_end func_08005C00

    thumb_func_start func_08005C34
func_08005C34: @ 0x08005C34
    bx lr
    func_end func_08005C34

    thumb_func_start InitSpriteTextFont
InitSpriteTextFont: @ 0x08005C38
    push {r4, lr}
    adds r4, r0, #0
    str r1, [r4]
    ldr r0, .L08005C6C @ =GetSpriteTextDrawDest
    str r0, [r4, #0xc]
    movs r0, #0xf
    ands r2, r0
    adds r2, #0x10
    movs r0, #0
    strh r2, [r4, #0x14]
    lsls r1, r1, #0xf
    lsrs r1, r1, #0x14
    strh r1, [r4, #0x10]
    strh r0, [r4, #0x12]
    bl GetLang
    strb r0, [r4, #0x16]
    adds r0, r4, #0
    bl SetTextFont
    ldr r0, .L08005C70 @ =DrawSpriteTextGlyph
    str r0, [r4, #8]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08005C6C: .4byte GetSpriteTextDrawDest
.L08005C70: .4byte DrawSpriteTextGlyph
    func_end InitSpriteTextFont

    thumb_func_start InitSpriteText
InitSpriteText: @ 0x08005C74
    ldr r1, .L08005C94 @ =gFont
    ldr r3, [r1]
    ldrh r1, [r3, #0x12]
    movs r2, #0
    strh r1, [r0]
    movs r1, #0x20
    strb r1, [r0, #4]
    strb r2, [r0, #6]
    strb r2, [r0, #5]
    strb r2, [r0, #7]
    ldrh r1, [r3, #0x12]
    adds r1, #0x40
    strh r1, [r3, #0x12]
    strb r2, [r0, #2]
    strb r2, [r0, #3]
    bx lr
    .align 2, 0
.L08005C94: .4byte gFont
    func_end InitSpriteText

    thumb_func_start SpriteText_DrawBackground
SpriteText_DrawBackground: @ 0x08005C98
    push {r4, r5, r6, r7, lr}
    sub sp, #8
    adds r7, r0, #0
    ldrb r0, [r7, #4]
    cmp r0, #0
    beq .L08005CE2
    movs r0, #0
    strb r0, [r7, #2]
    ldr r4, .L08005CEC @ =0x44444444
    str r4, [sp]
    ldr r5, .L08005CF0 @ =gFont
    ldr r0, [r5]
    ldr r1, [r0, #0xc]
    adds r0, r7, #0
    bl _call_via_r1
    adds r1, r0, #0
    ldr r6, .L08005CF4 @ =0x010000D8
    mov r0, sp
    adds r2, r6, #0
    bl CpuFastSet
    str r4, [sp, #4]
    add r4, sp, #4
    ldr r0, [r5]
    ldr r1, [r0, #0xc]
    adds r0, r7, #0
    bl _call_via_r1
    adds r1, r0, #0
    movs r0, #0x80
    lsls r0, r0, #3
    adds r1, r1, r0
    adds r0, r4, #0
    adds r2, r6, #0
    bl CpuFastSet
.L08005CE2:
    add sp, #8
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08005CEC: .4byte 0x44444444
.L08005CF0: .4byte gFont
.L08005CF4: .4byte 0x010000D8
    func_end SpriteText_DrawBackground

    thumb_func_start func_08005CF8
func_08005CF8: @ 0x08005CF8
    push {lr}
    sub sp, #4
    movs r2, #0
    strb r2, [r0, #2]
    str r1, [sp]
    ldr r1, .L08005D1C @ =gFont
    ldr r1, [r1]
    ldr r1, [r1, #0xc]
    bl _call_via_r1
    adds r1, r0, #0
    ldr r2, .L08005D20 @ =0x01000200
    mov r0, sp
    bl CpuFastSet
    add sp, #4
    pop {r0}
    bx r0
    .align 2, 0
.L08005D1C: .4byte gFont
.L08005D20: .4byte 0x01000200
    func_end func_08005CF8

    thumb_func_start GetSpriteTextDrawDest
GetSpriteTextDrawDest: @ 0x08005D24
    ldrb r2, [r0, #4]
    ldrb r3, [r0, #6]
    adds r1, r2, #0
    muls r1, r3, r1
    ldrh r2, [r0]
    adds r1, r2, r1
    ldrb r0, [r0, #2]
    lsrs r0, r0, #3
    adds r1, r1, r0
    ldr r0, .L08005D44 @ =gFont
    ldr r0, [r0]
    lsls r1, r1, #5
    ldr r0, [r0]
    adds r0, r0, r1
    bx lr
    .align 2, 0
.L08005D44: .4byte gFont
    func_end GetSpriteTextDrawDest

    thumb_func_start DrawSpriteTextGlyph
DrawSpriteTextGlyph: @ 0x08005D48
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x14
    str r0, [sp]
    str r1, [sp, #4]
    ldr r0, .L08005EF4 @ =gFont
    ldr r0, [r0]
    ldr r1, [r0, #0xc]
    ldr r0, [sp]
    bl _call_via_r1
    adds r7, r0, #0
    movs r0, #7
    ldr r1, [sp]
    ldrb r2, [r1, #2]
    ands r2, r0
    str r2, [sp, #8]
    ldr r3, [sp, #4]
    adds r3, #8
    str r3, [sp, #0xc]
    ldrb r0, [r1, #3]
    bl func_080058A0
    mov r8, r0
    movs r0, #0xff
    mov sb, r0
    ldr r1, [sp, #8]
    lsls r1, r1, #1
    str r1, [sp, #0x10]
    movs r2, #7
    mov sl, r2
.L08005D8C:
    ldr r3, [sp, #0xc]
    ldm r3!, {r0}
    str r3, [sp, #0xc]
    movs r1, #0
    ldr r3, [sp, #8]
    lsls r2, r3, #1
    bl __ashldi3
    adds r6, r1, #0
    adds r5, r0, #0
    mov r3, sb
    ands r3, r5
    lsls r3, r3, #1
    add r3, r8
    lsls r4, r6, #0x18
    lsrs r2, r5, #8
    adds r0, r4, #0
    orrs r0, r2
    mov r2, sb
    ands r2, r0
    lsls r2, r2, #1
    add r2, r8
    ldrh r2, [r2]
    lsls r1, r2, #0x10
    ldrh r3, [r3]
    orrs r1, r3
    ldr r0, [r7]
    orrs r0, r1
    str r0, [r7]
    lsls r3, r6, #0x10
    lsrs r2, r5, #0x10
    adds r0, r3, #0
    orrs r0, r2
    mov r3, sb
    ands r3, r0
    lsls r3, r3, #1
    add r3, r8
    lsls r4, r6, #8
    lsrs r2, r5, #0x18
    adds r0, r4, #0
    orrs r0, r2
    mov r2, sb
    ands r2, r0
    lsls r2, r2, #1
    add r2, r8
    ldrh r2, [r2]
    lsls r1, r2, #0x10
    ldrh r3, [r3]
    orrs r1, r3
    ldr r0, [r7, #0x20]
    orrs r0, r1
    str r0, [r7, #0x20]
    adds r0, r6, #0
    mov r3, sb
    ands r3, r0
    lsls r3, r3, #1
    add r3, r8
    lsrs r0, r6, #8
    mov r2, sb
    ands r2, r0
    lsls r2, r2, #1
    add r2, r8
    ldrh r2, [r2]
    lsls r1, r2, #0x10
    ldrh r3, [r3]
    orrs r1, r3
    ldr r0, [r7, #0x40]
    orrs r0, r1
    str r0, [r7, #0x40]
    adds r7, #4
    movs r0, #1
    rsbs r0, r0, #0
    add sl, r0
    mov r1, sl
    cmp r1, #0
    bge .L08005D8C
    ldr r0, .L08005EF4 @ =gFont
    ldr r0, [r0]
    ldr r1, [r0, #0xc]
    ldr r0, [sp]
    bl _call_via_r1
    movs r2, #0x80
    lsls r2, r2, #3
    adds r7, r0, r2
    movs r3, #0xff
    mov sb, r3
    movs r0, #7
    mov sl, r0
.L08005E3E:
    ldr r2, [sp, #0xc]
    ldm r2!, {r0}
    str r2, [sp, #0xc]
    movs r1, #0
    ldr r2, [sp, #0x10]
    bl __ashldi3
    adds r6, r1, #0
    adds r5, r0, #0
    mov r3, sb
    ands r3, r5
    lsls r3, r3, #1
    add r3, r8
    lsls r4, r6, #0x18
    lsrs r2, r5, #8
    adds r0, r4, #0
    orrs r0, r2
    mov r2, sb
    ands r2, r0
    lsls r2, r2, #1
    add r2, r8
    ldrh r2, [r2]
    lsls r1, r2, #0x10
    ldrh r3, [r3]
    orrs r1, r3
    ldr r0, [r7]
    orrs r0, r1
    str r0, [r7]
    lsls r3, r6, #0x10
    lsrs r2, r5, #0x10
    adds r0, r3, #0
    orrs r0, r2
    mov r3, sb
    ands r3, r0
    lsls r3, r3, #1
    add r3, r8
    lsls r4, r6, #8
    lsrs r2, r5, #0x18
    adds r0, r4, #0
    orrs r0, r2
    mov r2, sb
    ands r2, r0
    lsls r2, r2, #1
    add r2, r8
    ldrh r2, [r2]
    lsls r1, r2, #0x10
    ldrh r3, [r3]
    orrs r1, r3
    ldr r0, [r7, #0x20]
    orrs r0, r1
    str r0, [r7, #0x20]
    adds r0, r6, #0
    mov r3, sb
    ands r3, r0
    lsls r3, r3, #1
    add r3, r8
    lsrs r0, r6, #8
    mov r2, sb
    ands r2, r0
    lsls r2, r2, #1
    add r2, r8
    ldrh r2, [r2]
    lsls r1, r2, #0x10
    ldrh r3, [r3]
    orrs r1, r3
    ldr r0, [r7, #0x40]
    orrs r0, r1
    str r0, [r7, #0x40]
    adds r7, #4
    movs r3, #1
    rsbs r3, r3, #0
    add sl, r3
    mov r0, sl
    cmp r0, #0
    bge .L08005E3E
    ldr r1, [sp]
    ldrb r2, [r1, #2]
    ldr r1, [sp, #4]
    ldrb r1, [r1, #5]
    adds r0, r2, r1
    ldr r2, [sp]
    strb r0, [r2, #2]
    add sp, #0x14
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08005EF4: .4byte gFont
    func_end DrawSpriteTextGlyph

    thumb_func_start func_08005EF8
func_08005EF8: @ 0x08005EF8
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x35
    ldrb r0, [r1]
    subs r0, #1
    strb r0, [r1]
    lsls r0, r0, #0x18
    cmp r0, #0
    bgt .L08005F66
    adds r0, r4, #0
    adds r0, #0x34
    ldrb r0, [r0]
    strb r0, [r1]
    movs r5, #0
    adds r0, r4, #0
    adds r0, #0x36
    movs r1, #0
    ldrsb r1, [r0, r1]
    adds r6, r0, #0
    cmp r5, r1
    bge .L08005F66
.L08005F24:
    ldr r0, [r4, #0x30]
    ldrb r2, [r0]
    adds r1, r0, #0
    cmp r2, #0
    blt .L08005F54
    cmp r2, #1
    ble .L08005F38
    cmp r2, #4
    beq .L08005F46
    b .L08005F54
.L08005F38:
    ldr r1, [r4, #0x2c]
    movs r0, #0
    strb r0, [r1, #7]
    adds r0, r4, #0
    bl Proc_Break
    b .L08005F66
.L08005F46:
    adds r0, r1, #1
    str r0, [r4, #0x30]
    ldr r0, [r4, #0x2c]
    movs r1, #6
    bl Text_Skip
    b .L08005F5C
.L08005F54:
    ldr r0, [r4, #0x2c]
    bl Text_DrawCharacter
    str r0, [r4, #0x30]
.L08005F5C:
    adds r5, #1
    movs r0, #0
    ldrsb r0, [r6, r0]
    cmp r5, r0
    blt .L08005F24
.L08005F66:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08005EF8

    thumb_func_start func_08005F6C
func_08005F6C: @ 0x08005F6C
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r6, r1, #0
    adds r7, r2, #0
    adds r4, r3, #0
    cmp r7, #0
    bne .L08005F7E
    bl Text_DrawString
.L08005F7E:
    cmp r4, #0
    bne .L08005F84
    movs r4, #1
.L08005F84:
    ldr r0, .L08005FB0 @ =0x08B86140
    movs r1, #3
    bl SpawnProc
    adds r2, r0, #0
    str r5, [r2, #0x2c]
    str r6, [r2, #0x30]
    adds r0, #0x36
    movs r1, #0
    strb r4, [r0]
    subs r0, #2
    strb r7, [r0]
    adds r0, #1
    strb r1, [r0]
    movs r0, #1
    strb r0, [r5, #7]
    adds r0, r6, #0
    bl func_0800570C
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08005FB0: .4byte 0x08B86140
    func_end func_08005F6C

    thumb_func_start func_08005FB4
func_08005FB4: @ 0x08005FB4
    ldrb r0, [r0, #7]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    bx lr
    func_end func_08005FB4

    thumb_func_start func_08005FBC
func_08005FBC: @ 0x08005FBC
    push {lr}
    ldr r0, .L08005FC8 @ =0x08B86140
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L08005FC8: .4byte 0x08B86140
    func_end func_08005FBC

    thumb_func_start func_08005FCC
func_08005FCC: @ 0x08005FCC
    push {lr}
    bl GetGameTime
    lsrs r0, r0, #2
    movs r1, #0xf
    ands r0, r1
    ldr r2, .L08005FEC @ =gPal
    lsls r0, r0, #1
    ldr r1, .L08005FF0 @ =0x08194734
    adds r0, r0, r1
    ldrh r0, [r0]
    strh r0, [r2, #0x1c]
    bl EnablePalSync
    pop {r0}
    bx r0
    .align 2, 0
.L08005FEC: .4byte gPal
.L08005FF0: .4byte 0x08194734
    func_end func_08005FCC

    thumb_func_start StartGreenText
StartGreenText: @ 0x08005FF4
    push {lr}
    adds r1, r0, #0
    cmp r1, #0
    beq .L08006008
    ldr r0, .L08006004 @ =0x08B86150
    bl SpawnProc
    b .L08006010
    .align 2, 0
.L08006004: .4byte 0x08B86150
.L08006008:
    ldr r0, .L08006014 @ =0x08B86150
    movs r1, #3
    bl SpawnProc
.L08006010:
    pop {r0}
    bx r0
    .align 2, 0
.L08006014: .4byte 0x08B86150
    func_end StartGreenText

    thumb_func_start func_08006018
func_08006018: @ 0x08006018
    push {lr}
    ldr r0, .L08006024 @ =0x08B86150
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L08006024: .4byte 0x08B86150
    func_end func_08006018

    thumb_func_start func_08006028
func_08006028: @ 0x08006028
    push {r4, r5, lr}
    adds r4, r0, #0
    mov ip, r1
    adds r5, r2, #0
    ldr r0, .L0800604C @ =gFont
    ldr r1, [r0]
    ldrb r2, [r4, #4]
    ldrb r3, [r4, #6]
    adds r0, r3, #0
    muls r0, r2, r0
    ldrh r3, [r4]
    adds r0, r3, r0
    lsls r0, r0, #1
    ldrh r1, [r1, #0x10]
    adds r1, r1, r0
    movs r3, #0
    b .L08006062
    .align 2, 0
.L0800604C: .4byte gFont
.L08006050:
    mov r0, ip
    strh r1, [r0]
    adds r1, #1
    adds r0, #0x40
    strh r1, [r0]
    adds r1, #1
    movs r0, #2
    add ip, r0
    adds r3, #1
.L08006062:
    cmp r3, r2
    bge .L0800606A
    cmp r3, r5
    blt .L08006050
.L0800606A:
    movs r0, #5
    ldrsb r0, [r4, r0]
    cmp r0, #0
    beq .L0800607A
    movs r0, #1
    ldrb r1, [r4, #6]
    eors r0, r1
    strb r0, [r4, #6]
.L0800607A:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08006028

    thumb_func_start func_08006080
func_08006080: @ 0x08006080
    bx lr
    func_end func_08006080

    thumb_func_start func_08006084
func_08006084: @ 0x08006084
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    ldr r3, .L080060DC @ =gFont
    ldr r3, [r3]
    lsls r0, r0, #6
    ldr r3, [r3]
    adds r3, r3, r0
    mov r8, r3
    adds r7, r2, #0
    adds r7, #8
    adds r0, r1, #0
    bl func_080058A0
    adds r2, r0, #0
    movs r6, #0xff
    movs r3, #0xf
.L080060A6:
    ldm r7!, {r0}
    adds r1, r0, #0
    ands r1, r6
    lsls r1, r1, #1
    adds r1, r1, r2
    ldrh r4, [r1]
    lsrs r0, r0, #8
    ands r0, r6
    lsls r0, r0, #1
    adds r0, r0, r2
    ldrh r5, [r0]
    lsls r0, r5, #0x10
    adds r0, r0, r4
    mov r1, r8
    adds r1, #4
    mov r8, r1
    subs r1, #4
    stm r1!, {r0}
    subs r3, #1
    cmp r3, #0
    bge .L080060A6
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080060DC: .4byte gFont
    func_end func_08006084

    thumb_func_start func_080060E0
func_080060E0: @ 0x080060E0
    push {r4, r5, lr}
    adds r5, r0, #0
    strb r1, [r5]
    strb r2, [r5, #1]
    ldr r0, .L08006114 @ =gFont
    ldr r3, [r0]
    ldrh r4, [r3, #0x12]
    adds r0, r4, #1
    strh r0, [r3, #0x12]
    strh r4, [r5, #2]
    movs r0, #0xff
    strb r0, [r5, #4]
    movs r3, #2
    ldrsh r0, [r5, r3]
    ldr r3, .L08006118 @ =0x08B901B0
    lsls r2, r2, #2
    adds r2, r2, r3
    ldr r2, [r2]
    bl func_08006084
    movs r1, #2
    ldrsh r0, [r5, r1]
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08006114: .4byte gFont
.L08006118: .4byte 0x08B901B0
    func_end func_080060E0

    thumb_func_start func_0800611C
func_0800611C: @ 0x0800611C
    push {lr}
    adds r3, r0, #0
    adds r2, r1, #0
    ldr r1, .L08006138 @ =gSpecialCharList
.L08006124:
    movs r0, #0
    ldrsb r0, [r1, r0]
    cmp r0, #0
    bge .L0800613C
    adds r0, r1, #0
    adds r1, r3, #0
    bl func_080060E0
    b .L08006156
    .align 2, 0
.L08006138: .4byte gSpecialCharList
.L0800613C:
    movs r0, #0
    ldrsb r0, [r1, r0]
    cmp r0, r3
    bne .L08006152
    movs r0, #1
    ldrsb r0, [r1, r0]
    cmp r0, r2
    bne .L08006152
    movs r2, #2
    ldrsh r0, [r1, r2]
    b .L08006156
.L08006152:
    adds r1, #4
    b .L08006124
.L08006156:
    pop {r1}
    bx r1
    func_end func_0800611C

    thumb_func_start func_0800615C
func_0800615C: @ 0x0800615C
    push {r4, lr}
    adds r4, r0, #0
    adds r0, r1, #0
    adds r1, r2, #0
    cmp r1, #0xff
    bne .L08006174
    movs r1, #0
    strh r1, [r4]
    adds r0, r4, #0
    adds r0, #0x40
    strh r1, [r0]
    b .L0800618C
.L08006174:
    bl func_0800611C
    lsls r0, r0, #1
    ldr r1, .L08006194 @ =gFont
    ldr r1, [r1]
    ldrh r1, [r1, #0x10]
    adds r0, r1, r0
    strh r0, [r4]
    adds r1, r4, #0
    adds r1, #0x40
    adds r0, #1
    strh r0, [r1]
.L0800618C:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08006194: .4byte gFont
    func_end func_0800615C

    thumb_func_start func_08006198
func_08006198: @ 0x08006198
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r7, r1, #0
    adds r4, r2, #0
    adds r6, r3, #0
    cmp r4, #0
    bne .L080061AE
    adds r2, r6, #0
    bl func_0800615C
    b .L080061D2
.L080061AE:
    adds r0, r4, #0
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r2, r2, r6
    adds r0, r5, #0
    adds r1, r7, #0
    bl func_0800615C
    adds r0, r4, #0
    movs r1, #0xa
    bl __divsi3
    adds r4, r0, #0
    subs r5, #2
    cmp r4, #0
    bne .L080061AE
.L080061D2:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_08006198

    thumb_func_start func_080061D8
func_080061D8: @ 0x080061D8
    push {lr}
    movs r3, #0
    bl func_08006198
    pop {r0}
    bx r0
    func_end func_080061D8

    thumb_func_start func_080061E4
func_080061E4: @ 0x080061E4
    push {lr}
    cmp r2, #0
    blt .L080061EE
    cmp r2, #0xff
    bne .L080061FA
.L080061EE:
    subs r0, #2
    movs r2, #0x14
    movs r3, #0x14
    bl func_080063AC
    b .L080061FE
.L080061FA:
    bl func_080061D8
.L080061FE:
    pop {r0}
    bx r0
    func_end func_080061E4

    thumb_func_start func_08006204
func_08006204: @ 0x08006204
    push {lr}
    cmp r2, #0x64
    bne .L08006216
    subs r0, #2
    movs r2, #0x28
    movs r3, #0x29
    bl func_080063AC
    b .L0800622E
.L08006216:
    cmp r2, #0
    blt .L0800621E
    cmp r2, #0xff
    bne .L0800622A
.L0800621E:
    subs r0, #2
    movs r2, #0x14
    movs r3, #0x14
    bl func_080063AC
    b .L0800622E
.L0800622A:
    bl func_080061D8
.L0800622E:
    pop {r0}
    bx r0
    func_end func_08006204

    thumb_func_start func_08006234
func_08006234: @ 0x08006234
    push {lr}
    movs r3, #0xa
    bl func_08006198
    pop {r0}
    bx r0
    func_end func_08006234

    thumb_func_start func_08006240
func_08006240: @ 0x08006240
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    cmp r5, #0
    beq .L08006264
    adds r0, r4, #0
    movs r1, #4
    movs r2, #0x15
    bl func_0800615C
    adds r0, r4, #2
    cmp r5, #9
    ble .L0800625C
    adds r0, r4, #4
.L0800625C:
    movs r1, #4
    adds r2, r5, #0
    bl func_08006234
.L08006264:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08006240

    thumb_func_start func_0800626C
func_0800626C: @ 0x0800626C
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    bl GetGameTime
    adds r5, r0, #0
    movs r0, #0
    ldr r1, .L080062B4 @ =gBg0Tm
    mov r8, r1
.L0800627E:
    adds r7, r0, #1
    lsls r4, r0, #7
    movs r6, #0x1d
.L08006284:
    mov r1, r8
    adds r0, r4, r1
    movs r2, #1
    ands r2, r5
    adds r5, #1
    movs r1, #0
    bl func_0800615C
    adds r4, #2
    subs r6, #1
    cmp r6, #0
    bge .L08006284
    adds r0, r7, #0
    cmp r0, #9
    ble .L0800627E
    movs r0, #1
    bl EnableBgSync
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080062B4: .4byte gBg0Tm
    func_end func_0800626C

    thumb_func_start func_080062B8
func_080062B8: @ 0x080062B8
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x10
    adds r7, r0, #0
    adds r6, r1, #0
    adds r0, r2, #0
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    mov sl, r3
    mov r4, sp
    adds r4, #2
    add r1, sp, #4
    mov r8, r1
    mov r1, sp
    adds r2, r4, #0
    mov r3, r8
    bl FormatTime
    mov r1, sp
    strb r0, [r1, #8]
    lsls r0, r0, #0x18
    str r0, [sp, #0xc]
    lsrs r0, r0, #0x18
    mov sb, r0
    adds r0, r7, #4
    ldrh r2, [r1]
    adds r1, r6, #0
    bl func_080061D8
    ldrh r5, [r4]
    adds r4, r7, #0
    adds r4, #0xa
    adds r0, r5, #0
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    subs r4, #2
    adds r0, r5, #0
    movs r1, #0xa
    bl __divsi3
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    mov r1, r8
    ldrh r5, [r1]
    adds r4, #8
    adds r0, r5, #0
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r2, #0xa
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    subs r4, #2
    adds r0, r5, #0
    movs r1, #0xa
    bl __divsi3
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r2, #0xa
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    mov r0, sb
    cmp r0, #0
    beq .L0800636C
    mov r1, sl
    cmp r1, #0
    beq .L08006384
.L0800636C:
    adds r0, r7, #6
    adds r1, r6, #0
    movs r2, #0x20
    bl func_0800615C
    adds r0, r7, #0
    adds r0, #0xc
    adds r1, r6, #0
    movs r2, #0x21
    bl func_0800615C
    b .L0800639A
.L08006384:
    adds r0, r7, #6
    adds r1, r6, #0
    movs r2, #0xff
    bl func_0800615C
    adds r0, r7, #0
    adds r0, #0xc
    adds r1, r6, #0
    movs r2, #0xff
    bl func_0800615C
.L0800639A:
    add sp, #0x10
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_080062B8

    thumb_func_start func_080063AC
func_080063AC: @ 0x080063AC
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r3, #0
    adds r4, #2
    bl func_0800615C
    adds r0, r4, #0
    adds r1, r5, #0
    adds r2, r6, #0
    bl func_0800615C
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_080063AC

    thumb_func_start func_080063CC
func_080063CC: @ 0x080063CC
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r6, r1, #0
    adds r5, r2, #0
    adds r0, r5, #0
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    subs r4, #2
    adds r0, r5, #0
    movs r1, #0xa
    bl __divsi3
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_080063CC

    thumb_func_start func_08006408
func_08006408: @ 0x08006408
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r6, r1, #0
    adds r5, r2, #0
    adds r0, r5, #0
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r2, #0xa
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    subs r4, #2
    adds r0, r5, #0
    movs r1, #0xa
    bl __divsi3
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r2, #0xa
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_0800615C
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08006408

    thumb_func_start func_08006448
func_08006448: @ 0x08006448
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    adds r4, r0, #0
    mov r8, r1
    adds r5, r2, #0
    adds r6, r3, #0
    adds r0, r5, #0
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r2, r2, r6
    adds r0, r4, #0
    mov r1, r8
    bl func_0800615C
    subs r4, #2
    adds r0, r5, #0
    movs r1, #0xa
    bl __divsi3
    movs r1, #0xa
    bl __modsi3
    adds r2, r0, #0
    adds r2, r2, r6
    adds r0, r4, #0
    mov r1, r8
    bl func_0800615C
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08006448

    thumb_func_start func_08006490
func_08006490: @ 0x08006490
    push {r4, r5, lr}
    movs r5, #0
    ldr r0, .L080064A0 @ =gHeadBanimSprite
    ldr r0, [r0]
    cmp r0, #0
    beq .L08006502
    adds r4, r0, #0
    b .L080064A6
    .align 2, 0
.L080064A0: .4byte gHeadBanimSprite
.L080064A4:
    ldr r4, [r4, #0x38]
.L080064A6:
    ldrh r0, [r4]
    adds r1, r0, #0
    cmp r1, #0
    beq .L080064A4
    movs r0, #8
    ands r0, r1
    cmp r0, #0
    bne .L080064E6
    ldrh r1, [r4, #6]
    movs r2, #6
    ldrsh r0, [r4, r2]
    cmp r0, #0
    beq .L080064CA
    subs r0, r1, #1
    strh r0, [r4, #6]
    lsls r0, r0, #0x10
    cmp r0, #0
    bne .L080064DE
.L080064CA:
    adds r0, r4, #0
    bl func_08006688
    cmp r0, #1
    bne .L080064D6
    movs r5, #1
.L080064D6:
    movs r1, #6
    ldrsh r0, [r4, r1]
    cmp r0, #0
    beq .L080064CA
.L080064DE:
    ldrh r0, [r4]
    adds r1, r0, #0
    cmp r1, #0
    beq .L080064A4
.L080064E6:
    movs r0, #2
    ands r0, r1
    cmp r0, #0
    bne .L080064F4
    adds r0, r4, #0
    bl func_08006850
.L080064F4:
    ldr r0, [r4, #0x38]
    cmp r0, #0
    bne .L080064A4
    cmp r5, #1
    bne .L08006502
    bl func_080065F8
.L08006502:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08006490

    thumb_func_start func_08006508
func_08006508: @ 0x08006508
    ldr r0, .L0800652C @ =gBanimSprites
    movs r1, #0xe1
    lsls r1, r1, #4
    adds r2, r0, r1
    ldr r3, .L08006530 @ =gHeadBanimSprite
    cmp r0, r2
    bhs .L08006524
    movs r1, #0
.L08006518:
    strh r1, [r0]
    str r1, [r0, #0x34]
    str r1, [r0, #0x38]
    adds r0, #0x48
    cmp r0, r2
    blo .L08006518
.L08006524:
    movs r0, #0
    str r0, [r3]
    bx lr
    .align 2, 0
.L0800652C: .4byte gBanimSprites
.L08006530: .4byte gHeadBanimSprite
    func_end func_08006508

    thumb_func_start func_08006534
func_08006534: @ 0x08006534
    push {r4, lr}
    adds r3, r0, #0
    ldr r4, .L08006588 @ =gBanimSprites
    movs r0, #0xe1
    lsls r0, r0, #4
    adds r2, r4, r0
    cmp r4, r2
    bhs .L08006558
    ldrh r0, [r4]
    cmp r0, #0
    beq .L08006558
    adds r1, r2, #0
.L0800654C:
    adds r4, #0x48
    cmp r4, r1
    bhs .L08006558
    ldrh r0, [r4]
    cmp r0, #0
    bne .L0800654C
.L08006558:
    cmp r4, r2
    beq .L0800658C
    movs r0, #0
    movs r1, #0
    movs r2, #1
    strh r2, [r4]
    str r3, [r4, #0x20]
    str r3, [r4, #0x24]
    strh r1, [r4, #6]
    strh r1, [r4, #8]
    strh r1, [r4, #0xa]
    strh r1, [r4, #0xc]
    strh r1, [r4, #0x10]
    str r1, [r4, #0x1c]
    strb r0, [r4, #0x14]
    str r1, [r4, #0x2c]
    str r1, [r4, #0x30]
    str r1, [r4, #0x40]
    str r1, [r4, #0x44]
    adds r0, r4, #0
    bl func_08006808
    adds r0, r4, #0
    b .L0800658E
    .align 2, 0
.L08006588: .4byte gBanimSprites
.L0800658C:
    movs r0, #0
.L0800658E:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08006534

    thumb_func_start func_08006594
func_08006594: @ 0x08006594
    push {r4, r5, lr}
    adds r3, r0, #0
    lsls r1, r1, #0x10
    lsrs r5, r1, #0x10
    ldr r4, .L080065EC @ =gBanimSprites
    movs r0, #0xe1
    lsls r0, r0, #4
    adds r2, r4, r0
    cmp r4, r2
    bhs .L080065BC
    ldrh r0, [r4]
    cmp r0, #0
    beq .L080065BC
    adds r1, r2, #0
.L080065B0:
    adds r4, #0x48
    cmp r4, r1
    bhs .L080065BC
    ldrh r0, [r4]
    cmp r0, #0
    bne .L080065B0
.L080065BC:
    cmp r4, r2
    beq .L080065F0
    movs r0, #0
    movs r1, #0
    movs r2, #1
    strh r2, [r4]
    str r3, [r4, #0x20]
    str r3, [r4, #0x24]
    strh r1, [r4, #6]
    strh r1, [r4, #8]
    strh r5, [r4, #0xa]
    strh r1, [r4, #0xc]
    strh r1, [r4, #0x10]
    str r1, [r4, #0x1c]
    strb r0, [r4, #0x14]
    str r1, [r4, #0x2c]
    str r1, [r4, #0x30]
    str r1, [r4, #0x40]
    str r1, [r4, #0x44]
    adds r0, r4, #0
    bl func_08006808
    adds r0, r4, #0
    b .L080065F2
    .align 2, 0
.L080065EC: .4byte gBanimSprites
.L080065F0:
    movs r0, #0
.L080065F2:
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_08006594

    thumb_func_start func_080065F8
func_080065F8: @ 0x080065F8
    push {r4, r5, lr}
    ldr r4, .L08006648 @ =gBanimSprites
    movs r1, #0xe1
    lsls r1, r1, #4
    adds r0, r4, r1
    adds r5, r4, #0
    ldr r3, .L0800664C @ =gHeadBanimSprite
    cmp r4, r0
    bhs .L0800661E
    movs r1, #0
    adds r2, r0, #0
.L0800660E:
    ldrh r0, [r4]
    cmp r0, #0
    beq .L08006618
    str r1, [r4, #0x34]
    str r1, [r4, #0x38]
.L08006618:
    adds r4, #0x48
    cmp r4, r2
    blo .L0800660E
.L0800661E:
    movs r0, #0
    str r0, [r3]
    adds r4, r5, #0
    movs r1, #0xe1
    lsls r1, r1, #4
    adds r0, r4, r1
    cmp r4, r0
    bhs .L08006642
    adds r5, r0, #0
.L08006630:
    ldrh r0, [r4]
    cmp r0, #0
    beq .L0800663C
    adds r0, r4, #0
    bl func_08006808
.L0800663C:
    adds r4, #0x48
    cmp r4, r5
    blo .L08006630
.L08006642:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08006648: .4byte gBanimSprites
.L0800664C: .4byte gHeadBanimSprite
    func_end func_080065F8

    thumb_func_start func_08006650
func_08006650: @ 0x08006650
    adds r2, r0, #0
    ldr r3, [r2, #0x34]
    cmp r3, #0
    bne .L08006668
    ldr r1, .L08006664 @ =gHeadBanimSprite
    ldr r0, [r2, #0x38]
    str r0, [r1]
    str r3, [r0, #0x34]
    b .L08006672
    .align 2, 0
.L08006664: .4byte gHeadBanimSprite
.L08006668:
    ldr r0, [r2, #0x38]
    str r0, [r3, #0x38]
    ldr r1, [r2, #0x38]
    ldr r0, [r2, #0x34]
    str r0, [r1, #0x34]
.L08006672:
    movs r0, #0
    strh r0, [r2]
    str r0, [r2, #0x34]
    str r0, [r2, #0x38]
    bx lr
    func_end func_08006650

    thumb_func_start func_0800667C
func_0800667C: @ 0x0800667C
    push {lr}
    bl func_08006850
    pop {r0}
    bx r0
    func_end func_0800667C

    thumb_func_start func_08006688
func_08006688: @ 0x08006688
    push {r4, r5, lr}
    adds r2, r0, #0
    movs r4, #0
    ldr r0, [r2, #0x20]
    ldm r0!, {r3}
    str r0, [r2, #0x20]
    cmp r3, #0
    blt .L0800669A
    b .L080067E8
.L0800669A:
    movs r0, #0x80
    lsls r0, r0, #0x17
    ands r0, r3
    cmp r0, #0
    beq .L080066D4
    lsrs r1, r3, #0x1c
    movs r0, #3
    ands r1, r0
    cmp r1, #0
    beq .L080066B4
    cmp r1, #1
    beq .L080066C4
    b .L080067FC
.L080066B4:
    ldr r0, .L080066C0 @ =0x0FFFFFFF
    ands r3, r0
    adds r0, r2, #0
    bl _call_via_r3
    b .L080067FC
    .align 2, 0
.L080066C0: .4byte 0x0FFFFFFF
.L080066C4:
    ldr r0, .L080066D0 @ =0x0FFFFFFF
    ands r0, r3
    str r0, [r2, #0x24]
    str r0, [r2, #0x20]
    strh r1, [r2, #6]
    b .L080067FC
    .align 2, 0
.L080066D0: .4byte 0x0FFFFFFF
.L080066D4:
    lsrs r1, r3, #0x18
    movs r0, #0x3f
    ands r1, r0
    cmp r1, #6
    bls .L080066E0
    b .L080067FC
.L080066E0:
    lsls r0, r1, #2
    ldr r1, .L080066EC @ =.L080066F0
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080066EC: .4byte .L080066F0
.L080066F0: @ jump table
    .4byte .L0800670C @ case 0
    .4byte .L08006728 @ case 1
    .4byte .L08006734 @ case 2
    .4byte .L08006740 @ case 3
    .4byte .L0800673C @ case 4
    .4byte .L0800675C @ case 5
    .4byte .L080067BA @ case 6
.L0800670C:
    ldr r0, [r2, #0x20]
    subs r0, #4
    str r0, [r2, #0x20]
    movs r0, #1
    strh r0, [r2, #6]
    ldr r0, .L08006724 @ =0x00000FFF
    ldrh r1, [r2, #0xc]
    ands r0, r1
    movs r3, #0x80
    lsls r3, r3, #7
    adds r1, r3, #0
    b .L080067DE
    .align 2, 0
.L08006724: .4byte 0x00000FFF
.L08006728:
    movs r0, #0
    strh r0, [r2]
    movs r0, #1
    strh r0, [r2, #6]
    movs r4, #1
    b .L080067FC
.L08006734:
    ldr r0, [r2, #0x24]
    str r0, [r2, #0x20]
    movs r0, #1
    b .L080067FA
.L0800673C:
    strh r3, [r2, #6]
    b .L080067FC
.L08006740:
    lsls r0, r3, #0x18
    asrs r0, r0, #0x18
    ldrh r5, [r2, #2]
    adds r0, r5, r0
    strh r0, [r2, #2]
    lsls r0, r3, #0x10
    asrs r0, r0, #0x18
    ldrh r1, [r2, #4]
    adds r0, r1, r0
    strh r0, [r2, #4]
    lsrs r0, r3, #0x10
    movs r1, #0xff
    ands r0, r1
    b .L080067FA
.L0800675C:
    ldr r0, .L0800679C @ =0x00000FFF
    ldrh r5, [r2, #0xc]
    ands r0, r5
    movs r5, #0x80
    lsls r5, r5, #5
    adds r1, r5, #0
    orrs r0, r1
    strh r0, [r2, #0xc]
    adds r0, r2, #0
    adds r0, #0x15
    ldrb r1, [r2, #0x14]
    adds r0, r1, r0
    strb r3, [r0]
    ldrb r0, [r2, #0x14]
    adds r0, #1
    strb r0, [r2, #0x14]
    movs r0, #1
    strh r0, [r2, #6]
    movs r0, #0xff
    ands r0, r3
    cmp r0, #0x18
    beq .L080067B2
    cmp r0, #0x18
    bhi .L080067A0
    cmp r0, #1
    blo .L080067FC
    cmp r0, #5
    bls .L080067B2
    cmp r0, #0x13
    beq .L080067B2
    b .L080067FC
    .align 2, 0
.L0800679C: .4byte 0x00000FFF
.L080067A0:
    cmp r0, #0x39
    beq .L080067B2
    cmp r0, #0x39
    bhi .L080067AE
    cmp r0, #0x2d
    beq .L080067B2
    b .L080067FC
.L080067AE:
    cmp r0, #0x52
    bne .L080067FC
.L080067B2:
    ldr r0, [r2, #0x20]
    subs r0, #4
    str r0, [r2, #0x20]
    b .L080067FC
.L080067BA:
    strh r3, [r2, #6]
    lsrs r0, r3, #0x10
    strb r0, [r2, #0x13]
    ldr r0, [r2, #0x20]
    ldm r0!, {r1}
    str r1, [r2, #0x28]
    str r0, [r2, #0x20]
    ldm r0!, {r1}
    str r0, [r2, #0x20]
    ldr r0, [r2, #0x30]
    adds r1, r1, r0
    str r1, [r2, #0x3c]
    ldr r0, .L080067E4 @ =0x00000FFF
    ldrh r3, [r2, #0xc]
    ands r0, r3
    movs r5, #0x80
    lsls r5, r5, #6
    adds r1, r5, #0
.L080067DE:
    orrs r0, r1
    strh r0, [r2, #0xc]
    b .L080067FC
    .align 2, 0
.L080067E4: .4byte 0x00000FFF
.L080067E8:
    ldr r0, .L08006804 @ =0x0FFFFFFC
    ands r0, r3
    str r0, [r2, #0x3c]
    lsrs r0, r3, #0x1a
    movs r1, #0x1c
    ands r0, r1
    movs r1, #3
    ands r3, r1
    adds r0, r0, r3
.L080067FA:
    strh r0, [r2, #6]
.L080067FC:
    adds r0, r4, #0
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L08006804: .4byte 0x0FFFFFFC
    func_end func_08006688

    thumb_func_start func_08006808
func_08006808: @ 0x08006808
    push {r4, lr}
    adds r2, r0, #0
    ldr r0, .L0800681C @ =gHeadBanimSprite
    ldr r1, [r0]
    adds r4, r0, #0
    cmp r1, #0
    bne .L08006828
.L08006816:
    str r2, [r4]
    b .L0800684A
    .align 2, 0
.L0800681C: .4byte gHeadBanimSprite
.L08006820:
    str r0, [r2, #0x38]
    str r1, [r2, #0x34]
    str r2, [r1, #0x38]
    b .L0800684A
.L08006828:
    ldrh r3, [r2, #0xa]
    b .L08006834
.L0800682C:
    ldr r0, [r1, #0x38]
    cmp r0, #0
    beq .L08006820
    adds r1, r0, #0
.L08006834:
    ldrh r0, [r1, #0xa]
    cmp r3, r0
    bls .L0800682C
    ldr r3, [r1, #0x34]
    str r3, [r2, #0x34]
    str r1, [r2, #0x38]
    str r2, [r1, #0x34]
    ldr r0, [r2, #0x34]
    cmp r0, #0
    beq .L08006816
    str r2, [r3, #0x38]
.L0800684A:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08006808

    thumb_func_start func_08006850
func_08006850: @ 0x08006850
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    adds r7, r0, #0
    ldr r4, .L0800695C @ =0x0300291C
    ldrh r0, [r4]
    str r0, [sp]
    ldr r2, [r7, #0x3c]
    cmp r2, #0
    beq .L0800694C
    ldr r3, [r2]
    ldr r1, .L08006960 @ =0xFFFF0000
    adds r0, r3, #0
    ands r0, r1
    cmp r0, r1
    bne .L080068B0
    ldr r6, .L08006964 @ =0x0000FFFF
    ands r6, r3
    cmp r6, #0
    beq .L080068B0
    ldr r3, .L08006968 @ =0x03003948
.L08006880:
    ldr r0, [r3]
    ldrh r1, [r2, #4]
    strh r1, [r0, #6]
    adds r0, #8
    str r0, [r3]
    ldrh r1, [r2, #6]
    strh r1, [r0, #6]
    adds r0, #8
    str r0, [r3]
    ldrh r1, [r2, #8]
    strh r1, [r0, #6]
    adds r0, #8
    str r0, [r3]
    ldrh r1, [r2, #0xa]
    strh r1, [r0, #6]
    adds r0, #8
    str r0, [r3]
    ldrh r0, [r4]
    adds r0, #1
    strh r0, [r4]
    subs r6, #1
    adds r2, #0xc
    cmp r6, #0
    bne .L08006880
.L080068B0:
    adds r5, r2, #0
    ldr r0, [r5]
    cmp r0, #1
    beq .L0800694C
    ldr r2, .L0800696C @ =gOamHiPutIt
    ldr r0, [r2]
    ldr r1, .L08006970 @ =0x03002D30
    mov sl, r1
    cmp r0, sl
    bhs .L0800694C
    movs r0, #0x80
    lsls r0, r0, #1
    mov sb, r0
    movs r1, #0x40
    rsbs r1, r1, #0
    mov r8, r1
    mov ip, r2
.L080068D2:
    movs r2, #6
    ldrsh r1, [r5, r2]
    movs r2, #2
    ldrsh r0, [r7, r2]
    adds r3, r1, r0
    movs r0, #8
    ldrsh r1, [r5, r0]
    movs r2, #4
    ldrsh r0, [r7, r2]
    adds r4, r1, r0
    cmp r3, sb
    bgt .L080068EE
    cmp r3, r8
    bge .L080068F2
.L080068EE:
    movs r3, #0xc0
    lsls r3, r3, #1
.L080068F2:
    cmp r4, #0xa0
    bgt .L080068FA
    cmp r4, r8
    bge .L080068FE
.L080068FA:
    movs r3, #0xc0
    lsls r3, r3, #1
.L080068FE:
    ldr r0, .L08006974 @ =0x000001FF
    ands r3, r0
    movs r0, #0xff
    ands r4, r0
    movs r6, #0
    ldr r1, [r5]
    adds r0, r1, #0
    mov r2, sb
    ands r0, r2
    cmp r0, #0
    beq .L08006918
    ldr r0, [sp]
    lsls r6, r0, #0x19
.L08006918:
    ldr r0, [r7, #0x1c]
    adds r6, r6, r0
    mov r0, ip
    ldr r2, [r0]
    adds r0, r1, r6
    lsls r1, r3, #0x10
    orrs r0, r1
    orrs r0, r4
    stm r2!, {r0}
    mov r1, ip
    str r2, [r1]
    ldr r0, .L08006978 @ =0x0000F3FF
    ldrh r1, [r5, #4]
    ands r0, r1
    ldrh r1, [r7, #8]
    adds r0, r1, r0
    strh r0, [r2]
    adds r2, #4
    mov r0, ip
    str r2, [r0]
    adds r5, #0xc
    ldr r0, [r5]
    cmp r0, #1
    beq .L0800694C
    cmp r2, sl
    blo .L080068D2
.L0800694C:
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800695C: .4byte 0x0300291C
.L08006960: .4byte 0xFFFF0000
.L08006964: .4byte 0x0000FFFF
.L08006968: .4byte 0x03003948
.L0800696C: .4byte gOamHiPutIt
.L08006970: .4byte 0x03002D30
.L08006974: .4byte 0x000001FF
.L08006978: .4byte 0x0000F3FF
    func_end func_08006850

    thumb_func_start func_0800697C
func_0800697C: @ 0x0800697C
    push {r4, r5, r6, lr}
    ldr r6, [sp, #0x10]
    ldr r5, .L080069AC @ =0x03002930
    lsls r0, r0, #4
    adds r4, r0, #3
    lsls r4, r4, #1
    adds r4, r4, r5
    strh r1, [r4]
    adds r1, r0, #7
    lsls r1, r1, #1
    adds r1, r1, r5
    strh r2, [r1]
    adds r1, r0, #0
    adds r1, #0xb
    lsls r1, r1, #1
    adds r1, r1, r5
    strh r3, [r1]
    adds r0, #0xf
    lsls r0, r0, #1
    adds r0, r0, r5
    strh r6, [r0]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080069AC: .4byte 0x03002930
    func_end func_0800697C

    thumb_func_start func_080069B0
func_080069B0: @ 0x080069B0
    push {r4, r5, r6, lr}
    movs r3, #0xf
    ldr r2, .L080069E8 @ =gSpriteLayers
    ldr r6, .L080069EC @ =0x03004190
    ldr r5, .L080069F0 @ =gSpriteList
    movs r4, #0
    movs r0, #0x80
    lsls r0, r0, #1
    adds r1, r2, r0
    adds r0, r2, #0
    adds r0, #0xf0
.L080069C6:
    str r1, [r0]
    str r4, [r0, #0xc]
    subs r1, #0x10
    subs r0, #0x10
    subs r3, #1
    cmp r3, #0
    bge .L080069C6
    adds r0, r2, #0
    adds r0, #0xf0
    movs r1, #0
    str r1, [r0]
    subs r0, #0x30
    str r1, [r0]
    str r5, [r6]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080069E8: .4byte gSpriteLayers
.L080069EC: .4byte 0x03004190
.L080069F0: .4byte gSpriteList
    func_end func_080069B0

    thumb_func_start func_080069F4
func_080069F4: @ 0x080069F4
    push {r4, r5, r6, r7, lr}
    ldr r6, .L08006A28 @ =0x03004190
    ldr r5, [r6]
    ldr r4, .L08006A2C @ =gSpriteLayers
    lsls r0, r0, #4
    adds r0, r0, r4
    ldr r4, [r0]
    str r4, [r5]
    ldr r7, .L08006A30 @ =0x000001FF
    adds r4, r7, #0
    ands r1, r4
    strh r1, [r5, #4]
    movs r1, #0xff
    ands r2, r1
    strh r2, [r5, #6]
    mov r1, sp
    ldrh r1, [r1, #0x14]
    strh r1, [r5, #8]
    str r3, [r5, #0xc]
    str r5, [r0]
    adds r5, #0x10
    str r5, [r6]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08006A28: .4byte 0x03004190
.L08006A2C: .4byte gSpriteLayers
.L08006A30: .4byte 0x000001FF
    func_end func_080069F4

    thumb_func_start func_08006A34
func_08006A34: @ 0x08006A34
    push {r4, r5, r6, r7, lr}
    ldr r7, [sp, #0x14]
    ldr r6, .L08006A5C @ =0x03004190
    ldr r4, [r6]
    ldr r5, .L08006A60 @ =gSpriteLayers
    lsls r0, r0, #4
    adds r0, r0, r5
    ldr r5, [r0]
    str r5, [r4]
    strh r1, [r4, #4]
    strh r2, [r4, #6]
    strh r7, [r4, #8]
    str r3, [r4, #0xc]
    str r4, [r0]
    adds r4, #0x10
    str r4, [r6]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08006A5C: .4byte 0x03004190
.L08006A60: .4byte gSpriteLayers
    func_end func_08006A34

    thumb_func_start func_08006A64
func_08006A64: @ 0x08006A64
    push {r4, lr}
    lsls r0, r0, #4
    ldr r1, .L08006A90 @ =gSpriteLayers
    adds r4, r0, r1
    cmp r4, #0
    beq .L08006A8A
.L08006A70:
    ldr r2, [r4, #0xc]
    cmp r2, #0
    beq .L08006A84
    movs r1, #4
    ldrsh r0, [r4, r1]
    movs r3, #6
    ldrsh r1, [r4, r3]
    ldrh r3, [r4, #8]
    bl PutOamHiRam
.L08006A84:
    ldr r4, [r4]
    cmp r4, #0
    bne .L08006A70
.L08006A8A:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08006A90: .4byte gSpriteLayers
    func_end func_08006A64

    thumb_func_start func_08006A94
func_08006A94: @ 0x08006A94
    push {r4, lr}
    sub sp, #4
    adds r1, r0, #0
    adds r1, #0x50
    movs r2, #0
    ldrsh r4, [r1, r2]
    ldr r1, [r0, #0x2c]
    ldr r2, [r0, #0x30]
    ldr r3, [r0, #0x54]
    adds r0, #0x52
    ldrh r0, [r0]
    str r0, [sp]
    adds r0, r4, #0
    bl func_080069F4
    add sp, #4
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08006A94

    thumb_func_start func_08006ABC
func_08006ABC: @ 0x08006ABC
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    adds r7, r1, #0
    adds r5, r2, #0
    adds r6, r3, #0
    cmp r4, #0
    beq .L08006AD4
    ldr r0, .L08006AD0 @ =0x08B90648
    adds r1, r4, #0
    b .L08006AD8
    .align 2, 0
.L08006AD0: .4byte 0x08B90648
.L08006AD4:
    ldr r0, .L08006AFC @ =0x08B90648
    movs r1, #3
.L08006AD8:
    bl SpawnProc
    adds r1, r0, #0
    str r5, [r1, #0x2c]
    str r6, [r1, #0x30]
    adds r0, r1, #0
    adds r0, #0x50
    strh r7, [r0]
    ldr r0, [sp, #0x14]
    str r0, [r1, #0x54]
    adds r2, r1, #0
    adds r2, #0x52
    ldr r0, [sp, #0x18]
    strh r0, [r2]
    adds r0, r1, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08006AFC: .4byte 0x08B90648
    func_end func_08006ABC

    thumb_func_start func_08006B00
func_08006B00: @ 0x08006B00
    push {r4, r5, lr}
    adds r4, r1, #0
    adds r5, r2, #0
    cmp r0, #0
    bne .L08006B10
    ldr r0, .L08006B1C @ =0x08B90648
    bl Proc_Find
.L08006B10:
    str r4, [r0, #0x2c]
    str r5, [r0, #0x30]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08006B1C: .4byte 0x08B90648
    func_end func_08006B00

    thumb_func_start func_08006B20
func_08006B20: @ 0x08006B20
    adds r1, r0, #0
    lsls r0, r1, #3
    subs r0, r0, r1
    lsls r0, r0, #2
    ldr r1, .L08006B30 @ =0x08C96584
    adds r0, r0, r1
    bx lr
    .align 2, 0
.L08006B30: .4byte 0x08C96584
    func_end func_08006B20

    thumb_func_start InitFaces
InitFaces: @ 0x08006B34
    push {r4, lr}
    movs r4, #0
.L08006B38:
    adds r0, r4, #0
    bl func_08006D50
    adds r4, #1
    cmp r4, #3
    ble .L08006B38
    movs r0, #0
    bl SetFaceConfig
    pop {r4}
    pop {r0}
    bx r0
    func_end InitFaces

    thumb_func_start SetFaceConfig
SetFaceConfig: @ 0x08006B50
    cmp r0, #0
    bne .L08006B56
    ldr r0, .L08006B70 @ =0x08B90658
.L08006B56:
    ldr r2, .L08006B74 @ =gFaceConfig
    adds r1, r0, #0
    movs r3, #3
.L08006B5C:
    ldr r0, [r1]
    str r0, [r2]
    ldrh r0, [r1, #4]
    strh r0, [r2, #4]
    adds r2, #8
    adds r1, #8
    subs r3, #1
    cmp r3, #0
    bge .L08006B5C
    bx lr
    .align 2, 0
.L08006B70: .4byte 0x08B90658
.L08006B74: .4byte gFaceConfig
    func_end SetFaceConfig

    thumb_func_start func_08006B78
func_08006B78: @ 0x08006B78
    movs r1, #0
    ldr r2, .L08006B88 @ =0x030041C0
.L08006B7C:
    ldr r0, [r2]
    cmp r0, #0
    bne .L08006B8C
    adds r0, r1, #0
    b .L08006B98
    .align 2, 0
.L08006B88: .4byte 0x030041C0
.L08006B8C:
    adds r2, #4
    adds r1, #1
    cmp r1, #3
    ble .L08006B7C
    movs r0, #1
    rsbs r0, r0, #0
.L08006B98:
    bx lr
    func_end func_08006B78

    thumb_func_start func_08006B9C
func_08006B9C: @ 0x08006B9C
    push {lr}
    ldr r1, [r0, #0x2c]
    ldr r2, [r1]
    ldr r1, .L08006BBC @ =gFaceConfig
    adds r0, #0x40
    ldrb r0, [r0]
    lsls r0, r0, #3
    adds r0, r0, r1
    ldr r1, [r0]
    ldr r0, .L08006BC0 @ =0x06010000
    adds r1, r1, r0
    adds r0, r2, #0
    bl Decompress
    pop {r0}
    bx r0
    .align 2, 0
.L08006BBC: .4byte gFaceConfig
.L08006BC0: .4byte 0x06010000
    func_end func_08006B9C

    thumb_func_start func_08006BC4
func_08006BC4: @ 0x08006BC4
    push {r4, lr}
    sub sp, #4
    adds r4, r0, #0
    bl func_08006D9C
    adds r2, r0, #0
    movs r0, #0x80
    lsls r0, r0, #3
    ands r2, r0
    rsbs r2, r2, #0
    asrs r2, r2, #0x1f
    ands r2, r0
    movs r0, #0xff
    ldrh r1, [r4, #0x36]
    ands r0, r1
    adds r2, r2, r0
    adds r0, r4, #0
    adds r0, #0x41
    ldrb r0, [r0]
    ldr r1, .L08006C04 @ =0x000001FF
    ldrh r3, [r4, #0x34]
    ands r1, r3
    ldr r3, [r4, #0x38]
    ldrh r4, [r4, #0x3c]
    str r4, [sp]
    bl func_08006A34
    add sp, #4
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08006C04: .4byte 0x000001FF
    func_end func_08006BC4

    thumb_func_start StartFaceAuto
StartFaceAuto: @ 0x08006C08
    push {r4, r5, r6, r7, lr}
    sub sp, #4
    adds r5, r0, #0
    adds r6, r1, #0
    adds r7, r2, #0
    adds r4, r3, #0
    bl func_08006B78
    cmp r0, #0
    blt .L08006C2A
    str r4, [sp]
    adds r1, r5, #0
    adds r2, r6, #0
    adds r3, r7, #0
    bl StartFace
    b .L08006C2C
.L08006C2A:
    movs r0, #0
.L08006C2C:
    add sp, #4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end StartFaceAuto

    thumb_func_start StartFace
StartFace: @ 0x08006C34
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
    ldr r1, .L08006C58 @ =0x030041C0
    lsls r0, r6, #2
    adds r5, r0, r1
    ldr r7, [r5]
    cmp r7, #0
    beq .L08006C5C
    movs r0, #0
    b .L08006D18
    .align 2, 0
.L08006C58: .4byte 0x030041C0
.L08006C5C:
    ldr r0, .L08006C9C @ =0x08B907C0
    movs r1, #5
    bl SpawnProc
    adds r4, r0, #0
    str r4, [r5]
    mov r0, r8
    bl func_08006B20
    adds r5, r0, #0
    movs r0, #0x80
    lsls r0, r0, #6
    ldr r1, [sp, #0x24]
    ands r0, r1
    cmp r0, #0
    beq .L08006CAC
    str r7, [sp]
    ldr r1, .L08006CA0 @ =gFaceConfig
    lsls r0, r6, #3
    adds r0, r0, r1
    ldrh r0, [r0, #4]
    lsls r1, r0, #5
    ldr r0, .L08006CA4 @ =0x02022A60
    adds r1, r1, r0
    ldr r2, .L08006CA8 @ =0x01000008
    mov r0, sp
    bl CpuFastSet
    bl EnablePalSync
    b .L08006CC0
    .align 2, 0
.L08006C9C: .4byte 0x08B907C0
.L08006CA0: .4byte gFaceConfig
.L08006CA4: .4byte 0x02022A60
.L08006CA8: .4byte 0x01000008
.L08006CAC:
    ldr r0, [r5, #8]
    ldr r2, .L08006CF0 @ =gFaceConfig
    lsls r1, r6, #3
    adds r1, r1, r2
    ldrh r1, [r1, #4]
    adds r1, #0x10
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
.L08006CC0:
    str r5, [r4, #0x2c]
    adds r0, r4, #0
    adds r0, #0x40
    movs r2, #0
    strb r6, [r0]
    mov r0, r8
    strh r0, [r4, #0x3e]
    adds r1, r4, #0
    adds r1, #0x41
    movs r0, #5
    strb r0, [r1]
    mov r1, sb
    strh r1, [r4, #0x34]
    mov r0, sl
    strh r0, [r4, #0x36]
    movs r0, #0x80
    lsls r0, r0, #5
    ldr r1, [sp, #0x24]
    ands r0, r1
    cmp r0, #0
    beq .L08006CF4
    str r2, [r4, #0x44]
    str r2, [r4, #0x48]
    b .L08006D08
    .align 2, 0
.L08006CF0: .4byte gFaceConfig
.L08006CF4:
    ldr r0, .L08006D28 @ =0x08B908B8
    adds r1, r4, #0
    bl SpawnProc
    str r0, [r4, #0x44]
    ldr r0, .L08006D2C @ =0x08B908D0
    adds r1, r4, #0
    bl SpawnProc
    str r0, [r4, #0x48]
.L08006D08:
    ldr r1, [sp, #0x24]
    mvns r0, r1
    str r0, [r4, #0x30]
    adds r0, r4, #0
    ldr r1, [sp, #0x24]
    bl func_08006D68
    adds r0, r4, #0
.L08006D18:
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08006D28: .4byte 0x08B908B8
.L08006D2C: .4byte 0x08B908D0
    func_end StartFace

    thumb_func_start func_08006D30
func_08006D30: @ 0x08006D30
    push {lr}
    ldr r2, .L08006D4C @ =0x030041C0
    adds r1, r0, #0
    adds r1, #0x40
    ldrb r1, [r1]
    lsls r1, r1, #2
    adds r1, r1, r2
    movs r2, #0
    str r2, [r1]
    bl Proc_End
    pop {r0}
    bx r0
    .align 2, 0
.L08006D4C: .4byte 0x030041C0
    func_end func_08006D30

    thumb_func_start func_08006D50
func_08006D50: @ 0x08006D50
    push {lr}
    ldr r1, .L08006D64 @ =0x030041C0
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r0, [r0]
    bl func_08006D30
    pop {r0}
    bx r0
    .align 2, 0
.L08006D64: .4byte 0x030041C0
    func_end func_08006D50

    thumb_func_start func_08006D68
func_08006D68: @ 0x08006D68
    push {r4, lr}
    adds r4, r0, #0
    cmp r4, #0
    beq .L08006D7A
    str r1, [r4, #0x30]
    bl func_08006DB8
    ldr r0, [r4, #0x30]
    b .L08006D7C
.L08006D7A:
    movs r0, #0
.L08006D7C:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08006D68

    thumb_func_start func_08006D84
func_08006D84: @ 0x08006D84
    push {lr}
    ldr r2, .L08006D98 @ =0x030041C0
    lsls r0, r0, #2
    adds r0, r0, r2
    ldr r0, [r0]
    bl func_08006D68
    pop {r1}
    bx r1
    .align 2, 0
.L08006D98: .4byte 0x030041C0
    func_end func_08006D84

    thumb_func_start func_08006D9C
func_08006D9C: @ 0x08006D9C
    ldr r0, [r0, #0x30]
    bx lr
    func_end func_08006D9C

    thumb_func_start func_08006DA0
func_08006DA0: @ 0x08006DA0
    push {lr}
    ldr r1, .L08006DB4 @ =0x030041C0
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r0, [r0]
    bl func_08006D9C
    pop {r1}
    bx r1
    .align 2, 0
.L08006DB4: .4byte 0x030041C0
    func_end func_08006DA0

    thumb_func_start func_08006DB8
func_08006DB8: @ 0x08006DB8
    push {r4, lr}
    adds r3, r0, #0
    ldr r1, [r3, #0x30]
    ldr r0, .L08006DE0 @ =0x00000807
    ands r1, r0
    cmp r1, #3
    beq .L08006E04
    cmp r1, #3
    bls .L08006DE4
    cmp r1, #5
    beq .L08006E14
    cmp r1, #5
    blo .L08006E0C
    subs r0, #7
    cmp r1, r0
    beq .L08006E1C
    adds r0, #1
    cmp r1, r0
    beq .L08006E24
    b .L08006E28
    .align 2, 0
.L08006DE0: .4byte 0x00000807
.L08006DE4:
    cmp r1, #1
    beq .L08006DF4
    cmp r1, #1
    bhi .L08006DFC
    ldr r0, .L08006DF0 @ =0x08B90678
    b .L08006E26
    .align 2, 0
.L08006DF0: .4byte 0x08B90678
.L08006DF4:
    ldr r0, .L08006DF8 @ =0x08B90692
    b .L08006E26
    .align 2, 0
.L08006DF8: .4byte 0x08B90692
.L08006DFC:
    ldr r0, .L08006E00 @ =0x08B906AC
    b .L08006E26
    .align 2, 0
.L08006E00: .4byte 0x08B906AC
.L08006E04:
    ldr r0, .L08006E08 @ =0x08B906D2
    b .L08006E26
    .align 2, 0
.L08006E08: .4byte 0x08B906D2
.L08006E0C:
    ldr r0, .L08006E10 @ =0x08B906F8
    b .L08006E26
    .align 2, 0
.L08006E10: .4byte 0x08B906F8
.L08006E14:
    ldr r0, .L08006E18 @ =0x08B9072A
    b .L08006E26
    .align 2, 0
.L08006E18: .4byte 0x08B9072A
.L08006E1C:
    ldr r0, .L08006E20 @ =0x08B9075C
    b .L08006E26
    .align 2, 0
.L08006E20: .4byte 0x08B9075C
.L08006E24:
    ldr r0, .L08006E40 @ =0x08B9078E
.L08006E26:
    str r0, [r3, #0x38]
.L08006E28:
    ldr r1, [r3, #0x30]
    movs r0, #0xf0
    lsls r0, r0, #2
    ands r1, r0
    cmp r1, #0x80
    beq .L08006E52
    cmp r1, #0x80
    bhi .L08006E44
    cmp r1, #0x40
    beq .L08006E4E
    b .L08006E5E
    .align 2, 0
.L08006E40: .4byte 0x08B9078E
.L08006E44:
    movs r0, #0x80
    lsls r0, r0, #2
    cmp r1, r0
    beq .L08006E58
    b .L08006E5E
.L08006E4E:
    movs r4, #0
    b .L08006E62
.L08006E52:
    movs r4, #0x80
    lsls r4, r4, #3
    b .L08006E62
.L08006E58:
    movs r4, #0xc0
    lsls r4, r4, #4
    b .L08006E62
.L08006E5E:
    movs r4, #0x80
    lsls r4, r4, #4
.L08006E62:
    ldr r1, .L08006E88 @ =gFaceConfig
    adds r0, r3, #0
    adds r0, #0x40
    ldrb r0, [r0]
    lsls r2, r0, #3
    adds r2, r2, r1
    ldr r1, [r2]
    lsrs r1, r1, #5
    movs r0, #0xf
    ldrh r2, [r2, #4]
    ands r0, r2
    lsls r0, r0, #0xc
    adds r1, r1, r0
    adds r1, r1, r4
    strh r1, [r3, #0x3c]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08006E88: .4byte gFaceConfig
    func_end func_08006DB8

    thumb_func_start func_08006E8C
func_08006E8C: @ 0x08006E8C
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    mov r8, r0
    mov ip, r2
    ldrb r7, [r1]
    adds r1, #1
    ldrb r6, [r1]
    adds r2, r1, #1
    lsls r3, r3, #0x18
    cmp r3, #0
    bne .L08006ED6
    movs r0, #0
    cmp r0, r6
    bge .L08006F10
.L08006EAA:
    adds r4, r0, #1
    cmp r7, #0
    beq .L08006ECE
    lsls r0, r0, #6
    mov r3, r8
    adds r1, r0, r3
    adds r3, r7, #0
.L08006EB8:
    ldrb r0, [r2]
    cmp r0, #0xff
    beq .L08006EC4
    ldrb r0, [r2]
    add r0, ip
    strh r0, [r1]
.L08006EC4:
    adds r2, #1
    adds r1, #2
    subs r3, #1
    cmp r3, #0
    bne .L08006EB8
.L08006ECE:
    adds r0, r4, #0
    cmp r0, r6
    blt .L08006EAA
    b .L08006F10
.L08006ED6:
    movs r0, #0
    cmp r0, r6
    bge .L08006F10
.L08006EDC:
    subs r3, r7, #1
    adds r4, r0, #1
    cmp r3, #0
    blt .L08006F0A
    movs r1, #0x80
    lsls r1, r1, #3
    adds r5, r1, #0
    lsls r1, r3, #1
    lsls r0, r0, #6
    add r0, r8
    adds r1, r1, r0
.L08006EF2:
    ldrb r0, [r2]
    cmp r0, #0xff
    beq .L08006F00
    ldrb r0, [r2]
    add r0, ip
    adds r0, r0, r5
    strh r0, [r1]
.L08006F00:
    adds r2, #1
    subs r1, #2
    subs r3, #1
    cmp r3, #0
    bge .L08006EF2
.L08006F0A:
    adds r0, r4, #0
    cmp r0, r6
    blt .L08006EDC
.L08006F10:
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_08006E8C

    thumb_func_start func_08006F1C
func_08006F1C: @ 0x08006F1C
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    ldr r0, .L08006F50 @ =0x00007EFF
    cmp r4, r0
    ble .L08006F58
    adds r0, r4, #0
    bl func_08007598
    lsls r1, r5, #5
    movs r3, #0xc0
    lsls r3, r3, #0x13
    adds r1, r1, r3
    ldr r2, .L08006F54 @ =0x0001FFFF
    ands r1, r2
    adds r1, r1, r3
    movs r2, #0x80
    lsls r2, r2, #2
    bl RegisterDataMove
    adds r0, r4, #0
    adds r1, r6, #0
    bl func_080075C8
    b .L08006F78
    .align 2, 0
.L08006F50: .4byte 0x00007EFF
.L08006F54: .4byte 0x0001FFFF
.L08006F58:
    adds r0, r4, #0
    bl func_08006B20
    adds r4, r0, #0
    ldr r0, [r4, #4]
    lsls r1, r5, #5
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r1, r1, r2
    bl Decompress
    ldr r0, [r4, #8]
    lsls r1, r6, #5
    movs r2, #0x20
    bl ApplyPaletteExt
.L08006F78:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end func_08006F1C

    thumb_func_start func_08006F80
func_08006F80: @ 0x08006F80
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    mov r8, r1
    adds r6, r2, #0
    adds r5, r3, #0
    ldr r4, [sp, #0x14]
    lsls r4, r4, #0x18
    lsrs r4, r4, #0x18
    adds r1, r6, #0
    adds r2, r5, #0
    bl func_08006F1C
    ldr r2, .L08006FBC @ =0x000003FF
    ands r2, r6
    ldr r1, .L08006FC0 @ =0x08B90830
    lsls r5, r5, #0xc
    adds r2, r2, r5
    lsls r4, r4, #0x18
    asrs r4, r4, #0x18
    mov r0, r8
    adds r3, r4, #0
    bl func_08006E8C
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08006FBC: .4byte 0x000003FF
.L08006FC0: .4byte 0x08B90830
    func_end func_08006F80

    thumb_func_start func_08006FC4
func_08006FC4: @ 0x08006FC4
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    ldr r4, .L08007054 @ =0xFFFFFE00
    add sp, r4
    adds r6, r0, #0
    adds r7, r1, #0
    mov r8, r2
    movs r0, #0x80
    lsls r0, r0, #4
    adds r7, r7, r0
    ldr r0, .L08007058 @ =0x00007EFF
    cmp r6, r0
    ble .L08007060
    adds r0, r6, #0
    bl func_08007598
    lsls r1, r7, #5
    ldr r5, .L0800705C @ =0x0001FFFF
    ands r1, r5
    movs r4, #0xc0
    lsls r4, r4, #0x13
    adds r1, r1, r4
    movs r2, #0x80
    bl RegisterDataMove
    adds r0, r6, #0
    bl func_08007598
    adds r0, #0x80
    adds r1, r7, #0
    adds r1, #0x20
    lsls r1, r1, #5
    ands r1, r5
    adds r1, r1, r4
    movs r2, #0x80
    bl RegisterDataMove
    adds r0, r6, #0
    bl func_08007598
    movs r1, #0x80
    lsls r1, r1, #1
    adds r0, r0, r1
    adds r1, r7, #4
    lsls r1, r1, #5
    ands r1, r5
    adds r1, r1, r4
    movs r2, #0x80
    bl RegisterDataMove
    adds r0, r6, #0
    bl func_08007598
    movs r1, #0xc0
    lsls r1, r1, #1
    adds r0, r0, r1
    adds r1, r7, #0
    adds r1, #0x24
    lsls r1, r1, #5
    ands r1, r5
    adds r1, r1, r4
    movs r2, #0x80
    bl RegisterDataMove
    mov r1, r8
    adds r1, #0x10
    adds r0, r6, #0
    bl func_080075C8
    b .L080070BC
    .align 2, 0
.L08007054: .4byte 0xFFFFFE00
.L08007058: .4byte 0x00007EFF
.L0800705C: .4byte 0x0001FFFF
.L08007060:
    adds r0, r6, #0
    bl func_08006B20
    adds r5, r0, #0
    ldr r0, [r5, #4]
    mov r1, sp
    bl Decompress
    lsls r1, r7, #5
    movs r4, #0xc0
    lsls r4, r4, #0x13
    adds r1, r1, r4
    mov r0, sp
    movs r2, #0x20
    bl CpuFastSet
    add r0, sp, #0x80
    adds r1, r7, #0
    adds r1, #0x20
    lsls r1, r1, #5
    adds r1, r1, r4
    movs r2, #0x20
    bl CpuFastSet
    add r0, sp, #0x100
    adds r1, r7, #4
    lsls r1, r1, #5
    adds r1, r1, r4
    movs r2, #0x20
    bl CpuFastSet
    add r0, sp, #0x180
    adds r1, r7, #0
    adds r1, #0x24
    lsls r1, r1, #5
    adds r1, r1, r4
    movs r2, #0x20
    bl CpuFastSet
    ldr r0, [r5, #8]
    mov r1, r8
    adds r1, #0x10
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
.L080070BC:
    movs r3, #0x80
    lsls r3, r3, #2
    add sp, r3
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_08006FC4

    thumb_func_start func_080070CC
func_080070CC: @ 0x080070CC
    push {r4, lr}
    sub sp, #4
    movs r2, #0x34
    ldrsh r1, [r0, r2]
    ldr r3, .L080070F8 @ =gDispIo
    ldrh r4, [r3, #0x1c]
    subs r1, r1, r4
    movs r4, #0x36
    ldrsh r2, [r0, r4]
    ldrh r3, [r3, #0x1e]
    subs r2, r2, r3
    ldr r3, [r0, #0x38]
    ldrh r0, [r0, #0x3c]
    str r0, [sp]
    movs r0, #5
    bl func_080069F4
    add sp, #4
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L080070F8: .4byte gDispIo
    func_end func_080070CC

    thumb_func_start func_080070FC
func_080070FC: @ 0x080070FC
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    mov r8, r0
    mov sb, r1
    adds r0, r2, #0
    adds r6, r3, #0
    ldr r4, [sp, #0x1c]
    ldr r5, [sp, #0x20]
    ldr r7, [sp, #0x24]
    lsls r5, r5, #0x18
    lsrs r5, r5, #0x18
    adds r1, r6, #0
    adds r2, r4, #0
    bl func_08006FC4
    ldr r0, .L08007144 @ =0x08B90844
    adds r1, r7, #0
    bl SpawnProc
    adds r1, r0, #0
    mov r0, r8
    strh r0, [r1, #0x34]
    mov r0, sb
    strh r0, [r1, #0x36]
    movs r0, #0xf
    ands r4, r0
    lsls r4, r4, #0xc
    adds r6, r6, r4
    strh r6, [r1, #0x3c]
    cmp r5, #0
    beq .L0800714C
    ldr r0, .L08007148 @ =0x08B90862
    b .L0800714E
    .align 2, 0
.L08007144: .4byte 0x08B90844
.L08007148: .4byte 0x08B90862
.L0800714C:
    ldr r0, .L0800715C @ =0x08B90854
.L0800714E:
    str r0, [r1, #0x38]
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800715C: .4byte 0x08B90854
    func_end func_080070FC

    thumb_func_start func_08007160
func_08007160: @ 0x08007160
    push {lr}
    ldr r0, .L0800716C @ =0x08B90844
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L0800716C: .4byte 0x08B90844
    func_end func_08007160

    thumb_func_start func_08007170
func_08007170: @ 0x08007170
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r7, r1, #0
    ldrb r6, [r2, #0x14]
    subs r6, #1
    ldrb r4, [r2, #0x15]
    ldr r1, .L080071C0 @ =0x08195680
    lsls r2, r7, #0x10
    lsrs r2, r2, #0x10
    bl TmApplyTsa_thm
    lsls r4, r4, #5
    adds r4, r4, r6
    lsls r4, r4, #1
    adds r2, r4, r5
    adds r0, r7, #0
    adds r0, #0x1c
    strh r0, [r2]
    adds r0, #1
    strh r0, [r2, #2]
    adds r0, #1
    strh r0, [r2, #4]
    adds r0, #1
    strh r0, [r2, #6]
    adds r1, r2, #0
    adds r1, #0x40
    adds r0, #0x1d
    strh r0, [r1]
    adds r1, #2
    adds r0, #1
    strh r0, [r1]
    adds r1, #2
    adds r0, #1
    strh r0, [r1]
    adds r1, #2
    adds r0, #1
    strh r0, [r1]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080071C0: .4byte 0x08195680
    func_end func_08007170

    thumb_func_start func_080071C4
func_080071C4: @ 0x080071C4
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r7, r1, #0
    ldrb r6, [r2, #0x14]
    subs r6, #1
    ldrb r4, [r2, #0x15]
    subs r4, #1
    ldr r1, .L08007218 @ =0x08195738
    lsls r2, r7, #0x10
    lsrs r2, r2, #0x10
    bl TmApplyTsa_thm
    lsls r4, r4, #5
    adds r4, r4, r6
    lsls r4, r4, #1
    adds r2, r4, r5
    adds r0, r7, #0
    adds r0, #0x1c
    strh r0, [r2]
    adds r0, #1
    strh r0, [r2, #2]
    adds r0, #1
    strh r0, [r2, #4]
    adds r0, #1
    strh r0, [r2, #6]
    adds r1, r2, #0
    adds r1, #0x40
    adds r0, #0x1d
    strh r0, [r1]
    adds r1, #2
    adds r0, #1
    strh r0, [r1]
    adds r1, #2
    adds r0, #1
    strh r0, [r1]
    adds r1, #2
    adds r0, #1
    strh r0, [r1]
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08007218: .4byte 0x08195738
    func_end func_080071C4

    thumb_func_start func_0800721C
func_0800721C: @ 0x0800721C
    subs r0, #0x1c
    cmp r0, #0x25
    bhi .L080072CC
    lsls r0, r0, #2
    ldr r1, .L0800722C @ =.L08007230
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0800722C: .4byte .L08007230
.L08007230: @ jump table
    .4byte .L080072C8 @ case 0
    .4byte .L080072CC @ case 1
    .4byte .L080072CC @ case 2
    .4byte .L080072CC @ case 3
    .4byte .L080072CC @ case 4
    .4byte .L080072CC @ case 5
    .4byte .L080072CC @ case 6
    .4byte .L080072CC @ case 7
    .4byte .L080072CC @ case 8
    .4byte .L080072CC @ case 9
    .4byte .L080072CC @ case 10
    .4byte .L080072CC @ case 11
    .4byte .L080072CC @ case 12
    .4byte .L080072CC @ case 13
    .4byte .L080072CC @ case 14
    .4byte .L080072CC @ case 15
    .4byte .L080072CC @ case 16
    .4byte .L080072CC @ case 17
    .4byte .L080072CC @ case 18
    .4byte .L080072CC @ case 19
    .4byte .L080072CC @ case 20
    .4byte .L080072CC @ case 21
    .4byte .L080072CC @ case 22
    .4byte .L080072C8 @ case 23
    .4byte .L080072CC @ case 24
    .4byte .L080072CC @ case 25
    .4byte .L080072CC @ case 26
    .4byte .L080072CC @ case 27
    .4byte .L080072CC @ case 28
    .4byte .L080072C8 @ case 29
    .4byte .L080072CC @ case 30
    .4byte .L080072CC @ case 31
    .4byte .L080072CC @ case 32
    .4byte .L080072CC @ case 33
    .4byte .L080072C8 @ case 34
    .4byte .L080072C8 @ case 35
    .4byte .L080072CC @ case 36
    .4byte .L080072C8 @ case 37
.L080072C8:
    movs r0, #1
    b .L080072CE
.L080072CC:
    movs r0, #0
.L080072CE:
    bx lr
    func_end func_0800721C

    thumb_func_start func_080072D0
func_080072D0: @ 0x080072D0
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    mov sb, r0
    adds r5, r1, #0
    adds r6, r2, #0
    adds r7, r3, #0
    cmp r5, #0
    beq .L08007380
    adds r0, r5, #0
    bl func_08006B20
    adds r4, r0, #0
    ldr r0, [r4, #8]
    lsls r1, r7, #5
    mov r8, r1
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r0, [r4]
    cmp r0, #0
    beq .L08007360
    lsls r1, r6, #5
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r1, r1, r2
    bl Decompress
    ldr r0, [r4, #8]
    mov r1, r8
    movs r2, #0x20
    bl ApplyPaletteExt
    adds r0, r5, #0
    bl func_0800721C
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08007338
    lsls r1, r7, #0xc
    ldr r0, .L08007334 @ =0x000003FF
    ands r0, r6
    adds r1, r1, r0
    mov r0, sb
    adds r2, r4, #0
    bl func_080071C4
    b .L08007348
    .align 2, 0
.L08007334: .4byte 0x000003FF
.L08007338:
    lsls r1, r7, #0xc
    ldr r0, .L0800735C @ =0x000003FF
    ands r0, r6
    adds r1, r1, r0
    mov r0, sb
    adds r2, r4, #0
    bl func_08007170
.L08007348:
    movs r2, #0
    mov r0, sb
    movs r1, #5
.L0800734E:
    strh r2, [r0]
    strh r2, [r0, #0x12]
    adds r0, #0x40
    subs r1, #1
    cmp r1, #0
    bge .L0800734E
    b .L08007380
    .align 2, 0
.L0800735C: .4byte 0x000003FF
.L08007360:
    ldr r0, [r4, #0x10]
    lsls r1, r6, #5
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r1, r1, r2
    bl Decompress
    lsls r1, r7, #0xc
    ldr r0, .L0800738C @ =0x000003FF
    ands r0, r6
    adds r1, r1, r0
    mov r0, sb
    movs r2, #0xa
    movs r3, #9
    bl PutAppliedBitmap
.L08007380:
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800738C: .4byte 0x000003FF
    func_end func_080072D0

    thumb_func_start func_08007390
func_08007390: @ 0x08007390
    movs r2, #0
    str r2, [r0, #0x2c]
    movs r1, #0x78
    str r1, [r0, #0x38]
    strh r2, [r0, #0x32]
    bx lr
    func_end func_08007390

    thumb_func_start func_0800739C
func_0800739C: @ 0x0800739C
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x38]
    subs r0, #1
    str r0, [r4, #0x38]
    cmp r0, #0
    bge .L080073BC
    adds r0, r4, #0
    bl func_08007A7C
    str r0, [r4, #0x38]
    movs r0, #0
    strh r0, [r4, #0x34]
    adds r0, r4, #0
    bl Proc_Break
.L080073BC:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_0800739C

    thumb_func_start func_080073C4
func_080073C4: @ 0x080073C4
    push {r4, r5, r6, r7, lr}
    adds r4, r0, #0
    adds r0, #0x42
    ldrh r0, [r0]
    lsls r2, r0, #0xc
    adds r1, r4, #0
    adds r1, #0x40
    ldr r0, .L080073FC @ =0x000003FF
    ldrh r1, [r1]
    ands r0, r1
    adds r7, r2, r0
    adds r0, r4, #0
    adds r0, #0x44
    ldrh r0, [r0]
    bl func_08006B20
    adds r5, r0, #0
    movs r6, #0
    movs r1, #0x34
    ldrsh r0, [r4, r1]
    cmp r0, #9
    bhi .L08007468
    lsls r0, r0, #2
    ldr r1, .L08007400 @ =.L08007404
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080073FC: .4byte 0x000003FF
.L08007400: .4byte .L08007404
.L08007404: @ jump table
    .4byte .L08007430 @ case 0
    .4byte .L080074B8 @ case 1
    .4byte .L080074B8 @ case 2
    .4byte .L0800742C @ case 3
    .4byte .L080074B8 @ case 4
    .4byte .L080074B8 @ case 5
    .4byte .L08007430 @ case 6
    .4byte .L080074B8 @ case 7
    .4byte .L080074B8 @ case 8
    .4byte .L08007434 @ case 9
.L0800742C:
    movs r6, #0x58
    b .L08007468
.L08007430:
    movs r6, #0x18
    b .L08007468
.L08007434:
    ldr r0, [r4, #0x3c]
    adds r1, r4, #0
    adds r1, #0x42
    ldrh r1, [r1]
    lsls r1, r1, #0xc
    adds r3, r4, #0
    adds r3, #0x40
    ldr r2, .L08007464 @ =0x000003FF
    ldrh r3, [r3]
    ands r2, r3
    adds r1, r1, r2
    adds r2, r5, #0
    bl func_08007170
    ldr r0, [r4, #0x3c]
    bl func_08002F54
    bl func_08001018
    adds r0, r4, #0
    bl Proc_Break
    b .L080074BE
    .align 2, 0
.L08007464: .4byte 0x000003FF
.L08007468:
    adds r0, r4, #0
    adds r0, #0x44
    ldrh r0, [r0]
    bl func_08006B20
    adds r5, r0, #0
    ldrb r3, [r5, #0x17]
    lsls r1, r3, #6
    ldr r0, [r4, #0x3c]
    adds r0, r0, r1
    ldrb r5, [r5, #0x16]
    lsls r1, r5, #1
    adds r0, r0, r1
    mov ip, r0
    subs r0, #2
    adds r2, r7, r6
    strh r2, [r0]
    adds r1, r2, #1
    strh r1, [r0, #2]
    adds r1, r2, #2
    strh r1, [r0, #4]
    adds r1, r2, #3
    strh r1, [r0, #6]
    adds r1, #0x1d
    mov r3, ip
    strh r1, [r3, #0x3e]
    adds r3, #0x40
    adds r1, #1
    strh r1, [r3]
    adds r3, #2
    adds r1, #1
    strh r1, [r3]
    mov r1, ip
    adds r1, #0x44
    adds r2, #0x23
    strh r2, [r1]
    bl func_08002F54
    bl func_08001018
.L080074B8:
    ldrh r0, [r4, #0x34]
    adds r0, #1
    strh r0, [r4, #0x34]
.L080074BE:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_080073C4

    thumb_func_start func_080074C4
func_080074C4: @ 0x080074C4
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    adds r4, r1, #0
    mov r8, r2
    adds r5, r3, #0
    ldr r6, [sp, #0x14]
    ldr r0, .L080074F4 @ =0x08B90870
    bl Proc_EndEach
    adds r0, r4, #0
    mov r1, r8
    adds r2, r5, #0
    adds r3, r6, #0
    bl func_080072D0
    mov r0, r8
    bl func_08006B20
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080074F4: .4byte 0x08B90870
    func_end func_080074C4

    thumb_func_start func_080074F8
func_080074F8: @ 0x080074F8
    push {lr}
    ldr r0, [r0, #0x54]
    bl func_08006D30
    pop {r0}
    bx r0
    func_end func_080074F8

    thumb_func_start func_08007504
func_08007504: @ 0x08007504
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L08007518 @ =0x08B908A0
    movs r1, #3
    bl SpawnProc
    str r4, [r0, #0x54]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08007518: .4byte 0x08B908A0
    func_end func_08007504

    thumb_func_start func_0800751C
func_0800751C: @ 0x0800751C
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    adds r5, r0, #0
    ldrh r0, [r5, #0x3e]
    bl func_08006B20
    mov r8, r0
    ldr r6, .L08007560 @ =gFaceConfig
    adds r4, r5, #0
    adds r4, #0x40
    ldrb r1, [r4]
    lsls r0, r1, #3
    adds r0, r0, r6
    ldrh r0, [r0, #4]
    adds r0, #0x10
    bl SetBlackPal
    mov r1, r8
    ldr r0, [r1, #8]
    ldrb r4, [r4]
    lsls r1, r4, #3
    adds r1, r1, r6
    ldrh r1, [r1, #4]
    adds r1, #0x10
    movs r2, #0xc
    adds r3, r5, #0
    bl StartPalFade
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08007560: .4byte gFaceConfig
    func_end func_0800751C

    thumb_func_start StartFaceFadeOut
StartFaceFadeOut: @ 0x08007564
    push {r4, lr}
    adds r4, r0, #0
    ldrh r0, [r4, #0x3e]
    bl func_08006B20
    ldr r1, .L08007594 @ =gFaceConfig
    adds r0, r4, #0
    adds r0, #0x40
    ldrb r0, [r0]
    lsls r0, r0, #3
    adds r0, r0, r1
    ldrh r0, [r0, #4]
    adds r0, #0x10
    movs r1, #0xc
    adds r2, r4, #0
    bl StartPalFadeToBlack
    adds r0, r4, #0
    bl func_08007504
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08007594: .4byte gFaceConfig
    func_end StartFaceFadeOut

    thumb_func_start func_08007598
func_08007598: @ 0x08007598
    push {r4, r5, lr}
    sub sp, #0x1c
    mov r2, sp
    ldr r1, .L080075C0 @ =0x08193DA4
    ldm r1!, {r3, r4, r5}
    stm r2!, {r3, r4, r5}
    ldm r1!, {r3, r4, r5}
    stm r2!, {r3, r4, r5}
    ldr r1, [r1]
    str r1, [r2]
    ldr r1, .L080075C4 @ =0xFFFF8100
    adds r0, r0, r1
    lsls r0, r0, #2
    add r0, sp
    ldr r0, [r0]
    add sp, #0x1c
    pop {r4, r5}
    pop {r1}
    bx r1
    .align 2, 0
.L080075C0: .4byte 0x08193DA4
.L080075C4: .4byte 0xFFFF8100
    func_end func_08007598

    thumb_func_start func_080075C8
func_080075C8: @ 0x080075C8
    push {r4, r5, r6, lr}
    sub sp, #0x1c
    mov r3, sp
    ldr r2, .L080075F8 @ =0x08193DC0
    ldm r2!, {r4, r5, r6}
    stm r3!, {r4, r5, r6}
    ldm r2!, {r4, r5, r6}
    stm r3!, {r4, r5, r6}
    ldr r2, [r2]
    str r2, [r3]
    ldr r2, .L080075FC @ =0xFFFF8100
    adds r0, r0, r2
    lsls r0, r0, #2
    add r0, sp
    ldr r0, [r0]
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    add sp, #0x1c
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080075F8: .4byte 0x08193DC0
.L080075FC: .4byte 0xFFFF8100
    func_end func_080075C8

    thumb_func_start func_08007600
func_08007600: @ 0x08007600
    ldr r1, [r0, #0x14]
    str r1, [r0, #0x2c]
    movs r1, #0
    strh r1, [r0, #0x32]
    bx lr
    func_end func_08007600

    thumb_func_start func_0800760C
func_0800760C: @ 0x0800760C
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r4, r0, #0
    ldr r0, [r4, #0x2c]
    bl func_08006D9C
    movs r1, #0x30
    ands r1, r0
    cmp r1, #0
    bne .L08007660
    ldr r0, [r4, #0x2c]
    bl func_08006D9C
    movs r1, #8
    ands r1, r0
    movs r3, #0
    cmp r1, #0
    bne .L08007632
    movs r3, #0x18
.L08007632:
    adds r3, #0x10
    ldr r2, [r4, #0x2c]
    ldr r0, [r2, #0x2c]
    lsls r1, r3, #5
    ldr r0, [r0, #0xc]
    adds r0, r0, r1
    ldrh r1, [r2, #0x3c]
    adds r1, #0x1c
    ldr r2, .L08007658 @ =0x000003FF
    ands r1, r2
    lsls r1, r1, #5
    ldr r2, .L0800765C @ =0x06010000
    adds r1, r1, r2
    movs r2, #4
    movs r3, #2
    bl func_0801320C
    b .L080076D0
    .align 2, 0
.L08007658: .4byte 0x000003FF
.L0800765C: .4byte 0x06010000
.L08007660:
    ldrh r0, [r4, #0x32]
    subs r0, #1
    strh r0, [r4, #0x32]
    lsls r0, r0, #0x10
    cmp r0, #0
    bge .L080076D0
    ldr r0, [r4, #0x2c]
    bl func_08006D9C
    movs r1, #8
    ands r1, r0
    movs r5, #0
    cmp r1, #0
    bne .L0800767E
    movs r5, #0x18
.L0800767E:
    bl RandNextB
    lsrs r0, r0, #0x10
    movs r1, #7
    ands r0, r1
    adds r0, #1
    strh r0, [r4, #0x32]
    ldrh r0, [r4, #0x30]
    adds r0, #1
    movs r1, #3
    ands r0, r1
    strh r0, [r4, #0x30]
    movs r1, #0x30
    ldrsh r0, [r4, r1]
    cmp r0, #1
    beq .L080076AA
    cmp r0, #1
    ble .L080076B0
    cmp r0, #2
    beq .L080076AE
    cmp r0, #3
    bne .L080076B0
.L080076AA:
    adds r5, #8
    b .L080076B0
.L080076AE:
    adds r5, #0x10
.L080076B0:
    ldr r2, [r4, #0x2c]
    ldr r0, [r2, #0x2c]
    lsls r1, r5, #5
    ldr r0, [r0, #0xc]
    adds r0, r0, r1
    ldrh r1, [r2, #0x3c]
    adds r1, #0x1c
    ldr r2, .L08007750 @ =0x000003FF
    ands r1, r2
    lsls r1, r1, #5
    ldr r2, .L08007754 @ =0x06010000
    adds r1, r1, r2
    movs r2, #4
    movs r3, #2
    bl func_0801320C
.L080076D0:
    ldr r0, [r4, #0x2c]
    ldr r2, [r0, #0x2c]
    movs r1, #4
    ldrb r2, [r2, #0x14]
    subs r5, r1, r2
    bl func_08006D9C
    movs r6, #1
    ands r0, r6
    cmp r0, #0
    bne .L080076E8
    rsbs r5, r5, #0
.L080076E8:
    lsls r1, r5, #3
    ldr r0, [r4, #0x2c]
    movs r3, #0x34
    ldrsh r2, [r0, r3]
    adds r1, r1, r2
    adds r5, r1, #0
    subs r5, #0x10
    ldr r1, .L08007758 @ =0x000001FF
    ands r5, r1
    bl func_08006D9C
    ands r0, r6
    cmp r0, #0
    beq .L0800770A
    movs r0, #0x80
    lsls r0, r0, #5
    adds r5, r5, r0
.L0800770A:
    ldr r0, [r4, #0x2c]
    bl func_08006D9C
    adds r2, r0, #0
    movs r0, #0x80
    lsls r0, r0, #3
    ands r2, r0
    rsbs r2, r2, #0
    asrs r2, r2, #0x1f
    ands r2, r0
    ldr r4, [r4, #0x2c]
    movs r1, #0x36
    ldrsh r0, [r4, r1]
    ldr r1, [r4, #0x2c]
    ldrb r1, [r1, #0x15]
    lsls r1, r1, #3
    adds r0, r0, r1
    movs r1, #0xff
    ands r0, r1
    adds r2, r2, r0
    adds r0, r4, #0
    adds r0, #0x41
    ldrb r0, [r0]
    ldr r3, .L0800775C @ =0x08B905F8
    ldrh r1, [r4, #0x3c]
    adds r1, #0x1c
    str r1, [sp]
    adds r1, r5, #0
    bl func_08006A34
    add sp, #4
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08007750: .4byte 0x000003FF
.L08007754: .4byte 0x06010000
.L08007758: .4byte 0x000001FF
.L0800775C: .4byte 0x08B905F8
    func_end func_0800760C

    thumb_func_start func_08007760
func_08007760: @ 0x08007760
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #4
    adds r7, r0, #0
    adds r5, r1, #0
    movs r0, #0
    mov sb, r0
    cmp r5, #1
    beq .L0800778E
    cmp r5, #1
    bgt .L08007780
    cmp r5, #0
    beq .L0800778A
    b .L08007856
.L08007780:
    cmp r5, #0x80
    beq .L08007792
    cmp r5, #0x81
    beq .L0800779A
    b .L08007856
.L0800778A:
    movs r5, #0x58
    b .L080077A0
.L0800778E:
    movs r5, #0x18
    b .L080077A0
.L08007792:
    movs r5, #0x58
    movs r1, #1
    mov sb, r1
    b .L080077A0
.L0800779A:
    movs r5, #0x18
    movs r3, #1
    mov sb, r3
.L080077A0:
    ldr r0, [r7, #0x2c]
    ldr r2, [r0, #0x2c]
    movs r1, #4
    ldrb r2, [r2, #0x16]
    subs r4, r1, r2
    bl func_08006D9C
    movs r1, #1
    mov r8, r1
    ands r0, r1
    cmp r0, #0
    bne .L080077BA
    rsbs r4, r4, #0
.L080077BA:
    lsls r1, r4, #3
    ldr r0, [r7, #0x2c]
    movs r3, #0x34
    ldrsh r2, [r0, r3]
    adds r1, r1, r2
    adds r4, r1, #0
    subs r4, #0x10
    ldr r1, .L08007838 @ =0x000001FF
    ands r4, r1
    bl func_08006D9C
    mov r1, r8
    ands r0, r1
    cmp r0, #0
    beq .L080077DE
    movs r0, #0x80
    lsls r0, r0, #5
    adds r4, r4, r0
.L080077DE:
    ldr r0, [r7, #0x2c]
    bl func_08006D9C
    movs r1, #0x80
    lsls r1, r1, #3
    ands r0, r1
    rsbs r0, r0, #0
    asrs r6, r0, #0x1f
    ands r6, r1
    ldr r2, [r7, #0x2c]
    movs r3, #0x36
    ldrsh r0, [r2, r3]
    ldr r1, [r2, #0x2c]
    ldrb r1, [r1, #0x17]
    lsls r1, r1, #3
    adds r0, r0, r1
    movs r1, #0xff
    ands r0, r1
    adds r6, r6, r0
    mov r0, sb
    cmp r0, #0
    beq .L08007840
    adds r0, r2, #0
    bl func_08006D9C
    mov r1, r8
    ands r0, r1
    cmp r0, #0
    bne .L0800781A
    adds r4, #0x10
.L0800781A:
    ldr r1, [r7, #0x2c]
    adds r0, r1, #0
    adds r0, #0x41
    ldrb r0, [r0]
    ldr r3, .L0800783C @ =0x08B905B8
    ldrh r1, [r1, #0x3c]
    adds r1, r1, r5
    adds r1, #2
    str r1, [sp]
    adds r1, r4, #0
    adds r2, r6, #0
    bl func_08006A34
    b .L08007856
    .align 2, 0
.L08007838: .4byte 0x000001FF
.L0800783C: .4byte 0x08B905B8
.L08007840:
    adds r0, r2, #0
    adds r0, #0x41
    ldrb r0, [r0]
    ldr r3, .L08007864 @ =0x08B905F8
    ldrh r2, [r2, #0x3c]
    adds r1, r2, r5
    str r1, [sp]
    adds r1, r4, #0
    adds r2, r6, #0
    bl func_08006A34
.L08007856:
    add sp, #4
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08007864: .4byte 0x08B905F8
    func_end func_08007760

    thumb_func_start func_08007868
func_08007868: @ 0x08007868
    push {r4, r5, lr}
    adds r5, r0, #0
    ldr r0, [r5, #0x14]
    str r0, [r5, #0x2c]
    ldr r0, [r0, #0x2c]
    ldrb r0, [r0, #0x18]
    movs r4, #0
    strh r0, [r5, #0x30]
    adds r0, r5, #0
    bl func_08007A7C
    str r0, [r5, #0x38]
    strh r4, [r5, #0x32]
    movs r0, #0x30
    ldrsh r1, [r5, r0]
    cmp r1, #6
    bne .L080078A0
    movs r0, #5
    strh r0, [r5, #0x30]
    ldr r0, .L080078A8 @ =0x7FFFFFFF
    str r0, [r5, #0x38]
    movs r0, #2
    strh r0, [r5, #0x32]
    strh r1, [r5, #0x34]
    adds r0, r5, #0
    movs r1, #0x61
    bl Proc_Goto
.L080078A0:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080078A8: .4byte 0x7FFFFFFF
    func_end func_08007868

    thumb_func_start func_080078AC
func_080078AC: @ 0x080078AC
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x38]
    subs r0, #1
    str r0, [r4, #0x38]
    movs r1, #0x32
    ldrsh r5, [r4, r1]
    cmp r5, #0
    beq .L080078C8
    adds r1, r5, #0
    adds r0, r4, #0
    bl Proc_Goto
    b .L080078DE
.L080078C8:
    cmp r0, #0
    bge .L080078DE
    adds r0, r4, #0
    bl func_08007A7C
    str r0, [r4, #0x38]
    strh r5, [r4, #0x34]
    adds r0, r4, #0
    movs r1, #1
    bl Proc_Goto
.L080078DE:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_080078AC

    thumb_func_start func_080078E4
func_080078E4: @ 0x080078E4
    push {r4, r5, lr}
    adds r4, r0, #0
    movs r5, #2
    movs r1, #0x34
    ldrsh r0, [r4, r1]
    cmp r0, #0xa
    bhi .L0800793C
    lsls r0, r0, #2
    ldr r1, .L080078FC @ =.L08007900
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080078FC: .4byte .L08007900
.L08007900: @ jump table
    .4byte .L08007930 @ case 0
    .4byte .L08007930 @ case 1
    .4byte .L08007930 @ case 2
    .4byte .L0800792C @ case 3
    .4byte .L0800792C @ case 4
    .4byte .L0800792C @ case 5
    .4byte .L08007930 @ case 6
    .4byte .L08007930 @ case 7
    .4byte .L08007930 @ case 8
    .4byte .L0800793C @ case 9
    .4byte .L08007934 @ case 10
.L0800792C:
    movs r5, #0
    b .L0800793C
.L08007930:
    movs r5, #1
    b .L0800793C
.L08007934:
    adds r0, r4, #0
    movs r1, #0
    bl Proc_Goto
.L0800793C:
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_08007760
    ldrh r0, [r4, #0x34]
    adds r0, #1
    strh r0, [r4, #0x34]
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_080078E4

    thumb_func_start func_08007950
func_08007950: @ 0x08007950
    movs r1, #0
    strh r1, [r0, #0x34]
    bx lr
    func_end func_08007950

    thumb_func_start func_08007958
func_08007958: @ 0x08007958
    push {r4, lr}
    adds r4, r0, #0
    movs r1, #0x34
    ldrsh r0, [r4, r1]
    cmp r0, #5
    bgt .L0800796C
    adds r0, r4, #0
    bl func_080078E4
    b .L08007984
.L0800796C:
    adds r0, r4, #0
    movs r1, #0
    bl func_08007760
    movs r1, #0x32
    ldrsh r0, [r4, r1]
    cmp r0, #0
    bne .L08007984
    adds r0, r4, #0
    movs r1, #1
    bl Proc_Goto
.L08007984:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08007958

    thumb_func_start func_0800798C
func_0800798C: @ 0x0800798C
    movs r1, #0
    strh r1, [r0, #0x34]
    bx lr
    func_end func_0800798C

    thumb_func_start func_08007994
func_08007994: @ 0x08007994
    push {r4, lr}
    adds r4, r0, #0
    movs r1, #0x34
    ldrsh r0, [r4, r1]
    cmp r0, #2
    bgt .L080079A8
    adds r0, r4, #0
    bl func_080078E4
    b .L080079C0
.L080079A8:
    adds r0, r4, #0
    movs r1, #1
    bl func_08007760
    movs r1, #0x32
    ldrsh r0, [r4, r1]
    cmp r0, #0
    bne .L080079C0
    adds r0, r4, #0
    movs r1, #1
    bl Proc_Goto
.L080079C0:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08007994

    thumb_func_start func_080079C8
func_080079C8: @ 0x080079C8
    movs r1, #0
    strh r1, [r0, #0x34]
    bx lr
    func_end func_080079C8

    thumb_func_start func_080079D0
func_080079D0: @ 0x080079D0
    push {r4, r5, lr}
    adds r4, r0, #0
    movs r5, #2
    movs r1, #0x34
    ldrsh r0, [r4, r1]
    cmp r0, #0xa
    bhi .L08007A2C
    lsls r0, r0, #2
    ldr r1, .L080079E8 @ =.L080079EC
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L080079E8: .4byte .L080079EC
.L080079EC: @ jump table
    .4byte .L08007A1C @ case 0
    .4byte .L08007A1C @ case 1
    .4byte .L08007A1C @ case 2
    .4byte .L08007A18 @ case 3
    .4byte .L08007A18 @ case 4
    .4byte .L08007A18 @ case 5
    .4byte .L08007A1C @ case 6
    .4byte .L08007A1C @ case 7
    .4byte .L08007A1C @ case 8
    .4byte .L08007A2C @ case 9
    .4byte .L08007A20 @ case 10
.L08007A18:
    movs r5, #0
    b .L08007A2C
.L08007A1C:
    movs r5, #1
    b .L08007A2C
.L08007A20:
    adds r0, r4, #0
    movs r1, #0
    bl Proc_Goto
    movs r0, #0
    strh r0, [r4, #0x32]
.L08007A2C:
    adds r1, r5, #0
    adds r1, #0x80
    adds r0, r4, #0
    bl func_08007760
    ldrh r0, [r4, #0x34]
    adds r0, #1
    strh r0, [r4, #0x34]
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_080079D0

    thumb_func_start func_08007A44
func_08007A44: @ 0x08007A44
    push {r4, lr}
    adds r2, r0, #0
    cmp r1, #0
    bne .L08007A50
    ldr r0, [r2, #0x2c]
    ldrb r1, [r0, #0x18]
.L08007A50:
    ldr r4, [r2, #0x48]
    strh r1, [r4, #0x30]
    adds r0, r4, #0
    bl func_08007A7C
    str r0, [r4, #0x38]
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08007A44

    thumb_func_start func_08007A64
func_08007A64: @ 0x08007A64
    push {lr}
    ldr r2, .L08007A78 @ =0x030041C0
    lsls r0, r0, #2
    adds r0, r0, r2
    ldr r0, [r0]
    bl func_08007A44
    pop {r0}
    bx r0
    .align 2, 0
.L08007A78: .4byte 0x030041C0
    func_end func_08007A64

    thumb_func_start func_08007A7C
func_08007A7C: @ 0x08007A7C
    push {r4, lr}
    adds r4, r0, #0
    bl RandNextB
    lsrs r2, r0, #0x10
    ldrh r0, [r4, #0x30]
    subs r0, #1
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    cmp r0, #4
    bhi .L08007AD0
    lsls r0, r0, #2
    ldr r1, .L08007A9C @ =.L08007AA0
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08007A9C: .4byte .L08007AA0
.L08007AA0: @ jump table
    .4byte .L08007ABE @ case 0
    .4byte .L08007AC4 @ case 1
    .4byte .L08007AB4 @ case 2
    .4byte .L08007ACA @ case 3
    .4byte .L08007ACE @ case 4
.L08007AB4:
    asrs r0, r2, #7
    movs r1, #0x96
    lsls r1, r1, #1
    adds r0, r0, r1
    b .L08007AD0
.L08007ABE:
    asrs r0, r2, #7
    adds r0, #0x1e
    b .L08007AD0
.L08007AC4:
    asrs r0, r2, #9
    adds r0, #0x1e
    b .L08007AD0
.L08007ACA:
    movs r0, #1
    b .L08007AD0
.L08007ACE:
    ldr r0, .L08007AD8 @ =0x7FFFFFFF
.L08007AD0:
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08007AD8: .4byte 0x7FFFFFFF
    func_end func_08007A7C

    thumb_func_start func_08007ADC
func_08007ADC: @ 0x08007ADC
    ldr r0, [r0, #0x48]
    strh r1, [r0, #0x32]
    bx lr
    func_end func_08007ADC

    thumb_func_start func_08007AE4
func_08007AE4: @ 0x08007AE4
    push {lr}
    ldr r2, .L08007AF8 @ =0x030041C0
    lsls r0, r0, #2
    adds r0, r0, r2
    ldr r0, [r0]
    bl func_08007ADC
    pop {r0}
    bx r0
    .align 2, 0
.L08007AF8: .4byte 0x030041C0
    func_end func_08007AE4

    thumb_func_start func_08007AFC
func_08007AFC: @ 0x08007AFC
    push {r4, r5, lr}
    ldr r2, .L08007B1C @ =0x030041C0
    ldr r0, [r2]
    ldr r4, [r0, #0x48]
    ldr r1, .L08007B20 @ =gKeys
    ldr r0, [r1]
    movs r3, #1
    ldrh r0, [r0, #4]
    ands r3, r0
    adds r5, r1, #0
    cmp r3, #0
    beq .L08007B24
    movs r0, #2
    strh r0, [r4, #0x32]
    b .L08007B26
    .align 2, 0
.L08007B1C: .4byte 0x030041C0
.L08007B20: .4byte gKeys
.L08007B24:
    strh r3, [r4, #0x32]
.L08007B26:
    ldr r0, [r2, #8]
    ldr r4, [r0, #0x48]
    ldr r1, [r5]
    movs r0, #2
    ldrh r1, [r1, #4]
    ands r0, r1
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    cmp r0, #0
    beq .L08007B3C
    movs r0, #3
.L08007B3C:
    strh r0, [r4, #0x32]
    ldr r0, [r2, #4]
    ldr r4, [r0, #0x48]
    ldr r1, [r5]
    movs r0, #0x80
    lsls r0, r0, #2
    ldrh r1, [r1, #8]
    ands r0, r1
    cmp r0, #0
    beq .L08007B54
    movs r0, #4
    strh r0, [r4, #0x32]
.L08007B54:
    ldr r0, [r2, #0xc]
    ldr r4, [r0, #0x48]
    ldr r1, [r5]
    movs r0, #0x80
    lsls r0, r0, #1
    ldrh r1, [r1, #8]
    ands r0, r1
    cmp r0, #0
    beq .L08007B6A
    movs r0, #4
    strh r0, [r4, #0x32]
.L08007B6A:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08007AFC

    thumb_func_start func_08007B70
func_08007B70: @ 0x08007B70
    push {lr}
    movs r0, #0x16
    movs r1, #0x30
    movs r2, #0
    movs r3, #0x13
    bl StartFaceAuto
    movs r1, #3
    bl func_08007A44
    movs r0, #0x16
    movs r1, #0x30
    movs r2, #0x50
    movs r3, #0x1b
    bl StartFaceAuto
    movs r1, #1
    bl func_08007A44
    movs r0, #0x16
    movs r1, #0xc0
    movs r2, #0
    movs r3, #0x12
    bl StartFaceAuto
    movs r1, #2
    bl func_08007A44
    movs r0, #0x16
    movs r1, #0xc0
    movs r2, #0x50
    movs r3, #0x1a
    bl StartFaceAuto
    movs r1, #4
    bl func_08007A44
    ldr r0, .L08007BC8 @ =0x08B90970
    movs r1, #3
    bl SpawnProc
    pop {r0}
    bx r0
    .align 2, 0
.L08007BC8: .4byte 0x08B90970
    func_end func_08007B70

    thumb_func_start func_08007BCC
func_08007BCC: @ 0x08007BCC
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r7, r0, #0
    mov sb, r1
    mov sl, r2
    str r3, [sp, #4]
    ldr r1, .L08007BF0 @ =0x030041C0
    lsls r0, r7, #2
    adds r4, r0, r1
    ldr r6, [r4]
    cmp r6, #0
    beq .L08007BF4
    movs r0, #0
    b .L08007CDA
    .align 2, 0
.L08007BF0: .4byte 0x030041C0
.L08007BF4:
    ldr r0, .L08007C34 @ =0x08B907F8
    movs r1, #5
    bl SpawnProc
    adds r5, r0, #0
    str r5, [r4]
    mov r0, sb
    bl func_08006B20
    mov r8, r0
    movs r0, #0x80
    lsls r0, r0, #6
    ldr r1, [sp, #0x28]
    ands r0, r1
    cmp r0, #0
    beq .L08007C44
    str r6, [sp]
    ldr r0, .L08007C38 @ =gFaceConfig
    lsls r4, r7, #3
    adds r0, r4, r0
    ldrh r0, [r0, #4]
    lsls r1, r0, #5
    ldr r0, .L08007C3C @ =0x02022A60
    adds r1, r1, r0
    ldr r2, .L08007C40 @ =0x01000008
    mov r0, sp
    bl CpuFastSet
    bl EnablePalSync
    b .L08007C5A
    .align 2, 0
.L08007C34: .4byte 0x08B907F8
.L08007C38: .4byte gFaceConfig
.L08007C3C: .4byte 0x02022A60
.L08007C40: .4byte 0x01000008
.L08007C44:
    mov r2, r8
    ldr r0, [r2, #8]
    ldr r1, .L08007CA0 @ =gFaceConfig
    lsls r4, r7, #3
    adds r1, r4, r1
    ldrh r1, [r1, #4]
    adds r1, #0x10
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
.L08007C5A:
    mov r0, r8
    str r0, [r5, #0x2c]
    adds r0, r5, #0
    adds r0, #0x40
    movs r1, #0
    strb r7, [r0]
    mov r2, sb
    strh r2, [r5, #0x3e]
    adds r2, r5, #0
    adds r2, #0x41
    movs r0, #5
    strb r0, [r2]
    mov r0, sl
    strh r0, [r5, #0x34]
    mov r2, sp
    ldrh r2, [r2, #4]
    strh r2, [r5, #0x36]
    str r1, [r5, #0x44]
    str r1, [r5, #0x48]
    ldr r0, [sp, #0x28]
    str r0, [r5, #0x30]
    adds r0, r5, #0
    bl func_08006DB8
    movs r1, #0xf0
    lsls r1, r1, #2
    ldr r2, [sp, #0x28]
    ands r1, r2
    cmp r1, #0x80
    beq .L08007CB2
    cmp r1, #0x80
    bgt .L08007CA4
    cmp r1, #0x40
    beq .L08007CAE
    b .L08007CBE
    .align 2, 0
.L08007CA0: .4byte gFaceConfig
.L08007CA4:
    movs r0, #0x80
    lsls r0, r0, #2
    cmp r1, r0
    beq .L08007CB8
    b .L08007CBE
.L08007CAE:
    movs r3, #0
    b .L08007CC2
.L08007CB2:
    movs r3, #0x80
    lsls r3, r3, #3
    b .L08007CC2
.L08007CB8:
    movs r3, #0xc0
    lsls r3, r3, #4
    b .L08007CC2
.L08007CBE:
    movs r3, #0x80
    lsls r3, r3, #4
.L08007CC2:
    ldr r2, .L08007CEC @ =gFaceConfig
    adds r2, r4, r2
    ldr r1, [r2]
    lsrs r1, r1, #5
    movs r0, #0xf
    ldrh r2, [r2, #4]
    ands r0, r2
    lsls r0, r0, #0xc
    adds r1, r1, r0
    adds r1, r1, r3
    strh r1, [r5, #0x3c]
    adds r0, r5, #0
.L08007CDA:
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08007CEC: .4byte gFaceConfig
    func_end func_08007BCC

    thumb_func_start func_08007CF0
func_08007CF0: @ 0x08007CF0
    ldr r3, .L08007D00 @ =0x030041C0
    lsls r0, r0, #2
    adds r0, r0, r3
    ldr r3, [r0]
    strh r1, [r3, #0x34]
    ldr r0, [r0]
    strh r2, [r0, #0x36]
    bx lr
    .align 2, 0
.L08007D00: .4byte 0x030041C0
    func_end func_08007CF0

    thumb_func_start func_08007D04
func_08007D04: @ 0x08007D04
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x48]
    cmp r0, #0
    beq .L08007D14
    bl func_08090CD4
.L08007D14:
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x44]
    cmp r0, #0
    beq .L08007D20
    bl func_08090CD4
.L08007D20:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08007D04

    thumb_func_start func_08007D28
func_08007D28: @ 0x08007D28
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x34]
    bl func_08006B20
    str r0, [r4, #0x30]
    ldr r0, [r0]
    ldr r5, .L08007D78 @ =gFaceConfig
    ldr r1, [r4, #0x2c]
    adds r1, #0x40
    ldrb r1, [r1]
    lsls r1, r1, #3
    adds r1, r1, r5
    ldr r1, [r1]
    ldr r2, .L08007D7C @ =0x06010000
    adds r1, r1, r2
    bl Decompress
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #8]
    ldr r1, [r4, #0x2c]
    adds r1, #0x40
    ldrb r1, [r1]
    lsls r1, r1, #3
    adds r1, r1, r5
    ldrh r1, [r1, #4]
    adds r1, #0x10
    lsls r1, r1, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r1, [r4, #0x2c]
    ldr r0, [r4, #0x30]
    str r0, [r1, #0x2c]
    ldr r0, [r4, #0x34]
    strh r0, [r1, #0x3e]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08007D78: .4byte gFaceConfig
.L08007D7C: .4byte 0x06010000
    func_end func_08007D28

    thumb_func_start func_08007D80
func_08007D80: @ 0x08007D80
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, [r4, #0x2c]
    ldr r1, [r0, #0x48]
    cmp r1, #0
    beq .L08007DA4
    ldr r0, [r4, #0x30]
    ldrb r0, [r0, #0x18]
    strh r0, [r1, #0x30]
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x48]
    movs r1, #0
    bl Proc_Goto
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x48]
    bl func_08090CE4
.L08007DA4:
    ldr r0, [r4, #0x2c]
    ldr r0, [r0, #0x44]
    cmp r0, #0
    beq .L08007DB0
    bl func_08090CE4
.L08007DB0:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_08007D80

    thumb_func_start func_08007DB8
func_08007DB8: @ 0x08007DB8
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    ldr r0, .L08007DD0 @ =0x08B90980
    adds r1, r4, #0
    bl SpawnProc
    str r4, [r0, #0x2c]
    str r5, [r0, #0x34]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08007DD0: .4byte 0x08B90980
    func_end func_08007DB8

    thumb_func_start func_08007DD4
func_08007DD4: @ 0x08007DD4
    push {r4, lr}
    movs r2, #0
    ldr r4, .L08007DF4 @ =0x08B909B8
    movs r3, #0
.L08007DDC:
    ldr r0, [r4]
    lsls r1, r2, #2
    adds r0, #0x18
    adds r0, r0, r1
    str r3, [r0]
    adds r2, #1
    cmp r2, #7
    ble .L08007DDC
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08007DF4: .4byte 0x08B909B8
    func_end func_08007DD4

    thumb_func_start InitTalk
InitTalk: @ 0x08007DF8
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r6, r1, #0
    lsls r2, r2, #0x18
    lsrs r7, r2, #0x18
    ldr r4, .L08007E7C @ =0x030000E8
    movs r0, #0
    bl GetBgChrOffset
    adds r1, r0, #0
    ldr r0, .L08007E80 @ =0x000003FF
    ands r0, r5
    lsls r0, r0, #5
    movs r2, #0xc0
    lsls r2, r2, #0x13
    adds r0, r0, r2
    adds r1, r1, r0
    adds r0, r4, #0
    adds r2, r5, #0
    movs r3, #2
    bl InitTextFont
    bl func_08007F64
    ldr r0, .L08007E84 @ =0x08B909B8
    ldr r0, [r0]
    strb r6, [r0, #0xa]
    cmp r6, #0
    ble .L08007E4E
    ldr r4, .L08007E88 @ =0x030000C8
    adds r5, r6, #0
.L08007E36:
    adds r0, r4, #0
    movs r1, #0x1e
    bl InitText
    adds r0, r4, #0
    movs r1, #1
    bl Text_SetColor
    adds r4, #8
    subs r5, #1
    cmp r5, #0
    bne .L08007E36
.L08007E4E:
    cmp r7, #0
    beq .L08007E70
    ldr r4, .L08007E8C @ =0x083FBD34
    movs r0, #1
    bl GetBgChrOffset
    adds r1, r0, #0
    ldr r0, .L08007E90 @ =0x06000200
    adds r1, r1, r0
    adds r0, r4, #0
    bl Decompress
    ldr r0, .L08007E94 @ =0x083FBFD0
    movs r1, #0x60
    movs r2, #0x20
    bl ApplyPaletteExt
.L08007E70:
    bl func_08007DD4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08007E7C: .4byte 0x030000E8
.L08007E80: .4byte 0x000003FF
.L08007E84: .4byte 0x08B909B8
.L08007E88: .4byte 0x030000C8
.L08007E8C: .4byte 0x083FBD34
.L08007E90: .4byte 0x06000200
.L08007E94: .4byte 0x083FBFD0
    func_end InitTalk

    thumb_func_start func_08007E98
func_08007E98: @ 0x08007E98
    push {r4, r5, r6, lr}
    adds r6, r1, #0
    adds r4, r2, #0
    ldr r5, .L08007F28 @ =0x030000E8
    ldr r1, .L08007F2C @ =0x000003FF
    ands r1, r0
    lsls r1, r1, #5
    ldr r0, .L08007F30 @ =0x06010000
    adds r1, r1, r0
    adds r0, r5, #0
    bl InitSpriteTextFont
    adds r0, r5, #0
    bl SetTextFont
    movs r0, #1
    bl SetTextFontGlyphs
    ldr r0, .L08007F34 @ =0x08194694
    adds r4, #0x10
    lsls r1, r4, #5
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r2, .L08007F38 @ =gPal
    lsls r4, r4, #4
    adds r0, r4, #4
    lsls r0, r0, #1
    adds r0, r0, r2
    ldr r1, .L08007F3C @ =0x00007247
    strh r1, [r0]
    adds r0, r4, #0
    adds r0, #0xe
    lsls r0, r0, #1
    adds r0, r0, r2
    ldr r1, .L08007F40 @ =0x000031AE
    strh r1, [r0]
    adds r4, #0xf
    lsls r4, r4, #1
    adds r4, r4, r2
    ldr r0, .L08007F44 @ =0x00007FFF
    strh r0, [r4]
    ldr r0, .L08007F48 @ =0x08B909B8
    ldr r0, [r0]
    strb r6, [r0, #0xa]
    movs r5, #0
    cmp r5, r6
    bge .L08007F20
.L08007EF8:
    lsls r4, r5, #3
    ldr r0, .L08007F4C @ =0x030000C8
    adds r4, r4, r0
    adds r0, r4, #0
    bl InitSpriteText
    adds r0, r4, #0
    bl SpriteText_DrawBackground
    adds r0, r4, #0
    movs r1, #6
    bl Text_SetColor
    adds r0, r4, #0
    movs r1, #4
    bl Text_SetCursor
    adds r5, #1
    cmp r5, r6
    blt .L08007EF8
.L08007F20:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08007F28: .4byte 0x030000E8
.L08007F2C: .4byte 0x000003FF
.L08007F30: .4byte 0x06010000
.L08007F34: .4byte 0x08194694
.L08007F38: .4byte gPal
.L08007F3C: .4byte 0x00007247
.L08007F40: .4byte 0x000031AE
.L08007F44: .4byte 0x00007FFF
.L08007F48: .4byte 0x08B909B8
.L08007F4C: .4byte 0x030000C8
    func_end func_08007E98

    thumb_func_start func_08007F50
func_08007F50: @ 0x08007F50
    push {lr}
    ldr r0, .L08007F60 @ =0x08194674
    movs r1, #0x40
    movs r2, #0x20
    bl ApplyPaletteExt
    pop {r0}
    bx r0
    .align 2, 0
.L08007F60: .4byte 0x08194674
    func_end func_08007F50

    thumb_func_start func_08007F64
func_08007F64: @ 0x08007F64
    push {lr}
    ldr r0, .L08007F74 @ =0x030000E8
    bl SetTextFont
    bl func_08005A80
    pop {r0}
    bx r0
    .align 2, 0
.L08007F74: .4byte 0x030000E8
    func_end func_08007F64

    thumb_func_start func_08007F78
func_08007F78: @ 0x08007F78
    push {r4, r5, r6, r7, lr}
    adds r7, r3, #0
    ldr r4, .L08008000 @ =0x08B909B8
    ldr r3, [r4]
    movs r5, #0
    strb r0, [r3, #0xc]
    ldr r0, [r4]
    strb r1, [r0, #0xd]
    ldr r0, [r4]
    str r2, [r0]
    str r5, [r0, #4]
    movs r6, #1
    strb r6, [r0, #8]
    ldr r0, [r4]
    strb r5, [r0, #9]
    ldr r0, [r4]
    adds r0, #0x82
    strb r5, [r0]
    ldr r0, [r4]
    strb r5, [r0, #0xb]
    bl GetTextPrintDelay
    ldr r1, [r4]
    strb r0, [r1, #0x13]
    ldr r0, [r4]
    strb r5, [r0, #0x14]
    movs r0, #0xff
    bl func_08008E28
    ldr r1, [r4]
    movs r0, #0xff
    strb r0, [r1, #0xf]
    ldr r0, [r4]
    strb r5, [r0, #0x15]
    ldr r0, [r4]
    strb r5, [r0, #0x12]
    ldr r0, [r4]
    strb r6, [r0, #0x16]
    ldr r0, [r4]
    strb r5, [r0, #0x17]
    ldr r0, [r4]
    adds r1, r0, #0
    adds r1, #0x80
    movs r2, #0
    strh r5, [r1]
    str r5, [r0, #0x38]
    adds r0, #0x83
    strb r2, [r0]
    ldr r0, [r4]
    ldr r0, [r0]
    movs r1, #0
    bl func_0800A11C
    adds r0, #7
    movs r1, #8
    bl Div
    ldr r1, [r4]
    adds r0, #2
    strb r0, [r1, #0xe]
    cmp r7, #0
    bne .L08008008
    ldr r0, .L08008004 @ =0x08B909D4
    movs r1, #3
    bl SpawnProc
    b .L08008010
    .align 2, 0
.L08008000: .4byte 0x08B909B8
.L08008004: .4byte 0x08B909D4
.L08008008:
    ldr r0, .L08008018 @ =0x08B909D4
    adds r1, r7, #0
    bl SpawnProcLocking
.L08008010:
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08008018: .4byte 0x08B909D4
    func_end func_08007F78

    thumb_func_start StartTalkMsg
StartTalkMsg: @ 0x0800801C
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r0, r2, #0
    bl GetMsg
    adds r2, r0, #0
    adds r0, r4, #0
    adds r1, r5, #0
    movs r3, #0
    bl func_08007F78
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end StartTalkMsg

    thumb_func_start func_0800803C
func_0800803C: @ 0x0800803C
    push {r4, r5, r6, lr}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r0, r2, #0
    adds r6, r3, #0
    bl GetMsg
    adds r2, r0, #0
    adds r0, r4, #0
    adds r1, r5, #0
    adds r3, r6, #0
    bl func_08007F78
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end func_0800803C

    thumb_func_start func_0800805C
func_0800805C: @ 0x0800805C
    push {lr}
    movs r3, #0
    bl func_08007F78
    pop {r1}
    bx r1
    func_end func_0800805C

    thumb_func_start EndTalk
EndTalk: @ 0x08008068
    push {lr}
    ldr r0, .L08008074 @ =0x08B909D4
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L08008074: .4byte 0x08B909D4
    func_end EndTalk

    thumb_func_start func_08008078
func_08008078: @ 0x08008078
    ldr r1, .L08008080 @ =0x08B909B8
    ldr r1, [r1]
    strb r0, [r1, #0xa]
    bx lr
    .align 2, 0
.L08008080: .4byte 0x08B909B8
    func_end func_08008078

    thumb_func_start ResetTalkFlags
ResetTalkFlags: @ 0x08008084
    ldr r0, .L08008090 @ =0x08B909B8
    ldr r0, [r0]
    adds r0, #0x80
    movs r1, #0
    strh r1, [r0]
    bx lr
    .align 2, 0
.L08008090: .4byte 0x08B909B8
    func_end ResetTalkFlags

    thumb_func_start SetTalkFlag
SetTalkFlag: @ 0x08008094
    ldr r1, .L080080A4 @ =0x08B909B8
    ldr r1, [r1]
    adds r1, #0x80
    ldrh r2, [r1]
    orrs r0, r2
    strh r0, [r1]
    bx lr
    .align 2, 0
.L080080A4: .4byte 0x08B909B8
    func_end SetTalkFlag

    thumb_func_start SetTalkFunc
SetTalkFunc: @ 0x080080A8
    ldr r1, .L080080B0 @ =0x08B909B8
    ldr r1, [r1]
    str r0, [r1, #0x38]
    bx lr
    .align 2, 0
.L080080B0: .4byte 0x08B909B8
    func_end SetTalkFunc

    thumb_func_start ClearTalkFlag
ClearTalkFlag: @ 0x080080B4
    ldr r1, .L080080C4 @ =0x08B909B8
    ldr r1, [r1]
    adds r1, #0x80
    ldrh r2, [r1]
    bics r2, r0
    adds r0, r2, #0
    strh r0, [r1]
    bx lr
    .align 2, 0
.L080080C4: .4byte 0x08B909B8
    func_end ClearTalkFlag

    thumb_func_start CheckTalkFlag
CheckTalkFlag: @ 0x080080C8
    ldr r1, .L080080D4 @ =0x08B909B8
    ldr r1, [r1]
    adds r1, #0x80
    ldrh r1, [r1]
    ands r0, r1
    bx lr
    .align 2, 0
.L080080D4: .4byte 0x08B909B8
    func_end CheckTalkFlag

    thumb_func_start func_080080D8
func_080080D8: @ 0x080080D8
    ldr r2, .L080080F0 @ =0x08B909B8
    ldr r1, [r2]
    strb r0, [r1, #0x13]
    ldr r2, [r2]
    movs r0, #0x13
    ldrsb r0, [r2, r0]
    cmp r0, #0
    bge .L080080EC
    movs r0, #0
    strb r0, [r2, #0x13]
.L080080EC:
    bx lr
    .align 2, 0
.L080080F0: .4byte 0x08B909B8
    func_end func_080080D8

    thumb_func_start func_080080F4
func_080080F4: @ 0x080080F4
    push {r4, r5, r6, lr}
    ldr r2, .L08008128 @ =0x08B909B8
    ldr r1, [r2]
    strb r0, [r1, #8]
    movs r4, #0
    ldr r0, [r2]
    ldrb r0, [r0, #0xa]
    cmp r4, r0
    bge .L08008120
    adds r6, r2, #0
    ldr r5, .L0800812C @ =0x030000C8
.L0800810A:
    ldr r0, [r6]
    ldrb r1, [r0, #8]
    adds r0, r5, #0
    bl Text_SetColor
    adds r5, #8
    adds r4, #1
    ldr r0, [r6]
    ldrb r0, [r0, #0xa]
    cmp r4, r0
    blt .L0800810A
.L08008120:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08008128: .4byte 0x08B909B8
.L0800812C: .4byte 0x030000C8
    func_end func_080080F4

    thumb_func_start TalkSkipListener_OnIdle
TalkSkipListener_OnIdle: @ 0x08008130
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L08008190 @ =0x08B90ACC
    bl Proc_Find
    cmp r0, #0
    bne .L080081D2
    ldr r0, .L08008194 @ =0x08B90B24
    bl Proc_Find
    cmp r0, #0
    bne .L080081D2
    movs r0, #4
    bl CheckTalkFlag
    cmp r0, #0
    bne .L080081A8
    ldr r0, .L08008198 @ =gKeys
    ldr r1, [r0]
    movs r0, #0xa
    ldrh r1, [r1, #8]
    ands r0, r1
    cmp r0, #0
    beq .L080081A8
    bl func_0800F08C
    ldr r0, .L0800819C @ =0x08B909B8
    ldr r0, [r0]
    ldrb r0, [r0, #0x11]
    bl func_08009F94
    adds r0, r4, #0
    bl Proc_End
    bl EndTalk
    ldr r0, .L080081A0 @ =gBg0Tm
    movs r1, #0
    bl TmFill
    ldr r0, .L080081A4 @ =gBg1Tm
    movs r1, #0
    bl TmFill
    movs r0, #3
    bl EnableBgSync
    b .L080081D2
    .align 2, 0
.L08008190: .4byte 0x08B90ACC
.L08008194: .4byte 0x08B90B24
.L08008198: .4byte gKeys
.L0800819C: .4byte 0x08B909B8
.L080081A0: .4byte gBg0Tm
.L080081A4: .4byte gBg1Tm
.L080081A8:
    ldr r0, .L080081D8 @ =0x08B90A4C
    bl Proc_Find
    cmp r0, #0
    bne .L080081D2
    movs r0, #8
    bl CheckTalkFlag
    cmp r0, #0
    bne .L080081D2
    ldr r0, .L080081DC @ =gKeys
    ldr r1, [r0]
    movs r0, #0xf3
    ldrh r1, [r1, #8]
    ands r0, r1
    cmp r0, #0
    beq .L080081D2
    ldr r0, .L080081E0 @ =0x08B909B8
    ldr r1, [r0]
    movs r0, #1
    strb r0, [r1, #0x12]
.L080081D2:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L080081D8: .4byte 0x08B90A4C
.L080081DC: .4byte gKeys
.L080081E0: .4byte 0x08B909B8
    func_end TalkSkipListener_OnIdle

    thumb_func_start func_080081E4
func_080081E4: @ 0x080081E4
    push {lr}
    movs r0, #0x20
    bl CheckTalkFlag
    cmp r0, #0
    bne .L08008208
    bl ApplySystemObjectsGraphics
    movs r0, #0
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    movs r0, #1
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
.L08008208:
    ldr r0, .L08008214 @ =0x08B909BC
    movs r1, #3
    bl SpawnProc
    pop {r0}
    bx r0
    .align 2, 0
.L08008214: .4byte 0x08B909BC
    func_end func_080081E4

    thumb_func_start func_08008218
func_08008218: @ 0x08008218
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r6, r0, #0
    bl func_08009020
    lsls r0, r0, #0x18
    asrs r3, r0, #0x18
    cmp r3, #0
    beq .L0800822E
    b .L0800837E
.L0800822E:
    ldr r2, .L08008278 @ =0x08B909B8
    ldr r1, [r2]
    movs r0, #0x12
    ldrsb r0, [r1, r0]
    cmp r0, #0
    bne .L08008252
    ldrb r0, [r1, #0x14]
    adds r0, #1
    strb r0, [r1, #0x14]
    ldr r0, [r2]
    movs r1, #0x14
    ldrsb r1, [r0, r1]
    ldrb r0, [r0, #0x13]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r1, r0
    bge .L08008252
    b .L0800837E
.L08008252:
    ldr r0, [r2]
    strb r3, [r0, #0x14]
.L08008256:
    ldr r7, .L08008278 @ =0x08B909B8
    ldr r0, .L0800827C @ =0x0202BC39
    mov r8, r0
.L0800825C:
    ldr r0, [r7]
    ldrb r0, [r0, #0x11]
    bl func_08009F94
    adds r0, r6, #0
    bl func_080085BC
    cmp r0, #1
    beq .L080082B4
    cmp r0, #1
    bgt .L08008280
    cmp r0, #0
    beq .L0800828A
    b .L080082B4
    .align 2, 0
.L08008278: .4byte 0x08B909B8
.L0800827C: .4byte 0x0202BC39
.L08008280:
    cmp r0, #2
    beq .L08008292
    cmp r0, #3
    beq .L080082A6
    b .L080082B4
.L0800828A:
    adds r0, r6, #0
    bl Proc_Break
    b .L0800837E
.L08008292:
    ldr r1, [r7]
    movs r0, #0x12
    ldrsb r0, [r1, r0]
    cmp r0, #0
    bne .L08008256
    movs r0, #0x13
    ldrsb r0, [r1, r0]
    cmp r0, #0
    ble .L08008368
    b .L0800837E
.L080082A6:
    ldr r0, [r7]
    ldrb r1, [r0, #0x13]
    movs r2, #0
    strb r1, [r0, #0x14]
    ldr r0, [r7]
    strb r2, [r0, #0x12]
    b .L0800837E
.L080082B4:
    movs r0, #0x20
    bl CheckTalkFlag
    cmp r0, #0
    bne .L080082C6
    adds r0, r6, #0
    bl func_0800838C
    b .L080082CC
.L080082C6:
    adds r0, r6, #0
    bl func_08008478
.L080082CC:
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #1
    beq .L0800837E
    ldr r5, .L0800831C @ =0x08B909B8
    ldr r4, [r5]
    ldrb r1, [r4, #0xb]
    ldrb r2, [r4, #9]
    adds r0, r1, r2
    ldrb r1, [r4, #0xa]
    bl __modsi3
    lsls r0, r0, #3
    ldr r1, .L08008320 @ =0x030000C8
    adds r0, r0, r1
    ldr r1, [r4]
    bl Text_DrawCharacter
    ldr r1, [r5]
    str r0, [r1]
    movs r0, #0x40
    bl CheckTalkFlag
    cmp r0, #0
    bne .L08008368
    movs r0, #0x80
    bl CheckTalkFlag
    cmp r0, #0
    beq .L08008328
    mov r1, r8
    ldrb r1, [r1]
    lsls r0, r1, #0x1e
    cmp r0, #0
    blt .L08008368
    ldr r0, .L08008324 @ =0x0000039A
    bl m4aSongNumStart
    b .L08008368
    .align 2, 0
.L0800831C: .4byte 0x08B909B8
.L08008320: .4byte 0x030000C8
.L08008324: .4byte 0x0000039A
.L08008328:
    bl GetTextPrintDelay
    adds r4, r0, #0
    cmp r4, #1
    bne .L0800833C
    bl GetGameTime
    ands r0, r4
    cmp r0, #0
    beq .L08008368
.L0800833C:
    ldr r1, [r5]
    movs r0, #0x12
    ldrsb r0, [r1, r0]
    cmp r0, #0
    beq .L08008350
    adds r0, r1, #0
    adds r0, #0x82
    ldrb r0, [r0]
    cmp r0, #0
    bne .L08008368
.L08008350:
    adds r0, r1, #0
    adds r0, #0x82
    movs r1, #1
    strb r1, [r0]
    mov r2, r8
    ldrb r2, [r2]
    lsls r0, r2, #0x1e
    cmp r0, #0
    blt .L08008368
    ldr r0, .L08008388 @ =0x0000038E
    bl m4aSongNumStart
.L08008368:
    ldr r1, [r7]
    movs r0, #0x12
    ldrsb r0, [r1, r0]
    cmp r0, #0
    beq .L08008374
    b .L0800825C
.L08008374:
    movs r0, #0x13
    ldrsb r0, [r1, r0]
    cmp r0, #0
    bgt .L0800837E
    b .L0800825C
.L0800837E:
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08008388: .4byte 0x0000038E
    func_end func_08008218

    thumb_func_start func_0800838C
func_0800838C: @ 0x0800838C
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    bl func_08009EE0
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L080083F8
    ldr r4, .L080083F4 @ =0x08B909B8
    ldr r0, [r4]
    ldrb r0, [r0, #0x11]
    cmp r0, #0xff
    beq .L080083F8
    movs r0, #2
    bl CheckTalkFlag
    cmp r0, #0
    bne .L080083F8
    ldr r1, [r4]
    ldr r0, [r1, #4]
    cmp r0, #0
    bne .L080083B8
    ldr r0, [r1]
.L080083B8:
    movs r1, #0
    bl func_0800A11C
    adds r0, #7
    movs r1, #8
    bl Div
    ldr r1, [r4]
    adds r0, #2
    strb r0, [r1, #0xe]
    bl ClearTalkBubble
    ldr r4, .L080083F4 @ =0x08B909B8
    ldr r0, [r4]
    ldrb r0, [r0, #0x11]
    adds r1, r7, #0
    bl func_08009E7C
    ldr r0, [r4]
    ldrb r4, [r0, #0x11]
    movs r0, #0x10
    bl CheckTalkFlag
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_08008F6C
    movs r0, #1
    b .L08008468
    .align 2, 0
.L080083F4: .4byte 0x08B909B8
.L080083F8:
    ldr r6, .L08008414 @ =0x08B909B8
    ldr r5, [r6]
    ldrb r0, [r5, #9]
    ldrb r1, [r5, #0xa]
    cmp r0, r1
    blo .L0800841C
    movs r0, #0
    strb r0, [r5, #0x12]
    ldr r0, .L08008418 @ =0x08B90B24
    adds r1, r7, #0
    bl SpawnProcLocking
    movs r0, #1
    b .L08008468
    .align 2, 0
.L08008414: .4byte 0x08B909B8
.L08008418: .4byte 0x08B90B24
.L0800841C:
    ldrb r0, [r5, #0x15]
    cmp r0, #0
    bne .L08008458
    ldrb r4, [r5, #9]
    ldrb r1, [r5, #0xb]
    adds r0, r1, r4
    ldrb r1, [r5, #0xa]
    bl __modsi3
    lsls r0, r0, #3
    ldr r1, .L08008470 @ =0x030000C8
    adds r0, r0, r1
    lsls r4, r4, #1
    ldrb r1, [r5, #0xd]
    adds r4, r1, r4
    lsls r4, r4, #5
    ldrb r5, [r5, #0xc]
    adds r4, r5, r4
    lsls r4, r4, #1
    ldr r1, .L08008474 @ =gBg0Tm
    adds r4, r4, r1
    adds r1, r4, #0
    bl func_08005590
    movs r0, #1
    bl func_0800A4F0
    ldr r1, [r6]
    movs r0, #1
    strb r0, [r1, #0x15]
.L08008458:
    ldr r1, [r6]
    ldrb r0, [r1, #0x16]
    cmp r0, #0
    beq .L08008466
    ldrb r0, [r1, #0x11]
    bl func_08009F88
.L08008466:
    movs r0, #0
.L08008468:
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L08008470: .4byte 0x030000C8
.L08008474: .4byte gBg0Tm
    func_end func_0800838C

    thumb_func_start func_08008478
func_08008478: @ 0x08008478
    push {lr}
    adds r1, r0, #0
    ldr r0, .L08008498 @ =0x08B909B8
    ldr r2, [r0]
    ldrb r0, [r2, #9]
    ldrb r3, [r2, #0xa]
    cmp r0, r3
    blo .L080084A0
    movs r0, #0
    strb r0, [r2, #0x12]
    ldr r0, .L0800849C @ =0x08B90B4C
    bl SpawnProcLocking
    movs r0, #1
    b .L080084AC
    .align 2, 0
.L08008498: .4byte 0x08B909B8
.L0800849C: .4byte 0x08B90B4C
.L080084A0:
    ldrb r0, [r2, #0x15]
    cmp r0, #0
    bne .L080084AA
    movs r0, #1
    strb r0, [r2, #0x15]
.L080084AA:
    movs r0, #0
.L080084AC:
    pop {r1}
    bx r1
    func_end func_08008478

    thumb_func_start func_080084B0
func_080084B0: @ 0x080084B0
    push {lr}
    adds r1, r0, #0
    ldr r0, .L080084C0 @ =0x08B90A04
    bl SpawnProcLocking
    pop {r0}
    bx r0
    .align 2, 0
.L080084C0: .4byte 0x08B90A04
    func_end func_080084B0

    thumb_func_start IsTalkLocked
IsTalkLocked: @ 0x080084C4
    push {lr}
    ldr r0, .L080084D8 @ =0x08B90A04
    bl Proc_Find
    cmp r0, #0
    beq .L080084D2
    movs r0, #1
.L080084D2:
    pop {r1}
    bx r1
    .align 2, 0
.L080084D8: .4byte 0x08B90A04
    func_end IsTalkLocked

    thumb_func_start ResumeTalk
ResumeTalk: @ 0x080084DC
    push {lr}
    ldr r0, .L080084E8 @ =0x08B90A04
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L080084E8: .4byte 0x08B90A04
    func_end ResumeTalk

    thumb_func_start func_080084EC
func_080084EC: @ 0x080084EC
    push {r4, r5, lr}
    ldr r0, .L0800852C @ =0x08B909B8
    ldr r2, [r0]
    ldrb r1, [r2, #8]
    cmp r1, #1
    bne .L08008534
    movs r4, #0
    ldrb r2, [r2, #0xa]
    cmp r4, r2
    bge .L08008524
    adds r5, r0, #0
.L08008502:
    ldr r1, [r5]
    ldrb r2, [r1, #0xb]
    adds r0, r2, r4
    ldrb r1, [r1, #0xa]
    bl __modsi3
    lsls r0, r0, #3
    ldr r1, .L08008530 @ =0x030000C8
    adds r0, r0, r1
    movs r1, #4
    bl Text_SetColor
    adds r4, #1
    ldr r0, [r5]
    ldrb r0, [r0, #0xa]
    cmp r4, r0
    blt .L08008502
.L08008524:
    ldr r0, .L0800852C @ =0x08B909B8
    ldr r1, [r0]
    movs r0, #4
    b .L08008566
    .align 2, 0
.L0800852C: .4byte 0x08B909B8
.L08008530: .4byte 0x030000C8
.L08008534:
    movs r4, #0
    ldrb r2, [r2, #0xa]
    cmp r4, r2
    bge .L08008560
    adds r5, r0, #0
.L0800853E:
    ldr r1, [r5]
    ldrb r2, [r1, #0xb]
    adds r0, r2, r4
    ldrb r1, [r1, #0xa]
    bl __modsi3
    lsls r0, r0, #3
    ldr r1, .L08008570 @ =0x030000C8
    adds r0, r0, r1
    movs r1, #1
    bl Text_SetColor
    adds r4, #1
    ldr r0, [r5]
    ldrb r0, [r0, #0xa]
    cmp r4, r0
    blt .L0800853E
.L08008560:
    ldr r0, .L08008574 @ =0x08B909B8
    ldr r1, [r0]
    movs r0, #1
.L08008566:
    strb r0, [r1, #8]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08008570: .4byte 0x030000C8
.L08008574: .4byte 0x08B909B8
    func_end func_080084EC

    thumb_func_start func_08008578
func_08008578: @ 0x08008578
    push {lr}
    cmp r0, #0
    beq .L0800859C
    ldr r0, .L08008594 @ =0x08194774
    movs r1, #0x60
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r0, .L08008598 @ =0x08194754
    movs r1, #0x40
    movs r2, #0x20
    bl ApplyPaletteExt
    b .L080085B0
    .align 2, 0
.L08008594: .4byte 0x08194774
.L08008598: .4byte 0x08194754
.L0800859C:
    ldr r0, .L080085B4 @ =0x083FBFD0
    movs r1, #0x60
    movs r2, #0x20
    bl ApplyPaletteExt
    ldr r0, .L080085B8 @ =0x08194674
    movs r1, #0x40
    movs r2, #0x20
    bl ApplyPaletteExt
.L080085B0:
    pop {r0}
    bx r0
    .align 2, 0
.L080085B4: .4byte 0x083FBFD0
.L080085B8: .4byte 0x08194674
    func_end func_08008578

    thumb_func_start func_080085BC
func_080085BC: @ 0x080085BC
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    sub sp, #8
    mov r8, r0
.L080085C6:
    ldr r7, .L080085FC @ =0x08B909B8
    adds r5, r7, #0
.L080085CA:
    ldr r1, [r5]
    ldr r4, [r1]
    ldrb r0, [r4]
    cmp r0, #0x14
    bgt .L08008600
    cmp r0, #0x12
    blt .L08008600
    adds r4, #1
    str r4, [r1]
    bl func_08009EE0
    adds r1, r0, #0
    lsls r1, r1, #0x18
    asrs r1, r1, #0x18
    adds r0, r4, #0
    bl func_0800A11C
    adds r0, #7
    movs r1, #8
    bl Div
    ldr r1, [r5]
    adds r0, #2
    strb r0, [r1, #0xe]
    b .L080085CA
    .align 2, 0
.L080085FC: .4byte 0x08B909B8
.L08008600:
    ldr r0, [r7]
    ldr r0, [r0]
    ldrb r0, [r0]
    cmp r0, #0x81
    bls .L0800860E
    bl .L08008E18
.L0800860E:
    lsls r0, r0, #2
    ldr r1, .L08008618 @ =.L0800861C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08008618: .4byte .L0800861C
.L0800861C: @ jump table
    .4byte .L08008884 @ case 0
    .4byte .L0800889A @ case 1
    .4byte .L080088B8 @ case 2
    .4byte .L08008900 @ case 3
    .4byte .L0800893C @ case 4
    .4byte .L0800893C @ case 5
    .4byte .L0800893C @ case 6
    .4byte .L0800893C @ case 7
    .4byte .L08008A40 @ case 8
    .4byte .L08008A40 @ case 9
    .4byte .L08008A40 @ case 10
    .4byte .L08008A40 @ case 11
    .4byte .L08008A40 @ case 12
    .4byte .L08008A40 @ case 13
    .4byte .L08008A40 @ case 14
    .4byte .L08008A40 @ case 15
    .4byte .L08008998 @ case 16
    .4byte .L080089D8 @ case 17
    .4byte .L08008E18 @ case 18
    .4byte .L08008E18 @ case 19
    .4byte .L08008E18 @ case 20
    .4byte .L08008970 @ case 21
    .4byte .L08008980 @ case 22
    .4byte .L0800898C @ case 23
    .4byte .L08008A52 @ case 24
    .4byte .L08008A9C @ case 25
    .4byte .L08008AE8 @ case 26
    .4byte .L08008B34 @ case 27
    .4byte .L08008A1C @ case 28
    .4byte .L08008E18 @ case 29
    .4byte .L08008E18 @ case 30
    .4byte .L08008E18 @ case 31
    .4byte .L08008E18 @ case 32
    .4byte .L08008E18 @ case 33
    .4byte .L08008E18 @ case 34
    .4byte .L08008E18 @ case 35
    .4byte .L08008E18 @ case 36
    .4byte .L08008E18 @ case 37
    .4byte .L08008E18 @ case 38
    .4byte .L08008E18 @ case 39
    .4byte .L08008E18 @ case 40
    .4byte .L08008E18 @ case 41
    .4byte .L08008E18 @ case 42
    .4byte .L08008E18 @ case 43
    .4byte .L08008E18 @ case 44
    .4byte .L08008E18 @ case 45
    .4byte .L08008E18 @ case 46
    .4byte .L08008E18 @ case 47
    .4byte .L08008E18 @ case 48
    .4byte .L08008E18 @ case 49
    .4byte .L08008E18 @ case 50
    .4byte .L08008E18 @ case 51
    .4byte .L08008E18 @ case 52
    .4byte .L08008E18 @ case 53
    .4byte .L08008E18 @ case 54
    .4byte .L08008E18 @ case 55
    .4byte .L08008E18 @ case 56
    .4byte .L08008E18 @ case 57
    .4byte .L08008E18 @ case 58
    .4byte .L08008E18 @ case 59
    .4byte .L08008E18 @ case 60
    .4byte .L08008E18 @ case 61
    .4byte .L08008E18 @ case 62
    .4byte .L08008E18 @ case 63
    .4byte .L08008E18 @ case 64
    .4byte .L08008E18 @ case 65
    .4byte .L08008E18 @ case 66
    .4byte .L08008E18 @ case 67
    .4byte .L08008E18 @ case 68
    .4byte .L08008E18 @ case 69
    .4byte .L08008E18 @ case 70
    .4byte .L08008E18 @ case 71
    .4byte .L08008E18 @ case 72
    .4byte .L08008E18 @ case 73
    .4byte .L08008E18 @ case 74
    .4byte .L08008E18 @ case 75
    .4byte .L08008E18 @ case 76
    .4byte .L08008E18 @ case 77
    .4byte .L08008E18 @ case 78
    .4byte .L08008E18 @ case 79
    .4byte .L08008E18 @ case 80
    .4byte .L08008E18 @ case 81
    .4byte .L08008E18 @ case 82
    .4byte .L08008E18 @ case 83
    .4byte .L08008E18 @ case 84
    .4byte .L08008E18 @ case 85
    .4byte .L08008E18 @ case 86
    .4byte .L08008E18 @ case 87
    .4byte .L08008E18 @ case 88
    .4byte .L08008E18 @ case 89
    .4byte .L08008E18 @ case 90
    .4byte .L08008E18 @ case 91
    .4byte .L08008E18 @ case 92
    .4byte .L08008E18 @ case 93
    .4byte .L08008E18 @ case 94
    .4byte .L08008E18 @ case 95
    .4byte .L08008E18 @ case 96
    .4byte .L08008E18 @ case 97
    .4byte .L08008E18 @ case 98
    .4byte .L08008E18 @ case 99
    .4byte .L08008E18 @ case 100
    .4byte .L08008E18 @ case 101
    .4byte .L08008E18 @ case 102
    .4byte .L08008E18 @ case 103
    .4byte .L08008E18 @ case 104
    .4byte .L08008E18 @ case 105
    .4byte .L08008E18 @ case 106
    .4byte .L08008E18 @ case 107
    .4byte .L08008E18 @ case 108
    .4byte .L08008E18 @ case 109
    .4byte .L08008E18 @ case 110
    .4byte .L08008E18 @ case 111
    .4byte .L08008E18 @ case 112
    .4byte .L08008E18 @ case 113
    .4byte .L08008E18 @ case 114
    .4byte .L08008E18 @ case 115
    .4byte .L08008E18 @ case 116
    .4byte .L08008E18 @ case 117
    .4byte .L08008E18 @ case 118
    .4byte .L08008E18 @ case 119
    .4byte .L08008E18 @ case 120
    .4byte .L08008E18 @ case 121
    .4byte .L08008E18 @ case 122
    .4byte .L08008E18 @ case 123
    .4byte .L08008E18 @ case 124
    .4byte .L08008E18 @ case 125
    .4byte .L08008E18 @ case 126
    .4byte .L08008E18 @ case 127
    .4byte .L08008B80 @ case 128
    .4byte .L08008824 @ case 129
.L08008824:
    ldr r1, [r7]
    ldr r0, [r1]
    ldrb r2, [r0, #1]
    cmp r2, #0x40
    beq .L08008830
    b .L08008E18
.L08008830:
    adds r0, #2
    str r0, [r1]
    ldrb r3, [r1, #0xb]
    ldrb r2, [r1, #9]
    adds r0, r3, r2
    ldrb r1, [r1, #0xa]
    bl __modsi3
    lsls r0, r0, #3
    ldr r1, .L0800887C @ =0x030000C8
    adds r0, r0, r1
    movs r1, #6
    bl Text_Skip
    ldr r1, [r7]
    movs r0, #0x12
    ldrsb r0, [r1, r0]
    cmp r0, #0
    beq .L08008858
    b .L0800894C
.L08008858:
    movs r0, #0x13
    ldrsb r0, [r1, r0]
    cmp r0, #0
    ble .L0800894C
    ldr r0, .L08008880 @ =0x08B90A2C
    mov r1, r8
    bl SpawnProcLocking
    adds r4, r0, #0
    movs r0, #4
    bl func_08009744
    adds r1, r4, #0
    adds r1, #0x64
    strh r0, [r1]
.L08008876:
    movs r0, #3
    b .L08008E1A
    .align 2, 0
.L0800887C: .4byte 0x030000C8
.L08008880: .4byte 0x08B90A2C
.L08008884:
    ldr r1, [r7]
    ldr r0, [r1, #4]
    cmp r0, #0
    bne .L08008890
.L0800888C:
    movs r0, #0
    b .L08008E1A
.L08008890:
    adds r0, #2
    str r0, [r1]
    movs r0, #0
    str r0, [r1, #4]
    b .L080085C6
.L0800889A:
    ldr r1, [r7]
    ldrb r3, [r1, #0x15]
    cmp r3, #1
    beq .L080088A8
    ldrb r0, [r1, #9]
    cmp r0, #1
    bne .L080088AE
.L080088A8:
    ldrb r0, [r1, #9]
    adds r0, #1
    strb r0, [r1, #9]
.L080088AE:
    ldr r1, [r7]
    movs r0, #0
    strb r0, [r1, #0x15]
    ldr r1, [r7]
    b .L08008946
.L080088B8:
    movs r0, #0x80
    bl CheckTalkFlag
    cmp r0, #0
    beq .L080088D8
    bl func_08009708
    ldr r0, .L080088D4 @ =0x08B909B8
    ldr r1, [r0]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    b .L080088F4
    .align 2, 0
.L080088D4: .4byte 0x08B909B8
.L080088D8:
    movs r0, #1
    bl CheckTalkFlag
    cmp r0, #0
    bne .L080088F0
    ldr r0, .L080088EC @ =0x08B90ACC
    mov r1, r8
    bl SpawnProcLocking
    b .L080088F4
    .align 2, 0
.L080088EC: .4byte 0x08B90ACC
.L080088F0:
    bl func_080097FC
.L080088F4:
    ldr r0, .L080088FC @ =0x08B909B8
    ldr r1, [r0]
    b .L08008D2C
    .align 2, 0
.L080088FC: .4byte 0x08B909B8
.L08008900:
    ldr r1, [r7]
    ldrb r2, [r1, #0xb]
    ldrb r3, [r1, #9]
    adds r0, r2, r3
    ldrb r1, [r1, #0xa]
    bl __modsi3
    lsls r0, r0, #3
    ldr r1, .L08008938 @ =0x030000C8
    adds r0, r0, r1
    bl func_08005570
    ldr r3, [r7]
    ldrb r2, [r3, #0xc]
    lsls r1, r2, #3
    adds r1, r1, r0
    adds r1, #4
    ldrb r0, [r3, #0xd]
    lsls r2, r0, #3
    ldrb r3, [r3, #9]
    lsls r0, r3, #4
    adds r2, r2, r0
    adds r2, #8
    mov r0, r8
    bl func_080092BC
    b .L08008D2A
    .align 2, 0
.L08008938: .4byte 0x030000C8
.L0800893C:
    ldr r1, [r7]
    movs r0, #0x12
    ldrsb r0, [r1, r0]
    cmp r0, #0
    beq .L08008950
.L08008946:
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
.L0800894C:
    movs r0, #2
    b .L08008E1A
.L08008950:
    ldr r0, .L0800896C @ =0x08B90A2C
    mov r1, r8
    bl SpawnProcLocking
    adds r4, r0, #0
    ldr r0, [r7]
    ldr r0, [r0]
    ldrb r0, [r0]
    bl func_08009744
    adds r1, r4, #0
    adds r1, #0x64
    strh r0, [r1]
    b .L08008D2A
    .align 2, 0
.L0800896C: .4byte 0x08B90A2C
.L08008970:
    bl ClearTalkBubble
    ldr r0, .L0800897C @ =0x08B909B8
    ldr r1, [r0]
    b .L08008D2C
    .align 2, 0
.L0800897C: .4byte 0x08B909B8
.L08008980:
    ldr r1, [r7]
    movs r0, #1
    ldrb r2, [r1, #0x16]
    subs r0, r0, r2
    strb r0, [r1, #0x16]
    b .L08008D2A
.L0800898C:
    ldr r1, [r7]
    movs r0, #1
    ldrb r3, [r1, #0x17]
    subs r0, r0, r3
    strb r0, [r1, #0x17]
    b .L08008D2A
.L08008998:
    ldr r4, .L080089B0 @ =0x08B909B8
.L0800899A:
    ldr r2, [r4]
    ldr r1, [r2]
    ldrb r0, [r1]
    cmp r0, #8
    bge .L080089A6
    b .L08008876
.L080089A6:
    cmp r0, #0xf
    ble .L080089B4
    cmp r0, #0x10
    beq .L080089C4
    b .L08008876
    .align 2, 0
.L080089B0: .4byte 0x08B909B8
.L080089B4:
    subs r0, #8
    bl func_08008E28
    ldr r1, [r4]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    b .L0800899A
.L080089C4:
    adds r0, r1, #1
    str r0, [r2]
    mov r0, r8
    bl func_08008E34
    ldr r1, [r4]
    ldr r0, [r1]
    adds r0, #2
    str r0, [r1]
    b .L0800899A
.L080089D8:
    bl func_08009EE0
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L080089E6
    bl ClearTalkBubble
.L080089E6:
    ldr r4, .L08008A18 @ =0x08B909B8
    ldr r0, [r4]
    ldrb r2, [r0, #0x11]
    lsls r1, r2, #2
    adds r0, #0x18
    adds r0, r0, r1
    ldr r0, [r0]
    bl StartFaceFadeOut
    ldr r2, [r4]
    ldrb r3, [r2, #0x11]
    lsls r1, r3, #2
    adds r0, r2, #0
    adds r0, #0x18
    adds r0, r0, r1
    movs r1, #0
    str r1, [r0]
    ldr r0, [r2]
    adds r0, #1
    str r0, [r2]
    mov r0, r8
    movs r1, #0x10
    bl StartTemporaryLock
    b .L08008876
    .align 2, 0
.L08008A18: .4byte 0x08B909B8
.L08008A1C:
    movs r0, #0x10
    bl CheckTalkFlag
    cmp r0, #0
    beq .L08008A2E
    movs r0, #0x10
    bl ClearTalkFlag
    b .L08008A34
.L08008A2E:
    movs r0, #0x10
    bl SetTalkFlag
.L08008A34:
    ldr r0, .L08008A3C @ =0x08B909B8
    ldr r1, [r0]
    b .L08008D2C
    .align 2, 0
.L08008A3C: .4byte 0x08B909B8
.L08008A40:
    ldr r0, [r7]
    ldrb r0, [r0, #0x11]
    bl func_08009F94
    ldr r0, [r7]
    ldr r0, [r0]
    ldrb r0, [r0]
    subs r0, #8
    b .L08008D26
.L08008A52:
    ldr r6, .L08008A90 @ =0x08B90AEC
    ldr r5, [r7]
    ldrb r4, [r5, #9]
    ldrb r1, [r5, #0xb]
    adds r0, r1, r4
    ldrb r1, [r5, #0xa]
    bl __modsi3
    adds r1, r0, #0
    lsls r1, r1, #3
    ldr r0, .L08008A94 @ =0x030000C8
    adds r1, r1, r0
    lsls r4, r4, #1
    ldrb r2, [r5, #0xd]
    adds r4, r2, r4
    lsls r4, r4, #5
    ldrb r3, [r5, #0xc]
    adds r4, r3, r4
    lsls r4, r4, #1
    ldr r0, .L08008A98 @ =gBg0Tm
    adds r4, r4, r0
    ldrb r0, [r5, #8]
    str r0, [sp]
    mov r0, r8
    str r0, [sp, #4]
    adds r0, r6, #0
    adds r2, r4, #0
    movs r3, #1
    bl func_080093CC
    b .L08008D2A
    .align 2, 0
.L08008A90: .4byte 0x08B90AEC
.L08008A94: .4byte 0x030000C8
.L08008A98: .4byte gBg0Tm
.L08008A9C:
    ldr r6, .L08008ADC @ =0x08B90AEC
    ldr r5, [r7]
    ldrb r4, [r5, #9]
    ldrb r1, [r5, #0xb]
    adds r0, r1, r4
    ldrb r1, [r5, #0xa]
    bl __modsi3
    adds r1, r0, #0
    lsls r1, r1, #3
    ldr r0, .L08008AE0 @ =0x030000C8
    adds r1, r1, r0
    lsls r4, r4, #1
    ldrb r2, [r5, #0xd]
    adds r4, r2, r4
    lsls r4, r4, #5
    ldrb r3, [r5, #0xc]
    adds r4, r3, r4
    lsls r4, r4, #1
    ldr r0, .L08008AE4 @ =gBg0Tm
    adds r4, r4, r0
    ldrb r0, [r5, #8]
    str r0, [sp]
    mov r0, r8
    str r0, [sp, #4]
    adds r0, r6, #0
    adds r2, r4, #0
    movs r3, #2
    bl func_080093CC
    b .L08008D2A
    .align 2, 0
.L08008ADC: .4byte 0x08B90AEC
.L08008AE0: .4byte 0x030000C8
.L08008AE4: .4byte gBg0Tm
.L08008AE8:
    ldr r6, .L08008B28 @ =0x08B90AFC
    ldr r5, [r7]
    ldrb r4, [r5, #9]
    ldrb r1, [r5, #0xb]
    adds r0, r1, r4
    ldrb r1, [r5, #0xa]
    bl __modsi3
    adds r1, r0, #0
    lsls r1, r1, #3
    ldr r0, .L08008B2C @ =0x030000C8
    adds r1, r1, r0
    lsls r4, r4, #1
    ldrb r2, [r5, #0xd]
    adds r4, r2, r4
    lsls r4, r4, #5
    ldrb r3, [r5, #0xc]
    adds r4, r3, r4
    lsls r4, r4, #1
    ldr r0, .L08008B30 @ =gBg0Tm
    adds r4, r4, r0
    ldrb r0, [r5, #8]
    str r0, [sp]
    mov r0, r8
    str r0, [sp, #4]
    adds r0, r6, #0
    adds r2, r4, #0
    movs r3, #1
    bl func_080093CC
    b .L08008D2A
    .align 2, 0
.L08008B28: .4byte 0x08B90AFC
.L08008B2C: .4byte 0x030000C8
.L08008B30: .4byte gBg0Tm
.L08008B34:
    ldr r6, .L08008B74 @ =0x08B90AFC
    ldr r5, [r7]
    ldrb r4, [r5, #9]
    ldrb r1, [r5, #0xb]
    adds r0, r1, r4
    ldrb r1, [r5, #0xa]
    bl __modsi3
    adds r1, r0, #0
    lsls r1, r1, #3
    ldr r0, .L08008B78 @ =0x030000C8
    adds r1, r1, r0
    lsls r4, r4, #1
    ldrb r2, [r5, #0xd]
    adds r4, r2, r4
    lsls r4, r4, #5
    ldrb r3, [r5, #0xc]
    adds r4, r3, r4
    lsls r4, r4, #1
    ldr r0, .L08008B7C @ =gBg0Tm
    adds r4, r4, r0
    ldrb r0, [r5, #8]
    str r0, [sp]
    mov r0, r8
    str r0, [sp, #4]
    adds r0, r6, #0
    adds r2, r4, #0
    movs r3, #2
    bl func_080093CC
    b .L08008D2A
    .align 2, 0
.L08008B74: .4byte 0x08B90AFC
.L08008B78: .4byte 0x030000C8
.L08008B7C: .4byte gBg0Tm
.L08008B80:
    ldr r0, [r7]
    ldr r2, [r0]
    adds r1, r2, #1
    str r1, [r0]
    ldrb r0, [r2, #1]
    cmp r0, #0x25
    bls .L08008B90
    b .L0800888C
.L08008B90:
    lsls r0, r0, #2
    ldr r1, .L08008B9C @ =.L08008BA0
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08008B9C: .4byte .L08008BA0
.L08008BA0: @ jump table
    .4byte .L08008C5C @ case 0
    .4byte .L08008C5C @ case 1
    .4byte .L08008C5C @ case 2
    .4byte .L08008C5C @ case 3
    .4byte .L08008CAE @ case 4
    .4byte .L08008CC0 @ case 5
    .4byte .L08008CF8 @ case 6
    .4byte .L08008D2A @ case 7
    .4byte .L08008D2A @ case 8
    .4byte .L0800888C @ case 9
    .4byte .L08008D10 @ case 10
    .4byte .L08008D10 @ case 11
    .4byte .L08008D10 @ case 12
    .4byte .L08008D10 @ case 13
    .4byte .L08008D10 @ case 14
    .4byte .L08008D10 @ case 15
    .4byte .L08008D10 @ case 16
    .4byte .L08008D10 @ case 17
    .4byte .L0800888C @ case 18
    .4byte .L0800888C @ case 19
    .4byte .L0800888C @ case 20
    .4byte .L0800888C @ case 21
    .4byte .L08008D34 @ case 22
    .4byte .L08008D4A @ case 23
    .4byte .L08008D60 @ case 24
    .4byte .L08008D76 @ case 25
    .4byte .L08008D8C @ case 26
    .4byte .L08008DA2 @ case 27
    .4byte .L08008DBC @ case 28
    .4byte .L08008DD2 @ case 29
    .4byte .L08008DE8 @ case 30
    .4byte .L08008DFE @ case 31
    .4byte .L08008CE0 @ case 32
    .4byte .L08008C48 @ case 33
    .4byte .L0800888C @ case 34
    .4byte .L0800888C @ case 35
    .4byte .L08008C38 @ case 36
    .4byte .L08008C9C @ case 37
.L08008C38:
    ldr r0, [r7]
    ldr r1, [r0, #0x38]
    cmp r1, #0
    beq .L08008D2A
    mov r0, r8
    bl _call_via_r1
    b .L08008D2A
.L08008C48:
    bl func_080084EC
    ldr r0, .L08008C58 @ =0x08B909B8
    ldr r1, [r0]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    b .L080085C6
    .align 2, 0
.L08008C58: .4byte 0x08B909B8
.L08008C5C:
    ldr r3, .L08008C94 @ =0x08B909B8
    ldr r1, [r3]
    ldr r2, [r1]
    adds r0, r2, #1
    str r0, [r1]
    ldrb r0, [r2, #1]
    strb r0, [r1, #8]
    movs r4, #0
    ldr r0, [r3]
    ldrb r0, [r0, #0xa]
    cmp r4, r0
    bge .L08008C8E
    adds r6, r3, #0
    ldr r5, .L08008C98 @ =0x030000C8
.L08008C78:
    ldr r0, [r6]
    ldrb r1, [r0, #8]
    adds r0, r5, #0
    bl Text_SetColor
    adds r5, #8
    adds r4, #1
    ldr r0, [r6]
    ldrb r0, [r0, #0xa]
    cmp r4, r0
    blt .L08008C78
.L08008C8E:
    ldr r0, .L08008C94 @ =0x08B909B8
    ldr r1, [r0]
    b .L08008D2C
    .align 2, 0
.L08008C94: .4byte 0x08B909B8
.L08008C98: .4byte 0x030000C8
.L08008C9C:
    ldr r2, [r7]
    adds r2, #0x83
    movs r1, #1
    ldrb r3, [r2]
    ands r1, r3
    movs r0, #3
    subs r0, r0, r1
    strb r0, [r2]
    b .L08008D2A
.L08008CAE:
    mov r0, r8
    bl func_080084B0
    ldr r0, .L08008CBC @ =0x08B909B8
    ldr r1, [r0]
    b .L08008D2C
    .align 2, 0
.L08008CBC: .4byte 0x08B909B8
.L08008CC0:
    ldr r4, .L08008CDC @ =0x08B909B8
    ldr r1, [r4]
    ldr r0, [r1, #0x3c]
    adds r1, #0x40
    bl func_08014590
    ldr r1, [r4]
    ldr r0, [r1]
    subs r0, #1
    str r0, [r1, #4]
    adds r0, r1, #0
    adds r0, #0x40
    str r0, [r1]
    b .L080085C6
    .align 2, 0
.L08008CDC: .4byte 0x08B909B8
.L08008CE0:
    ldr r4, .L08008CF4 @ =0x08B909B8
    ldr r1, [r4]
    ldr r0, [r1]
    subs r0, #1
    str r0, [r1, #4]
    bl func_0802E6E4
    ldr r1, [r4]
    str r0, [r1]
    b .L080085C6
    .align 2, 0
.L08008CF4: .4byte 0x08B909B8
.L08008CF8:
    ldr r0, .L08008D0C @ =0x08B909B8
    ldr r1, [r0]
    ldr r0, [r1]
    subs r0, #1
    str r0, [r1, #4]
    adds r0, r1, #0
    adds r0, #0x60
    str r0, [r1]
    b .L080085C6
    .align 2, 0
.L08008D0C: .4byte 0x08B909B8
.L08008D10:
    ldr r1, [r7]
    ldrb r0, [r1, #0x11]
    ldr r1, [r1]
    ldrb r1, [r1]
    subs r1, #0xa
    bl func_08008FC8
    ldr r0, [r7]
    ldr r0, [r0]
    ldrb r0, [r0]
    subs r0, #0xa
.L08008D26:
    bl func_08008E28
.L08008D2A:
    ldr r1, [r7]
.L08008D2C:
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    b .L08008876
.L08008D34:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r2, [r1, #0x11]
    lsls r0, r2, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #0
    b .L08008DB6
.L08008D4A:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r3, [r1, #0x11]
    lsls r0, r3, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #1
    b .L08008DB6
.L08008D60:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r2, [r1, #0x11]
    lsls r0, r2, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #3
    b .L08008DB6
.L08008D76:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r3, [r1, #0x11]
    lsls r0, r3, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #2
    b .L08008DB6
.L08008D8C:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r2, [r1, #0x11]
    lsls r0, r2, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #4
    b .L08008DB6
.L08008DA2:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r3, [r1, #0x11]
    lsls r0, r3, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #5
.L08008DB6:
    bl func_08007A44
    b .L08008876
.L08008DBC:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r2, [r1, #0x11]
    lsls r0, r2, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #0
    b .L08008E12
.L08008DD2:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r3, [r1, #0x11]
    lsls r0, r3, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #2
    b .L08008E12
.L08008DE8:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r2, [r1, #0x11]
    lsls r0, r2, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #3
    b .L08008E12
.L08008DFE:
    ldr r1, [r7]
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    ldrb r3, [r1, #0x11]
    lsls r0, r3, #2
    adds r1, #0x18
    adds r1, r1, r0
    ldr r0, [r1]
    movs r1, #4
.L08008E12:
    bl func_08007ADC
    b .L08008876
.L08008E18:
    movs r0, #1
.L08008E1A:
    add sp, #8
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_080085BC

    thumb_func_start func_08008E28
func_08008E28: @ 0x08008E28
    ldr r1, .L08008E30 @ =0x08B909B8
    ldr r1, [r1]
    strb r0, [r1, #0x11]
    bx lr
    .align 2, 0
.L08008E30: .4byte 0x08B909B8
    func_end func_08008E28

    thumb_func_start func_08008E34
func_08008E34: @ 0x08008E34
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    movs r6, #0
    ldr r0, .L08008E5C @ =0x08B909B8
    ldr r0, [r0]
    ldrb r0, [r0, #0x11]
    cmp r0, #0xff
    bne .L08008E4A
    movs r0, #1
    bl func_08008E28
.L08008E4A:
    bl func_0804B1EC
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08008E60
    bl func_0800ED68
    b .L08008E62
    .align 2, 0
.L08008E5C: .4byte 0x08B909B8
.L08008E60:
    movs r6, #2
.L08008E62:
    ldr r4, .L08008E94 @ =0x08B909B8
    ldr r0, [r4]
    ldrb r0, [r0, #0x11]
    bl func_08009F04
    cmp r0, #0xe
    bgt .L08008E74
    movs r0, #1
    orrs r6, r0
.L08008E74:
    ldr r0, [r4]
    ldr r0, [r0]
    ldrb r1, [r0, #1]
    lsls r4, r1, #8
    ldrb r0, [r0]
    orrs r4, r0
    ldr r0, .L08008E98 @ =0x0000FFFF
    cmp r4, r0
    bne .L08008EA0
    ldr r0, .L08008E9C @ =gActiveUnit
    ldr r0, [r0]
    bl GetUnitFid
    adds r4, r0, #0
    b .L08008EA4
    .align 2, 0
.L08008E94: .4byte 0x08B909B8
.L08008E98: .4byte 0x0000FFFF
.L08008E9C: .4byte gActiveUnit
.L08008EA0:
    ldr r2, .L08008EC0 @ =0xFFFFFF00
    adds r4, r4, r2
.L08008EA4:
    ldr r5, .L08008EC4 @ =0x08B909B8
    ldr r0, [r5]
    ldrb r2, [r0, #0x11]
    lsls r1, r2, #2
    adds r0, #0x18
    adds r0, r0, r1
    ldr r0, [r0]
    cmp r0, #0
    beq .L08008EC8
    adds r1, r4, #0
    bl func_08007DB8
    b .L08008F10
    .align 2, 0
.L08008EC0: .4byte 0xFFFFFF00
.L08008EC4: .4byte 0x08B909B8
.L08008EC8:
    adds r0, r2, #0
    bl func_08009F04
    adds r1, r0, #0
    lsls r1, r1, #3
    adds r0, r4, #0
    movs r2, #0x50
    adds r3, r6, #0
    bl StartFaceAuto
    ldr r3, [r5]
    ldrb r2, [r3, #0x11]
    lsls r1, r2, #2
    adds r2, r3, #0
    adds r2, #0x18
    adds r1, r2, r1
    str r0, [r1]
    ldrb r3, [r3, #0x11]
    lsls r0, r3, #2
    adds r2, r2, r0
    ldr r0, [r2]
    bl func_0800751C
    ldr r0, [r5]
    ldrb r4, [r0, #0x11]
    movs r0, #0x10
    bl CheckTalkFlag
    adds r1, r0, #0
    adds r0, r4, #0
    bl func_08008F6C
    adds r0, r7, #0
    movs r1, #8
    bl StartTemporaryLock
.L08008F10:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_08008E34

    thumb_func_start func_08008F18
func_08008F18: @ 0x08008F18
    push {r4, lr}
    ldr r4, [sp, #8]
    bl StartFaceAuto
    ldr r1, .L08008F34 @ =0x08B909B8
    ldr r1, [r1]
    lsls r4, r4, #2
    adds r1, #0x18
    adds r1, r1, r4
    str r0, [r1]
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08008F34: .4byte 0x08B909B8
    func_end func_08008F18

    thumb_func_start func_08008F38
func_08008F38: @ 0x08008F38
    push {r4, lr}
    adds r3, r0, #0
    movs r1, #0
    ldr r2, .L08008F54 @ =0x030041C0
.L08008F40:
    ldr r0, [r2]
    cmp r0, #0
    beq .L08008F58
    movs r4, #0x34
    ldrsh r0, [r0, r4]
    cmp r0, r3
    bne .L08008F58
    adds r0, r1, #0
    b .L08008F64
    .align 2, 0
.L08008F54: .4byte 0x030041C0
.L08008F58:
    adds r2, #4
    adds r1, #1
    cmp r1, #3
    ble .L08008F40
    movs r0, #1
    rsbs r0, r0, #0
.L08008F64:
    pop {r4}
    pop {r1}
    bx r1
    func_end func_08008F38

    thumb_func_start func_08008F6C
func_08008F6C: @ 0x08008F6C
    push {r4, r5, r6, r7, lr}
    adds r3, r0, #0
    cmp r1, #0
    beq .L08008F7A
    movs r6, #6
    movs r5, #5
    b .L08008F7E
.L08008F7A:
    movs r6, #5
    movs r5, #6
.L08008F7E:
    cmp r3, #0
    blt .L08008F8A
    cmp r3, #2
    ble .L08008F8A
    cmp r3, #5
    ble .L08008F90
.L08008F8A:
    movs r1, #0
    movs r4, #2
    b .L08008F94
.L08008F90:
    movs r1, #3
    movs r4, #5
.L08008F94:
    adds r2, r1, #0
    cmp r2, r4
    bgt .L08008FC2
    ldr r7, .L08008FB4 @ =0x08B909B8
.L08008F9C:
    ldr r0, [r7]
    lsls r1, r2, #2
    adds r0, #0x18
    adds r0, r0, r1
    ldr r0, [r0]
    cmp r0, #0
    beq .L08008FBC
    cmp r2, r3
    bne .L08008FB8
    adds r0, #0x41
    strb r6, [r0]
    b .L08008FBC
    .align 2, 0
.L08008FB4: .4byte 0x08B909B8
.L08008FB8:
    adds r0, #0x41
    strb r5, [r0]
.L08008FBC:
    adds r2, #1
    cmp r2, r4
    ble .L08008F9C
.L08008FC2:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_08008F6C

    thumb_func_start func_08008FC8
func_08008FC8: @ 0x08008FC8
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r5, r0, #0
    adds r4, r1, #0
    movs r7, #0
    ldr r0, .L0800901C @ =0x08B909B8
    mov r8, r0
    ldr r0, [r0]
    lsls r6, r4, #2
    adds r0, #0x18
    adds r0, r0, r6
    ldr r0, [r0]
    cmp r0, #0
    beq .L08008FF2
    movs r7, #1
    adds r0, r4, #0
    adds r1, r5, #0
    movs r2, #1
    bl func_0800903C
.L08008FF2:
    adds r2, r7, #0
    adds r0, r5, #0
    adds r1, r4, #0
    bl func_0800903C
    mov r1, r8
    ldr r0, [r1]
    lsls r2, r5, #2
    adds r0, #0x18
    adds r2, r0, r2
    ldr r3, [r2]
    adds r0, r0, r6
    ldr r1, [r0]
    str r1, [r2]
    str r3, [r0]
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800901C: .4byte 0x08B909B8
    func_end func_08008FC8

    thumb_func_start func_08009020
func_08009020: @ 0x08009020
    push {lr}
    ldr r0, .L08009030 @ =0x08B90A0C
    bl Proc_Find
    cmp r0, #0
    bne .L08009034
    movs r0, #0
    b .L08009036
    .align 2, 0
.L08009030: .4byte 0x08B90A0C
.L08009034:
    movs r0, #1
.L08009036:
    pop {r1}
    bx r1
    func_end func_08009020

    thumb_func_start func_0800903C
func_0800903C: @ 0x0800903C
    push {r4, r5, r6, r7, lr}
    adds r6, r1, #0
    lsls r2, r2, #0x18
    lsrs r7, r2, #0x18
    bl func_08009F04
    lsls r0, r0, #3
    bl func_08008F38
    adds r5, r0, #0
    movs r0, #1
    rsbs r0, r0, #0
    cmp r5, r0
    beq .L08009084
    ldr r0, .L0800908C @ =0x08B90A0C
    ldr r1, .L08009090 @ =0x030041C0
    lsls r4, r5, #2
    adds r4, r4, r1
    ldr r1, [r4]
    bl SpawnProc
    adds r3, r0, #0
    adds r0, #0x64
    strh r5, [r0]
    adds r0, #2
    strh r6, [r0]
    ldr r0, [r4]
    ldrh r1, [r0, #0x34]
    adds r0, r3, #0
    adds r0, #0x68
    strh r1, [r0]
    lsls r0, r7, #0x18
    asrs r0, r0, #0x18
    adds r1, r3, #0
    adds r1, #0x6a
    strh r0, [r1]
.L08009084:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800908C: .4byte 0x08B90A0C
.L08009090: .4byte 0x030041C0
    func_end func_0800903C

    thumb_func_start TalkFaceMove_OnInit
TalkFaceMove_OnInit: @ 0x08009094
    push {r4, r5, r6, lr}
    adds r6, r0, #0
    movs r0, #0
    str r0, [r6, #0x58]
    adds r4, r6, #0
    adds r4, #0x66
    movs r1, #0
    ldrsh r0, [r4, r1]
    bl func_08009F04
    adds r5, r6, #0
    adds r5, #0x68
    movs r2, #0
    ldrsh r1, [r5, r2]
    lsls r0, r0, #3
    subs r1, r1, r0
    cmp r1, #0
    bge .L080090CE
    movs r1, #0
    ldrsh r0, [r4, r1]
    bl func_08009F04
    lsls r0, r0, #3
    movs r2, #0
    ldrsh r1, [r5, r2]
    subs r0, r0, r1
    cmp r0, #0x18
    bgt .L080090E2
    b .L080090E6
.L080090CE:
    movs r1, #0
    ldrsh r0, [r4, r1]
    bl func_08009F04
    movs r2, #0
    ldrsh r1, [r5, r2]
    lsls r0, r0, #3
    subs r1, r1, r0
    cmp r1, #0x18
    ble .L080090E6
.L080090E2:
    movs r0, #0x20
    b .L080090E8
.L080090E6:
    movs r0, #0x10
.L080090E8:
    str r0, [r6, #0x5c]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    func_end TalkFaceMove_OnInit

    thumb_func_start TalkFaceMove_OnIdle
TalkFaceMove_OnIdle: @ 0x080090F0
    push {r4, r5, lr}
    sub sp, #4
    adds r4, r0, #0
    ldr r2, [r4, #0x5c]
    cmp r2, #0x10
    ble .L08009164
    adds r1, r2, #0
    cmp r2, #0
    bge .L08009104
    adds r1, r2, #7
.L08009104:
    asrs r1, r1, #3
    ldr r0, [r4, #0x58]
    adds r5, r4, #0
    adds r5, #0x64
    cmp r0, r1
    bne .L08009122
    ldr r1, .L08009160 @ =0x030041C0
    movs r2, #0
    ldrsh r0, [r5, r2]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r1, [r0]
    ldrh r0, [r1, #0x36]
    adds r0, #1
    strh r0, [r1, #0x36]
.L08009122:
    ldr r0, [r4, #0x5c]
    lsrs r1, r0, #0x1f
    adds r0, r0, r1
    asrs r0, r0, #1
    ldr r1, [r4, #0x58]
    cmp r1, r0
    bne .L08009142
    ldr r1, .L08009160 @ =0x030041C0
    movs r3, #0
    ldrsh r0, [r5, r3]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r1, [r0]
    ldrh r0, [r1, #0x36]
    subs r0, #1
    strh r0, [r1, #0x36]
.L08009142:
    ldr r1, [r4, #0x5c]
    lsls r0, r1, #2
    adds r0, r0, r1
    cmp r0, #0
    bge .L0800914E
    adds r0, #7
.L0800914E:
    asrs r1, r0, #3
    ldr r0, [r4, #0x58]
    cmp r0, r1
    bne .L08009186
    ldr r1, .L08009160 @ =0x030041C0
    movs r2, #0
    ldrsh r0, [r5, r2]
    b .L0800917A
    .align 2, 0
.L08009160: .4byte 0x030041C0
.L08009164:
    lsrs r0, r2, #0x1f
    adds r0, r2, r0
    asrs r0, r0, #1
    ldr r1, [r4, #0x58]
    adds r5, r4, #0
    adds r5, #0x64
    cmp r1, r0
    bne .L08009186
    ldr r1, .L080091A8 @ =0x030041C0
    movs r3, #0
    ldrsh r0, [r5, r3]
.L0800917A:
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r1, [r0]
    ldrh r0, [r1, #0x36]
    adds r0, #1
    strh r0, [r1, #0x36]
.L08009186:
    ldr r1, [r4, #0x58]
    ldr r0, [r4, #0x5c]
    cmp r1, r0
    blt .L080091AC
    ldr r1, .L080091A8 @ =0x030041C0
    movs r2, #0
    ldrsh r0, [r5, r2]
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r1, [r0]
    ldrh r0, [r1, #0x36]
    subs r0, #1
    strh r0, [r1, #0x36]
    adds r0, r4, #0
    bl Proc_Break
    b .L080091E4
    .align 2, 0
.L080091A8: .4byte 0x030041C0
.L080091AC:
    adds r0, r4, #0
    adds r0, #0x66
    movs r3, #0
    ldrsh r0, [r0, r3]
    bl func_08009F04
    adds r2, r0, #0
    lsls r2, r2, #3
    adds r0, r4, #0
    adds r0, #0x68
    movs r3, #0
    ldrsh r1, [r0, r3]
    ldr r0, [r4, #0x58]
    adds r3, r0, #0
    adds r0, #1
    str r0, [r4, #0x58]
    ldr r0, [r4, #0x5c]
    str r0, [sp]
    movs r0, #4
    bl func_08012FE8
    ldr r2, .L080091EC @ =0x030041C0
    movs r3, #0
    ldrsh r1, [r5, r3]
    lsls r1, r1, #2
    adds r1, r1, r2
    ldr r1, [r1]
    strh r0, [r1, #0x34]
.L080091E4:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080091EC: .4byte 0x030041C0
    func_end TalkFaceMove_OnIdle

    thumb_func_start func_080091F0
func_080091F0: @ 0x080091F0
    push {lr}
    ldr r0, .L08009204 @ =0x08B909BC
    bl Proc_EndEach
    ldr r0, .L08009208 @ =0x08B90ACC
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L08009204: .4byte 0x08B909BC
.L08009208: .4byte 0x08B90ACC
    func_end func_080091F0

    thumb_func_start TalkPause_OnIdle
TalkPause_OnIdle: @ 0x0800920C
    push {r4, lr}
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x64
    ldrh r3, [r1]
    movs r4, #0
    ldrsh r0, [r1, r4]
    cmp r0, #0
    bne .L08009226
    adds r0, r2, #0
    bl Proc_Break
    b .L0800922A
.L08009226:
    subs r0, r3, #1
    strh r0, [r1]
.L0800922A:
    pop {r4}
    pop {r0}
    bx r0
    func_end TalkPause_OnIdle

    thumb_func_start TalkWaitForInput_OnIdle
TalkWaitForInput_OnIdle: @ 0x08009230
    push {r4, r5, lr}
    sub sp, #4
    adds r5, r0, #0
    bl GetGameTime
    lsrs r4, r0, #1
    movs r0, #0xf
    ands r4, r0
    movs r0, #0x80
    bl CheckTalkFlag
    cmp r0, #0
    bne .L08009270
    adds r0, r5, #0
    adds r0, #0x64
    movs r2, #0
    ldrsh r1, [r0, r2]
    adds r0, #2
    movs r3, #0
    ldrsh r2, [r0, r3]
    ldr r3, .L0800926C @ =0x08B90A8C
    lsls r0, r4, #2
    adds r0, r0, r3
    ldr r3, [r0]
    movs r0, #4
    str r0, [sp]
    movs r0, #2
    bl func_080069F4
    b .L08009290
    .align 2, 0
.L0800926C: .4byte 0x08B90A8C
.L08009270:
    adds r0, r5, #0
    adds r0, #0x64
    movs r2, #0
    ldrsh r1, [r0, r2]
    adds r0, #2
    movs r3, #0
    ldrsh r2, [r0, r3]
    ldr r3, .L080092AC @ =0x08B90A8C
    lsls r0, r4, #2
    adds r0, r0, r3
    ldr r3, [r0]
    ldr r0, .L080092B0 @ =0x0000B2BF
    str r0, [sp]
    movs r0, #0
    bl func_080069F4
.L08009290:
    ldr r0, .L080092B4 @ =gKeys
    ldr r1, [r0]
    movs r0, #0xf3
    ldrh r1, [r1, #8]
    ands r0, r1
    cmp r0, #0
    beq .L080092A4
    adds r0, r5, #0
    bl Proc_Break
.L080092A4:
    add sp, #4
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080092AC: .4byte 0x08B90A8C
.L080092B0: .4byte 0x0000B2BF
.L080092B4: .4byte gKeys
    func_end TalkWaitForInput_OnIdle

    thumb_func_start func_080092B8
func_080092B8: @ 0x080092B8
    bx lr
    func_end func_080092B8

    thumb_func_start func_080092BC
func_080092BC: @ 0x080092BC
    push {r4, r5, lr}
    adds r3, r0, #0
    adds r4, r1, #0
    adds r5, r2, #0
    ldr r0, .L080092E4 @ =0x08B90A4C
    adds r1, r3, #0
    bl SpawnProcLocking
    adds r2, r0, #0
    adds r0, #0x64
    movs r1, #0
    strh r4, [r0]
    adds r0, #2
    strh r5, [r0]
    adds r0, #2
    strh r1, [r0]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L080092E4: .4byte 0x08B90A4C
    func_end func_080092BC

    thumb_func_start func_080092E8
func_080092E8: @ 0x080092E8
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    mov r8, r3
    ldr r0, .L08009318 @ =0x08B90A4C
    adds r1, r4, #0
    bl SpawnProcLocking
    adds r1, r0, #0
    adds r0, #0x64
    strh r5, [r0]
    adds r0, #2
    strh r6, [r0]
    adds r0, #2
    mov r1, r8
    strh r1, [r0]
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08009318: .4byte 0x08B90A4C
    func_end func_080092E8

    thumb_func_start func_0800931C
func_0800931C: @ 0x0800931C
    push {r4, r5, lr}
    adds r5, r0, #0
    ldr r4, .L08009364 @ =0x08B909B8
    ldr r2, [r4]
    ldrb r0, [r2, #0xd]
    adds r0, #4
    lsls r0, r0, #5
    ldrb r1, [r2, #0xc]
    adds r0, r1, r0
    lsls r0, r0, #1
    ldr r1, .L08009368 @ =gBg0Tm
    adds r0, r0, r1
    ldrb r1, [r2, #0xe]
    subs r1, #2
    ldrb r2, [r2, #0xa]
    lsls r2, r2, #1
    movs r3, #0
    bl TmFillRect_thm
    movs r0, #1
    bl func_0800A4F0
    adds r1, r5, #0
    adds r1, #0x64
    movs r0, #0
    strh r0, [r1]
    ldr r1, [r4]
    ldrb r0, [r1, #9]
    cmp r0, #0
    bne .L0800936C
    adds r1, r5, #0
    adds r1, #0x66
    movs r0, #0x10
    strh r0, [r1]
    b .L08009382
    .align 2, 0
.L08009364: .4byte 0x08B909B8
.L08009368: .4byte gBg0Tm
.L0800936C:
    ldrb r0, [r1, #9]
    adds r0, #1
    ldrb r1, [r1, #0xa]
    cmp r0, r1
    blt .L0800937A
    lsls r1, r1, #4
    b .L0800937C
.L0800937A:
    lsls r1, r0, #4
.L0800937C:
    adds r0, r5, #0
    adds r0, #0x66
    strh r1, [r0]
.L08009382:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_0800931C

    thumb_func_start func_08009388
func_08009388: @ 0x08009388
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r5, #0
    adds r4, #0x64
    ldrh r0, [r4]
    adds r0, #1
    strh r0, [r4]
    ldrh r2, [r4]
    movs r0, #0
    movs r1, #0
    bl SetBgOffset
    adds r0, r5, #0
    adds r0, #0x66
    movs r2, #0
    ldrsh r1, [r4, r2]
    movs r2, #0
    ldrsh r0, [r0, r2]
    cmp r1, r0
    blt .L080093C4
    movs r0, #0
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    bl func_08009798
    adds r0, r5, #0
    bl Proc_Break
.L080093C4:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08009388

    thumb_func_start func_080093CC
func_080093CC: @ 0x080093CC
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    adds r7, r0, #0
    adds r6, r1, #0
    adds r5, r2, #0
    mov sb, r3
    adds r0, r6, #0
    bl func_08005570
    adds r4, r0, #0
    movs r0, #0x10
    adds r0, r0, r4
    mov r8, r0
    ldrh r0, [r7]
    bl GetMsg
    adds r3, r0, #0
    adds r0, r6, #0
    mov r1, r8
    ldr r2, [sp, #0x1c]
    bl Text_InsertDrawString
    adds r4, #0x38
    ldrh r0, [r7, #8]
    bl GetMsg
    adds r3, r0, #0
    adds r0, r6, #0
    adds r1, r4, #0
    ldr r2, [sp, #0x1c]
    bl Text_InsertDrawString
    adds r0, r6, #0
    adds r1, r5, #0
    bl func_08005590
    movs r0, #1
    bl func_0800A4F0
    ldr r0, .L08009474 @ =0x08B90B0C
    ldr r1, [sp, #0x20]
    bl SpawnProcLocking
    adds r1, r0, #0
    mov r3, sb
    strh r3, [r1, #0x2a]
    ldr r0, .L08009478 @ =gBg0Tm
    subs r5, r5, r0
    asrs r5, r5, #1
    movs r0, #0x1f
    ands r0, r5
    lsls r0, r0, #3
    ldr r2, .L0800947C @ =gDispIo
    ldrh r3, [r2, #0x1c]
    subs r0, r0, r3
    add r0, r8
    strh r0, [r1, #0x2c]
    cmp r5, #0
    bge .L08009448
    adds r5, #0x1f
.L08009448:
    asrs r0, r5, #5
    lsls r0, r0, #3
    ldrh r2, [r2, #0x1e]
    subs r0, r0, r2
    strh r0, [r1, #0x2e]
    str r7, [r1, #0x34]
    mov r1, sb
    lsls r0, r1, #3
    adds r0, r0, r7
    subs r0, #8
    ldr r0, [r0, #4]
    cmp r0, #0
    beq .L08009466
    bl _call_via_r0
.L08009466:
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08009474: .4byte 0x08B90B0C
.L08009478: .4byte gBg0Tm
.L0800947C: .4byte gDispIo
    func_end func_080093CC

    thumb_func_start func_08009480
func_08009480: @ 0x08009480
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r0, .L080094AC @ =gKeys
    ldr r0, [r0]
    ldrh r1, [r0, #8]
    movs r0, #2
    ands r0, r1
    cmp r0, #0
    beq .L080094BC
    ldr r0, .L080094B0 @ =gPlayStatus
    adds r0, #0x41
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    blt .L080094A4
    ldr r0, .L080094B4 @ =0x0000038B
    bl m4aSongNumStart
.L080094A4:
    ldr r1, .L080094B8 @ =0x030000E0
    movs r0, #0
    b .L080094DE
    .align 2, 0
.L080094AC: .4byte gKeys
.L080094B0: .4byte gPlayStatus
.L080094B4: .4byte 0x0000038B
.L080094B8: .4byte 0x030000E0
.L080094BC:
    movs r5, #1
    adds r0, r5, #0
    ands r0, r1
    cmp r0, #0
    beq .L080094F4
    ldr r0, .L080094E8 @ =gPlayStatus
    adds r0, #0x41
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    blt .L080094D8
    ldr r0, .L080094EC @ =0x0000038A
    bl m4aSongNumStart
.L080094D8:
    ldr r1, .L080094F0 @ =0x030000E0
    movs r2, #0x2a
    ldrsh r0, [r4, r2]
.L080094DE:
    str r0, [r1]
    adds r0, r4, #0
    bl Proc_Break
    b .L08009574
    .align 2, 0
.L080094E8: .4byte gPlayStatus
.L080094EC: .4byte 0x0000038A
.L080094F0: .4byte 0x030000E0
.L080094F4:
    movs r0, #0x20
    ands r0, r1
    cmp r0, #0
    beq .L08009522
    ldrh r0, [r4, #0x2a]
    cmp r0, #2
    bne .L08009522
    ldr r0, .L0800957C @ =gPlayStatus
    adds r0, #0x41
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    blt .L08009514
    ldr r0, .L08009580 @ =0x00000387
    bl m4aSongNumStart
.L08009514:
    strh r5, [r4, #0x2a]
    ldr r0, [r4, #0x34]
    ldr r0, [r0, #4]
    cmp r0, #0
    beq .L08009522
    bl _call_via_r0
.L08009522:
    ldr r0, .L08009584 @ =gKeys
    ldr r1, [r0]
    movs r0, #0x10
    ldrh r1, [r1, #8]
    ands r0, r1
    cmp r0, #0
    beq .L08009558
    ldrh r1, [r4, #0x2a]
    cmp r1, #1
    bne .L08009558
    ldr r0, .L0800957C @ =gPlayStatus
    adds r0, #0x41
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    blt .L08009548
    ldr r0, .L08009580 @ =0x00000387
    bl m4aSongNumStart
.L08009548:
    movs r0, #2
    strh r0, [r4, #0x2a]
    ldr r0, [r4, #0x34]
    ldr r0, [r0, #0xc]
    cmp r0, #0
    beq .L08009558
    bl _call_via_r0
.L08009558:
    movs r2, #0x2c
    ldrsh r0, [r4, r2]
    movs r1, #0x2a
    ldrsh r2, [r4, r1]
    subs r2, #1
    lsls r1, r2, #2
    adds r1, r1, r2
    lsls r1, r1, #3
    adds r0, r0, r1
    subs r0, #4
    movs r2, #0x2e
    ldrsh r1, [r4, r2]
    bl func_08049F58
.L08009574:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800957C: .4byte gPlayStatus
.L08009580: .4byte 0x00000387
.L08009584: .4byte gKeys
    func_end func_08009480

    thumb_func_start func_08009588
func_08009588: @ 0x08009588
    push {r4, lr}
    adds r4, r0, #0
    ldr r0, .L080095C0 @ =0x08B909B8
    ldr r2, [r0]
    ldrb r0, [r2, #0xd]
    adds r0, #4
    lsls r0, r0, #5
    ldrb r1, [r2, #0xc]
    adds r0, r1, r0
    lsls r0, r0, #1
    ldr r1, .L080095C4 @ =gBg0Tm
    adds r0, r0, r1
    ldrb r1, [r2, #0xe]
    subs r1, #2
    ldrb r2, [r2, #0xa]
    lsls r2, r2, #1
    movs r3, #0
    bl TmFillRect_thm
    movs r0, #1
    bl func_0800A4F0
    adds r4, #0x64
    movs r0, #0
    strh r0, [r4]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L080095C0: .4byte 0x08B909B8
.L080095C4: .4byte gBg0Tm
    func_end func_08009588

    thumb_func_start func_080095C8
func_080095C8: @ 0x080095C8
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    adds r4, r7, #0
    adds r4, #0x64
    ldrh r0, [r4]
    adds r0, #1
    strh r0, [r4]
    ldrh r2, [r4]
    movs r0, #0
    movs r1, #0
    bl SetBgOffset
    movs r1, #0
    ldrsh r0, [r4, r1]
    cmp r0, #0xf
    ble .L080096A8
    ldr r4, .L080096B0 @ =0x08B909B8
    ldr r1, [r4]
    ldrb r0, [r1, #9]
    subs r0, #1
    strb r0, [r1, #9]
    ldr r1, [r4]
    ldrb r0, [r1, #0xb]
    adds r0, #1
    strb r0, [r1, #0xb]
    movs r0, #0
    movs r1, #0
    movs r2, #0
    bl SetBgOffset
    movs r5, #0
    ldr r0, [r4]
    ldrb r0, [r0, #0xa]
    subs r0, #1
    cmp r5, r0
    bge .L08009646
    adds r6, r4, #0
.L08009612:
    ldr r4, [r6]
    ldrb r2, [r4, #0xb]
    adds r0, r2, r5
    ldrb r1, [r4, #0xa]
    bl __modsi3
    lsls r0, r0, #3
    ldr r1, .L080096B4 @ =0x030000C8
    adds r0, r0, r1
    lsls r1, r5, #1
    ldrb r2, [r4, #0xd]
    adds r1, r2, r1
    lsls r1, r1, #5
    ldrb r4, [r4, #0xc]
    adds r1, r4, r1
    lsls r1, r1, #1
    ldr r2, .L080096B8 @ =gBg0Tm
    adds r1, r1, r2
    bl func_08005590
    adds r5, #1
    ldr r0, [r6]
    ldrb r0, [r0, #0xa]
    subs r0, #1
    cmp r5, r0
    blt .L08009612
.L08009646:
    ldr r4, .L080096B0 @ =0x08B909B8
    ldr r2, [r4]
    ldrb r0, [r2, #0xa]
    subs r0, #1
    lsls r0, r0, #1
    ldrb r1, [r2, #0xd]
    adds r0, r1, r0
    lsls r0, r0, #5
    ldrb r1, [r2, #0xc]
    adds r0, r1, r0
    lsls r0, r0, #1
    ldr r1, .L080096B8 @ =gBg0Tm
    adds r0, r0, r1
    ldrb r1, [r2, #0xe]
    subs r1, #2
    movs r2, #2
    movs r3, #0
    bl TmFillRect_thm
    ldr r0, [r4]
    ldrb r1, [r0, #0xa]
    ldrb r0, [r0, #0xb]
    subs r0, #1
    adds r0, r1, r0
    bl __modsi3
    lsls r0, r0, #3
    ldr r5, .L080096B4 @ =0x030000C8
    adds r0, r0, r5
    bl ClearText
    ldr r4, [r4]
    ldrb r1, [r4, #0xa]
    ldrb r0, [r4, #0xb]
    subs r0, #1
    adds r0, r1, r0
    bl __modsi3
    lsls r0, r0, #3
    adds r0, r0, r5
    ldrb r1, [r4, #8]
    bl Text_SetColor
    movs r0, #1
    bl func_0800A4F0
    adds r0, r7, #0
    bl Proc_Break
.L080096A8:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L080096B0: .4byte 0x08B909B8
.L080096B4: .4byte 0x030000C8
.L080096B8: .4byte gBg0Tm
    func_end func_080095C8

    thumb_func_start func_080096BC
func_080096BC: @ 0x080096BC
    push {lr}
    adds r3, r0, #0
    movs r0, #0x80
    lsls r0, r0, #2
    ldr r2, .L080096D0 @ =0x44444444
    movs r1, #0x1a
    bl func_0800A534
    pop {r0}
    bx r0
    .align 2, 0
.L080096D0: .4byte 0x44444444
    func_end func_080096BC

    thumb_func_start func_080096D4
func_080096D4: @ 0x080096D4
    push {r4, lr}
    ldr r0, .L08009700 @ =0x08B909B8
    ldr r1, [r0]
    ldrb r0, [r1, #9]
    subs r0, #1
    strb r0, [r1, #9]
    ldr r4, .L08009704 @ =0x030000D0
    adds r0, r4, #0
    bl SpriteText_DrawBackground
    adds r0, r4, #0
    movs r1, #6
    bl Text_SetColor
    adds r0, r4, #0
    movs r1, #4
    bl Text_SetCursor
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08009700: .4byte 0x08B909B8
.L08009704: .4byte 0x030000D0
    func_end func_080096D4

    thumb_func_start func_08009708
func_08009708: @ 0x08009708
    push {r4, r5, lr}
    ldr r0, .L0800973C @ =0x08B909B8
    ldr r1, [r0]
    movs r0, #0
    strb r0, [r1, #9]
    movs r5, #0
.L08009714:
    lsls r4, r5, #3
    ldr r0, .L08009740 @ =0x030000C8
    adds r4, r4, r0
    adds r0, r4, #0
    bl SpriteText_DrawBackground
    adds r0, r4, #0
    movs r1, #6
    bl Text_SetColor
    adds r0, r4, #0
    movs r1, #4
    bl Text_SetCursor
    adds r5, #1
    cmp r5, #1
    ble .L08009714
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800973C: .4byte 0x08B909B8
.L08009740: .4byte 0x030000C8
    func_end func_08009708

    thumb_func_start func_08009744
func_08009744: @ 0x08009744
    ldr r1, .L08009750 @ =0x08B90B7C
    subs r0, #4
    lsls r0, r0, #2
    adds r0, r0, r1
    ldr r0, [r0]
    bx lr
    .align 2, 0
.L08009750: .4byte 0x08B90B7C
    func_end func_08009744

    thumb_func_start ClearTalkBubble
ClearTalkBubble: @ 0x08009754
    push {lr}
    ldr r0, .L0800978C @ =0x08B909B8
    ldr r1, [r0]
    movs r0, #0xff
    strb r0, [r1, #0xf]
    ldr r0, .L08009790 @ =gBg1Tm
    movs r1, #0
    bl TmFill
    movs r0, #2
    bl func_0800A4F0
    bl func_08009798
    ldr r2, .L08009794 @ =gDispIo
    movs r0, #0x21
    rsbs r0, r0, #0
    ldrb r1, [r2, #1]
    ands r0, r1
    movs r1, #0x41
    rsbs r1, r1, #0
    ands r0, r1
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r2, #1]
    pop {r0}
    bx r0
    .align 2, 0
.L0800978C: .4byte 0x08B909B8
.L08009790: .4byte gBg1Tm
.L08009794: .4byte gDispIo
    func_end ClearTalkBubble

    thumb_func_start func_08009798
func_08009798: @ 0x08009798
    push {r4, r5, r6, lr}
    ldr r0, .L080097F0 @ =gBg0Tm
    movs r1, #0
    bl TmFill
    movs r0, #1
    bl func_0800A4F0
    ldr r2, .L080097F4 @ =0x08B909B8
    ldr r0, [r2]
    movs r1, #0
    strb r1, [r0, #9]
    ldr r0, [r2]
    adds r0, #0x82
    strb r1, [r0]
    ldr r0, [r2]
    strb r1, [r0, #0x15]
    ldr r0, [r2]
    strb r1, [r0, #0xb]
    movs r5, #0
    ldr r0, [r2]
    ldrb r0, [r0, #0xa]
    cmp r5, r0
    bge .L080097EA
    adds r6, r2, #0
.L080097CA:
    lsls r4, r5, #3
    ldr r0, .L080097F8 @ =0x030000C8
    adds r4, r4, r0
    adds r0, r4, #0
    bl ClearText
    ldr r0, [r6]
    ldrb r1, [r0, #8]
    adds r0, r4, #0
    bl Text_SetColor
    adds r5, #1
    ldr r0, [r6]
    ldrb r0, [r0, #0xa]
    cmp r5, r0
    blt .L080097CA
.L080097EA:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L080097F0: .4byte gBg0Tm
.L080097F4: .4byte 0x08B909B8
.L080097F8: .4byte 0x030000C8
    func_end func_08009798

    thumb_func_start func_080097FC
func_080097FC: @ 0x080097FC
    push {r4, r5, r6, lr}
    ldr r2, .L08009848 @ =0x08B909B8
    ldr r0, [r2]
    movs r1, #0
    strb r1, [r0, #9]
    ldr r0, [r2]
    adds r0, #0x82
    strb r1, [r0]
    ldr r0, [r2]
    strb r1, [r0, #0x15]
    ldr r0, [r2]
    strb r1, [r0, #0xb]
    movs r5, #0
    ldr r0, [r2]
    ldrb r0, [r0, #0xa]
    cmp r5, r0
    bge .L08009840
    adds r6, r2, #0
.L08009820:
    lsls r4, r5, #3
    ldr r0, .L0800984C @ =0x030000C8
    adds r4, r4, r0
    adds r0, r4, #0
    bl ClearText
    ldr r0, [r6]
    ldrb r1, [r0, #8]
    adds r0, r4, #0
    bl Text_SetColor
    adds r5, #1
    ldr r0, [r6]
    ldrb r0, [r0, #0xa]
    cmp r5, r0
    blt .L08009820
.L08009840:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08009848: .4byte 0x08B909B8
.L0800984C: .4byte 0x030000C8
    func_end func_080097FC

    thumb_func_start func_08009850
func_08009850: @ 0x08009850
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    adds r5, r0, #0
    mov sl, r1
    adds r4, r2, #0
    str r3, [sp, #4]
    movs r0, #0
    mov r8, r0
    movs r6, #0
    ldr r0, .L080098A0 @ =gBg1Tm
    movs r1, #0
    bl TmFill
    movs r7, #1
    cmp r5, #0xf
    bgt .L0800987A
    movs r7, #0
.L0800987A:
    bl func_0804B1EC
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08009886
    adds r7, #2
.L08009886:
    mov r1, sl
    ldr r2, [sp, #4]
    subs r0, r1, r2
    adds r0, #1
    mov sb, r0
    cmp r7, #1
    beq .L080098C2
    cmp r7, #1
    bgt .L080098A4
    cmp r7, #0
    beq .L080098AE
    b .L08009906
    .align 2, 0
.L080098A0: .4byte gBg1Tm
.L080098A4:
    cmp r7, #2
    beq .L080098E6
    cmp r7, #3
    beq .L080098F8
    b .L08009906
.L080098AE:
    adds r5, #3
    mov r8, r5
    lsrs r0, r4, #0x1f
    adds r0, r4, r0
    asrs r0, r0, #1
    subs r6, r5, r0
    cmp r6, #0
    bgt .L08009906
    movs r6, #1
    b .L08009906
.L080098C2:
    subs r5, #5
    mov r8, r5
    adds r0, r4, #1
    lsrs r1, r0, #0x1f
    adds r0, r0, r1
    asrs r0, r0, #1
    add r0, r8
    cmp r0, #0x1d
    ble .L080098DA
    movs r0, #0x1d
    subs r6, r0, r4
    b .L08009906
.L080098DA:
    lsrs r0, r4, #0x1f
    adds r0, r4, r0
    asrs r0, r0, #1
    mov r1, r8
    subs r6, r1, r0
    b .L08009906
.L080098E6:
    movs r6, #9
    movs r2, #0xe
    mov sb, r2
    movs r4, #0x14
    movs r0, #8
    mov r8, r0
    movs r1, #0x10
    mov sl, r1
    b .L08009906
.L080098F8:
    movs r6, #1
    movs r2, #0xe
    mov sb, r2
    movs r4, #0x14
    mov r8, r4
    movs r0, #0x10
    mov sl, r0
.L08009906:
    ldr r5, .L08009988 @ =0x08B909B8
    ldr r1, [r5]
    adds r0, r6, #1
    strb r0, [r1, #0xc]
    ldr r1, [r5]
    mov r0, sb
    adds r0, #1
    strb r0, [r1, #0xd]
    ldr r1, [sp, #4]
    str r1, [sp]
    movs r0, #1
    adds r1, r6, #0
    mov r2, sb
    adds r3, r4, #0
    bl func_08009C18
    ldr r0, [r5]
    adds r0, #0x83
    ldrb r1, [r0]
    movs r0, #2
    ands r0, r1
    cmp r0, #0
    beq .L08009948
    movs r0, #1
    ands r0, r1
    bl func_08008578
    ldr r1, [r5]
    adds r1, #0x83
    movs r0, #2
    ldrb r2, [r1]
    eors r0, r2
    strb r0, [r1]
.L08009948:
    ldr r1, [r5]
    adds r1, #0x83
    movs r0, #1
    ldrb r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L08009962
    movs r0, #1
    mov r1, r8
    mov r2, sl
    adds r3, r7, #0
    bl func_08009A90
.L08009962:
    adds r0, r6, #0
    mov r1, sb
    adds r2, r4, #0
    ldr r3, [sp, #4]
    bl func_08009A10
    bl func_0800998C
    movs r0, #2
    bl func_0800A4F0
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08009988: .4byte 0x08B909B8
    func_end func_08009850

    thumb_func_start func_0800998C
func_0800998C: @ 0x0800998C
    push {lr}
    ldr r0, .L080099A0 @ =0x08B90B8C
    movs r1, #3
    bl SpawnProc
    adds r0, #0x64
    movs r1, #0
    strh r1, [r0]
    pop {r0}
    bx r0
    .align 2, 0
.L080099A0: .4byte 0x08B90B8C
    func_end func_0800998C

    thumb_func_start func_080099A4
func_080099A4: @ 0x080099A4
    push {r4, r5, r6, lr}
    sub sp, #0x1c
    adds r6, r0, #0
    mov r1, sp
    ldr r0, .L08009A08 @ =0x08193DDC
    ldm r0!, {r2, r3, r4}
    stm r1!, {r2, r3, r4}
    ldm r0!, {r2, r3, r4}
    stm r1!, {r2, r3, r4}
    ldr r0, [r0]
    str r0, [r1]
    adds r5, r6, #0
    adds r5, #0x64
    ldrh r1, [r5]
    adds r2, r1, #1
    strh r2, [r5]
    movs r0, #1
    ands r0, r1
    cmp r0, #0
    bne .L08009A00
    lsls r0, r2, #0x10
    asrs r0, r0, #0x11
    lsls r0, r0, #2
    add r0, sp
    ldr r4, [r0]
    movs r0, #1
    bl GetBgChrOffset
    adds r1, r0, #0
    ldr r0, .L08009A0C @ =0x06000200
    adds r1, r1, r0
    adds r0, r4, #0
    bl Decompress
    ldrh r5, [r5]
    lsls r0, r5, #0x10
    asrs r0, r0, #0x11
    adds r0, #1
    lsls r0, r0, #2
    add r0, sp
    ldr r0, [r0]
    cmp r0, #0
    bne .L08009A00
    adds r0, r6, #0
    bl Proc_Break
.L08009A00:
    add sp, #0x1c
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08009A08: .4byte 0x08193DDC
.L08009A0C: .4byte 0x06000200
    func_end func_080099A4

    thumb_func_start func_08009A10
func_08009A10: @ 0x08009A10
    push {r4, r5, r6, lr}
    ldr r4, .L08009A8C @ =gDispIo
    mov ip, r4
    movs r4, #0x20
    mov r5, ip
    ldrb r5, [r5, #1]
    orrs r4, r5
    movs r5, #0x41
    rsbs r5, r5, #0
    ands r4, r5
    movs r5, #0x7f
    ands r4, r5
    mov r6, ip
    strb r4, [r6, #1]
    adds r4, r0, #1
    lsls r4, r4, #3
    mov r5, ip
    adds r5, #0x2d
    strb r4, [r5]
    adds r4, r1, #1
    lsls r4, r4, #3
    adds r5, #4
    strb r4, [r5]
    adds r0, r0, r2
    subs r0, #1
    lsls r0, r0, #3
    mov r2, ip
    adds r2, #0x2c
    strb r0, [r2]
    adds r1, r1, r3
    subs r1, #1
    lsls r1, r1, #3
    mov r0, ip
    adds r0, #0x30
    strb r1, [r0]
    mov r1, ip
    adds r1, #0x34
    movs r0, #1
    ldrb r2, [r1]
    orrs r0, r2
    movs r5, #2
    orrs r0, r5
    movs r4, #4
    orrs r0, r4
    movs r3, #8
    orrs r0, r3
    movs r2, #0x10
    orrs r0, r2
    strb r0, [r1]
    adds r1, #2
    movs r0, #2
    rsbs r0, r0, #0
    ldrb r6, [r1]
    ands r0, r6
    orrs r0, r5
    orrs r0, r4
    orrs r0, r3
    orrs r0, r2
    strb r0, [r1]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08009A8C: .4byte gDispIo
    func_end func_08009A10

    thumb_func_start func_08009A90
func_08009A90: @ 0x08009A90
    push {r4, r5, r6, lr}
    adds r5, r1, #0
    adds r4, r2, #0
    adds r6, r3, #0
    bl func_08002BE8
    adds r3, r0, #0
    cmp r6, #5
    bls .L08009AA4
    b .L08009C06
.L08009AA4:
    lsls r0, r6, #2
    ldr r1, .L08009AB0 @ =.L08009AB4
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L08009AB0: .4byte .L08009AB4
.L08009AB4: @ jump table
    .4byte .L08009ACC @ case 0
    .4byte .L08009B00 @ case 1
    .4byte .L08009B38 @ case 2
    .4byte .L08009B6C @ case 3
    .4byte .L08009BA4 @ case 4
    .4byte .L08009BDC @ case 5
.L08009ACC:
    lsls r0, r4, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r2, .L08009AF4 @ =0x00003014
    adds r1, r2, #0
    strh r1, [r0]
    ldr r2, .L08009AF8 @ =0x00003414
    adds r1, r2, #0
    strh r1, [r0, #2]
    adds r0, r4, #1
    lsls r0, r0, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r3, .L08009AFC @ =0x00003416
    adds r1, r3, #0
    strh r1, [r0]
    adds r2, #1
    b .L08009C02
    .align 2, 0
.L08009AF4: .4byte 0x00003014
.L08009AF8: .4byte 0x00003414
.L08009AFC: .4byte 0x00003416
.L08009B00:
    lsls r0, r4, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r2, .L08009B28 @ =0x00003014
    adds r1, r2, #0
    strh r1, [r0]
    ldr r2, .L08009B2C @ =0x00003414
    adds r1, r2, #0
    strh r1, [r0, #2]
    adds r0, r4, #1
    lsls r0, r0, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r3, .L08009B30 @ =0x00003015
    adds r1, r3, #0
    strh r1, [r0]
    ldr r2, .L08009B34 @ =0x00003016
    b .L08009C02
    .align 2, 0
.L08009B28: .4byte 0x00003014
.L08009B2C: .4byte 0x00003414
.L08009B30: .4byte 0x00003015
.L08009B34: .4byte 0x00003016
.L08009B38:
    lsls r2, r4, #5
    adds r2, r5, r2
    lsls r2, r2, #1
    adds r2, r2, r3
    ldr r1, .L08009B60 @ =0x00003418
    adds r0, r1, #0
    strh r0, [r2]
    adds r0, r4, #1
    lsls r0, r0, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r3, .L08009B64 @ =0x00003419
    adds r1, r3, #0
    strh r1, [r0]
    subs r3, #2
    adds r1, r3, #0
    strh r1, [r2, #2]
    ldr r2, .L08009B68 @ =0x00003C17
    b .L08009C02
    .align 2, 0
.L08009B60: .4byte 0x00003418
.L08009B64: .4byte 0x00003419
.L08009B68: .4byte 0x00003C17
.L08009B6C:
    lsls r2, r4, #5
    adds r2, r5, r2
    lsls r2, r2, #1
    adds r2, r2, r3
    ldr r1, .L08009B94 @ =0x00003017
    adds r0, r1, #0
    strh r0, [r2]
    adds r0, r4, #1
    lsls r0, r0, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r3, .L08009B98 @ =0x00003817
    adds r1, r3, #0
    strh r1, [r0]
    ldr r3, .L08009B9C @ =0x00003018
    adds r1, r3, #0
    strh r1, [r2, #2]
    ldr r2, .L08009BA0 @ =0x00003019
    b .L08009C02
    .align 2, 0
.L08009B94: .4byte 0x00003017
.L08009B98: .4byte 0x00003817
.L08009B9C: .4byte 0x00003018
.L08009BA0: .4byte 0x00003019
.L08009BA4:
    lsls r2, r4, #5
    adds r2, r5, r2
    lsls r2, r2, #1
    adds r2, r2, r3
    ldr r1, .L08009BCC @ =0x00003C19
    adds r0, r1, #0
    strh r0, [r2]
    adds r0, r4, #1
    lsls r0, r0, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r3, .L08009BD0 @ =0x00003C18
    adds r1, r3, #0
    strh r1, [r0]
    ldr r3, .L08009BD4 @ =0x00003417
    adds r1, r3, #0
    strh r1, [r2, #2]
    ldr r2, .L08009BD8 @ =0x00003C17
    b .L08009C02
    .align 2, 0
.L08009BCC: .4byte 0x00003C19
.L08009BD0: .4byte 0x00003C18
.L08009BD4: .4byte 0x00003417
.L08009BD8: .4byte 0x00003C17
.L08009BDC:
    lsls r2, r4, #5
    adds r2, r5, r2
    lsls r2, r2, #1
    adds r2, r2, r3
    ldr r1, .L08009C0C @ =0x00003017
    adds r0, r1, #0
    strh r0, [r2]
    adds r0, r4, #1
    lsls r0, r0, #5
    adds r0, r5, r0
    lsls r0, r0, #1
    adds r0, r0, r3
    ldr r3, .L08009C10 @ =0x00003817
    adds r1, r3, #0
    strh r1, [r0]
    adds r3, #2
    adds r1, r3, #0
    strh r1, [r2, #2]
    ldr r2, .L08009C14 @ =0x00003818
.L08009C02:
    adds r1, r2, #0
    strh r1, [r0, #2]
.L08009C06:
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08009C0C: .4byte 0x00003017
.L08009C10: .4byte 0x00003817
.L08009C14: .4byte 0x00003818
    func_end func_08009A90

    thumb_func_start func_08009C18
func_08009C18: @ 0x08009C18
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #8
    mov r8, r1
    str r2, [sp]
    adds r5, r3, #0
    ldr r4, [sp, #0x28]
    bl func_08002BE8
    adds r7, r0, #0
    subs r5, #1
    subs r4, #1
    mov r0, r8
    adds r3, r0, r5
    cmp r8, r3
    bge .L08009C70
    ldr r1, .L08009D30 @ =0x00003011
    mov sb, r1
    ldr r2, [sp]
    adds r0, r2, r4
    mov r6, r8
    lsls r1, r6, #1
    lsls r0, r0, #6
    adds r0, r0, r7
    adds r2, r1, r0
    ldr r6, [sp]
    lsls r0, r6, #6
    adds r0, r0, r7
    adds r1, r1, r0
    ldr r6, .L08009D34 @ =0x00003811
    adds r0, r6, #0
    mov r6, r8
    subs r3, r3, r6
.L08009C60:
    mov r6, sb
    strh r6, [r1]
    strh r0, [r2]
    adds r2, #2
    adds r1, #2
    subs r3, #1
    cmp r3, #0
    bne .L08009C60
.L08009C70:
    ldr r3, [sp]
    add r5, r8
    mov ip, r5
    lsls r0, r3, #5
    str r0, [sp, #4]
    adds r4, r4, r3
    mov sb, r4
    movs r1, #1
    add r1, r8
    mov sl, r1
    cmp r3, sb
    bge .L08009CB4
    ldr r2, .L08009D38 @ =0x00003012
    adds r6, r2, #0
    ldr r4, .L08009D3C @ =0x00003412
    adds r5, r4, #0
    lsls r0, r3, #6
    mov r2, ip
    lsls r1, r2, #1
    adds r1, r1, r7
    adds r2, r0, r1
    mov r4, r8
    lsls r1, r4, #1
    adds r1, r1, r7
    adds r0, r0, r1
    mov r1, sb
    subs r3, r1, r3
.L08009CA6:
    strh r6, [r0]
    strh r5, [r2]
    adds r2, #0x40
    adds r0, #0x40
    subs r3, #1
    cmp r3, #0
    bne .L08009CA6
.L08009CB4:
    mov r3, sl
    cmp r3, ip
    bge .L08009CE6
    mov r5, sb
    mov sl, ip
.L08009CBE:
    ldr r2, [sp]
    adds r2, #1
    adds r4, r3, #1
    cmp r2, r5
    bge .L08009CE0
    ldr r0, .L08009D40 @ =0x00003013
    adds r6, r0, #0
    lsls r1, r2, #6
    lsls r0, r3, #1
    adds r0, r0, r7
    adds r0, r1, r0
    subs r2, r5, r2
.L08009CD6:
    strh r6, [r0]
    adds r0, #0x40
    subs r2, #1
    cmp r2, #0
    bne .L08009CD6
.L08009CE0:
    adds r3, r4, #0
    cmp r3, sl
    blt .L08009CBE
.L08009CE6:
    ldr r0, [sp, #4]
    add r0, r8
    lsls r0, r0, #1
    adds r0, r0, r7
    ldr r2, .L08009D44 @ =0x00003010
    adds r1, r2, #0
    strh r1, [r0]
    ldr r0, [sp, #4]
    add r0, ip
    lsls r0, r0, #1
    adds r0, r0, r7
    ldr r3, .L08009D48 @ =0x00003410
    adds r1, r3, #0
    strh r1, [r0]
    mov r4, sb
    lsls r1, r4, #5
    mov r6, r8
    adds r0, r6, r1
    lsls r0, r0, #1
    adds r0, r0, r7
    ldr r3, .L08009D4C @ =0x00003810
    adds r2, r3, #0
    strh r2, [r0]
    add r1, ip
    lsls r1, r1, #1
    adds r1, r1, r7
    ldr r4, .L08009D50 @ =0x00003C10
    adds r0, r4, #0
    strh r0, [r1]
    add sp, #8
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L08009D30: .4byte 0x00003011
.L08009D34: .4byte 0x00003811
.L08009D38: .4byte 0x00003012
.L08009D3C: .4byte 0x00003412
.L08009D40: .4byte 0x00003013
.L08009D44: .4byte 0x00003010
.L08009D48: .4byte 0x00003410
.L08009D4C: .4byte 0x00003810
.L08009D50: .4byte 0x00003C10
    func_end func_08009C18

    thumb_func_start func_08009D54
func_08009D54: @ 0x08009D54
    bx lr
    func_end func_08009D54

    thumb_func_start func_08009D58
func_08009D58: @ 0x08009D58
    push {r4, lr}
    movs r1, #0
    str r1, [r0, #0x58]
    movs r0, #0x80
    lsls r0, r0, #1
    bl CheckTalkFlag
    adds r4, r0, #0
    cmp r4, #0
    bne .L08009DB4
    ldr r2, .L08009DBC @ =0x030028AC
    ldr r0, .L08009DC0 @ =0x0000FFE0
    ldrh r1, [r2]
    ands r0, r1
    movs r1, #2
    orrs r0, r1
    ldr r1, .L08009DC4 @ =0x0000E0FF
    ands r0, r1
    movs r3, #0xe0
    lsls r3, r3, #5
    adds r1, r3, #0
    orrs r0, r1
    strh r0, [r2]
    movs r1, #0x20
    ldrb r0, [r2, #1]
    orrs r0, r1
    strb r0, [r2, #1]
    adds r3, r2, #0
    subs r3, #8
    ldrb r0, [r3]
    orrs r0, r1
    strb r0, [r3]
    subs r0, r2, #6
    ldrb r3, [r0]
    orrs r1, r3
    strb r1, [r0]
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    strb r4, [r2, #8]
    movs r0, #0x10
    strb r0, [r2, #9]
    strb r4, [r2, #0xa]
.L08009DB4:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L08009DBC: .4byte 0x030028AC
.L08009DC0: .4byte 0x0000FFE0
.L08009DC4: .4byte 0x0000E0FF
    func_end func_08009D58

    thumb_func_start func_08009DC8
func_08009DC8: @ 0x08009DC8
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r0, #0x64
    movs r1, #0
    ldrsh r0, [r0, r1]
    adds r1, r4, #0
    adds r1, #0x66
    movs r2, #0
    ldrsh r1, [r1, r2]
    adds r2, r4, #0
    adds r2, #0x68
    movs r3, #0
    ldrsh r2, [r2, r3]
    adds r3, r4, #0
    adds r3, #0x6a
    movs r5, #0
    ldrsh r3, [r3, r5]
    bl func_08009850
    adds r0, r4, #0
    bl Proc_Break
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_08009DC8

    thumb_func_start func_08009DFC
func_08009DFC: @ 0x08009DFC
    push {r4, r5, r6, lr}
    sub sp, #4
    adds r5, r0, #0
    ldr r3, [r5, #0x58]
    adds r3, #1
    str r3, [r5, #0x58]
    movs r1, #0x1e
    rsbs r1, r1, #0
    movs r0, #0xc
    str r0, [sp]
    movs r0, #4
    movs r2, #0
    bl func_08012FE8
    lsrs r1, r0, #0x1f
    adds r0, r0, r1
    asrs r4, r0, #1
    lsls r2, r4, #0x10
    lsrs r2, r2, #0x10
    movs r0, #1
    movs r1, #0
    bl SetBgOffset
    movs r0, #0x80
    lsls r0, r0, #1
    bl CheckTalkFlag
    adds r6, r0, #0
    cmp r6, #0
    bne .L08009E64
    ldr r3, .L08009E78 @ =gDispIo
    adds r2, r3, #0
    adds r2, #0x3c
    movs r0, #0x3f
    ldrb r1, [r2]
    ands r0, r1
    movs r1, #0x40
    orrs r0, r1
    strb r0, [r2]
    adds r1, r4, #0
    adds r1, #0x10
    adds r0, r3, #0
    adds r0, #0x44
    strb r1, [r0]
    movs r0, #1
    subs r0, r0, r4
    adds r1, r3, #0
    adds r1, #0x45
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x46
    strb r6, [r0]
.L08009E64:
    ldr r0, [r5, #0x58]
    cmp r0, #0xc
    bne .L08009E70
    adds r0, r5, #0
    bl Proc_Break
.L08009E70:
    add sp, #4
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08009E78: .4byte gDispIo
    func_end func_08009DFC

    thumb_func_start func_08009E7C
func_08009E7C: @ 0x08009E7C
    push {r4, r5, lr}
    adds r5, r0, #0
    ldr r0, .L08009ED8 @ =0x08B90B9C
    bl SpawnProcLocking
    adds r4, r0, #0
    adds r0, r5, #0
    bl func_08009F04
    adds r2, r4, #0
    adds r2, #0x64
    strh r0, [r2]
    adds r1, r4, #0
    adds r1, #0x66
    movs r0, #8
    strh r0, [r1]
    ldr r3, .L08009EDC @ =0x08B909B8
    ldr r0, [r3]
    ldrb r1, [r0, #0xe]
    adds r0, r4, #0
    adds r0, #0x68
    strh r1, [r0]
    adds r1, r4, #0
    adds r1, #0x6a
    movs r0, #6
    strh r0, [r1]
    movs r1, #0
    ldrsh r0, [r2, r1]
    cmp r0, #0
    bge .L08009EBC
    movs r0, #0
    strh r0, [r2]
.L08009EBC:
    movs r1, #0
    ldrsh r0, [r2, r1]
    cmp r0, #0x1d
    ble .L08009EC8
    movs r0, #0x1e
    strh r0, [r2]
.L08009EC8:
    ldr r0, [r3]
    strb r5, [r0, #0xf]
    ldr r1, [r3]
    ldrb r0, [r1, #0xe]
    strb r0, [r1, #0x10]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L08009ED8: .4byte 0x08B90B9C
.L08009EDC: .4byte 0x08B909B8
    func_end func_08009E7C

    thumb_func_start func_08009EE0
func_08009EE0: @ 0x08009EE0
    ldr r0, .L08009EFC @ =0x08B909B8
    ldr r1, [r0]
    movs r0, #0xf
    ldrsb r0, [r1, r0]
    ldrb r2, [r1, #0x11]
    cmp r0, r2
    bne .L08009F00
    ldrb r0, [r1, #0x10]
    ldrb r2, [r1, #0xe]
    cmp r0, r2
    bne .L08009F00
    movs r0, #1
    b .L08009F02
    .align 2, 0
.L08009EFC: .4byte 0x08B909B8
.L08009F00:
    movs r0, #0
.L08009F02:
    bx lr
    func_end func_08009EE0

    thumb_func_start func_08009F04
func_08009F04: @ 0x08009F04
    push {r4, lr}
    adds r4, r0, #0
    bl func_0804B1EC
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L08009F1E
    cmp r4, #2
    bgt .L08009F1A
    movs r0, #4
    b .L08009F26
.L08009F1A:
    movs r0, #0x1a
    b .L08009F26
.L08009F1E:
    ldr r0, .L08009F2C @ =0x08B90BCC
    lsls r1, r4, #2
    adds r1, r1, r0
    ldr r0, [r1]
.L08009F26:
    pop {r4}
    pop {r1}
    bx r1
    .align 2, 0
.L08009F2C: .4byte 0x08B90BCC
    func_end func_08009F04

    thumb_func_start func_08009F30
func_08009F30: @ 0x08009F30
    push {r4, r5, r6, lr}
    sub sp, #8
    adds r5, r0, #0
    adds r6, r1, #0
    ldr r0, .L08009F80 @ =0x08193DF8
    ldr r1, [r0, #4]
    ldr r0, [r0]
    str r0, [sp]
    str r1, [sp, #4]
    cmp r5, #0xff
    beq .L08009F76
    ldr r4, .L08009F84 @ =0x08B909B8
    ldr r0, [r4]
    lsls r5, r5, #2
    adds r0, #0x18
    adds r0, r0, r5
    ldr r0, [r0]
    bl func_08006D9C
    movs r1, #0x39
    rsbs r1, r1, #0
    ands r1, r0
    ldr r2, [r4]
    adds r0, r2, #0
    adds r0, #0x18
    adds r0, r0, r5
    ldr r0, [r0]
    orrs r1, r6
    ldrb r2, [r2, #0x17]
    lsls r2, r2, #2
    add r2, sp
    ldr r2, [r2]
    orrs r1, r2
    bl func_08006D68
.L08009F76:
    add sp, #8
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L08009F80: .4byte 0x08193DF8
.L08009F84: .4byte 0x08B909B8
    func_end func_08009F30

    thumb_func_start func_08009F88
func_08009F88: @ 0x08009F88
    push {lr}
    movs r1, #0x10
    bl func_08009F30
    pop {r0}
    bx r0
    func_end func_08009F88

    thumb_func_start func_08009F94
func_08009F94: @ 0x08009F94
    push {lr}
    movs r1, #0
    bl func_08009F30
    pop {r0}
    bx r0
    func_end func_08009F94

    thumb_func_start IsTalkActive
IsTalkActive: @ 0x08009FA0
    push {lr}
    ldr r0, .L08009FB4 @ =0x08B909D4
    bl Proc_Find
    cmp r0, #0
    beq .L08009FAE
    movs r0, #1
.L08009FAE:
    pop {r1}
    bx r1
    .align 2, 0
.L08009FB4: .4byte 0x08B909D4
    func_end IsTalkActive

    thumb_func_start FaceExists
FaceExists: @ 0x08009FB8
    push {lr}
    ldr r0, .L08009FCC @ =0x08B907C0
    bl Proc_Find
    cmp r0, #0
    beq .L08009FC6
    movs r0, #1
.L08009FC6:
    pop {r1}
    bx r1
    .align 2, 0
.L08009FCC: .4byte 0x08B907C0
    func_end FaceExists

    thumb_func_start GetTalkResult
GetTalkResult: @ 0x08009FD0
    ldr r0, .L08009FD8 @ =0x030000E0
    ldr r0, [r0]
    bx lr
    .align 2, 0
.L08009FD8: .4byte 0x030000E0
    func_end GetTalkResult

    thumb_func_start func_08009FDC
func_08009FDC: @ 0x08009FDC
    ldr r1, .L08009FE4 @ =0x030000E0
    str r0, [r1]
    bx lr
    .align 2, 0
.L08009FE4: .4byte 0x030000E0
    func_end func_08009FDC

    thumb_func_start func_08009FE8
func_08009FE8: @ 0x08009FE8
    ldr r1, .L08009FF0 @ =0x08B909B8
    ldr r1, [r1]
    str r0, [r1, #0x3c]
    bx lr
    .align 2, 0
.L08009FF0: .4byte 0x08B909B8
    func_end func_08009FE8

    thumb_func_start func_08009FF4
func_08009FF4: @ 0x08009FF4
    push {lr}
    adds r1, r0, #0
    ldr r0, .L0800A008 @ =0x08B909B8
    ldr r0, [r0]
    adds r0, #0x60
    bl strcpy
    pop {r0}
    bx r0
    .align 2, 0
.L0800A008: .4byte 0x08B909B8
    func_end func_08009FF4

    thumb_func_start func_0800A00C
func_0800A00C: @ 0x0800A00C
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    mov sl, r0
    adds r4, r1, #0
    str r2, [sp]
    mov sb, r3
    movs r6, #0
    mov r7, sl
    adds r5, r2, #0
    b .L0800A032
.L0800A028:
    ldr r0, [r7]
    adds r1, r4, #0
    bl Text_DrawCharacter
    adds r4, r0, #0
.L0800A032:
    movs r0, #0
    mov r8, r0
    ldrb r0, [r4]
    cmp r0, #0
    beq .L0800A058
    cmp r0, #1
    bne .L0800A052
    ldm r7!, {r0}
    adds r1, r5, #0
    bl func_08005590
    adds r5, #0x80
    adds r6, #1
    adds r4, #1
    cmp r6, sb
    bge .L0800A068
.L0800A052:
    mov r2, r8
    cmp r2, #0
    beq .L0800A028
.L0800A058:
    lsls r0, r6, #2
    add r0, sl
    ldr r0, [r0]
    lsls r1, r6, #7
    ldr r2, [sp]
    adds r1, r2, r1
    bl func_08005590
.L0800A068:
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_0800A00C

    thumb_func_start func_0800A078
func_0800A078: @ 0x0800A078
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #4
    adds r7, r0, #0
    ldr r1, [r7, #0x2c]
    ldr r2, [r7, #0x30]
    ldr r0, .L0800A0EC @ =0x08B90C06
    mov ip, r0
    movs r3, #0x52
    adds r3, r3, r7
    mov sb, r3
    ldr r4, .L0800A0F0 @ =0x000003FF
    mov sl, r4
    ldrh r6, [r3]
    ands r4, r6
    movs r0, #0x64
    adds r0, r0, r7
    mov r8, r0
    movs r5, #0xf
    adds r0, r5, #0
    mov r3, r8
    ldrh r3, [r3]
    ands r0, r3
    lsls r0, r0, #0xc
    orrs r4, r0
    str r4, [sp]
    movs r0, #3
    mov r3, ip
    bl func_080069F4
    ldr r1, [r7, #0x2c]
    ldr r2, [r7, #0x30]
    ldr r3, .L0800A0F4 @ =0x08B90BEC
    mov r6, sl
    mov r4, sb
    ldrh r4, [r4]
    ands r6, r4
    ldr r0, .L0800A0F8 @ =0x030000E8
    ldrh r0, [r0, #0x14]
    ands r5, r0
    lsls r5, r5, #0xc
    orrs r6, r5
    str r6, [sp]
    movs r0, #3
    bl func_080069F4
    add sp, #4
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800A0EC: .4byte 0x08B90C06
.L0800A0F0: .4byte 0x000003FF
.L0800A0F4: .4byte 0x08B90BEC
.L0800A0F8: .4byte 0x030000E8
    func_end func_0800A078

    thumb_func_start func_0800A0FC
func_0800A0FC: @ 0x0800A0FC
    push {lr}
    movs r0, #0
    bl SetOnHBlankA
    pop {r0}
    bx r0
    func_end func_0800A0FC

    thumb_func_start func_0800A108
func_0800A108: @ 0x0800A108
    push {lr}
    ldr r0, .L0800A118 @ =func_0800A0FC
    movs r1, #1
    bl func_08014B34
    pop {r0}
    bx r0
    .align 2, 0
.L0800A118: .4byte func_0800A0FC
    func_end func_0800A108

    thumb_func_start func_0800A11C
func_0800A11C: @ 0x0800A11C
    push {r4, r5, r6, r7, lr}
    mov r7, sb
    mov r6, r8
    push {r6, r7}
    sub sp, #0x24
    adds r4, r0, #0
    lsls r1, r1, #0x18
    lsrs r1, r1, #0x18
    mov r8, r1
    ldr r0, .L0800A150 @ =0x08B909B8
    ldr r0, [r0]
    movs r1, #0xf
    ldrsb r1, [r0, r1]
    mov sb, r1
    ldrb r5, [r0, #0x11]
    movs r6, #0
    movs r7, #0x18
.L0800A13E:
    ldrb r0, [r4]
    cmp r0, #0x81
    bls .L0800A146
    b .L0800A4B2
.L0800A146:
    lsls r0, r0, #2
    ldr r1, .L0800A154 @ =.L0800A158
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0800A150: .4byte 0x08B909B8
.L0800A154: .4byte .L0800A158
.L0800A158: @ jump table
    .4byte .L0800A360 @ case 0
    .4byte .L0800A36A @ case 1
    .4byte .L0800A36A @ case 2
    .4byte .L0800A376 @ case 3
    .4byte .L0800A372 @ case 4
    .4byte .L0800A372 @ case 5
    .4byte .L0800A372 @ case 6
    .4byte .L0800A372 @ case 7
    .4byte .L0800A37A @ case 8
    .4byte .L0800A37A @ case 9
    .4byte .L0800A37A @ case 10
    .4byte .L0800A37A @ case 11
    .4byte .L0800A37A @ case 12
    .4byte .L0800A37A @ case 13
    .4byte .L0800A37A @ case 14
    .4byte .L0800A37A @ case 15
    .4byte .L0800A380 @ case 16
    .4byte .L0800A39E @ case 17
    .4byte .L0800A3A4 @ case 18
    .4byte .L0800A3A4 @ case 19
    .4byte .L0800A3A4 @ case 20
    .4byte .L0800A3A4 @ case 21
    .4byte .L0800A372 @ case 22
    .4byte .L0800A372 @ case 23
    .4byte .L0800A3AC @ case 24
    .4byte .L0800A3AC @ case 25
    .4byte .L0800A3AC @ case 26
    .4byte .L0800A3AC @ case 27
    .4byte .L0800A372 @ case 28
    .4byte .L0800A4B2 @ case 29
    .4byte .L0800A4B2 @ case 30
    .4byte .L0800A4B2 @ case 31
    .4byte .L0800A4B2 @ case 32
    .4byte .L0800A4B2 @ case 33
    .4byte .L0800A4B2 @ case 34
    .4byte .L0800A4B2 @ case 35
    .4byte .L0800A4B2 @ case 36
    .4byte .L0800A4B2 @ case 37
    .4byte .L0800A4B2 @ case 38
    .4byte .L0800A4B2 @ case 39
    .4byte .L0800A4B2 @ case 40
    .4byte .L0800A4B2 @ case 41
    .4byte .L0800A4B2 @ case 42
    .4byte .L0800A4B2 @ case 43
    .4byte .L0800A4B2 @ case 44
    .4byte .L0800A4B2 @ case 45
    .4byte .L0800A4B2 @ case 46
    .4byte .L0800A4B2 @ case 47
    .4byte .L0800A4B2 @ case 48
    .4byte .L0800A4B2 @ case 49
    .4byte .L0800A4B2 @ case 50
    .4byte .L0800A4B2 @ case 51
    .4byte .L0800A4B2 @ case 52
    .4byte .L0800A4B2 @ case 53
    .4byte .L0800A4B2 @ case 54
    .4byte .L0800A4B2 @ case 55
    .4byte .L0800A4B2 @ case 56
    .4byte .L0800A4B2 @ case 57
    .4byte .L0800A4B2 @ case 58
    .4byte .L0800A4B2 @ case 59
    .4byte .L0800A4B2 @ case 60
    .4byte .L0800A4B2 @ case 61
    .4byte .L0800A4B2 @ case 62
    .4byte .L0800A4B2 @ case 63
    .4byte .L0800A4B2 @ case 64
    .4byte .L0800A4B2 @ case 65
    .4byte .L0800A4B2 @ case 66
    .4byte .L0800A4B2 @ case 67
    .4byte .L0800A4B2 @ case 68
    .4byte .L0800A4B2 @ case 69
    .4byte .L0800A4B2 @ case 70
    .4byte .L0800A4B2 @ case 71
    .4byte .L0800A4B2 @ case 72
    .4byte .L0800A4B2 @ case 73
    .4byte .L0800A4B2 @ case 74
    .4byte .L0800A4B2 @ case 75
    .4byte .L0800A4B2 @ case 76
    .4byte .L0800A4B2 @ case 77
    .4byte .L0800A4B2 @ case 78
    .4byte .L0800A4B2 @ case 79
    .4byte .L0800A4B2 @ case 80
    .4byte .L0800A4B2 @ case 81
    .4byte .L0800A4B2 @ case 82
    .4byte .L0800A4B2 @ case 83
    .4byte .L0800A4B2 @ case 84
    .4byte .L0800A4B2 @ case 85
    .4byte .L0800A4B2 @ case 86
    .4byte .L0800A4B2 @ case 87
    .4byte .L0800A4B2 @ case 88
    .4byte .L0800A4B2 @ case 89
    .4byte .L0800A4B2 @ case 90
    .4byte .L0800A4B2 @ case 91
    .4byte .L0800A4B2 @ case 92
    .4byte .L0800A4B2 @ case 93
    .4byte .L0800A4B2 @ case 94
    .4byte .L0800A4B2 @ case 95
    .4byte .L0800A4B2 @ case 96
    .4byte .L0800A4B2 @ case 97
    .4byte .L0800A4B2 @ case 98
    .4byte .L0800A4B2 @ case 99
    .4byte .L0800A4B2 @ case 100
    .4byte .L0800A4B2 @ case 101
    .4byte .L0800A4B2 @ case 102
    .4byte .L0800A4B2 @ case 103
    .4byte .L0800A4B2 @ case 104
    .4byte .L0800A4B2 @ case 105
    .4byte .L0800A4B2 @ case 106
    .4byte .L0800A4B2 @ case 107
    .4byte .L0800A4B2 @ case 108
    .4byte .L0800A4B2 @ case 109
    .4byte .L0800A4B2 @ case 110
    .4byte .L0800A4B2 @ case 111
    .4byte .L0800A4B2 @ case 112
    .4byte .L0800A4B2 @ case 113
    .4byte .L0800A4B2 @ case 114
    .4byte .L0800A4B2 @ case 115
    .4byte .L0800A4B2 @ case 116
    .4byte .L0800A4B2 @ case 117
    .4byte .L0800A4B2 @ case 118
    .4byte .L0800A4B2 @ case 119
    .4byte .L0800A4B2 @ case 120
    .4byte .L0800A4B2 @ case 121
    .4byte .L0800A4B2 @ case 122
    .4byte .L0800A4B2 @ case 123
    .4byte .L0800A4B2 @ case 124
    .4byte .L0800A4B2 @ case 125
    .4byte .L0800A4B2 @ case 126
    .4byte .L0800A4B2 @ case 127
    .4byte .L0800A3B0 @ case 128
    .4byte .L0800A4A6 @ case 129
.L0800A360:
    cmp r6, r7
    bgt .L0800A366
    b .L0800A4D8
.L0800A366:
    adds r7, r6, #0
    b .L0800A4D8
.L0800A36A:
    cmp r6, r7
    ble .L0800A370
    adds r7, r6, #0
.L0800A370:
    movs r6, #0
.L0800A372:
    adds r4, #1
    b .L0800A13E
.L0800A376:
    adds r6, #0xc
    b .L0800A372
.L0800A37A:
    ldrb r5, [r4]
    subs r5, #8
    b .L0800A372
.L0800A380:
    ldrb r0, [r4]
    cmp r0, #8
    bge .L0800A388
    b .L0800A13E
.L0800A388:
    cmp r0, #0xf
    ble .L0800A392
    cmp r0, #0x10
    beq .L0800A39A
    b .L0800A13E
.L0800A392:
    adds r5, r0, #0
    subs r5, #8
    adds r4, #1
    b .L0800A380
.L0800A39A:
    adds r4, #3
    b .L0800A380
.L0800A39E:
    cmp r5, sb
    beq .L0800A360
    b .L0800A372
.L0800A3A4:
    mov r2, r8
    cmp r2, #0
    beq .L0800A360
    b .L0800A372
.L0800A3AC:
    adds r6, #0x50
    b .L0800A372
.L0800A3B0:
    adds r4, #1
    ldrb r0, [r4]
    cmp r0, #0x25
    bls .L0800A3BA
    b .L0800A13E
.L0800A3BA:
    lsls r0, r0, #2
    ldr r1, .L0800A3C4 @ =.L0800A3C8
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0800A3C4: .4byte .L0800A3C8
.L0800A3C8: @ jump table
    .4byte .L0800A372 @ case 0
    .4byte .L0800A372 @ case 1
    .4byte .L0800A372 @ case 2
    .4byte .L0800A372 @ case 3
    .4byte .L0800A372 @ case 4
    .4byte .L0800A460 @ case 5
    .4byte .L0800A486 @ case 6
    .4byte .L0800A372 @ case 7
    .4byte .L0800A372 @ case 8
    .4byte .L0800A372 @ case 9
    .4byte .L0800A4A0 @ case 10
    .4byte .L0800A4A0 @ case 11
    .4byte .L0800A4A0 @ case 12
    .4byte .L0800A4A0 @ case 13
    .4byte .L0800A4A0 @ case 14
    .4byte .L0800A4A0 @ case 15
    .4byte .L0800A4A0 @ case 16
    .4byte .L0800A4A0 @ case 17
    .4byte .L0800A13E @ case 18
    .4byte .L0800A13E @ case 19
    .4byte .L0800A13E @ case 20
    .4byte .L0800A13E @ case 21
    .4byte .L0800A372 @ case 22
    .4byte .L0800A372 @ case 23
    .4byte .L0800A372 @ case 24
    .4byte .L0800A372 @ case 25
    .4byte .L0800A372 @ case 26
    .4byte .L0800A372 @ case 27
    .4byte .L0800A372 @ case 28
    .4byte .L0800A372 @ case 29
    .4byte .L0800A372 @ case 30
    .4byte .L0800A372 @ case 31
    .4byte .L0800A47C @ case 32
    .4byte .L0800A372 @ case 33
    .4byte .L0800A13E @ case 34
    .4byte .L0800A13E @ case 35
    .4byte .L0800A372 @ case 36
    .4byte .L0800A372 @ case 37
.L0800A460:
    ldr r0, .L0800A478 @ =0x08B909B8
    ldr r0, [r0]
    ldr r0, [r0, #0x3c]
    mov r1, sp
    bl func_08014590
    mov r0, r8
    lsls r1, r0, #0x18
    asrs r1, r1, #0x18
    mov r0, sp
    b .L0800A492
    .align 2, 0
.L0800A478: .4byte 0x08B909B8
.L0800A47C:
    bl func_0802E6E4
    bl func_080055FC
    b .L0800A496
.L0800A486:
    ldr r0, .L0800A49C @ =0x08B909B8
    ldr r0, [r0]
    adds r0, #0x60
    mov r2, r8
    lsls r1, r2, #0x18
    asrs r1, r1, #0x18
.L0800A492:
    bl func_0800A11C
.L0800A496:
    adds r6, r6, r0
    b .L0800A372
    .align 2, 0
.L0800A49C: .4byte 0x08B909B8
.L0800A4A0:
    ldrb r5, [r4]
    subs r5, #0xa
    b .L0800A372
.L0800A4A6:
    ldrb r0, [r4, #1]
    cmp r0, #0x40
    bne .L0800A4B2
    adds r4, #2
    adds r6, #6
    b .L0800A13E
.L0800A4B2:
    cmp r5, sb
    beq .L0800A4C8
    cmp r5, #0xff
    beq .L0800A4C8
    mov r1, r8
    cmp r1, #0
    beq .L0800A4C2
    b .L0800A360
.L0800A4C2:
    movs r2, #1
    mov r8, r2
    mov sb, r5
.L0800A4C8:
    add r1, sp, #0x20
    adds r0, r4, #0
    bl func_08005658
    adds r4, r0, #0
    ldr r0, [sp, #0x20]
    adds r6, r6, r0
    b .L0800A13E
.L0800A4D8:
    adds r0, r7, #0
    add sp, #0x24
    pop {r3, r4}
    mov r8, r3
    mov sb, r4
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end func_0800A11C

    thumb_func_start func_0800A4E8
func_0800A4E8: @ 0x0800A4E8
    movs r0, #0
    bx lr
    func_end func_0800A4E8

    thumb_func_start func_0800A4EC
func_0800A4EC: @ 0x0800A4EC
    bx lr
    func_end func_0800A4EC

    thumb_func_start func_0800A4F0
func_0800A4F0: @ 0x0800A4F0
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #0x20
    bl CheckTalkFlag
    cmp r0, #0
    bne .L0800A504
    adds r0, r4, #0
    bl EnableBgSync
.L0800A504:
    pop {r4}
    pop {r0}
    bx r0
    func_end func_0800A4F0

    thumb_func_start func_0800A50C
func_0800A50C: @ 0x0800A50C
    push {lr}
    ldr r0, .L0800A520 @ =0x08B90C80
    bl Proc_Find
    cmp r0, #0
    beq .L0800A51A
    movs r0, #1
.L0800A51A:
    pop {r1}
    bx r1
    .align 2, 0
.L0800A520: .4byte 0x08B90C80
    func_end func_0800A50C

    thumb_func_start func_0800A524
func_0800A524: @ 0x0800A524
    push {lr}
    ldr r0, .L0800A530 @ =0x08B90C80
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L0800A530: .4byte 0x08B90C80
    func_end func_0800A524

    thumb_func_start func_0800A534
func_0800A534: @ 0x0800A534
    push {r4, r5, r6, lr}
    mov r6, r8
    push {r6}
    adds r4, r0, #0
    adds r5, r1, #0
    adds r6, r2, #0
    mov r8, r3
    ldr r0, .L0800A56C @ =0x08B90C80
    movs r1, #0
    bl SpawnProc
    ldr r1, .L0800A570 @ =0x000003FF
    ands r1, r4
    lsls r1, r1, #5
    ldr r2, .L0800A574 @ =0x06010000
    adds r1, r1, r2
    str r1, [r0, #0x4c]
    str r5, [r0, #0x54]
    str r6, [r0, #0x58]
    ldr r0, .L0800A578 @ =0x08B90C68
    mov r1, r8
    bl SpawnProcLocking
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800A56C: .4byte 0x08B90C80
.L0800A570: .4byte 0x000003FF
.L0800A574: .4byte 0x06010000
.L0800A578: .4byte 0x08B90C68
    func_end func_0800A534

    thumb_func_start func_0800A57C
func_0800A57C: @ 0x0800A57C
    adds r0, #0x64
    movs r1, #0
    strh r1, [r0]
    bx lr
    func_end func_0800A57C

    thumb_func_start func_0800A584
func_0800A584: @ 0x0800A584
    push {r4, r5, r6, r7, lr}
    adds r3, r0, #0
    ldr r6, [r3, #0x4c]
    movs r1, #0
    b .L0800A5E0
.L0800A58E:
    movs r2, #0
    lsls r0, r1, #2
    adds r5, r1, #0
    adds r5, #8
    adds r4, r0, r6
.L0800A598:
    lsls r0, r2, #2
    adds r1, r0, r4
    ldr r0, [r1, #4]
    str r0, [r1]
    ldr r0, [r1, #8]
    str r0, [r1, #4]
    ldr r0, [r1, #0xc]
    str r0, [r1, #8]
    ldr r0, [r1, #0x10]
    str r0, [r1, #0xc]
    ldr r0, [r1, #0x14]
    str r0, [r1, #0x10]
    ldr r0, [r1, #0x18]
    str r0, [r1, #0x14]
    ldr r0, [r1, #0x1c]
    str r0, [r1, #0x18]
    ldr r0, .L0800A5C8 @ =0x000002FF
    cmp r2, r0
    bgt .L0800A5CC
    movs r7, #0x80
    lsls r7, r7, #3
    adds r0, r1, r7
    ldr r0, [r0]
    b .L0800A5CE
    .align 2, 0
.L0800A5C8: .4byte 0x000002FF
.L0800A5CC:
    ldr r0, [r3, #0x58]
.L0800A5CE:
    str r0, [r1, #0x1c]
    movs r0, #0x80
    lsls r0, r0, #1
    adds r2, r2, r0
    movs r0, #0xc0
    lsls r0, r0, #2
    cmp r2, r0
    ble .L0800A598
    adds r1, r5, #0
.L0800A5E0:
    ldr r0, [r3, #0x54]
    lsls r0, r0, #3
    cmp r1, r0
    blt .L0800A58E
    adds r1, r3, #0
    adds r1, #0x64
    ldrh r0, [r1]
    adds r0, #1
    strh r0, [r1]
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    cmp r0, #0xf
    ble .L0800A600
    adds r0, r3, #0
    bl Proc_Break
.L0800A600:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_0800A584

    thumb_func_start func_0800A608
func_0800A608: @ 0x0800A608
    ldr r1, .L0800A614 @ =0x08B90C98
    ldr r0, [r1]
    adds r0, #1
    str r0, [r1]
    bx lr
    .align 2, 0
.L0800A614: .4byte 0x08B90C98
    func_end func_0800A608

    thumb_func_start LoadUnitWrapper
LoadUnitWrapper: @ 0x0800A618
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r7, r1, #0
    bl UnitInfoRequiresNoMovement
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800A6F8
    movs r0, #6
    ldrb r1, [r5, #3]
    ands r0, r1
    cmp r0, #0
    beq .L0800A662
    movs r6, #0
    ldrb r0, [r5]
    movs r1, #0
    bl func_08017D70
    adds r4, r0, #0
    cmp r4, #0
    beq .L0800A66E
    ldrb r2, [r5, #3]
    lsls r0, r2, #0x1d
    lsrs r0, r0, #0x1e
    cmp r0, #1
    beq .L0800A658
    cmp r0, #1
    ble .L0800A65A
    cmp r0, #2
    bne .L0800A65A
    movs r6, #0x80
    b .L0800A65A
.L0800A658:
    movs r6, #0x40
.L0800A65A:
    adds r0, r4, #0
    adds r1, r6, #0
    bl UnitChangeFaction
.L0800A662:
    ldrb r0, [r5]
    bl GetUnitByPid
    adds r4, r0, #0
    cmp r4, #0
    bne .L0800A682
.L0800A66E:
    adds r0, r5, #0
    bl CreateUnit
    adds r4, r0, #0
    ldr r0, [r4, #0xc]
    movs r1, #0x80
    lsls r1, r1, #0xf
    orrs r0, r1
    str r0, [r4, #0xc]
    b .L0800A6B4
.L0800A682:
    adds r0, r4, #0
    bl func_08079954
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0800A69E
    adds r0, r4, #0
    adds r1, r5, #0
    bl func_080178F4
    ldr r0, [r4, #0xc]
    ldr r1, .L0800A700 @ =0xFFFEFFFF
    ands r0, r1
    str r0, [r4, #0xc]
.L0800A69E:
    adds r0, r4, #0
    bl func_08079A14
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800A6B4
    ldr r0, [r4, #0xc]
    movs r1, #4
    ands r0, r1
    cmp r0, #0
    bne .L0800A6F8
.L0800A6B4:
    ldrb r0, [r5, #4]
    strb r0, [r4, #0x10]
    ldrb r0, [r5, #5]
    strb r0, [r4, #0x11]
    ldr r1, .L0800A704 @ =gPlayStatus
    movs r0, #0x40
    ldrb r2, [r1, #0x14]
    ands r0, r2
    cmp r0, #0
    beq .L0800A6E8
    ldrb r0, [r1, #0x1b]
    cmp r0, #3
    bne .L0800A6E8
    movs r0, #6
    ldrb r2, [r5, #3]
    ands r0, r2
    cmp r0, #4
    bne .L0800A6E8
    movs r0, #0xe
    ldrsb r0, [r1, r0]
    bl GetChapterInfo
    ldrb r1, [r0, #0x14]
    adds r0, r4, #0
    bl UnitApplyBonusLevels
.L0800A6E8:
    adds r0, r5, #0
    adds r1, r4, #0
    adds r2, r7, #0
    movs r3, #1
    bl func_0800A71C
    bl RefreshEntityMaps
.L0800A6F8:
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800A700: .4byte 0xFFFEFFFF
.L0800A704: .4byte gPlayStatus
    func_end LoadUnitWrapper

    thumb_func_start FakeLoadUnit
FakeLoadUnit: @ 0x0800A708
    push {lr}
    movs r2, #0
    movs r3, #0
    bl func_0800A71C
    bl RefreshEntityMaps
    pop {r0}
    bx r0
    func_end FakeLoadUnit

    thumb_func_start func_0800A71C
func_0800A71C: @ 0x0800A71C
    push {r4, r5, r6, r7, lr}
    sub sp, #4
    adds r4, r0, #0
    adds r6, r1, #0
    adds r7, r2, #0
    lsls r3, r3, #0x18
    lsrs r3, r3, #0x18
    cmp r6, #0
    beq .L0800A796
    cmp r3, #0
    beq .L0800A786
    cmp r7, #0
    beq .L0800A774
    ldr r5, [r6, #0xc]
    movs r0, #0x80
    ands r5, r0
    cmp r5, #0
    bne .L0800A774
    ldrb r1, [r4, #4]
    ldrb r2, [r4, #5]
    adds r0, r6, #0
    movs r3, #0
    bl TryMoveUnit
    bl RefreshUnitSprites
    ldr r0, .L0800A770 @ =0x0000FFFF
    adds r1, r0, #0
    ldrh r2, [r4, #4]
    ands r1, r2
    ldrh r2, [r4, #6]
    ands r0, r2
    cmp r1, r0
    beq .L0800A796
    ldrb r2, [r4, #6]
    ldrb r3, [r4, #7]
    str r5, [sp]
    adds r0, r7, #0
    adds r1, r6, #0
    bl TryMoveUnitDisplayed
    b .L0800A796
    .align 2, 0
.L0800A770: .4byte 0x0000FFFF
.L0800A774:
    ldrb r1, [r4, #6]
    ldrb r2, [r4, #7]
    adds r0, r6, #0
    movs r3, #1
    bl TryMoveUnit
    bl RefreshUnitSprites
    b .L0800A796
.L0800A786:
    ldrb r1, [r4, #6]
    ldrb r2, [r4, #7]
    adds r0, r6, #0
    movs r3, #1
    bl TryMoveUnit
    bl RefreshUnitSprites
.L0800A796:
    add sp, #4
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end func_0800A71C

    thumb_func_start func_0800A7A0
func_0800A7A0: @ 0x0800A7A0
    ldr r0, .L0800A7B4 @ =gKeys
    ldr r1, [r0]
    movs r0, #0x80
    lsls r0, r0, #1
    ldrh r1, [r1, #4]
    ands r0, r1
    cmp r0, #0
    bne .L0800A7B8
    movs r0, #0
    b .L0800A7BA
    .align 2, 0
.L0800A7B4: .4byte gKeys
.L0800A7B8:
    movs r0, #1
.L0800A7BA:
    bx lr
    func_end func_0800A7A0

    thumb_func_start func_0800A7BC
func_0800A7BC: @ 0x0800A7BC
    ldr r1, .L0800A7C8 @ =0x03000100
    movs r0, #0
    str r0, [r1]
    movs r0, #1
    bx lr
    .align 2, 0
.L0800A7C8: .4byte 0x03000100
    func_end func_0800A7BC

    thumb_func_start func_0800A7CC
func_0800A7CC: @ 0x0800A7CC
    ldr r0, .L0800A7DC @ =0x08B90C9C
    ldr r2, .L0800A7E0 @ =0x03000100
    ldr r1, [r2]
    adds r0, r1, r0
    ldrb r0, [r0]
    adds r1, #1
    str r1, [r2]
    bx lr
    .align 2, 0
.L0800A7DC: .4byte 0x08B90C9C
.L0800A7E0: .4byte 0x03000100
    func_end func_0800A7CC

    thumb_func_start func_0800A7E4
func_0800A7E4: @ 0x0800A7E4
    push {r4, r5, r6, lr}
    sub sp, #0x10
    adds r6, r0, #0
    movs r4, #0
    ldr r5, [r6, #0x2c]
    b .L0800A906
.L0800A7F0:
    ldrb r0, [r5]
    subs r0, #1
    cmp r0, #0xb
    bls .L0800A7FA
    b .L0800A904
.L0800A7FA:
    lsls r0, r0, #2
    ldr r1, .L0800A804 @ =.L0800A808
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0800A804: .4byte .L0800A808
.L0800A808: @ jump table
    .4byte .L0800A900 @ case 0
    .4byte .L0800A8C4 @ case 1
    .4byte .L0800A8D8 @ case 2
    .4byte .L0800A8EC @ case 3
    .4byte .L0800A8AC @ case 4
    .4byte .L0800A898 @ case 5
    .4byte .L0800A8A4 @ case 6
    .4byte .L0800A904 @ case 7
    .4byte .L0800A854 @ case 8
    .4byte .L0800A874 @ case 9
    .4byte .L0800A842 @ case 10
    .4byte .L0800A838 @ case 11
.L0800A838:
    ldr r1, [r5, #4]
    adds r0, r6, #0
    adds r0, #0x48
    strh r1, [r0]
    b .L0800A904
.L0800A842:
    ldr r0, .L0800A850 @ =0x0300010C
    ldr r0, [r0]
    mov r1, sp
    bl func_08014590
    lsls r0, r0, #3
    b .L0800A902
    .align 2, 0
.L0800A850: .4byte 0x0300010C
.L0800A854:
    adds r0, r6, #0
    adds r0, #0x44
    strb r4, [r0]
    ldr r0, .L0800A870 @ =0x03000108
    ldrh r0, [r0]
    bl GetItemIcon
    strh r0, [r6, #0x3e]
    adds r0, r6, #0
    adds r0, #0x42
    ldrb r1, [r0]
    movs r0, #0
    b .L0800A88A
    .align 2, 0
.L0800A870: .4byte 0x03000108
.L0800A874:
    adds r0, r6, #0
    adds r0, #0x44
    strb r4, [r0]
    ldr r0, .L0800A894 @ =0x03000108
    ldrh r0, [r0]
    adds r0, #0x70
    strh r0, [r6, #0x3e]
    adds r0, r6, #0
    adds r0, #0x42
    ldrb r1, [r0]
    movs r0, #1
.L0800A88A:
    bl ApplyIconPalette
    adds r4, #0x10
    b .L0800A904
    .align 2, 0
.L0800A894: .4byte 0x03000108
.L0800A898:
    ldr r0, [r5, #4]
    bl GetMsg
    bl func_080055FC
    b .L0800A902
.L0800A8A4:
    ldr r0, [r5, #4]
    bl func_080055FC
    b .L0800A902
.L0800A8AC:
    ldr r0, .L0800A8C0 @ =0x03000104
    ldr r0, [r0]
    ldr r0, [r0]
    ldrh r0, [r0]
    bl GetMsg
    bl func_080055FC
    b .L0800A902
    .align 2, 0
.L0800A8C0: .4byte 0x03000104
.L0800A8C4:
    ldr r0, .L0800A8D4 @ =0x03000108
    ldrh r0, [r0]
    bl GetItemName
    bl func_080055FC
    b .L0800A902
    .align 2, 0
.L0800A8D4: .4byte 0x03000108
.L0800A8D8:
    ldr r0, .L0800A8E8 @ =0x03000108
    ldrh r0, [r0]
    movs r1, #1
    bl GetItemNameWithArticle
    bl func_080055FC
    b .L0800A902
    .align 2, 0
.L0800A8E8: .4byte 0x03000108
.L0800A8EC:
    ldr r0, .L0800A8FC @ =0x03000108
    ldrh r0, [r0]
    movs r1, #0
    bl GetItemNameWithArticle
    bl func_080055FC
    b .L0800A902
    .align 2, 0
.L0800A8FC: .4byte 0x03000108
.L0800A900:
    ldr r0, [r5, #4]
.L0800A902:
    adds r4, r4, r0
.L0800A904:
    adds r5, #8
.L0800A906:
    ldrb r0, [r5]
    cmp r0, #0
    beq .L0800A90E
    b .L0800A7F0
.L0800A90E:
    adds r0, r4, #0
    add sp, #0x10
    pop {r4, r5, r6}
    pop {r1}
    bx r1
    func_end func_0800A7E4

    thumb_func_start func_0800A918
func_0800A918: @ 0x0800A918
    push {r4, r5, lr}
    sub sp, #0x18
    adds r5, r0, #0
    str r1, [sp, #0x10]
    str r2, [sp, #0x14]
    b .L0800AA02
.L0800A924:
    ldrb r0, [r5]
    subs r0, #1
    cmp r0, #0xa
    bhi .L0800AA00
    lsls r0, r0, #2
    ldr r1, .L0800A938 @ =.L0800A93C
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0800A938: .4byte .L0800A93C
.L0800A93C: @ jump table
    .4byte .L0800A9F8 @ case 0
    .4byte .L0800A9BC @ case 1
    .4byte .L0800A9CC @ case 2
    .4byte .L0800A9DC @ case 3
    .4byte .L0800A9A8 @ case 4
    .4byte .L0800A994 @ case 5
    .4byte .L0800A99E @ case 6
    .4byte .L0800A98A @ case 7
    .4byte .L0800A980 @ case 8
    .4byte .L0800A980 @ case 9
    .4byte .L0800A968 @ case 10
.L0800A968:
    ldr r0, .L0800A97C @ =0x0300010C
    ldr r0, [r0]
    mov r1, sp
    bl func_08014590
    add r0, sp, #0x10
    mov r1, sp
    bl Text_DrawString
    b .L0800AA00
    .align 2, 0
.L0800A97C: .4byte 0x0300010C
.L0800A980:
    add r0, sp, #0x10
    movs r1, #0x10
    bl Text_Skip
    b .L0800AA00
.L0800A98A:
    add r0, sp, #0x10
    ldr r1, [r5, #4]
    bl Text_SetColor
    b .L0800AA00
.L0800A994:
    add r4, sp, #0x10
    ldr r0, [r5, #4]
    bl GetMsg
    b .L0800A9E8
.L0800A99E:
    add r0, sp, #0x10
    ldr r1, [r5, #4]
    bl Text_DrawString
    b .L0800AA00
.L0800A9A8:
    add r4, sp, #0x10
    ldr r0, .L0800A9B8 @ =0x03000104
    ldr r0, [r0]
    ldr r0, [r0]
    ldrh r0, [r0]
    bl GetMsg
    b .L0800A9E8
    .align 2, 0
.L0800A9B8: .4byte 0x03000104
.L0800A9BC:
    add r4, sp, #0x10
    ldr r0, .L0800A9C8 @ =0x03000108
    ldrh r0, [r0]
    bl GetItemName
    b .L0800A9E8
    .align 2, 0
.L0800A9C8: .4byte 0x03000108
.L0800A9CC:
    add r4, sp, #0x10
    ldr r0, .L0800A9D8 @ =0x03000108
    ldrh r0, [r0]
    movs r1, #1
    b .L0800A9E4
    .align 2, 0
.L0800A9D8: .4byte 0x03000108
.L0800A9DC:
    add r4, sp, #0x10
    ldr r0, .L0800A9F4 @ =0x03000108
    ldrh r0, [r0]
    movs r1, #0
.L0800A9E4:
    bl GetItemNameWithArticle
.L0800A9E8:
    adds r1, r0, #0
    adds r0, r4, #0
    bl Text_DrawString
    b .L0800AA00
    .align 2, 0
.L0800A9F4: .4byte 0x03000108
.L0800A9F8:
    add r0, sp, #0x10
    ldr r1, [r5, #4]
    bl Text_Skip
.L0800AA00:
    adds r5, #8
.L0800AA02:
    ldrb r0, [r5]
    cmp r0, #0
    bne .L0800A924
    movs r0, #3
    bl EnableBgSync
    add sp, #0x18
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_0800A918

    thumb_func_start func_0800AA18
func_0800AA18: @ 0x0800AA18
    adds r3, r0, #0
    adds r2, r3, #0
    adds r2, #0x34
    movs r0, #0xff
    ldrb r1, [r2]
    orrs r1, r0
    strb r1, [r2]
    adds r1, r3, #0
    adds r1, #0x35
    ldrb r2, [r1]
    orrs r0, r2
    strb r0, [r1]
    adds r0, r3, #0
    adds r0, #0x3b
    movs r1, #0
    strb r1, [r0]
    ldr r0, .L0800AA48 @ =0x0000FFFF
    strh r0, [r3, #0x3e]
    adds r0, r3, #0
    adds r0, #0x44
    strb r1, [r0]
    adds r0, #4
    strh r1, [r0]
    bx lr
    .align 2, 0
.L0800AA48: .4byte 0x0000FFFF
    func_end func_0800AA18

    thumb_func_start func_0800AA4C
func_0800AA4C: @ 0x0800AA4C
    push {r4, lr}
    adds r4, r0, #0
    movs r0, #0
    bl GetBgChrOffset
    adds r1, r0, #0
    ldr r0, .L0800AAB4 @ =0x06002000
    adds r1, r1, r0
    movs r2, #0x80
    lsls r2, r2, #1
    movs r0, #0
    movs r3, #0
    bl InitTextFont
    bl ClearIcons
    bl LoadUiFrameGraphics
    ldr r3, .L0800AAB8 @ =gDispIo
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
    movs r0, #0x21
    rsbs r0, r0, #0
    ldrb r1, [r3, #1]
    ands r0, r1
    movs r1, #0x41
    rsbs r1, r1, #0
    ands r0, r1
    movs r1, #0x7f
    ands r0, r1
    strb r0, [r3, #1]
    adds r0, r4, #0
    bl func_0800A7E4
    adds r4, #0x46
    strh r0, [r4]
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800AAB4: .4byte 0x06002000
.L0800AAB8: .4byte gDispIo
    func_end func_0800AA4C

    thumb_func_start func_0800AABC
func_0800AABC: @ 0x0800AABC
    push {lr}
    adds r3, r0, #0
    adds r0, #0x48
    ldrh r0, [r0]
    cmp r0, #0
    beq .L0800AAD4
    movs r0, #0x80
    lsls r0, r0, #1
    movs r1, #0x80
    movs r2, #0x10
    bl StartBgmVolumeChange
.L0800AAD4:
    pop {r0}
    bx r0
    func_end func_0800AABC

    thumb_func_start func_0800AAD8
func_0800AAD8: @ 0x0800AAD8
    push {lr}
    adds r1, r0, #0
    adds r1, #0x48
    ldrh r0, [r1]
    cmp r0, #0
    beq .L0800AAF6
    ldr r0, .L0800AAFC @ =gPlayStatus
    adds r0, #0x41
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    cmp r0, #0
    blt .L0800AAF6
    ldrh r0, [r1]
    bl m4aSongNumStart
.L0800AAF6:
    pop {r0}
    bx r0
    .align 2, 0
.L0800AAFC: .4byte gPlayStatus
    func_end func_0800AAD8

    thumb_func_start func_0800AB00
func_0800AB00: @ 0x0800AB00
    push {lr}
    adds r3, r0, #0
    adds r0, #0x48
    ldrh r0, [r0]
    cmp r0, #0
    beq .L0800AB18
    movs r1, #0x80
    lsls r1, r1, #1
    movs r0, #0x80
    movs r2, #0x10
    bl StartBgmVolumeChange
.L0800AB18:
    pop {r0}
    bx r0
    func_end func_0800AB00

    thumb_func_start func_0800AB1C
func_0800AB1C: @ 0x0800AB1C
    push {r4, lr}
    ldr r4, [r0, #0x2c]
    ldr r1, [r0, #0x30]
    ldr r2, .L0800AB34 @ =0x08B905B8
    adds r0, #0x4a
    ldrh r3, [r0]
    adds r0, r4, #0
    bl PutOamHiRam
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800AB34: .4byte 0x08B905B8
    func_end func_0800AB1C

    thumb_func_start func_0800AB38
func_0800AB38: @ 0x0800AB38
    push {r4, r5, r6, r7, lr}
    mov r7, sl
    mov r6, sb
    mov r5, r8
    push {r5, r6, r7}
    sub sp, #0x10
    adds r5, r0, #0
    bl func_0800A7E4
    adds r2, r5, #0
    adds r2, #0x46
    strh r0, [r2]
    lsls r1, r0, #0x10
    lsrs r6, r1, #0x13
    movs r1, #7
    ands r1, r0
    cmp r1, #0
    beq .L0800AB5E
    adds r6, #1
.L0800AB5E:
    lsls r0, r6, #3
    ldrh r2, [r2]
    subs r0, r0, r2
    asrs r0, r0, #1
    mov sb, r0
    adds r2, r5, #0
    adds r2, #0x34
    movs r1, #0
    ldrsb r1, [r2, r1]
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    bne .L0800AB82
    movs r0, #0x1e
    subs r0, r0, r6
    asrs r0, r0, #1
    subs r7, r0, #1
    b .L0800AB86
.L0800AB82:
    movs r7, #0
    ldrsb r7, [r2, r7]
.L0800AB86:
    adds r2, r5, #0
    adds r2, #0x35
    movs r1, #0
    ldrsb r1, [r2, r1]
    movs r0, #1
    rsbs r0, r0, #0
    movs r3, #8
    mov r8, r3
    cmp r1, r0
    beq .L0800AB9E
    adds r2, r1, #0
    mov r8, r2
.L0800AB9E:
    adds r4, r6, #2
    adds r0, r5, #0
    adds r0, #0x36
    ldrb r0, [r0]
    str r0, [sp]
    adds r0, r7, #0
    mov r1, r8
    adds r2, r4, #0
    movs r3, #4
    bl func_08049CE4
    movs r0, #0x37
    adds r0, r0, r5
    mov sl, r0
    strb r7, [r0]
    adds r1, r5, #0
    adds r1, #0x38
    str r1, [sp, #0xc]
    mov r2, r8
    strb r2, [r1]
    adds r0, r5, #0
    adds r0, #0x39
    strb r4, [r0]
    adds r1, #2
    movs r0, #3
    strb r0, [r1]
    adds r4, r5, #0
    adds r4, #0x44
    ldrb r0, [r4]
    add r0, sb
    strb r0, [r4]
    add r0, sp, #4
    adds r1, r6, #0
    bl InitText
    adds r0, r5, #0
    adds r0, #0x3b
    ldrb r1, [r0]
    add r0, sp, #4
    bl Text_SetColor
    add r0, sp, #4
    mov r1, sb
    bl Text_SetCursor
    ldr r0, [r5, #0x2c]
    ldr r1, [sp, #4]
    ldr r2, [sp, #8]
    bl func_0800A918
    ldr r6, .L0800AC80 @ =0x0000FFFF
    ldrh r3, [r5, #0x3e]
    cmp r3, r6
    beq .L0800AC16
    ldrh r0, [r5, #0x3e]
    adds r1, r5, #0
    adds r1, #0x40
    ldrh r1, [r1]
    bl ApplyIconObjImg
.L0800AC16:
    mov r1, r8
    adds r1, #1
    lsls r1, r1, #5
    adds r1, #1
    adds r1, r1, r7
    lsls r1, r1, #1
    ldr r0, .L0800AC84 @ =gBg0Tm
    adds r1, r1, r0
    add r0, sp, #4
    bl func_08005590
    bl ResetText
    ldrh r0, [r5, #0x3e]
    cmp r0, r6
    beq .L0800AC6E
    ldr r0, .L0800AC88 @ =0x08B90D00
    adds r1, r5, #0
    bl SpawnProc
    mov r2, sl
    ldrb r1, [r2]
    adds r1, #1
    lsls r1, r1, #3
    ldrb r4, [r4]
    adds r1, r4, r1
    str r1, [r0, #0x2c]
    ldr r3, [sp, #0xc]
    ldrb r1, [r3]
    adds r1, #1
    lsls r1, r1, #3
    str r1, [r0, #0x30]
    adds r3, r5, #0
    adds r3, #0x40
    adds r2, r5, #0
    adds r2, #0x42
    movs r1, #0xf
    ldrb r2, [r2]
    ands r1, r2
    lsls r1, r1, #0xc
    ldrh r3, [r3]
    orrs r1, r3
    adds r0, #0x4a
    strh r1, [r0]
.L0800AC6E:
    add sp, #0x10
    pop {r3, r4, r5}
    mov r8, r3
    mov sb, r4
    mov sl, r5
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800AC80: .4byte 0x0000FFFF
.L0800AC84: .4byte gBg0Tm
.L0800AC88: .4byte 0x08B90D00
    func_end func_0800AB38

    thumb_func_start func_0800AC8C
func_0800AC8C: @ 0x0800AC8C
    push {lr}
    adds r1, r0, #0
    ldr r0, [r1, #0x30]
    cmp r0, #0
    bge .L0800ACAC
    ldr r0, .L0800ACA8 @ =gKeys
    ldr r0, [r0]
    ldrh r0, [r0, #8]
    cmp r0, #0
    beq .L0800ACBE
    adds r0, r1, #0
    bl Proc_Break
    b .L0800ACBE
    .align 2, 0
.L0800ACA8: .4byte gKeys
.L0800ACAC:
    cmp r0, #0
    beq .L0800ACBE
    subs r0, #1
    str r0, [r1, #0x30]
    cmp r0, #0
    bne .L0800ACBE
    adds r0, r1, #0
    bl Proc_Break
.L0800ACBE:
    pop {r0}
    bx r0
    func_end func_0800AC8C

    thumb_func_start func_0800ACC4
func_0800ACC4: @ 0x0800ACC4
    push {r4, r5, r6, r7, lr}
    adds r2, r0, #0
    adds r5, r2, #0
    adds r5, #0x38
    ldrb r1, [r5]
    lsls r0, r1, #5
    adds r7, r2, #0
    adds r7, #0x37
    ldrb r1, [r7]
    adds r0, r1, r0
    lsls r0, r0, #1
    ldr r1, .L0800AD14 @ =gBg0Tm
    adds r0, r0, r1
    adds r6, r2, #0
    adds r6, #0x39
    ldrb r1, [r6]
    adds r4, r2, #0
    adds r4, #0x3a
    ldrb r2, [r4]
    movs r3, #0
    bl TmFillRect_thm
    ldrb r5, [r5]
    lsls r0, r5, #5
    ldrb r7, [r7]
    adds r0, r7, r0
    lsls r0, r0, #1
    ldr r1, .L0800AD18 @ =gBg1Tm
    adds r0, r0, r1
    ldrb r1, [r6]
    ldrb r2, [r4]
    movs r3, #0
    bl TmFillRect_thm
    movs r0, #3
    bl EnableBgSync
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    .align 2, 0
.L0800AD14: .4byte gBg0Tm
.L0800AD18: .4byte gBg1Tm
    func_end func_0800ACC4

    thumb_func_start func_0800AD1C
func_0800AD1C: @ 0x0800AD1C
    ldr r1, .L0800AD24 @ =0x03000104
    str r0, [r1]
    bx lr
    .align 2, 0
.L0800AD24: .4byte 0x03000104
    func_end func_0800AD1C

    thumb_func_start func_0800AD28
func_0800AD28: @ 0x0800AD28
    ldr r1, .L0800AD30 @ =0x03000108
    strh r0, [r1]
    bx lr
    .align 2, 0
.L0800AD30: .4byte 0x03000108
    func_end func_0800AD28

    thumb_func_start func_0800AD34
func_0800AD34: @ 0x0800AD34
    ldr r1, .L0800AD3C @ =0x0300010C
    str r0, [r1]
    bx lr
    .align 2, 0
.L0800AD3C: .4byte 0x0300010C
    func_end func_0800AD34

    thumb_func_start func_0800AD40
func_0800AD40: @ 0x0800AD40
    push {r4, r5, lr}
    sub sp, #8
    movs r5, #0x90
    lsls r5, r5, #2
    movs r4, #4
    str r4, [sp]
    str r3, [sp, #4]
    adds r3, r5, #0
    bl func_0800AD5C
    add sp, #8
    pop {r4, r5}
    pop {r1}
    bx r1
    func_end func_0800AD40

    thumb_func_start func_0800AD5C
func_0800AD5C: @ 0x0800AD5C
    push {r4, r5, r6, r7, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    adds r6, r2, #0
    adds r7, r3, #0
    ldr r1, [sp, #0x18]
    cmp r1, #0
    beq .L0800AD78
    ldr r0, .L0800AD74 @ =0x08B90CA0
    bl SpawnProcLocking
    b .L0800AD80
    .align 2, 0
.L0800AD74: .4byte 0x08B90CA0
.L0800AD78:
    ldr r0, .L0800ADA4 @ =0x08B90CA0
    movs r1, #3
    bl SpawnProc
.L0800AD80:
    adds r1, r0, #0
    str r4, [r1, #0x30]
    str r5, [r1, #0x2c]
    adds r0, r1, #0
    adds r0, #0x36
    strb r6, [r0]
    adds r0, #0xa
    strh r7, [r0]
    ldr r0, [sp, #0x14]
    adds r0, #0x10
    adds r2, r1, #0
    adds r2, #0x42
    strb r0, [r2]
    adds r0, r1, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    .align 2, 0
.L0800ADA4: .4byte 0x08B90CA0
    func_end func_0800AD5C

    thumb_func_start func_0800ADA8
func_0800ADA8: @ 0x0800ADA8
    push {lr}
    ldr r0, .L0800ADB4 @ =0x08B90CA0
    bl Proc_EndEach
    pop {r0}
    bx r0
    .align 2, 0
.L0800ADB4: .4byte 0x08B90CA0
    func_end func_0800ADA8

    thumb_func_start func_0800ADB8
func_0800ADB8: @ 0x0800ADB8
    push {lr}
    ldr r0, .L0800ADC8 @ =0x08B90D88
    ldr r1, .L0800ADCC @ =func_0800ADD0
    bl Proc_ForEach
    pop {r0}
    bx r0
    .align 2, 0
.L0800ADC8: .4byte 0x08B90D88
.L0800ADCC: .4byte func_0800ADD0
    func_end func_0800ADB8

    thumb_func_start func_0800ADD0
func_0800ADD0: @ 0x0800ADD0
    push {lr}
    bl EvtCmd_NoSkip
    pop {r0}
    bx r0
    func_end func_0800ADD0

    thumb_func_start Event_FadeOutOfBackgroundTalk
Event_FadeOutOfBackgroundTalk: @ 0x0800ADDC
    push {lr}
    adds r1, r0, #0
    ldr r0, .L0800ADEC @ =0x08B90D08
    bl SpawnProcLocking
    pop {r0}
    bx r0
    .align 2, 0
.L0800ADEC: .4byte 0x08B90D08
    func_end Event_FadeOutOfBackgroundTalk

    thumb_func_start Event_FadeOutOfSkip
Event_FadeOutOfSkip: @ 0x0800ADF0
    push {lr}
    adds r1, r0, #0
    ldr r0, .L0800AE00 @ =0x08B90D68
    bl SpawnProcLocking
    pop {r0}
    bx r0
    .align 2, 0
.L0800AE00: .4byte 0x08B90D68
    func_end Event_FadeOutOfSkip

    thumb_func_start func_0800AE04
func_0800AE04: @ 0x0800AE04
    push {lr}
    adds r1, r0, #0
    ldr r0, .L0800AE14 @ =0x08B90D40
    bl SpawnProcLocking
    pop {r0}
    bx r0
    .align 2, 0
.L0800AE14: .4byte 0x08B90D40
    func_end func_0800AE04

    thumb_func_start func_0800AE18
func_0800AE18: @ 0x0800AE18
    push {lr}
    adds r2, r0, #0
    ldr r1, [r2, #0x14]
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800AE30
    adds r0, r2, #0
    bl StartMidLockingFadeToBlack
.L0800AE30:
    pop {r0}
    bx r0
    func_end func_0800AE18

    thumb_func_start func_0800AE34
func_0800AE34: @ 0x0800AE34
    push {lr}
    adds r2, r0, #0
    ldr r1, [r2, #0x14]
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800AE4C
    adds r0, r2, #0
    bl StartMidLockingFadeFromBlack
.L0800AE4C:
    pop {r0}
    bx r0
    func_end func_0800AE34

    thumb_func_start func_0800AE50
func_0800AE50: @ 0x0800AE50
    push {lr}
    bl func_0802E368
    bl UnlockBmDisplay
    bl ReleaseMus
    ldr r0, .L0800AE84 @ =gBg0Tm
    movs r1, #0
    bl TmFill
    ldr r0, .L0800AE88 @ =gBg1Tm
    movs r1, #0
    bl TmFill
    movs r0, #1
    bl EnableBgSync
    movs r0, #2
    bl EnableBgSync
    bl ClearTalk
    pop {r0}
    bx r0
    .align 2, 0
.L0800AE84: .4byte gBg0Tm
.L0800AE88: .4byte gBg1Tm
    func_end func_0800AE50

    thumb_func_start func_0800AE8C
func_0800AE8C: @ 0x0800AE8C
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r5, [r4, #0x14]
    ldr r0, .L0800AEDC @ =gBg0Tm
    movs r1, #0
    bl TmFill
    ldr r0, .L0800AEE0 @ =gBg1Tm
    movs r1, #0
    bl TmFill
    movs r0, #1
    bl EnableBgSync
    movs r0, #2
    bl EnableBgSync
    bl ClearTalk
    bl func_0802E368
    adds r1, r5, #0
    adds r1, #0x5e
    movs r0, #4
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    beq .L0800AEE4
    adds r0, r5, #0
    adds r0, #0x4d
    ldrb r0, [r0]
    lsls r0, r0, #0x18
    asrs r0, r0, #0x18
    cmp r0, #0
    beq .L0800AEEA
    movs r0, #0x20
    adds r1, r4, #0
    bl StartLockingFadeFromBlack
    b .L0800AEEA
    .align 2, 0
.L0800AEDC: .4byte gBg0Tm
.L0800AEE0: .4byte gBg1Tm
.L0800AEE4:
    adds r0, r4, #0
    bl StartMidLockingFadeFromBlack
.L0800AEEA:
    pop {r4, r5}
    pop {r0}
    bx r0
    func_end func_0800AE8C

    thumb_func_start EventForceSlowTextSpeed
EventForceSlowTextSpeed: @ 0x0800AEF0
    adds r3, r0, #0
    adds r3, #0x68
    movs r1, #0
    ldrsb r1, [r3, r1]
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    bne .L0800AF18
    ldr r2, .L0800AF1C @ =gPlayStatus
    adds r2, #0x40
    ldrb r1, [r2]
    lsls r0, r1, #0x19
    lsrs r0, r0, #0x1e
    strb r0, [r3]
    movs r0, #0x61
    rsbs r0, r0, #0
    ands r0, r1
    movs r1, #0x20
    orrs r0, r1
    strb r0, [r2]
.L0800AF18:
    bx lr
    .align 2, 0
.L0800AF1C: .4byte gPlayStatus
    func_end EventForceSlowTextSpeed

    thumb_func_start func_0800AF20
func_0800AF20: @ 0x0800AF20
    push {r4, r5, lr}
    adds r3, r0, #0
    adds r3, #0x68
    ldrb r4, [r3]
    movs r1, #0
    ldrsb r1, [r3, r1]
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    beq .L0800AF50
    ldr r2, .L0800AF58 @ =gPlayStatus
    adds r2, #0x40
    movs r0, #3
    ands r1, r0
    lsls r1, r1, #5
    movs r0, #0x61
    rsbs r0, r0, #0
    ldrb r5, [r2]
    ands r0, r5
    orrs r0, r1
    strb r0, [r2]
    movs r0, #0xff
    orrs r0, r4
    strb r0, [r3]
.L0800AF50:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800AF58: .4byte gPlayStatus
    func_end func_0800AF20

    thumb_func_start func_0800AF5C
func_0800AF5C: @ 0x0800AF5C
    push {lr}
    movs r1, #3
    bl StartEvent
    pop {r1}
    bx r1
    func_end func_0800AF5C

    thumb_func_start func_0800AF68
func_0800AF68: @ 0x0800AF68
    push {lr}
    bl StartEvent
    pop {r1}
    bx r1
    func_end func_0800AF68

    thumb_func_start StartEvent
StartEvent: @ 0x0800AF74
    push {r4, r5, r6, r7, lr}
    adds r7, r0, #0
    adds r5, r1, #0
    ldr r6, .L0800AF9C @ =0x08B90D88
    adds r0, r6, #0
    bl Proc_Find
    adds r4, r0, #0
    cmp r4, #0
    beq .L0800AFA8
    ldr r2, .L0800AFA0 @ =0x03004170
    ldr r1, .L0800AFA4 @ =0x03004160
    ldrb r3, [r1]
    lsls r0, r3, #2
    adds r0, r0, r2
    str r7, [r0]
    ldrb r0, [r1]
    adds r0, #1
    strb r0, [r1]
    b .L0800B0E8
    .align 2, 0
.L0800AF9C: .4byte 0x08B90D88
.L0800AFA0: .4byte 0x03004170
.L0800AFA4: .4byte 0x03004160
.L0800AFA8:
    ldr r0, .L0800AFC0 @ =0x03004160
    strb r4, [r0]
    ldr r0, .L0800AFC4 @ =0x03004170
    str r4, [r0]
    cmp r5, #7
    bgt .L0800AFC8
    adds r0, r6, #0
    adds r1, r5, #0
    bl SpawnProc
    b .L0800AFD0
    .align 2, 0
.L0800AFC0: .4byte 0x03004160
.L0800AFC4: .4byte 0x03004170
.L0800AFC8:
    adds r0, r6, #0
    adds r1, r5, #0
    bl SpawnProcLocking
.L0800AFD0:
    adds r4, r0, #0
    str r7, [r4, #0x2c]
    str r7, [r4, #0x30]
    movs r1, #0
    str r1, [r4, #0x34]
    str r1, [r4, #0x38]
    str r1, [r4, #0x40]
    str r1, [r4, #0x3c]
    str r1, [r4, #0x48]
    adds r3, r4, #0
    adds r3, #0x5e
    movs r2, #0
    movs r0, #1
    strh r0, [r3]
    adds r0, r4, #0
    adds r0, #0x50
    strh r1, [r0]
    subs r0, #2
    strb r2, [r0]
    adds r0, #8
    strh r1, [r0]
    adds r2, r4, #0
    adds r2, #0x4c
    movs r0, #0xff
    ldrb r1, [r2]
    orrs r1, r0
    strb r1, [r2]
    adds r1, r4, #0
    adds r1, #0x68
    ldrb r2, [r1]
    orrs r0, r2
    strb r0, [r1]
    ldr r2, .L0800B034 @ =gDispIo
    adds r1, r2, #0
    adds r1, #0x3c
    movs r0, #0xc0
    ldrb r1, [r1]
    ands r0, r1
    cmp r0, #0xc0
    bne .L0800B038
    adds r0, r2, #0
    adds r0, #0x46
    ldrb r0, [r0]
    cmp r0, #0x10
    bne .L0800B038
    adds r1, r4, #0
    adds r1, #0x4d
    movs r0, #1
    b .L0800B03E
    .align 2, 0
.L0800B034: .4byte gDispIo
.L0800B038:
    adds r1, r4, #0
    adds r1, #0x4d
    movs r0, #0
.L0800B03E:
    strb r0, [r1]
    ldr r0, .L0800B060 @ =gMapOther
    ldr r0, [r0]
    movs r1, #0
    bl MapFill
    ldr r0, [r4, #0x30]
    ldr r0, [r0]
    subs r0, #0x86
    cmp r0, #7
    bhi .L0800B0E8
    lsls r0, r0, #2
    ldr r1, .L0800B064 @ =.L0800B068
    adds r0, r0, r1
    ldr r0, [r0]
    mov pc, r0
    .align 2, 0
.L0800B060: .4byte gMapOther
.L0800B064: .4byte .L0800B068
.L0800B068: @ jump table
    .4byte .L0800B096 @ case 0
    .4byte .L0800B0A4 @ case 1
    .4byte .L0800B0B2 @ case 2
    .4byte .L0800B0E8 @ case 3
    .4byte .L0800B088 @ case 4
    .4byte .L0800B0C0 @ case 5
    .4byte .L0800B0CE @ case 6
    .4byte .L0800B0DC @ case 7
.L0800B088:
    ldr r0, [r4, #0x30]
    adds r0, #4
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl EvtCmd_SilentSkip
    b .L0800B0E8
.L0800B096:
    ldr r0, [r4, #0x30]
    adds r0, #4
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl EvtCmd_NoSkip
    b .L0800B0E8
.L0800B0A4:
    ldr r0, [r4, #0x30]
    adds r0, #4
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl EvtCmd_NoSkipTalk
    b .L0800B0E8
.L0800B0B2:
    ldr r0, [r4, #0x30]
    adds r0, #4
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl EvtCmd_NoSkipTalkSlow
    b .L0800B0E8
.L0800B0C0:
    ldr r0, [r4, #0x30]
    adds r0, #4
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl EvtCmd_NoSkipUnlessNewGamePlus
    b .L0800B0E8
.L0800B0CE:
    ldr r0, [r4, #0x30]
    adds r0, #4
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl EvtCmd_NoSkipTalkSlowUnlessNewGamePlus
    b .L0800B0E8
.L0800B0DC:
    ldr r0, [r4, #0x30]
    adds r0, #4
    str r0, [r4, #0x30]
    adds r0, r4, #0
    bl EvtCmd_NoSkipSlowUnlessNewGamePlus
.L0800B0E8:
    adds r0, r4, #0
    pop {r4, r5, r6, r7}
    pop {r1}
    bx r1
    func_end StartEvent

    thumb_func_start func_0800B0F0
func_0800B0F0: @ 0x0800B0F0
    push {r4, lr}
    adds r4, r0, #0
    bl LockGame
    movs r0, #0
    str r0, [r4, #0x40]
    pop {r4}
    pop {r0}
    bx r0
    func_end func_0800B0F0

    thumb_func_start func_0800B104
func_0800B104: @ 0x0800B104
    push {lr}
    bl ReleaseGame
    pop {r0}
    bx r0
    func_end func_0800B104

    thumb_func_start func_0800B110
func_0800B110: @ 0x0800B110
    push {lr}
    adds r0, #0x5e
    movs r1, #0x10
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    bne .L0800B12C
    movs r0, #0
    bl SetTextFont
    bl InitSystemTextFont
    bl LoadUiFrameGraphics
.L0800B12C:
    pop {r0}
    bx r0
    func_end func_0800B110

    thumb_func_start func_0800B130
func_0800B130: @ 0x0800B130
    push {r4, lr}
    adds r2, r0, #0
    adds r1, r2, #0
    adds r1, #0x5e
    ldr r0, .L0800B174 @ =0x0000FFFB
    ldrh r3, [r1]
    ands r0, r3
    strh r0, [r1]
    ldr r3, .L0800B178 @ =0x03004160
    ldrb r0, [r3]
    cmp r0, #0
    beq .L0800B16E
    subs r0, #1
    strb r0, [r3]
    movs r0, #0
    str r0, [r2, #0x40]
    ldr r1, .L0800B17C @ =0x03004170
    ldrb r4, [r3]
    lsls r0, r4, #2
    adds r0, r0, r1
    ldr r0, [r0]
    str r0, [r2, #0x2c]
    ldrb r3, [r3]
    lsls r0, r3, #2
    adds r0, r0, r1
    ldr r0, [r0]
    str r0, [r2, #0x30]
    adds r0, r2, #0
    movs r1, #0
    bl Proc_Goto
.L0800B16E:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800B174: .4byte 0x0000FFFB
.L0800B178: .4byte 0x03004160
.L0800B17C: .4byte 0x03004170
    func_end func_0800B130

    thumb_func_start func_0800B180
func_0800B180: @ 0x0800B180
    push {lr}
    adds r0, #0x5e
    movs r1, #8
    ldrh r0, [r0]
    ands r1, r0
    cmp r1, #0
    beq .L0800B192
    bl func_0802E3B0
.L0800B192:
    pop {r0}
    bx r0
    func_end func_0800B180

    thumb_func_start func_0800B198
func_0800B198: @ 0x0800B198
    push {r4, lr}
    adds r4, r0, #0
    bl func_080143E0
    ldr r0, .L0800B1C0 @ =0x08B90B9C
    bl Proc_EndEach
    adds r4, #0x4c
    movs r1, #0
    ldrsb r1, [r4, r1]
    movs r0, #1
    rsbs r0, r0, #0
    cmp r1, r0
    bne .L0800B1B8
    bl func_0806E144
.L0800B1B8:
    pop {r4}
    pop {r0}
    bx r0
    .align 2, 0
.L0800B1C0: .4byte 0x08B90B9C
    func_end func_0800B198

    thumb_func_start Event_IsSkipAllowed
Event_IsSkipAllowed: @ 0x0800B1C4
    push {lr}
    adds r0, #0x5e
    ldrh r1, [r0]
    movs r0, #4
    ands r0, r1
    cmp r0, #0
    bne .L0800B1E8
    movs r0, #0x40
    ands r0, r1
    cmp r0, #0
    bne .L0800B1E8
    bl func_0804B1EC
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800B1E8
    movs r0, #1
    b .L0800B1EA
.L0800B1E8:
    movs r0, #0
.L0800B1EA:
    pop {r1}
    bx r1
    func_end Event_IsSkipAllowed

    thumb_func_start Event_DarkenThenFunc
Event_DarkenThenFunc: @ 0x0800B1F0
    push {r4, r5, lr}
    adds r5, r0, #0
    adds r4, r1, #0
    ldr r0, .L0800B208 @ =0x08B90E28
    bl SpawnProcLocking
    str r5, [r0, #0x50]
    str r4, [r0, #0x4c]
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800B208: .4byte 0x08B90E28
    func_end Event_DarkenThenFunc

    thumb_func_start EventDarkenThenFunc_OnInit
EventDarkenThenFunc_OnInit: @ 0x0800B20C
    push {r4, lr}
    adds r4, r0, #0
    bl EventDarkenThenFunc_StartDarken
    adds r4, #0x64
    movs r0, #0x40
    strh r0, [r4]
    pop {r4}
    pop {r0}
    bx r0
    func_end EventDarkenThenFunc_OnInit

    thumb_func_start EventDarkenThenFunc_OnLoop
EventDarkenThenFunc_OnLoop: @ 0x0800B220
    push {r4, r5, lr}
    adds r4, r0, #0
    ldr r5, [r4, #0x50]
    bl EventDarkenThenFunc_StepDarken
    ldr r0, .L0800B248 @ =gDispIo
    adds r0, #0x46
    ldrb r0, [r0]
    cmp r0, #0x10
    bne .L0800B240
    ldr r0, [r4, #0x4c]
    bl _call_via_r5
    adds r0, r4, #0
    bl Proc_Break
.L0800B240:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800B248: .4byte gDispIo
    func_end EventDarkenThenFunc_OnLoop

    thumb_func_start EventDarkenThenFunc_StartDarken
EventDarkenThenFunc_StartDarken: @ 0x0800B24C
    push {r4, r5, r6, lr}
    ldr r1, .L0800B2BC @ =gDispIo
    mov ip, r1
    mov r2, ip
    adds r2, #0x34
    movs r3, #0x20
    ldrb r1, [r2]
    orrs r1, r3
    strb r1, [r2]
    adds r2, #1
    ldrb r1, [r2]
    orrs r1, r3
    strb r1, [r2]
    adds r2, #2
    ldrb r1, [r2]
    orrs r1, r3
    strb r1, [r2]
    subs r2, #1
    ldrb r1, [r2]
    orrs r1, r3
    strb r1, [r2]
    mov r4, ip
    adds r4, #0x3c
    movs r1, #0xc0
    ldrb r2, [r4]
    orrs r1, r2
    strb r1, [r4]
    mov r1, ip
    adds r1, #0x44
    movs r5, #0
    strb r5, [r1]
    adds r1, #1
    strb r5, [r1]
    adds r1, #1
    strb r5, [r1]
    ldr r1, .L0800B2C0 @ =0x0000FFE0
    mov r6, ip
    ldrh r6, [r6, #0x3c]
    ands r1, r6
    movs r2, #0x1f
    orrs r1, r2
    mov r2, ip
    strh r1, [r2, #0x3c]
    ldrb r6, [r4]
    orrs r3, r6
    strb r3, [r4]
    adds r2, r0, #0
    adds r2, #0x64
    movs r1, #0x10
    strh r1, [r2]
    adds r0, #0x66
    strh r5, [r0]
    pop {r4, r5, r6}
    pop {r0}
    bx r0
    .align 2, 0
.L0800B2BC: .4byte gDispIo
.L0800B2C0: .4byte 0x0000FFE0
    func_end EventDarkenThenFunc_StartDarken

    thumb_func_start EventDarkenThenFunc_StepDarken
EventDarkenThenFunc_StepDarken: @ 0x0800B2C4
    push {lr}
    adds r2, r0, #0
    ldr r0, .L0800B2DC @ =gDispIo
    adds r3, r0, #0
    adds r3, #0x46
    ldrb r0, [r3]
    cmp r0, #0x10
    bne .L0800B2E0
    adds r0, r2, #0
    bl Proc_End
    b .L0800B304
    .align 2, 0
.L0800B2DC: .4byte gDispIo
.L0800B2E0:
    adds r1, r2, #0
    adds r1, #0x66
    adds r0, r2, #0
    adds r0, #0x64
    ldrh r2, [r1]
    ldrh r0, [r0]
    adds r0, r2, r0
    strh r0, [r1]
    lsls r0, r0, #0x10
    asrs r0, r0, #0x10
    cmp r0, #0xff
    ble .L0800B2FE
    movs r0, #0x80
    lsls r0, r0, #1
    strh r0, [r1]
.L0800B2FE:
    ldrh r1, [r1]
    lsrs r0, r1, #4
    strb r0, [r3]
.L0800B304:
    pop {r0}
    bx r0
    func_end EventDarkenThenFunc_StepDarken

    thumb_func_start Event_BeginSkip
Event_BeginSkip: @ 0x0800B308
    push {r4, r5, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x50
    movs r0, #0
    strh r0, [r1]
    ldr r0, [r4, #0x3c]
    cmp r0, #0
    beq .L0800B31E
    bl _call_via_r0
.L0800B31E:
    adds r5, r4, #0
    adds r5, #0x5e
    movs r0, #4
    ldrh r1, [r5]
    orrs r0, r1
    strh r0, [r5]
    bl func_0800A4E8
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800B372
    bl func_080B5644
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0800B348
    adds r0, r4, #0
    bl func_0800B198
    subs r5, #0x11
    b .L0800B36E
.L0800B348:
    movs r0, #0x20
    ldrh r5, [r5]
    ands r0, r5
    adds r5, r4, #0
    adds r5, #0x4d
    cmp r0, #0
    bne .L0800B36E
    movs r0, #0
    ldrsb r0, [r5, r0]
    cmp r0, #0
    beq .L0800B366
    adds r0, r4, #0
    bl func_0800B198
    b .L0800B36E
.L0800B366:
    ldr r0, .L0800B38C @ =func_0800B198
    adds r1, r4, #0
    bl Event_DarkenThenFunc
.L0800B36E:
    movs r0, #1
    strb r0, [r5]
.L0800B372:
    movs r0, #5
    bl Proc_LockEachMarked
    ldr r1, [r4, #0x40]
    cmp r1, #0
    beq .L0800B384
    adds r0, r4, #0
    bl _call_via_r1
.L0800B384:
    pop {r4, r5}
    pop {r0}
    bx r0
    .align 2, 0
.L0800B38C: .4byte func_0800B198
    func_end Event_BeginSkip

    thumb_func_start Event_MainLoop
Event_MainLoop: @ 0x0800B390
    push {r4, r5, r6, r7, lr}
    mov r7, r8
    push {r7}
    adds r4, r0, #0
    ldr r0, .L0800B3D8 @ =0x08B969E4
    bl Proc_Find
    cmp r0, #0
    bne .L0800B494
    bl IsSubtitleHelpActive
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800B494
    bl IsMapFadeActive
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800B494
    adds r0, r4, #0
    bl Event_IsSkipAllowed
    lsls r0, r0, #0x18
    cmp r0, #0
    beq .L0800B3E0
    ldr r0, .L0800B3DC @ =gKeys
    ldr r1, [r0]
    movs r0, #8
    ldrh r1, [r1, #8]
    ands r0, r1
    cmp r0, #0
    beq .L0800B3E0
    adds r0, r4, #0
    bl Event_BeginSkip
    b .L0800B494
    .align 2, 0
.L0800B3D8: .4byte 0x08B969E4
.L0800B3DC: .4byte gKeys
.L0800B3E0:
    adds r3, r4, #0
    adds r3, #0x50
    ldrh r2, [r3]
    cmp r2, #0
    beq .L0800B43C
    subs r5, r2, #1
    strh r5, [r3]
    adds r0, r4, #0
    adds r0, #0x4e
    ldrb r0, [r0]
    cmp r0, #0
    beq .L0800B494
    ldr r0, .L0800B434 @ =gPlayStatus
    adds r0, #0x40
    ldrb r0, [r0]
    lsrs r0, r0, #7
    cmp r0, #0
    bne .L0800B412
    ldr r0, .L0800B438 @ =gKeys
    ldr r1, [r0]
    movs r0, #1
    ldrh r1, [r1, #4]
    ands r0, r1
    cmp r0, #0
    beq .L0800B494
.L0800B412:
    lsls r0, r5, #0x10
    cmp r0, #0
    beq .L0800B494
    subs r0, r2, #2
    strh r0, [r3]
    lsls r0, r0, #0x10
    cmp r0, #0
    beq .L0800B494
    subs r0, r2, #3
    strh r0, [r3]
    lsls r0, r0, #0x10
    cmp r0, #0
    beq .L0800B494
    subs r0, r2, #4
    strh r0, [r3]
    b .L0800B494
    .align 2, 0
.L0800B434: .4byte gPlayStatus
.L0800B438: .4byte gKeys
.L0800B43C:
    ldr r1, [r4, #0x40]
    cmp r1, #0
    beq .L0800B44A
    adds r0, r4, #0
    bl _call_via_r1
    b .L0800B494
.L0800B44A:
    adds r6, r4, #0
    adds r6, #0x56
    ldr r7, .L0800B468 @ =gEventCmdTable
    adds r0, r7, #4
    mov r8, r0
.L0800B454:
    ldr r0, [r4, #0x30]
    ldrh r5, [r0]
    ldrh r0, [r6]
    cmp r0, #0
    beq .L0800B46C
    subs r0, #1
    strh r0, [r6]
    movs r2, #0
    b .L0800B47A
    .align 2, 0
.L0800B468: .4byte gEventCmdTable
.L0800B46C:
    lsls r0, r5, #3
    adds r0, r0, r7
    ldr r1, [r0]
    adds r0, r4, #0
    bl _call_via_r1
    adds r2, r0, #0
.L0800B47A:
    cmp r2, #1
    beq .L0800B454
    cmp r2, #3
    beq .L0800B494
    lsls r0, r5, #3
    add r0, r8
    ldr r1, [r0]
    lsls r1, r1, #2
    ldr r0, [r4, #0x30]
    adds r0, r0, r1
    str r0, [r4, #0x30]
    cmp r2, #2
    bne .L0800B454
.L0800B494:
    pop {r3}
    mov r8, r3
    pop {r4, r5, r6, r7}
    pop {r0}
    bx r0
    func_end Event_MainLoop

    thumb_func_start Event_WaitForFaceEnd
Event_WaitForFaceEnd: @ 0x0800B4A0
    push {r4, lr}
    adds r4, r0, #0
    adds r1, r4, #0
    adds r1, #0x5e
    movs r0, #0x10
    ldrh r1, [r1]
    ands r0, r1
    cmp r0, #0
    bne .L0800B4BC
    bl FaceExists
    lsls r0, r0, #0x18
    cmp r0, #0
    bne .L0800B4C2
.L0800B4BC:
    adds r0, r4, #0
    bl Proc_Break
.L0800B4C2:
    pop {r4}
    pop {r0}
    bx r0
    func_end Event_WaitForFaceEnd
