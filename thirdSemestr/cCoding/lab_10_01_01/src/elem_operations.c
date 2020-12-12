#include "../inc/elem_operations.h"

node_t *find(node_t *head, const void *data, int (comparator)(const void *, const void *))
{
	int *cur = NULL;
	const int *search = data;

	for (node_t *temp = head; temp != NULL; temp = temp->next)
	{
		cur = temp->data;
		if (comparator(cur, search) == SUCCESS_STATUS)
			return temp;
	}
	return NULL;
}

int get_find_status(node_t *head, char *data)
{
	node_t *found = find(head, (void *)data, compare);
	if (found == NULL)
		return ERROR_STATUS;
	return SUCCESS_STATUS;
}
