#include "../inc/config.h"
#include "../inc/io.h"

int main()
{
	point_t *points = NULL;

	int number_of_points, number_of_interpolation;

	if (get_input_data(&points, &number_of_points) != SUCCESS_STATUS)
	{
		out_error();
		return ERROR_STATUS;
	}

	printf("ALL READ OK!\n");

	free(points);

	return SUCCESS_STATUS;
}
