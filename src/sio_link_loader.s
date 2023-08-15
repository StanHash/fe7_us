    .data

    @ TODO: this comprised of both a loader and the compressed payload
    @ that compressed payload was decompiled at https://github.com/StanHash/mgfembp
    @ we could make this better

    .global SioLinkLoader
    .global SioLinkLoaderEnd

SioLinkLoader:
    .incbin "data/fe6_link_loader.bin"
SioLinkLoaderEnd:
