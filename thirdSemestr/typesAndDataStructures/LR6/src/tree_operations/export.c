#include "../../inc/config.h"
#include "../../inc/tree_operations/balance.h"
#include "../../inc/efficiency/efficiency.h"
#include "../../inc/tree_operations/export.h"
#include "../../inc/tree_operations/hash.h"
#include "../../inc/io.h"
#include "../../inc/tree_operations/search.h"
#include "../../inc/tree_operations/tree.h"

// обход дерева
void apply_pre(t_node *tree, FILE *f, int is_search, int search_val)
{
    if (tree == NULL)
    {
        return;
    }

    to_dot(tree, f, is_search, search_val);
    apply_pre(tree->left, f, is_search, search_val);
    apply_pre(tree->right, f, is_search, search_val);
}

// Вывод в файл и преодбразование в картинку
void export_to_dot(FILE *f, const char *tree_name, t_node *tree, int is_search, int search_val)
{
    fprintf(f, "digraph %s {\n", tree_name);

    if (is_search == 1)
        fprintf(f, "T [label=\"%d\" style=filled fillcolor=\"green\"];", search_val);
    
    apply_pre(tree, f, is_search, search_val);

    fprintf(f, "}\n");
    
    fclose(f);
    
    system("dot -Tpng ./output.gv -oGRAPH.png");
    system("open GRAPH.png");
    system("rm output.gv");
}

// Вывод в спец. формате
void to_dot(t_node *tree, FILE *f, int is_search, int search_val)
{

    if (tree->left)
    {
        if (is_search == 1 && tree->value == search_val)
            fprintf(f, "T -> \"%d \";\n", tree->left->value);
        else if (is_search == 1 && tree->left->value == search_val)
            fprintf(f, "\"%d \" -> T;\n", tree->value);
        else
            fprintf(f, "\"%d \" -> \"%d \";\n", tree->value, tree->left->value);
    }

    if (tree->right)
    {
        if (is_search == 1 && tree->value == search_val)
            fprintf(f, "T -> \"%d \";\n", tree->right->value);
        else if (is_search == 1 && tree->right->value == search_val)
            fprintf(f, "\"%d \" -> T;\n", tree->value);
        else
            fprintf(f, "\"%d \" -> \"%d \";\n", tree->value, tree->right->value);
    }
}
