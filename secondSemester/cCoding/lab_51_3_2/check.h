#ifndef CHECK_H
#define CHECK_H

double getsigma(FILE *file, char *argv[], int *numbersofnumber, double averagevalue, int *errorflag);
double getaveragevalue(FILE *file, char *argv[], int *numbersofnumber, double *averagevalue, int *errorflag);
int getanswer(FILE *file, char *argv[], double *averagevalue, double *sigma, int *errorflag);

#endif // CHECK_H
