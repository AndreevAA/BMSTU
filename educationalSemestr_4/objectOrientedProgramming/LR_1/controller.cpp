#include "controller.h"
#include "config.h"
#include "io.h"
#include "canvas.h"

int controller(request temp_request)
{
    int  temp_error_status = SUCCES_STATUS;

    static object_t object = initialize_object();

    switch (temp_request.controller_status)
    {
        case INITIALIZING:
            break;
        case UPLOADING_FILE:
            temp_error_status = get_model_loading_status(object, temp_request);
            break;
        case DRAWING_PICTURE:
            temp_error_status = draw_object(object, temp_request);
            break;
        case MOVING_PICTURE:
            temp_error_status = move_object(object, temp_request);
            break;
        case SCALING_PICTURE:
            temp_error_status = scale_object(object, temp_request);
            break;
        case ROTATING_PICTURE:
            temp_error_status = rotate_object(object, temp_request);
            break;
        case EXIT:
            free_object_comparator(object);
            break;
        default:
            temp_error_status = ERROR_STATUS_TO_DO;
    }

    return temp_error_status;
}
