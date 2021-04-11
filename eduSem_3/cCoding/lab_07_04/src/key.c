#include "../inc/key.h"

double get_average_number(const int *pb_src, const int *pe_src);
int get_filtered_integer_vec_size(const int *pb_src, const int *pe_src, double average_number);
void choose_elems_to_filt_int_vec(const int *filtered_integer_vector, const int *filtered_integer_vector_size, const int *pb_src, const int *pe_src, double average_number);

int key(const int *pb_src, const int *pe_src, int **pb_dst, int **pe_dst)
{
	int errorflag = ERROR_STATUS;
	if (pb_src && pb_src && pe_src > pb_src && pe_dst && pb_dst)
	{
		double average_number = get_average_number(pb_src, pe_src);
		int filtered_integer_vector_size = get_filtered_integer_vec_size(pb_src, pe_src, average_number), *filtered_integer_vector;
		if (filtered_integer_vector_size > 0)
		{
			filtered_integer_vector = (int*)malloc(filtered_integer_vector_size * sizeof(int));
			if (filtered_integer_vector)
			{
				choose_elems_to_filt_int_vec(filtered_integer_vector, filtered_integer_vector + filtered_integer_vector_size, pb_src, pe_src, average_number);
				*pb_dst = filtered_integer_vector;
				*pe_dst = filtered_integer_vector + filtered_integer_vector_size;
				errorflag = SUCCESS_STATUS;
			}
		}
	}

	return errorflag;
}

void choose_elems_to_filt_int_vec(const int *filtered_integer_vector, const int *filtered_integer_vector_size, const int *pb_src, const int *pe_src, double average_number)
{
	int add_cursor = 0;
	for (int check_cursor = 0; check_cursor < (pe_src - pb_src); check_cursor++)
		if (*((int *)(((int *)pb_src) + check_cursor)) > average_number)
		{
			*((int *)(((int *)filtered_integer_vector) + add_cursor)) = *((int *)(((int *)pb_src) + check_cursor));
			add_cursor++;
		}
}

double get_average_number(const int *pb_src, const int *pe_src)
{
	double sum_of_number = 0;
	for (int check_cursor = 0; check_cursor < (pe_src - pb_src); check_cursor++)
		sum_of_number += *((int *)(((int *)pb_src) + check_cursor));
	return (sum_of_number / ((pe_src - pb_src)));
}

int get_filtered_integer_vec_size(const int *pb_src, const int *pe_src, double average_number)
{
	int filtered_integer_vector_size = 0;
	for (int check_cursor = 0; check_cursor < (pe_src - pb_src); check_cursor++)
		if (*((int *)(((int *)pb_src) + check_cursor)) > average_number)
			filtered_integer_vector_size++;
	return filtered_integer_vector_size;
}
