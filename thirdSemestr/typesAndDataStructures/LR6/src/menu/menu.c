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

void build_balanced_tree(t_node **tree_root_balanced)
{
    FILE *out_file = fopen("output.gv", "w+");
    export_to_dot(out_file, "TREE", *tree_root_balanced, 0, 0);
}

void build_simple_ddt(t_node **tree_root, int *search_int, int *flag_s, int *amount_ord)
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

void build_balanced_ddt(t_node **tree_root_balanced, int *search_int, int *flag_s, int *amount_bal)
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

void build_hash_table(t_node **tree_root, t_hash ***hash, int *max_len, int *sum, int *table_len, int *k, FILE *operations_file)
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


void menu(t_node *tree_root_balanced, FILE *f, t_node *tree_root)
{
	t_hash **hash = NULL;

	int flag = 1, table_len = 0, flag_s = 0, amount_ord = 0, amount_bal = 0, amount_hash = 0, amount_file = 0;

    int search_int, k = 1, max_len = 1, sum = 0;
    
    while (flag)
    {
    	int menu_status = get_menu_status();

    	if (!is_choose_build_simple_tree(menu_status))
            build_simple_tree(&tree_root);
    	else if (!is_choose_build_balanced_tree(menu_status))
            build_balanced_tree(&tree_root_balanced);
    	else if (!is_choose_build_simple_ddt(menu_status))
    		build_simple_ddt(&tree_root, &search_int, &flag_s, &amount_ord);
    	else if (!is_choose_build_balanced_ddt(menu_status))
    		build_balanced_ddt(&tree_root_balanced, &search_int, &flag_s, &amount_bal);
    	else if (!is_choose_build_hash_table(menu_status))
    		build_hash_table(&tree_root, &hash, &max_len, &sum, &table_len, &k, f);
    	else if (!is_choose_print_hash_table(menu_status))
    	{
    		if (!hash)
            {
                puts("\n\n\n\n\n\n        ❌ Пустая хеш-таблица! ❌\n\n\n\n");
                sleep(2);
            }
            else
            {
                FILE *fout = fopen("output.gv", "w+");
                print_table(fout, hash, table_len, 0, 0);
            }
            //break;
    	}
    	else if (!is_choose_search_number_in_hash_table(menu_status))
    	{
    		if (table_len == 0)
            {
                puts("\n\n\n\n\n\n   ❌ Сначала постройте хеш-таблицу ❌\n\n\n\n");
                sleep(2);
            }
            else
            {
                flag_s = 0; amount_bal = 0;
               printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
                if (scanf("%d", &search_int) != 1)
                {
                    puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
                    fseek(stdin, 0, SEEK_SET);
                    sleep(1);
                    break;
                }
                flag_s = search_in_hash(hash, search_int, table_len, &amount_hash, k);
                if (flag_s != 1)
                {
                    puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
                    sleep(1);
                }
                if (flag_s == 1)
                {
                    puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
                    sleep(1);
                }
            }
            //break;
    	}
    	else if (!is_choose_search_number_in_op_file(menu_status))
    	{
    		printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
            if (scanf("%d", &search_int) != 1)
            {
                puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
                fseek(stdin, 0, SEEK_SET);
                sleep(1);
                break;
            }
            flag_s = search_in_file(f, search_int, &amount_file);
            if (flag_s != 1)
            {
                puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
                sleep(1);
            }
            if (flag_s == 1)
            {
                puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
                sleep(1);
            }
            //break;
    	}
    	else if (!is_choose_print_efficiency(menu_status))
    	{
    		efficiency();
            flag = 0;
            menu_status = 0;
            break;
    	}
    	else if (!is_choose_exit(menu_status))
    	{
    		menu_status = 0;
            flag = 0;
            break;
    	}
    }
}
