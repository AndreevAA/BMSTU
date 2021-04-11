from math import sin
import config

# Задание функции.
def func(x):
    return sin(x)

# Заполнение массива шагов
def fillSteps(table, vectorLength):
    
    # Нулевой шаг равен нулю
    h_arr = [0] 
    
    for tempCur in range (1, vectorLength):
        h_arr.append(table[tempCur][0] - table[tempCur - 1][0])
    
    return h_arr;

def fillALAE(h_arr, table, vectorLength):
    A_arr = [0 if tempCur < 2 else h_arr[tempCur - 1] for tempCur in range(vectorLength)]
    B_arr = [0 if tempCur < 1 else -2 * (h_arr[tempCur - 1] + h_arr[tempCur]) for tempCur in range(vectorLength)]
    D_arr = [0 if tempCur < 1 else h_arr[tempCur] for tempCur in range(vectorLength)]
    F_arr = [0 if tempCur < 2 else -3 * ((table[tempCur][1] - table[tempCur - 1][1]) / h_arr[tempCur] - (table[tempCur - 1][1] - table[tempCur - 2][1]) / h_arr[tempCur - 1]) for tempCur in range(vectorLength)]
    
    return A_arr, B_arr, D_arr, F_arr;

# Прямой ход (Вычисление прогоночных коэффицентов).
def straightGetting(A_arr, B_arr, D_arr, F_arr, vectorLength):
    ks_arr = [0 for tempCur in range(vectorLength + 1)]
    nu_arr = [0 for tempCur in range(vectorLength + 1)]

    for tempCur in range(1, vectorLength):
        ks_arr[tempCur + 1] = D_arr[tempCur] / (B_arr[tempCur] - A_arr[tempCur] * ks_arr[tempCur])
        nu_arr[tempCur + 1] = (A_arr[tempCur] * nu_arr[tempCur] + F_arr[tempCur]) / (B_arr[tempCur] - A_arr[tempCur] * ks_arr[tempCur])
    
    return ks_arr, nu_arr;

# Обратный ход (Нахождение всех Ci).
def reverseGetting(ks_arr, nu_arr, vectorLength):
    c_arr = [0 for tempCur in range(vectorLength + 1)]
    c_arr[vectorLength - 1] = nu_arr[vectorLength]

    for tempCur in range(vectorLength - 2, -1, -1):
        c_arr[tempCur] = ks_arr[tempCur + 1] * c_arr[tempCur + 1] + nu_arr[tempCur + 1]

    return c_arr

# Нахождение коэффицентов, выраженных через Ci.
def getAllCoffs(table, vectorLength, c_arr, h_arr):
    a_arr = [0 if tempCur < 1 else table[tempCur - 1][1] for tempCur in range(vectorLength)]
    b_arr = [0 if tempCur < 1 else (table[tempCur][1] - table[tempCur - 1][1]) / h_arr[tempCur] - h_arr[tempCur] / 3 * (c_arr[tempCur + 1] + 2 * c_arr[tempCur]) for tempCur in range(vectorLength)]
    d_arr = [0 if tempCur < 1 else (c_arr[tempCur + 1] - c_arr[tempCur]) / (3 * h_arr[tempCur]) for tempCur in range(vectorLength)]
    
    return a_arr, b_arr, d_arr;

# Нахождение коэффицентов, выраженных через Ci.
def getIndexOfInteval(table, vectorLength, x):
    ind = vectorLength - 1
    
    for tempCur in range (vectorLength - 1):
        if table[tempCur][0] <= x and x < table[tempCur + 1][0]:
            ind = tempCur + 1
            return ind;
    
    return ind;

# Получение значения интерполяции.
def getInterpolationResult(a_arr, b_arr, c_arr, x, table, ind, d_arr):
    return a_arr[ind] + b_arr[ind] * (x - table[ind - 1][0]) + c_arr[ind] * ((x - table[ind - 1][0]) ** 2)\
          + d_arr[ind] * ((x - table[ind - 1][0]) ** 3)

# Верификация таблицы
def verificateTable(table, x):
    # Проверка на необходимое кол-во узлов.
    if len(table) < 1:
        print('Недостаточное кол-во узлов для интерполяции.')
        return config.ERROR_STATUS;

    # Исключение экстраполяции
    if x > table[len(table) - 1][0] or x < table[0][0]:
        print('Экстраполяция недоступна.')
        return config.ERROR_STATUS;

    return config.SUCCESS_STATUS; 

# Функция интерполяции
def interpolation(table, x):
    # Стандартная сортировка таблицы
    table.sort()

    # Проверка таблицы на необходимое количество узлов и исключение интерполяции
    if (verificateTable(table, x) != config.SUCCESS_STATUS):
        exit(1)

    # Заполнение массива шагов
    h_arr = fillSteps(table, len(table));

    # Заполнение массивов коэффицентов СЛАУ.
    A_arr, B_arr, D_arr, F_arr = fillALAE(h_arr, table, len(table));

    # Прямой ход (Вычисление прогоночных коэффицентов).
    ks_arr, nu_arr = straightGetting(A_arr, B_arr, D_arr, F_arr, len(table));

    # Обратный ход (Нахождение всех Ci).
    c_arr = reverseGetting(ks_arr, nu_arr, len(table));

    # Нахождение коэффицентов, выраженных через Ci.
    a_arr, b_arr, d_arr = getAllCoffs(table, len(table), c_arr, h_arr);

    # Нахождение индекса интервала расположения введенного X.
    ind = getIndexOfInteval(table, len(table), x);

    # Получение значения интерполяции.
    interpolationResult = getInterpolationResult(a_arr, b_arr, c_arr, x, table, ind, d_arr);

    return interpolationResult
