"""
Название работы: Отрисовка таблицы вычесленных значений функций и графическое отображение
Тип работы:      Лабораторная работа №4
Выполнил работу: Андреев А.А.
Группа:          ИУ7-14Б
"""

from math import log10

    
# Ввод значений
start = float(input("Введите вещественное значение начала перебора значения X: "))
end   = float(input("Введите вещественное значание конца перебора  значения X: "))
step  = float(input("Введите вещественное значание шага перебора  значения  X: "))

width = 70
height= 50
y_min = 1e100
y_max = -1e100
number_zamet = int(input("Введите количество заметок по оси Oy: "))

number_zamet -= 1
x = start
count = 0
ans = [chr(9484) + chr(9472)*14 + chr(9516) + chr(9472)*14 + chr(9516) + chr(9472)*14 + chr(9488), chr(9474) + "X             " + chr(9474) + "V1            " + chr(9474) + "V2            " + chr(9474)]

while x <= end:
    if x > 0:
        V1 = x * log10(x) - 1.2              # Вычисление значения функции V1
    if x <= 0:
        V1 = "Не определено"
    V2 = x**3 - 4 * x * x + 10 * x + 20  # Вычисление значения функции V2
    
    y_min = min(y_min, V2)
    y_max = max(y_max, V2)
    
    # Вывод строки со значениями X, V1, V2
    if start <= x <= end:
        if V1 == "Не определено":
            temp_ans_1 = chr(9500) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9508) + "\n" + chr(9474) + "{:<14.6}".format(x) + chr(9474) + "{:<14.14}".format(V1) + chr(9474) + "{:<14.6}".format(V2) + chr(9474)
        #temp_ans_2 = chr(9500) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9508)
        elif V1 != "Не определено":
            temp_ans_1 = chr(9500) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9532) + chr(9472)*14 + chr(9508) + "\n" + chr(9474) + "{:<14.6}".format(x) + chr(9474) + "{:<14.6}".format(V1) + chr(9474) + "{:<14.6}".format(V2) + chr(9474)
        ans.append(temp_ans_1)
        #ans.append(temp_ans_2)
        x += step                            # Увеличение текущего значения X на величину шага
if len(ans) == 3:
    print("В заданных промежутке и шаге значения функций не найдены. Повторите попытку.")
else:
    for i in range(len(ans)):
        print(ans[i])
    print(chr(9492) + chr(9472)*14 + chr(9524) + chr(9472)*14 + chr(9524) + chr(9472)*14 + chr(9496))

    delen = abs(y_max - y_min) / width
    delen_1 = abs(y_max - y_min) /  number_zamet
    razmetka = round(abs(0 - y_max) / delen)
    temp_x = start
    #print(chr(9472) * )
    y_fs = y_min
    i = 0
    text_f_s = ""
    while True:
        if y_fs > y_max:
            break
        else:
            text_f_s += ("{:<10.4}".format(y_fs)) + " " * (int(width // number_zamet) - 10)
        y_fs += delen * width // number_zamet
    
    print("         " + text_f_s)
    print("       " + chr(9472) + chr(9472) + (chr(9532) + chr(9472) * (int(width // number_zamet) - 1)) * int(number_zamet) + chr(9532) + chr(9472) + chr(9472))
    zero_pos = abs(y_min) // delen
    while True:
        if temp_x > end:
        #print(chr(9474) + " ", end = "")
            break;
        else:
            if y_min < 0 and y_max > 0:
                par = 0
                
                V2 = temp_x**3 - 4 * temp_x * temp_x + 10 * temp_x + 20
                temp_y = y_min
                i = int((V2 - y_min) // delen)
                left = i * delen
                right = (i + 1) * delen

                number = -1
                if abs(left - V2) <= abs(right - V2):
                    number = i
                else:
                    number=  i + 1
                if number == zero_pos:
                    text = ("{:<6.4}".format(temp_x)) + " " + chr(9474) + " " + " " * int(number - 1) + "*";
                if number < zero_pos:
                    text = ("{:<6.4}".format(temp_x)) + " " + chr(9474) + " " + " " * int(number - 1) + "*" + int(abs(zero_pos - max(number, 1)) - 1) * " " + chr(9474)
                if number > zero_pos:
                    text = ("{:<6.4}".format(temp_x)) + " " + chr(9474) + " " + " " * int(zero_pos - 1) + chr(9474) + int(abs(zero_pos - number)) * " " + "*"
                print(text)
            else:
                par = 0
                V2 = temp_x**3 - 4 * temp_x * temp_x + 10 * temp_x + 20
                temp_y = y_min
                number = f1(V2, delen, y_min)
                text = "{:6.6}".format("{:.4}".format(temp_x)) + " " + chr(9474) + " " + " " * (number - 1) + "*" + (width - number) * " " ;
                print(text)
            temp_x += step
    #print(" " * 73 + chr(8595) + " x")
   
