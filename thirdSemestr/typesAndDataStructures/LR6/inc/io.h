#ifndef IO_H
#define IO_H

#include "../inc/config.h"

t_node *read_file(FILE *operation_file, t_node *tree_root);
FILE *get_file_data(t_node **temp_node);
int is_null(t_node *temp_node);
int file_error();

void output_menu();
void out_input_error();

void out_number_exits();
void out_number_doensnt_exit();
void out_incorrect_symbols();

void out_size_upped_to(int *table_len);
void out_table_build_ok();
void out_error_input_table();
void out_error_of_seach_in_free_hash_table();
void out_error_free_hash_table();

void output_efficiency_information(int nodes, int nodes_bal, int node_hash, unsigned long long t_file, unsigned long long t_ord, unsigned long long t_bal, int amount_file, int amount_ord, int amount_hash, int amount_bal, unsigned long long time_hash);

#endif //IO_H
