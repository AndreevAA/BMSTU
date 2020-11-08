#include "../inc/io.h"

void print_welcome()
{
	printf("===\n");
	printf("Программа работы со стеком выполняет операции:\n");
	printf("  - Добавления / Удаления элементов\n");
	printf("  - Вывода текущего состояния стека\n");
	printf("\n");
}

void print_menu()
{
	printf("===\n");
	printf("Основное меню программы: \n");
	printf("  0 - Выход из программы\n");
	printf("  1 - Работа с массивом\n");
	printf("  2 - Работа со списком\n");
}

void print_menu_input_welcome()
{
	printf("\nУкажите цифру из доступных (0-2): ");
}

void print_menu_sec_input_welcome()
{
	printf("\n\tУкажите цифру из доступных (0-4): ");
}

void error_input_menu()
{
	printf("Ошибка ввода пункта меню. Повторите попытку.\n");
}

void print_v_o_welcome()
{
	printf("\n\tВыбрана работа с массивом (1)...\n");
}

void print_s_o_welcome()
{
	printf("\n\tВыбрана работа со списком (2)...\n");
}

void print_v_o_menu()
{
	printf("\n\tМеню подпрограммы работы с массивом: \n");
	printf("  \t0 - Назад\n");
	printf("  \t1 - Добавить символ\n");
	printf("  \t2 - Удалить символ\n");
	printf("  \t3 - Проверить на палиндром\n");
	printf("  \t4 - Вывести\n");
}

void print_s_o_menu()
{
	printf("\n\tМеню подпрограммы работы со списком: \n");
	printf("  \t0 - Вернуться в основное меню\n");
	printf("  \t1 - Добавить символ в стек\n");
	printf("  \t2 - Удалить символ из стека\n");
	printf("  \t3 - Проверить на палиндром\n");
	printf("  \t4 - Вывести содержимое\n");
}

void print_stack_is_empty()
{
	printf("\tСтек пуст...\n");
}

void print_stack_is_full()
{
	printf("\tСтек полон...\n");
}

