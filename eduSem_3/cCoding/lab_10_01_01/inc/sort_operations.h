#include "../inc/config.h"
#include "../inc/list_functions.h"

void sorted_insert(node_t **head, node_t *element, int (*comparator)(const void *, const void *));
int get_sort_status(node_t **head);
