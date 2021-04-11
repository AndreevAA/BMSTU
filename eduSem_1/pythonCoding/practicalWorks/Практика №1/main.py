"""
    Практическая работы №1
    Студент: Андреев Александр
    Группа: ИУ7-14Б
    Название: 
"""

from itertools import permutations

welcome = {"Приветсвие":"Программа Permalex (Пермалекс). \n\n\
Инструкция:\nВведите последовательные линии,\
каждая из которых состоит из одной строки. \n\
В каждой строке должно находиться до 20 строчных\
символов, не обязательно различных. \nКонец ввод\
и работы программы: #","Приглашение ввода":"\nВведите\
последовательные линии,\nкаждая из которых состоит из\
одной строки длиной до 20 строчных символов:\n", \
"Вывод":"\nВывод \nпрограммы:"}

# Определение списка всех возможных перестановок
def permutation(temp_string):
    temp_answer = set([''.join(p) for p in permutations (temp_string)]) # Опеределение всех возможных перестановок и запить в множество temp_answer
    result = []                                                          
    for i in temp_answer: result.append(i)                              # Запись из множества temp_answer перестановок в список result
    result.sort()                                                       # Сортировка всех возможных перестановок в алфавитном порядке
    return result

# Нахождение позиции перестановки в списке всех перестановок
def position_in_permutation(temp_string, permutation_string):
    i = 0
    while temp_string != permutation_string[i]: i += 1
    return i

# Форматирование вывода с учетом условия задачи
def formatted_output(answer):
    for i in answer:
        print("{:>10}".format(i))

# Основная функция работы программы
def main():
    global welcome
    print(welcome["Приветсвие"])
    temp_string = input(str(welcome["Приглашение ввода"]))
    answer = []
    while temp_string != "#":
        answer.append(position_in_permutation(temp_string, permutation(temp_string)) + 1)
        temp_string = input()

    print(welcome["Вывод"])
    formatted_output(answer)

main()
