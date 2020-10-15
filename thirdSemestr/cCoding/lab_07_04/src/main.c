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

int main(int argc, char const *argv[])
{
	int size_of_integer_vector = 0, *integer_vector;

	if (is_right_argc(argc))
		return ERROR_STATUS_ARGC;

	if (is_right_argv(argc, argv))
		return ERROR_STATUS_ARGV;

	if (get_size_of_vector(argv[1], &size_of_integer_vector))
		return ERROR_STATUS_GET_SIZE;

	if (size_of_integer_vector == 0)
		return ERROR_STATUS_SIZE;

	
	integer_vector = (int*)malloc(size_of_integer_vector * sizeof(int));

	int *start_integer_vector_cursor = integer_vector;
	int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;
	
	if (get_int_elem_from_file_to_vec(argv[1], integer_vector, size_of_integer_vector))
	{
		free(integer_vector);
		return ERROR_STATUS_GET_ELEMS;
	}
	
	if (argc == 4 && argv[3][0] == 'f' && strlen(argv[3]) == 1)
	{
		if (key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor))
		{
			free(integer_vector);
			return ERROR_STATUS_USE_KEY;
		}
	}
	
	mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
	

	
	if (output_int_vec_into_out_file(argv[2], start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor))
	{
		free(integer_vector);
		return ERROR_STATUS_OUTPUT_INTO_FILE;
	}
	
	//printf("-->\n");
	free(integer_vector);
	//printf("<--\n");
	// free(start_integer_vector_cursor);
	// printf("<--\n");
	// free(end_integer_vector_cursor);
	// printf("<--\n");

	return SUCCESS_STATUS;
}
