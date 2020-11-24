#include "../inc/matrix_checkers.h"

int is_square_matrix(matrix *temp_matrix)
{
	if (temp_matrix->height == temp_matrix->width)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_ver_matrix(matrix *temp_matrix)
{
	if (temp_matrix->height > temp_matrix->width)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_first_min(int first_number, int second_number)
{
	if (first_number < second_number)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}
