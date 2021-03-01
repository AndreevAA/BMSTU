#include <stdio.h>
#include <stdlib.h>

#include "../inc/io.h"

#include "../inc/base_functions.h"

#include "../inc/newton_polynom.h"
#include "../inc/armit_polynom.h"

#include "../inc/check_functions.h"

#include "../inc/config.h"

#include "../inc/comparators.h"

void swap(interpolation_operation  *data, int starting_position, int ending_position)
{
    float a = data->x_values[starting_position], b = data->y_values[starting_position], c = data->first_derivative_values[starting_position];
    data->x_values[starting_position] = data->x_values[ending_position], data->y_values[starting_position] = data->y_values[ending_position], data->first_derivative_values[starting_position] = data->first_derivative_values[ending_position];
    data->x_values[ending_position] = a, data->y_values[ending_position] = b, data->first_derivative_values[ending_position] = c;
}

void displacement_data(interpolation_operation  *data, int min_position, int max_position)
{
    for (int temp_position = min_position; temp_position < max_position; temp_position++)
        swap(data, temp_position, max_position);
}

void sort_data(interpolation_operation  *data)
{
    for (int right_search_cur = 1; right_search_cur < data->total; right_search_cur++)
        for (int left_search_cur = 0; left_search_cur < right_search_cur; left_search_cur++)
            if (data->x_values[right_search_cur] < data->x_values[left_search_cur])
                displacement_data(data, left_search_cur, right_search_cur);
}

void swap_columns(interpolation_operation  *data)
{
    float buf = 0;
    for (int i = 0; i < data->total; i++)
    {
        buf = data->x_values[i];
        data->x_values[i] = data->y_values[i];
        data->y_values[i] = buf;
    }

    data->x = 0;

    data_transmission_comparator(data);
    divided_difference_newton(data);
}
