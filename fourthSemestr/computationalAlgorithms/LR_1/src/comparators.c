#include <stdio.h>
#include <stdlib.h>

#include "../inc/io.h"

#include "../inc/base_functions.h"

#include "../inc/newton_polynom.h"
#include "../inc/armit_polynom.h"

#include "../inc/check_functions.h"

#include "../inc/config.h"

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
