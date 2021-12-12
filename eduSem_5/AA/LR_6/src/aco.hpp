#ifndef ACO_HPP
#define ACO_HPP

#include <vector>
#include <cstddef>
#include "graph.hpp"

class Ant
{
public:
    explicit Ant(size_t graph_size);

    size_t path_len;
    std::vector<bool> visited;
    std::vector<size_t> path;
    
    void visit_city(const size_t city, const size_t cur_path_len,
        const size_t cur_path_dist);
    void clear_visits();
    void make_default_path();
    bool is_visited(const size_t city) const;
};


class ACO
{
private:
    const std::vector<std::vector<int>> dist_graph;
    const size_t cities_count;
    
    std::vector<std::vector<double>> pher_graph;
    std::vector<std::vector<double>> desire_graph;
    
    std::vector <Ant> ants;
    size_t ants_count;
    
    std::vector<double> paths_probs;
    
    double alpha = 0.5;
    double rho = 0.5;
    size_t tMax = 100;
    double beta = 1 - alpha;

    const double Q = 5;
    const double ants_factor = 1;
    const double init_pher_value = 1;
    
public:
    size_t min_len = 0;
    std::vector<size_t> min_path;
    
    explicit ACO(const Graph<int>& graph);
    
    void execute();
    void change_params(double alpha, double rho, size_t tMax);
    
private:
    void make_default_state();
    void init_ants();
    void init_pher_graph();
    void pave_ants_paths();
    size_t get_next_city(const Ant& ant, const size_t cur_city);
    void update_min_path();
    void update_pheromones();
    void make_default_ants();
    size_t select_next_city();
    double get_sum_probabilities();
};

#endif