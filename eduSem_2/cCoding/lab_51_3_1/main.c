#include <stdio.h>
#include <string.h>
#include "process.h"
#define MAX_STRING_SIZE 256
#define SEPARATOR_ARRAY " "
#define ERRORFLAG_BAD -1;
#define ERRORFLAG_GOOD 0

int main()
{
	char first_string[MAX_STRING_SIZE + 1] = "";
	int answer = 0;
	int errorflag = process(first_string, &answer);
	if (errorflag == ERRORFLAG_GOOD)
		printf("%d\n", answer);
	return errorflag;
}
