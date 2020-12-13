#include "../inc/config.h"
#include "../inc/balance.h"
#include "../inc/efficiency.h"
#include "../inc/export.h"
#include "../inc/hash.h"
#include "../inc/io.h"
#include "../inc/search.h"
#include "../inc/tree.h"

// Функция построения обычного дерева
t_node *read_file(FILE *f, t_node *root)
{
    rewind(f);
    int val;
    while (!feof(f))
    {
        if (fscanf(f, "%d", &val) == 1)
        {
            t_node *node = create_node(val);
            root = ord_add_node(root, node);
        }
        else
            return NULL;
    }
    return root;
}

