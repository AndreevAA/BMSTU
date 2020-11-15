#include <stdio.h>
#include <stdlib.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#define OK 0
#define ERROR 1

int menu_1(void)
{
    output_welcome();
    int choice;
    while (scanf("%d",&choice) != 1 || choice > 3 || choice < 1)
    {   
        clean_stdin();
		printf("\nПри вводе допущена ошибка. Повторите попытку...\n");
		printf("\n1 - Ввести матрицу вручную\n2 - Считать матрицу из файла\n\nПункт: ");
          
    }
    clean_stdin();
    return choice;
}

int menu_2(void)
{
    output_sup_menu();
    int choice;
    if (scanf("%d",&choice) == 1 && choice < 6 && choice >= 0)
    {
        clean_stdin();
        return choice;
    }
    else
    {
        printf("\n    При вводе допущена ошибка. Повторите попытку...\n");
        clean_stdin();
        return -1;
    }
}