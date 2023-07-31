#ifndef ASYNC_UPLOAD_H
#define ASYNC_UPLOAD_H

#include "prelude.h"

#define UPLOAD_LIST_COUNT 0x20

enum
{
    UPLOAD_MODE_COPY_SLOW,
    UPLOAD_MODE_COPY_FAST,
    UPLOAD_MODE_FILL_FAST,
};

struct AsyncUploadInfo
{
    /* 00 */ i32 count;
    /* 04 */ i32 summed_size;
};

struct AsyncUploadEnt
{
    /* 00 */ void const * src;
    /* 04 */ void * dst;
    /* 08 */ u16 size;
    /* 0A */ u16 mode;
};

extern struct AsyncUploadInfo gAsyncUploadInfo;
extern struct AsyncUploadEnt gAsyncUploadList[UPLOAD_LIST_COUNT];

#endif // ASYNC_UPLOAD_H
