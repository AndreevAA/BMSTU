#ifndef GET_TIME_H
#define GET_TIME_H

#include "../../inc/config.h"

unsigned long int tick(void);
unsigned long long get_simple_ddt_search_time(t_node **root, int *amount_ord, int *flag);
unsigned long long get_balanced_ddt_search_time(t_node **balanced_root, int *amount_bal, int *flag);
unsigned long long get_hash_table_search_time(t_hash ***hash, int *amount_hash, int *k, int *table_len);
unsigned long long get_file_search_time(FILE *operation_file, int *amount_file);

#endif //GET_TIME_H
