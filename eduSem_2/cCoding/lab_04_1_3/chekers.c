#include <stdio.h>
#include <string.h>
#include "chekers.h"
#define MAX_SIZE_WORD 16
#define SEPARATOR_ARRAY "/"

char special_symbols[] = { ',', ':', '-', '.', '!', '?', ';', ' ', '\n' };

// проверка символа на букву
int isletter(char letter)
{
	int answer = 1;
	for (int i = 0; i < strlen(special_symbols); i++)
	{
		if (*(special_symbols + i) == letter)
		{
			answer = 0;
		}
	}
	return answer;
}

// Разделение строки по поеределенному символу
char *my_strtok(char *temp_string, const char *temp_sep)
{
	static char *last_string = 0;

	if (temp_string) 
		last_string = temp_string;

	if ((last_string == 0) || (*last_string == 0)) 
		return 0;

	char *counter_parametr = last_string;

	while (strchr(temp_sep, *counter_parametr)) 
		counter_parametr++;

	if (*counter_parametr == 0) 
		return 0;

	char *start = counter_parametr;

	while (*counter_parametr && (strchr(temp_sep, *counter_parametr) == 0)) 
		counter_parametr++;

	if (*counter_parametr == 0)
	{
		last_string = counter_parametr;
		return start;
	}

	*counter_parametr = 0;
	last_string = counter_parametr + 1;

	return start;
}

// поиск в строках слов
void devidetransformedchar(char *stringtransformed, char **stringwords, int *stringwordssize, int *errorflag)
{
	char *stringtempwords;

	stringtempwords = my_strtok(stringtransformed, SEPARATOR_ARRAY);
	
	//выделение последующих частей
	while (stringtempwords != NULL)
	{
		// Проверка длины слова
		if (strlen(stringtempwords) > MAX_SIZE_WORD)
		{
			*errorflag = 1;
		}

		// добавление очередной выделенной части
		*(stringwords + *stringwordssize) = stringtempwords;

		*stringwordssize += 1;

		stringtempwords = my_strtok(NULL, SEPARATOR_ARRAY);
	}
}
