/*!
\file
\brief Вывод содержимого файла
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
#include "printdata.h"
#include "globalfunctions.h"

#define ERROR_OK 0

// Вывод чисел из файла на экран
void displayfiledata(int *argc, char *argv[], int *errorflag)
{
    int tempnumber = 0;
    
    FILE *file = fopen(argv[*argc - 1], "rb");
    
    if (file != NULL)
    {
        size_t filesize;
        if (getfilesize(file, &filesize) == 0 && filesize > 0 && filesize % 4 == 0)
        {
            *errorflag = fread(&tempnumber, sizeof(int), 1, file);
            
            while (*errorflag == 1)
            {
                printf("%d ", tempnumber);
                *errorflag = fread(&tempnumber, sizeof(int), 1, file);
            }
            
            *errorflag = ERROR_OK;
        }
    }
    
    fclose(file);
}
