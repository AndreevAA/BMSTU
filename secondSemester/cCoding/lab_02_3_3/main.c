#include <stdio.h>
int input(int *n, int *list);
int transformation(int *n, int *list);
void exception();

int main()
{
    int number_of_elements, flag;
    printf("Input number of elements: ");
    int check_input_number_of_elements = ((scanf("%d", &number_of_elements) != 1) || (number_of_elements < 1) || (number_of_elements > 10));
    if (!(check_input_number_of_elements))
    {
        int list[20];
        int check_input_list = input(&number_of_elements, list);
        if (!(check_input_list))
        {
            transformation(&number_of_elements, list);
            flag = check_input_list;
        }
        else
        {
            exception();
            flag = check_input_list;
        }
    }
    else
    {
        exception();
        flag = check_input_number_of_elements;
    }
    return flag;
}

int find_del(int *list, int *i, int *k)
{
    unsigned int a, b = 0;
    a = *(list + *i + *k - 1);
    while (a != 0)
    {
        b = b * 10 + a % 10;
        a = a / 10;
    }
    return b;
}

int transformation(int *number_of_elements, int *list)
{
    int k = 0;
    for (int i = 0; i < *number_of_elements; i++)
    {
        if (list[i + k] > 0)
        {
            k++;
            for (int j = *number_of_elements + k - 1; j > i + k; j--)
                list[j] = list[j - 1];
            list[i + k] = find_del(list, &i, &k);
        }
    }
    for (int i = 0; i < *number_of_elements + k; i++)
        printf("%d\n", list[i]);
    return 0;
}

void exception()
{
    printf("Error\n");
}

int input(int *number_of_elements, int *list)
{
    int flag2 = 0;
    for (int i = 0; i < *number_of_elements; i++)
    {
        printf("Input list's element: ");
        if ((scanf("%d", &*(list + i))) != 1)
            flag2 = 1;
    }
    return flag2;
}
