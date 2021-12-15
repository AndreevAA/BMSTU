# Base object
import config


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
