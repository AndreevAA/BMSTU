#ifndef EXPORT_H
#define EXPORT_H

#include "../inc/config.h"

void export_to_dot(matrix *adjacency_matrix);
void is_any_way(int v, matrix *adjacency_matrix, int end, int *res);
int is_not_av_get_a_way(int start, matrix *adjacency_matrix, int end);

#endif //EXPORT_H
