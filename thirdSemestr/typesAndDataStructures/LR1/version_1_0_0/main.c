#include "main.h"
#include "io.h"
#include "multiplication.h"

int main()
{
	int error_code = ERROR_STATUS;
	number first_number, second_number, answer_number;

	char input_command[MAX_NUMBERS];
	
	printf("Программа вычисления произведения целого и вещественного чисел, представленных в формате +-N и +-m.nE+-K, запущена.\nМеню использования программы:\nstart - Начало i-го вычисления\nexit - Завершение работы программы\n");
	
	while (strcmp(input_command, "exit") != SUCCESS_STATUS)
	{
		scanf("%s", input_command);

		if (strcmp(input_command, "start") == SUCCESS_STATUS)
		{
			if (scanf_input_numbers(&first_number, &second_number) == SUCCESS_STATUS)
			{
				multiply_integer_and_float(&first_number, &second_number, &answer_number);
				print_multiplied_result(answer_number.mantisa_sign, answer_number.mantisa, answer_number.order_sign, answer_number.order);
			}
		}
		else 
		{
			printf("Вы некорректно ввели команду. Попробуйте снова.\n");
		}
	}

	return error_code;
}