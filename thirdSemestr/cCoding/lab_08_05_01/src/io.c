#include "../inc/io.h"

int get_matrix_size(int *matrix_height, int *matrix_width)
{
	return (scanf("%d", matrix_height) == 1 && scanf("%d", matrix_width));
}

int is_correct_matrix_size(int *matrix_height, int *matrix_width)
{
	return ((*matrix_width) >= MIN_SIZE && (*matrix_width) <= MAX_SIZE && (*matrix_width) >= MIN_SIZE && (*matrix_width) <= MAX_SIZE);
}

int get_matrix(struct matrix *I_matrix, int *I_matrix_height, int *I_matrix_width)
{
	I_matrix->matrix_height = *I_matrix_height;
	I_matrix->matrix_width = *I_matrix_width;
	I_matrix->matrix_indicators = (int **)malloc((I_matrix->matrix_height) * sizeof(int *));
	I_matrix->matrix_elements = (int *)malloc((I_matrix->matrix_height * I_matrix->matrix_width) * sizeof(int));

	for (int add_position = 0; add_position < (I_matrix->matrix_width * I_matrix->matrix_height); add_position++)
	{
		if (scanf("%d", &I_matrix->matrix_elements[add_position]) == 1)
		{
			if (add_position % I_matrix->matrix_width == 0)
				*(I_matrix->matrix_indicators + sizeof(void) * (add_position / I_matrix->matrix_width)) = I_matrix->matrix_elements + add_position;
		}
		else
		{
			return ERROR_STATUS;
		}
	}
	return SUCCESS_STATUS;
}

int get_degrees(int *ro, int *gamma)
{
	return (scanf("%d", ro) == 1 && scanf("%d", gamma));
}

int is_correct_degree(int *ro, int *gamma)
{
	return (*ro >= 0 && *gamma >= 0);
}

void output_matrix(struct matrix *I)
{
	for (int check_string_number = 0; check_string_number < I->matrix_height; check_string_number++)
	{
		for (int check_row_number = 0; check_row_number < I->matrix_width; check_row_number++)
			printf("%d ", *(I->matrix_indicators[check_string_number] + check_row_number));
		printf("\n");
	}
}
