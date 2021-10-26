# Подключение системных блоков
import __config__

# Подключение функциональных блоков
import matrix, analitics
from threading import *


# Базовый объект Умножения матрицы
class MatrixMultiplication:
    # Приватные рабочие поля
    _first_matrix = None
    _second_matrix = None
    _result_matrix = None

    # Приватные поля сбора аналитики
    _processor_time = None

    # Создание объекта матрицы
    def __init__(self, first_matrix, second_matrix):
        # Установка введенных матриц
        self._first_matrix = first_matrix
        self._second_matrix = second_matrix

        # Установка полей сбора аналитики
        self._processor_time = analitics.ProcessorTime()

        # Конфигурационная настройка результирующей матрицы
        self._result_matrix = self._generate_result_matrix()

    # Получение умноженной матрицы
    def get_multiplied_matrix(self):
        return self._result_matrix

    # Общая функция инициализации результирующей матрицы
    def _generate_result_matrix(self):
        return matrix.Matrix(
            self._first_matrix.get_size_of_matrix(),
            [[0 for _ in range(self._first_matrix.get_size_of_matrix())]
             for _ in range(self._first_matrix.get_size_of_matrix())]
        )

    # Установка объекта результата умножения матрицы
    def _set_result_matrix(self, result_matrix):
        self._result_matrix = result_matrix

    # Установка объекта начала отсчета процессорного времени
    def _set_start_processor_time(self):
        return self._processor_time.set_start_processor_time()

    # Установка объекта конца отсчета процессорного времени
    def _set_end_processor_time(self):
        return self._processor_time.set_end_processor_time()

    # Получение результата вычисления процессорного времени
    def get_result_processor_time(self):
        return self._processor_time.get_result()


# Объект умножения матриц Копперсмитта-Винограда
class CoppersmittWinogradMultiplication(MatrixMultiplication):

    def multiply(self):

        # Установка отсечки времени
        self._set_start_processor_time()

        # Необходимые для вычислений данные
        _first_matrix_size, _second_matrix_size = self._first_matrix.get_size_of_matrix(), \
                                                  self._second_matrix.get_size_of_matrix()

        # Виртуальная результирующая матрица
        result_matrix = self._generate_result_matrix()

        _mul_h, _mul_v = [0 for _ in range(self._first_matrix.get_size_of_matrix())], \
                         [0 for _ in range(self._second_matrix.get_size_of_matrix())]

        for check_row in range(self._first_matrix.get_size_of_matrix()):
            for check_column in range(self._first_matrix.get_size_of_matrix() // 2):
                _mul_h[check_row] += self._first_matrix.get_matrix()[check_row][2 * check_column] * \
                                     self._first_matrix.get_matrix()[check_row][2 * check_column + 1]

        for check_row in range(self._second_matrix.get_size_of_matrix()):
            for check_column in range(self._second_matrix.get_size_of_matrix() // 2):
                _mul_v[check_row] += self._second_matrix.get_matrix()[check_row][2 * check_column] * \
                                     self._second_matrix.get_matrix()[check_row][2 * check_column + 1]

        for check_row in range(self._first_matrix.get_size_of_matrix()):
            for check_column in range(self._first_matrix.get_size_of_matrix()):
                result_matrix.update_matrix_value(check_row, check_column,
                                                  - _mul_h[check_row] - _mul_v[check_column]
                                                  )

                for k in range(self._first_matrix.get_size_of_matrix() // 2):
                    result_matrix.update_matrix_value(check_row, check_column,
                                                      result_matrix.get_matrix_value(check_row, check_column) +
                                                      self._first_matrix.get_matrix()[check_row][2 * k] +
                                                      self._second_matrix.get_matrix()[2 * k + 1][
                                                          check_column] * \
                                                        (
                                                                self._first_matrix.get_matrix()[check_row][
                                                                    2 * k + 1] +
                                                                self._second_matrix.get_matrix()[2 * k][
                                                                    check_column]
                                                        ))

        if self._second_matrix.get_size_of_matrix() % 2:
            for check_row in range(self._first_matrix.get_size_of_matrix()):
                for check_column in range(self._first_matrix.get_size_of_matrix()):
                    result_matrix.update_matrix_value(check_row, check_column,
                                                      result_matrix.get_matrix_value(check_row, check_column) +
                                                      self._first_matrix.get_matrix()[check_row][
                                                          self._first_matrix.get_size_of_matrix() - 1] *
                                                      self._second_matrix.get_matrix()[
                                                          self._second_matrix.get_size_of_matrix() - 1][check_column]
                                                      )

        # Установка отсечки времени
        self._set_end_processor_time()

        self._set_result_matrix(result_matrix)


# Объект умножения матриц Копперсмитта-Винограда
class CoppersmittWinogradMultiplicationParallel(MatrixMultiplication):

    _mul_h, _mul_v = None, None

    def _fill_h(self):
        for check_row in range(self._first_matrix.get_size_of_matrix()):
            for check_column in range(self._first_matrix.get_size_of_matrix() // 2):
                self._mul_h[check_row] += self._first_matrix.get_matrix()[check_row][2 * check_column] * \
                                     self._first_matrix.get_matrix()[check_row][2 * check_column + 1]

    def _fill_v(self):
        for check_row in range(self._second_matrix.get_size_of_matrix()):
            for check_column in range(self._second_matrix.get_size_of_matrix() // 2):
                self._mul_v[check_row] += self._second_matrix.get_matrix()[check_row][2 * check_column] * \
                                     self._second_matrix.get_matrix()[check_row][2 * check_column + 1]

    def multiply(self):

        # Установка отсечки времени
        self._set_start_processor_time()

        # Необходимые для вычислений данные
        _first_matrix_size, _second_matrix_size = self._first_matrix.get_size_of_matrix(), \
                                                  self._second_matrix.get_size_of_matrix()

        # Виртуальная результирующая матрица
        result_matrix = self._generate_result_matrix()

        self._mul_h, self._mul_v = [0 for _ in range(self._first_matrix.get_size_of_matrix())], \
                         [0 for _ in range(self._second_matrix.get_size_of_matrix())]

        # Поток заполенения по высоте
        _threat_filling_h = Thread(target=self._fill_h())

        # Поток заполнения по ширине
        _threat_filling_v = Thread(target=self._fill_v())

        # Запуск потоков заполнения
        _threat_filling_h.start()
        _threat_filling_v.start()

        for check_row in range(self._first_matrix.get_size_of_matrix()):
            for check_column in range(self._first_matrix.get_size_of_matrix()):
                result_matrix.update_matrix_value(check_row, check_column,
                                                  - self._mul_h[check_row] - self._mul_v[check_column]
                                                  )

                for k in range(self._first_matrix.get_size_of_matrix() // 2):
                    result_matrix.update_matrix_value(check_row, check_column,
                                                      result_matrix.get_matrix_value(check_row, check_column) +
                                                      self._first_matrix.get_matrix()[check_row][2 * k] +
                                                      self._second_matrix.get_matrix()[2 * k + 1][
                                                          check_column] * \
                                                        (
                                                                self._first_matrix.get_matrix()[check_row][
                                                                    2 * k + 1] +
                                                                self._second_matrix.get_matrix()[2 * k][
                                                                    check_column]
                                                        ))

        if self._second_matrix.get_size_of_matrix() % 2:
            for check_row in range(self._first_matrix.get_size_of_matrix()):
                for check_column in range(self._first_matrix.get_size_of_matrix()):
                    result_matrix.update_matrix_value(check_row, check_column,
                                                      result_matrix.get_matrix_value(check_row, check_column) +
                                                      self._first_matrix.get_matrix()[check_row][
                                                          self._first_matrix.get_size_of_matrix() - 1] *
                                                      self._second_matrix.get_matrix()[
                                                          self._second_matrix.get_size_of_matrix() - 1][check_column]
                                                      )

        # Установка отсечки времени
        self._set_end_processor_time()

        self._set_result_matrix(result_matrix)

