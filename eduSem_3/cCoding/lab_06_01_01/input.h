#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "functions.h"

void delete_enter(char *temp_text);

void input_data_transomation(char *temp_title, char *temp_name, char *temp_year);

int scanf_input_data(char *temp_title, char *temp_name, char *temp_year, FILE *operationfile);

int check_input_argv(int argc, char *argv[]);

int is_data_right(char *data);

int check_input_film(char *temp_title, char *temp_name, char *temp_year);

int num_of_structures(struct films *all_films, int number_of_films);

int get_number_of_films(struct films *all_films, int number_of_films);

int open_file(FILE *operationfile, char *argv[]);

int input_data(FILE *operationfile, struct films *all_films, int *number_of_films, char *field);
