import __config__
import matrix


# Базовый объект Умножения матрицы
class MatrixMultiplication:
    _first_matrix = None
    _second_matrix = None
    _result_matrix = None

    def __init__(self, first_matrix, second_matrix):
        self._first_matrix = first_matrix
        self._second_matrix = second_matrix

        self._result_matrix = __config__.EMPTY_LIST

    def get_multiplied_matrix(self):
        return self._result_matrix


# Объект классического умножения матрицы
class ClassicalMultiplication(MatrixMultiplication):

    def get_multiplied_matrix(self):
        self._result_matrix = self._multiply()
        return self._result_matrix

    def _multiply(self):

        # Виртуальная результирующая матрица
        result_matrix = matrix.Matrix(
            self._first_matrix.get_size_of_matrix(),
            [[0 for fill_row_cur in range(self._first_matrix.get_size_of_matrix())]
             for fill_column_cur in range(self._first_matrix.get_size_of_matrix())]
        )

        # Непоредственная операция умножения матрицы
        for check_row in range(result_matrix.get_size_of_matrix()):
            for check_column in range(result_matrix.get_size_of_matrix()):
                for check_par in range(result_matrix.get_size_of_matrix()):
                    result_matrix.update_matrix_value(check_row, check_column,
                                                      result_matrix.get_matrix_value(check_row, check_column) +
                                                      self._first_matrix.get_matrix_value(check_row, check_par) *
                                                      self._second_matrix.get_matrix_value(check_par, check_column))

        return result_matrix


# Объект умножения матриц Копперсмитта-Винограда
class CoppersmittWinogradMultiplication(MatrixMultiplication):

    def get_multiplied_matrix(self):
        self._result_matrix = self._multiply()
        return self._result_matrix

    def _multiplu(self):

        