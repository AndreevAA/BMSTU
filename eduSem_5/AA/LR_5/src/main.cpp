#include <iostream>
#include <cstdlib>
#include <ctime>

#include "matrix.hpp"
#include "mamult.hpp"

int main(int argc, char **argv)
{
    srand(time(NULL));

    if (argc == 2 && std::string(argv[1]) == "-memcheck")
    {
        unsigned m = 10, n = 20, q = 30;

        Matrix A(m, n), B(n, q);
        A.randomize(-10, 10);
        B.randomize(-10, 10);

        Matrix C = multiply_vinograd_thread(A, B, 10);

        return 0;
    }

    unsigned m, n, q, thread_amount;
    std::cout << "Enter 3 size of matrices (M, N, Q): ";
    int i = 0;
    int a[3];
    while(i < 3)
    {
        std::cin >> a[i];
        i++;
    }
    m = a[0];
    n = a[1];
    q = a[2];

    std::cout << "Enter amount of threads: ";
    std::cin >> thread_amount;

    Matrix A(m, n), B(n, q);
    A.randomize(-10, 10);
    B.randomize(-10, 10);

    std::cout << std::endl;
    A.write(std::cout);
    std::cout << std::endl;
    B.write(std::cout);
    std::cout << std::endl;

    Matrix C = multiply_vinograd_thread(A, B, thread_amount);
    C.write(std::cout);
    std::cout << std::endl;

    Matrix D = multiply_vinograd_nothread(A, B);
    D.write(std::cout);
    std::cout << std::endl;

    return 0;
}
