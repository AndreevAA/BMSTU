#include <stdio.h>
#include <string.h>
#include <math.h>
#include "check.h"
#define ERRORFLAGGOOD 0
#define ERRORFLAGBAD 1

void output(int answer);

int main(int argc, char *argv[])
{
    int numbersofnumber = 0, errorflag = ERRORFLAGBAD;

    FILE *file = fopen(argv[1], "r");

    if (argc > 0 && file != NULL)
    {
        double averagevalue = getaveragevalue(file, argv, &numbersofnumber, &averagevalue, &errorflag);
        double sigma = getsigma(file, argv, &numbersofnumber, averagevalue, &errorflag);
        int checkanswer = getanswer(file, argv, &averagevalue, &sigma, &errorflag);

        if (errorflag == ERRORFLAGGOOD)
            output(checkanswer);
    }

    fclose(file);

    return errorflag;
}

void output(int answer)
{
    printf("%d\n", answer);
}
