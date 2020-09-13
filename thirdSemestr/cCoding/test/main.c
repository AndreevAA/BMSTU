#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int read_string(char* temp_string, FILE *operationfile)
{
	if (fgets (temp_string, 30, operationfile) != NULL)
	{
		return 0;
	}
	return 1;
}

int scanf_input_data(char* temp_title, char* temp_name, char* temp_year, FILE *operationfile)
{
	if (read_string(temp_title, operationfile) == 0 && read_string(temp_name, operationfile) == 0 && read_string(temp_year, operationfile) == 0)
	{
		return 0;
	}
	return 1;
}

typedef struct films {
  char title[30];
  char name[30];
  char year[30];
} films;

// Основная функция программы
int main(int argc, char *argv[])
{	

	// Флаг об ошибке
	int errorflag = 1;

	// Параметры введены верно и файл существует
	if (argc >= 3 && argc <= 4)
	{



		films all_films[30];
		for (int i = 0; i < 30; i++)
		{
			*all_films[i].title = '\0';
			*all_films[i].name = '\0';
			*all_films[i].year = '\0';
		}

		// Флаг об открытие файла
		FILE *operationfile = fopen(argv[1], "r");

		// Файл с введенным названием существует
		if (operationfile != NULL)
		{

			char temp_title[30], temp_name[30], temp_year[30];

			int number_of_films = 0;



			while (scanf_input_data(temp_title, temp_name, temp_year, operationfile) == 0  && feof(operationfile) == 0)
			{
				// char max_word_title[30];

				printf("KAKA1\n");

				//all_films[number_of_films].title = max_word_title;
				//strcpy( all_films[number_of_films].title, temp_title );


				//printf("%s\n", all_films[number_of_films].title);

				for (int i = 0; i < 30; i++)
				{

					all_films[number_of_films].title[i] = temp_title[i];
				}

				//printf("%s\n", all_films[number_of_films].title);

				// char max_word_name[30];

				// all_films[number_of_films].name = max_word_name;
				//strcpy( all_films[number_of_films].name, temp_name );

				// char max_word_year[30];

				// all_films[number_of_films].year = max_word_year;
				//strcpy( all_films[number_of_films].year, temp_year );

				number_of_films += 1;
			}

			for (int i = 0; i < number_of_films; i++)
			{
				printf("%s%s%s\n", all_films[i].title, all_films[i].name, all_films[i].year);
			}
		}

		fclose(operationfile);

	}

	return errorflag;
}
