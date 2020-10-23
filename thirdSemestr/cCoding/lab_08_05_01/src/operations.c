#include "../inc/operations.h"

int is_square_matrix(int *matrix_height, int *matrix_width);
int is_vertical_matrix(int *matrix_height, int *matrix_width);
int is_square_matrix(int *matrix_height, int *matrix_width);
int get_minimal_element(struct matrix *I, int is_vertical_matrix);
int update_minimanl_element_position(int *matrix_elements, int minimanl_element_position, int check_cursor);
int pow_matrix(struct matrix *I, int degree);
int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix);
int get_sum(struct matrix *first_matrix, struct matrix *second_matrix, int check_string_number, int check_row_number);

int delete_min_string_or_table(struct matrix *I)
{
	while (is_square_matrix(&I->matrix_height, &I->matrix_width) == ERROR_STATUS)
	{
		if (is_vertical_matrix(&I->matrix_height, &I->matrix_width))
		{
			for (int check_string_number = get_minimal_element(I, SUCCESS_STATUS); check_string_number < I->matrix_height - 1; check_string_number++)
				I->matrix_indicators[check_string_number] = I->matrix_indicators[check_string_number + 1];
			I->matrix_height--;
			return SUCCESS_STATUS;
		}
		else
		{
			int temp_check_row_number = get_minimal_element(I, ERROR_STATUS);
			for (int check_string_number = 0; check_string_number < I->matrix_height; check_string_number++)
				for (int check_row_number = temp_check_row_number; check_row_number < I->matrix_width - 1; check_row_number++)
					I->matrix_elements[check_string_number * I->matrix_width + check_row_number] = I->matrix_elements[check_string_number * I->matrix_width + check_row_number + 1];
			I->matrix_width--;
			return SUCCESS_STATUS;
		}
	}
	return ERROR_STATUS;
}

int get_multiplicated_powed_matrix(struct matrix *AB, struct matrix *A, struct matrix *B, int *ro, int *gamma)
{
	if (pow_matrix(A, *ro) == SUCCESS_STATUS && pow_matrix(B, *gamma) == SUCCESS_STATUS)
	{
		AB->matrix_height = A->matrix_height;
		AB->matrix_width = B->matrix_width;
		AB->matrix_indicators = (int **)malloc((AB->matrix_height) * sizeof(int *));
		AB->matrix_elements = (int *)malloc((AB->matrix_height * AB->matrix_width) * sizeof(int));
		if (mult_matrix(AB, A, B))
			return SUCCESS_STATUS;
	}
	return ERROR_STATUS;
}

int pow_matrix(struct matrix *I, int degree)
{
	int operation = 0;
	struct matrix result_matrix;
	result_matrix.matrix_height = I->matrix_height;
	result_matrix.matrix_width = I->matrix_width;
	result_matrix.matrix_indicators = (int **)malloc((result_matrix.matrix_height) * sizeof(int *));
	result_matrix.matrix_elements = (int *)malloc((result_matrix.matrix_height * result_matrix.matrix_width) * sizeof(int));
	for (; operation < degree; operation++)
		mult_matrix(&result_matrix, I, I);

	if (operation == degree)
	{
		for (int check_string_number = 0; check_string_number < result_matrix.matrix_height; check_string_number++)
			for (int check_row_number = 0; check_row_number < result_matrix.matrix_width; check_row_number++)
				*(I->matrix_elements + check_string_number * I->matrix_width + check_row_number) = *(result_matrix.matrix_elements + check_string_number * result_matrix.matrix_width + check_row_number);
		return SUCCESS_STATUS;
	}
	return ERROR_STATUS;
}

int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix)
{
	for (int check_string_number = 0; check_string_number < result_matrix->matrix_height; check_string_number++)
	{
		for (int check_row_number = 0; check_row_number < result_matrix->matrix_width; check_row_number++)
			*(result_matrix->matrix_elements + check_string_number * result_matrix->matrix_width + check_row_number) = get_sum(first_matrix, second_matrix, check_string_number, check_row_number);
		*(result_matrix->matrix_indicators + sizeof(void) * check_string_number) = result_matrix->matrix_elements + check_string_number * result_matrix->matrix_width;
	}
	return SUCCESS_STATUS;
}

int get_sum(struct matrix *first_matrix, struct matrix *second_matrix, int check_string_number, int check_row_number)
{
	int result_sum = 0;
	for (int check_string_number_second = 0, check_row_number_first = 0; check_string_number_second < second_matrix->matrix_height; check_string_number_second++, check_row_number_first++)
	{
		int first = *(first_matrix->matrix_indicators[check_string_number] + check_string_number_second);
		int second = *(second_matrix->matrix_indicators[check_string_number_second] + check_row_number);
		result_sum += first * second;
	}
	return result_sum;
}


int get_minimal_element(struct matrix *I, int is_vertical_matrix)
{
	int minimanl_element_string_position = 0, minimanl_element_row_position = 0, minimanl_element = *(I->matrix_indicators[0] + 0);
	for (int check_string_number = 0; check_string_number < I->matrix_height; check_string_number++)
		for (int check_row_number = 0; check_row_number < I->matrix_width; check_row_number++)
			if (minimanl_element > *(I->matrix_indicators[check_string_number] + check_row_number))
			{
				minimanl_element = *(I->matrix_indicators[check_string_number] + check_row_number);
				minimanl_element_string_position = check_string_number;
				minimanl_element_row_position = check_row_number;
			}
	if (is_vertical_matrix == SUCCESS_STATUS)
		return minimanl_element_string_position;
	return minimanl_element_row_position;
	
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

int is_correct_new_size(struct matrix *first_matrix, struct matrix *second_matrix)
{
	if (first_matrix->matrix_height == second_matrix->matrix_width)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}
