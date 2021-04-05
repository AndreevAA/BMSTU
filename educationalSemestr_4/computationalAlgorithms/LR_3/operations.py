from math import sin

# Задание функции.
def func(x):
    return sin(x)

# Функция интерполяции
def interpolation(table, x):
    table.sort()
    n = len(table)

    # Проверка на необходимое кол-во узлов.
    if len(table) < 1:
        print('Недостаточное кол-во узлов для интерполяции.')
        exit(1)

    print(x, table)

    # Исключение экстраполяции
    if x > table[n - 1][0] or x < table[0][0]:
        print('Экстраполяция недоступна.')
        exit(2)

    # Заполнение массива шагов
    h_arr = [0] # Нулевой шаг равен нулю
    for i in range (1, n):
        h_arr.append(table[i][0] - table[i - 1][0])

    # Заполнение массивов коэффицентов СЛАУ.
    A_arr = [0 if i < 2 else h_arr[i - 1] for i in range(n)]
    B_arr = [0 if i < 1 else -2 * (h_arr[i - 1] + h_arr[i]) for i in range(n)]
    D_arr = [0 if i < 1 else h_arr[i] for i in range(n)]
    F_arr = [0 if i < 2 else -3 * ((table[i][1] - table[i - 1][1]) / h_arr[i] - (table[i - 1][1] - table[i - 2][1]) / h_arr[i - 1]) for i in range(n)]

    # Прямой ход (Вычисление прогоночных коэффицентов).
    ks_arr = [0 for i in range(n + 1)]
    nu_arr = [0 for i in range(n + 1)]
    for i in range(1, n):
        ks_arr[i + 1] = D_arr[i] / (B_arr[i] - A_arr[i] * ks_arr[i])
        nu_arr[i + 1] = (A_arr[i] * nu_arr[i] + F_arr[i]) / (B_arr[i] - A_arr[i] * ks_arr[i])

    # Обратный ход (Нахождение всех Ci).
    c_arr = [0 for i in range(n + 1)]
    c_arr[n - 1] = nu_arr[n]
    for i in range(n - 2, -1, -1):
        c_arr[i] = ks_arr[i + 1] * c_arr[i + 1] + nu_arr[i + 1]

    # Нахождение коэффицентов, выраженных через Ci.
    a_arr = [0 if i < 1 else table[i - 1][1] for i in range(n)]
    b_arr = [0 if i < 1 else (table[i][1] - table[i - 1][1]) / h_arr[i] - h_arr[i] / 3 * (c_arr[i + 1] + 2 * c_arr[i]) for i in range(n)]
    d_arr = [0 if i < 1 else (c_arr[i + 1] - c_arr[i]) / (3 * h_arr[i]) for i in range(n)]

    # Нахождение индекса интервала расположения введенного X.
    ind = n - 1
    for i in range (n - 1):
        if table[i][0] <= x and x < table[i + 1][0]:
            ind = i + 1
            break

    # Получение значения интерполяции.
    res = a_arr[ind] + b_arr[ind] * (x - table[ind - 1][0]) + c_arr[ind] * ((x - table[ind - 1][0]) ** 2)\
          + d_arr[ind] * ((x - table[ind - 1][0]) ** 3)
    return res