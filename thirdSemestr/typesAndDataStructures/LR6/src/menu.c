#include "../inc/menu.h"
#include "../inc/config.h"
#include "../inc/tree_operations/balance.h"
#include "../inc/efficiency.h"
#include "../inc/tree_operations/export.h"
#include "../inc/tree_operations/hash.h"
#include "../inc/io.h"
#include "../inc/tree_operations/search.h"
#include "../inc/tree_operations/tree.h"

void menu(t_node *balanced_root, FILE *f, t_node *root)
{
	t_hash **hash = NULL;

	int flag = 1, table_len = 0, flag_s = 0, amount_ord = 0, amount_bal = 0, amount_hash = 0, amount_file = 0;

    int search_int, k = 1, max_len = 1, sum = 0;
    
    while (flag)
    {
        printf(" ⟰  Меню: \n");
        printf(" ①  Построить обычное дерево\n");
        printf(" ②  Построить сбалансированное дерево\n");
        printf(" ③  Поиск числа в ДДП\n");
        printf(" ④  Поиск числа в сбалансированном дереве\n");
        printf(" ⑤  Построить хеш-таблицу\n");
        printf(" ⑥  Напечатать хеш-таблицу\n");
        printf(" ⑦  Поиск числа в хеш-таблице\n");
        printf(" ⑧  Поиск числа в файле\n");
        printf(" ⑨  Эффективность\n");
        printf(" ⓪  Выход\n");
        printf(" ⟱  Введите номер пункта меню: ");
        
        int choice = 0;
        scanf("%d", &choice);

        switch (choice)
        {
            case 1:
            {
                FILE *fout = fopen("output.gv", "w+");
                export_to_dot(fout, "TREE", root, 0, 0);
                break;
            }
            case 2:
            {
                FILE *fout = fopen("output.gv", "w+");
                export_to_dot(fout, "TREE", balanced_root, 0, 0);
                break;
            }
            case 3:
                flag_s = 0; amount_ord = 0;
                printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
                if (scanf("%d", &search_int) != 1)
                {
                    puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
                    fseek(stdin, 0, SEEK_SET);
                    sleep(1);
                    break;
                }
                search_in_tree(root, search_int, &amount_ord, &flag_s);
                if (flag_s != 1)
                {
                    puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
                    sleep(1);
                }
                if (flag_s == 1)
                {
                    puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
                    sleep(1);
                    FILE *fout = fopen("output.gv", "w+");
                    export_to_dot(fout, "TREE", root, 1, search_int);
                }
                break;
            case 4:
                flag_s = 0; amount_bal = 0;
                printf("\n\n\n\n\n\n\n\n\n\n\nВведите число: ");
                if (scanf("%d", &search_int) != 1)
                {
                    puts("\n\n\n\n\n\n         ❌ Недопустимые символы! ❌\n\n\n\n");
                    fseek(stdin, 0, SEEK_SET);
                    sleep(1);
                    break;
                }
                search_in_tree(balanced_root, search_int, &amount_bal, &flag_s);
                if (flag_s != 1)
                {
                    puts("\n\n\n\n\n\n         ❌ Такого числа нет! ❌\n\n\n\n");
                    sleep(1);
                }
                if (flag_s == 1)
                {
                    puts("\n\n\n\n\n\n         ✅ Такое число есть! ✅\n\n\n\n");
                    sleep(1);
                    FILE *fout = fopen("output.gv", "w+");
                    export_to_dot(fout, "TREE", balanced_root, 1, search_int);
                }
                break;
            case 5:
            {
                printf("\n\n\n\n\n\n\n\n\n\n\nВведите максимальное кол-во сравнений:\n");
                int error1 = check_int(&max_len, 0, 301);
                sum = 0;
                count_node(root, &sum);
                printf("\n\n\n\n\n\n\n\n\n\n\nВведите размер хеш-таблицы [%d, 300]:\n", sum / max_len + 2);
                int error2 = check_int(&table_len, sum / max_len + 1, 301);
                int copy = table_len;
                if (!error1 && !error2)
                {
                    hash = create_table(f, &table_len, &k, max_len);
                    if (copy != table_len)
                    {
                        printf("\n\n\n\n\n\n       ✅ Размер увеличен до %d! ✅\n\n\n\n\n", table_len);
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
                break;
            }
            case 6:
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
                break;
            }
            case 7:
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
                break;
            }
            case 8:
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
                break;
            }
            case 9:
            {
                efficiency();
                flag = 0;
                choice = 0;
                break;
            }
            case 0:
            {
                flag = 0;
                break;
            }
            default:
            {
                choice = 0;
                flag = 0;
                break;
            }
        }
    }
}
