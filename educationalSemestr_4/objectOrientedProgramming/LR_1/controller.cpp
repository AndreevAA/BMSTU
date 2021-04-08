#include "controller.h"
#include "config.h"
#include "io.h"
#include "canvas_operations.h"

// Основной контроллер
int controller(request temp_request)
{
    int  temp_error_status = SUCCES_STATUS;

    static object_t object = initialize_object();

    switch (temp_request.controller_status)
    {
        case INITIALIZING:
            break;
        case UPLOADING_FILE:
            temp_error_status = load_file_figure(object, temp_request);
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
            free_object(object);
            break;
        default:
            temp_error_status = ERROR_STATUS_TO_DO;
    }

    return temp_error_status;
}
