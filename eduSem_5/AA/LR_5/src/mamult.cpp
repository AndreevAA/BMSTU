#include <vector>
#include <thread>
#include <pthread.h>

#include "mamult.hpp"

#define ERROR_CREATE_THREAD -1
#define ERROR_JOIN_THREAD -2

typedef struct MultArgs_t
{
    Matrix &A;
    Matrix &B;
    Matrix &C;
    int *MulH;
    int *MulV;
    unsigned half_N;
    unsigned N_minus_1;

    unsigned start_i;
    unsigned end_i;
} MultArgs;

typedef struct InitVectorArgs_t
{
    int **MVector;
    Matrix &A;
    unsigned half_N;
} InitVectorArgs;

void *init_MultH(void *_args)
{
    InitVectorArgs *args = (InitVectorArgs*) _args;

    const unsigned M = args->A.get_rows();
    *(args->MVector) = new int[M];
    for (unsigned i = 0; i < M; i++)
    {
        (*(args->MVector))[i] = 0;
        for (unsigned k = 0; k < args->half_N; k++)
        {
            k <<= 1;
            (*(args->MVector))[i] += args->A[i][k] * args->A[i][k + 1];
        }
    }
    return NULL;
}

void *init_MultV(void *_args)
{
    InitVectorArgs *args = (InitVectorArgs*) _args;

    const unsigned Q = args->A.get_cols();
    *(args->MVector) = new int[Q];
    for (unsigned j = 0; j < Q; j++)
    {
        (*(args->MVector))[j] = 0;
        for (unsigned k = 0; k < args->half_N; k++)
        {
            k <<= 1;
            (*(args->MVector))[j] += args->A[k][j] * args->A[k + 1][j];
        }
    }
    return NULL;
}

void *multiply_odd(void *_args)
{
    MultArgs *args = (MultArgs*) _args;
    const unsigned Q = args->B.get_cols();

    for (unsigned i = args->start_i; i < args->end_i; i++)
        for (unsigned j = 0; j < Q; j++)
        {
            args->C[i][j] = args->A[i][args->N_minus_1] *
                            args->B[args->N_minus_1][j]
                            - args->MulH[i] - args->MulV[j];
            for (unsigned k = 0; k < args->half_N; k++)
            {
                k <<= 1;
                args->C[i][j] += (args->A[i][k] + args->B[k + 1][j]) *
                                (args->A[i][k + 1] + args->B[k][j]);
            }
        }
    
    return NULL;
}

void *multiply_even(void *_args)
{
    MultArgs *args = (MultArgs*) _args;
    const unsigned Q = args->B.get_cols();

    for (unsigned i = args->start_i; i < args->end_i; i++)
        for (unsigned j = 0; j < Q; j++)
        {
            args->C[i][j] = -args->MulH[i] - args->MulV[j];
            for (unsigned k = 0; k < args->half_N; k++)
            {
                k <<= 1;
                args->C[i][j] += (args->A[i][k] + args->B[k + 1][j]) *
                                    (args->A[i][k + 1] + args->B[k][j]);
            }
        }

    return NULL;
}

Matrix multiply_vinograd_thread(Matrix &A, Matrix &B, unsigned thread_amount)
{
    int status, status_addr;
    pthread_t thr_MulH, thr_MulV;
    pthread_t *threads = new pthread_t[thread_amount];

    const unsigned M = A.get_rows();
    const unsigned N = A.get_cols();
    const unsigned Q = B.get_cols();

    Matrix C(M, Q);

    unsigned half_N = N >> 1;

    int *MulH = nullptr, *MulV = nullptr;
    InitVectorArgs argsH = { &MulH, A, half_N };
    InitVectorArgs argsV = { &MulV, B, half_N };

    status = pthread_create(&thr_MulH, NULL, init_MultH, (void*) &argsH);
    if (status)
    {
        printf("Can't create thread for MulH, status = %d\n", status);
        exit(ERROR_CREATE_THREAD);
    }
    status = pthread_create(&thr_MulV, NULL, init_MultV, (void*) &argsV);
    if (status)
    {
        printf("Can't create thread for MulV, status = %d\n", status);
        exit(ERROR_CREATE_THREAD);
    }

    status = pthread_join(thr_MulH, (void**)&status_addr);
    if (status)
    {
        printf("Can't join thread thr_MulH, status = %d\n", status);
        exit(ERROR_JOIN_THREAD);
    }
    status = pthread_join(thr_MulV, (void**)&status_addr);
    if (status)
    {
        printf("Can't join thread thr_MulV, status = %d\n", status);
        exit(ERROR_JOIN_THREAD);
    }

    float step_i = M / float(thread_amount), value_i = step_i;
    unsigned start_i = 0, end_i = unsigned(value_i);

    std::vector<MultArgs> args;
    for (unsigned i = 0; i < thread_amount; i++)
    {
        MultArgs tempArg = {A, B, C, MulH, MulV, half_N, N - 1, start_i, end_i};
        args.push_back(tempArg);
        start_i = end_i;
        value_i += step_i;
        end_i = unsigned(value_i);
    }

    void* (*thread_func)(void*) = multiply_even;
    if (N % 2)
        thread_func = multiply_odd;
    
    for (unsigned i = 0; i < thread_amount; i++)
    {
		status = pthread_create(&(threads[i]), NULL, thread_func,
                                (void*) &args[i]);
		if (status)
        {
			printf("Can't create thread %u, status = %d\n", i, status);
			exit(ERROR_CREATE_THREAD);
	    }
    }

    for (unsigned i = 0; i < thread_amount; i++)
    {
		status = pthread_join(threads[i], (void**)&status_addr);
		if (status)
        {
			printf("Can't join thread %u, status = %d\n", i, status);
			exit(ERROR_JOIN_THREAD);
		}
	}

    delete [] MulH;
    delete [] MulV;
    delete [] threads;

    return C;
}

Matrix multiply_vinograd_nothread(Matrix &A, Matrix &B)
{
    const unsigned M = A.get_rows();
    const unsigned N = A.get_cols();
    const unsigned Q = B.get_cols();

    Matrix C(M, Q);

    unsigned half_N = N >> 1;

    int *MulH = new int[M];
    for (unsigned i = 0; i < M; i++)
    {
        MulH[i] = 0;
        for (unsigned k = 0; k < half_N; k++)
        {
            k <<= 1;
            MulH[i] += A[i][k] * A[i][k + 1];
        }
    }

    int *MulV = new int[Q];
    for (unsigned i = 0; i < Q; i++)
    {
        MulV[i] = 0;
        for (unsigned k = 0; k < half_N; k++)
        {
            k <<= 1;
            MulV[i] += B[k][i] * B[k + 1][i];
        }
    }

    if (N % 2)
    {
        unsigned N_minus_1 = N - 1;
        for (unsigned i = 0; i < M; i++)
            for (unsigned j = 0; j < Q; j++)
            {
                C[i][j] = A[i][N_minus_1] * B[N_minus_1][j] -
                                MulH[i] - MulV[j];
                for (unsigned k = 0; k < half_N; k++)
                {
                    k <<= 1;
                    C[i][j] += (A[i][k] + B[k + 1][j]) * 
                                (A[i][k + 1] + B[k][j]);
                }
            }
    }
    else
    {
        for (unsigned i = 0; i < M; i++)
            for (unsigned j = 0; j < Q; j++)
            {
                C[i][j] = -MulH[i] - MulV[j];
                for (unsigned k = 0; k < half_N; k++)
                {
                    k <<= 1;
                    C[i][j] += (A[i][k] + B[k + 1][j]) * 
                                (A[i][k + 1] + B[k][j]);
                }
            }
    }

    delete [] MulH;
    delete [] MulV;

    return C;
}
