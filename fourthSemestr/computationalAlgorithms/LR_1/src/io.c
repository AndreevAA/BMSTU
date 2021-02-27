#include "../inc/io.h"
#include "../inc/config.h"

int get_input_data(point_t **points, int *number_of_points)
{
	FILE *operation_file = fopen(FILE_NAME, "r");

	if (operation_file == NULL)
		return ERROR_STATUS;

	if (fscanf(operation_file, "%d", number_of_points) != 1)
	{
		fclose(operation_file);
		return ERROR_STATUS;
	}

	if (*number_of_points <= 0)
	{
		fclose(operation_file);
		return ERROR_STATUS;
	}

	int add_number = 0;
	*points = (point_t*) malloc(*number_of_points * sizeof(point_t));

	while (fscanf(operation_file, "%lf", &(*points)[add_number].x) != EOF)
		if (fscanf(operation_file, "%lf",&(*points)[add_number].y) != EOF)
			if (fscanf(operation_file, "%lf", &(*points)[add_number].derivative) != EOF)
				add_number++;

	if (add_number != *number_of_points)
	{
		fclose(operation_file);
		return ERROR_STATUS;
	}

	fclose(operation_file);
	return SUCCESS_STATUS;
}

void out_error()
{
	printf("В процессе выполнения программы произошла ошибка.\n");
}

void out_programm_end()
{
	printf("Programm has ended work...\n");
}

void welcome_command()
{
	printf("Construction and software implementation of an algorithm for polynomial interpolation of table functions.\n\n");
}

void out_table_head()
{
	printf("n / y(x) | P.Newton | P.Ermitta\n");
}
