#include "operations.h"

static void move_point(point_t &point, const struct request temp_request)
{
    point.x += temp_request.move_dx;
    point.y += temp_request.move_dy;
    point.z += temp_request.move_dz;
    return;
}

int move_object(object_t &object, const struct request temp_request)
{
    int err = get_object_verification_status(object);
    if (err != SUCCES_STATUS)
        return err;
    for (int i = 0; i < object.number_of_points; i++)
        move_point(object.points[i], temp_request);
    return err;
}

static void scale_point(point_t &point, const struct request temp_request)
{
    point.x = temp_request.scale_kx * point.x + temp_request.scale_xm * (1 - temp_request.scale_kx);
    point.y = temp_request.scale_ky * point.y + temp_request.scale_ym * (1 - temp_request.scale_ky);
    point.z = temp_request.scale_kz * point.z + temp_request.scale_zm * (1 - temp_request.scale_kz);
    return;
}

int scale_object(object_t &object, const struct request temp_request)
{
    int err = get_object_verification_status(object);
    if (err != SUCCES_STATUS)
        return err;
    for (int i = 0; i < object.number_of_points; i++)
        scale_point(object.points[i], temp_request);
    return err;
}
static struct trig count_trig(const struct request temp_request)
{
    struct trig tg;
    tg.cos_x = cos(temp_request.rotate_dgx * PI / 180);
    tg.cos_y = cos(temp_request.rotate_dgy * PI / 180);
    tg.cos_z = cos(temp_request.rotate_dgz * PI / 180);
    tg.sin_x = sin(temp_request.rotate_dgx * PI / 180);
    tg.sin_y = sin(temp_request.rotate_dgy * PI / 180);
    tg.sin_z = sin(temp_request.rotate_dgz * PI / 180);
    return tg;
}

static void rotate_point(point_t &point, const struct trig &tg, request temp_request)
{
    point.x = temp_request.rotate_xc + (point.x - temp_request.rotate_xc) * tg.cos_z - (point.y - temp_request.rotate_yc) * tg.sin_z;
    point.y = temp_request.rotate_yc + (point.x - temp_request.rotate_xc) * tg.sin_z + (point.y - temp_request.rotate_yc) * tg.cos_z;
    point.y = temp_request.rotate_yc + (point.y - temp_request.rotate_yc) * tg.cos_x - (point.z - temp_request.rotate_zc) * tg.sin_x;
    point.z = temp_request.rotate_zc + (point.z - temp_request.rotate_zc) * tg.cos_x + (point.y - temp_request.rotate_yc) * tg.sin_x;
    point.x = temp_request.rotate_xc + (point.x - temp_request.rotate_xc) * tg.cos_y + (point.z - temp_request.rotate_zc) * tg.sin_y;
    point.z = temp_request.rotate_zc + (point.z - temp_request.rotate_zc) * tg.cos_y - (point.x - temp_request.rotate_xc) * tg.sin_y;
    return;
}

int rotate_object(object_t &object, const struct request temp_request)
{
    int err = get_object_verification_status(object);
    if (err != SUCCES_STATUS)
        return err;
    struct trig tg = count_trig(temp_request);
    for (int i = 0; i < object.number_of_points; i++)
        rotate_point(object.points[i], tg, temp_request);
    return err;
}
