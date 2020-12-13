#ifndef TREE_H
#define TREE_H

#include "../inc/config.h"

t_node *create_node(int val);
void freemem(t_node *tree);
void count_node(t_node *tree, int *sum);
t_node *ord_add_node(t_node *tree, t_node *node);

#endif //FUNC_H
