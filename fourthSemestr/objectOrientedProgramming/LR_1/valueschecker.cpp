#include "valueschecker.h"
#include "config.h"
#include "io.h"
#include "object.h"

// Проверка данных на NULL
int is_data_null(const void *temp_data)
{
    int temp_error_status = SUCCES_STATUS;

    if (temp_data)
        temp_error_status = ERROR_STATUS;

    return temp_error_status;
}

// Проверка данных
int is_zero_data(int temp_number)
{
    int temp_error_status = SUCCES_STATUS;

    if (temp_number >= 0)
        temp_error_status = ERROR_STATUS;

    return temp_error_status;
}

// Компаратор освобождения памяти
void free_comparator(void *points)
{
    free(points);
}
