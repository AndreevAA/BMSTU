#ifndef EXPORT_H
#define EXPORT_H

#include "../../inc/config.h"

void export_to_dot(FILE *f, const char *tree_name, t_node *tree, int is_search, int search_val);
void apply_pre(t_node *tree, FILE *f, int is_search, int search_val);
void to_dot(t_node *tree, FILE *f, int is_search, int search_val);

#endif //EXPORT_H
