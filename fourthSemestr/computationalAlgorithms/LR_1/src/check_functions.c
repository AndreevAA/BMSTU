#include <stdio.h>
#include <stdlib.h>
#include "../inc/io.h"
#include "../inc/check_functions.h"

int check_monotony(interpolation_operation data)
{
    int res = 0;
    if (data.y_values[0] < 0)
        res = -1;
    else
        res = 1;
    for (int i = 0; i < data.total - 1; i++)
        if (res > 0 && data.y_values[i] <= 0)
            res = 2;
        else if (res < 0 && data.y_values[i] >= 0)
            res = -2;
    if (res % 2 != 0)
        res = 0;
    return res;
}
