#include "../inc/config.h"
#include "../inc/tree_operations/balance.h"
#include "../inc/efficiency.h"
#include "../inc/tree_operations/export.h"
#include "../inc/tree_operations/hash.h"
#include "../inc/io.h"
#include "../inc/tree_operations/search.h"
#include "../inc/tree_operations/tree.h"

// Функция построения обычного дерева
t_node *read_file(FILE *operation_file, t_node *tree_root)
{
    rewind(operation_file);
    int temp_input_number;
    while (!feof(operation_file))
    {
        if (fscanf(operation_file, "%d", &temp_input_number) == 1)
        {
            t_node *node = create_node(temp_input_number);
            tree_root = ord_add_node(tree_root, node);
        }
        else
            return NULL;
    }
    return tree_root;
}

FILE *get_file_data(t_node **temp_node)
{
	FILE *operation_file = fopen(FILENAME, "r+");
	*temp_node = read_file(operation_file, *temp_node);
	return operation_file;
}

int is_null(t_node *temp_node)
{
	if (temp_node == NULL)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int file_error()
{
	printf(" ❌ Недопустимые символы в файле, \n ❌ Либо файл пуст. \n");
    return FILE_ERROR;
}
