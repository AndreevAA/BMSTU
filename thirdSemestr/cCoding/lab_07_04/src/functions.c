#include "../inc/functions.h"

void update_memory(int *integer_vector, int *start_integer_vector_cursor)
{
	if (integer_vector != start_integer_vector_cursor)
		free(start_integer_vector_cursor);
	free(integer_vector);
}

int need_key_using(int argc, char const *argv[])
{
	return (argc == 4 && argv[3][0] == 'f' && strlen(argv[3]) == 1);
}

int is_zero_size(int size_of_integer_vector)
{
	return (size_of_integer_vector == 0);
}
