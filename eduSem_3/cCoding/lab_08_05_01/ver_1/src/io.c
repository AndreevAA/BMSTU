#include "../inc/io.h"
#include "../inc/matrix_functions.h"

int get_matrix_size(int *height, int *width)
{
	return (scanf("%d", height) && scanf("%d", width));
}

int is_correct_matrix_size(int *height, int *width)
{
	return ((*width) >= MIN_SIZE && (*width) <= MAX_SIZE && (*height) >= MIN_SIZE && (*height) <= MAX_SIZE);
}

int is_correct_degree(int *ro, int *gamma)
{
	return (*ro >= 0 && *gamma >= 0);
}

int get_matrix(matrix *temp_matrix, int *height, int *width)
{
	al_matrix(temp_matrix, *height, *width);
	for (int cur_h = 0; cur_h < temp_matrix->height; cur_h++)
		for (int cur_w = 0; cur_w < temp_matrix->width; cur_w++)
			if (scanf("%d", &temp_matrix->content[cur_h][cur_w]) != 1)
				return ERROR_STATUS;
	return SUCCESS_STATUS;
}

int get_degrees(int *ro, int *gamma)
{
	return (scanf("%d", ro) == 1 && scanf("%d", gamma));
}

int out_matrix(matrix *temp_matrix)
{
	for (int cur_h = 0; cur_h < temp_matrix->height; cur_h++)
	{
		for (int cur_w = 0; cur_w < temp_matrix->width; cur_w++)
			printf("%d ", temp_matrix->content[cur_h][cur_w]);
		printf("\n");
	}
	return SUCCESS_STATUS;
}
