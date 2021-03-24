#ifndef SEARCH_H
#define SEARCH_H

#include "../../inc/config.h"

t_node * search_in_tree(t_node *tree, int val, int *amount, int *flag);
t_hash *looking_in_list(t_hash *head, int searh_int, int *amount);
int search_in_hash(t_hash **table, int searh_int, int table_len, int *amount, int k);
int search_in_file(FILE *f, int val, int *amount_file);

#endif //SEARCH_H
