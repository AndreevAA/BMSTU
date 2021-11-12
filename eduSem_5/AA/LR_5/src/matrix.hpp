#ifndef MATRIX_HPP
#define MATRIX_HPP

#include <iostream>

class Matrix;

class Array
{
public:
    Array();
    explicit Array(unsigned size);
    Array(const Array& other);

    ~Array();

    void alloc(unsigned size);

    void read(std::istream& stream);
    void write(std::ostream& stream);
 
    int& operator[](unsigned i);

    friend class Matrix;

private:
    int *ptr;
    unsigned _size;
};

class Matrix
{
public:
    Matrix(unsigned rows, unsigned cols);
    explicit Matrix(std::istream& stream);
    Matrix(const Matrix &other);
    ~Matrix();

    void read(std::istream& stream);
    void write(std::ostream& stream);

    void randomize(int min, int max);

    Matrix& operator=(Matrix &other);

    bool operator==(const Matrix &other);
    bool operator!=(const Matrix &other);

    unsigned get_rows();
    unsigned get_cols();
    Array& operator[] (unsigned i);

private:
    Array *ptr;
    unsigned _rows;
    unsigned _cols;
};

#endif
