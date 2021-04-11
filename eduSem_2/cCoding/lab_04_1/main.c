#include <stdio.h>
#include <stdlib.h>
#define MAX_SIZE 255

//  Поиск первого вхождения элемента в строку
char *my_strchr(char *str, char ch);

int main()
{
	int errorflag = 0;
	char string_1[MAX_SIZE + 1] = { 0 };

  	scanf("%255s", string_1);
	
	char search_char = '\0';
	printf("Enter char to search for: ");

	scanf("%c", &search_char);
	scanf("%c", &search_char);

	char *found_char = my_strchr(string_1, search_char); 
	if (found_char)
	{
		printf("Found on pos %ld \n", found_char - string_1);
		printf("Str from char: %s \n", found_char);
	}
	else
	{
		printf("Char not found \n");
		errorflag = 1;
	}
	return errorflag;
}

// Строковая функция strchr по поиску первого вхождения элемента в строку
char *my_strchr(char *str, char ch) 
{
	while (*str && *str != ch)
		str++;

	return *str == ch ? str : NULL;
}
