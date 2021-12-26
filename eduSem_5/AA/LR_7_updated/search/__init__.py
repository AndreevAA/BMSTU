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


def get_operations(number, dictionary, s_type, segment_count):
    segment_list = divide_dict(dictionary, segment_count)

    if s_type == config.BR_TYPE:
        return BruteSearch(dictionary, number).number_of_operations
    elif s_type == config.BI_TYPE:
        return BinarySearch(dictionary, number).number_of_operations
    elif s_type == config.SE_TYPE:
        return SegmentSearch(dictionary, number, segment_list).number_of_operations


class Search:

    _dictionary, _number, _record = None, None, None

    _number_of_operations = None

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

    @property
    def number_of_operations(self):
        return self._number_of_operations


# Child object Brute Search
class BruteSearch(Search):

    def __init__(self, dictionary, number):
        super().__init__(dictionary, number)
        self.find()

    def find(self):
        t_number_of_operations = 0

        for record in self.dict:
            if record['number'] == self.number:
                self._record = record
                self._number_of_operations = t_number_of_operations
                return config.BS
            t_number_of_operations += 1
        self._record = None
        self._number_of_operations = t_number_of_operations
        return config.BS


class BinarySearch(Search):

    def __init__(self, dictionary, number):
        super().__init__(dictionary, number)
        self.find()

    def find(self):
        left, right = 0, len(self.dict) - 1

        t_num_of_operations = 0

        if self.dict[left]['number'] > self.number or self.dict[right]['number'] < self.number:
            self._record = None
            t_num_of_operations += 1
            self._number_of_operations = t_num_of_operations
            return t_num_of_operations

        if self.dict[left]['number'] == self.number:
            self._record = self.dict[left]
            t_num_of_operations += 1
            self._number_of_operations = t_num_of_operations
            return t_num_of_operations

        if self.dict[right]['number'] == self.number:
            self._record = self.dict[right]
            t_num_of_operations += 1
            self._number_of_operations = t_num_of_operations
            return t_num_of_operations

        mid = (left + right) // 2
        res = self.dict[mid]['number']
        while self.number != res:
            if self.number < res:
                right = mid
            elif self.number > res:
                left = mid
            mid = (left + right) // 2
            res = self.dict[mid]['number']
            t_num_of_operations += 1
            self._number_of_operations = t_num_of_operations
        self._record = self.dict[mid]
        self._number_of_operations = t_num_of_operations
        return t_num_of_operations


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
        self._number_of_operations = BinarySearch(self._segment_list[self.number % len(self._segment_list)], self.number).find()
        return config.BS

