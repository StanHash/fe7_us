    .syntax unified

    .macro thumb_func_start name:req
        .type \name , function
        .global \name
        .thumb
    .endm

    .macro func_end name:req
        .align 2, 0
        .size \name , . - \name
    .endm
