#include "../inc/list_functions.h"

node_t *init(node_t *lst, char *data) 
{
	lst = (node_t*)malloc(sizeof(node_t));
	lst->data = (void *)data;
	lst->next = NULL;
	return lst;
}

node_t *addelem(node_t *lst, char *data)
{
	node_t *temp, *p;
	temp = (node_t*)malloc(sizeof(node_t));
	p = lst->next; 
	lst->next = temp; 
	temp->data = (void *)data; 
	temp->next = p; 
	return temp;
}

void push(node_t **head, void *data)
{
	node_t *tmp = (node_t*)malloc(sizeof(node_t));
	tmp->data = data;
	tmp->next = (*head);
	(*head) = tmp;
}

void print_linked_list(node_t *head) 
{
	for (; head; head = head->next)
		printf("%s\n", (char *)head->data);
}

node_t *get_last(node_t *head)
{
	if (head == NULL)
		return NULL;
	while (head->next)
		head = head->next;
	return head;
}

void push_back(node_t *head, void *data)
{
	node_t *last = get_last(head);
	node_t *tmp = (node_t*) malloc(sizeof(node_t));
	tmp->data = data;
	tmp->next = NULL;
	last->next = tmp;
}

int compare(const void *x1, const void *x2)
{
	return (strcmp((char *)x1, (char *)x2));
}
