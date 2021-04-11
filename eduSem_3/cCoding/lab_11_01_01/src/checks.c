#include "../inc/checks.h"
#include "../inc/comps.h"
#include "../inc/funcs.h"

int is_end_of_pars(const char *format)
{
    if (*format == '\0')
        return SUCCESS_STATUS;
    return ERROR_STATUS;
}

int is_integer_par(const char *format)
{
    if (*format == '%' && *(format + 1) == 'd')
        return SUCCESS_STATUS;
    return ERROR_STATUS;
}

int is_string_par(const char *format)
{
    if (*format == '%' && *(format + 1) == 's')
        return SUCCESS_STATUS;
    return ERROR_STATUS;
}

int is_long_int_par(const char *format)
{
    if (*format == '%' && *(format + 1) == 'l' && *(format + 2) == 'x')
        return SUCCESS_STATUS;
    return ERROR_STATUS;
}
