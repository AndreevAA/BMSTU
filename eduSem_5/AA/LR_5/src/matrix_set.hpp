#ifndef MATRIX_POOL_HPP
#define MATRIX_POOL_HPP

#include "matrix.hpp"

struct matrix_type{
    int **matrix;
    unsigned n;
    unsigned m;
};

class MatrixSet
{
public:
    unsigned index;
    unsigned size;
    Matrix A, B, C;
    
    MatrixSet(unsigned ind, unsigned _size, int min=-10, int max=10) :
        index(ind), size(_size), A(size, size), B(size, size), C(size, size)
    {
        A.randomize(min, max);
        B.randomize(min, max);
    }

    void sum(unsigned start, unsigned end)
    {
        for (unsigned i = start; i < end; i++)
            for (unsigned j = 0; j < size; j++)
                C[i][j] = A[i][j] + B[i][j];
    }
};

#endif
