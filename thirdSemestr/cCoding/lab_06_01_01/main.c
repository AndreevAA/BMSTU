/*!\file\brief Основной файл программы\author    "Андреев Александр"\version   12\date      6 сентября 2020*/#include <stdio.h>#include <string.h>#include <stdlib.h>#include "input.h"#include "output.h"#include "operations.h"#include "functions.h"// Основная функция программыint main(int argc, char *argv[]){		// Флаг об ошибке	int errorflag = ERROR_STATUS;	// Параметры введены верно и файл существует	if (check_input_argv(argc, argv) == SUCCESS_STATUS)	{		// Флаг об открытие файла		FILE *operationfile = fopen(argv[1], "r");		// Файл с введенным названием существует		if (operationfile != NULL)		{				films all_films[MAX_NUMBER];			fill_struct(all_films);			int number_of_films = 0;			int reading_error = input_data(operationfile, all_films, &number_of_films, argv[2]);			insertionsort(all_films, number_of_films, argv[2]);			output_comparator(all_films, &number_of_films, argv[2], argv[3], &errorflag, reading_error, argc);		}		}	return errorflag;}