#include <stdio.h>
#ifndef CONFIG_H

#define CONFIG_H

#define SUCCESS_STATUS 0
#define ERROR_STATUS 1

#define NUMBER_OF_VALUES 3

#define INPUT_DATA_FILE "data/data_1.txt"

typedef struct interpolation_operation interpolation_operation;

struct interpolation_operation
{
	float y_newton_value, y_armit_value;
	float *first_data_inequality, *second_data_inequality;
	float *x_values, *y_values, *first_derivative_values, x;
	int number_of_polynomal_degree, first_indicator, second_indicator, total;
};


#endif
