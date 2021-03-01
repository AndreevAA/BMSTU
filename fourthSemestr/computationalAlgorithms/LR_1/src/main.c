#include <stdio.h>
#include <stdlib.h>

#include "../inc/io.h"

#include "../inc/base_functions.h"

#include "../inc/newton_polynom.h"
#include "../inc/armit_polynom.h"

#include "../inc/check_functions.h"

#include "../inc/config.h"

#include "../inc/comparators.h"


int main()
{
	interpolation_operation data;

    if (get_opening_file_status(&data) == SUCCESS_STATUS)
    {
        data_transmission_comparator(&data);
        dif_polynom_comparator(&data, check_monotony(data));
    }

    return SUCCESS_STATUS;
}
