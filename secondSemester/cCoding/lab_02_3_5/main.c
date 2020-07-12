#include <stdio.h>
#include <math.h>
#include <stdlib.h>

void exception();
void output(int number);
int input(int *list_of_numbers, int *list_number, int *answer);

int main()
{
    int list_number, error_flag = 0, read_error_numbers, read_error_list, list_of_numbers[10], answer[1];
    
    read_error_numbers = ((scanf("%d\n", &list_number) != 1) || (list_number < 2) || (list_number > 10));
    
    if (!read_error_numbers)
    {
        read_error_list = input(list_of_numbers, &list_number, answer);
        if (!read_error_list)
        {
            output(answer[0]);
        }
        else
        {
            printf("%s\n", "Error");
            error_flag = read_error_list;
        }
    }
    else
    {
        printf("%s\n", "Error");
        error_flag = read_error_numbers;
    }
    return error_flag;
}

void exception()
{
    printf("%s\n", "Error");
}

void output(int number)
{
    printf("%d\n", number);
}

int input(int *list_of_numbers, int *list_number, int *answer)
{
    int read_error = 0;
    for (int i = 0; i < *list_number; i++)
    {
        int number_of_read_symbols = scanf("%d", &*(list_of_numbers + i));
        if (number_of_read_symbols != 1)
            read_error = 1;
        else
        {
            
            if (i >= 1)
            {
                int temp = (*(list_of_numbers + i)) * (*(list_of_numbers + i - 1));
                if (i == 1)
                {
                    *(answer + 0) = temp;
                }
                else
                {
                    if (temp < answer[0])
                        *(answer + 0) = temp;
                }
            }
        }
    }
    return read_error;
}
