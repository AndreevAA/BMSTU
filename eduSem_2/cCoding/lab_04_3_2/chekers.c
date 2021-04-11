#include <stdio.h>
#include <string.h>
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

char *mystrchr(const char *s, const char c)
{
	while (*s && *s != c)
		++s;
	return (*s) ? (char*) s : NULL;
}
 
char *mystrtok(char *str, const char *delim)
{
	static char *next;

	if (str)
	{
		next = str;
		while (*next && mystrchr(delim, *next))
			*next++ = '\0';
	}

	if (!*next)
		return NULL;

	str = next;

	while (*next && ! mystrchr(delim, *next))
		++next;
	while (*next && mystrchr(delim, *next))
		*next++ = '\0';

	return str;
}

// проверка количества нахождений
int checknumoffound(char **string, int stringsize, char *word)
{
	int answer = 0;
	for (int i = 0; i < stringsize; i++)
	{
		if (strcmp(*(string + i), word) == 0)
		{
			answer += 1;
		}
	}
	return answer;
}

// поиск в строках слов
void devidetransformedchar(char *stringtransformed, char **stringwords, int *stringwordssize, int *errorflag)
{
	char *stringtempwords;

	stringtempwords = mystrtok(stringtransformed, SEPARATOR_ARRAY);
	
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

		stringtempwords = mystrtok(NULL, SEPARATOR_ARRAY);
	}
}
