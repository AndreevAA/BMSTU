#include <stdio.h>
#include <string.h>
#include "chekers.h"
#include "operations.h"
#define MAX_SIZE 256

void formanswer(char **stringrun, int stringrunsize, char **stringcheck, int stringchecksize, char **answer, int *numberofwords);
void output(char **string_firs_tanswer, int *string_first_words_number, char **string_second_answer, int *string_second_words_number);
void devidetransformedchar(char *stringtransformed, char **stringwords, int *stringwordssize, int *errorflag);
int checknumoffound(char **string, int stringsize, char *word);
void inputdata(char *stringfirst, char *stringsecond, int *errorflag);
void transformchar(char *string, char *stringwords);
void changespecialsymbols(char *string);

int main()
{
	// инициализация флага об ошибке
	int errorflag = 0;
	int string_first_words_size = 0;
	int string_second_words_size = 0;
	int string_first_words_number = 0;
	int string_second_words_number = 0;

	// инициализация введенных строк пользователем
	char stringfirst[MAX_SIZE + 1] = "";
	char stringsecond[MAX_SIZE + 1] = "";

	// инициализация преобразованныъ строк с разделителем
	char string_first_transformed[MAX_SIZE + 1] = "";
	char string_second_transformed[MAX_SIZE + 1] = "";

	// инициализация массивов найденных слов
	char *string_first_words[MAX_SIZE + 1];
	char *string_second_words[MAX_SIZE + 1];

	// инициализация массивов уникальных слов из двух строк
	char *string_firs_tanswer[MAX_SIZE + 1];
	char *string_second_answer[MAX_SIZE + 1];

	// ввод строк из консоли
	inputdata(stringfirst, stringsecond, &errorflag);

	if (errorflag == 0)
	{
		// трансформирование строк по разделителям
		transformchar(stringfirst, string_first_transformed);
		transformchar(stringsecond, string_second_transformed);

		// поиск в строках слов
		devidetransformedchar(string_first_transformed, string_first_words, &string_first_words_size, &errorflag);
		devidetransformedchar(string_second_transformed, string_second_words, &string_second_words_size, &errorflag);

		// формирование ответа по обоим массивам слов
		formanswer(string_first_words, string_first_words_size, string_second_words, string_second_words_size, string_firs_tanswer, &string_first_words_number);
		formanswer(string_second_words, string_second_words_size, string_first_words, string_first_words_size, string_second_answer, &string_second_words_number);
		
		// вывод ответа на экран
		if (string_first_words_number == 0 && string_second_words_number == 0)
			errorflag = 1;
		else if (string_first_words_number + string_second_words_number > 0 && errorflag == 0)
			output(string_firs_tanswer, &string_first_words_number, string_second_answer, &string_second_words_number);
		else
			errorflag = 1;
	}
	
	return errorflag;
}

// вывод ответа на экран
void output(char **string_firs_tanswer, int *string_first_words_number, char **string_second_answer, int *string_second_words_number)
{
	printf("Result:");
	for (int i = 0; i < *string_first_words_number; i++)
	{
		printf("%s ", *(string_firs_tanswer + i));
	}
	for (int i = 0; i < *string_second_words_number; i++)
	{
		printf("%s ", *(string_second_answer + i));
	}
}

// формирование ответа путем нахождения уникальных слов
void formanswer(char **stringrun, int stringrunsize, char **stringcheck, int stringchecksize, char **answer, int *numberofwords)
{	
	for (int i = 0; i < stringrunsize; i++)
	{
		if (strcmp(*(stringrun + i), "\n") != 0 && checknumoffound(stringrun, stringrunsize, *(stringrun + i)) == 1 && checknumoffound(stringcheck, stringchecksize, *(stringrun + i)) == 0)
		{
			*(answer + *numberofwords) = *(stringrun + i);
			*numberofwords += 1;
		}
	}
}

// ввод двух строк из консоли
void inputdata(char *stringfirst, char *stringsecond, int *errorflag)
{
	fgets(stringfirst, MAX_SIZE + 1, stdin);
	fgets(stringsecond, MAX_SIZE + 1, stdin);

	// Проверка на пустую строку
	if (strlen(stringfirst) == 1 || strlen(stringsecond) == 1 || strlen(stringfirst) > 256 || strlen(stringsecond) > 256)
		*errorflag = 1;
}
