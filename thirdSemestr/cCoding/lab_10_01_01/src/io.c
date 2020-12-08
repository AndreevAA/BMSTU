#include "../inc/config.h"
#include "../inc/list_functions.h"
#include "../inc/list_operations.h"
#include "../inc/elem_operations.h"
#include "../inc/sort_operations.h"
#include "../inc/io.h"

int get_args_status(int argc, char *argv[])
{
	if (strcmp(argv[NUM_OF_ARGS - 1], "find\0") == SUCCESS_STATUS && argc == NUM_OF_ARGS_FIND)
		return ARGV_FIND;
	else if (strcmp(argv[NUM_OF_ARGS - 1], "reverse\0") == SUCCESS_STATUS && argc == NUM_OF_ARGS)
		return ARGV_REVERSE;
	else if (strcmp(argv[NUM_OF_ARGS - 1], "sort\0") == SUCCESS_STATUS && argc == NUM_OF_ARGS)
		return ARGV_SORT;
	return ERROR_STATUS;
}

int is_args_ok(int argc, char *argv[])
{
	if (get_args_status(argc, argv) == ERROR_STATUS)
		return ERROR_STATUS;
	return SUCCESS_STATUS;
}

int is_str_size_not_free(char *str)
{
	if (strlen(str) >= 2)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

char *up_temp_data(char *str)
{
	str[strlen(str) - 1] = '\0';
	char *temp_data = (char*)malloc(sizeof(char) * (strlen(str) + 1));
	for (int i = 0; i < strlen(str) + 1; i++)
		*(temp_data + i) = str[i];
	return temp_data;
}

int is_head_null(node_t *head)
{
	if (head == NULL)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

node_t *add_str_comp(char *str, node_t *head)
{
	if (is_str_size_not_free(str) == SUCCESS_STATUS)
	{
		char *temp_data = up_temp_data(str);
		if (is_head_null(head) == SUCCESS_STATUS)
			push(&head, temp_data);
		else
			push_back(head, temp_data);
	}
	return head;
}

node_t *read_data_from_file(FILE *input_file)
{
	node_t *head = NULL;
	while (feof(input_file) == 0)
	{
		char str[MAX_STR_SIZE];
		if (fgets(str, sizeof(str), input_file) == NULL)
			break;
		else
			head = add_str_comp(str, head);
	}
	fclose(input_file);
	return head;
}

node_t *get_data(char *argv[])
{
	FILE *input_file = fopen(argv[1], "r");
	if (input_file == NULL)
		return NULL;
	return read_data_from_file(input_file);
}

void out_comp(int argv_status, int func_status, node_t *head)
{
	if (argv_status == ARGV_FIND)
	{
		if (func_status == SUCCESS_STATUS)
			printf("String is in the file.\n");
		else
			printf("String isn't in the file.\n");
	}
	else if (argv_status == ARGV_REVERSE)
	{
		if (func_status == SUCCESS_STATUS)
			print_linked_list(head);
		else
			printf("There were some problems during reversing...\n");
	}
	else if (argv_status == ARGV_SORT)
	{
		if (func_status == SUCCESS_STATUS)
			print_linked_list(head);
		else
			printf("There were some problems during sorting...\n");
	}
}

int get_operations_status(int argc, char *argv[], node_t *head)
{
	int argv_status = get_args_status(argc, argv);
	if (argv_status == ARGV_FIND)
	{
		int find_status = get_find_status(head, argv[NUM_OF_ARGS_FIND - 1]);
		out_comp(argv_status, find_status, head);
		return find_status;
	}
	else if (argv_status == ARGV_REVERSE)
	{
		int rev_status = get_reverse_status(&head);
		out_comp(argv_status, rev_status, head);
		return rev_status;
	}
	int sort_status = get_sort_status(&head);
	out_comp(argv_status, sort_status, head);
	return sort_status;
}
