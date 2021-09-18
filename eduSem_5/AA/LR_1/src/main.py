# Реализовать алгоритмы: нерекурсивный поиска расстояния Левенштейна с кэшем в формате 2 строк (1Б),
# рекурсивный ... без кэша (2А),
# рекурсивный ... с кэшем в формате матрицы (2Б) и рекурсивный поиска расстояния Дамерау-Левенштейна
#
# Ну и в экспериментальной сравнить какие-то там друг с другомThis is a sample Python script.

import levenshtein

# Основная функция программы
def main():

    input_string = ""
    while str(input_string) != "-1":

        print("Введите строки:")
        first_string = input("\tfirst_string = ")
        second_string = input("\tsecond_string = ")

        print("\nВыберите алгоритм:")
        print("\t0  - Вывод всех алгоритмов")
        print("\t1  - Левенштейн рекурсивный без кэша")
        print("\t2  - Левенштейн рекурсивный с кэшем")
        print("\t3  - Дамерау-Левенштейн рекурсивный")
        print("\t4  - Левенштейн линейный без кэша")
        print("\t-1 - Выход\n")

        algorithm = input("Выбранный алгоритм = ")

        objLev = None

        if algorithm == "1":
            objLev = levenshtein.LevenshteinRecursiveWithoutCache(first_string, second_string)
        elif algorithm == "2":
            objLev = levenshtein.LevenshteinRecursiveWithCache(first_string, second_string)
        elif algorithm == "3":
            objLev = levenshtein.DamerauLevenshtein(first_string, second_string)
        elif algorithm == "4":
            objLev = levenshtein.LevenshteinLinear(first_string, second_string)
        elif algorithm == "0":
            objLev1 = levenshtein.LevenshteinRecursiveWithoutCache(first_string, second_string)
            objLev2 = levenshtein.LevenshteinRecursiveWithCache(first_string, second_string)
            objLev3 = levenshtein.DamerauLevenshtein(first_string, second_string)
            objLev4 = levenshtein.LevenshteinLinear(first_string, second_string)

            print("\nРезультат: ")
            print("\n1. Левенштейн рекурсивный без кэша: ")
            print("\tРасстояние =", objLev1.get_distance())
            print("\tВремя =", objLev1.get_time())
            print()
            print("\n2. Левенштейн рекурсивный с кэшем: ")
            print("\tРасстояние =", objLev2.get_distance())
            print("\tВремя =", objLev2.get_time())
            print()
            print("\n3. Дамерау-Левенштейн рекурсивный: ")
            print("\tРасстояние =", objLev3.get_distance())
            print("\tВремя =", objLev3.get_time())
            print()
            print("\n4. Левенштейн линейный без кэша: ")
            print("\tРасстояние =", objLev4.get_distance())
            print("\tВремя =", objLev4.get_time())
            print()
            print("--")
            print()

        elif algorithm == "-1":
            exit()

        if algorithm == "1" or algorithm == "2" or algorithm == "3" or algorithm == "4":
            print("\nРезультат: ")
            print("\tРасстояние =",  objLev.get_distance())
            print("\tВремя =", objLev.get_time())
            print()
            print("--")
            print()


if __name__ == '__main__':
    main()
