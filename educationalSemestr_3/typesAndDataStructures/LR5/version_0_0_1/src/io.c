#include "../inc/io.h"

void out_menu()
{
	printf("Меню программы:\n");
	printf("1 - Работа с массивом\n");
	printf("2 - Работа со списком\n");
	printf("0 - Выход из программы\n");
}

int get_par()
{
	int par;
	int read_st;
	printf("Введите пункт меню (0-2):");
	read_st = scanf("%d", &par);
	while (read_st != 1 || par < 0 || par > 2)
	{
		printf("Ошибка ввода пункта меню. Повторите попытку.\n");
		printf("Введите пункт меню (0-2):");
		int read_st = scanf("%d", &par);
	}
	return par;
}

int get_par_memory()
{
	int par;
	int read_st;
	printf("Выводить освобождаемые адреса 0/1 (Да/Нет):");
	read_st = scanf("%d", &par);
	while (read_st != 1 || par < 0 || par > 1)
	{
		printf("Ошибка ввода пункта меню. Повторите попытку.\n");
		printf("Выводить освобождаемые адреса 0/1 (Да/Нет):");
		int read_st = scanf("%d", &par);
	}
	return par;
}
