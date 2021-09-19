# Модуль блока сортировок

import config


# Базовый класс сортировок
class Sort:
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

        # Назначение статуса сортировки
        self._status = self._is_input_data_correct()

    # Верификация вводимых на сортивроку данных
    def _is_input_data_correct(self):
        status = config.SUCCESS_STATUS

        if len(self._elements) != self._number_of_elements:
            status = config.ERROR_STATUS

        return status