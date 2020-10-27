#include "../inc/config.h"

int get_matrix_size(int *matrix_height, int *matrix_width);
int is_correct_matrix_size(int *matrix_height, int *matrix_width);
int get_matrix(struct matrix *i_matrix, int *i_matrix_height, int *i_matrix_width);
int get_degrees(int *ro, int *gamma);
int is_correct_degree(int *ro, int *gamma);
void output_matrix(struct matrix *i);
