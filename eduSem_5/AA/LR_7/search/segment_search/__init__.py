from time import process_time

import search
import search.binary_search
import dictionary


# Наследуемый класс поиска
class SegmentSearch(search.Search):

    _segment_list = None

    def __init__(self, _dictionary, _element, _record_name, _segment_count):
        super().__init__(_dictionary, _element)

        self._dictionary = _dictionary
        self._element = _element

        # Разделение словаря
        self._divide_dict(_segment_count)

        # Смена словаря
        _update_dict = dictionary.Dictionary()
        self._dictionary.dict = self._segment_list

        # Отсечка времени при поиске записи
        s_time = process_time()
        self._find_record(_record_name)
        self._time = process_time() - s_time

    @property
    def seg_list_size(self):
        return len(self._segment_list)

    @property
    def seg_list(self):
        return self._segment_list

    # Разделение словаря
    def _divide_dict(self, _segment_count):
        segment_list = [[] for _ in range(_segment_count)]
        for record in self._dictionary.dict:
            segment_list[record['number'] % _segment_count].append(record)

    # Поиск записи
    def _find_record(self, _record_name):
        self._element = search.binary_search.BinarySearch(self._dictionary,
                                                          self._element, _record_name).elem
