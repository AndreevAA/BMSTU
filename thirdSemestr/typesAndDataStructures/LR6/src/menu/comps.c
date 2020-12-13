#include "../../inc/menu/comps.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"

void build_simple_tree(t_node **tree_root)
{
    FILE *out_file = fopen("output.gv", "w+");
    export_to_dot(out_file, "TREE", *tree_root, 0, 0);
}

