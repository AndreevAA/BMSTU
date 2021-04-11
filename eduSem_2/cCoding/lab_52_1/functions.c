#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "student.h"
#include "functions.h"

int uploadstudents(FILE *operationfile, struct student *studentsinformation, int *numberofstudents)
{
    int temperrorflag = 0;
    
    while (fscanf(operationfile, "%s%s%d%d%d%d\n", (studentsinformation[*numberofstudents].surname), (studentsinformation[*numberofstudents].name), &*((studentsinformation[*numberofstudents].marks) + 0), &*((studentsinformation[*numberofstudents].marks) + 1), &*((studentsinformation[*numberofstudents].marks) + 2), &*((studentsinformation[*numberofstudents].marks) + 3)) == 6)
    {
        *numberofstudents += 1;
    }
    
    return temperrorflag;
}
