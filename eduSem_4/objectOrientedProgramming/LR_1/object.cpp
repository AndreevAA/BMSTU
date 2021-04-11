#include "object.h"
#include "values_checker.h"

// Инициализирование объекта
object_t initialize_object()
{
    object_t object;

    object.number_of_links = 0;
    object.number_of_points = 0;

    object.links = NULL;
    object.points = NULL;

    return object;
}

// Освобождение точек
void free_points(point_t *points)
{
    free(points);
}

// Освобождение связей
void free_links(link_t *links)
{
    free(links);
}

// Освобождение памяти объекта
void free_object(object_t &object)
{
    object.number_of_points = 0;
    object.number_of_links = 0;

    free_points(object.points);
    free_links(object.links);
}

// Проверка на Null
int is_object_null(const object_t &object)
{
    int temp_error_status = SUCCES_STATUS;

    if (is_data_null(object.points) == SUCCES_STATUS || is_data_null(object.links) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_VECTORS;

    return temp_error_status;
}

// Проверка на Ноль
int is_object_zero(const object_t &object)
{
    int temp_error_status = SUCCES_STATUS;

    if (is_zero_data(object.number_of_points) == SUCCES_STATUS || is_zero_data(object.number_of_links) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS;

    return temp_error_status;
}

// Верификация объекта
int check_object(const object_t &object)
{
    int temp_error_status = is_object_null(object);

    if (temp_error_status == SUCCES_STATUS)
        temp_error_status = is_object_zero(object);

    return temp_error_status;
}
