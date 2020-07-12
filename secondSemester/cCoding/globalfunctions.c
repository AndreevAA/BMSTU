/*!
\file
\brief Сортировка элементов файла
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
#include "sortdata.h"
#include "globalfunctions.h"
#define ERRORFLAGGOOD 0
#define ERRORFLAGBAD 1
#define MINRAND -1000
#define MAXRAND 1000
#define CREATE_ARGC 4
#define PRINT_ARGC 3
#define SORT_ARGC 3
#define ERROR_OK 0
#define ERROR_BAD 1

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
int getfilesize(FILE *f, size_t *size)
{
    long temp_size = ftell(f);
    int file_size;
    if (fseek(f, 0L, SEEK_END) || temp_size < 0)
        file_size = 1;
    else
    {
        *size = temp_size;
        file_size = fseek(f, 0L, SEEK_SET);       
    }
    
    return file_size;
}