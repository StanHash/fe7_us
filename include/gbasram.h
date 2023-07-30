#ifndef GBASRAM_H
#define GBASRAM_H

#include "prelude.h"

void ReadSramFastRom(u8 const * src, u8 * dst, u32 size);
void WriteSramFast(u8 const * src, u8 * dst, u32 size);
uptr VerifySramFastRom(u8 const * src, u8 * dst, u32 size);
void SetSramFastFunc(void);
uptr WriteAndVerifySramFast(void const * src, void * dst, u32 size);

extern uptr (*VerifySramFast)(void const * src, void * dst, u32 size);
extern void (*ReadSramFast)(void const * src, void * dst, u32 size);

#endif // GBASRAM_H
