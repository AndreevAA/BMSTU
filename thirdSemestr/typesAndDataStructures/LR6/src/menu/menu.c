#include "../../inc/menu/menu.h"
#include "../../inc/config.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"
#include "../../inc/menu/comps.h"
#include "../../inc/menu/checks.h"

int get_menu_status()
{
	output_menu();
    int temp_menu_status = 0;
    scanf("%d", &temp_menu_status);
    return temp_menu_status;
}

void menu(t_node *tree_root_balanced, FILE *f, t_node *tree_root)
{
	t_hash **hash = NULL;

	int working_status = 1, table_len = 0, flag_s = 0, amount_ord = 0, amount_bal = 0, amount_hash = 0, amount_file = 0;

    int search_int, k = 1, max_len = 1, sum = 0;
    
    while (working_status)
    {
    	int menu_status = get_menu_status();

    	if (!is_choose_build_simple_tree(menu_status))
            build_simple_tree_comp(&tree_root);
    	else if (!is_choose_build_balanced_tree(menu_status))
            build_balanced_tree_comp(&tree_root_balanced);
    	else if (!is_choose_build_simple_ddt(menu_status))
    		build_simple_ddt_comp(&tree_root, &search_int, &flag_s, &amount_ord);
    	else if (!is_choose_build_balanced_ddt(menu_status))
    		build_balanced_ddt_comp(&tree_root_balanced, &search_int, &flag_s, &amount_bal);
    	else if (!is_choose_build_hash_table(menu_status))
    		build_hash_table_comp(&tree_root, &hash, &max_len, &sum, &table_len, &k, f);
    	else if (!is_choose_print_hash_table(menu_status))
            print_hash_table_comp(&tree_root, &hash, &max_len, &sum, &table_len, &k, f);
    	else if (!is_choose_search_number_in_hash_table(menu_status))
    	   serch_number_in_hash_table_comp(&tree_root, &hash, &table_len, &k, &amount_hash, &amount_bal, &flag_s, &search_int);
    	else if (!is_choose_search_number_in_op_file(menu_status))
    		search_number_in_op_file_comp(&search_int, f, &flag_s, &amount_file);
    	else if (!is_choose_print_efficiency(menu_status))
    		print_efficiency_comp(&menu_status, &working_status);
    	else if (!is_choose_exit(menu_status))
    		exit_comp(&menu_status, &working_status);
        else
            error_input_comp();
    }
}
