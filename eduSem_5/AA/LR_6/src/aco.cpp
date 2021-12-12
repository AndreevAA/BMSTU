#include <math.h>
#include "aco.hpp"

/// Ant
    
Ant::Ant(size_t graph_size) : path_len(0)
{
    for (size_t i = 0; i < graph_size; i++)
    {
        path.push_back(0);
        visited.push_back(false);
    }
}

void Ant::visit_city(const size_t city, const size_t cur_path_len,
    const size_t cur_path_dist)
{
    path_len += cur_path_dist;
    path[cur_path_len] = city;
    visited[city] = true;
}

void Ant::clear_visits()
{
    for (size_t i = 0; i < visited.size(); i++)
        visited[i] = false;
    path_len = 0;
}

void Ant::make_default_path()
{
    path_len = 0;
    visit_city(path[path.size() - 1], 0, 0);
}

bool Ant::is_visited(const size_t city) const
{
    return visited[city];
}


// ACO
  
ACO::ACO(const Graph<int>& graph) :
    dist_graph(graph.graph), cities_count(graph.size)
{
    // init pher_graph
    for (size_t i = 0; i < cities_count; i++)
    {
        std::vector<double> line;
        for (size_t j = 0; j < cities_count; j++)
            line.push_back(init_pher_value);
        pher_graph.push_back(line);
    }
    
    // init desire_graph
    for (size_t i = 0; i < cities_count; i++)
    {
        std::vector<double> line;
        for (size_t j = 0; j < cities_count; j++)
            line.push_back(dist_graph[i][j] == 0 ? 0 : 
                1.0 / dist_graph[i][j]);
        desire_graph.push_back(line);
    }
    
    // init ants_count
    ants_count = cities_count * ants_factor;
    for (size_t i = 0; i < ants_count; i++)
    {
        Ant ant(cities_count);
        ants.push_back(ant);
    }
    
    // init paths_probs
    for (size_t i = 0; i < cities_count; i++)
        paths_probs.push_back(0);
}

void ACO::execute()
{
    make_default_state();
    init_pher_graph();
    init_ants();
    
    for (size_t i = 0; i < tMax; i++)
    {
        pave_ants_paths();
        update_min_path();
        update_pheromones();
        make_default_ants();
    }
}

void ACO::change_params(double alpha, double rho, size_t tMax)
{
    this->alpha = alpha;
    this->beta = 1 - alpha;
    this->rho = rho;
    this->tMax = tMax;
}

void ACO::make_default_state()
{
    min_len = 0;
    min_path.clear();
}

void ACO::init_ants()
{
    for (size_t i = 0; i < ants_count; i++)
    {
        ants[i].clear_visits();
        ants[i].visit_city(rand() % cities_count, 0, 0);
    }
}

void ACO::init_pher_graph()
{
    for (size_t i = 0; i < cities_count; i++)
        for (size_t j = 0; j < cities_count; j++)
            pher_graph[i][j] = init_pher_value;
}

void ACO::pave_ants_paths()
{
    for (size_t i = 0; i < cities_count - 1; i++)
    {
        for (size_t j = 0; j < ants_count; j++)
        {
            const size_t cur_city = ants[j].path[i];
            const size_t next_city = get_next_city(ants[j], cur_city);
            const int dist = dist_graph[cur_city][next_city];
            
            ants[j].visit_city(next_city, i + 1, dist);
        }
    }
    
    for (size_t j = 0; j < ants_count; j++)
    {
        size_t i_ind = ants[j].path[ants[j].path.size() - 1];
        size_t j_ind = ants[j].path[0];
        const int dist_init_city = dist_graph[i_ind][j_ind];
        ants[j].path_len += dist_init_city;
    }
}

size_t ACO::get_next_city(const Ant& ant, const size_t cur_city)
{
    double sumP = 0;
    
    for (size_t i = 0; i < cities_count; i++)
    {
        double pher_factor = pow(pher_graph[cur_city][i], alpha);
        double desire_factor = pow(desire_graph[cur_city][i], beta);
        sumP += pher_factor * desire_factor;
    }
    
    for (size_t i = 0; i < cities_count; i++)
    {
        if (i == cur_city || ant.is_visited(i))
            paths_probs[i] = 0;
        else
        {
            double pher_factor = pow(pher_graph[cur_city][i], alpha);
            double desire_factor = pow(desire_graph[cur_city][i], beta);
            paths_probs[i] = pher_factor * desire_factor / sumP;
        }
    }

    return select_next_city();
}

void ACO::update_min_path()
{
    for (size_t i = 0; i < ants_count; i++)
    {
        const size_t cur_len = ants[i].path_len;
        if (cur_len < min_len || min_len == 0)
        {
            min_len = cur_len;
            min_path = ants[i].path;
        }
    }
}

void ACO::update_pheromones()
{
    for (size_t i = 0; i < cities_count; i++)
        for (size_t j = 0; j < cities_count; j++)
            pher_graph[i][j] *= (1 - rho);
    
    for (size_t i = 0; i < ants_count; i++)
    {
        Ant& ant = ants[i];

        double dt = Q / ant.path_len;
        for (size_t j = 0; j < cities_count - 1; j++)
            pher_graph[ant.path[j]][ant.path[j + 1]] += dt;
        pher_graph[ant.path[cities_count - 1]][ant.path[0]] += dt;
    }
}

void ACO::make_default_ants()
{
    for (size_t i = 0; i < ants_count; i++)
    {
        ants[i].clear_visits();
        ants[i].make_default_path();
    }
}

size_t ACO::select_next_city()
{
    double sum_probabilities = get_sum_probabilities();
    double rand_num = ((double) rand() / (RAND_MAX)) * sum_probabilities;
    double total = 0;
    size_t city = 0;
    
    for (size_t i = 0; i < cities_count && total < rand_num; i++)
    {
        total += paths_probs[i];
        if (total >= rand_num)
            city = i;
    }
    
    return city;
}

double ACO::get_sum_probabilities()
{
    double sum_probabilities = 0;
    for (size_t i = 0; i < cities_count; i++)
        sum_probabilities += paths_probs[i];
    return sum_probabilities;
}