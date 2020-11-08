#include "../inc/io.h"

void print_welcome()
{
	printf("Добро пожаловать в программу!\n");
}

void print_menu()
{
	printf("Меню: \n");
	printf("\t0 - Выход из программы\n");
	printf("\t1 - Работа с массивом\n");
	printf("\t2 - Работа со списком\n");
}

void print_menu_input_welcome()
{
	printf("\nУкажите цифру: ");
}

void error_input_menu()
{
	printf("Ошибка ввода пункта меню. Повторите попытку.\n");
}

void print_v_o_welcome()
{
	printf("Выбрана работа с массивом...\n");
}

void print_s_o_welcome()
{
	printf("Выбрана работа со списком...\n");
}

void print_v_o_menu()
{
	printf("Меню: \n");
	printf("\t0 - Назад\n");
	printf("\t1 - Добавить символ\n");
	printf("\t2 - Удалить символ\n");
	printf("\t3 - Проверить на палиндром\n");
	printf("\t4 - Вывести\n");
}

void print_stack_is_empty()
{
	printf("Стек пуст...\n");
}

void print_stack_is_full()
{
	printf("Стек полон...\n");
}

