#include "../../inc/config.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"
#include "../../inc/efficiency/get_time.h"

void efficiency()
{
    FILE *operation_file = fopen(FILENAME, "r+");

    if (operation_file)
    {
        t_node *root = NULL, *balanced_root = NULL;
        int table_len = 20, nodes = 0, nodes_bal = 0, flag = 0, amount_ord = 0, amount_bal = 0, amount_hash = 0, amount_file = 0, k = 1;

        t_hash **hash = NULL;
        int start = (int) time(NULL);
        srand((unsigned int) start);

        root = read_file(operation_file, root);
        balanced_root = read_file_balanced(balanced_root, operation_file);
        hash = create_table(operation_file, &table_len, &k, 5);
        
        count_node(root, &nodes);
        count_node(balanced_root, &nodes_bal);
        int node_hash = count_node_table(hash, table_len);
        
        unsigned long long t_ord = get_simple_ddt_search_time(&root, &amount_ord, &flag);
        unsigned long long t_bal = get_balanced_ddt_search_time(&balanced_root, &amount_bal, &flag);
        unsigned long long time_hash = get_hash_table_search_time(&hash, &amount_hash, &k, &table_len);
        unsigned long long t_file = get_file_search_time(operation_file, &amount_file);

        output_efficiency_information(nodes, nodes_bal, node_hash, t_file, t_ord, t_bal, amount_file, amount_ord, amount_hash, amount_bal, time_hash);
    }
    else
    {
        puts("Ошибка в открытии файла!\n");
    }

    fclose(operation_file);
}
