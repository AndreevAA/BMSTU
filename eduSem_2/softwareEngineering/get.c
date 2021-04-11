/*!
\file
\brief Файл с вычислительными функциями
\author    "Андреев Александр"
\version   1
\date      21 мая 2020
 
Данный файл содержит в себе  функции,
используемые в демонстрационной программе
*/

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include "get.h"
#include <assert.h>
#define ERRORFLAG_ERROR 1
#define ERRORFLAG_OK 0
#define MAXSIZEMATRIX 1000
#define MAX_STRING_SIZE 1000000

int findmaxelement(int *list_of_numbers)
{
    int numberofelement = 0, element = 0;
    for (int i = 0; i < 10; i++)
    {
        if (*(list_of_numbers + i) > numberofelement)
        {
            numberofelement = *(list_of_numbers + i);
            element = i;
        }
    }
    return element;
}

void refreshfrequent(long int number, int *list_of_numbers, int *errorflag)
{
    // Разность предыдущего значения и будущего
    int one = *(list_of_numbers + number);
    one += 1;

    int difference = abs(one - *(list_of_numbers + number));
    
    assert(difference == 1);

    // Обновление массива количества встреч элемент
    *(list_of_numbers + number) += 1; 
}

void getnumbers(long int *tempnumber, int *list_of_numbers, int *errorflag)
{
    *tempnumber = labs(*tempnumber);
    
    if (*tempnumber == 0)
        refreshfrequent(*tempnumber, list_of_numbers, errorflag);
    
    while (*tempnumber != 0)
    {
        refreshfrequent(*tempnumber % 10, list_of_numbers, errorflag);
        *tempnumber /= 10;
    }
}

void trim(char *s)
{
    // Удаление пробелов и табов вначале
    int i = 0, j;
    while((s[i]==' ') || (s[i]=='\t')) {
        i++;
    }
    if(i>0) {
        for(j = 0; j < strlen(s); j++)
            s[j]=s[j+i];
        
        s[j] = '\0';
    }

    // Удаление пробелов и табов вначале
    i = strlen(s)-2;
    while((s[i]==' ')||(s[i]=='\t'))
        i--;
    
    if(i < (strlen(s) - 1))
        s[i+1] = '\0';
}

void checkstrings(int *errorflag, int hight, int width, char *argv[])
{
    FILE *file = fopen(argv[1], "r");

    int tempnumberofstring = 0;
    char stringfirst[MAX_STRING_SIZE] = ""; 

    while (fgets(stringfirst, MAX_STRING_SIZE, file) != NULL)
    {
        int numberofelement = 0;

        char *stringtempwords;

        trim(stringfirst);

        if (tempnumberofstring != 0)
        {
            stringtempwords = strtok(stringfirst, " ");

            while (stringtempwords != NULL)
            {
                numberofelement += 1;
                stringtempwords = strtok(NULL, " ");
            }

            if (numberofelement != width) 
                *errorflag = 1;
        }

        tempnumberofstring += 1;
    }

    if (tempnumberofstring != hight + 1) 
        *errorflag = 1;

    fclose(file);
}

void getnextelement(FILE *file, int *list_of_numbers, int *errorflag, char *argv[])
{
    long int newnumber = 0;
    int hight, width, numberofinputelements = 0;
    
    if (fscanf(file, "%d", &hight) == 0 || fscanf(file, "%d", &width) == 0)
        *errorflag = ERRORFLAG_ERROR;
    
    if (hight >= INT_MAX || hight <= INT_MIN || width >= INT_MAX || width <= INT_MIN || hight >= MAXSIZEMATRIX || width >= MAXSIZEMATRIX)
        *errorflag = ERRORFLAG_ERROR;

    if (*errorflag == ERRORFLAG_OK)
        checkstrings(errorflag, hight, width, argv);

    if (fscanf(file, "%ld", &newnumber) == 1 && *errorflag == ERRORFLAG_OK)
    {
        numberofinputelements += 1;

        if (newnumber >= INT_MAX || newnumber <= INT_MIN)
            *errorflag = ERRORFLAG_ERROR;
        
        if (1 <= hight && hight <= MAXSIZEMATRIX && 1 <= width && width <= MAXSIZEMATRIX && *errorflag == ERRORFLAG_OK)
        {
            getnumbers(&newnumber, list_of_numbers, errorflag);
            
            while (fscanf(file, "%ld", &newnumber) == 1 && *errorflag == ERRORFLAG_OK)
            {
                if (newnumber >= INT_MAX || newnumber <= INT_MIN)
                    *errorflag = ERRORFLAG_ERROR;
                
                if (*errorflag == ERRORFLAG_OK)
                    getnumbers(&newnumber, list_of_numbers, errorflag);

                numberofinputelements += 1;
            }
            
            *errorflag = ferror(file);
        }
        else
        {
            *errorflag = ERRORFLAG_ERROR;
        }
    }
    
    if (numberofinputelements != hight * width)
        *errorflag = ERRORFLAG_ERROR;
}
