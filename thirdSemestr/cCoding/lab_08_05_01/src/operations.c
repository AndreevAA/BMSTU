#include "../inc/operations.h"

int is_square_matrix(int *height, int *width);
int is_vertical_matrix(int *height, int *width);
int is_square_matrix(int *height, int *width);
int get_minimal_element(struct matrix *i, int is_vertical_matrix);
int up_min_elem_pos(int *elements, int min_elem_pos, int check_cursor);
int pow_matrix(struct matrix *i, int degree);
int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix);
int get_sum(struct matrix *first_matrix, struct matrix *second_matrix, int check_string_number, int check_row_number);

int delete_min_string_or_table(struct matrix *i)
{
	while (is_square_matrix(&i->height, &i->width) == ERROR_STATUS)
	{
		if (is_vertical_matrix(&i->height, &i->width))
		{
			for (int check_string_number = get_minimal_element(i, SUCCESS_STATUS); check_string_number < i->height - 1; check_string_number++)
				i->indicators[check_string_number] = i->indicators[check_string_number + 1];
			i->height--;
			return SUCCESS_STATUS;
		}
		else
		{
			int temp_check_row_number = get_minimal_element(i, ERROR_STATUS);
			for (int check_string_number = 0; check_string_number < i->height; check_string_number++)
				for (int check_row_number = temp_check_row_number; check_row_number < i->width - 1; check_row_number++)
					i->elements[check_string_number * i->width + check_row_number] = i->elements[check_string_number * i->width + check_row_number + 1];
			i->width--;
			return SUCCESS_STATUS;
		}
	}
	return ERROR_STATUS;
}

int get_multiplicated_powed_matrix(struct matrix *ab, struct matrix *a, struct matrix *b, int *ro, int *gamma)
{
	if (pow_matrix(a, *ro) == SUCCESS_STATUS && pow_matrix(b, *gamma) == SUCCESS_STATUS)
	{
		ab->height = a->height;
		ab->width = b->width;
		ab->indicators = (int **)malloc((ab->height) * sizeof(int *));
		ab->elements = (int *)malloc((ab->height * ab->width) * sizeof(int));
		if (mult_matrix(ab, a, b))
			return SUCCESS_STATUS;
	}
	return ERROR_STATUS;
}

int pow_matrix(struct matrix *i, int degree)
{
	int operation = 0;
	struct matrix result_matrix;
	result_matrix.height = i->height;
	result_matrix.width = i->width;
	result_matrix.indicators = (int **)malloc((result_matrix.height) * sizeof(int *));
	result_matrix.elements = (int *)malloc((result_matrix.height * result_matrix.width) * sizeof(int));
	for (; operation < degree; operation++)
		mult_matrix(&result_matrix, i, i);

	if (operation == degree)
	{
		for (int check_string_number = 0; check_string_number < result_matrix.height; check_string_number++)
			for (int check_row_number = 0; check_row_number < result_matrix.width; check_row_number++)
				*(i->elements + check_string_number * i->width + check_row_number) = *(result_matrix.elements + check_string_number * result_matrix.width + check_row_number);
		return SUCCESS_STATUS;
	}
	return ERROR_STATUS;
}

int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix)
{
	for (int check_string_number = 0; check_string_number < result_matrix->height; check_string_number++)
	{
		for (int check_row_number = 0; check_row_number < result_matrix->width; check_row_number++)
			*(result_matrix->elements + check_string_number * result_matrix->width + check_row_number) = get_sum(first_matrix, second_matrix, check_string_number, check_row_number);
		*(result_matrix->indicators + sizeof(void *) * check_string_number) = result_matrix->elements + check_string_number * result_matrix->width;
	}
	return SUCCESS_STATUS;
}

int get_sum(struct matrix *first_matrix, struct matrix *second_matrix, int check_string_number, int check_row_number)
{
	int result_sum = 0;
	for (int check_string_number_second = 0, check_row_number_first = 0; check_string_number_second < second_matrix->height; check_string_number_second++, check_row_number_first++)
	{
		int first = *(first_matrix->indicators[check_string_number] + check_string_number_second);
		int second = *(second_matrix->indicators[check_string_number_second] + check_row_number);
		result_sum += first * second;
	}
	return result_sum;
}


int get_minimal_element(struct matrix *i, int is_vertical_matrix)
{
	int min_elem_str_pos = 0, minimanl_element_row_position = 0, minimanl_element = *(i->indicators[0] + 0);
	for (int check_string_number = 0; check_string_number < i->height; check_string_number++)
		for (int check_row_number = 0; check_row_number < i->width; check_row_number++)
			if (minimanl_element > *(i->indicators[check_string_number] + check_row_number))
			{
				minimanl_element = *(i->indicators[check_string_number] + check_row_number);
				min_elem_str_pos = check_string_number;
				minimanl_element_row_position = check_row_number;
			}
	if (is_vertical_matrix == SUCCESS_STATUS)
		return min_elem_str_pos;
	return minimanl_element_row_position;
}

int up_min_elem_pos(int *elements, int min_elem_pos, int check_cursor)
{
	if (elements[check_cursor] < min_elem_pos)
		return check_cursor;
	return min_elem_pos;
}

int is_vertical_matrix(int *height, int *width)
{
	return *height > *width;
}

int is_square_matrix(int *height, int *width)
{
	if ((*width) == (*height))
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_correct_new_size(struct matrix *first_matrix, struct matrix *second_matrix)
{
	if (first_matrix->height == second_matrix->width)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}
