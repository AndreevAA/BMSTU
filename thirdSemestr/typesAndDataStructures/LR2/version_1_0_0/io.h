#include "menu.h"

void output_welcome_information();
void output_welcome_command();
// void output_all_students(struct students_accommodation_information *input_table_information, int *input_table_information_size);
// void save_information_into_file(char const *argv[], struct students_accommodation_information *input_table_information, int *input_table_information_size);
void output_filtered_students(union students_accommodation_information *input_table_information, int input_table_information_size);
int get_in_file_information(FILE *in_file, union students_accommodation_information *input_table_information, int *input_table_information_size);
// void sim_str(char *first, char *second);

void output_all_students(union students_accommodation_information *input_table_information, int *input_table_information_size);
void sim_str(char *first, char *second);
