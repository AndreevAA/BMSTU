# Лабораторная работа №6 часть 2
# Выполнено: Андреевым А.А. ИУ7-14Б
# Задача: Найти сумму четных чисел на нечетных позициях

# Ввод элементов списка через пробел
a = list(input("Введите элементы списка через пробел: ").split())

s_c = 0; sc_num = 0
s_n = 0; sn_num = 0

i = 0 # Счетчик позиции a[i] для рассмотрения только нечетных позиций
while i + 1 <= len(a):
    ans = 0;
    num_e = 0; znak = []; pos_znak = []
    num_znak = 0; position_e = -1; position_znak = -1; point_position = -1; point_num = 0

    # Аналогичная проверка на возможную действительность введенного числа под числом R
    for j in range(len(a[i])):
        if "0" <= a[i][j] <= "9":
            ans += 1
        if a[i][j] == "e":
            num_e += 1
            position_e = j
        if a[i][j] == "+" or a[i][j] == "-":
            if a[i][j] == "+":
                znak.append(1)
            if a[i][j] == "-":
                znak.append(0)
            num_znak += 1
            position_znak = j
            pos_znak.append(j)
        if a[i][j] == ".":
            point_positon = j
            point_num += 1
    
    if ans == len(a[i]):
        if int(a[i]) % 2 == 0:
            s_c += int(a[i])
            sc_num += 1
        else:
            s_n += int(a[i])
            sn_num += 1
    elif point_num == 0 and len(a[i]) == ans + num_znak + num_e and position_e > 0 and num_znak == 1 and num_e == 1 and position_e < position_znak and position_znak < len(a[i]) - 1:
        if (float(a[i])) == int(float(a[i])):
            if int(float(a[i])) % 2 == 0:
                s_c += int(float(a[i]))
                sc_num += 1
            else:
                s_n += int(float(a[i]))
                sn_num += 1
        elif position_e < position_znak and znak == 0:
            if int(float(a[i])) % 2 == 0:
                s_c += (float(a[i]))
                sc_num += 1
            else:
                s_n += (float(a[i]))
                sn_num += 1
    elif point_num == 1 and point_positon < position_e and len(a[i]) == ans + num_znak + num_e + point_num and num_e == 1 and num_znak == 1:
        if (float(a[i])) == int(float(a[i])):  
            if int(float(a[i])) % 2 == 0:
                s_c += int(float(a[i]))
                sc_num += 1
            else:
                s_n += int(float(a[i]))
                sn_num += 1
        elif int(float(a[i])) == 0:
            if int(float(a[i])) % 2 == 0:
                s_c += int(float(a[i]))
                sc_num += 1
            else:
                s_n += int(float(a[i]))
                sn_num += 1
    elif len(znak) > 0 and len(pos_znak) > 0:
        if znak[0] == 0 and position_znak == 0 and len(a[i]) == ans + num_znak and point_position <= position_e and num_znak == 1:
            if (float(a[i])) == int(float(a[i])):  
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1
            elif int(float(a[i])) == 0:
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1

        elif znak[0] == 0 and len(znak) == 2 and pos_znak[0] == 0 and pos_znak[1] > 1 and len(a[i]) == ans + num_znak + num_e + point_num and point_position <= position_e:
            if (float(a[i])) == int(float(a[i])):  
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1
            elif int(float(a[i])) == 0:
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1
    
        elif znak[0] == 0 and len(znak) == 2 and pos_znak[0] == 0 and pos_znak[1] > 1 and len(a[i]) == ans + num_znak + num_e + point_num and point_position <= position_e:
            if (float(a[i])) == int(float(a[i])):  
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1
            elif int(float(a[i])) == 0:
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1
    
        elif znak[0] == 0 and len(znak) == 1 and  pos_znak[0] > 1 and len(a[i]) == ans + num_znak + num_e + point_num and point_position <= position_e and position_e < position_znak:
            if (float(a[i])) == int(float(a[i])):  
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1
            elif int(float(a[i])) == 0:
                if int(float(a[i])) % 2 == 0:
                    s_c += int(float(a[i]))
                    sc_num += 1
                else:
                    s_n += int(float(a[i]))
                    sn_num += 1
    # Увеличение шага для просмотра только нечетных позиций
    i += 2

# Показательный вывод
if sc_num == 0 and sn_num == 0: print("В веденном списке не было найдено ни одного числа.")
else: print("\nСумма четных:   " + "{:<15.6}".format(float(s_c)) +  "Всего четных:   ",(sc_num)) #+"\nСумма нечетных: " + "{:<15.6}".format(float(s_n)) + "Всего нечетных: " + "{:<15.6}".format(float(sn_num)))













# 1e1
