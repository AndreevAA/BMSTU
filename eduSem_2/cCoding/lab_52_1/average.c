#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "student.h"
#include "average.h"

double getaveragenumber(student *studentsinformation, int numberofstudents)
{
    double summary = 0;
    
    for (int i = 0; i < numberofstudents; i++)
    {
        double tempstudentaveragenumber = ((studentsinformation[i].marks[0] + studentsinformation[i].marks[1] + studentsinformation[i].marks[2] + studentsinformation[i].marks[3]) / 4);
        summary += tempstudentaveragenumber;
    }
    
    return summary / numberofstudents;
}

int countaverage(char *filename, student *studentsinformation, int numberofstudents, double averagenumber)
{
    int temperrorflag = 1;
    
    FILE *operationfile_out = fopen(filename, "w");
    
    if (operationfile_out != NULL)
    {
        for (int i = 0; i < numberofstudents; i++)
        {
            double tempstudentaveragenumber = ((studentsinformation[i].marks[0] + studentsinformation[i].marks[1] + studentsinformation[i].marks[2] + studentsinformation[i].marks[3]) / 4);
            
            if (averagenumber <= tempstudentaveragenumber)
            {
                fprintf(operationfile_out, "%s\n%s\n%d %d %d %d\n", (studentsinformation[i].surname), (studentsinformation[i].name), *((studentsinformation[i].marks) + 0), *((studentsinformation[i].marks) + 1), *((studentsinformation[i].marks) + 2), *((studentsinformation[i].marks) + 3));
            }
        }
        
        temperrorflag = 0;
    }
    
    fclose(operationfile_out);
    
    return temperrorflag;
}
