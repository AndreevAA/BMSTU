#ifndef CONTROLLER_H
#define CONTROLLER_H

#include "object.h"
#include "canvas_operations.h"
#include "operations.h"

enum controller_status
{
    INITIALIZING,
    UPLOADING_FILE,
    DRAWING_PICTURE,
    MOVING_PICTURE,
    SCALING_PICTURE,
    ROTATING_PICTURE,
    EXIT
};

struct request
{
    controller_status controller_status;

    float scale_kx, scale_ky, scale_kz, scale_xm, scale_ym, scale_zm;

    float move_dx, move_dy, move_dz;

    int rotate_dgx, rotate_dgy, rotate_dgz;
    float rotate_xc, rotate_yc, rotate_zc;

    const char* file_name;

    QGraphicsView *QGV;
    int draw_h, draw_w;
};

int controller(request task);

#endif // CONTROLLER_H
