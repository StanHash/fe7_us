    .section ".rodata"

    @ 0C5808 ... 677370

    .incbin "baserom.gba", 0x0C5808, 0x677370 - 0x0C5808

    .section ".rodata_2", "a"

    @ 677648 ... B855DC

    .incbin "baserom.gba", 0x677648, 0xB855DC - 0x677648
