from random import *
import __config__
import matrix


class Generate:

    _size = None
    _generated_matrix = None

    def __init__(self, size):
        self._size = size
        self._generate_matrix()

    def _generate_matrix(self):
        generated_matrix = []

        for check_row in range(self._size):
            generated_row = []

            for check_column in range(self._size):
                generated_row.append(randint(0, 100000))

            generated_matrix.append(generated_row)

        self._generated_matrix = matrix.Matrix(self._size, generated_matrix)

    def get_generated_matrix(self):
        return self._generated_matrix
