#include <stdio.h>
#include <string.h>
#include "operations.h"
#include "chekers.h"
#define SEPARATOR_SYMBOL '/'

// замена всех знаков препинания и пробелов спецальным символом
void changespecialsymbols(char *string)
{
	for (int i = 0; i < strlen(string); i++)
	{
		if (isletter(*(string + i)) != 1)
			*(string + i) = SEPARATOR_SYMBOL;
	}
}

// разделение строки на слова
void transformchar(char *string, char *stringwords)
{
	int numofsymbols = 0;
	changespecialsymbols(string);
	for (int i = 0; i < strlen(string); i++)
	{
		if (numofsymbols > 1)
		{
			if (*(string + i) == SEPARATOR_SYMBOL && *(string + i - 1) != SEPARATOR_SYMBOL)
			{
				*(stringwords + numofsymbols) = SEPARATOR_SYMBOL;
				numofsymbols += 1;
			}
			else if (*(string + i) != SEPARATOR_SYMBOL)
			{
				*(stringwords + numofsymbols) = *(string + i);
				numofsymbols += 1;
			}
		}
		else
		{
			*(stringwords + numofsymbols) = *(string + i);
			numofsymbols += 1;
		}
	}
}
