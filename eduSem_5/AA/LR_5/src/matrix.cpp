#include "matrix.hpp"
#include <iostream>
#include <cstdlib>

///////////////////////////////////////////////
///             ARRAY                       ///
///////////////////////////////////////////////

Array::Array()
{
    _size = 0;
    ptr = nullptr;
}


Array::Array(unsigned size)
{
    _size = size;
    ptr = new int[_size];
    for (unsigned i = 0; i < _size; i++)
        ptr[i] = 0;
}

/*Array::Array(const Array& other)
{
    _size = other._size;
    ptr = new int[_size];
    for (unsigned i = 0; i < _size; i++)
        ptr[i] = other.ptr[i];
}*/

Array::~Array()
{
    delete [] ptr;
}

void Array::alloc(unsigned size)
{
    if (!ptr && !_size)
    {
        _size = size;
        ptr = new int[_size];
        for (unsigned i = 0; i < _size; i++)
            ptr[i] = 0;
    }
}

void Array::read(std::istream& stream)
{
    for (unsigned i = 0; i < _size; i++)
        stream >> ptr[i];
}

void Array::write(std::ostream& stream)
{
    for (unsigned i = 0; i < _size; i++)
        stream << ptr[i] << ' ';
}

int& Array::operator[](unsigned i)
{
    return ptr[i];
}

///////////////////////////////////////////////
///             MATRIX                      ///
///////////////////////////////////////////////


Matrix::Matrix(unsigned rows, unsigned cols)
{
    _rows = rows;
    _cols = cols;

    ptr = new Array[_rows];
    for (unsigned i = 0; i < _rows; i++)
        ptr[i].alloc(_cols);
}

Matrix::Matrix(std::istream& stream)
{
    stream >> _rows;
    stream >> _cols;

    ptr = new Array[_rows];

    for (unsigned i = 0; i < _rows; i++)
    {
        ptr[i].alloc(_cols);
        ptr[i].read(stream);
    }
}

Matrix::Matrix(const Matrix &other)
{
    _rows = other._rows;
    _cols = other._cols;

    ptr = new Array[_rows];
    for (unsigned i = 0; i < _rows; i++)
    {
        ptr[i].alloc(_cols);
        for (unsigned j = 0; j < _cols; j++)
            ptr[i][j] = other.ptr[i][j];
    }
}

Matrix::~Matrix()
{
    delete [] ptr;
}

void Matrix::read(std::istream& stream)
{
    for (unsigned i = 0; i < _rows; i++)
        ptr[i].read(stream);
}

void Matrix::write(std::ostream& stream)
{
    for (unsigned i = 0; i < _rows; i++)
    {
        ptr[i].write(stream);
        stream << std::endl;
    }
}

void Matrix::randomize(int min, int max)
{
    for (unsigned i = 0; i < _rows; i++)
        for (unsigned j = 0; j < _cols; j++)
            ptr[i][j] = rand() % (max - min + 1) + min;
}

Matrix& Matrix::operator=(Matrix &other)
{
    if (this == &other)
        return *this;

    _rows = other._rows;
    _cols = other._cols;

    if (ptr)
        delete [] ptr;

    ptr = new Array[_rows];
    for (unsigned i = 0; i < _rows; i++)
    {
        ptr[i].alloc(_cols);
        for (unsigned j = 0; j < _cols; j++)
            ptr[i][j] = other.ptr[i][j];
    }
    
    return *this;
}

bool Matrix::operator==(const Matrix &other)
{
    if ((*this)._rows != other._rows || (*this)._cols != other._cols)
        return false;

    for (unsigned i = 0; i < _rows; i++)
        for (unsigned j = 0; j < _cols; j++)
            if ((*this).ptr[i][j] != other.ptr[i][j])
                return false;
    return true;
}

bool Matrix::operator!=(const Matrix &other)
{
    return !((*this) == other);
}

/*unsigned Matrix::get_rows()
{
    return _rows;
}

unsigned Matrix::get_cols()
{
    return _cols;
}*/

Array& Matrix::operator[](unsigned i)
{
    return ptr[i];
}
