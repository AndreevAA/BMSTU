#include "io.h"

int is_right_argc(int argc)
{
	if (argc >= MIN_NUM_OF_ARGC && MIN_NUM_OF_ARGC <= MAX_NUM_OF_ARGC)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_right_argv(int argc, char const *argv[])
{
	int errorflag = ERROR_STATUS;

	if (argc == MAX_NUM_OF_ARGC)
	{
		if (strcmp(argv[3], "f") == SUCCESS_STATUS)
			errorflag = SUCCESS_STATUS;
	}
	else if (argc == MIN_NUM_OF_ARGC)
		errorflag = SUCCESS_STATUS;

	return errorflag;
}

void get_size_of_vector(const char *in_file_name, int *size_of_integer_vector)
{
	FILE *in_file = fopen(in_file_name, "r");

	while (!feof(in_file))
    {
        if (fgetc(in_file) == '\n')
            (*size_of_integer_vector)++;
    }

    fclose(in_file);
}

int get_integer_elements_from_file_to_vector(FILE *in_file, int *integer_vector, int *size_of_integer_vector)
{
	int errorflag = ERROR_STATUS, temp_number_of_readed_strings = 0;

	while (fscanf(in_file, "%d", &integer_vector[temp_number_of_readed_strings]) == 1)
		temp_number_of_readed_strings++;
	
	if (temp_number_of_readed_strings == *size_of_integer_vector)
		errorflag = SUCCESS_STATUS;

	return errorflag;
}

void allocate_memory_by_size(int *integer_vector, int size_of_integer_vector)
{
	integer_vector = (int*)malloc(size_of_integer_vector * sizeof(int));
}

void output_integer_vector_into_out_file(FILE *out_file, int *integer_vector, int size_of_integer_vector)
{
	for (int check_cursor = 0; check_cursor < size_of_integer_vector; check_cursor++)
		fprintf(out_file, "%d\n", integer_vector[check_cursor]);
}
