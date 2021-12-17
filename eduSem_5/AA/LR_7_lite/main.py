from time import process_time
from random import *

import search


def generate(count):
    dictionary = []
    type_contract = ["Двусторонний", "Многосторонний", "Договор подряда", "Договор возмездного оказания услсуг",
                     "Купли-продажи", "Аренды"]
    for i in range(count):
        record = {'number': i + 1,
                  'type': choice(type_contract)}
        dictionary.append(record)
    return dictionary


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


if __name__ == '__main__':

    iteration = 100
    segment_count = 2
    dictionary = generate(1000)

    print(dictionary)

    number = int(input("Введите номер договора: "))
    print("Результат")
    print("Поиск полным перебором:")
    print(brute(dictionary, number))
    print("Двоичный поиск:")
    print(binary(dictionary, number))
    print("Алгоритм с использованием частотного анализа:")
    print(segment(divide_dict(dictionary, segment_count), number))

    print()
    print("Анализ времени(msc)")
    print('Время поиска полным перебором:')
    time = 0
    for i in range(iteration):
        t1 = process_time()
        for j in range(1000):
            search.BruteSearch(dictionary, j + 1)
        t2 = process_time()
        time += (t2 - t1) / 1000
    print(time / iteration)

    print('Время двоичного поиска:')
    time = 0
    for i in range(iteration):
        t1 = process_time()
        for j in range(1000):
            search.BinarySearch(dictionary, j + 1)
        t2 = process_time()
        time += (t2 - t1) / 1000
    print(time / iteration)

    print('Время поиска с помощью алгоритма с использование частотного анализа:')
    time = 0
    segment_list = divide_dict(dictionary, segment_count)
    for i in range(iteration):
        t1 = process_time()
        for j in range(1000):
            search.SegmentSearch(dictionary, j + 1, segment_list)
        t2 = process_time()
        time += (t2 - t1) / 1000
    print(time / iteration)