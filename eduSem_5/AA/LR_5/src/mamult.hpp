#ifndef MAMULT_HPP
#define MAMULT_HPP

#include "matrix.hpp"

Matrix multiply_vinograd_thread(Matrix &A, Matrix &B, unsigned thread_amount);

Matrix multiply_vinograd_nothread(Matrix &A, Matrix &B);

#endif
