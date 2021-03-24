#include "io.h"
#include "valueschecker.h"
#include "controller.h"

// Статус открытия файла
static int get_open_file_status(FILE **operation_file, const char *temp_operation_file_name)
{
    int temp_error_status = SUCCES_STATUS;

    if (is_data_null(temp_operation_file_name) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_OPEN_FILE;
    else if (temp_error_status == SUCCES_STATUS)
        *operation_file = fopen(temp_operation_file_name, "r");
    else if (is_data_null(operation_file) == SUCCES_STATUS)
        temp_error_status =  ERROR_STATUS_OPEN_FILE;

    return temp_error_status;
}

// Статус чтения данных из файла
static int get_reading_file_data_status(int &number_of_points, int &number_of_links, FILE *operation_file)
{
    int temp_error_status = SUCCES_STATUS;

    if (fscanf(operation_file, "%d %d", &number_of_points, &number_of_links) != NUMBER_OF_NUMS)
        temp_error_status =  ERROR_STATUS_FILE_DATA;

    return temp_error_status;
}

// Статус выделения памяти и линковок
static int get_memory_status(const int &number_of_points, const int &number_of_links)
{
    int temp_error_status = SUCCES_STATUS;

    if (is_zero_data(number_of_points) == SUCCES_STATUS)
        temp_error_status =  ERROR_STATUS_POINTS;
    else if (is_zero_data(number_of_links) == SUCCES_STATUS)
        temp_error_status =  ERROR_STATUS_LINKS;

    return temp_error_status;
}

// Статус выделения памяти
static int get_alloc_points_status(point_t **points, const int &number_of_points)
{
    *points = (point_t*)malloc(number_of_points * sizeof(point_t));

    int temp_error_status = SUCCES_STATUS;

    if (is_data_null(*points) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_MEMORY;

    return temp_error_status;
}

// Статус выделения памяти
static int get_alloc_links_status(link_t **links, const int &number_of_links)
{
    *links = (link_t*)malloc(number_of_links * sizeof(link_t));

    int temp_error_status = SUCCES_STATUS;

    if (is_data_null(*links) == SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_MEMORY;

    return temp_error_status;
}

// Статус считывания координат
static int get_number_of_readed_coordinates(FILE *operation_file, point_t **points, int temp_cur)
{
    return fscanf(operation_file, "%f %f %f", &((*points)[temp_cur].x), &((*points)[temp_cur].y), &((*points)[temp_cur].z));
}

// Статус чтения точек из файла
static int get_points_status(point_t **points, const int &number_of_points, FILE *operation_file)
{
    int temp_error_status = SUCCES_STATUS;

    if (get_alloc_points_status(points, number_of_points) != SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_MEMORY;
    else
        for (int temp_cur = 0; temp_cur < number_of_points && temp_error_status == SUCCES_STATUS; temp_cur++)
            if (get_number_of_readed_coordinates(operation_file, points, temp_cur) != NUMBER_OF_COORDINATES)
                temp_error_status = ERROR_STATUS_FILE_DATA;

    return temp_error_status;
}

// Статус считывания линковок
static int get_number_of_readed_links(FILE *operation_file, link_t **links, int temp_cur)
{
    return fscanf(operation_file, "%d %d", &((*links)[temp_cur].p_1), &((*links)[temp_cur].p_2));
}

// Статус чтения линковок из файла
static int get_links_status(link_t **links, const int &number_of_links, FILE *operation_file)
{
    int temp_error_status = SUCCES_STATUS;

    if (get_alloc_links_status(links, number_of_links) != SUCCES_STATUS)
        temp_error_status = get_alloc_links_status(links, number_of_links);
    else
        for (int temp_cur = 0; temp_error_status == SUCCES_STATUS && temp_cur < number_of_links;  temp_cur++)
            if (get_number_of_readed_links(operation_file, links, temp_cur) != NUMBER_OF_NUMS)
                temp_error_status = ERROR_STATUS_FILE_DATA;

    return temp_error_status;
}

// Верификация запроса по линковке
static int get_temp_field_status(const object_t &object, int temp_cur)
{
    int temp_error_status = SUCCES_STATUS;

    if (object.links[temp_cur].p_1 < 0 || object.links[temp_cur].p_2 < 0 || object.links[temp_cur].p_1 > object.number_of_points - 1 || object.links[temp_cur].p_2 > object.number_of_points)
        temp_error_status = ERROR_STATUS;

    return temp_error_status;
}

// Провелка данных ввода полей
static int get_fields_status(const object_t &object)
{
    int temp_error_status = SUCCES_STATUS;

    for (int temp_cur = 0; temp_error_status == SUCCES_STATUS && temp_cur < object.number_of_links; temp_cur++)
        if (get_temp_field_status(object, temp_cur) == ERROR_STATUS)
            temp_error_status =  ERROR_STATUS_LINKS_POINTS;

    return temp_error_status;
}

// Копирование модели
static void transit_data_comparator(object_t &object, object_t &new_obj)
{
    object = new_obj;
}

// Компаратор закрытия файла
void close_file_comparator(FILE **operation_file)
{
    if (*operation_file != NULL)
        fclose(*operation_file);
}

// Статус загрузки файла
int get_model_loading_status(object_t &object, request &lf)
{
    FILE *operation_file = NULL;
    object_t new_obj = initialize_object();

    int temp_error_status = SUCCES_STATUS;

    if (get_open_file_status(&operation_file, lf.file_name) != SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_OPEN_FILE;
    else if (get_reading_file_data_status(new_obj.number_of_points, new_obj.number_of_links, operation_file) != SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_FILE_DATA;
    else if (get_memory_status(new_obj.number_of_points, new_obj.number_of_links) != SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_MEMORY;
    else if (get_points_status(&(new_obj.points), new_obj.number_of_points, operation_file) != SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_POINTS;
    else if (temp_error_status != SUCCES_STATUS)
        free_comparator(new_obj.points);
    else if (get_links_status(&(new_obj.links), new_obj.number_of_links, operation_file) != SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_LINKS;
    else if (get_fields_status(object) != SUCCES_STATUS)
        temp_error_status = ERROR_STATUS_FIELDS;
    else if (temp_error_status == SUCCES_STATUS)
        transit_data_comparator(object, new_obj);
    else if (temp_error_status != SUCCES_STATUS)
        free_object_comparator(new_obj);

    close_file_comparator(&operation_file);

    return temp_error_status;
}
