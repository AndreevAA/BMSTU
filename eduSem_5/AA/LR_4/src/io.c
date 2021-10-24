#include "../inc/config.h"

// Чтение второй строки
int input_second_word(char **second_word);

// Чтение первой строки
int input_first_word(char **first_word);

// Вывод приветственного сообщения
void out_welcome_message()
{
	printf("Введите две строки.\n");
}

// Сообщение ввода первой строки
void out_welcome_input_first_word()
{
	printf("\tПервая строка: ");
}

// Сообщение ввода второй строки
void out_welcome_input_second_word()
{
	printf("\tВторая строка: ");
}

// Вывод значения 
void out_levestein_get_distance_result(int distance)
{
	// printf("%s : %s => %d\n", first_word, second_word, distance);
	printf("\tРасстоение: %d\n", distance);
}

// Вывод сообщения об ошибке
void out_error_message()
{
	printf("Ошибка. \n");
}

// Чтение первой строки
int input_first_word(char **first_word)
{
	out_welcome_input_second_word();
	scanf("%s", *first_word);

	return SUCCESS_STATUS;
}

// Чтение второй строки
int input_second_word(char **second_word)
{
	out_welcome_input_second_word();
	scanf("%s", *second_word);

	return SUCCESS_STATUS;
}

// Чтение строк
int input_data(char **first_word, char **second_word)
{
	out_welcome_message();

	if (input_first_word(first_word) == SUCCESS_STATUS &&
		input_second_word(second_word) == SUCCESS_STATUS)
		return SUCCESS_STATUS;

	return ERROR_STATUS;
}
