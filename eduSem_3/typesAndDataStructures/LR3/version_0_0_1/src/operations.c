#include "../inc/operations.h"

void free_ja(struct ja * JA)
{
    struct ja *p;
    p = JA;
    for (;JA->next;)
    {
        p = JA->next;
        free(JA);
        JA = p;
    }
}

void add_elem(struct ja **JA)
{
    struct ja *p;
    struct ja *elem = (struct ja *)malloc(sizeof(struct ja));
    if (elem!= NULL)
    {
        //elem -> num = 1;
        
        if (*JA == NULL)
        {
            *JA = elem;
            printf("|%p| ",*JA);
            printf("%p |",elem);
        }
        else
        {
            p = *JA;
            for (;p -> next;p++)
                printf("%p| ",p);
            //printf("%p| ",p);
            //printf("%p |",elem);
            //printf("%p |",elem->next);
            p -> next = elem;
        }
        elem -> next = NULL;
    }
    p = *JA;
    for (;p->next;p++)
        printf("%p ",p);
    printf("%p\n",p);
}

void clean_stdin(void)
{
    int c;
    do
    {
        c = getchar();
    }
    while (c != '\n' && c != EOF);
}

void free_mtr(int **mtr, int size) // очистка матрицы
{
    if (mtr !=NULL)
    {
        for (int i = 0; i < size ;i++)
        {
            if (mtr[i] != NULL)
                free(mtr[i]);
        }
        free(mtr);
    }
} 
