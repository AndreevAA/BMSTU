from random import randint

import config

# Объект генерации данных для сортировки
import sort


class Generate:
    _list_sizes = None
    _list_data_of_speed = list()
    _alg_type = None
    _data_type = None

    def __init__(self, list_sizes, alg_type, data_type):
        self._list_data_of_speed = list()
        self._list_sizes = list_sizes
        self.alg_type = alg_type
        self._data_type = data_type
        self._get_speed()

    def get_list_data_of_speed(self):
        return self._list_data_of_speed

    def _create_list_of_elements(self, size):
        list_of_elements = list()

        if self._data_type == config.SORTED_DATA:
            for number_of_operation in range(size):
                if number_of_operation == 0:
                    list_of_elements.append(randint(0, config.MAX_DATA))
                else:
                    list_of_elements.append(randint(list_of_elements[len(list_of_elements) - 1],
                                                    config.MAX_DATA))

        elif self._data_type == config.SORTED_DATA_REVERSE:
            for number_of_operation in range(size):
                if number_of_operation == 0:
                    list_of_elements.append(randint(0, config.MAX_DATA))
                else:
                    list_of_elements.append(randint(0,
                                                    list_of_elements[len(list_of_elements) - 1]))

        elif self._data_type == config.RANDOM_DATA:
            list_of_elements.append(randint(0, config.MAX_DATA))

        return list_of_elements

    def _get_speed(self):
        print("---")
        for size in range(len(self._list_sizes)):

            _speed = None

            if self.alg_type == config.BUBBLE_SORT:
                _speed = sort.BubbleSort(self._list_sizes[size],
                                         self._create_list_of_elements(size)).get_time()
            elif self.alg_type == config.INSERTION_SORT:
                _speed = sort.InsertionSort(self._list_sizes[size],
                                            self._create_list_of_elements(size)).get_time()
            elif self.alg_type == config.SELECTION_SORT:
                _speed = sort.SelectionSort(self._list_sizes[size],
                                            self._create_list_of_elements(size)).get_time()
            print(size, self._list_data_of_speed)
            self._list_data_of_speed.append(int(_speed * 1000000))
