#ifndef HASH_H
#define HASH_H

#include "../../inc/config.h"

int len_list(t_hash *head);
int next_prime_number(int number);
t_hash* add_end(t_hash *head, t_hash *elem);
t_hash* create_hash_node(int val);
int what_index(int val, int len_table, int k);
t_hash **insert_in_hash_table(t_hash **table, int *len_table, t_hash *node, int max_len, int *k);
void print_table(FILE *f, t_hash **table, int len_table, int is_search, int search_val);
int count_node_table(t_hash **table, int len_table);
t_hash **create_table(FILE *f, int *len_table, int *k, int max_len);
int check_int(int *number, int min, int max);

#endif //HASH_H
