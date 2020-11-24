#include "../inc/matrix_functions.h"
#include "../inc/matrix_checkers.h"
#include "../inc/matrix_operations.h"

int **create_int_matrix(unsigned int height, unsigned int width)
{
	int *val = (int*)malloc(sizeof(int) * height * width);
    int **matrix = (int**)malloc(sizeof(int*) * height);
    for (unsigned int cur = 0; cur < height; cur++)
        *(matrix + cur) = val + cur * width;
    return matrix;
}

void al_matrix(matrix *temp_matrix, int height, int width)
{
	temp_matrix->height = height;
	temp_matrix->width = width;
	temp_matrix->content = create_int_matrix(temp_matrix->height, temp_matrix->width);
}

void free_matrix(matrix *temp_matrix)
{
	//printf("temp_matrix->height = %d\n", temp_matrix->height);
	// for (unsigned int cur = 0; cur < temp_matrix->height; cur++)
	// {
	// 	printf("cur = %d\n", cur);
	// 	free(temp_matrix->content[cur]);
	// }
	free(temp_matrix->content[0]);
	free(temp_matrix->content);
}

int get_min_elem_str(matrix *temp_matrix)
{
	int min_str = 0, min_val = temp_matrix->content[0][0];
	for (int cur_h = 0; cur_h < temp_matrix->height; cur_h++)
	{
		for (int cur_w = 0; cur_w < temp_matrix->width; cur_w++)
			if (is_first_min(temp_matrix->content[cur_h][cur_w], min_val) == SUCCESS_STATUS)
			{
				min_val = temp_matrix->content[cur_h][cur_w];
				min_str = cur_h;
				break;
			}
	}
	return min_str;
}

int get_min_elem_row(matrix *temp_matrix)
{
	int min_row = 0, min_val = temp_matrix->content[0][0];
	for (int cur_h = 0; cur_h < temp_matrix->height; cur_h++)
	{
		for (int cur_w = 0; cur_w < temp_matrix->width; cur_w++)
			if (is_first_min(temp_matrix->content[cur_h][cur_w], min_val) == SUCCESS_STATUS)
			{
				min_val = temp_matrix->content[cur_h][cur_w];
				min_row = cur_w;
			}
	}
	return min_row;
}

void del_str(matrix *temp_matrix)
{
	for (unsigned int cur = get_min_elem_str(temp_matrix); cur < temp_matrix->height - 1; cur++)
        *(temp_matrix->content + cur) = *(temp_matrix->content + cur + 1);
    //free(*(temp_matrix->content + temp_matrix->height - 1));
    temp_matrix->height--;
}

void del_row(matrix *temp_matrix)
{
	for (int cur_h = 0; cur_h < temp_matrix->height; cur_h++)
		for (int cur_w = get_min_elem_row(temp_matrix); cur_w < temp_matrix->width; cur_w++)
			temp_matrix->content[cur_h][cur_w] = temp_matrix->content[cur_h][cur_w + 1];
	temp_matrix->width--;
}

void cpy_matrix(matrix *first, matrix *second)
{
	for (int cur_h = 0; cur_h < second->height; cur_h++)
		for (int cur_w = 0; cur_w < second->width; cur_w++)
			first->content[cur_h][cur_w] = second->content[cur_h][cur_w];
}

int get_mid(matrix *first, int t_row, int m_str)
{
	double m_su = 1.0;
	int cur_h = 0;
	for (; cur_h < m_str; cur_h++)
		m_su = (first->content[cur_h][t_row]) * m_su;
	return (int)(pow(m_su, 1 / (double)cur_h));
}

int get_max(matrix *first, int m_row, int t_str)
{
	int t_max = first->content[t_str][0];
	for (int cur_w = 0; cur_w < m_row; cur_w++)
		if (t_max < first->content[t_str][cur_w])
			t_max = first->content[t_str][cur_w];
	return t_max;
}

void up_str(matrix *first, int n_size)
{
	for (int cur_h = first->height; cur_h < n_size; cur_h++)
		for (int cur_w = 0; cur_w < first->width; cur_w++)
			first->content[cur_h][cur_w] = get_mid(first, cur_w, cur_h);
}

void up_row(matrix *first, int n_size)
{
	for (int cur_h = 0; cur_h < n_size; cur_h++)
		for (int cur_w = first->width; cur_w < n_size; cur_w++)
			first->content[cur_h][cur_w] = get_max(first, cur_w, cur_h);
}

int get_multed_vec(matrix *first, matrix *second, int t_str, int t_row)
{
	int res_multed_vec = 0;
	for (int cur_h = 0; cur_h < second->height; cur_h++)
		res_multed_vec += first->content[t_str][cur_h] * second->content[cur_h][t_row];
	return res_multed_vec;
}

void up_to_one(matrix *temp_matrix)
{
	for (int cur_h = 0; cur_h < temp_matrix->height; cur_h++)
		for (int cur_w = 0; cur_w < temp_matrix->width; cur_w++)
			{
				if (cur_h == cur_w)
					temp_matrix->content[cur_h][cur_w] = 1;
				else
					temp_matrix->content[cur_h][cur_w] = 0;
			}
}

void pow_matrix(matrix *temp_matrix, int degree)
{
	matrix result;
	al_matrix(&result, temp_matrix->height, temp_matrix->width);
	int operation_num = 0;
	for (; operation_num < degree - 1; operation_num++)
	{
		if (operation_num == 0)
			mult_comp(&result, temp_matrix, temp_matrix);
		else
		{
			matrix second;
			al_matrix(&second, temp_matrix->height, temp_matrix->width);
			cpy_matrix(&second, &result);
			mult_comp(&result, &second, temp_matrix);
			free_matrix(&second);
		}
	}
	if (operation_num == degree - 1)
		cpy_matrix(temp_matrix, &result);
	free_matrix(&result);
}
