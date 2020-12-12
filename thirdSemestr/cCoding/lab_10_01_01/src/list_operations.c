#include "../inc/list_operations.h"
#include "../inc/list_functions.h"

node_t *reverse(node_t *head)
{
	node_t *reverse_list = NULL;
	
	for (node_t *temp_head = head; temp_head != NULL; temp_head = temp_head->next)
	{
		node_t *temp_rev_list = (node_t*)malloc(sizeof(node_t));
		temp_rev_list->data = temp_head->data;
		temp_rev_list->next = reverse_list;
		reverse_list = temp_rev_list;
		//free(temp_rev_list);
		free(temp_head);
	}
	free(head);
	return reverse_list;
}

int get_reverse_status(node_t **head)
{
	*head = reverse(*head);
	if (head == NULL)
		return ERROR_STATUS;
	return SUCCESS_STATUS;
}
