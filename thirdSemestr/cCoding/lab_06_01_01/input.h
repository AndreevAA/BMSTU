/*!
\file
\brief Файл ввода и обработки программы
\author    "Андреев Александр"
\version   12
\date      6 сентября 2020
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "main.h"

void input_data_transomation(char *temp_title, char *temp_name, char *temp_year);

int scanf_input_data(char *temp_title, char *temp_name, char *temp_year, FILE *operationfile);

int check_input_argv(int argc, char *argv[]);

int check_input_film(char *temp_title, char *temp_name, char *temp_year);

int get_number_of_films(struct films *all_films, int number_of_films);
