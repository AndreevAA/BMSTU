/*!
\file
\brief Глобальные функции программы
\author    "Андреев Александр"
\version   4
\date      25 мая 2020
 
Данный файл содержит в себе тело функций, используемых в демонстрационной программе
*/

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "globalfunctions.h"

// Проверка на наличие файла
int existfile(char *argv[], int parametr)
{
    FILE *file = fopen(argv[parametr], "rb");
    
    // Файл не существует
    if (!file)
    {
        fclose(file);
        return 0;
    }
    
    // Файл существует
    fclose(file);
    return 1;
}

// Получение количества значений
int getfilesize(FILE *filename, size_t *size)
{
    long tempsize;

    int answer = 0;
    
    // Чтение файла до самого конца
    if (fseek(filename, 0L, SEEK_END))
        answer = 1;

    // Получение размера
    tempsize = ftell(filename);
    
    // Файл оказался пустым
    if (tempsize < 0)
        answer = 1;
    else
    {
        *size = tempsize;
    
        // Вывод размера файла
        answer = fseek(filename, 0L, SEEK_SET);
    }
    return answer;
}
