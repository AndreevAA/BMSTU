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

	//printf("%d x %d\n", a_matrix_height, a_matrix_width);
	struct matrix a;
	if (get_matrix(&a, &a_matrix_height, &a_matrix_width))
	{
		free_matrix(&a);
		return ERROR_INPUT_MATRIX;
	}

	int b_matrix_height, b_matrix_width;
	if (!get_matrix_size(&b_matrix_height, &b_matrix_width))
		return ERROR_WHILE_INPUT_SIZE;	
	if (!is_correct_matrix_size(&b_matrix_height, &b_matrix_width))
		return ERROR_INPUT_SIZE;
	struct matrix b;
	//printf("%d x %d\n", b_matrix_height, b_matrix_width);
	if (get_matrix(&b, &b_matrix_height, &b_matrix_width))
	{
		free_matrix(&a);
		free_matrix(&b);
		return ERROR_INPUT_MATRIX;
	}
  /// here 
  int ro, gamma;

	if (!get_degrees(&ro, &gamma))
	{
		free_matrix(&a);
		free_matrix(&b);
		return ERROR_WHILE_INPUT_DEGREES;
	}

	//printf("HERE2\n");
	if (!is_correct_degree(&ro, &gamma))
	{
		free_matrix(&a);
		free_matrix(&b);
		return ERROR_INPUT_DEGREES;
	}
  
	printf("--->\n");
	printf("After input:\n\n");
	printf("A:\n");
	output_matrix(&a);

	printf("\nB:\n");
	output_matrix(&b);
	printf("<---\n");
	
	if (delete_min_string_or_table(&a) || delete_min_string_or_table(&b))
	{
		free_matrix(&a);
		free_matrix(&b);
		return ERROR_DELETE_MATRIX;
	}

	printf("--->\n");
	printf("After delete:\n\n");
	printf("A:\n");
	output_matrix(&a);

	printf("\nB:\n");
	output_matrix(&b);
	printf("<---\n");


	if (a.width > b.width)
		update_matrix(&b, a.width);
	else if (a.width < b.width)
		update_matrix(&a, b.width);
	//printf("HERE3\n");
	// if (is_correct_new_size(&a, &b) == ERROR_STATUS)
	// {
	// 	free_matrix(&a);
	// 	free_matrix(&b);
	// 	return ERROR_NEW_SIZE;
	// }

  printf("--->\n");
	printf("After update_matrix:\n\n");
	printf("A:\n");
	output_matrix(&a);

	printf("\nB:\n");
	output_matrix(&b);
	printf("<---\n");

	//printf("HERE4\n");
	struct matrix ab;
	if (get_multiplicated_powed_matrix(&ab, &a, &b, &ro, &gamma))
	{
		printf("--->\n");
		printf("After pow:\n\n");
		printf("A:\n");
		output_matrix(&a);

		printf("\nB:\n");
		output_matrix(&b);
		printf("<---\n");
		output_matrix(&ab);	
		free_matrix(&a);
		free_matrix(&b);
		free_matrix(&ab);
		return SUCCESS_STATUS;
	}

	//printf("HERE5\n");
	free_matrix(&a);
	free_matrix(&b);
	free_matrix(&ab);
	return ERROR_STATUS;
}


/*
Возведение в нулевую степень не работает, она должна стать единичной.
1 0 0
0 1 0
0 0 1
x
1 3 5
2 4 6
1 3 5
=
1 3 5
2 4 6
1 3 5
*/