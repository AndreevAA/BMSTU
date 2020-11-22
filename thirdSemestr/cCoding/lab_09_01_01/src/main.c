<<<<<<< HEAD
/*!\file\brief Основной файл программы\author    "Андреев Александр"\version   12\date      6 сентября 2020*/#include <stdio.h>#include <string.h>#include <stdlib.h>#include "../inc/input.h"#include "../inc/output.h"#include "../inc/operations.h"#include "../inc/functions.h"// Основная функция программыint main(int argc, char *argv[]){		// Флаг об ошибке	int errorflag = ERROR_STATUS;	// Параметры введены верно и файл существует	if (check_input_argv(argc, argv) == SUCCESS_STATUS)	{		// Флаг об открытие файла		FILE *operationfile = fopen(argv[1], "r");		// Файл с введенным названием существует		if (operationfile != NULL)		{							films all_films[MAX_NUMBER];			// Заполнение структуры			fill_struct(all_films);			char temp_title[MAX_SIZE], temp_name[MAX_SIZE], temp_year[MAX_SIZE];			int number_of_films = 0, reading_error = SUCCESS_STATUS;			while (feof(operationfile) == 0)			{								// Построчное считывание файла				if (scanf_input_data(temp_title, temp_name, temp_year, operationfile) == 0)				{					// Трансформация считанной строки					input_data_transomation(temp_title, temp_name, temp_year);					// Проверка вошедшего фильма по его параметрам					if (check_input_film(temp_title, temp_name, temp_year) == ERROR_STATUS)					{						fclose(operationfile);						return ERROR_STATUS;					}					// Добавление фильма в массив структур					add_temp_film(all_films, &number_of_films, temp_title, temp_name, temp_year);					number_of_films++;										// Сортировка вставкой фильма по ключу					insertionsort(all_films, number_of_films, argv[2]);				}							}			fclose(operationfile);			if (reading_error == SUCCESS_STATUS && number_of_films > 0 && get_number_of_films(all_films, number_of_films) < MAX_NUMBER_OF_STRUCTURES)			{				if (argc == MAX_NUM_OF_ARGC)				{					if (search_field(all_films, number_of_films, argv[2], argv[3], &errorflag) == -1)						output_not_found();				}				else if (argc == MIN_NUM_OF_ARGC && check_data(all_films, number_of_films) == SUCCESS_STATUS)					errorflag = output_sorted_data(all_films, number_of_films);			}			else				errorflag = ERROR_STATUS;		}		}	return errorflag;}
=======
/*!\file\brief Основной файл программы\author    "Андреев Александр"\version   12\date      6 сентября 2020*/#include <stdio.h>#include <string.h>#include <stdlib.h>#include "../inc/input.h"#include "../inc/output.h"#include "../inc/operations.h"#include "../inc/functions.h"// Основная функция программыint main(int argc, char *argv[]){		// Флаг об ошибке	int errorflag = ERROR_STATUS;	// Параметры введены верно и файл существует	if (check_input_argv(argc, argv) == SUCCESS_STATUS)	{		// Флаг об открытие файла		FILE *operationfile = fopen(argv[1], "r");		// Файл с введенным названием существует		if (operationfile != NULL)		{							films *all_films = malloc(sizeof(films) * MAX_NUMBER_OF_STRUCTURES);			// Заполнение структуры			int number_of_films = 0, reading_error = SUCCESS_STATUS;			while (feof(operationfile) == 0)			{				char temp_title[MAX_SIZE_TITLE], temp_name[MAX_SIZE_NAME], temp_year[MAX_SIZE_YEAR];				// Построчное считывание файла				if (scanf_input_data(temp_title, temp_name, temp_year, operationfile) == 0)				{					// Трансформация считанной строки					input_data_transomation(temp_title, temp_name, temp_year);					// Проверка вошедшего фильма по его параметрам					if (check_input_film(temp_title, temp_name, temp_year) == ERROR_STATUS)					{						free_struct(all_films, number_of_films);						fclose(operationfile);						return ERROR_STATUS;					}					// Добавление фильма в массив структур					add_temp_film(all_films, &number_of_films, temp_title, temp_name, temp_year);					number_of_films++;										// Сортировка вставкой фильма по ключу					insertionsort(all_films, number_of_films, argv[2]);				}			}			fclose(operationfile);			if (reading_error == SUCCESS_STATUS && number_of_films > 0 && get_number_of_films(all_films, number_of_films) <= MAX_NUMBER_OF_STRUCTURES)			{				if (argc == MAX_NUM_OF_ARGC)				{					if (search_field(all_films, number_of_films, argv[2], argv[3], &errorflag) == -1)						output_not_found();					free_struct(all_films, number_of_films);				}								else if (argc == MIN_NUM_OF_ARGC && check_data(all_films, number_of_films) == SUCCESS_STATUS)				{					errorflag = output_sorted_data(all_films, number_of_films);					free_struct(all_films, number_of_films);				}				else					free_struct(all_films, number_of_films);			}			else			{				free_struct(all_films, number_of_films);				errorflag = ERROR_STATUS;			}		}		}	return errorflag;}
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
