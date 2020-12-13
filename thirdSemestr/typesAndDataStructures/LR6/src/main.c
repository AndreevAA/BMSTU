#include "../inc/config.h"
#include "../inc/balance.h"
#include "../inc/efficiency.h"
#include "../inc/export.h"
#include "../inc/hash.h"
#include "../inc/io.h"
#include "../inc/search.h"
#include "../inc/tree.h"
#include "../inc/menu.h"

int main()
{
	t_node *root = NULL, *balanced_root = NULL;
	FILE *f = get_file_data(&root);
    
    if (!is_null(root))
    	return file_error();

    balanced_root = read_file_balanced(balanced_root, f);

    menu(balanced_root, f, root);

    fclose(f);
    freemem(root);

    return EXIT_STATUS;
}
