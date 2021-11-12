#include <cstdlib>
#include <iostream>
#include <vector>
#include <thread>
#include <chrono>
#include <mutex>
#include <queue>

#include "matrix_set.hpp"

class Conveyor
{
private:
    size_t obj_count;
    size_t queue_count;
    size_t averege_time;
    const size_t delay_time = 3;
    std::vector<int> time_stay_at_queue[4];
    
public:
    Conveyor(size_t _objs, size_t _queues, size_t msec) :
        obj_count(_objs), queue_count(_queues), averege_time(msec) {}
    
    void execute_linear();
    void execute_parallel();
    
private:
    size_t get_time();

    void log_print_obj_queue(MatrixSet& obj, size_t qu);
    void log_print_start(MatrixSet& obj, size_t qu, size_t time);
    void log_print_end(MatrixSet& obj, size_t qu, size_t time);
    void log_print_time(MatrixSet& obj, size_t qu, size_t time);
    
    void do_linear_work1(MatrixSet& obj, size_t queue, bool log=true);
    void do_linear_work2(MatrixSet& obj, size_t queue, bool log=true);
    void do_linear_work3(MatrixSet& obj, size_t queue, bool log=true);

    void* do_parallel_work1(void *_args);
    void* do_parallel_work2(void *_args);
    void* do_parallel_work3(void *_args);
};