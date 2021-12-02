from random import *


# Объект словаря
class Dictionary:
    # Элементы словаря
    __dictionary = None

    # Инициализация объекта словаря
    def __init__(self):
        self.__dictionary = list()

    # Генерация элементов словаря
    def generate_elements(self, number_of_generating_elements, type_of_elements):
        # Виртуалиазация переменных
        _dictionary = list()

        for _dictionary_size in range(number_of_generating_elements):
            _dictionary.append({'number': _dictionary_size + 1,
                                'type': choice(type_of_elements)})

        # Возврат к реальным данных
        self.__dictionary = _dictionary

    @property
    def dict(self):
        return self.__dictionary

    @dict.setter
    def dict(self, value):
        self.__dictionary = value

    def dict_size(self):
        return len(self.dict)
