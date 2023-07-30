    .data

    @ B857F8 ... CF634C

    .incbin "baserom.gba", 0xB857F8, 0xCF634C - 0xB857F8

    .section ".data_2", "a"

    @ this is more than just the .data section (starting with a bunch of garbage)
    @ I am very lazy

    @ CF6A94 ... 1000000

    .incbin "baserom.gba", 0xCF6A94, 0x1000000 - 0xCF6A94
