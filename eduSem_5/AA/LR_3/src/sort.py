# Модуль блока сортировок
from time import clock

import config


# Базовый класс сортировок
class Sort:
    # Затраченное время процессора на сортировку
    _time = None

    # Статус ошибки сортировки
    _status = None

    # Защищенные поля с наследуемым уровнем доступа
    _number_of_elements = None
    _elements = None

    # Инициализация базового класса сортировки
    def __init__(self, number_of_elements, elements):
        #  Назначение защищенных полей
        self._number_of_elements = number_of_elements
        self._elements = elements
        self._time = config.START_TIME_ZERO_VALUE

        # Назначение статуса сортировки
        self._status = self._is_input_data_correct()

    # Общая функция сортировки
    def sort(self):

        # Базовый класс не имеет возможности сортировки
        self._status = config.ERROR_STATUS

    # Верификация вводимых на сортивроку данных
    def _is_input_data_correct(self):
        status = config.SUCCESS_STATUS

        # Проверка заявленных размеров массива
        if len(self._elements) != self._number_of_elements:
            status = config.ERROR_STATUS

        return status

    # Проверка на существующую отсортированность
    def is_already_sorted(self):
        is_already_sorted_status = config.ERROR_STATUS

        if self._status == config.SUCCESS_STATUS:
            if self._number_of_elements == config.ONE_ELEMENT:
                is_already_sorted_status = config.SUCCESS_STATUS

            for number_of_checked_symbols in range(self._number_of_elements - 1):
                if self._elements[number_of_checked_symbols + 1] < self._elements[number_of_checked_symbols]:
                    return is_already_sorted_status

            is_already_sorted_status = config.SUCCESS_STATUS

        return is_already_sorted_status

    # Получение статуса сортировки
    def get_status(self):
        return self._status

    # Получение количества элементов
    def get_number_of_elements(self):
        if self._status == config.SUCCESS_STATUS:
            return self._number_of_elements
        return config.ZERO_ELEMENTS

    # Получение массива элементов
    def get_elements(self):
        if self._status == config.SUCCESS_STATUS:
            return self._elements
        return config.ZERO_ELEMENTS

    # Получение времение выполенения сортировки
    def get_time(self):
        return self._time


# Наследуемый объект сортировки Пузырьком
class BubbleSort(Sort):
    _temp_number_of_elements = None
    _temp_elements = None

    def sort(self):
        if self._status == config.SUCCESS_STATUS:
            self._sort_proc()

    def _swap(self, first_element_position, second_element_position):

        # Меняемое значение подвешено
        temp_element = self._temp_elements[first_element_position]

        # Непосредственная смена позиций
        self._temp_elements[first_element_position] = self._temp_elements[second_element_position]
        self._temp_elements[second_element_position] = temp_element

    def _sort_proc(self):
        # Установка условно виртуальных переменных
        self._temp_number_of_elements = self._number_of_elements
        self._temp_elements = self._elements

        while self.is_already_sorted() != config.SUCCESS_STATUS:
            for number_of_checked_elements in range(self._temp_number_of_elements - 1):
                if self._temp_elements[number_of_checked_elements] > self._temp_elements[
                    number_of_checked_elements + 1]:
                    self._swap(number_of_checked_elements, number_of_checked_elements + 1)

        # Обратный переход от виртуальных адресов к реальным
        self._elements = self._temp_elements

    def get_time(self):
        t_0 = clock()
        self.sort()
        t_1 = clock()

        self._time = t_1 - t_0

        return self._time


# Наследуемый объект Сортировки вставками
class SelectionSort(Sort):
    _temp_number_of_elements = None
    _temp_elements = None

    def sort(self):
        self._temp_number_of_elements = self._number_of_elements
        self._temp_elements = self._elements

        if self._status == config.SUCCESS_STATUS:
            self._sort_proc(self._temp_elements)

    def _sort_proc(self, _temp_elements):

        if self.is_already_sorted != config.SUCCESS_STATUS:
            number_of_checked_elements = 0
            while number_of_checked_elements < self._temp_number_of_elements - 1:
                first_element = number_of_checked_elements
                second_element = first_element + 1
                while second_element < self._number_of_elements:
                    if self._temp_elements[second_element] < self._temp_elements[first_element]:
                        first_element = second_element
                    second_element += 1

                self._temp_elements[number_of_checked_elements], self._temp_elements[first_element] = self._temp_elements[
                                                                                              first_element], \
                                                                                          self._temp_elements[
                                                                                              number_of_checked_elements]

                number_of_checked_elements += 1

        self._elements = self._temp_elements

    def _swap(self, first_element_position, second_element_position):

        # Меняемое значение подвешено
        temp_element = self._temp_elements[first_element_position]

        # Непосредственная смена позиций
        self._temp_elements[first_element_position] = self._temp_elements[second_element_position]
        self._temp_elements[second_element_position] = temp_element

    def get_time(self):
        t_0 = clock()
        self.sort()
        t_1 = clock()

        self._time = t_1 - t_0

        return self._time


# Наследуемый объект сортировки вставками
class InsertionSort(Sort):
    _temp_number_of_elements = None
    _temp_elements = None

    def sort(self):
        if self._status == config.SUCCESS_STATUS:
            self._sort_proc()

    def _swap(self, first_element_position, second_element_position):

        # Меняемое значение подвешено
        temp_element = self._temp_elements[first_element_position]

        # Непосредственная смена позиций
        self._temp_elements[first_element_position] = self._temp_elements[second_element_position]
        self._temp_elements[second_element_position] = temp_element

    def _sort_proc(self):
        # Установка условно виртуальных переменных
        self._temp_number_of_elements = self._number_of_elements
        self._temp_elements = self._elements

        # Проверка на наличие отсортированности массива
        if self.is_already_sorted() != config.SUCCESS_STATUS:

            # Рзабиваем исходный массив на отсортированный подмассив и неотсортированный
            for number_of_checked_elements in range(1, self._temp_number_of_elements):
                key = self._temp_elements[number_of_checked_elements]
                previous_to_check_element = number_of_checked_elements - 1

                # Выполняем вставку путем перемещения элемента внутри отсортированного подмассива
                while previous_to_check_element >= 0 and key < self._temp_number_of_elements[previous_to_check_element]:
                    self._temp_number_of_elements[previous_to_check_element + 1] = self._temp_number_of_elements[
                        previous_to_check_element]
                    previous_to_check_element -= 1

        # Обратный переход от виртуальных адресов к реальным
        self._elements = self._temp_elements

    def get_time(self):
        t_0 = clock()
        self.sort()
        t_1 = clock()

        self._time = t_1 - t_0

        return self._time
