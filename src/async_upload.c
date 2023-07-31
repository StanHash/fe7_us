#include "async_upload.h"

// NOTE: data only

struct AsyncUploadInfo EWRAM_DATA gAsyncUploadInfo = { 0 };
struct AsyncUploadEnt EWRAM_DATA gAsyncUploadList[UPLOAD_LIST_COUNT] = { 0 };
