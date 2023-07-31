#ifndef ATTRIBUTES_H
#define ATTRIBUTES_H

#ifndef PRELUDE_H
#warning "attributes.h file is meant to be included via prelude.h"
#endif

#define SECTION(name) __attribute__((section(name)))

// this is used to denote a symbol that would have been COMMON.
// each such symbol gets its own named section for ease of generating a matching layout.
#define COMMON(name) SECTION("COMMON." #name)

#define EWRAM_DATA SECTION("ewram_data")

#define NAKEDFUNC __attribute__((naked))

#define ALIGNED(n) __attribute__((aligned((n))))

// this is often used in place of const for producing matching code.
#define SHOULD_BE_CONST

// this is used for local const variables (often arrays) that don't need not to be static
#define SHOULD_BE_STATIC

#endif // ATTRIBUTES_H
