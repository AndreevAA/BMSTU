#include "../inc/config.h"
#include "../inc/tree_operations/balance.h"
#include "../inc/efficiency.h"
#include "../inc/tree_operations/export.h"
#include "../inc/tree_operations/hash.h"
#include "../inc/io.h"
#include "../inc/tree_operations/search.h"
#include "../inc/tree_operations/tree.h"
#include "../inc/menu.h"

int main()
{
	t_node *tree_root = NULL, *tree_root_balanced = NULL;
	FILE *operation_file = get_file_data(&tree_root);
    
    if (!is_null(tree_root))
    	return file_error();

    tree_root_balanced = read_file_balanced(tree_root_balanced, operation_file);

    menu(tree_root_balanced, operation_file, tree_root);

    fclose(operation_file);
    freemem(tree_root);

    return EXIT_STATUS;
}
