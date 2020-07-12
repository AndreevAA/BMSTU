#include <stdio.h>

int input(int *list, int *number);

void exception();
void swap(int *prev_num, int *next_num);
void output(int *list, int *number);
void bubblesort(int *num, int *size);

int main()
{
    int list[10], number, flag1, flag;
    flag1 = (scanf("%d", &number) != 1 || number < 1 || number > 10);

    if (!flag1)
    {
        int flag2 = input(list, &number);
        if (!(flag2))
        {
            bubblesort(list, &number);  
            output(list, &number);
            flag = flag2;
        }
        else
        {
            exception();
            flag = flag2;
        }
    }
    else
    {
        exception();
        flag = flag1;
    }
    return flag;
}

void output(int *list, int *number)
{
    for (int i = 0; i < *number; i++)
        printf("%d\n", *(list + i));
}

int input(int *list, int *number)
{
    int flag2 = 0;
    for (int i = 0; i < *number; i++)
    {
        printf("Введите элемент массива: ");
        int pc = (scanf("%d", &*(list + i)));
        if (pc != 1)
            flag2 = 1;
    }
    return flag2;
}

void swap(int *prev_num, int *next_num)
{
    int temp = *prev_num; 
    *prev_num = *next_num;
    *next_num = temp;
}

// Функция сортировки прямым обменом (метод "пузырька")
void bubblesort(int *num, int *size)
{
  // Для всех элементов
    for (int i = 0; i < *size - 1; i++)
    {
        for (int j = (*size - 1); j > i; j--)
         // для всех элементов после i-ого
        {
            if (*(num + j - 1) > *(num + j))
             // если текущий элемент меньше предыдущего
            {
                swap(&num[j - 1], &num[j]); // меняем местами
            }
        }
    }
}

void exception()
{
    printf("Error\n");
}
