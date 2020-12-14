#include "../../inc/config.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"

// Функция поиска в дереве
t_node * search_in_tree(t_node *tree, int val, int *amount, int *flag)
{
    if (tree == NULL)
    {
        *flag = -1;
        return tree;
    }
    *amount = *amount + 1;
    if (tree->value == val)
    {
        *flag = 1;
        return tree;
    }
    else if (tree->value > val)
        return search_in_tree(tree->left, val, amount, flag);
    else
        return search_in_tree(tree->right, val, amount, flag);
    return NULL;
}

// поиск в хеш таблице
int search_in_hash(t_hash **table, int val, int table_len, int *amcount, int k)
{
    int index = val % table_len;
    t_hash *head = table[index];
    if (looking_in_list(head, val, amcount) == NULL)
        return -1;
    else
        return 1;
}

//поиск в связном списке
t_hash *looking_in_list(t_hash *head, int val, int *amount)
{
    *amount = *amount + 1;
    if (head == NULL)
        return NULL;
    if (head->value == val)
        return head;
    else
        return looking_in_list(head->next, val, amount);
    return NULL;
}

// Функция поиска в файле
int search_in_file(FILE *f, int val, int *amount_file)
{
    rewind(f);
    fseek(f, 0, SEEK_SET);
    int buff;
    while (!feof(f))
    {
        (*amount_file)++;
        if (fscanf(f, "%d", &buff) == 1)
            if (buff == val)
                return 1;
    }

    return -1;
}
