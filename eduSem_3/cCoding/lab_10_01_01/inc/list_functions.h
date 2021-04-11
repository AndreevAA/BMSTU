#include "../inc/config.h"

node_t *init(node_t *lst, char *value);
node_t *addelem(node_t *lst, char *value);

void push(node_t **head, void *data);
void print_linked_list(node_t *head);
void push_back(node_t *head, void *data);

int compare(const void *x1, const void *x2);
