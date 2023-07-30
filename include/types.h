#ifndef TYPES_H
#define TYPES_H

#ifndef PRELUDE_H
#warning "types.h file is meant to be included via prelude.h"
#endif

#include <stddef.h>
#include <stdint.h>

typedef int8_t i8;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;
typedef intptr_t iptr;
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
typedef uintptr_t uptr;

typedef i8 fi8;
typedef i16 fi16;
typedef u8 fu8;
typedef u16 fu16;

#ifndef __cplusplus
typedef i8 bool;
#endif

enum
{
    FALSE,
    TRUE,
};

#endif // TYPES_H
