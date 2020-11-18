/*!
\file
\brief Файл со сравнительными функциями
\author    "Андреев Александр"
\version   2
\date      9 сентября 2020
 
Данный файл содержит в себе тело функций,
производящих сравнение сроковых данных и 
вынесенные декомпозировнные модули из бин-поиска
для оптимизации прочтения. 
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "../inc/comparation.h"

// Сравнение двух фильмов на предмет алфавитности
int compare_elems(films one_film, films second_film, char *key_to_compare)
{	
	if (strcmp(key_to_compare, "title") == 0)
		return (strcmp(one_film.title, second_film.title));
	else if (strcmp(key_to_compare, "name") == 0)
		return (strcmp(one_film.name, second_film.name));
	else
		return (strcmp(one_film.year, second_film.year));
}

// Вынесенная функция бинпоиска по сравнению поля <title>
int strcmp_title(char *key, films *all_films, int middle_position, int *left_border, int *right_border, int *search_index)
{
	int break_status = ERROR_STATUS;

	if (strcmp(key, all_films[middle_position].title) == 0)
	{
		*search_index = middle_position;
		output_data((all_films)[middle_position].title, (all_films)[middle_position].name, (all_films)[middle_position].year);
		
		break_status = SUCCESS_STATUS;
	}

	// Сдвиг правой границы
	if (strcmp(key, all_films[middle_position].title) < 0)
		*right_border = middle_position - 1;

	// Сдвиг левой границы
	else
		*left_border = middle_position + 1;

	return break_status;
}

// Вынесенная функция бинпоиска по сравнению поля <name>
int strcmp_name(char *key, films *all_films, int middle_position, int *left_border, int *right_border, int *search_index)
{
	int break_status = ERROR_STATUS;

	if (strcmp(key, all_films[middle_position].name) == 0)
	{
		*search_index = middle_position;
		output_data((all_films)[middle_position].title, (all_films)[middle_position].name, (all_films)[middle_position].year);
		
		break_status = SUCCESS_STATUS;
	}

	// Сдвиг правой границы
	if (strcmp(key, all_films[middle_position].name) < 0)
		*right_border = middle_position - 1;

	// Сдвиг левой границы
	else
		*left_border = middle_position + 1;

	return break_status;
}

// Вынесенная функция бинпоиска по сравнению поля <name>
int strcmp_year(char *key, films *all_films, int middle_position, int *left_border, int *right_border, int *search_index)
{
	int break_status = ERROR_STATUS;

	if (strcmp(key, all_films[middle_position].year) == 0)
	{
		*search_index = middle_position;
		output_data((all_films)[middle_position].title, (all_films)[middle_position].name, (all_films)[middle_position].year);
		
		break_status = SUCCESS_STATUS;
	}

	// Сдвиг правой границы
	if (strcmp(key, all_films[middle_position].year) < 0)
		*right_border = middle_position - 1;
	
	// Сдвиг левой границы
	else
		*left_border = middle_position + 1;

	return break_status;
}
