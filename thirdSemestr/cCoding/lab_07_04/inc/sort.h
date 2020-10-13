#include "io.h"

//void my_sort(int *integer_vector, int size_of_integer_vector);
void mysort(void *integer_vector, size_t size_of_integer_vector, size_t integer_vector_number, int (*compare)(void *, void *));
int compare(void *first, void *second);
