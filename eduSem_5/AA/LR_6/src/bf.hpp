#ifndef BF_HPP
#define BF_HPP

#include <vector>
#include <cstddef>
#include "graph.hpp"

class BruteForce
{
private:
    Graph<int> graph;
    std::vector<bool> visited;
    
public:
    size_t min_len = 0;
    std::vector<size_t> min_path;
    
    explicit BruteForce(const Graph<int>& graph);
    void execute();
    
private:
    void execute(const size_t vert, size_t cur_len,
        std::vector<size_t>& cur_path);
};

#endif