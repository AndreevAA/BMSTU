#include "../inc/checks.h"
#include "../inc/comps.h"
#include "../inc/funcs.h"

const char *integer_comp(char *buffer, size_t buffer_size, const char *format, int temp_number, int *add_cur, int *num)
{

    char temp_str[12];
    int_to_str(temp_number, temp_str);
    
    *num = out_buffer(buffer, buffer_size, temp_str, add_cur, *num);
    //printf("num = %d, len = %lu, string = %s\n", *(num), strlen(temp_str), temp_str);
    

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

    //printf("num = %d, len = %lu, string = %s\n", *(num), strlen(temp_str), temp_str);
    

    //temp_str[strlen(temp_str)] = '\0';
	//printf("[temp_str = %s]\n", temp_str);
    //out_buffer(buffer, temp_str, add_cur);
    
    format += 2;
    return format;
}

const char *long_int_comp(char *buffer, size_t buffer_size, const char *format, long int temp_number, int *add_cur, int *num)
{
    char temp_str[12];
    convert_num_sys(temp_number, temp_str);
    *num = out_buffer(buffer, buffer_size, temp_str, add_cur, *num);

    format += 2;
    return format;
}

const char *symbol_comp(char *buffer, size_t buffer_size, const char *format, int *add_cur, int *num)
{
    if (*(add_cur) < (int)buffer_size - 1)
    {
        *(buffer + *add_cur) = *format;
        (*add_cur)++;
    }
    

    // int i = 0;
    // if (*format == '%')
    // {
    //     if (*(format + 1) == 'h' || *(format + 1) == 'l' || *(format + 1) == 'j' || *(format + 1) == 'z' || *(format + 1) == 't' || *(format + 1) == 'L')
    //         i = 1;
    //     if (i == 1 && (*(format + 1) == 'h' || *(format + 1) == 'l'))
    //         i = 2;
    // }
    // if (i == 0)
    // {
    	
    // 	format ++;
    // }
    // if (i != 0)
    
    if (*format != '\0')
    {
        //printf("%c\n", *format);
        (*num)++;
    }
    format += 1;
    return format;
}
