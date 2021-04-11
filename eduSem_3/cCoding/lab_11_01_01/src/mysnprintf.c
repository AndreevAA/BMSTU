#include "../inc/mysnprintf.h"
#include "../inc/checks.h"
#include "../inc/comps.h"
#include "../inc/funcs.h"

int my_snprintf(char *buffer, size_t buffer_size, const char *format, ...)
{
    if (!format || (!buffer && buffer_size != 0))
        return -1;

    va_list args;
    va_start(args, format);

    int add_cur = 0, num = 0;

    while (is_end_of_pars(format) == ERROR_STATUS)
    {
        if (!is_integer_par(format))
            format = integer_comp(buffer, buffer_size, format, va_arg(args, int), &add_cur, &num);
        else if (!is_string_par(format))
            format = string_comp(buffer, buffer_size, format, va_arg(args, char *), &add_cur, &num);
        else if (!is_long_int_par(format))
            format = long_int_comp(buffer, buffer_size, format, va_arg(args, long int), &add_cur, &num);
        else
            format = symbol_comp(buffer, buffer_size, format, &add_cur, &num);
    }

    if (buffer)
        for (int p = add_cur; p <= (int)buffer_size - 1; p++)
            buffer[p] = '\0';
    va_end(args);
    
    return num;
}
