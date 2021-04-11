#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "student.h"
#include "formtext.h"

int formnewfile(int argc, char *argv[], student *studentsinformation, int numberofstudents)
{
    int temperrorflag = 1, numberofsubstrs = 0;
    
    FILE *operationfile_out = fopen(argv[3], "w");
    
    for (int i = 0; i < numberofstudents; i++)
    {
        if (strlen(argv[4]) <= strlen(studentsinformation[i].surname))
        {
            if (strncmp(studentsinformation[i].surname, argv[4], strlen(argv[4])) == 0)
            {
                fprintf(operationfile_out, "%s\n%s\n%d %d %d %d\n", (studentsinformation[i].surname), (studentsinformation[i].name), *((studentsinformation[i].marks) + 0), *((studentsinformation[i].marks) + 1), *((studentsinformation[i].marks) + 2), *((studentsinformation[i].marks) + 3));
                
                numberofsubstrs += 1;
            }
        }
    }
                
    if (numberofsubstrs > 0)
    {
        temperrorflag = 0;
    }
    
    return temperrorflag;
}
