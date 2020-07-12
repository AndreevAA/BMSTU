/*!
\file
\brief Заполнение файла рандомными числами
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
#include "createdata.h"
#include "globalfunctions.h"

// Заполнение файла рандомными числами
void fillrandom(char *argv[], int *errorflag)
{
    FILE *file = fopen(argv[3], "wb");
    
    int num = atoi(argv[2]);
    
    for (int i = 0; i < num; i++)
    {
        int randnumber = rand();
        fwrite(&randnumber, sizeof(int), 1, file);
    }
    
    fclose(file);
}
