#include "../inc/config.h"

int get_mid_num(struct matrix *i, int row, int max_string);
int get_max_num(struct matrix *i, int str);
int is_correct_new_size(struct matrix *first_matrix, struct matrix *second_matrix);
int delete_min_string_or_table(struct matrix *i);
int get_multiplicated_powed_matrix(struct matrix *ab, struct matrix *a, struct matrix *b, int *ro, int *gamma);
void free_matrix(struct matrix *temp_matrix);
int is_square_matrix(int *height, int *width);
int is_vertical_matrix(int *height, int *width);
int is_square_matrix(int *height, int *width);
int get_minimal_element(struct matrix *i, int is_vertical_matrix);
int pow_matrix(struct matrix **i, int degree);
int mult_matrix(struct matrix *result_matrix, struct matrix *first_matrix, struct matrix *second_matrix);
int get_sum(struct matrix *first_matrix, struct matrix *second_matrix, int check_string_number, int check_row_number);
void update_matrix(struct matrix *i, int n_size);
