    .section ".rodata"

    @ 0C57DC ... 677370

    .incbin "baserom.gba", 0x0C57DC, 0x677370 - 0x0C57DC

    .section ".rodata_2", "a"

    @ 677648 ... B855DC

    .incbin "baserom.gba", 0x677648, 0xB855DC - 0x677648
