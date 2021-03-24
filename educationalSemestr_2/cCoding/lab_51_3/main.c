/*!
\file
\brief Основной файл программы
\author    "Андреев Александр"
\version   4
\date      25 мая 2020
 
Данный файл содержит в себе определения функций, используемых в демонстрационной программе
*/


#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>

#include "sortdata.h"
#include "printdata.h"
#include "printdata.h"
#include "createdata.h"
#include "globalfunctions.h"

#define CREATE_ARGC 4
#define PRINT_ARGC 3
#define SORT_ARGC 3
#define ERROR_OK 0
#define ERROR_BAD 1

void comparator(int *argc, char *argv[], int *errorflag);

// Основная функция програмы получает на вход параметр считывания и название файла
int main(int argc, char *argv[])
{
    int errorflag = ERROR_BAD;
    comparator(&argc, argv, &errorflag);
    
    return errorflag;
}

// Компаратор определения операции и распределения
void comparator(int *argc, char *argv[], int *errorflag)
{
    if (*argc > 1 && (strlen(argv[1]) == 1) && strlen(argv[*argc - 1]) != 0)
    {
        if (*argv[1] == 'c' && existfile(argv, *argc - 1) == 1 && *argc == CREATE_ARGC && strlen(argv[2]) >= 1 && isdigit(argv[2]))
        {
            FILE *file = fopen(argv[*argc - 1], "wb");
            
            if (file != NULL)
            {
                fillrandom(argv, &*errorflag);
                *errorflag = ERROR_OK;
            }
        }
        else if (*argv[1] == 'p' && existfile(argv, *argc - 1) == 1 && *argc == PRINT_ARGC)
        {
            displayfiledata(argc, argv, errorflag);
        }
        else if (*argv[1] == 's' && existfile(argv, *argc - 1) == 1 && *argc == SORT_ARGC)
        {
            sortnumbers(argv, errorflag);
        }
    }
}
