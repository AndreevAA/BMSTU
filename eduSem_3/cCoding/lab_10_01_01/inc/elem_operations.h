#include "../inc/config.h"
#include "../inc/list_functions.h"

node_t *find(node_t *head, const void *data, int (comparator)(const void *, const void *));
int get_find_status(node_t *head, char *data);
