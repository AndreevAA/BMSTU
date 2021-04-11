#include "main.h"
#include "io.h"
#include "multiplication.h"

int main()
{
	int error_code = ERROR_STATUS;

	char input_command[MAX_NUMBERS];
	
	printf("Программа вычисления произведения целого и вещественного чисел, представленных в формате +-N и +-m.nE+-K, запущена.\n");//\nМеню использования программы:\nstart - Начало i-го вычисления\nexit - Завершение работы программы\n");
	
	// while (strcmp(input_command, "exit") != SUCCESS_STATUS)
	// {

		
	// }

	// scanf("%s", input_command);

	// if (strcmp(input_command, "start") == SUCCESS_STATUS)
	// 	get_and_multiply();
	// else if (strcmp(input_command, "exit") != SUCCESS_STATUS)
	// 	printf("Вы некорректно ввели команду. Попробуйте снова.\n");

	get_and_multiply();

	return error_code;
}