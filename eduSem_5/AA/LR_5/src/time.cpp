#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>

#include "matrix.hpp"
#include "mamult.hpp"

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

void time_measure(std::ofstream &file, unsigned start_size,
                    unsigned end_size, unsigned step)
{
    unsigned long long start_time = 0, end_time = 0;
    unsigned test_repeats = 100;
    file << "Size";
    for (unsigned threads = 2; threads <= 8; threads += 2)
        file << ";" << threads;
    file << ";NonParallel" << std::endl;

    for (unsigned size = start_size; size <= end_size; size += step)
    {
        file << size;
        for (unsigned threads = 2; threads <= 8; threads += 2)
        {
            unsigned long long result = 0;
            for (unsigned k = 0; k < test_repeats; k++)
            {
                Matrix A(size, size), B(size, size);
                A.randomize(-10, 10);
                B.randomize(-10, 10);

                start_time = rdtsc();
                Matrix C = multiply_vinograd_thread(A, B, threads);
                end_time = rdtsc();
                result += end_time - start_time;
            }
            result /= test_repeats;
            file << ";" << result;
        }
        
        unsigned long long result = 0;
        for (unsigned k = 0; k < test_repeats; k++)
        {
            Matrix A(size, size), B(size, size);
            A.randomize(-10, 10);
            B.randomize(-10, 10);

            start_time = rdtsc();
            Matrix C = multiply_vinograd_nothread(A, B);
            end_time = rdtsc();
            result += end_time - start_time;
        }
        result /= test_repeats;
        file << ";" << result << std::endl;
    }
}

int main(void)
{
    srand(time(NULL));

    std::ofstream csv_even("docs/TEvenTime.csv");
    if (!csv_even.is_open())
    {
        std::cout << "File open error!";
        return -1;
    }

    time_measure(csv_even, 100, 1000, 100);
    csv_even.close();

    std::ofstream csv_odd("docs/TOddTime.csv");
    if (!csv_odd.is_open())
    {
        std::cout << "File open error!";
        return -1;
    }

    time_measure(csv_odd, 101, 1010, 100);
    csv_odd.close();

    return 0;
}
