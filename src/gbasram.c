#include "gbasram.h"

#include "gbaio.h"

static u16 VerifySramFastBuf[80]; // buffer to hold code of VerifySramFastRom
static u16 ReadSramFastBuf[64];   // buffer to hold code of ReadSramFastRom

u32 (*COMMON(VerifySramFast) VerifySramFast)(void const * src, void * dst, u32 size) = NULL;
void (*COMMON(ReadSramFast) ReadSramFast)(void const * src, void * dst, u32 size) = NULL;

void ReadSramFastRom(u8 const * src, u8 * dst, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;

    while (--size != -1)
        *dst++ = *src++;
}

void WriteSramFast(u8 const * src, u8 * dst, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;

    while (--size != -1)
        *dst++ = *src++;
}

uptr VerifySramFastRom(u8 const * src, u8 * dst, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;

    while (--size != -1)
    {
        if (*dst++ != *src++)
            return (u32)(dst - 1);
    }

    return 0;
}

void SetSramFastFunc(void)
{
    u16 * src;
    u16 * dst;
    fu16 len;

    // clear the thumb bit so that we get the actual start address of the function
    src = (u16 *)ReadSramFastRom;
    src = (u16 *)((uptr)src ^ 1);

    dst = ReadSramFastBuf;

    // get the size of the function by subtracting the address of the next function
    len = ((uptr)WriteSramFast - (uptr)ReadSramFastRom) / 2;

    // copy the function into the WRAM buffer
    while (len != 0)
    {
        *dst++ = *src++;
        len--;
    }

    // +1 for the thumb bit
    ReadSramFast = (void *)((uptr)ReadSramFastBuf + 1);

    src = (u16 *)VerifySramFastRom;
    src = (u16 *)((uptr)src ^ 1);

    dst = VerifySramFastBuf;

    // get the size of the function by subtracting the address of the next function
    len = ((uptr)SetSramFastFunc - (uptr)VerifySramFastRom) / 2;

    // copy the function into the WRAM buffer
    while (len != 0)
    {
        *dst++ = *src++;
        len--;
    }

    // +1 for the thumb bit
    VerifySramFast = (void *)((uptr)VerifySramFastBuf + 1);

    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
}

uptr WriteAndVerifySramFast(void const * src, void * dst, u32 size)
{
    uptr error_addr;
    fu8 i;

#if UBFIX
    error_addr = 0;
#endif

    // try writing and verifying the data up to 3 times
    for (i = 0; i < 3; i++)
    {
        WriteSramFast(src, dst, size);

        error_addr = VerifySramFast(src, dst, size);

        if (error_addr == 0)
            break;
    }

    return error_addr;
}
