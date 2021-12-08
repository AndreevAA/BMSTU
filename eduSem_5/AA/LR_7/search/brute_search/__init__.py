from time import process_time

import search


# Наследуемый класс поиска
class BruteSearch(search.Search):

    def __init__(self, _dictionary, _element, _record_name):
        super().__init__(_dictionary, _element)

        # Отсечка времени при поиске записи
        s_time = process_time()
        self._find_record(_record_name)
        self._time = process_time() - s_time

    # Поиск записи
    def _find_record(self, _record_name):
        for record in self._dictionary.dict:
            if record[_record_name] == self._element:
                self._record = record
