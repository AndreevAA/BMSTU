#include "../inc/config.h"
#include "../inc/io.h"
#include "../inc/polynom_newton.h"
#include "../inc/polynom_ermit.h"

void get_comparation_table(int min_polynom_level, int max_polynom_level, point_t **points, int number_of_points)
{
	out_table_head();

	for (int temp_polynom_level = min_polynom_level; temp_polynom_level <= max_polynom_level; temp_polynom_level++)
		printf("%d | %lf | %lf\n", temp_polynom_level, get_function_value_with_polynom_level_newton(temp_polynom_level, points, number_of_points), get_function_value_with_polynom_level_ermit(temp_polynom_level, points, number_of_points));
}

void get_sqrt_with_interpolation_with_newton(point_t **points, int number_of_points)
{
	printf("\nRoot of the table function using Newton interpolation: %d\n\n", 1);
}

int main()
{
	welcome_command();

	point_t *points = NULL;

	int number_of_points;

	if (get_input_data(&points, &number_of_points) != SUCCESS_STATUS)
	{
		out_error();
		return ERROR_STATUS;
	}

	get_comparation_table(1, 4, &points, number_of_points);
	get_sqrt_with_interpolation_with_newton(&points, number_of_points);

	free(points);
	out_programm_end();
	return SUCCESS_STATUS;
}
