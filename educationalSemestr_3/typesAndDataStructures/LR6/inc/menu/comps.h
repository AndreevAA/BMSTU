#include "../../inc/config.h"

void build_simple_tree_comp(t_node **tree_root);
void build_balanced_tree_comp(t_node **tree_root_balanced);
void build_simple_ddt_comp(t_node **tree_root, int *search_int, int *flag_s, int *amount_ord);
void build_balanced_ddt_comp(t_node **tree_root_balanced, int *search_int, int *flag_s, int *amount_bal);
void build_hash_table_comp(t_node **tree_root, t_hash ***hash, int *max_len, int *sum, int *table_len, int *k, FILE *operations_file);
void print_hash_table_comp(t_node **tree_root, t_hash ***hash, int *max_len, int *sum, int *table_len, int *k, FILE *operations_file);
void serch_number_in_hash_table_comp(t_node **tree_root, t_hash ***hash, int *table_len, int *k, int *amount_hash, int *amount_bal, int *flag_s, int *search_int);
void search_number_in_op_file_comp(int *search_int, FILE *operations_file, int *flag_s, int *amount_file);
void print_efficiency_comp(int *menu_status, int *working_status);
void exit_comp(int *menu_status, int *working_status);
void error_input_comp();
