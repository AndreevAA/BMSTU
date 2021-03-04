#include <stdio.h>
#include <stdlib.h>

#include "../inc/io.h"

#include "../inc/base_functions.h"

#include "../inc/newton_polynom.h"
#include "../inc/armit_polynom.h"

#include "../inc/check_functions.h"

#include "../inc/config.h"

#include "../inc/comparators.h"

void data_transmission_comparator(interpolation_operation  *data)
{
	sort_data(data);
	get_config(data);
}

void getting_dif_polynom_comparator(interpolation_operation  *data)
{
	divided_difference_newton(data);
    divided_difference_armit(data);
}

void dif_polynom_comparator(interpolation_operation  *data, int temp_monotony_status)
{
	getting_dif_polynom_comparator(data);

    if (data->first_data_inequality && data->second_data_inequality)
    {
        get_newton_polynom(data);
        get_armit_polynom(data);
        output_polynom(*data);
    }
    if (temp_monotony_status)
    {
        swap_columns(data);

        if (data->first_data_inequality)
        {
            get_newton_polynom(data);
            output_function_root(*data);
        }
    }
    else
        printf("Function is not monotonous.\n");
}

void data_tranmission_comparator(interpolation_operation *data)
{
    int step = (data->number_of_polynomal_degree + 1) / 2;


    if ((data->number_of_polynomal_degree + 1) % 2 == 0)
    {
        if (data->first_indicator - step >= 0)
        {
            if (data->first_indicator + step <= data->total - 1)
            {
                data->second_indicator = data->first_indicator + step;
                data->first_indicator -= step - 1;
            }
            else
            {
                data->second_indicator = data->total - 1;
                data->first_indicator = data->total - step * 2;
            }
        }
        else
        {
            data->first_indicator = 0;
            data->second_indicator = step * 2 - 1;
        }
    }
    else
    {
        if (data->first_indicator - step + 1 >= 0)
        {
            if (data->first_indicator + step <= data->total - 1)
            {
                data->second_indicator = data->first_indicator + step;
                data->first_indicator -= step;
            }
            else
            {
                data->second_indicator = data->total - 1;
                data->first_indicator = data->total - 1 - step * 2;
            }
        }
        else
        {
            data->first_indicator = 0;
            data->second_indicator = step * 2;
        }
    }
}
