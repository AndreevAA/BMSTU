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

    def _generate_result_matrix(self):
        return matrix.Matrix(
            self._first_matrix.get_size_of_matrix(),
            [[0 for _ in range(self._first_matrix.get_size_of_matrix())]
             for _ in range(self._first_matrix.get_size_of_matrix())]
        )


# Объект классического умножения матрицы
class ClassicalMultiplication(MatrixMultiplication):

    def get_multiplied_matrix(self):
        self._result_matrix = self._multiply()
        return self._result_matrix

    def _multiply(self):

        # Виртуальная результирующая матрица
        result_matrix = self._generate_result_matrix()

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

    def _multiply(self):

        # Необходимые для вычислений данные
        _first_matrix_size, _second_matrix_size = self._first_matrix.get_size_of_matrix(), \
                                                  self._second_matrix.get_size_of_matrix()

        # Виртуальная результирующая матрица
        result_matrix = self._generate_result_matrix()

        _mul_h, _mul_v = [0 for _ in range(self._first_matrix.get_size_of_matrix())], \
                       [0 for _ in range(self._second_matrix.get_size_of_matrix())]

        for check_row in range(self._first_matrix.get_size_of_matrix()):

            _mul_h[check_row] = sum(
                self._first_matrix.get_matrix_value()[check_row][2 * check_column] *
                self._first_matrix.get_matrix_value()[check_row][2 * check_column + 1]
                for check_column in range(self._first_matrix.get_size_of_matrix() // 2)
            )

            _mul_v[check_row] = sum(
                self._second_matrix.get_matrix_value()[check_row][2 * check_column] *
                self._second_matrix.get_matrix_value()[check_row][2 * check_column + 1]
                for check_column in range(self._second_matrix.get_size_of_matrix() // 2)
            )

        for check_row in range(self._first_matrix.get_size_of_matrix()):
            for check_column in range(self._first_matrix.get_size_of_matrix()):
                result_matrix.update_matrix_value(check_row, check_column,
                                                  sum(
                                                      (self._first_matrix.get_matrix_value()[check_row][2 * k] +
                                                       self._second_matrix.get_matrix_value[2 * k + 1][
                                                           check_column]) * (
                                                                  self._first_matrix.get_matrix_value[check_row][
                                                                      2 * k + 1] +
                                                                  self._second_matrix.get_matrix_value[2 * k][
                                                                      check_column])
                                                      for k in range(self._first_matrix.get_size_of_matrix() // 2)) \
                                                  - _mul_h[check_row] - _mul_v[check_column]
                                                  )

        return result_matrix

        