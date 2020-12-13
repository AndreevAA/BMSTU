#include "../../inc/menu/comps.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"

void build_simple_tree_comp(t_node **tree_root)
{
    FILE *out_file = fopen("output.gv", "w+");
    export_to_dot(out_file, "TREE", *tree_root, 0, 0);
}


void build_balanced_tree_comp(t_node **tree_root_balanced)
{
    FILE *out_file = fopen("output.gv", "w+");
    export_to_dot(out_file, "TREE", *tree_root_balanced, 0, 0);
}

void build_simple_ddt_comp(t_node **tree_root, int *search_int, int *flag_s, int *amount_ord)
{
    *flag_s = 0; *amount_ord = 0;
    printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
    if (scanf("%d", search_int) != 1)
    {
    	out_incorrect_symbols();
        fseek(stdin, 0, SEEK_SET);
        sleep(1);
        return;
    }
    search_in_tree(*tree_root, *search_int, amount_ord, flag_s);
    if (*flag_s != 1)
    {
    	out_number_doensnt_exit();
        sleep(1);
    }
    if (*flag_s == 1)
    {
    	out_number_exits();
        sleep(1);
        FILE *fout = fopen("output.gv", "w+");
        export_to_dot(fout, "TREE", *tree_root, 1, *search_int);
    }
}

void build_balanced_ddt_comp(t_node **tree_root_balanced, int *search_int, int *flag_s, int *amount_bal)
{
    *flag_s = 0; *amount_bal = 0;
    printf("\n\nУкажите число: ");
    if (scanf("%d", search_int) != 1)
    {
        out_incorrect_symbols();
        fseek(stdin, 0, SEEK_SET);
        return ;
    }
    search_in_tree(*tree_root_balanced, *search_int, amount_bal, flag_s);
    if (*flag_s != 1)
        out_number_doensnt_exit();
    if (*flag_s == 1)
    {
        out_number_exits();
        FILE *fout = fopen("output.gv", "w+");
        export_to_dot(fout, "TREE", *tree_root_balanced, 1, *search_int);
    }
}

void build_hash_table_comp(t_node **tree_root, t_hash ***hash, int *max_len, int *sum, int *table_len, int *k, FILE *operations_file)
{
    printf("\n\nУкажите максимальное кол-во сравнений:\n");
    int error1 = check_int(max_len, 0, 301);
    *sum = 0;
    count_node(*tree_root, sum);
    printf("\n\nУкажите размер хеш-таблицы [%d, 300]:\n", *sum / *max_len + 2);
    int error2 = check_int(table_len, *sum / *max_len + 1, 301);
    int copy = *table_len;
    if (!error1 && !error2)
    {
        *hash = create_table(operations_file, table_len, k, *max_len);
        if (copy != *table_len)
            out_size_upped_to(table_len);
        else
        	out_table_build_ok();
    }
    else
    	out_error_input_table();
}

void print_hash_table_comp(t_node **tree_root, t_hash ***hash, int *max_len, int *sum, int *table_len, int *k, FILE *operations_file)
{
    if (!hash)
    	out_error_free_hash_table();
    else
    {
        FILE *fout = fopen("output.gv", "w+");
        print_table(fout, *hash, *table_len, 0, 0);
    }
}

void serch_number_in_hash_table_comp(t_node **tree_root, t_hash ***hash, int *table_len, int *k, int *amount_hash, int *amount_bal, int *flag_s, int *search_int)
{
    if (*table_len == 0)
    	out_error_of_seach_in_free_hash_table();
    else
    {
        *flag_s = 0; *amount_bal = 0;
        printf("\n\nУкажите число: ");
        if (scanf("%d", search_int) != 1)
        {
            out_incorrect_symbols();
            fseek(stdin, 0, SEEK_SET);
            return ;
        }
        *flag_s = search_in_hash(*hash, *search_int, *table_len, amount_hash, *k);
        if (*flag_s != 1)
        	out_number_doensnt_exit();
        if (*flag_s == 1)
        	out_number_exits();
    }
}

void search_number_in_op_file_comp(int *search_int, FILE *operations_file, int *flag_s, int *amount_file)
{
    printf("\n\nУкажите число: ");
    if (scanf("%d", search_int) != 1)
    {
        out_incorrect_symbols();
        fseek(stdin, 0, SEEK_SET);
        return ;
    }
    *flag_s = search_in_file(operations_file, *search_int, amount_file);
    if (*flag_s != 1)
        out_number_doensnt_exit();
    if (*flag_s == 1)
    	out_number_exits();
}

void print_efficiency_comp(int *menu_status, int *working_status)
{
    efficiency();
    *working_status = 0;
    *menu_status = 0;
    return ;
}

void exit_comp(int *menu_status, int *working_status)
{
    *working_status = 0;
    *menu_status = 0;
    return ;
}

void error_input_comp()
{
    out_input_error();
}
