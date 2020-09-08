#define MAX_NUMBERS 30
#define ERROR_STATUS 1
#define SUCCESS_STATUS 0
#define NUMBER_OF_MULTIPLIERS 2

#include <stdio.h>
#include <string.h>

// Струтура числа
typedef struct number {
    char mantisa_sign;			// Знак числа '-'/'+'
	char mantisa[MAX_NUMBERS]; // Число свободное от знаков кроме цифр

	char order_sign;
	char order[MAX_NUMBERS];
} number;

char get_mantisa_sign(char *temp_number)
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

int get_mantisa(char *temp_number, char * result_number_mantisa)
{
	int add_cursor = 0, check_cursur = 0;

	while (check_cursur < strlen(temp_number) && temp_number[check_cursur] != 'E')
	{	

		if (temp_number[check_cursur] != '-' && temp_number[check_cursur] != '+')
		{
			result_number_mantisa[add_cursor] = temp_number[check_cursur];
			printf("%c\n", temp_number[check_cursur]);
			add_cursor++;
		}

		check_cursur++;
	}

	return check_cursur;
}

char get_order_sign(char *temp_number, int temp_number_E_position)
{
	if (temp_number_E_position + 1 < strlen(temp_number))
		if (temp_number[temp_number_E_position + 1] == '-')
			return temp_number[temp_number_E_position + 1];

	return '+';
}

void get_order(char *temp_number, int temp_number_E_position, char * result_order)
{

	int add_cursor = 0;

	if (temp_number_E_position + 2 < strlen(temp_number))

		for (int check_cursur = temp_number_E_position + 2; check_cursur < strlen(temp_number); check_cursur++)
		{
			result_order[add_cursor] = temp_number[check_cursur];

			add_cursor++;
		}
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
		(*first_number).mantisa_sign = get_mantisa_sign(temp_first_number);
		
		int first_number_E_position = get_mantisa(temp_first_number, (*first_number).mantisa);

		// Получение знака числа
		(*second_number).mantisa_sign = get_mantisa_sign(temp_second_number);

		// Получение мантисы
		int second_number_E_position = get_mantisa(temp_second_number, (*second_number).mantisa);

		// Получение знака порядка
		(*second_number).order_sign = get_order_sign(temp_second_number, second_number_E_position);

		// Получение порядка
		get_order(temp_second_number, second_number_E_position, (*second_number).order);

		error_flag = SUCCESS_STATUS;
	}

	return error_flag;
}

// int multiply_numbers(char * first_number, char * second_number, char * answer_number)
// {

// }

int contain_point(char * temp_mantisa, int * mantisa_order)
{
	int contain_point_status = ERROR_STATUS;

	char new_mantisa[MAX_NUMBERS];

	int add_cursor = 0, check_cursur = 0;

	while (check_cursur != strlen(temp_mantisa) - 1)
	{
		if (temp_mantisa[check_cursur] == '.')
		{
			*mantisa_order = check_cursur - (strlen(temp_mantisa) - 1);
			contain_point_status = SUCCESS_STATUS;
			add_cursor += 0;
		}

		else if (temp_mantisa[check_cursur] != '.')
		{
			new_mantisa[add_cursor] = temp_mantisa[check_cursur];
			add_cursor++;
		}

		check_cursur++;
	}

	printf("\n%s\n", new_mantisa);

	*temp_mantisa = *new_mantisa;

	return contain_point_status;
}

void transform_mantisa(number* temp_number)
{
	int mantisa_order = 0;

	if (contain_point((*temp_number).mantisa, &mantisa_order) == SUCCESS_STATUS)
	{
		printf("\nHERE2\n");
		printf("\n%s, %d\n", (*temp_number).mantisa, mantisa_order);
	}
}

void get_composition(number* first_number, number* second_number, number* answer_number)
{
	transform_mantisa(second_number);
}

int main()
{
	int error_flag = ERROR_STATUS;

	number first_number;
	number second_number;
	number answer_number;

	if (scanf_numbers(&first_number, &second_number) == SUCCESS_STATUS)
	{
		printf("first_number:\nsign: %c; mantisa: %s; order_sign: %c; order_order: %s", first_number.mantisa_sign, first_number.mantisa, first_number.order_sign, first_number.order);

		printf("second_number:\nsign: %c; mantisa: %s; order_sign: %c; order_order: %s", second_number.mantisa_sign, second_number.mantisa, second_number.order_sign, second_number.order);
		
		get_composition(&first_number, &second_number, &answer_number);

		error_flag = SUCCESS_STATUS;
	}

	return error_flag;
}
