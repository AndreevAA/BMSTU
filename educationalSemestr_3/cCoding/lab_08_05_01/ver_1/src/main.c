#include "../inc/config.h"
#include "../inc/io.h"
#include "../inc/matrix_operations.h"
#include "../inc/matrix_functions.h"

int main()
{
	int a_matrix_height, a_matrix_width;
	if (!get_matrix_size(&a_matrix_height, &a_matrix_width))
		return ERROR_WHILE_INPUT_SIZE;
	if (!is_correct_matrix_size(&a_matrix_height, &a_matrix_width))
		return ERROR_INPUT_SIZE;
	matrix a;
	if (get_matrix(&a, &a_matrix_height, &a_matrix_width) == ERROR_STATUS)
	{
		free_matrix(&a);
		return ERROR_INPUT_MATRIX;
	}
	int b_matrix_height, b_matrix_width;
	if (!get_matrix_size(&b_matrix_height, &b_matrix_width))
	{
		free_matrix(&a);
		return ERROR_WHILE_INPUT_SIZE;
	}
	if (!is_correct_matrix_size(&b_matrix_height, &b_matrix_width))
	{
		free_matrix(&a);
		return ERROR_INPUT_SIZE;
	}
	matrix b;
	if (get_matrix(&b, &b_matrix_height, &b_matrix_width) == ERROR_STATUS)
	{
		free_matrix(&a);
		free_matrix(&b);
		return ERROR_INPUT_MATRIX;
	}
	int ro, gamma;
	if (!get_degrees(&ro, &gamma))
	{
		free_matrix(&a);
		free_matrix(&b);
		return ERROR_WHILE_INPUT_DEGREES;
	}
	if (!is_correct_degree(&ro, &gamma))
	{
		free_matrix(&a);
		free_matrix(&b);
		return ERROR_INPUT_DEGREES;
	}

	if (del_comp(&a) == ERROR_STATUS || del_comp(&b) == ERROR_STATUS)
		return ERROR_DELETE_MATRIX;

	if (a.width > b.width)
		up_comp(&b, a.width);
	else if (a.width < b.width)
		up_comp(&a, b.width);

	// printf("\nFirst:\n");
	// out_matrix(&a);
	// printf("\nSecond:\n");
	// out_matrix(&b);

	pow_comp(&a, ro);
	pow_comp(&b, gamma);

	matrix ab;
	al_matrix(&ab, a.width, a.width);
	mult_comp(&ab, &a, &b);

	// printf("\nFirst:\n");
	// out_matrix(&a);
	// printf("\nSecond:\n");
	// out_matrix(&b);

	// printf("\nResult:\n");
	out_matrix(&ab);
	free_matrix(&a);
	free_matrix(&b);
	free_matrix(&ab);
	//out_matrix(matrix_b, &b_matrix_height, &b_matrix_width);
	return SUCCESS_STATUS;
}
