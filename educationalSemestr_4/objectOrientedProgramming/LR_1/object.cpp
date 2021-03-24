#include "object.h"
#include "valueschecker.h"

int get_object_verification_status(const object_t &object)
{
    int temp_error_status = SUCCES_STATUS;

    if (is_data_null(object.points) == SUCCES_STATUS || is_data_null(object.links) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_VECTORS;
    else if (is_zero_data(object.number_of_points) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_POINTS;
    else if (is_zero_data(object.number_of_links) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_LINKS;

    return temp_error_status;
}

void free_object_comparator(object_t &object)
{
    object.number_of_points = 0;
    object.number_of_links = 0;

    free_comparator(object.points);
    free_comparator(object.links);
}

object_t initialize_object()
{
    object_t object;

    object.number_of_links = 0;
    object.number_of_points = 0;

    object.links = NULL;
    object.points = NULL;

    return object;
}
