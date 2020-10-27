#include "../inc/io.h"

int get_matrix_size(int *height, int *width)
{
	return (scanf("%d", height) == 1 && scanf("%d", width));
}

int is_correct_matrix_size(int *height, int *width)
{
	return ((*width) >= MIN_SIZE && (*width) <= MAX_SIZE && (*height) >= MIN_SIZE && (*height) <= MAX_SIZE);
}

int get_matrix(struct matrix *i_matrix, int *i_height, int *i_width)
{
	i_matrix->height = *i_height;
	i_matrix->width = *i_width;
	i_matrix->indicators = (int **)malloc((i_matrix->height) * sizeof(int *));
	i_matrix->elements = (int *)malloc((i_matrix->height * i_matrix->width) * sizeof(int));

	for (int add_position = 0; add_position < (i_matrix->width * i_matrix->height); add_position++)
	{
		if (scanf("%d", &i_matrix->elements[add_position]) == 1)
		{
			if (add_position % i_matrix->width == 0)
				*(i_matrix->indicators + sizeof(void *) * (add_position / i_matrix->width)) = i_matrix->elements + add_position;
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

void output_matrix(struct matrix *i)
{
	for (int check_string_number = 0; check_string_number < i->height; check_string_number++)
	{
		for (int check_row_number = 0; check_row_number < i->width; check_row_number++)
			printf("%d ", *(i->indicators[check_string_number] + check_row_number));
		printf("\n");
	}
}
