#include <iostream>
#include <cstdlib>
#include <vector>
#include <fstream>
#include <ctime>

#include "bf.hpp"
#include "aco.hpp"

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

int main()
{
    srand(time(0));

    Graph<int> graph(10);
    graph.randomize();
    graph.show();
    
    size_t path_len_BF;
    std::vector<size_t> path_BF;
    
    BruteForce alg_BF(graph);
    alg_BF.execute();
    path_len_BF = alg_BF.min_len;
    path_BF = alg_BF.min_path;
    
    std::cout << path_len_BF << std::endl;
    
    size_t path_len_ACO;
    std::vector<size_t> path_ACO;
    ACO alg_ACO(graph);
    
    std::ofstream fout;
    fout.open("report/result.csv");
    fout << "Alpha;Rho;tMax;MinPath" <<std::endl;
    
    //size_t start = 0, end = 0;
    size_t repeats = 1;
    
    for (double alpha = 0; alpha <= 1; alpha += 0.25)
        for (double rho = 0; rho <= 1; rho += 0.25)
            for (size_t t = 100; t < 300; t += 100)
            {
                
                ACO alg_ACO(graph);
                alg_ACO.change_params(alpha, rho, t);
                
                //start = rdtsc();
                for (size_t i = 0; i < repeats; i++)
                    alg_ACO.execute();
                //end = rdtsc();
                
                path_len_ACO = alg_ACO.min_len;
                path_ACO = alg_ACO.min_path;
                
                fout << alpha << ";" << rho << ";" << t << ";";
                fout << path_len_ACO << std::endl;
            }
    
    fout.close();
    
    return 0;
}