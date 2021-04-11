#define MAX_SIZE_ST_INFO 1000

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "student.h"
#include "sorttext.h"
#include "formtext.h"
#include "functions.h"
#include "average.h"

int main(int argc, char *argv[])
{
    int errorflag = 1, numberofstudents = 0;
    
    if ((argc == 3 && strcmp(argv[1], "dt\0") == 0) || (argc == 3 && strcmp(argv[1], "st\0") == 0) || (argc == 5 && strcmp(argv[1], "ft\0") == 0))
    {
        FILE *operationfile = fopen(argv[2], "r");

        if (operationfile != NULL)
        {
            student studentsinformation[MAX_SIZE_ST_INFO];
            
            // "st\0"!
            if (argc == 3 && strcmp(argv[1], "st\0") == 0 && !uploadstudents(operationfile, studentsinformation, &numberofstudents))
            {
                if (!sortstudents(studentsinformation, numberofstudents) && numberofstudents > 0)
                    errorflag = 0;
                
                fclose(operationfile);
            }
            // "ft\0"
            else if (argc == 5 && strcmp(argv[1], "ft\0") == 0 && !uploadstudents(operationfile, studentsinformation, &numberofstudents))
            {
                if (!formnewfile(argc, argv, studentsinformation, numberofstudents) && numberofstudents > 0)
                    errorflag = 0;
                
                fclose(operationfile);
            }
            // "dt\0"
            else if (argc == 3 && strcmp(argv[1], "dt\0") == 0 && !uploadstudents(operationfile, studentsinformation, &numberofstudents))
            {
                double averagenumber = getaveragenumber(studentsinformation, numberofstudents);

                fclose(operationfile);
                if ((numberofstudents > 0) && !countaverage(argv[2], studentsinformation, numberofstudents, averagenumber))
                {
                    errorflag = 0;
                }
            }
            else
            {
                fclose(operationfile);
            }
        }
        else
        {
            fclose(operationfile);
        }
    }
    else
    {
        errorflag = 53;
    }
    
    return errorflag;
}
