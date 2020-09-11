#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "main.h"
#include "output.h"
#include "comparation.h"

int compare_elems(films one_film, films second_film, char* key_to_compare);

void insertionsort(struct films* all_films, int number_of_films, char* key_to_compare);

void add_temp_film(films** all_films, int *number_of_films, char* temp_title, char* temp_name, char* temp_year);

int search_field(struct films* all_films, int number_of_films, char* field, char* key);
