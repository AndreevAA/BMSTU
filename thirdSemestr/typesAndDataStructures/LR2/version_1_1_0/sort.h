#include "menu.h"
#include "comparators.h"

void bubble_sort(struct sort_key *input_vector, int input_vector_size);
double get_time_sort_by_field(struct sort_key *input_vector, int input_vector_size, int key_to_sort, union students_accommodation_information *input_table_information, int flag, int sort_flag);
