#ifndef IO_H
#define IO_H

#include "../inc/config.h"

t_node *read_file(FILE *operation_file, t_node *tree_root);
FILE *get_file_data(t_node **temp_node);
int is_null(t_node *temp_node);
int file_error();

void output_menu();
void out_input_error();

#endif //IO_H
