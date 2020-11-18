/*!
\file
\brief Файл с выводящими функциями
\author    "Андреев Александр"
\version   10
\date      11 сентября 2020
 
Данный файл содержит в себе тело функций,
производящих вывод. 
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "input.h"
#include "output.h"
#include "operations.h"
#include "functions.h"

void output_data(char *title, char *name, char *year)
{
	printf("%s\n%s\n%d\n", title, name, char_to_int_number(year));
}

int check_data(struct films *all_films, int number_of_films)
{
	int errorflag = ERROR_STATUS, par = SUCCESS_STATUS;

	int number_of_printed_structures = 0;

	for (int i = 0; i < number_of_films; i++)
		if (strlen((all_films)[i].title) > 0 && strlen((all_films)[i].name) > 0 && strlen((all_films)[i].year) > 0)
		{
			if (check_input_film(all_films[i].title, all_films[i].name, all_films[i].year) == ERROR_STATUS)
				return ERROR_STATUS;
			number_of_printed_structures++;
		}

	if (number_of_printed_structures > 0 && par == SUCCESS_STATUS)
		errorflag = SUCCESS_STATUS;

	return errorflag;
}

void output_comparator(struct films *all_films, int *number_of_films, char *field, char *key, int *errorflag, int reading_error, int argc)
{
	if (reading_error == SUCCESS_STATUS && *number_of_films > 0 && get_number_of_films(all_films, *number_of_films) < MAX_NUMBER_OF_STRUCTURES)
	{
		if (argc == MAX_NUM_OF_ARGC)
		{
			if (search_field(all_films, *number_of_films, field, key, errorflag) == -1)
				output_not_found();
		}
		else if (argc == MIN_NUM_OF_ARGC && check_data(all_films, *number_of_films) == SUCCESS_STATUS)
			*errorflag = output_sorted_data(all_films, *number_of_films);
	}
	else
		*errorflag = ERROR_STATUS;
}

int output_sorted_data(struct films *all_films, int number_of_films)
{
	for (int i = 0; i < number_of_films; i++)
		if (strlen((all_films)[i].title) > 0 && strlen((all_films)[i].name) > 0 && strlen((all_films)[i].year) > 0)
			output_data((all_films)[i].title, (all_films)[i].name, (all_films)[i].year);

	return SUCCESS_STATUS;
}

void output_not_found()
{
	printf("Not found");
}
