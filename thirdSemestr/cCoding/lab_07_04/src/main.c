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
	int errorflag = ERROR_STATUS, size_of_integer_vector = 0, *integer_vector;

	if (is_right_argc(argc) == SUCCESS_STATUS && is_right_argv(argc, argv) == SUCCESS_STATUS)
	{
		FILE *in_file = fopen(argv[1], "r"), *out_file = fopen(argv[2], "w");

		if (in_file != NULL && out_file != NULL)
		{
			get_size_of_vector(argv[1], &size_of_integer_vector);
			if (size_of_integer_vector > 0)
			{
				integer_vector = (int*)malloc(size_of_integer_vector * sizeof(int));
				int *start_integer_vector_cursor = integer_vector;
				int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

				if (get_int_elem_from_file_to_vec(in_file, integer_vector, size_of_integer_vector) == SUCCESS_STATUS)
				{
					if (argc == 4 && strcmp(argv[3], "f") == 0)
					{
						if (key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor) == ERROR_STATUS)
						{
							free(integer_vector);
							//return errorflag;
						}
					}
					mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
					output_int_vec_into_out_file(out_file, start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor);
					errorflag = SUCCESS_STATUS;
				}
			}
		}

		fclose(out_file);
	}

	return errorflag;
}
