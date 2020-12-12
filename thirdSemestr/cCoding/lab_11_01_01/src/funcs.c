#include "../inc/checks.h"
#include "../inc/comps.h"
#include "../inc/funcs.h"

int num_of_num(int temp_number)
{
    int ans_num = 0;
    while (temp_number != 0)
    {
        ans_num++;
        temp_number /= 10;
    }
    return ans_num;
}

void int_to_str(int value, char *string)
{
    if (value == 0)
    {
        string[0] = '0';
        string[1] = '\0';
        return;
    }

    int pos = 0;
    int num = 0;

    unsigned int value_buff_1 = value;
    if (value < 0)
    {
        string[pos] = '-';
        value_buff_1 = -value;
        pos++;
    }

    unsigned int value_buff_2 = value_buff_1;

    while (value_buff_1 != 0)
    {
        num++;
        value_buff_1 /= 10;
    }

    for (int i = num - 1; i >= 0; i--)
    {
        string[i + pos] = value_buff_2 % 10 + '0';
        value_buff_2 /= 10;
    }

    string[num + pos] = '\0';

    return;
}

char *get_str_from_int(int temp_number)
{
    int size = num_of_num(temp_number);
    char *ans_str = (char *)malloc(sizeof(char) * size);
    for (int cur = 0; temp_number != 0; temp_number /= 10, cur++)
        *(ans_str + cur) = temp_number % 10 + '0';
    
    int cur = size - 1, add = 0;
    char res[size];
    for (; cur >= 0; cur--, add++)
        res[add] = ans_str[cur];
    res[size] = '\0';
    char *p = res;
    free(ans_str);

    return p;
}

char system_16(int num)
{
    switch (num)
    {
        case 10:
            return 'a';
        case 11:
            return 'b';
        case 12:
            return 'c';
        case 13:
            return 'd';
        case 14:
            return 'e';
        case 15:
            return 'f';
    }
    return '0';
}

void convert_num_sys(long value, char *string)
{
    int num = 0;
    long value_buff = value;

    while (value_buff != 0)
    {
        num++;
        value_buff /= 16;
    }

    for (int i = num - 1; i >= 0; i--)
    {
        if (value % 16 < 10)
            string[i] = value % 16 + '0';
        else
            string[i] = system_16(value % 16);
        value /= 16;
    }

    if (num == 0 && value == 0)
    {
        string[num] = '0';
        num++;
    }

    string[num] = '\0';

    return;
}

int out_buffer(char *buffer, size_t buffer_size, char *temp_str, int *add_cur, int num)
{
    for (int cur = 0; *(temp_str + cur) != '\0'; cur++, num++)
    {
        if ((*add_cur) < (int)buffer_size - 1)
        {
            buffer[(*add_cur)] = temp_str[cur];
            (*add_cur)++;
        }
    }
    return num;
}
