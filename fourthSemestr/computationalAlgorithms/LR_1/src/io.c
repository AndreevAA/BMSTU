#include <stdio.h>
#include <stdlib.h>

#include "../inc/io.h"

#include "../inc/config.h"

int getting_file_data(FILE *operation_file, interpolation_operation **data)
{
    (*data)->total = 0;
    float x_values, y_values, first_derivative_values;

    int number_of_values = NUMBER_OF_VALUES;

    while (number_of_values == NUMBER_OF_VALUES && !feof(operation_file))
    {
        number_of_values = fscanf(operation_file, "%f%f%f\n", &x_values, &y_values, &first_derivative_values);
        (*data)->total++;
    }

    if (number_of_values != NUMBER_OF_VALUES && feof(operation_file))
    	return ERROR_STATUS;
    return SUCCESS_STATUS;
}

void write_read_data(FILE *operation_file, interpolation_operation *data)
{
	for (int temp_number_of_string = 0; temp_number_of_string < data->total; temp_number_of_string++)
    	fscanf(operation_file, "%f%f%f\n", &(data->x_values[temp_number_of_string]), &(data->y_values[temp_number_of_string]), &(data->first_derivative_values[temp_number_of_string]));
}

int file_reading(FILE *operation_file, interpolation_operation *data)
{   
    if (getting_file_data(operation_file, &data) == ERROR_STATUS)
    	return ERROR_STATUS;
    
    rewind(operation_file);
    data->x_values = malloc(sizeof(float) * data->total);
    data->y_values = malloc(sizeof(float) * data->total);
    data->first_derivative_values = malloc(sizeof(float) * data->total);

    write_read_data(operation_file, data);
    
    return SUCCESS_STATUS;
}

int get_x_reading_status(interpolation_operation *data)
{
	printf("Введите значение x: ");
    return scanf("%f", &data->x);
}

int get_number_of_polynomal_degree(interpolation_operation *data)
{
	printf("Введите значение степени полинома от 1 до 4: ");
    return scanf("%d", &data->number_of_polynomal_degree);
}

int is_right_input_data(interpolation_operation *data)
{
	if (data->number_of_polynomal_degree < 1 || data->number_of_polynomal_degree > 4)
		return ERROR_STATUS;
	return SUCCESS_STATUS;
}

int input_data(FILE *operation_file, interpolation_operation  *data)
{
    int temp_error_status = file_reading(operation_file, data);

    if (temp_error_status == SUCCESS_STATUS)
    {
        if (get_x_reading_status(data) != 1)
        	return ERROR_STATUS;

        if (get_number_of_polynomal_degree(data) != 1)
        	return ERROR_STATUS;

        if (is_right_input_data(data) == ERROR_STATUS)
        	return ERROR_STATUS;
    }
    return temp_error_status;
}

void output_polynom(interpolation_operation  data)
{

	printf("\nЗначения полиномов:\n\tНьютон:       %.6f\n\tЭрмит:        %.6f\n", data.y_newton_value, data.y_newton_value);
    free(data.first_data_inequality);
    free(data.second_data_inequality);
}

void output_function_root(interpolation_operation  data)
{
	printf("\nЗначение корня: %.6f\n", data.y_newton_value);
    free(data.first_data_inequality);
    free(data.x_values);
    free(data.y_values);
    free(data.first_derivative_values);
}

void get_config(interpolation_operation  *data)
{
    data->first_indicator = 0, data->second_indicator = 0;
    for (int i = 0; i < data->total - 1; i++)
    {
        if (data->x >= data->x_values[i] && data->x <= data->x_values[i + 1])
            data->first_indicator = i;
    }
    int step = (data->number_of_polynomal_degree + 1) / 2;
    if (data->total < data->number_of_polynomal_degree + 1)
    {
        printf("Need more data.\n");
    }
    else if ((data->number_of_polynomal_degree + 1) % 2 == 0)
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
    printf("\nУстановка: %f - %f\n", data->x_values[data->first_indicator], data->x_values[data->second_indicator]);
}

int get_opening_file_status(interpolation_operation  *data)
{
	FILE *f = fopen(INPUT_DATA_FILE, "r");

    int temp_opening_file_status = input_data(f, data);

    fclose(f);

    return temp_opening_file_status;
}
