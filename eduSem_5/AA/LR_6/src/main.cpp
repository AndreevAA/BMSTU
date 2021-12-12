#include <iostream>
#include <cstdlib>
#include <vector>
#include <ctime>

#include "bf.hpp"
#include "aco.hpp"
#include "graph.hpp"

#ifdef _WIN32
#include <intrin.h>
uint64_t rdtsc() {
	return __rdtsc();
}
#else
uint64_t rdtsc() 
{
	unsigned int lo, hi;
	__asm__ __volatile__("rdtsc" : "=a" (lo), "=d" (hi));
	return ((uint64_t)hi << 32) | lo;
}
#endif

void path_show(const char* header, std::vector<size_t>& path,
    size_t path_len, size_t graph_size, size_t time)
{
    std::cout << header << ": [";
    for (size_t i = 0; i < graph_size; i++)
        std::cout << " " << path[i];
    std::cout << " ], " << path_len << ", time: " << time << std::endl;
}

int main(int argc, char **argv)
{
    srand(time(0));

    if (argc == 2 && std::string(argv[1]) == "-memcheck")
    {
        Graph<int> graph(10);
        graph.randomize();
        
        BruteForce alg_BF(graph);
        alg_BF.execute();
        
        ACO alg_ACO(graph);
        alg_ACO.execute();

        return 0;
    }

    Graph<int> graph;
    std::cout << "Input graph size: ";
    std::cin >> graph.size;
    
    if (graph.size <= 0)
    {
        std::cout << "Error: incorrect size.";
        return 1;
    }
    
    graph.randomize();
    graph.show();

    size_t start = 0,  end = 0;
    
    BruteForce alg_BF(graph);
    start = rdtsc();
    alg_BF.execute();
    end = rdtsc();
    path_show("Brute force", alg_BF.min_path, alg_BF.min_len,
        graph.size, end - start);
    
    ACO alg_ACO(graph);
    start = rdtsc();
    alg_ACO.execute();
    end = rdtsc();
    path_show("ACO", alg_ACO.min_path, alg_ACO.min_len,
        graph.size, end - start);

    return 0;
}
