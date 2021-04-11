#include "../inc/sort_operations.h"

void sorted_insert(node_t **head, node_t *element, int (*comparator)(const void *, const void *))
{
	if (head != NULL && element != NULL && comparator != NULL)
	{
		if (*head != NULL)
		{
			node_t *temp = *head;
			if (comparator(temp->data, element->data) > 0)
			{
				element->next = temp;
				*head = element;
			}
			else if (temp->next == NULL)
			{
				temp->next = element;
				element->next = NULL;
			}
			else
			{
				int insert_status;
				for (insert_status = ERROR_STATUS; temp->next != NULL; temp = temp->next)
				{
					if (comparator(temp->next->data, element->data) > 0)
					{
						element->next = temp->next;
						temp->next = element;
						insert_status = SUCCESS_STATUS;
						break;
					}
				}
				if (insert_status == ERROR_STATUS)
				{
					element->next = NULL;
					temp->next = element;
				}
			}
		}
		else if (*head == NULL)
		{
			element->next = NULL;
			*head = element;
		}
	}
}

int get_list_size(node_t *head)
{
	int ans_size = 0;
	for (; head; head = head->next, ans_size++);
	printf("HERE\n");
	return ans_size;
}

int get_sort_status(node_t **head)
{
	node_t *sorted_head = NULL;
	for (node_t *temp = *head; temp; temp = temp->next)
	{
		node_t *element = (node_t*)malloc(sizeof(node_t));
		element->data = temp->data;
		sorted_insert(&sorted_head, element, compare);
	}
	(*head) = sorted_head;
	return SUCCESS_STATUS;
}
