#include "../inc/io.h"

int get_matrix_size(int *height, int *width)
{
	return (scanf("%d", height) == 1 && scanf("%d", width));
}

int is_correct_matrix_size(int *height, int *width)
{
	return ((*width) >= MIN_SIZE && (*width) <= MAX_SIZE && (*width) >= MIN_SIZE && (*width) <= MAX_SIZE);
}

int get_matrix(struct matrix *I_matrix, int *I_height, int *I_width)
{
	I_matrix->height = *I_height;
	I_matrix->width = *I_width;
	I_matrix->indicators = (int **)malloc((I_matrix->height) * sizeof(int *));
	I_matrix->elements = (int *)malloc((I_matrix->height * I_matrix->width) * sizeof(int));

	for (int add_position = 0; add_position < (I_matrix->width * I_matrix->height); add_position++)
	{
		if (scanf("%d", &I_matrix->elements[add_position]) == 1)
		{
			if (add_position % I_matrix->width == 0)
				*(I_matrix->indicators + sizeof(void) * (add_position / I_matrix->width)) = I_matrix->elements + add_position;
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
	for (int check_string_number = 0; check_string_number < I->height; check_string_number++)
	{
		for (int check_row_number = 0; check_row_number < I->width; check_row_number++)
			printf("%d ", *(I->indicators[check_string_number] + check_row_number));
		printf("\n");
	}
}
