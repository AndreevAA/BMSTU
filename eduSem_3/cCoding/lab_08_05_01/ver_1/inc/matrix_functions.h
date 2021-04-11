#include "../inc/config.h"

int **create_int_matrix(unsigned int height, unsigned int width);

void al_matrix(matrix *temp_matrix, int height, int width);
void free_matrix(matrix *temp_matrix);

int get_min_elem_str(matrix *temp_matrix);
int get_min_elem_row(matrix *temp_matrix);

void del_str(matrix *temp_matrix);
void del_row(matrix *temp_matrix);

void cpy_matrix(matrix *first, matrix *second);

void up_str(matrix *first, int n_size);
void up_row(matrix *first, int n_size);

int get_multed_vec(matrix *first, matrix *second, int t_str, int t_row);

void up_to_one(matrix *temp_matrix);

void pow_matrix(matrix *temp_matrix, int degree);
