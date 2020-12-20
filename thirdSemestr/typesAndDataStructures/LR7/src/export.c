#include "../inc/export.h"

// Вывод в файл и преодбразование в картинку
void export_to_dot(matrix *adjacency_matrix)
{
    FILE *f = fopen("output.gv", "w+");
    fprintf(f, "digraph %s {\n", "TREE");
    for (int i = 0; i < adjacency_matrix->num_of_points; i++)
        fprintf(f, "\"%d \"\n", i);

    for (int num_of_string = 0; num_of_string < adjacency_matrix->num_of_points; num_of_string++)
        for (int num_of_row = 0; num_of_row < adjacency_matrix->num_of_points; num_of_row++)
            if (num_of_string > num_of_row)
                if (adjacency_matrix->content[num_of_string][num_of_row] == 1)
                    fprintf(f, "\"%d \" -> \"%d \"[dir=both];\n", num_of_string, num_of_row);

    fprintf(f, "}\n");
    
    fclose(f);
    
    system("dot -Tpng ./output.gv -oGRAPH.png");
    system("open GRAPH.png");
    system("rm output.gv");
}

int used[200];

void is_any_way(int v, matrix *adjacency_matrix, int end, int *res)
{
    int i;
    used[v] = 1;
    //printf("Vertex %d is visited\n", v);
    if (v == end)
    {
        *res = SUCCESS_STATUS;
        return ;
    }
    else
    {
        for (i = 1; i <= adjacency_matrix->num_of_points; i++)
            if (adjacency_matrix->content[v][i] && !used[i]) 
                is_any_way(i, adjacency_matrix, end, res);
    }
}

int is_not_av_get_a_way(int start, matrix *adjacency_matrix, int end)
{
    int ans = ERROR_STATUS;
    for (int first_num_of_string = 0; first_num_of_string < adjacency_matrix->num_of_points - 2; first_num_of_string++)
    {
        for (int first_num_of_row = 0; first_num_of_row < adjacency_matrix->num_of_points - 2; first_num_of_row++)
        {
            if (first_num_of_row > first_num_of_string && adjacency_matrix->content[first_num_of_string][first_num_of_row] != 0)
            {
                for (int second_num_of_string = first_num_of_string; second_num_of_string < adjacency_matrix->num_of_points - 1; second_num_of_string++)
                {
                    for (int second_num_of_row = first_num_of_row; second_num_of_row < adjacency_matrix->num_of_points - 1; second_num_of_row++)
                    {
                        if (second_num_of_row > second_num_of_string && adjacency_matrix->content[second_num_of_string][second_num_of_row] != 0)
                        {
                            for (int third_num_of_string = second_num_of_string; third_num_of_string < adjacency_matrix->num_of_points; third_num_of_string++)
                            {
                                for (int third_num_of_row = second_num_of_row; third_num_of_row < adjacency_matrix->num_of_points; third_num_of_row++)
                                {
                                    if (third_num_of_row > third_num_of_string && adjacency_matrix->content[third_num_of_string][third_num_of_row] != 0)
                                    {
                                        if (first_num_of_string == second_num_of_string && first_num_of_row == second_num_of_row)
                                            continue;
                                        else if (third_num_of_string == second_num_of_string && third_num_of_row == second_num_of_row)
                                            continue;
                                        else if (third_num_of_string == first_num_of_string && third_num_of_row == first_num_of_row)
                                            continue;
                                        else
                                        {
                                            adjacency_matrix->content[first_num_of_string][first_num_of_row] = 0;
                                            adjacency_matrix->content[second_num_of_string][second_num_of_row] = 0;
                                            adjacency_matrix->content[third_num_of_string][third_num_of_row] = 0;

                                            adjacency_matrix->content[first_num_of_row][first_num_of_string] = 0;
                                            adjacency_matrix->content[second_num_of_row][second_num_of_string] = 0;
                                            adjacency_matrix->content[third_num_of_row][third_num_of_string] = 0;

                                            int res = ERROR_STATUS;
                                            is_any_way(start, adjacency_matrix, end, &res);
                                            if (res == ERROR_STATUS)
                                            {
                                                if (ans == ERROR_STATUS)
                                                    printf("✅ Такое возможно для этого можно удалить следующие пути: \n");
                                                printf("%d<->%d, %d<->%d, %d<->%d\n", first_num_of_string, first_num_of_row, second_num_of_string, second_num_of_row, third_num_of_string, third_num_of_row);
                                                ans = SUCCESS_STATUS;
                                            }

                                            for (int i = 0; i < 200; i++)
                                                used[i] = 0;

                                            adjacency_matrix->content[first_num_of_string][first_num_of_row] = 1;
                                            adjacency_matrix->content[second_num_of_string][second_num_of_row] = 1;
                                            adjacency_matrix->content[third_num_of_string][third_num_of_row] = 1;
                                            
                                            adjacency_matrix->content[first_num_of_row][first_num_of_string] = 1;
                                            adjacency_matrix->content[second_num_of_row][second_num_of_string] = 1;
                                            adjacency_matrix->content[third_num_of_row][third_num_of_string] = 1;
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (ans == ERROR_STATUS)
        printf("🚫 Даже при удалении трех путей путь остается...\n\n\n");
    return ans;
}
