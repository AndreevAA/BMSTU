#include "../../inc/config.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"

// Вычисление длины связного списка
int len_list(t_hash *head)
{
    int len = 0;
    while (head && head->value)
    {
        len++;
        head = head->next;
    }
    return len;
}

// Нахождение следующего простого числа
int next_prime_number(int number)
{
    while (1)
    {
        int count_del = 0;
        number++;
        for (int i = 2; i < number - 1; i++)
        {
            if (number % i == 0)
            {
                count_del++;
            }
        }

        if (count_del == 0)
        {
            return number;
        }
    }
}

// Добавить в связный список
t_hash* add_end(t_hash *head, t_hash *elem)
{
    t_hash *cur = head;
    if (!head)
    {
        return elem;
    }
    while (cur != NULL && len_list(cur) > 0)
    {
        if (cur->value == elem->value)
        {
            return head;
        }
        if (cur->next != NULL)
            cur = cur->next;
        else
            break;
    }
    if (((int) cur->value) == elem->value)
    {
        return head;
    }
    cur->next = elem;
    return head;
}

// Создание элемента связного списка
t_hash* create_hash_node(int val)
{
    t_hash *node = malloc(sizeof(t_hash));

    if (node && val)
    {
        node->value = val;
        node->next = NULL;
    }

    return node;
}

// Определение индекса для вставки в таблицу
int what_index(int val, int len_table, int k)
{
    if (val < 0)
        val *= -7;
    long int buff = val * val;
    int summ = 0;
    while (buff > 0)
    {
        summ += buff % 10;
        buff /= 10;
    }
    return (val * k + summ + k) % len_table;
}

// Вставка в хеш-таблицу
t_hash **insert_in_hash_table(t_hash **table, int *len_table, t_hash *node, int max_len, int *k)
{
    int val, new_len_table = *len_table;
    int try = 0;
    t_hash **new_table;
    int index = what_index(node->value, *len_table, *k);
    table[index] = add_end(table[index], node);
    int len = len_list(table[index]);

    while (len > max_len)
    {
        (*k)++;
        try++;
        if (try >= 50)
        {
            *k = 1;
            try = 0;
            new_len_table = *len_table + 1;
        }
        new_table = calloc((size_t) new_len_table, sizeof(t_hash*));

        for (int i = 0; i < *len_table; i++)
        {
            t_hash *j = table[i];
            while (j && j->value)
            {
                val = j->value;
                node = create_hash_node(val);
                index = what_index(node->value, new_len_table, *k);
                new_table[index] = add_end(new_table[index], node);
                t_hash *new_j = j->next;
                free(j);
                j = new_j;
            }
        }
        *len_table = new_len_table;
        len = 0;
        for (int i = 0; i < new_len_table; i++)
        {
            if (len_list(new_table[i]) > len)
            {
                len = len_list(new_table[i]);
            }
        }
        free(table);
        table = new_table;
    }
    return table;
}

// Вывод хеш-таблицы на экран
void print_table(FILE *f, t_hash **table, int len_table, int is_search, int search_val)
{
    fprintf(f, "digraph %s {\nrankdir=\"UD\";\n", "TREE");

    if (is_search == 1)
        fprintf(f, "T [label=\"%d\" style=filled fillcolor=\"green\"];", search_val);

    for (int i = 0; i < len_table; i++)
    {
        fprintf(f, "T%d[label=%d,shape=square,color=blue];\nL%d[label=NULL,shape=square,color=blue];\nT%d", i, i, i, i);
        t_hash *cur = table[i];
        for ( ; cur; cur = cur->next)
        {
            fprintf (f, " -> %d", cur->value);
        }
        fprintf(f, " -> L%d;\n", i);
    }
    fprintf(f, "}\n");

    fclose(f);
    system("dot -Tpng ./output.gv -oGRAPH.png");
    system("open GRAPH.png");
    //system("rm output.gv");
}


int count_node_table(t_hash **table, int len_table)
{
    int sum = 0;
    for (int i = 0; i < len_table; i++)
    {
        t_hash *cur= table[i];
        for ( ; cur; cur = cur->next)
        {
            sum += sizeof(int);
        }
        sum += sizeof(t_hash*);
    }
    return sum;
}

// Заполнение хеш-таблицы из файла
t_hash **create_table(FILE *f, int *len_table, int *k, int max_len)
{
    rewind(f);
    t_hash **table = NULL;
    t_hash *node;
    int val;
    
    table = calloc((size_t) *len_table, sizeof(t_hash*));
    while (!feof(f))
    {
        if (fscanf(f, "%d", &val) == 1)
        {
            node = create_hash_node(val);
            table = insert_in_hash_table(table, len_table, node, max_len, k);
        }
        else
        {
            break;
        }
    }
    return table;
}

// Ввод размера таблицы с проверкой
int check_int(int *number, int min, int max)
{
    int num, error;
    if (scanf("%d", &num) == 1)
    {
        if ((num > min) && (num < max))
        {
            *number = num;
            error = 0;
        }
        else
        {
            error = -1;
        }

        if (!min && !max && error == -1)
        {
            *number = num;
            error = 0;
        }
        return error;
    }
    return -2;
}




