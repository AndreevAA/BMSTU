#include "../inc/config.h"
#include "../inc/balance.h"
#include "../inc/efficiency.h"
#include "../inc/export.h"
#include "../inc/hash.h"
#include "../inc/io.h"
#include "../inc/search.h"
#include "../inc/tree.h"

unsigned long int tick(void)
{
    unsigned long int d;
    __asm__ __volatile__ ("rdtsc" : "=A" (d) );
    return d;
}

void efficiency()
{
    FILE *f = fopen(FILENAME, "r+");

    if (f)
    {
        t_node *root = NULL, *balanced_root = NULL;
        int table_len = 20, nodes = 0, nodes_bal = 0, flag = 0, amount_ord = 0,
                amount_bal = 0, amount_hash = 0, amount_file = 0;
        int k = 1;
        unsigned long long t_ord, t_bal, time_hash, t_file;
        t_hash **hash = NULL;
        int start = (int) time(NULL);
        srand((unsigned int) start);

        root = read_file(f, root);
        balanced_root = read_file_balanced(balanced_root, f);
        hash = create_table(f, &table_len, &k, 5);
        count_node(root, &nodes);
        count_node(balanced_root, &nodes_bal);
        int node_hash = count_node_table(hash, table_len);

        clock_t t1, t2;
        t1 = tick();
        for (int i = 0; i < 1000; i++)
        {
            search_in_tree(root, 100, &amount_ord, &flag);
        }
        printf("%d\n", amount_ord);
        t2 = tick();
        t_ord = (unsigned long long)(t2 - t1) / 1000;

        t1 = tick();
        for (int i = 0; i < 1000; i++)
        {
            search_in_tree(balanced_root, 100, &amount_bal, &flag);
        }
        t2 = tick();
        
        t_bal = (unsigned long long)(t2 - t1) / 1000;

        t1 = tick();
        for (int i = 0; i < 1000; i++)
        {
            search_in_hash(hash, 100, table_len, &amount_hash, k);
        }
        t2 = tick();
        time_hash = (unsigned long long)(t2 - t1) / 1000;

        t1 = tick();
        for (int i = 0; i < 1000; i++)
        {
            search_in_file(f, 100, &amount_file);
        }
        t2 = tick();
        t_file = (unsigned long long) (t2 - t1) / 1000;

        //int memory_tree = count_node*((sizeof(char*))*3);
        //int memory_bal_tree = count_node*((sizeof(char*))*3 + sizeof(int));
        printf("\n|----------------------------------------|\n");
        printf("|   Файл   |   ДДП   |   АВЛ   |   ХЕШ   |\n");
        printf("|------------Память (в байтах)-----------|\n");
        printf("|%10.2d|%9lu|%9lu|%9d|\n", 4 * 47, nodes * sizeof(t_node) + 4 * 44 - nodes * sizeof(int),
               nodes_bal * sizeof(t_node) + 4 * 44 - nodes * sizeof(int), node_hash);
        printf("|---------------Время (в mc)-------------|\n");
        printf("|%10lf|%9lf|%9lf|%9lf|\n", (double)t_file / CLOCKS_PER_SEC,
               (double)t_ord / CLOCKS_PER_SEC,
               (double)t_bal / CLOCKS_PER_SEC,  (double)time_hash / CLOCKS_PER_SEC / 4);
        printf("|--------------Колич. Сравнений----------|\n");
        printf("|%10d|%9d|%9d|%9d|\n", amount_file / 1000, amount_ord / 1000,
               amount_bal / 1000, amount_hash / 1000);
        printf("|----------------------------------------|\n\n");
    }
    else
    {
        puts("Ошибка в открытии файла!\n");
    }

    fclose(f);
}
