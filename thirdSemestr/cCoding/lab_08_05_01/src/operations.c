#include "../inc/operations.h"

int is_square_matrix(int *height, int *width);
int is_vertical_matrix(int *height, int *width);
int is_square_matrix(int *height, int *width);
int get_minimal_element(struct matrix *I, int is_vertical_matrix);
int update_minimanl_element_position(int *elements, int minimanl_element_position, int check_cursor);
int pow_matrix(struct matrix *I, int degree);
int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix);
int get_sum(struct matrix *first_matrix, struct matrix *second_matrix, int check_string_number, int check_row_number);

int delete_min_string_or_table(struct matrix *I)
{
	while (is_square_matrix(&I->height, &I->width) == ERROR_STATUS)
	{
		if (is_vertical_matrix(&I->height, &I->width))
		{
			for (int check_string_number = get_minimal_element(I, SUCCESS_STATUS); check_string_number < I->height - 1; check_string_number++)
				I->indicators[check_string_number] = I->indicators[check_string_number + 1];
			I->height--;
			return SUCCESS_STATUS;
		}
		else
		{
			int temp_check_row_number = get_minimal_element(I, ERROR_STATUS);
			for (int check_string_number = 0; check_string_number < I->height; check_string_number++)
				for (int check_row_number = temp_check_row_number; check_row_number < I->width - 1; check_row_number++)
					I->elements[check_string_number * I->width + check_row_number] = I->elements[check_string_number * I->width + check_row_number + 1];
			I->width--;
			return SUCCESS_STATUS;
		}
	}
	return ERROR_STATUS;
}

int get_multiplicated_powed_matrix(struct matrix *AB, struct matrix *A, struct matrix *B, int *ro, int *gamma)
{
	if (pow_matrix(A, *ro) == SUCCESS_STATUS && pow_matrix(B, *gamma) == SUCCESS_STATUS)
	{
		AB->height = A->height;
		AB->width = B->width;
		AB->indicators = (int **)malloc((AB->height) * sizeof(int *));
		AB->elements = (int *)malloc((AB->height * AB->width) * sizeof(int));
		if (mult_matrix(AB, A, B))
			return SUCCESS_STATUS;
	}
	return ERROR_STATUS;
}

int pow_matrix(struct matrix *I, int degree)
{
	int operation = 0;
	struct matrix result_matrix;
	result_matrix.height = I->height;
	result_matrix.width = I->width;
	result_matrix.indicators = (int **)malloc((result_matrix.height) * sizeof(int *));
	result_matrix.elements = (int *)malloc((result_matrix.height * result_matrix.width) * sizeof(int));
	for (; operation < degree; operation++)
		mult_matrix(&result_matrix, I, I);

	if (operation == degree)
	{
		for (int check_string_number = 0; check_string_number < result_matrix.height; check_string_number++)
			for (int check_row_number = 0; check_row_number < result_matrix.width; check_row_number++)
				*(I->elements + check_string_number * I->width + check_row_number) = *(result_matrix.elements + check_string_number * result_matrix.width + check_row_number);
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
		*(result_matrix->indicators + sizeof(void) * check_string_number) = result_matrix->elements + check_string_number * result_matrix->width;
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


int get_minimal_element(struct matrix *I, int is_vertical_matrix)
{
	int minimanl_element_string_position = 0, minimanl_element_row_position = 0, minimanl_element = *(I->indicators[0] + 0);
	for (int check_string_number = 0; check_string_number < I->height; check_string_number++)
		for (int check_row_number = 0; check_row_number < I->width; check_row_number++)
			if (minimanl_element > *(I->indicators[check_string_number] + check_row_number))
			{
				minimanl_element = *(I->indicators[check_string_number] + check_row_number);
				minimanl_element_string_position = check_string_number;
				minimanl_element_row_position = check_row_number;
			}
	if (is_vertical_matrix == SUCCESS_STATUS)
		return minimanl_element_string_position;
	return minimanl_element_row_position;
	
}

int update_minimanl_element_position(int *elements, int minimanl_element_position, int check_cursor)
{
	if (elements[check_cursor] < minimanl_element_position)
		return check_cursor;
	return minimanl_element_position;
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
