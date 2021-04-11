#include "menu.h"
#include "io.h"
#include "time.h"
#include "check.h"
#include "comparators.h"
#include "sort.h"

void allocate_memory_to_input_table_information(union students_accommodation_information *input_table_information);
void sort_students_by_key(union students_accommodation_information *input_table_information, int input_table_information_size);
int add_note(union students_accommodation_information *input_table_information, int *input_table_information_size);
int delete_note(union students_accommodation_information *input_table_information, int *input_table_information_size);
void get_key_table(union students_accommodation_information *input_table_information, int input_table_information_size);
