#include <stdio.h>
#include <stdlib.h>

#include "../inc/io.h"

#include "../inc/armit_polynom.h"


void get_calculated_inequality_of_arguments(interpolation_operation  *data)
{
    for (int i = 0; i < data->number_of_polynomal_degree + 1; i++)
            data->second_data_inequality[i * 2 * (data->number_of_polynomal_degree + 1)] = data->x - data->x_values[i + data->first_indicator];
}

void get_calculated_first_separated_inequality(interpolation_operation  *data)
{
    for (int i = 0; i < 2 * data->number_of_polynomal_degree + 1; i++)
            if (i % 2 == 0)
                data->second_data_inequality[i * 2 * (data->number_of_polynomal_degree + 1) + 1] = data->first_derivative_values[i / 2 + data->first_indicator];
            else
                data->second_data_inequality[i * 2 * (data->number_of_polynomal_degree + 1) + 1] = (data->y_values[i / 2 + data->first_indicator] - data->y_values[(i + 1) / 2 + data->first_indicator]) / (data->x_values[i / 2 + data->first_indicator] - data->x_values[(i + 1) / 2 + data->first_indicator]);
}

void get_calculated_remaining_separated_inequality(interpolation_operation  *data)
{
    for (int j = 2; j < 2 * (data->number_of_polynomal_degree + 1); j++)
            for (int i = 0; i < 2 * (data->number_of_polynomal_degree + 1) - j; i++)
                if (i % 2 == 0)
                    data->second_data_inequality[i * 2 * (data->number_of_polynomal_degree + 1) + j] = (data->second_data_inequality[i * 2 * (data->number_of_polynomal_degree + 1) + j - 1] - data->second_data_inequality[(i + 1) * 2 * (data->number_of_polynomal_degree + 1) + j - 1]) / (data->x_values[i / 2 + data->first_indicator] - data->x_values[i / 2 + j / 2 + data->first_indicator]);
                else
                    data->second_data_inequality[i * 2 * (data->number_of_polynomal_degree + 1) + j] = (data->second_data_inequality[i * 2 * (data->number_of_polynomal_degree + 1) + j - 1] - data->second_data_inequality[(i + 1) * 2 * (data->number_of_polynomal_degree + 1) + j - 1]) / (data->x_values[i / 2 + data->first_indicator] - data->x_values[i / 2 + j / 2 + j % 2 + data->first_indicator]);
}

void divided_difference_armit(interpolation_operation  *data)
{
    data->second_data_inequality = malloc(sizeof(float) * 2 * (data->number_of_polynomal_degree + 1) * 2 * (data->number_of_polynomal_degree + 1));
    
    get_calculated_inequality_of_arguments(data);
    get_calculated_first_separated_inequality(data);
    get_calculated_remaining_separated_inequality(data);
}

void get_armit_polynom(interpolation_operation  *data)
{
    data->y_armit_value = data->y_values[data->first_indicator];
    float buf_x = 1;
    for (int i = 1; i < 2 * (data->number_of_polynomal_degree + 1); i++)
    {
        buf_x *= data->second_data_inequality[(i - 1) / 2 * 2 * (data->number_of_polynomal_degree + 1)];
        data->y_armit_value += buf_x * data->second_data_inequality[i];
    }
}
