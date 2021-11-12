#include <cstdlib>
#include <iostream>
#include <chrono>

#include "conveyor.hpp"

int main(int argc, const char * argv[])
{
    srand(time(NULL));

    if (argc == 2 && std::string(argv[1]) == "-memcheck")
        return 0;

    int obj_count = 0;
    std::cin >> obj_count;
    if (obj_count < 2)
        return -1;

    Conveyor conveyor(obj_count, 3, 5);

    auto start = std::chrono::steady_clock::now();
    conveyor.execute_parallel();
    auto end = std::chrono::steady_clock::now();

    auto duration1 = std::chrono::duration_cast<std::chrono::milliseconds>(
        end - start);
    std::cout << "Parallel: " << duration1.count() << " msec" << std::endl;
    
    start = std::chrono::steady_clock::now();
    conveyor.execute_linear();
    end = std::chrono::steady_clock::now();
    
    auto duration2 = std::chrono::duration_cast<std::chrono::milliseconds>(
        end - start);
    std::cout << "Linear: " << duration2.count() << " msec" << std::endl;
    
    return 0;
}
