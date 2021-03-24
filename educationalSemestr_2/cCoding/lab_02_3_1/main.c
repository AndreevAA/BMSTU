#include <stdio.h>
#include <math.h>
int input(int *n, int *arr);
double count(int *n, int *arr);

void output(double *s);

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
            double s = count(&n, arr);
            if (s == 0)
                flag2 = 1;
            else
            {
                output(&s);
            }
        }
        else
            printf("Ошибка ввода элемента массива \n");
        flag = flag2;
    }
    else
    {
        printf("Ошибка ввода количества элементов\n");
        flag = flag1;
    }
    return flag;
}

void output(double *s)
{
    printf("%f\n", *s);
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

double count(int *n, int *arr)
{
    double s;
    int k;
    s = 1;
    k = 0;
    for (int i = 0; i < *n; i++)
    {
        if (*(arr + i) > 0)
        {
            k++;
            s *= *(arr + i);
        }
    }
    if (k != 0)
    {
        s = pow(s, 1.0 / (k));
    }
    else
        s = 0;
    return s;
}
