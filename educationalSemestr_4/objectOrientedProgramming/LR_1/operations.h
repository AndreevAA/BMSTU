#ifndef OPERATIONS_H
#define OPERATIONS_H

#include <math.h>
#include "config.h"
#include "object.h"
#include "controller.h"

struct trig
{
    float cos_x;
    float cos_y;
    float cos_z;
    float sin_x;
    float sin_y;
    float sin_z;
};

int move_object(object_t &object, const struct request temp_request);
int scale_object(object_t &object, const struct request temp_request);
int rotate_object(object_t &object, const struct request temp_request);

#endif // OPERATIONS_H

