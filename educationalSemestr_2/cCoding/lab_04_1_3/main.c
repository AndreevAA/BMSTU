#include <stdio.h>
#include <string.h>
#include "chekers.h"
#include "operations.h"
#define MAX_SIZE 256
#define MAX_STRING_LENGTH 5000

void output(char *stringfirstanswer);
void devidetransformedchar(char *stringtransformed, char **stringwords, int *stringwordssize, int *errorflag);
int checknumoffound(char **string, int stringsize, char *word);
void inputdata(char *stringfirst, int *errorflag);
void transformchar(char *string, char *stringwords);
void changespecialsymbols(char *string);
void createanswer(char **stringfirstwords, int *stringfirstwordssize, char *stringfirstanswer, int *errorflag, int *stringfirstanswersize);

int main()
{
	// инициализация флага об ошибке
	int errorflag = 0;
	int stringfirstwordssize = 0;
	int stringfirstanswersize = 0;

	// инициализация введенных строк пользователем
	char stringfirst[MAX_SIZE + 1] = "";

	// инициализация преобразованныъ строк с разделителем
	char stringfirsttransformed[MAX_SIZE + 1] = "";

	// инициализация массива найденных слов
	char *stringfirstwords[MAX_SIZE + 1];

	// инициализация массива уникальных слов из двух строк
	char stringfirstanswer[MAX_SIZE + 1] = "";

	// ввод строк из консоли
	inputdata(stringfirst, &errorflag);

	if (errorflag == 0)
	{
		// трансформирование строк по разделителям
		transformchar(stringfirst, stringfirsttransformed);

		// поиск в строках слов
		devidetransformedchar(stringfirsttransformed, stringfirstwords, &stringfirstwordssize, &errorflag);

		if (errorflag == 0)
		{
			// Формирование ответа
			createanswer(stringfirstwords, &stringfirstwordssize, stringfirstanswer, &errorflag, &stringfirstanswersize);
			
			if (stringfirstanswersize >= 1)
			{
				// Вывод ответа на экран
				output(stringfirstanswer);
			}
			else
			{
				errorflag = 1;
			}
		}
	}

	return errorflag;
}

// проверка буквы на повторное вхождение в слово
int checkmetting(char *meetedletters, char letter)
{
	int answer = 0;
	for (int i = 0; i < strlen(meetedletters); i++)
	{
		if (*(meetedletters + i) == letter)
		{
			answer = 1;
		}
	}

	return answer;
}

// создание слов по буквам
void createwordwithletters(char *word, char *stringfirstanswer, int *stringfirstanswersize)
{
	char meetedletters[MAX_SIZE + 1] = "";
	int meetedletterssize = 0;
	for (int i = 0; i < strlen(word); i++)
	{
		if (checkmetting(meetedletters, *(word + i)) == 0)
		{
			*(stringfirstanswer + *stringfirstanswersize) = *(word + i);
			*stringfirstanswersize += 1;
			*(meetedletters + meetedletterssize) = *(word + i);
			meetedletterssize += 1;
		} 
	}
}

// формирование итоговой строки, состоящей из первых вхлждений букв
void createanswer(char **stringfirstwords, int *stringfirstwordssize, char *stringfirstanswer, int *errorflag, int *stringfirstanswersize)
{
	int i = *stringfirstwordssize - 1;
	while (i != -1)
	{
		if (strcmp(*(stringfirstwords + *stringfirstwordssize - 1), *(stringfirstwords + i)) != 0)
		{
			createwordwithletters(*(stringfirstwords + i), stringfirstanswer, &*stringfirstanswersize);
			*(stringfirstanswer + *stringfirstanswersize) = ' ';
			*stringfirstanswersize += 1;
		}
		i -= 1;
	}
}

// вывод ответа на экран
void output(char *stringfirstanswer)
{
	printf("Result: %s\n", stringfirstanswer);
}

// ввод двух строк из консоли
void inputdata(char *stringfirst, int *errorflag)
{
	fgets(stringfirst, MAX_STRING_LENGTH, stdin);

	// Проверка строки строку
	if (strlen(stringfirst) == 1 || strlen(stringfirst) > MAX_SIZE)
		*errorflag = 1;
}

