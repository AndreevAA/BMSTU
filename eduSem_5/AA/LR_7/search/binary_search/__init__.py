from time import process_time

import search


# Наследуемый класс поиска
class BinarySearch(search.Search):

    def __init__(self, _dictionary, _element, _record_name):
        super().__init__(_dictionary, _element)

        # Отсечка времени при поиске записи
        s_time = process_time()
        self._find_record(_record_name)
        self._time = process_time() - s_time

    # Поиск записи
    def _find_record(self, _record_name):
        left = 0
        right = self._dictionary.dict_size() - 1

        if self._dictionary.dict[left][_record_name] > self._element or \
                self._dictionary.dict[right][_record_name] < self._element:
            return None

        if self._dictionary.dict[left][_record_name] == self._element:
            return self._dictionary.dict[left]
        if self._dictionary.dict[right][_record_name] == self._element:
            return self._dictionary.dict[right]

        mid = (left + right) // 2
        res = self._dictionary.dict[mid][_record_name]

        while self._element != res:
            if self._element < res:
                right = mid
            elif self._element > res:
                left = mid
            mid = (left + right) // 2
            res = self._dictionary.dict[mid][_record_name]

        self._record = self._dictionary.dict[mid]
