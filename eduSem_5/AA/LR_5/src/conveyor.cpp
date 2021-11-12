#include "conveyor.hpp"

typedef struct args_t
{
    MatrixSet obj;
    std::queue<MatrixSet>& queue;
    size_t queue_num;
    std::mutex& mutex;
    bool log;
} par_args;

size_t Conveyor::get_time()
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::steady_clock::now().time_since_epoch()).count();
}

void Conveyor::log_print_obj_queue(MatrixSet& obj, size_t qu)
{
    std::cout << "Object #" << obj.index <<  " , queue #" << qu << ": ";
}

void Conveyor::log_print_start(MatrixSet& obj, size_t qu, size_t time)
{
    log_print_obj_queue(obj, qu);
    std::cout << ": START - " << time << std::endl;
}

void Conveyor::log_print_end(MatrixSet& obj, size_t qu, size_t time)
{
    log_print_obj_queue(obj, qu);
    std::cout << ": END - " << time << std::endl;
}

void Conveyor::log_print_time(MatrixSet& obj, size_t qu, size_t time)
{
    log_print_obj_queue(obj, qu);
    std::cout << ": TIME - " << time << std::endl;
}

void Conveyor::do_linear_work1(MatrixSet& obj, size_t queue, bool log)
{
    size_t start = get_time();
    if (log)
        log_print_start(obj, queue, start);
    obj.sum(0, obj.size / 3);
    size_t end = get_time();
    if (log)
    {
        log_print_end(obj, queue, end);
        log_print_time(obj, queue, end - start);
    }
}

void Conveyor::do_linear_work2(MatrixSet& obj, size_t queue, bool log)
{
    size_t start = get_time();
    if (log)
        log_print_start(obj, queue, start);
    obj.sum(obj.size / 3, 2 * obj.size / 3);
    size_t end = get_time();
    if (log)
    {
        log_print_end(obj, queue, end);
        log_print_time(obj, queue, end - start);
    }
}

void Conveyor::do_linear_work3(MatrixSet& obj, size_t queue, bool log)
{
    size_t start = get_time();
    if (log)
        log_print_start(obj, queue, start);
    obj.sum(2 * obj.size / 3, obj.size);
    size_t end = get_time();
    if (log)
    {
        log_print_end(obj, queue, end);
        log_print_time(obj, queue, end - start);
    }
}
    
void Conveyor::execute_linear()
{
    
    std::queue<MatrixSet> obj_generator;
    
    for (size_t i = 0; i < obj_count; i++)
        obj_generator.push(MatrixSet(i + 1, 1038, -200, 200));
    
    std::vector<MatrixSet> obj_pools;
    
    while (obj_pools.size() != obj_count)
    {
        MatrixSet obj = obj_generator.front();
        obj_generator.pop();
        
        for (size_t i = 0; i < queue_count; i++)
        {
            if (i == 0)
                do_linear_work1(obj, i);
            else if (i == 1)
                do_linear_work2(obj, i);
            else if (i >= 2)
                do_linear_work3(obj, i);
        }
        
        obj_pools.push_back(obj);
    }
}
    
void* Conveyor::do_parallel_work1(void *_args)
{
    par_args *args = (par_args*) _args;
    size_t start = get_time();
    
    args->obj.sum(0, args->obj.size / 3);
    
    args->mutex.lock();
    args->queue.push(args->obj);
    args->mutex.unlock();
    
    size_t end = get_time();
    if (args->log)
        log_print_time(args->obj, args->queue_num, end - start);
    time_stay_at_queue[args->queue_num + 1].push_back(-end);
    return NULL;
}

void* Conveyor::do_parallel_work2(void *_args)
{
    par_args *args = (par_args*) _args;
    size_t start = get_time();
    
    args->obj.sum(args->obj.size / 3, 2 * args->obj.size / 3);
    
    args->mutex.lock();
    args->queue.push(args->obj);
    args->mutex.unlock();
    
    size_t end = get_time();
    if (args->log)
        log_print_time(args->obj, args->queue_num, end - start);
    time_stay_at_queue[args->queue_num + 1].push_back(-end);
    return NULL;
}

void* Conveyor::do_parallel_work3(void *_args)
{
    par_args *args = (par_args*) _args;
    size_t start = get_time();
    
    args->obj.sum(2 * args->obj.size / 3, args->obj.size);
    
    args->mutex.lock();
    args->queue.push(args->obj);
    args->mutex.unlock();
    
    size_t end = get_time();
    if (args->log)
        log_print_time(args->obj, args->queue_num, end - start);
    time_stay_at_queue[args->queue_num + 1].push_back(-end);
    return NULL;
}
    
void Conveyor::execute_parallel()
{
    std::queue<MatrixSet> obj_generator;
    
    for (size_t i = 0; i < obj_count; i++)
        obj_generator.push(MatrixSet(i + 1, 1038, -200, 200));
    
    std::vector<MatrixSet> obj_pool;
    
    std::vector<std::thread> threads(3);
    std::vector<std::queue<MatrixSet> > queues(3);
    std::vector<std::mutex> mutexes(4);
    size_t prev_time = get_time() - delay_time;
    
    while (obj_pool.size() != obj_count)
    {
        size_t cur_time = get_time();
        
        if (!obj_generator.empty() && prev_time + delay_time < cur_time)
        {
            MatrixSet obj = obj_generator.front();
            obj_generator.pop();
            queues[0].push(obj);
            
            prev_time = get_time();
            time_stay_at_queue[0].push_back(-prev_time);
        }
        
        for (unsigned i = 0; i < queue_count; i++)
        {
            if (threads[i].joinable())
                threads[i].join();

            if (!queues[i].empty() && !threads[i].joinable())
            {
                mutexes[i].lock();
                MatrixSet obj = queues[i].front();
                queues[i].pop();
                mutexes[i].unlock();
                
                size_t start = get_time();
                size_t last = time_stay_at_queue[i].size() - 1;
                time_stay_at_queue[i][last] += start;

                par_args args1 = {
                    obj, std::ref(queues[i + 1]), i,
                    std::ref(mutexes[i + 1]), false
                };

                par_args args2 = {
                    obj, std::ref(queues[i + 1]), i,
                    std::ref(mutexes[i + 1]), false
                };
                
                if (i == 0)
                {
                    threads[i] = std::thread(&Conveyor::do_parallel_work1,
                        this, (void *) &args1);
                }
                else if (i == 1)
                    threads[i] = std::thread(&Conveyor::do_parallel_work2,
                        this, (void *) &args1);
                else if (i == queue_count - 1)
                    threads[i] = std::thread(&Conveyor::do_parallel_work3,
                        this, (void *) &args2);
            }
        }
    }
    
    for (size_t i = 0; i < queue_count; i++)
    {
        if (threads[i].joinable())
            threads[i].join();
    }
}