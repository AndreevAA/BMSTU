#include <stdio.h>
#include <string.h>
#include "process.h"
#define MAX_STRING_SIZE 256
#define SEPARATOR_ARRAY " "
#define ERRORFLAG_BAD -1;
#define ERRORFLAG_GOOD 0

int process(char *first_string, int *answer)
{
	int errorflag = ERRORFLAG_GOOD;
	int previous_symbol = 0;

	fgets(first_string, MAX_STRING_SIZE + 1, stdin);

	if (strlen(first_string) > 1)
	{
		char *stringtempwords;

		stringtempwords = strtok(first_string, SEPARATOR_ARRAY);

		if (strlen(stringtempwords) >= 1)
		{
			if (*(stringtempwords + 0) == '-')
			{
				previous_symbol = 1;
			}
		}
		//выделение последующих частей
		while (stringtempwords != NULL)
		{
			// добавление очередной выделенной части
			if (strlen(stringtempwords) >= 1)
			{
				if (previous_symbol == 0 && *stringtempwords == '-')
				{
					*answer += 1;
					previous_symbol = 1;
				}
				else if (previous_symbol == 1 && *stringtempwords != '-')
				{
					*answer += 1;
					previous_symbol = 0;
				}
			}
			stringtempwords = strtok(NULL, SEPARATOR_ARRAY);
		}
	}
	else
	{
		errorflag = ERRORFLAG_BAD;
	}
	
	return errorflag;
}
