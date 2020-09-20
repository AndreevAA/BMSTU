#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "input.h"
#include "output.h"

int is_data_right(char *data);
void delete_enter(char *temp_text);

void delete_enter(char *temp_text)
{
	if (temp_text[strlen(temp_text) - 1] == '\n')
		temp_text[strlen(temp_text) - 1] = '\0';
}

void input_data_transomation(char *temp_title, char *temp_name, char *temp_year)
{
	delete_enter(temp_title);
	delete_enter(temp_name);
	delete_enter(temp_year);
}

int read_string(char *temp_string, FILE *operationfile)
{
	if (fgets(temp_string, MAX_SIZE, operationfile) != NULL)
		return SUCCESS_STATUS;
		
	return ERROR_STATUS;
}

int scanf_input_data(char *temp_title, char *temp_name, char *temp_year, FILE *operationfile)
{
	if (feof(operationfile) == 0)
		if (read_string(temp_title, operationfile) == SUCCESS_STATUS && read_string(temp_name, operationfile) == SUCCESS_STATUS && read_string(temp_year, operationfile) == SUCCESS_STATUS)
			return SUCCESS_STATUS;

	return ERROR_STATUS;
}

int get_number_of_films(struct films *all_films, int number_of_films)
{
	int temp_number_of_films = 0;

	for (int i = 0; i < number_of_films; i++)
		if (strlen((all_films)[i].title) > 0 && strlen((all_films)[i].name) > 0 && strlen((all_films)[i].year) > 0)
			temp_number_of_films++;

	return temp_number_of_films;
}

int is_data_right(char *data)
{
	int input_error_status = SUCCESS_STATUS;

	for (int i = 0; i < strlen(data); i++)
		if (data[i] > '9' || '0' > data[i])
		{
			input_error_status = ERROR_STATUS;
			break;
		}

	if (data[0] == '0')
		input_error_status = ERROR_STATUS;

	if (input_error_status == SUCCESS_STATUS)
		if (atoi(data) > 2020 || atoi(data) <= 0)
			input_error_status = ERROR_STATUS;

	return input_error_status;
}

int is_only_string(char *text)
{
	for (int i = 0; i < strlen(text); i++)
		if ('0' <= text[i] && text[i] <= '9')
			return ERROR_STATUS;

	return SUCCESS_STATUS;
}

int check_input_argv(int argc, char *argv[])
{
	int input_error_status = ERROR_STATUS;

	if (argc >= MIN_NUM_OF_ARGC && argc <= MAX_NUM_OF_ARGC)
	{
		if (strcmp(argv[2], "year") == SUCCESS_STATUS)
		{
			if (argc == MAX_NUM_OF_ARGC && is_data_right(argv[3]) == SUCCESS_STATUS)
				input_error_status = SUCCESS_STATUS;
			else if (argc == MIN_NUM_OF_ARGC)
				input_error_status = SUCCESS_STATUS;
		}
		else if (strcmp(argv[2], "title") == SUCCESS_STATUS || strcmp(argv[2], "name") == SUCCESS_STATUS)
		{
			if (argc == MAX_NUM_OF_ARGC && strlen(argv[3]) <= 25 && is_only_string(argv[3]) == SUCCESS_STATUS)
			{
				input_error_status = SUCCESS_STATUS;
			}
			else if (argc == MIN_NUM_OF_ARGC)
			{
				input_error_status = SUCCESS_STATUS;
			}
		}
	}

	return input_error_status;
}

int check_input_film(char *temp_title, char *temp_name, char *temp_year)
{
	int error_flag = SUCCESS_STATUS;

	if (strlen(temp_name) > 25 || strlen(temp_title) > 25 || is_data_right(temp_year) == ERROR_STATUS || strlen(temp_name) == 0 || strlen(temp_title) == 0 || strlen(temp_year) == 0)
		error_flag = ERROR_STATUS;
	if (temp_title[0] == '\n' || temp_name[0] == '\n' || temp_year[0] == '\n')
		error_flag = ERROR_STATUS;
	if (is_only_string(temp_title) == ERROR_STATUS || is_only_string(temp_name) == ERROR_STATUS)
		error_flag = ERROR_STATUS;

	return error_flag;
}

int num_of_structures(struct films *all_films, int number_of_films)
{
	int answer = 0;

	for (int i = 0; i < number_of_films; i++)
		if (strlen((all_films)[i].title) > 0 && strlen(all_films[i].name))
			answer++;

	return answer;
}
