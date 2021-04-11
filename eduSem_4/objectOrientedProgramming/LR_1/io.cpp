#include "io.h"
#include "values_checker.h"
#include "controller.h"

// Статус открытия файла
static int open_file(FILE **operation_file, const char *temp_operation_file_name)
{
    int temp_error_status = !is_data_null(temp_operation_file_name);

    if (temp_error_status == SUCCES_STATUS)
         *operation_file = fopen(temp_operation_file_name, "r");

    return temp_error_status;
}

// Статус чтения данных из файла
static int read_points_and_links_num(int &number_of_points, int &number_of_links, FILE *operation_file)
{
    int temp_error_status = SUCCES_STATUS;

    if (fscanf(operation_file, "%d %d", &number_of_points, &number_of_links) != NUMBER_OF_NUMS)
        temp_error_status =  ERROR_STATUS_FILE_DATA;

    return temp_error_status;
}

// Статус выделения памяти
static int get_alloc_points_status(point_t **points, const int &number_of_points)
{
    *points = (point_t*)malloc(number_of_points * sizeof(point_t));

    int temp_error_status = !is_data_null(*points) ;

    if (temp_error_status != SUCCES_STATUS)
        free_points(*points);

    return temp_error_status;
}

// Статус выделения памяти
static int get_alloc_links_status(link_t **links, const int &number_of_links)
{
    *links = (link_t*)malloc(number_of_links * sizeof(link_t));

    int temp_error_status = !is_data_null(*links);

    if (temp_error_status != SUCCES_STATUS)
        free_links(*links);

    return temp_error_status;
}

// Статус считывания координат
static int get_number_of_readed_coordinates(FILE *operation_file, point_t **points, int temp_cur)
{
    return fscanf(operation_file, "%f %f %f", &((*points)[temp_cur].x), &((*points)[temp_cur].y), &((*points)[temp_cur].z));
}

// Статус чтения точек из файла
static int read_points(point_t **points, const int &number_of_points, FILE *operation_file)
{
    int temp_error_status = get_alloc_points_status(points, number_of_points);

    if (temp_error_status == SUCCES_STATUS)
        for (int temp_cur = 0; temp_cur < number_of_points && temp_error_status == SUCCES_STATUS; temp_cur++)
            if (get_number_of_readed_coordinates(operation_file, points, temp_cur) != NUMBER_OF_COORDINATES)
                temp_error_status = ERROR_STATUS_FILE_DATA;

    if (temp_error_status != SUCCES_STATUS)
        free_points(*points);

    return temp_error_status;
}

// Статус считывания линковок
static int get_number_of_readed_links(FILE *operation_file, link_t **links, int temp_cur)
{
    return fscanf(operation_file, "%d %d", &((*links)[temp_cur].p_1), &((*links)[temp_cur].p_2));
}

// Статус чтения линковок из файла
static int read_links(link_t **links, const int &number_of_links, FILE *operation_file)
{
    int temp_error_status = get_alloc_links_status(links, number_of_links);

    if (temp_error_status == SUCCES_STATUS)
        for (int temp_cur = 0; temp_error_status == SUCCES_STATUS && temp_cur < number_of_links;  temp_cur++)
            if (get_number_of_readed_links(operation_file, links, temp_cur) != NUMBER_OF_NUMS)
                temp_error_status = ERROR_STATUS_FILE_DATA;

    if (temp_error_status != SUCCES_STATUS)
        free_links(*links);

    return temp_error_status;
}

// Компаратор закрытия файла
void close_file(FILE **operation_file)
{
    if (*operation_file != NULL)
        fclose(*operation_file);
}

// Чтение объекта из файла 
int read_object(object_t &temp_object, FILE *operation_file)
{
    int temp_error_status = read_points_and_links_num(temp_object.number_of_points, temp_object.number_of_links, operation_file);

    // Чтение точек
    if (temp_error_status == SUCCES_STATUS)
        temp_error_status = read_points(&(temp_object.points), temp_object.number_of_points, operation_file);

    // Чтение связей
    if (temp_error_status == SUCCES_STATUS)
    {
        temp_error_status = read_links(&(temp_object.links), temp_object.number_of_links, operation_file);

        if (temp_error_status != SUCCES_STATUS)
            free_points(temp_object.points);
    }

    return temp_error_status;
}

// Статус загрузки файла
int load_file_figure(object_t &object, request &lf)
{
    FILE *operation_file = NULL;
    object_t temp_object = initialize_object();

    int temp_error_status = SUCCES_STATUS;

    // Непосредственное открытие файла и чтение
    temp_error_status = open_file(&operation_file, lf.file_name);

    // Чтение объекта из файла
    if (temp_error_status == SUCCES_STATUS)
        temp_error_status = read_object(temp_object, operation_file);

    // Проверка после чтения
    if (temp_error_status == SUCCES_STATUS)
        object = temp_object;
    else
        free_object(temp_object);

    // Закрытие файла
    close_file(&operation_file);

    return temp_error_status;
}
