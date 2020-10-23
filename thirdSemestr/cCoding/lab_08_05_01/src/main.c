#include "../inc/config.h"
#include "../inc/io.h"
#include "../inc/operations.h"

int main()
{
	int A_matrix_height, A_matrix_width;
	if (!get_matrix_size(&A_matrix_height, &A_matrix_width))
		return ERROR_WHILE_INPUT_SIZE;
	if (!is_correct_matrix_size(&A_matrix_height, &A_matrix_width))
		return ERROR_INPUT_SIZE;
	struct matrix A; 

	int B_matrix_height, B_matrix_width;
	if (!get_matrix_size(&B_matrix_height, &B_matrix_width))
		return ERROR_WHILE_INPUT_SIZE;
	if (!is_correct_matrix_size(&B_matrix_height, &B_matrix_width))
		return ERROR_INPUT_SIZE;
	struct matrix B;

	if (get_matrix(&A, &A_matrix_height, &A_matrix_width) || get_matrix(&B, &B_matrix_height, &B_matrix_width))
		return ERROR_INPUT_MATRIX;

	if (delete_min_string_or_table(&A) || delete_min_string_or_table(&B))
		return ERROR_DELETE_MATRIX;

	int ro, gamma;
	if (!get_degrees(&ro, &gamma))
		return ERROR_WHILE_INPUT_DEGREES;

	if (!is_correct_degree(&ro, &gamma))
		return ERROR_INPUT_DEGREES;

	if (is_correct_new_size(&A, &B) == ERROR_STATUS)
		return ERROR_NEW_SIZE;

	// printf("\n");
	// output_matrix(&A);

	// printf("\n");
	// output_matrix(&B);

	struct matrix AB;
	if (get_multiplicated_powed_matrix(&AB, &A, &B, &ro, &gamma))
		output_matrix(&AB);	
	return SUCCESS_STATUS;
}
