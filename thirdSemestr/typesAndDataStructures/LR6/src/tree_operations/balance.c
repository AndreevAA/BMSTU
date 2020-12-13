#include "../../inc/config.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"

// рассчет высоты узла
int height(t_node* p)
{
    return p ? p->balance : 0;
}

// новый узел в сбалансированном дереве
t_node* read_file_balanced(t_node *root, FILE *f)
{
    rewind(f);
    int val;
    while (!feof(f))
    {
        if (fscanf(f, "%d", &val) == 1)
        {
            t_node *node = create_node(val);
            root = bal_add_node(root, node);
        }
    }
    return root;
}

// проверка узла на сбалансированность
int bfactor(t_node* p)
{
    if (height(p->right) == 1 && !p->left)
        return 2;
    else if (height(p->left) == 1 && !p->right)
        return -2;
    else
        return height(p->right) - height(p->left);
}

// балансировка дерева
t_node* balance(t_node* p)
{
    fixheight(p);
    if (bfactor(p) == 2)
    {
        if(bfactor(p->right) < 0)
            p->right = rotateright(p->right);
        return rotateleft(p);
    }
    if (bfactor(p) == -2)
    {
        if (bfactor(p->left) > 0)
            p->left = rotateleft(p->left);
        return rotateright(p);
    }
    return p;
}


// вставка узла в сбалансированное дерево
t_node* bal_add_node(t_node *root, t_node *node)
{
    if (root == NULL)
        return node;
    if (root->value == node->value)
        free(node);
    else if (root->value > node->value)
    {
        root->left = bal_add_node(root->left, node);
        root = balance(root);
    }
    else if (root->value < node->value)
    {
        root->right = bal_add_node(root->right, node);
        root = balance(root);
    }
    root = balance(root);
    return root;
}

// пересчет высоты узла после балансировки
void fixheight(t_node* p)
{
    int hl = height(p->left);
    int hr = height(p->right);
    p->balance = (hl > hr ? hl : hr) + 1;
}

// правый поворот
t_node* rotateright(t_node* p)
{
    t_node* q = p->left;
    p->left = q->right;
    q->right = p;
    fixheight(p);
    fixheight(q);
    return q;
}


// левый поворот
t_node* rotateleft(t_node* q)
{
    t_node* p = q->right;
    q->right = p->left;
    p->left = q;
    fixheight(q);
    fixheight(p);
    return p;
}
