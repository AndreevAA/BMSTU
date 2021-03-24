/*!
\file
\brief Основной файл с запуском процессов
\author    "Андреев Александр"
\version   1
\date      21 мая 2020
Данный файл содержит в себе объявление переменной об ошибки,
массива встреч цифр в числах матрицы, первичную операцию
по открытию файла и последовательный вызов вычислительных
функций программы.
*/

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "get.h"
#define ERRORFLAG_ERROR 1
#define ERRORFLAG_OK 0

/*!
Основная функция демонстрационной программы
\param[in] argc Количество введенных парметров
\param[in] argv[] Массив параметров запуска прогрммы
*/
int main(int argc, char *argv[])
{
    // Флаг ошибки
    int errorflag = ERRORFLAG_OK;
    
    // Массив количества встреч цифр в числах матрицы
    int list_of_numbers[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    
    // Открытие файла из проводника
    FILE *file = fopen(argv[1], "r");
    
    // Проверка файла на существование
    if (!file)
    {
        errorflag = ERRORFLAG_ERROR;
        printf("Файл не существует");
    }
    // Проверка файла на пустоту
    else if (getc(file) == EOF)
    {
        printf("Файл пустой");
        errorflag = ERRORFLAG_ERROR;
    }
    else
    {
        rewind(file);
        getnextelement(file, list_of_numbers, &errorflag, argv);
        if (errorflag == ERRORFLAG_OK)
            printf("Самая частая цифра: %d\n", findmaxelement(list_of_numbers));
        else if (errorflag == ERRORFLAG_ERROR)
            printf("Ошибка\n");
    }
    
    fclose(file);
    
    return errorflag;
}
