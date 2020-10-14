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

#endif

int is_right_argc(int argc);
int is_right_argv(int argc, char const *argv[]);

void get_size_of_vector(const char *in_file_name, int *size_of_integer_vector);
void allocate_memory_by_size(int *integer_vector, int size_of_integer_vector);
int get_int_elem_from_file_to_vec(FILE *in_file, int *integer_vector, int size_of_integer_vector);
void output_int_vec_into_out_file(FILE *out_file, int *integer_vector, int size_of_integer_vector);
