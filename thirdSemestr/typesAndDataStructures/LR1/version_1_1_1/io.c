#include "io.h"

int is_float_number_ok(char *temp_number);
int is_integer_number_ok(char *temp_number);
int is_right_order(number *answer_number);

int represent_integer_number_in_expanded_form(char *temp_first_number, number *first_number);
int represent_float_number_in_expanded_form(char *temp_second_number, number *second_number);

int get_number_of_decimal(number *second_number);

char get_order_sign(char *temp_number, int temp_number_E_position);

void get_order(char *temp_number, int temp_number_E_position, number *second_number);


void output_welcome_text()
{
	printf("Программа вычисления произведения целого и вещественного чисел, представленных в формате +-N и +-m.nE+-K, запущена.\n");
}

void output_error_text_limit()
{
	printf("Порядок произведения превышен. Исправьте и повторите попытку.\n");
}

void output_metric_line()
{
	printf("+1~~~~~~~~~11~~~~~~~~21~~~~~~~30\n");
}

void output_multiplied_result(char mantisa_sign, char *mantisa, char order_sign, int order)
{
	printf("Произведение введенного целого и вещественных чисел: %c%sE%c%d\n", mantisa_sign, mantisa, order_sign, order);
}

int scanf_input_numbers(number *first_number, number *second_number)
{	
	int error_flag = ERROR_STATUS;

	char temp_first_number[MAX_NUMBERS], temp_second_number[MAX_NUMBERS];

	output_metric_line();

	if (scanf("%s\n%s", temp_first_number, temp_second_number) == NUMBER_OF_MULTIPLIERS)
	{
		if (is_integer_number_ok(temp_first_number) == SUCCESS_STATUS && is_float_number_ok(temp_second_number) == SUCCESS_STATUS)
		{
			if (represent_integer_number_in_expanded_form(temp_first_number, first_number) == SUCCESS_STATUS && represent_float_number_in_expanded_form(temp_second_number, second_number) == SUCCESS_STATUS)
				error_flag = SUCCESS_STATUS;
		}
	}

	return error_flag;
}

int is_integer_number_ok(char *temp_number)
{
	//printf("is_integer_number_ok(number *temp_number) = ");
	int error_code = ERROR_STATUS, start_check_position = 0, temp_vector_size = strlen(temp_number), counter_of_numbers = 0;

	if (temp_vector_size > 0 && temp_vector_size <= MAX_NUMBERS)
	{
		if (temp_number[start_check_position] == '-' || temp_number[start_check_position] == '+')
			start_check_position++;

		for (int i = start_check_position; i < temp_vector_size; i++)
			if (temp_number[i] >= '0' && temp_number[i] <= '9')
				counter_of_numbers++;

		if (counter_of_numbers == temp_vector_size - start_check_position)
			error_code = SUCCESS_STATUS;
	}

	if (temp_vector_size > MAX_NUMBERS)
		printf("Вы ввели целое число большее 30 разрядов. Уменьшите число и повторите попытку\n");
	else if (error_code == ERROR_STATUS)
		printf("Вы некорректно ввели целое число. Исправьте и повторите заново.\n");

	return error_code;
}

int is_float_number_ok(char *temp_number)
{
	int error_code = ERROR_STATUS, start_check_position = 0, temp_vector_size = strlen(temp_number), counter_of_numbers = 0;

	if (temp_vector_size > 0 && temp_vector_size <= MAX_NUMBERS)
	{
		int number_of_points = 0;
		int number_of_E = 0;
		int number_of_znaks = 0;
		int number_of_numbers = 0;

		for (int i = 0; i < strlen(temp_number); i++)
		{
			if (temp_number[i] >= '0' && temp_number[i] <= '9')
				number_of_numbers++;
			else if (temp_number[i] == '-' || temp_number[i] == '+')
				number_of_znaks++;
			else if (temp_number[i] == 'E')
				number_of_E++;
			else if (temp_number[i] == '.')
				number_of_points++;
		}

		if (((number_of_numbers + number_of_points + number_of_E + number_of_znaks) == strlen(temp_number)) && number_of_znaks <= 2 && number_of_E == 1 && number_of_points == 1)
			error_code = SUCCESS_STATUS;
		else
			printf("Вы некорректно ввели вещественное число. Исправьте и повторите заново.\n");
	}

	return error_code;
}

char get_mantisa_sign(char *temp_number)
{
	if (temp_number[0] == '-')
		return '-';
	return '+';
}

int get_mantisa(char *temp_vector, number *temp_number)
{
	int add_cursor = 0, check_cursur = 0, temp_vector_size = strlen(temp_vector);

	for (int i = 0; i < strlen(temp_vector); i++)
	{
		temp_number->mantisa[i] = '0';
	}

	while (check_cursur <= (temp_vector_size - 1))
	{	
		if (temp_vector[check_cursur] == 'E')
			break;

		if ((temp_vector[check_cursur] >= '0' && temp_vector[check_cursur] <= '9') || temp_vector[check_cursur] == '.')
		{
			temp_number->mantisa[add_cursor] = temp_vector[check_cursur];
			add_cursor++;
		}

		check_cursur++;
	}

	for (int i = check_cursur; i < strlen(temp_vector); i++)
	{
		temp_number->mantisa[i] = '\0';
	}

	free_mass(temp_number->mantisa);

	return check_cursur;
}

int represent_integer_number_in_expanded_form(char *temp_first_number, number *first_number)
{
	int error_code = SUCCESS_STATUS;

	(*first_number).mantisa_sign = get_mantisa_sign(temp_first_number);
	int first_number_E_position = get_mantisa(temp_first_number, first_number);

	(*first_number).order_sign = '+';
	(*first_number).order = 0;

	if (strlen((*first_number).mantisa) > MAX_MANTISA_SIZE)
	{
		printf("Вы ввели целое число большее 30 разрядов. Уменьшите число и повторите попытку.\n");
		error_code = ERROR_STATUS;
	}
	else if (first_number->order > MAX_ORDER_SIZE)
	{
		printf("Вы ввели вещественное число с порядком большее 5 разрядов. Исправьте и повторите попытку.\n");
		error_code = ERROR_STATUS;
	}

	return error_code;
}

int represent_float_number_in_expanded_form(char *temp_second_number, number *second_number)
{
	second_number->mantisa_sign = get_mantisa_sign(temp_second_number);
	int second_number_E_position = get_mantisa(temp_second_number, second_number);
	second_number->order_sign = get_order_sign(temp_second_number, second_number_E_position);

	

	get_order(temp_second_number, second_number_E_position, second_number);
	// if (second_number->order_sign == '-')
	// 	second_number->order *= -1;

	if (second_number->order > MAX_ORDER_SIZE)
		return ERROR_STATUS;
	
	free_mass(second_number->mantisa);

	int decimal_number = get_number_of_decimal(second_number);

	return SUCCESS_STATUS;
}

char get_order_sign(char *temp_number, int temp_number_E_position)
{
	if (temp_number_E_position + 1 < strlen(temp_number))
		if (temp_number[temp_number_E_position + 1] == '-')
			return temp_number[temp_number_E_position + 1];

	return '+';
}

void get_order(char *temp_number, int temp_number_E_position, number *second_number)
{
	second_number->order = 0;
	int check_cursur = strlen(temp_number) - 1;
	
	while (check_cursur >= temp_number_E_position)
	{
		if (temp_number[check_cursur] == '+' || temp_number[check_cursur] == '-')
			break;

		second_number->order += char_to_int(temp_number[check_cursur]) * pow(10, (strlen(temp_number)  - check_cursur) - 1);
		
		check_cursur--;
	}

}

int get_number_of_decimal(number *second_number)
{
	free_mass(second_number->mantisa);

	int check_cursur = strlen(second_number->mantisa), answer = 0;
		
	while(second_number->mantisa[check_cursur] != '.')
	{

		answer++;
		check_cursur--;
	}

	return answer;
}
