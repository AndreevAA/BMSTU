#include "config.h"

const char *integer_comp(char *buffer, size_t buffer_size, const char *format, int temp_number, int *add_cur, int *num);
const char *string_comp(char *buffer, size_t buffer_size, const char *format, char *temp_str, int *add_cur, int *num);
const char *long_int_comp(char *buffer, size_t buffer_size, const char *format, long temp_number, int *add_cur, int *num);
const char *symbol_comp(char *buffer, size_t buffer_size, const char *format, int *add_cur, int *num);
