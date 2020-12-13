#ifndef BALANCE_H
#define BALANCE_H

#include "../../inc/config.h"

t_node* rotateleft(t_node* q);
t_node* rotateright(t_node* p);
void fixheight(t_node* p);
t_node* bal_add_node(t_node *root, t_node *node);
t_node* balance(t_node* p);
t_node* read_file_balanced(t_node *root, FILE *f);
int height(t_node* p);
int bfactor(t_node* p);

#endif //BALANCE_H
