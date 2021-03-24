#include <stdio.h>
#include <string.h>
#include <math.h>
#include "check.h"
#define ERRORFLAGGOOD 0
#define ERRORFLAGBAD 1

// Получить среднее значение чисел из файла
double getaveragevalue(FILE *file, char *argv[], int *numbersofnumber, double *averagevalue, int *errorflag)
{
    double newnumber = 0, sumofnumbers = 0;

    if (fscanf(file, "%lf", &newnumber) == 1)
    {
        while (fscanf(file, "%lf", &newnumber) == 1)
        {
            sumofnumbers += newnumber;
            *numbersofnumber += 1;
        }

        *errorflag = ferror(file);
    }
    
    *averagevalue = sumofnumbers / *numbersofnumber;

    rewind(file);

    return *averagevalue;
}

// Получить сумму квадратов разностей
double getsigma(FILE *file, char *argv[], int *numbersofnumber, double averagevalue, int *errorflag)
{
    double newnumber = 0, sumofsquareddifferences = 0, answersigma;
    
    while (fscanf(file, "%lf", &newnumber) == 1)
    {
        sumofsquareddifferences += pow((newnumber - averagevalue), 2);
    }

    answersigma = sqrt(sumofsquareddifferences / *numbersofnumber);

    rewind(file);

    return answersigma;
}

int getanswer(FILE *file, char *argv[], double *averagevalue, double *sigma, int *errorflag)
{
    double newnumber = 0;
    int answer = 1;

    while (fscanf(file, "%lf", &newnumber) == 1)
    {
        if (newnumber >= *averagevalue + 3 * *sigma || newnumber <= *averagevalue - 3 * *sigma)
            answer *= 0;
    }

    rewind(file);

    return answer;
}
