#ifndef TASK_MANAGER_H
#define TASK_MANAGER_H

#include "object.h"
#include "defines.h"
#include "io.h"
#include "draw.h"
#include "operations.h"

enum controller_status
{
    INIT,
    uploaded_file_st,
    DRAW,
    MOVE,
    SCALE,
    ROTATE,
    QUIT
};

struct request
{
    controller_status act;
    union
    {
        struct uploaded_file_st lf;
        struct draw dr;
        struct move mo;
        struct scale sc;
        struct rotate ro;
    };
};

int task_manager(request task);

#endif // TASK_MANAGER_H
