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
        right = len(self._dictionary.dict) - 1

        if str(self._dictionary.dict[left][_record_name]) > str(self._element) or \
                str(self._dictionary.dict[right][_record_name]) < str(self._element):
            return None

        if str(self._dictionary.dict[left][_record_name]) == str(self._element):
            return self._dictionary.dict[left]
        if str(self._dictionary.dict[right][_record_name]) == str(self._element):
            return self._dictionary.dict[right]

        mid = (left + right) // 2
        res = self._dictionary.dict[mid][_record_name]

        while str(self._element) != res:
            if str(self._element) < res:
                right = mid
            elif str(self._element) > res:
                left = mid
            mid = (left + right) // 2
            res = str(self._dictionary.dict[mid][_record_name])

        self._record = self._dictionary.dict[mid]
