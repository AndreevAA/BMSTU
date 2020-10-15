#include "../inc/io.h"

int is_right_argc(int argc)
{
	if (argc >= MIN_NUM_OF_ARGC && argc <= MAX_NUM_OF_ARGC)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_right_argv(int argc, char const *argv[])
{
	int errorflag = ERROR_STATUS;
	if (argc == MAX_NUM_OF_ARGC)
	{
		if (argv[3][0] == 'f' && strlen(argv[3]) == 1)
			errorflag = SUCCESS_STATUS;
	}
	else if (argc == MIN_NUM_OF_ARGC)
		errorflag = SUCCESS_STATUS;
	return errorflag;
}

int get_size_of_vector(const char *in_file_name, int *size_of_integer_vector)
{
	FILE *in_file = fopen(in_file_name, "r");

	if (in_file != NULL)
	{
		int input_number = 0;
		while (!feof(in_file) && fscanf(in_file, "%d", &input_number) > EOF)
			(*size_of_integer_vector) += 1;
	
		fclose(in_file);
		return SUCCESS_STATUS;
	}

	fclose(in_file);
	return ERROR_STATUS;
}

int get_int_elem_from_file_to_vec(const char *in_file_name, int *integer_vector, int size_of_integer_vector)
{
	FILE *in_file = fopen(in_file_name, "r");
	int temp_number_of_readed_strings = 0;
	
	if (in_file != NULL)
	{
		for (; temp_number_of_readed_strings < size_of_integer_vector && fscanf(in_file, "%d", integer_vector); integer_vector++)
			temp_number_of_readed_strings++;
		fclose(in_file);

		if (temp_number_of_readed_strings == size_of_integer_vector)
			return SUCCESS_STATUS;
		return ERROR_STATUS;
	}

	fclose(in_file);
	return ERROR_STATUS;
}

void allocate_memory_by_size(int *integer_vector, int size_of_integer_vector)
{
	integer_vector = (int*)malloc(size_of_integer_vector * sizeof(int));
}

int output_int_vec_into_out_file(const char *out_file_name, int *integer_vector, int size_of_integer_vector)
{
	FILE *out_file = fopen(out_file_name, "w");

	if (out_file != NULL)
	{
		for (int check_cursor = 0; check_cursor < size_of_integer_vector; check_cursor++)
		{
			if (check_cursor == size_of_integer_vector - 1)
				fprintf(out_file, "%d", integer_vector[check_cursor]);
			else
				fprintf(out_file, "%d ", integer_vector[check_cursor]);
		}
		fclose(out_file);
		return SUCCESS_STATUS;
	}
	fclose(out_file);
	return ERROR_STATUS;
}
