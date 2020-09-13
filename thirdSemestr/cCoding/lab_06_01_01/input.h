#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void delete_enter(char * temp_text);

void input_data_transomation(char * temp_title, char * temp_name, char * temp_year);

int scanf_input_data(char* temp_title, char* temp_name, char* temp_year, FILE *operationfile);

int check_input_argv(int argc, char *argv[]);

int is_data_right(char *data);
