#ifndef GRAPH_HPP
#define GRAPH_HPP

#include <vector>
#include <cstdlib>
#include <iostream>
#include <cstddef>

template <typename T>
class Graph
{
public:
    std::vector<std::vector<T>> graph;
    size_t size;

    Graph() : size(0) {};
    explicit Graph(size_t n) : size(n) {};

    void randomize()
    {
        for (size_t i = 0; i < size; i++)
        {
            std::vector<T> line;
            for (size_t j = 0; j < size; j++)
                line.push_back((i == j) ? 0 : (rand() % 9 + 1));
            graph.push_back(line);
        }
    }

    void show()
    {
        if (graph.size() == 0)
        {
            std::cout << "This graph is empty.\n" << std::endl;
            return;
        }

        std::cout << std::endl;
        for (auto &line : graph)
        {
            for (auto &elem : line)
                std::cout << elem << " ";
            std::cout <<std::endl;
        }
        std::cout << std::endl;
    }
};

#endif
