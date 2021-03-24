#include "io.h"

void mysort(void *integer_vector, size_t size_of_integer_vector, size_t integer_vector_number, int (*compare)(void *, void *));
int compare(void *first, void *second);
