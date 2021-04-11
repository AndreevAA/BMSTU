#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "student.h"
#include "sorttext.h"

void swapelements(student *studentsinformationfirst, student *studentsinformationsecond)
{
    student tempstudentsinformation = *studentsinformationfirst;
    *studentsinformationfirst = *studentsinformationsecond;
    *studentsinformationsecond = tempstudentsinformation;
}

// Проверка на алфавитность
int checkalphabet(student studentinformationfirst, student studentinformationsecond)
{
    int answer = strcmp(studentinformationfirst.surname, studentinformationsecond.surname);
    
    // Фамилии одинаковые
    if (answer == 0)
        answer = strcmp(studentinformationfirst.name, studentinformationsecond.name);

    return answer;
}

int sortstudents(student *studentsinformation, int numberofstudents)
{
    int temperrorflag = 1, left;
    student nextstudentinformation;
    
    for (int right = 1; right < numberofstudents; right++)
    {
        nextstudentinformation = studentsinformation[right];
        left = right - 1;

        while (left >= 0 && checkalphabet(nextstudentinformation, studentsinformation[left]) < 0)
        {
            swapelements(&studentsinformation[left + 1], &studentsinformation[left]);
            
            left--;
        }
        
        swapelements(&studentsinformation[left + 1], &nextstudentinformation);
    }
    
    for (int i = 0; i < numberofstudents; i++)
    {
        printf("%s\n%s\n%d %d %d %d\n", (studentsinformation[i].surname), (studentsinformation[i].name), *((studentsinformation[i].marks) + 0), *((studentsinformation[i].marks) + 1), *((studentsinformation[i].marks) + 2), *((studentsinformation[i].marks) + 3));
    }
    
    temperrorflag = 0;
    
    return temperrorflag;
}
