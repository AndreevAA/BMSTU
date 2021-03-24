#include "../inc/menu.h"

int menu_1() 
{
    printf("\n1 - Ввести матрицу вручную\n2 - Считать матрицу из файла\n\nПункт: ");
    int choice;
    if (scanf("%d",&choice))
    {
        if (choice < 3 && choice > 0)
        {
            //clean_stdin();
            return choice;
        }
        else
        {
            printf("\nНет такого пункта\n");
            //clean_stdin();
            return -1;
        }
    }
    else
    {
        //clean_stdin();
        printf("\nНет такого пункта\n");
        return -1;
    }
}


int menu_2() 
{
    printf("\n1 - Умножение вектора-строки на матрицу,хранящихся в разреженной форме,"
    " с получением результата в той же форме.\n2 - Умножение стандартным алгоритмом "
    "работы с матрицами.\n3 - Сравние времени выполнения операций и объем памяти при"
    " использовании этих 2-х алгоритмов при различном проценте заполнения матриц.\n"
    "4 - Вывести матрицу в разреженной форме.\n5 - Вывести матрицу в простой форме.\n0 - Выход\n\n"
    "Пункт: ");
    int choice;
    if (scanf("%d",&choice))
    {
        if (choice < 6 && choice >= 0)
        {
            //clean_stdin();
            return choice;
        }
        else
        {
            printf("\nНет такого пункта\n");
            //clean_stdin();
            return -1;
        }
    }
    else
    {
        //clean_stdin();
        printf("\nНет такого пункта\n");
        return -1;
    }
}
