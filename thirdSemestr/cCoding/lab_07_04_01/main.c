/*!
\file
\brief Основной файл программы
\author    "Андреев Александр"
\version   12
\date      6 сентября 2020
*/
#include "io.h"
#include "functions.h"

int main(int argc, char const *argv[])
{
	int errorflag = ERROR_STATUS, size_of_integer_vector = 0, *integer_vector;

	if (is_right_argc(argc) == SUCCESS_STATUS && is_right_argv(argc, argv) == SUCCESS_STATUS)
	{
		FILE *in_file = fopen(argv[1], "r"), *out_file = fopen(argv[2], "w");

		if (in_file != NULL && out_file != NULL)
		{
			get_size_of_vector(argv[1], &size_of_integer_vector);
			//printf("get_size_of_vector(argv[1], &size_of_integer_vector);\n");
			//allocate_memory_by_size(integer_vector, size_of_integer_vector);
			//printf("allocate_memory_by_size(integer_vector, size_of_integer_vector);\n");

			integer_vector = (int*)malloc(size_of_integer_vector * sizeof(int));
			//printf("integer_vector = (int*)malloc(size_of_integer_vector * sizeof(int));\n");


			if (get_integer_elements_from_file_to_vector(in_file, integer_vector, &size_of_integer_vector) == SUCCESS_STATUS)
			{
				//printf("get_integer_elements_from_file_to_vector(in_file, integer_vector, &size_of_integer_vector) == SUCCESS_STATUS\n");

				filter_integer_vector(integer_vector, size_of_integer_vector, argc);
				//printf("filter_integer_vector(integer_vector, size_of_integer_vector, argc);\n");

				sort_integer_vector(integer_vector, size_of_integer_vector);
				//printf("sort_integer_vetor(integer_vector, size_of_integer_vector);\n");
				
				output_integer_vector_into_out_file(out_file, integer_vector, size_of_integer_vector);
				//printf("output_integer_vector_into_out_file(out_file, integer_vector, size_of_integer_vector);\n");
			}
		}
	}

	return errorflag;
}