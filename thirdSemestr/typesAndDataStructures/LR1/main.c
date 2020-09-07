#define MAX_NUMBERS 30
#define ERROR_STATUS 1
#define SUCCESS_STATUS 0
#define NUMBER_OF_MULTIPLIERS 2

#include <stdio.h>
#include <string.h>

// Струтура числа
typedef struct number {
    char sign;			// Знак числа '-'/'+'
	char free_symbols[MAX_NUMBERS]; // Число свободное от знаков кроме цифр
	int number_order;   // Порядок числа -> Количество знаков до точки от конца
} number;

char get_sign(char *temp_number)
{
	if (temp_number[0] == '-')
		return temp_number[0];
	return '+';
}

void get_free_symbols(char *temp_number, char * result_free_symbols)
{
	int add_cursor = 0;

	for (int check_cursur = 0; check_cursur < strlen(temp_number); check_cursur++)
	{
		if ('0' <= temp_number[check_cursur] && temp_number[check_cursur] <= '9')
		{
			result_free_symbols[add_cursor] = temp_number[check_cursur];
			add_cursor++;
		}
	}
}

int get_number_order()
{
	
}

int scanf_numbers(number* first_number, number* second_number)
{	
	printf("HERE1\n");
	int error_flag = ERROR_STATUS;

	char temp_first_number[MAX_NUMBERS], temp_second_number[MAX_NUMBERS];

	// Введите целое число:
	// Введите вещественное число:
	if (scanf("%s\n%s", temp_first_number, temp_second_number) == NUMBER_OF_MULTIPLIERS)
	{
		//printf("%s\n%s\n", temp_first_number, temp_second_number);
		(*first_number).sign = get_sign(temp_first_number);
		get_free_symbols(temp_first_number, (*first_number).free_symbols);
		// (*first_number).number_order = get_number_order();

		// (*second_number).sign = get_sign(temp_second_number);
		// (*second_number).free_symbols = get_free_symbols(temp_second_number);
		// (*second_number).number_order = get_number_order(temp_second_number);

		error_flag = SUCCESS_STATUS;
	}

	return error_flag;
}

int main()
{
	int error_flag = ERROR_STATUS;

	number first_number;
	number second_number;

	if (scanf_numbers(&first_number, &second_number) == SUCCESS_STATUS)
	{
		printf("first_number:\n\tsign: %c\n\tfree_symbols: %s\n", first_number.sign, first_number.free_symbols);
		error_flag = SUCCESS_STATUS;
	}

	return error_flag;
}