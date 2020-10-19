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

	for (int i = 0; i < A.matrix_height; i++)
	{
		printf("%d ", *(A.matrix_indicators[i]));
	}

	if (delete_min_string_or_table(A) || delete_min_string_or_table(B))
		return ERROR_DELETE_MATRIX;

	printf("\n\n");

	for (int i = 0; i < A.matrix_height; i++)
	{
		printf("%d ", *(A.matrix_indicators[i]));
	}
}