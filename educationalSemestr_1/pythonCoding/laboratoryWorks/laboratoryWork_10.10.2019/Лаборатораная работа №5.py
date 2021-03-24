# Андреев Александр ИУ7-14Б
# Лабораторная работа №5 на оределение суммы ряда

# Ввод 
x = float(input("Введие значение аргумента 0 < x <= 1: "))

# Проверка значений аргумента
if 0 < x <= 1: # Значения аргумента лежат в области от нуля до единицы
    # Ввод
    eps = float(input("Введите точность EPS > 0: ")) # Ввод точности
    max_iter = int(input("Введите максимальное количество итераций: ")) # Ввод максимального количества итераций
    step_print = int(input("Введите шаг печати: ")) # Ввод шага печати
    
    ans = 1 # Текущее значение значение суммы
    
    temp1 = 2
    temp2 = 3
    temp3 = x

    # Значени знака
    znak = -1

    # Порядковый номер итерации
    iter_number = 1

    # Текущее значение функции 
    temp_num = 1

    # Вывод шапки таблицы
    header = [chr(9484) + chr(9472)*16 + chr(9516) + chr(9472)*14 + chr(9516) + chr(9472)*14 + chr(9488), chr(9474) + " Номер итерации " + chr(9474) + "   Элемент    " + chr(9474) + "     Сумма    " + chr(9474)]
    print(header[0])
    print(header[1])
    print(chr(9500) + chr(9472)*16 + chr(9532) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9508))
    print(chr(9474) + "{:<16.6}".format(float(iter_number)) + chr(9474) + "{:<14.6}".format(float(temp_num))+ chr(9474) + "{:<14.6}".format(float(ans)) + chr(9474))
   
    # Вывод основной части таблицы
    while abs(temp_num) > eps and iter_number < max_iter:
        temp_num = (znak * temp1 * temp2 * temp3 / 2) # Определение текущего значения фукнции
        ans += temp_num # Изменение суммы 
        iter_number += 1 # Изменение текущего значения итерации
        temp1 += 1
        temp2 += 1
        temp3 *= x
        znak = -znak # Изменение знака функции
        if iter_number % step_print == 0:
            print(chr(9500) + chr(9472)*16 + chr(9532) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9508))
            print(chr(9474) + "{:<16.6}".format(float(iter_number)) + chr(9474) + "{:<14.6}".format(temp_num)+ chr(9474) + "{:<14.6}".format(ans) + chr(9474))
    print(chr(9492) + chr(9472)*16 + chr(9524) + chr(9472)*14 + chr(9524) + chr(9472)*14 + chr(9496))
    if abs(temp_num) < eps: # Вывод по точности
        print("Сумма сошлась, " + "Summa = " + "{:<.6}".format(float(ans)) + " за " + str(iter_number) + " итераций")
    else: 
        print("Сумма не сошлась")
else: # Значения аргумента не лежат в области от 0 до 1
    print("Вы ввели значение X, не принадлежащее промежутку (0, 1)!")
