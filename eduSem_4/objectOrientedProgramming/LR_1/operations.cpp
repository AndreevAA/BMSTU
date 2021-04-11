#include "operations.h"

// Перемещение точки
static void move_point(point_t &point, const struct request temp_request)
{
    point.x += temp_request.move_dx;
    point.y += temp_request.move_dy;
    point.z += temp_request.move_dz;
}

// Пермещение объекта
int move_object(object_t &object, const struct request temp_request)
{
    int temp_error_status = check_object(object);

    if (temp_error_status == SUCCES_STATUS)
        for (int temp_cur = 0; temp_cur < object.number_of_points; temp_cur++)
            move_point(object.points[temp_cur], temp_request);

    return temp_error_status;
}

// Шаблонизатор масштабирвоания координаты
float scale_coordinate(float k_coordinate, float coordinate, float coordinate_m)
{
    return k_coordinate * coordinate + coordinate_m * (1 - k_coordinate);
}

// Измениение масштаба по точке
static void scale_point(point_t &point, const struct request temp_request)
{
    point.x = scale_coordinate(temp_request.scale_kx, point.x, temp_request.scale_xm);
    point.y = scale_coordinate(temp_request.scale_ky, point.y, temp_request.scale_ym);
    point.z = scale_coordinate(temp_request.scale_kz, point.z, temp_request.scale_zm);
}

// Изменение масштаба объекта
int scale_object(object_t &object, const struct request temp_request)
{
    int temp_error_status = check_object(object);

    if (temp_error_status == SUCCES_STATUS)
        for (int temp_cur = 0; temp_cur < object.number_of_points; temp_cur++)
            scale_point(object.points[temp_cur], temp_request);

    return temp_error_status;
}

// Получение градуса в градианах
float get_rdegree(float rotate_degree)
{
    return rotate_degree * PI / 180;
}

// Сеттирование структуры
static struct trig count_trig(const struct request temp_request)
{
    struct trig tg;

    tg.cos_x = cos(get_rdegree(temp_request.rotate_dgx));
    tg.cos_y = cos(get_rdegree(temp_request.rotate_dgy));
    tg.cos_z = cos(get_rdegree(temp_request.rotate_dgz));

    tg.sin_x = sin(get_rdegree(temp_request.rotate_dgx));
    tg.sin_y = sin(get_rdegree(temp_request.rotate_dgy));
    tg.sin_z = sin(get_rdegree(temp_request.rotate_dgz));

    return tg;
}

// Шаблонизатор функции поворота относительно одной оси в трехмерном пространстве
void rotate_one_sector(float *rotate_coordinate, float *first_coordinate, float *second_coordinate, float sin_alfa, float cos_alfa)
{
    float temp_rc = *rotate_coordinate;
    float temp_fc = *first_coordinate * cos_alfa + *second_coordinate * sin_alfa;
    float temp_sc = -*first_coordinate * sin_alfa + *second_coordinate * cos_alfa;

    *rotate_coordinate = temp_rc;
    *first_coordinate = temp_fc;
    *second_coordinate = temp_sc;
}

// Порот точки
static void rotate_point(point_t &point, const struct request temp_request)
{
    struct trig tg = count_trig(temp_request);

    // Поворот относительно X
    rotate_one_sector(&point.x, &point.y, &point.z, tg.sin_x, tg.cos_x);

    // Поворот относительно Y
    rotate_one_sector(&point.y, &point.x, &point.z, tg.sin_y, tg.cos_y);

    // Поворот относительно Z
    rotate_one_sector(&point.z, &point.x, &point.y, tg.sin_z, tg.cos_z);
}

// Поворот объекта
int rotate_object(object_t &object, const struct request temp_request)
{
    int temp_error_status = check_object(object);

    if (temp_error_status == SUCCES_STATUS)
        for (int temp_cur = 0; temp_cur < object.number_of_points; temp_cur++)
            rotate_point(object.points[temp_cur], temp_request);

    return temp_error_status;
}
