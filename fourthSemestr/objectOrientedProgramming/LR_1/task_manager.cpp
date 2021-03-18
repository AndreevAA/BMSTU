#include "task_manager.h"
#include "config.h"
#include "io.h"
#include "draw.h"
#include "operations.h"

int task_manager(request task)
{
    int  temp_error_status = SUCCES_STATUS;
    static object_t object = initialize_object();

    printf("action is %d\n", task.act);

    switch (task.act)
    {
    case INIT:
        break;
    case uploaded_file_st:
        temp_error_status = get_model_loading_status(object, task.lf);
        break;
    case DRAW:
        temp_error_status = draw_object(object, task.dr);
        break;
    case MOVE:
        temp_error_status = move_object(object, task.mo);
        break;
    case SCALE:
        temp_error_status = scale_object(object, task.sc);
        break;
    case ROTATE:
        temp_error_status = rotate_object(object, task.ro);
        break;
    case QUIT:
        delete_object_comparator(object);
        break;
    default:
        temp_error_status = ERROR_STATUS_TO_DO;
    }

    return temp_error_status;
}
