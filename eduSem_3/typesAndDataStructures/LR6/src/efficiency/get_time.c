#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"
#include "../../inc/efficiency/get_time.h"

unsigned long int tick(void)
{
    unsigned long int d;
    __asm__ __volatile__ ("rdtsc" : "=A" (d) );
    return d;
}

unsigned long long get_simple_ddt_search_time(t_node **root, int *amount_ord, int *flag)
{
    clock_t t1 = tick();
    for (int i = 0; i < NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME; i++)
        search_in_tree(*root, 100, amount_ord, flag);
    clock_t t2 = tick();
    printf("amount_ord = %d\n", *amount_ord);

    return (unsigned long long)(t2 - t1) / NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME;
}

unsigned long long get_balanced_ddt_search_time(t_node **balanced_root, int *amount_bal, int *flag)
{
    clock_t t1 = tick();
    for (int i = 0; i < NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME; i++)
        search_in_tree(*balanced_root, 100, amount_bal, flag);
    clock_t t2 = tick();

    return (unsigned long long)(t2 - t1) / NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME;
}

unsigned long long get_hash_table_search_time(t_hash ***hash, int *amount_hash, int *k, int *table_len)
{
    clock_t t1 = tick();
    for (int i = 0; i < NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME; i++)
        search_in_hash(*hash, 100, *table_len, amount_hash, *k);
    clock_t t2 = tick();

    return (unsigned long long)(t2 - t1) / NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME;
}

unsigned long long get_file_search_time(FILE *operation_file, int *amount_file)
{
    clock_t t1 = tick();
    for (int i = 0; i < NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME; i++)
        search_in_file(operation_file, 100, amount_file);
    clock_t t2 = tick();

    return (unsigned long long)(t2 - t1) / NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME;
}
