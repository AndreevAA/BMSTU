#include "../inc/operations.h"

int is_square_matrix(int *matrix_height, int *matrix_width);
int is_vertical_matrix(int *matrix_height, int *matrix_width);
int is_square_matrix(int *matrix_height, int *matrix_width);
int get_minimal_element(int *matrix_elements, int *matrix_height, int *matrix_width);
int update_minimanl_element_position(int *matrix_elements, int minimanl_element_position, int check_cursor);

int delete_min_string_or_table(struct matrix I)
{
	printf("(%d, %d, %d)\n", I.matrix_height, I.matrix_width, is_square_matrix(&I.matrix_height, &I.matrix_width));
	while (is_square_matrix(&I.matrix_height, &I.matrix_width) == ERROR_STATUS)
	{
		int minimanl_element_position = get_minimal_element(I.matrix_elements, &I.matrix_height, &I.matrix_width);
		if (is_vertical_matrix(&I.matrix_height, &I.matrix_width))
		{
			int min_elem_string = minimanl_element_position % I.matrix_width;
			for (int check_cursor = min_elem_string; check_cursor < I.matrix_height * I.matrix_width - 1; check_cursor++)
				I.matrix_indicators[check_cursor] = I.matrix_indicators[check_cursor + 1];
			//free(I.matrix_indicators[I.matrix_height * I.matrix_width - 1]);
			printf("%d\n", I.matrix_height);
			I.matrix_height -= 1;
			printf("%d\n", I.matrix_height);
			return 0;
		}
		else
		{
			return 0;
		}
	}

	return 0;
}

int get_minimal_element(struct matrix I)
{
	int minimanl_element_position = 0;
	for (int i = 0; i < I.matrix_height; i++)
		for (int check_cursor = 0; check_cursor < I.matrix_width; check_cursor++)
			minimanl_element_position = update_minimanl_element_position(*(*I.matrix_indicators[i] + check_cursor), minimanl_element_position);
	printf("(minimanl_element_position = %d)\n", minimanl_element_position);
	return minimanl_element_position;
}

int update_minimanl_element_position(int *matrix_elements, int minimanl_element_position, int check_cursor)
{
	if (matrix_elements[check_cursor] < minimanl_element_position)
		return check_cursor;
	return minimanl_element_position;
}

int is_vertical_matrix(int *matrix_height, int *matrix_width)
{
	return *matrix_height > *matrix_width;
}

int is_square_matrix(int *matrix_height, int *matrix_width)
{
	if ((*matrix_width) == (*matrix_height))
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}
