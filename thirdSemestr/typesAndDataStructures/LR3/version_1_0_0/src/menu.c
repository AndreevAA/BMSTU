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
		printf("\nНекорректный ввод. Повторите.\n");
		printf("\n1 - Ввести матрицу вручную\n2 - Считать матрицу из файла\n\nПункт: ");
          
    }
    clean_stdin();
    return choice;
}

int menu_2(void)
{
    printf("\n1 - Умножение вектора-строки на матрицу,хранящихся в разреженной форме,"
    " с получением результата в той же форме.\n2 - Умножение стандартным алгоритмом "
    "работы с матрицами.\n3 - Сравние времени выполнения операций и объем памяти при"
    " использовании этих 2-х алгоритмов при различном проценте заполнения матриц.\n"
    "4 - Вывести матрицу в разреженной форме.\n5 - Вывести матрицу в простой форме.\n0 - Выход\n\n"
    "Пункт: ");
    int choice;
    if (scanf("%d",&choice) == 1 && choice < 6 && choice >= 0)
    {
        clean_stdin();
        return choice;
    }
    else
    {
        printf("\nНекорректный ввод. Повторите.\n");
        clean_stdin();
        return -1;
    }
}