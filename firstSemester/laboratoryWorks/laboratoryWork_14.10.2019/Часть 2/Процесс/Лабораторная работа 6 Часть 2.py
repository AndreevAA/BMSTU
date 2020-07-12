# Лабораторная работа №6 часть 2
# Выполнено: Андреевым А.А. ИУ7-14Б
# Задача: Найти сумму четных и сумму нечетных чисел

a = list(input("Введите элементы списка через пробел: ").split())

s_c = 0; sc_num = 0
s_n = 0; sn_num = 0
for i in range(len(a)):
	ans = 0; points_num = 0; points_position = 0
	for j in range(len(a[i])):
                if "0" <= a[i][j] <= "9":
                        ans += 1
                if a[i][j] == ".":
                        points_num += 1
                        points_position = j
                print(a[i][j])
	if ans == len(a[i]) and points_num == 1 and points_position != 0 and points_position != len(a[i]):
		if float(a[i]) % 2 == 0:
			s_c += float(a[i])
			sc_num += 1
		else:
			s_n += float(a[i])
			sn_num += 1

if sc_num == 0 and sn_num == 0: print("В веденном списке не было найдено ни одного числа.")
else: print("Сумма четных: " + "{:.6}".format(float(s_c)) + "\nСумма нечетных: " + "{:.6}".format(float(s_n)))

