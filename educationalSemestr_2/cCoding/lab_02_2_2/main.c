#include <stdio.h>

void output(int *result, int *k);

int input(int *n, int *arr);
int tranform_arr(int *n, int *arr, int *result);

int main()
{
    int n, flag;
    printf("Введите количество элементов массива: ");
    int flag1 = ((scanf("%d", &n) != 1) || (n < 1) || (n > 10));
    if (!(flag1))
    {
        int arr[10];
        int flag2 = input(&n, arr);
        if (!(flag2))
        {
            int result[10];
            int k = tranform_arr(&n, arr, result);
            if (k > 0)
            {
                output(result, &k);
            }
            else
            {
                flag2 = 1;
                printf("Подходящих элементов нет\n");
            }
            flag = flag2;
        }
        else
        {
            printf("Ошибка при вводе элементов массива\n");
            flag = flag2;
        }
    }
    else
    {
        printf("Ошибка ввода количества элементов\n");
        flag = flag1;
    }
    return flag;
}

void output(int *result, int *k)
{
    for (int i = 0; i < *k; i++)
        printf("%d\n", result[i]);
}

int input(int *n, int *arr)
{
    int flag2 = 0;
    for (int i = 0; i < *n; i++)
    {
        printf("Введите элемент массива: ");
        int pc = (scanf("%d", &*(arr + i)));
        if (pc != 1)
            flag2 = 1;
    }
    return flag2;
}

int tranform_arr(int *n, int *arr, int *result)
{
    int k = 0;
    int q, s1, s2;
    int e = 0;
    for (int i = 0; i < *n; i++)
    {
        q = *(arr + i);
        s1 = q % 10;
        s2 = s1;
        while (q > 0)
        {
            s2 = q % 10;
            q = q / 10;
        }
        if (s1 == s2)
        {
            k++;
            result[e] = *(arr + i);
            e++;
        }
    }
    return k;
}

