#include "../inc/operations.h"

int is_square_matrix(int *matrix_height, int *matrix_width);
int is_vertical_matrix(int *matrix_height, int *matrix_width);
int is_square_matrix(int *matrix_height, int *matrix_width);
int get_minimal_element(struct matrix *I, int is_vertical_matrix);
int update_minimanl_element_position(int *matrix_elements, int minimanl_element_position, int check_cursor);
int get_string_sum(struct matrix *first_matrix, int check_string_number);
int get_row_sum(struct matrix *second_matrix, int check_row_number);
int pow_matrix(struct matrix *I, int degree);
int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix);

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
		printf("HERE\n");
		if (mult_matrix(AB, A, B))
			return SUCCESS_STATUS;
	}
	return ERROR_STATUS;
}

int pow_matrix(struct matrix *I, int degree)
{
	int *first_matrix = (int *)malloc(I->matrix_height * sizeof(int)), second_matrix =  (int *)malloc(I->matrix_width * sizeof(int));
	for (int number_of_operations = 0; number_of_operations < degree number_of_operations++)
	{
		for (int i = 0; i < I->matrix_height; i++)
		{
			for (int j = 0; j < I->matrix_width; j++)
			{
				
			}
		}
	}

	printf("*(I->matrix_indicators[check_string_number] + 0) =%d\n", *(I->matrix_indicators[0] + 0));
	printf("HERE1\n");
	// for (int counter = 0; counter < degree; counter++)
	// 	mult_matrix(I, I, I);
	return SUCCESS_STATUS;
}

int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix)
{
	result_matrix->matrix_height = first_matrix->matrix_height;
	result_matrix->matrix_width = second_matrix->matrix_width;
	result_matrix->matrix_indicators = (int **)malloc((result_matrix->matrix_height) * sizeof(int *));
	result_matrix->matrix_elements = (int *)malloc((result_matrix->matrix_height * result_matrix->matrix_width) * sizeof(int));
	for (int check_string_number = 0; check_string_number < result_matrix->matrix_height; check_string_number++)
	{
		int temp_row_sum = get_string_sum(first_matrix, check_string_number);
		for (int check_row_number = 0; check_row_number < result_matrix->matrix_width; check_row_number++)
			*(result_matrix->matrix_elements + check_string_number * result_matrix->matrix_width + check_row_number) = temp_row_sum * get_row_sum(second_matrix, check_row_number);
		*(result_matrix->matrix_indicators + sizeof(void) * check_string_number) = result_matrix->matrix_elements + check_string_number * result_matrix->matrix_width;
	}
	return SUCCESS_STATUS;
}

int get_string_sum(struct matrix *first_matrix, int check_string_number)
{
	int temp_row_sum = *(first_matrix->matrix_indicators[check_string_number] + 0);
	for (int check_row_number = 1; check_row_number < first_matrix->matrix_width; check_row_number++)
		temp_row_sum +=	*(first_matrix->matrix_indicators[check_string_number] + check_row_number);
	return temp_row_sum;
}

int get_row_sum(struct matrix *second_matrix, int check_row_number)
{
	int temp_row_sum = *(second_matrix->matrix_indicators[0] + check_row_number);
	for (int check_string_number = 1; check_string_number < second_matrix->matrix_height; check_string_number++)
		temp_row_sum +=	*(second_matrix->matrix_indicators[check_string_number] + check_row_number);
	return temp_row_sum;
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
