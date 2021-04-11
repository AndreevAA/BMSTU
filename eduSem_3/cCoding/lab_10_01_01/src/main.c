#include "../inc/config.h"
#include "../inc/elem_operations.h"
#include "../inc/list_operations.h"
#include "../inc/sort_operations.h"
#include "../inc/list_functions.h"
#include "../inc/io.h"

int main(int argc, char *argv[])
{
	if (is_args_ok(argc, argv) == ERROR_STATUS)
		return ERROR_ARGV;
	node_t *head = get_data(argv);
	//print_linked_list(head);
	//printf("hu\n");
	if (get_operations_status(argc, argv, head) == ERROR_STATUS)
		return ERROR_STATUS;
	
	return SUCCESS_STATUS;
}
