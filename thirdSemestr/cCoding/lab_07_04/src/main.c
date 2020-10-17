/*!
\file
\brief Основной файл программы
\author    "Андреев Александр"
\version   12
\date      6 сентября 2020
*/
#include "../inc/io.h"
#include "../inc/sort.h"
#include "../inc/key.h"
#include "../inc/functions.h"

int main(int argc, char const *argv[])
{
	if (is_right_argc(argc))
		return ERROR_STATUS_ARGC;
	if (is_right_argv(argc, argv))
		return ERROR_STATUS_ARGV;
	int size_of_integer_vector = 0;
	if (get_size_of_vector(argv[1], &size_of_integer_vector))
		return ERROR_STATUS_GET_SIZE;
	if (is_zero_size(size_of_integer_vector))
		return ERROR_STATUS_SIZE;
	int *integer_vector = (int*)malloc(size_of_integer_vector * sizeof(int));
	int *start_integer_vector_cursor = integer_vector, *end_integer_vector_cursor = integer_vector + size_of_integer_vector;
	if (get_int_elem_from_file_to_vec(argv[1], integer_vector, size_of_integer_vector))
	{
		update_memory(integer_vector, start_integer_vector_cursor);
		return ERROR_STATUS_GET_ELEMS;
	}
	if (need_key_using(argc, argv))
		if (key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor))
		{
			update_memory(integer_vector, start_integer_vector_cursor);
			return ERROR_STATUS_USE_KEY;
		}
	mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
	if (output_int_vec_into_out_file(argv[2], start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor))
	{
		update_memory(integer_vector, start_integer_vector_cursor);
		return ERROR_STATUS_OUTPUT_INTO_FILE;
	}
	update_memory(integer_vector, start_integer_vector_cursor);
	return SUCCESS_STATUS;
}
