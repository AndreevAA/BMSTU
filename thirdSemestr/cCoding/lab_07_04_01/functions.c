#include "functions.h"

void filter_integer_vector(int *integer_vector, int size_of_integer_vector, int argc)
{
	if (argc == MAX_NUM_OF_ARGC)
	{
		printf("Запрос фильтрации перед сортировкой;\n");
	}
}

int update_selected_position(int start_check_point, int *integer_vector, int end_check_point)
{
	int temp_min_digit = integer_vector[start_check_point], temp_min_digit_position = start_check_point;
	for (int temp_check_point = start_check_point; temp_check_point < end_check_point; temp_check_point++)
		if (integer_vector[temp_check_point] < temp_min_digit)
		{
			temp_min_digit = integer_vector[temp_check_point];
			temp_min_digit_position = temp_check_point;
		}
	return temp_min_digit_position;
}

void sort_integer_vector(int *integer_vector, int size_of_integer_vector)
{
	int input_cursor = 0, temp_min_digit, selected_position;

	while (input_cursor <= size_of_integer_vector - 1)
	{
		selected_position = update_selected_position(input_cursor + 1, integer_vector, size_of_integer_vector);
		int temp_integer_vector_input_cursur = integer_vector[input_cursor + 1];
		integer_vector[input_cursor + 1] = integer_vector[selected_position];
		integer_vector[selected_position] = temp_integer_vector_input_cursur;
		input_cursor++;
	}
}
