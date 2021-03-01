#include <stdio.h>
#include <stdlib.h>

#include "../inc/io.h"

#include "../inc/base_functions.h"
#include "../inc/newton_polynom.h"

void get_calculated_inequality_of_arguments_and_first_separated_inequality(interpolation_operation  *data)
{
    for (int i = 0; i < data->number_of_polynomal_degree; i++)
    {
        data->first_data_inequality[i * (data->number_of_polynomal_degree + 1)] = data->x - data->x_values[i + data->first_indicator];
        data->first_data_inequality[i * (data->number_of_polynomal_degree + 1) + 1] = (data->y_values[i + data->first_indicator] - data->y_values[i + 1 + data->first_indicator]) / (data->x_values[i + data->first_indicator] - data->x_values[i + 1 + data->first_indicator]);
    }
}

void get_calculated_staying_separated_inequality(interpolation_operation  *data)
{
    for (int j = 2; j < data->number_of_polynomal_degree + 1; j++)
            for (int i = 0; i < data->number_of_polynomal_degree - j + 1; i++)
                data->first_data_inequality[i * (data->number_of_polynomal_degree + 1) + j] = (data->first_data_inequality[i * (data->number_of_polynomal_degree + 1) + j - 1] - data->first_data_inequality[(i + 1) * (data->number_of_polynomal_degree + 1) + j - 1]) / (data->x_values[i + data->first_indicator] - data->x_values[i + j + data->first_indicator]);
} 

void divided_difference_newton(interpolation_operation  *data)
{
    data->first_data_inequality = malloc(sizeof(float) * (data->number_of_polynomal_degree + 1) * (data->number_of_polynomal_degree + 1));
    
    get_calculated_inequality_of_arguments_and_first_separated_inequality(data);
    get_calculated_staying_separated_inequality(data);
}

void get_newton_polynom(interpolation_operation  *data)
{
    data->y_newton_value = data->y_values[data->first_indicator];
    float buf_x = 1;
    for (int i = 1; i < data->number_of_polynomal_degree + 1; i++)
    {
        buf_x *= data->first_data_inequality[(i - 1) * (data->number_of_polynomal_degree + 1)];
        data->y_newton_value += buf_x * data->first_data_inequality[i];
    }
}
