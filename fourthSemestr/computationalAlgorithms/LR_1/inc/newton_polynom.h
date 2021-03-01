#include <stdio.h>
#include "../inc/io.h"

#include "../inc/config.h"

#ifndef NEWTON_POLYNOM
#define NEWTON_POLYNOM

void divided_difference_newton(interpolation_operation  *data);
void get_newton_polynom(interpolation_operation  *data);

#endif
