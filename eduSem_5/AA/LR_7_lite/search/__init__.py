# Base object
from time import process_time

import config


def divide_dict(dictionary, segment_count):
    segment_list = [[] for _ in range(segment_count)]
    for record in dictionary:
        segment_list[record['number'] % segment_count].append(record)
    return segment_list


def get_time(iteration, dictionary, s_type, segment_count):
    segment_list = divide_dict(dictionary, segment_count)

    time = 0
    for i in range(iteration):
        t1 = process_time()
        for j in range(1000):
            if s_type == config.BR_TYPE:
                BruteSearch(dictionary, j + 1)
            elif s_type == config.BI_TYPE:
                BinarySearch(dictionary, j + 1)
            elif s_type == config.SE_TYPE:
                SegmentSearch(dictionary, j + 1, segment_list)
        t2 = process_time()
        time += (t2 - t1) / 1000

    return time / iteration


class Search:

    _dictionary, _number, _record = None, None, None

    def __init__(self, dictionary, number):
        self._dictionary = dictionary
        self._number = number

    @property
    def dict(self):
        return self._dictionary

    @property
    def number(self):
        return self._number

    @property
    def record(self):
        return self._record


# Child object Brute Search
class BruteSearch(Search):

    def __init__(self, dictionary, number):
        super().__init__(dictionary, number)
        self.find()

    def find(self):
        for record in self.dict:
            if record['number'] == self.number:
                self._record = record
                return config.BS
        self._record = None
        return config.BS


class BinarySearch(Search):

    def __init__(self, dictionary, number):
        super().__init__(dictionary, number)
        self.find()

    def find(self):
        left, right = 0, len(self.dict) - 1

        if self.dict[left]['number'] > self.number or self.dict[right]['number'] < self.number:
            self._record = None
            return config.BS

        if self.dict[left]['number'] == self.number:
            self._record = self.dict[left]
            return config.BS

        if self.dict[right]['number'] == self.number:
            self._record = self.dict[right]
            return config.BS

        mid = (left + right) // 2
        res = self.dict[mid]['number']
        while self.number != res:
            if self.number < res:
                right = mid
            elif self.number > res:
                left = mid
            mid = (left + right) // 2
            res = self.dict[mid]['number']
        self._record = self.dict[mid]
        return config.BS


class SegmentSearch(Search):

    _segment_list = None

    def __init__(self, dictionary, number, segment_list):
        super().__init__(dictionary, number)
        self._segment_list = segment_list
        self.find()

    def find(self):
        if len(self._segment_list) == 0:
            self._record = None
            return config.BS

        self._record = BinarySearch(self._segment_list[self.number % len(self._segment_list)], self.number).record
        return config.BS

