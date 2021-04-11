#include "../inc/io.h"

int get_num_of_points(FILE *operation_file, int *num_of_points)
{
	if (fscanf(operation_file, "%d", num_of_points) != 1)
		return ERROR_STATUS;
	return SUCCESS_STATUS;
}

int get_matrix_temp_number(FILE *operation_file, int *temp_number)
{
	if (fscanf(operation_file, "%d", temp_number) != 1)
		return ERROR_STATUS;
	return SUCCESS_STATUS;
}

int get_ways_matrix(matrix *adjacency_matrix, FILE *operation_file)
{
	for (int num_of_string = 0; num_of_string < adjacency_matrix->num_of_points; num_of_string++)
		for (int num_of_row = 0; num_of_row < adjacency_matrix->num_of_points; num_of_row++)
			if (fscanf(operation_file, "%d", &adjacency_matrix->content[num_of_string][num_of_row]) != 1)
				return ERROR_STATUS;
	return SUCCESS_STATUS;
}

void al_matrix(matrix *temp_matrix)
{
	int **matrix = (int**)malloc(sizeof(int*) * (temp_matrix->num_of_points));
	for (unsigned int cur = 0; cur < temp_matrix->num_of_points; cur++)
		*(matrix + cur) = (int*)malloc(sizeof(int) * temp_matrix->num_of_points);
	temp_matrix->content = matrix;
}

int is_matrix_sim(matrix *temp_matrix)
{
	for (int num_of_string = 0; num_of_string < temp_matrix->num_of_points; num_of_string++)
		for (int num_of_row = 0; num_of_row < temp_matrix->num_of_points; num_of_row++)
			if (temp_matrix->content[num_of_string][num_of_row] != temp_matrix->content[num_of_row][num_of_string])
				return ERROR_STATUS;
	return SUCCESS_STATUS;
}

int get_graf(matrix *adjacency_matrix)
{
	int num_of_points;
	FILE *operation_file = fopen(FILENAME, "r+");
	if (get_num_of_points(operation_file, &num_of_points) == ERROR_STATUS)
	{
		fclose(operation_file);
		return ERROR_STATUS;
	}
	adjacency_matrix->num_of_points = num_of_points;
	al_matrix(adjacency_matrix);
	if (get_ways_matrix(adjacency_matrix, operation_file) == ERROR_STATUS)
	{
		fclose(operation_file);
		return ERROR_STATUS;
	}
	if (is_matrix_sim(adjacency_matrix) == ERROR_STATUS)
	{
		fclose(operation_file);
		return ERROR_STATUS;
	}
	return SUCCESS_STATUS;
}
