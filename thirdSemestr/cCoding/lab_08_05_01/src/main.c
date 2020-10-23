#include "../inc/config.h"
#include "../inc/io.h"
#include "../inc/operations.h"

int main()
{
	int a_matrix_height, a_matrix_width;
	if (!get_matrix_size(&a_matrix_height, &a_matrix_width))
		return ERROR_WHILE_INPUT_SIZE;
	if (!is_correct_matrix_size(&a_matrix_height, &a_matrix_width))
		return ERROR_INPUT_SIZE;
	struct matrix a; 

	int b_matrix_height, b_matrix_width;
	if (!get_matrix_size(&b_matrix_height, &b_matrix_width))
		return ERROR_WHILE_INPUT_SIZE;
	if (!is_correct_matrix_size(&b_matrix_height, &b_matrix_width))
		return ERROR_INPUT_SIZE;
	struct matrix b;

	if (get_matrix(&a, &a_matrix_height, &a_matrix_width) || get_matrix(&b, &b_matrix_height, &b_matrix_width))
		return ERROR_INPUT_MATRIX;

	if (delete_min_string_or_table(&a) || delete_min_string_or_table(&b))
		return ERROR_DELETE_MATRIX;

	int ro, gamma;
	if (!get_degrees(&ro, &gamma))
		return ERROR_WHILE_INPUT_DEGREES;

	if (!is_correct_degree(&ro, &gamma))
		return ERROR_INPUT_DEGREES;

	if (is_correct_new_size(&a, &b) == ERROR_STATUS)
		return ERROR_NEW_SIZE;

	// printf("\n");
	// output_matrix(&A);

	// printf("\n");
	// output_matrix(&B);

	struct matrix ab;
	if (get_multiplicated_powed_matrix(&ab, &a, &b, &ro, &gamma))
		output_matrix(&ab);	
	return SUCCESS_STATUS;
}
