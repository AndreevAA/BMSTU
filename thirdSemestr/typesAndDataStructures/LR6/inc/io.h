#ifndef IO_H
#define IO_H

#include "../inc/config.h"

t_node *read_file(FILE *f, t_node *root);
FILE *get_file_data(t_node **temp_node);
int is_null(t_node *temp_node);
int file_error();

#endif //IO_H
