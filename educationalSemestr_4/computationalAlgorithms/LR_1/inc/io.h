#include "../inc/config.h"

#ifndef _IN_OUT_H_

int input_data(FILE *f, interpolation_operation  *data);

void output_polynom(interpolation_operation  data);
void output_function_root(interpolation_operation  data);

void get_config(interpolation_operation  *data);
int get_opening_file_status(interpolation_operation  *data);

#endif
