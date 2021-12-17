import i_o

import config
import search, dictionary


def brute(dictionary, number):
    for record in dictionary:
        if record['number'] == number:
            return record
    return None


def binary(dictionary, number):
    left = 0
    right = len(dictionary) - 1

    if dictionary[left]['number'] > number or dictionary[right]['number'] < number:
        return None

    if dictionary[left]['number'] == number:
        return dictionary[left]
    if dictionary[right]['number'] == number:
        return dictionary[right]

    mid = (left + right) // 2
    res = dictionary[mid]['number']
    while number != res:
        if number < res:
            right = mid
        elif number > res:
            left = mid
        mid = (left + right) // 2
        res = dictionary[mid]['number']
    return dictionary[mid]


def divide_dict(dictionary, segment_count):
    segment_list = [[] for _ in range(segment_count)]
    for record in dictionary:
        segment_list[record['number'] % segment_count].append(record)
    return segment_list


def segment(segment_list, number):
    if len(segment_list) == 0:
        return None
    return binary(segment_list[number % len(segment_list)], number)


def main(iteration=100, segment_count=2, type_contract=config.type_contract):
    data = dictionary.Dictionary(iteration, type_contract, show_generation=True)

    number = int(input("Введите номер договора: "))

    br_word, bi_word, se_word = search.BinarySearch(data.data, number).record, search.BinarySearch(data.data, number).record, \
                                search.SegmentSearch(data.data, number, divide_dict(data.data, segment_count)).record

    br_time, bi_time, se_time = search.get_time(iteration, data.data, config.BR_TYPE, segment_count), \
                                search.get_time(iteration, data.data, config.BI_TYPE, segment_count), \
                                search.get_time(iteration, data.data, config.SE_TYPE, segment_count)

    i_o.IO(
        br_word, bi_word, se_word,
        br_time, bi_time, se_time
    ).out_searching_results()


if __name__ == '__main__':
    main()
