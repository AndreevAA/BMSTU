#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifndef MAINH
#define MAINH

#define MIN_NUM_OF_ARGC 3
#define MAX_NUM_OF_ARGC 4
#define MAX_SIZE 50
#define MAX_NUMBER 50
#define SUCCESS_STATUS 0
#define ERROR_STATUS 1

#define ERROR_STATUS_ARGC 1
#define ERROR_STATUS_ARGV 2
#define ERROR_STATUS_GET_SIZE 3
#define ERROR_STATUS_SIZE 4
#define ERROR_STATUS_GET_ELEMS 5
#define ERROR_STATUS_USE_KEY 6
#define ERROR_STATUS_OUTPUT_INTO_FILE 7

#endif

int is_right_argc(int argc);
int is_right_argv(int argc, char const *argv[]);

int get_size_of_vector(const char *in_file_name, int *size_of_integer_vector);
void allocate_memory_by_size(int *integer_vector, int size_of_integer_vector);
int get_int_elem_from_file_to_vec(const char *in_file_name, int *integer_vector, int size_of_integer_vector);
int output_int_vec_into_out_file(const char *out_file_name, int *integer_vector, int size_of_integer_vector);
