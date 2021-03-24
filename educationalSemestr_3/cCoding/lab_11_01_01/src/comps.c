#include "../inc/checks.h"
#include "../inc/comps.h"
#include "../inc/funcs.h"

const char *integer_comp(char *buffer, size_t buffer_size, const char *format, int temp_number, int *add_cur, int *num)
{
    char temp_str[12];
    int_to_str(temp_number, temp_str);
    *num = out_buffer(buffer, buffer_size, temp_str, add_cur, *num);
    
    format += 2;
    return format;
}

const char *string_comp(char *buffer, size_t buffer_size, const char *format, char *temp_str, int *add_cur, int *num)
{
    if (temp_str == NULL)
    {
        *num = out_buffer(buffer, buffer_size, "(null)", add_cur, *num);
    
        format += 2;
        return format;
    }

    *num = out_buffer(buffer, buffer_size, temp_str, add_cur, *num);
    
    format += 2;
    return format;
}

const char *long_int_comp(char *buffer, size_t buffer_size, const char *format, long temp_number, int *add_cur, int *num)
{
    char temp_str[20];
    convert_num_sys(temp_number, temp_str);
    *num = out_buffer(buffer, buffer_size, temp_str, add_cur, *num);

    format += 3;
    return format;
}

const char *symbol_comp(char *buffer, size_t buffer_size, const char *format, int *add_cur, int *num)
{
    if (*(add_cur) < (int)buffer_size - 1)
    {
        *(buffer + *add_cur) = *format;
        (*add_cur)++;
    }
    
    if (*format != '\0')
        (*num)++;

    format += 1;
    return format;
}
