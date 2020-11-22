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
#include "../inc/output.h"

<<<<<<< HEAD
void output_data(char *title, char *name, char *year)
{
	printf("%s\n%s\n%d\n", title, name, char_to_int_number(year));
=======
int get_size(char *filename)
{
	int answer = 0;
	FILE *inputfile = fopen(filename, "r");
	if (inputfile != NULL)
	{
		while (feof(inputfile) == 0)
		{
			char temp_title[MAX_SIZE_TITLE], temp_name[MAX_SIZE_NAME], temp_year[MAX_SIZE_YEAR];
			if (scanf_input_data(temp_title, temp_name, temp_year, inputfile) == 0)
			{
				answer++;
			}
		}
	}

	fclose(inputfile);
	return answer;
}

void free_struct(struct films *all_films, int number)
{
	for (int i = 0; i < number; i++)
	{
		free(all_films[i].title);
		free(all_films[i].name);
		free(all_films[i].year);
	}
	free(all_films);
}


void output_data(char *text, int size)
{
	for (int i = 0; i < size; i++)
	{
		printf("%c", text[i]);
	}
	printf("\n");
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
}

int check_data(struct films *all_films, int number_of_films)
{
	int errorflag = ERROR_STATUS, par = SUCCESS_STATUS;

	int number_of_printed_structures = 0;

	for (int i = 0; i < number_of_films; i++)
<<<<<<< HEAD
		if (strlen((all_films)[i].title) > 0 && strlen((all_films)[i].name) > 0 && strlen((all_films)[i].year) > 0)
		{
			if (check_input_film(all_films[i].title, all_films[i].name, all_films[i].year) == ERROR_STATUS)
				return ERROR_STATUS;
=======
		if ((all_films)[i].title_size > 0 && (all_films)[i].name_size > 0 && (all_films)[i].year_size > 0)
		{
			// if (check_input_film(all_films[i]) == ERROR_STATUS)
			// 	return ERROR_STATUS;
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
			number_of_printed_structures++;
		}

	if (number_of_printed_structures > 0 && par == SUCCESS_STATUS)
		errorflag = SUCCESS_STATUS;

	return errorflag;
}

int output_sorted_data(struct films *all_films, int number_of_films)
{
	for (int i = 0; i < number_of_films; i++)
<<<<<<< HEAD
		if (strlen((all_films)[i].title) > 0 && strlen((all_films)[i].name) > 0 && strlen((all_films)[i].year) > 0)
			output_data((all_films)[i].title, (all_films)[i].name, (all_films)[i].year);

=======
	{
		if ((all_films)[i].title_size > 0 && (all_films)[i].name_size > 0 && (all_films)[i].year_size > 0)
		{	
			output_data((all_films)[i].title, (all_films)[i].title_size);
			output_data((all_films)[i].name, (all_films)[i].name_size);
			output_data((all_films)[i].year, (all_films)[i].year_size);
		}
	}
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
	return SUCCESS_STATUS;
}

void output_not_found()
{
	printf("Not found");
}
