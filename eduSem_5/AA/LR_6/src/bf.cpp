#include "bf.hpp"

BruteForce::BruteForce(const Graph<int>& graph) : graph(graph)
{
    for (size_t i = 0; i < graph.size; i++)
        visited.push_back(false);
}
    
void BruteForce::execute()
{
    std::vector<size_t> path;
    for (size_t init_vert = 0; init_vert < graph.size; init_vert++)
        execute(init_vert, 0, path);
}
    
void BruteForce::execute(const size_t vert, size_t cur_len,
    std::vector<size_t>& cur_path)
{
    bool isThereNodes = false;
    visited[vert] = true;
    cur_path.push_back(vert);
    
    for (size_t i = 0; i < graph.size; i++)
    {
        if (visited[i] == false)
        {
            isThereNodes = true;
            execute(i, cur_len + graph.graph[vert][i], cur_path);
        }
    }
    
    if (isThereNodes == false)
    {
        cur_len += graph.graph[vert][vert];
        if (cur_len < min_len or min_len == 0)
        {
            min_len = cur_len;
            min_path = cur_path;
        }
    }
    
    cur_path.pop_back();
    visited[vert] = false;
}