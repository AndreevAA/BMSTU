#include "../inc/matrix_operations.h"
#include "../inc/matrix_checkers.h"
#include "../inc/matrix_functions.h"
#include "../inc/io.h"

int del_comp(matrix *temp_matrix)
{
	while (is_square_matrix(temp_matrix) == ERROR_STATUS)
	{
		if (is_ver_matrix(temp_matrix) == SUCCESS_STATUS)
			del_str(temp_matrix);
		else
			del_row(temp_matrix);
	}
	return SUCCESS_STATUS;
}

void up_comp(matrix *temp_matrix, int n_size)
{
	matrix up_matrix;
	al_matrix(&up_matrix, n_size, n_size);
	cpy_matrix(&up_matrix, temp_matrix);
	up_matrix.height = temp_matrix->height;
	up_matrix.width = temp_matrix->width;
	out_matrix(&up_matrix);
	up_str(&up_matrix, n_size);
	up_row(&up_matrix, n_size);
	free_matrix(temp_matrix);
	al_matrix(temp_matrix, n_size, n_size);
	up_matrix.height = n_size;
	up_matrix.width = n_size;
	cpy_matrix(temp_matrix, &up_matrix);
	free_matrix(&up_matrix);
}

void mult_comp(matrix *result, matrix *first, matrix *second)
{
	for (int cur_h = 0; cur_h < first->height; cur_h++)
	{
		for (int cur_w = 0; cur_w < second->width; cur_w++)
		{
			result->content[cur_h][cur_w] = get_multed_vec(first, second, cur_h, cur_w);
		}
	}
}

void pow_comp(matrix *temp_matrix, int degree)
{
	if (degree == 0)
		up_to_one(temp_matrix);
	else if (degree > 1)
		pow_matrix(temp_matrix, degree);
}
