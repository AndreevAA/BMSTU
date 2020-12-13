#include "../../inc/config.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"

// Фунуция создания узла
t_node *create_node(int val)
{
    t_node *node = malloc(sizeof(t_node));
    if (node)
    {
        node->value = val;
        node->balance = 0;
        node->left = NULL;
        node->right = NULL;
    }

    return node;
}

// Функция подсчёта узлов
void count_node(t_node *tree, int *sum)
{
    if (tree == NULL)
        return;

    *sum += 1;
    count_node(tree->left, sum);
    count_node(tree->right, sum);
}

// Функция добавления узла
t_node *ord_add_node(t_node *tree, t_node *node)
{
    if (tree == NULL)
    {
        return node;
    }

    if (tree->value == node->value)
    {
        tree->balance++;
        free(node);
    }
    else if (tree->value > node->value)
    {
        tree->left = ord_add_node(tree->left, node);
    }
    else
    {
        tree->right = ord_add_node(tree->right, node);
    }
    return tree;
}

// Функция удаления поддерева
void freemem(t_node *tree)
{
    if (tree!=NULL)
    {
        freemem(tree->left);
        freemem(tree->right);
        free(tree);
    }
}