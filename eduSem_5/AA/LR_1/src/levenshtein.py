from functools import lru_cache

import self as self

import config


# Объект алгоритма Левенштейна
class Levenshtein:
    # Защищенные наследуемые данные объекта
    _first_string = None
    _second_string = None

    # Ключевое расстояние
    _distance = None

    # Создание объекта
    def __init__(self, first_string, second_string):
        # Назаначение данных объекта
        self._first_string = first_string
        self._second_string = second_string

        # Установка значения расстояния
        self._distance = config.START_ZERO_VALUE

    # Общая функция получения расстояния между двумя строками
    def get_distance(self):
        return self._distance

    # Получение расстояния между строками
    def _recursive_get_distance(self, first_string_length, second_string_length):

        # если одна из строк пустая, то расстояние до другой строки - ее длина
        # т.е. n вставок
        if first_string_length == 0 or second_string_length == 0:
            return max(first_string_length, second_string_length)

        # если оба последних символов одинаковые, то съедаем их оба, не меняя расстояние
        elif self._first_string[first_string_length - 1] == self._second_string[second_string_length - 1]:
            return self._recursive_get_distance(first_string_length - 1, second_string_length - 1)

        # выбор минимального значения из трех
        else:
            return 1 + min(
                self._recursive_get_distance(first_string_length, second_string_length - 1),  # Удаление
                self._recursive_get_distance(first_string_length - 1, second_string_length),  # Вставка
                self._recursive_get_distance(first_string_length - 1, second_string_length - 1)  # Замена
            )


# Наследуемый объект Рекурсивного алгоритма без кэша
class LevenshteinRecursiveWithoutCache(Levenshtein):

    # Общая функция получения расстояния между двумя строками
    def get_distance(self):
        self._distance = self._recursive_get_distance(len(self._first_string), len(self._second_string))
        return self._distance


# Наследуемый объект Рекурсивного алгоритма с кэшем
class LevenshteinRecursiveWithCache(Levenshtein):
    _first_string_length = None
    _second_string_length = None

    def __init__(self, first_string, second_string):
        super().__init__(first_string, second_string)

        self._first_string_length = len(self._first_string)
        self._second_string_length = len(self._second_string)

    def get_distance(self):
        # Общая функция получения расстояния между двумя строками
        @lru_cache(maxsize=self._first_string_length * self._second_string_length)
        def get_distance():
            self._distance = self._recursive_get_distance(len(self._first_string), len(self._second_string))
            return self._distance

        return get_distance()


# Объект вычисления Дамерау_Левенштейна
class DamerauLevenshtein(Levenshtein):
    # Используемые блины строк
    _first_string_length = None
    _second_string_length = None

    def __init__(self, first_string, second_string):
        super().__init__(first_string, second_string)

        self._first_string_length = len(self._first_string)
        self._second_string_length = len(self._second_string)

    # Получение расстояния мужду двумя строками
    def get_distance(self):
        d = {}

        for i in range(-1, self._first_string_length + 1):
            d[(i, -1)] = i + 1
        for j in range(-1, self._second_string_length + 1):
            d[(-1, j)] = j + 1

        for i in range(self._first_string_length):
            for j in range(self._second_string_length):
                if self._first_string[i] == self._second_string[j]:
                    cost = 0
                else:
                    cost = 1
                d[(i, j)] = min(
                    d[(i - 1, j)] + 1,  # deletion
                    d[(i, j - 1)] + 1,  # insertion
                    d[(i - 1, j - 1)] + cost,  # substitution
                )
                if i and j and self._first_string[i] == self._second_string[j - 1] and \
                        self._first_string[i - 1] == self._second_string[j]:
                    d[(i, j)] = min(d[(i, j)], d[i - 2, j - 2] + cost)  # transposition

        return d[self._first_string_length - 1, self._second_string_length - 1]
