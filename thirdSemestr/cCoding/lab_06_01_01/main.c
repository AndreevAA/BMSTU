#include <stdio.h>#include <string.h>#include <stdlib.h>#include "input.h"#include "output.h"#include "main.h"#include "operations.h"// Основная функция программыint main(int argc, char *argv[]){		// Флаг об ошибке	int errorflag = ERROR_STATUS;	// Параметры введены верно и файл существует	if (argc >= MIN_NUM_OF_ARGC && argc <= MAX_NUM_OF_ARGC)	{		// Флаг об открытие файла		FILE *operationfile = fopen(argv[1], "r");		// Файл с введенным названием существует		if (operationfile != NULL)		{			if (check_input_argv(argc, argv) == 0)			{				//films *all_films = NULL;				//all_films = (films*) malloc(MAX_SIZE * sizeof(films));				films all_films[MAX_SIZE];				for (int i = 0; i < MAX_SIZE; i++)				{					char max_word[MAX_SIZE];					all_films[i].title = max_word;					all_films[i].name = max_word;					all_films[i].year = max_word;				}				films test_films[MAX_SIZE];				char temp_title[MAX_SIZE], temp_name[MAX_SIZE], temp_year[MAX_SIZE];				int number_of_films = 0;				// while (scanf_input_data(temp_title, temp_name, temp_year, operationfile) == 0 && feof(operationfile) == 0)				// {									// 	input_data_transomation(temp_title, temp_name, temp_year);				// 	//dd_temp_film(&all_films, &number_of_films, temp_title, temp_name, temp_year);				// 	all_films[number_of_films].title = temp_title;				// 	all_films[number_of_films].name = temp_name;				// 	all_films[number_of_films].year = temp_year;				// 	number_of_films++;									// 	//output_sorted_data(all_films, number_of_films);				// 	insertionsort(all_films, number_of_films, argv[2]);				// }                printf("starting\n");				while (scanf_input_data(temp_title, temp_name, temp_year, operationfile) == 0 && feof(operationfile) == 0)				{										// (*all_films)[*number_of_films].title = (char*) malloc(strlen(temp_title) + 1);					// strcpy((*all_films)[*number_of_films].title, temp_title);					// (*all_films)[*number_of_films].name = (char*) malloc(strlen(temp_name) + 1);					// strcpy((*all_films)[*number_of_films].name, temp_name);					// (*all_films)[*number_of_films].year = (char*) malloc(strlen(temp_year) + 1);					// strcpy((*all_films)[*number_of_films].year, temp_year);					// *number_of_films += 1;					input_data_transomation(temp_title, temp_name, temp_year);					//add_temp_film(&all_films, &number_of_films, temp_title, temp_name, temp_year);                                        printf("temp_title: (%s), all_films (%s)\n", temp_title, all_films[number_of_films].title);										///(*all_films)[*number_of_films].title = (char*) malloc(strlen(temp_title) + 1);					char max_word_title[MAX_SIZE];					all_films[number_of_films].title = max_word_title;					strcpy( all_films[number_of_films].title, temp_title );                                        printf("all_films[%d]: %s\n", number_of_films, all_films[number_of_films].title);                                        //printf("%d | %d\n", (int) temp_title, (int) all_films[number_of_films].title);					char max_word_name[MAX_SIZE];					all_films[number_of_films].name = max_word_name;					strcpy( all_films[number_of_films].name, temp_name );					char max_word_year[MAX_SIZE];					all_films[number_of_films].title = max_word_year;					strcpy( all_films[number_of_films].year, temp_year );					// all_films[number_of_films].title = temp_title;					// all_films[number_of_films].name = temp_name;					// all_films[number_of_films].year = temp_year;					// all_films[number_of_films].title = test_films;					// all_films[number_of_films].name = test_films;					// all_films[number_of_films].year = test_films;					output_data(all_films[number_of_films].title, all_films[number_of_films].name, all_films[number_of_films].year);					number_of_films += 1;										//output_sorted_data(all_films, number_of_films);					//insertionsort(all_films, number_of_films, argv[2]);				}				// while (fscanf(operationfile, "%127s%127s%127s", temp_title, temp_name, temp_year) != EOF)				// {				// 	add_temp_film(&all_films, &number_of_films, temp_title, temp_name, temp_year);									// 	insertionsort(&all_films, number_of_films, argv[2]);				// }				// for (int i = 0; i < number_of_films; i++)				// {				// 	output_data(all_films[i].title, all_films[i].name, all_films[number_of_films].year);				// }				if (argc == MAX_NUM_OF_ARGC)				{					errorflag = search_field(all_films, number_of_films, argv[2], argv[3]);					errorflag = SUCCESS_STATUS;				}				else if (argc == MIN_NUM_OF_ARGC)				{					output_sorted_data(all_films, number_of_films);					errorflag = SUCCESS_STATUS;				}					//free(all_films);				//getchar();			}		}			fclose(operationfile);	}	return errorflag;}