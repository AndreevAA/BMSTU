# Файл работы с матрицами

import __config__


# Базовый объект Матрица
class Matrix:
    # Общая матрица
    _size_of_matrix = None
    _matrix = None

    # Инициализация объекта
    def __init__(self, size_of_matrix, matrix):
        # Установка параметров
        self._size_of_matrix = size_of_matrix
        self._matrix = matrix

    def update_matrix_value(self, row, column, value):
        self._matrix[row][column] = value

    def get_matrix_value(self, row, column):
        return self._matrix[row][column]

    def get_size_of_matrix(self):
        return self._size_of_matrix

    def get_matrix(self):
        return self._matrix

    def print_matrix(self):
        for check_row in self._matrix:
            print(*check_row)
