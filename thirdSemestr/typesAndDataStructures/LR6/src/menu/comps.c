#include "../../inc/menu/comps.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency.h"
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
        puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
        fseek(stdin, 0, SEEK_SET);
        sleep(1);
        return;
    }
    search_in_tree(*tree_root, *search_int, amount_ord, flag_s);
    if (*flag_s != 1)
    {
        puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
        sleep(1);
    }
    if (*flag_s == 1)
    {
        puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
        sleep(1);
        FILE *fout = fopen("output.gv", "w+");
        export_to_dot(fout, "TREE", *tree_root, 1, *search_int);
    }
}

void build_balanced_ddt_comp(t_node **tree_root_balanced, int *search_int, int *flag_s, int *amount_bal)
{
    *flag_s = 0; *amount_bal = 0;
    printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
    if (scanf("%d", search_int) != 1)
    {
        puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
        fseek(stdin, 0, SEEK_SET);
        sleep(1);
        return ;
    }
    search_in_tree(*tree_root_balanced, *search_int, amount_bal, flag_s);
    if (*flag_s != 1)
    {
        puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
        sleep(1);
    }
    if (*flag_s == 1)
    {
        puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
        sleep(1);
        FILE *fout = fopen("output.gv", "w+");
        export_to_dot(fout, "TREE", *tree_root_balanced, 1, *search_int);
    }
}

void build_hash_table_comp(t_node **tree_root, t_hash ***hash, int *max_len, int *sum, int *table_len, int *k, FILE *operations_file)
{
    printf("\n\n\n\n\n\n\n\n\n\n\nВведите максимальное кол-во сравнений:\n");
    int error1 = check_int(max_len, 0, 301);
    *sum = 0;
    count_node(*tree_root, sum);
    printf("\n\n\n\n\n\n\n\n\n\n\nВведите размер хеш-таблицы [%d, 300]:\n", *sum / *max_len + 2);
    int error2 = check_int(table_len, *sum / *max_len + 1, 301);
    int copy = *table_len;
    if (!error1 && !error2)
    {
        *hash = create_table(operations_file, table_len, k, *max_len);
        if (copy != *table_len)
        {
            printf("\n\n\n\n\n\n       ✅ Размер увеличен до %d! ✅\n\n\n\n\n", *table_len);
            sleep(2);
        }
        else
        {
            printf("\n\n\n\n\n\n         ✅ Таблица построена! ✅\n\n\n\n\n");
            sleep(2);
        }
    }
    else
    {
        printf("\n\n\n\n\n\n           ❌ Ошибка ввода! ❌\n\n\n\n\n");
        sleep(1);
    }
}

void print_hash_table_comp(t_node **tree_root, t_hash ***hash, int *max_len, int *sum, int *table_len, int *k, FILE *operations_file)
{
    if (!hash)
    {
        puts("\n\n\n\n\n\n        ❌ Пустая хеш-таблица! ❌\n\n\n\n");
        sleep(2);
    }
    else
    {
        FILE *fout = fopen("output.gv", "w+");
        print_table(fout, *hash, *table_len, 0, 0);
    }
}

void serch_number_in_hash_table_comp(t_node **tree_root, t_hash ***hash, int *table_len, int *k, int *amount_hash, int *amount_bal, int *flag_s, int *search_int)
{
    if (*table_len == 0)
    {
        puts("\n\n\n\n\n\n   ❌ Сначала постройте хеш-таблицу ❌\n\n\n\n");
        sleep(2);
    }
    else
    {
        *flag_s = 0; *amount_bal = 0;
       printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
        if (scanf("%d", search_int) != 1)
        {
            puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
            fseek(stdin, 0, SEEK_SET);
            sleep(1);
            return ;
        }
        *flag_s = search_in_hash(*hash, *search_int, *table_len, amount_hash, *k);
        if (*flag_s != 1)
        {
            puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
            sleep(1);
        }
        if (*flag_s == 1)
        {
            puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
            sleep(1);
        }
    }
}

void search_number_in_op_file_comp(int *search_int, FILE *operations_file, int *flag_s, int *amount_file)
{
    printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
    if (scanf("%d", search_int) != 1)
    {
        puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
        fseek(stdin, 0, SEEK_SET);
        sleep(1);
        return ;
    }
    *flag_s = search_in_file(operations_file, *search_int, amount_file);
    if (*flag_s != 1)
    {
        puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
        sleep(1);
    }
    if (*flag_s == 1)
    {
        puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
        sleep(1);
    }
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
