import globals
import numpy as np

def getFunction():
	return x ** 2 + y ** 2;

def getNearestNumber(data, tempNumber):
	leftCur = 0; rightCur = len(data) - 1
	while leftCur < rightCur:
		middleCur = int((leftCur + rightCur) / 2)
		if tempNumber > data[data]:
			leftCur = middleCur + 1
		else:
			rightCur = middleCur
	return rightCur


def recurs_function(xs, ys):
    l = len(xs)
    if l == 1:
        return ys[0]
    else:
        return (recurs_function(xs[:-1], ys[:-1]) - recurs_function(xs[1:], ys[1:])) / (xs[0] - xs[l - 1])


def newton_interpolation(lst_x, lst_z, x):
    i = nearest_number(lst_x, x)
    z_x = lst_z[0]
    for i in range(1, len(lst_x)):
        k = 1
        for j in range(i):
            k *= (x - lst_x[j])
        dd = recurs_function(lst_x[:i+1], lst_z[:i+1])
        z_x += (k * dd)
    return z_x


def start_interpolation():
    xs, ys, zs = create_table()

    print_table(xs, ys, zs)

    x = float(input('input x: '))
    y = float(input('input y: '))

    while (x < 0) or (x > 5) or (y < 0) or (y > 5):
        print("Wrong borders")
        x = float(input('input x: '))
        y = float(input('input y: '))
    
    n = int(input('input xn: '))
    m = int(input('input yn: '))

    i_x = nearest_number(xs, x)
    i_y = nearest_number(ys, y)

    lx = len(xs)
    ly = len(ys)
    
    if i_y - (m + 1) / 2 < 0:
        sample_y = ys[:int(i_y + int(ceil((m + 1) / 2)) + 1)]
        sample_z = zs[:int(i_y + int(ceil((m + 1) / 2)) + 1)]
    elif ly < i_y + (m + 1) / 2:
        sample_y = ys[i_y - int(ceil((m + 1) / 2)):]
        sample_z = zs[i_y - int(ceil((m + 1) / 2)):]
    else:
        if m % 2 != 0:
            sample_y = ys[i_y - int(ceil((m + 1) / 2)): i_y + int(ceil((m + 1) / 2))]
            sample_z = zs[i_y - int(ceil((m + 1) / 2)): i_y + int(ceil((m + 1) / 2))]
        else:
            sample_y = ys[i_y - int(ceil((m + 1) / 2)) - 1: i_y + int(ceil((m + 1) / 2))]
            sample_z = zs[i_y - int(ceil((m + 1) / 2)) - 1: i_y + int(ceil((m + 1) / 2))]

    left = 0
    right = 0
    
    if i_x - (n + 1) / 2 < 0:
        sample_x = xs[:int(i_x + int(ceil((n + 1) / 2)) + 1)]
        right = i_x + int(ceil((n + 1) / 2) + 1)
    elif lx < i_x + (n + 1) / 2:
        sample_x = xs[i_x - int(ceil((n + 1) / 2)):]
        left = i_x - int(ceil((n + 1) / 2))
        right = 6
    elif n % 2 != 0:
        sample_x = xs[i_x - int(ceil((n + 1) / 2)): i_x + int(ceil((n + 1) / 2))]
        left = i_x - int(ceil((n + 1) / 2))
        right = i_x + int(ceil((n + 1) / 2))
    else:
        sample_x = xs[i_x - int(ceil((n + 1) / 2)) - 1: i_x + int(ceil((n + 1) / 2))]
        left = i_x - int(ceil((n + 1) / 2)) - 1
        right = i_x + int(ceil((n + 1) / 2))

    for i in range(len(sample_z)):
        sample_z[i] = sample_z[i][int(left):int(right)]

    answ = []

    for i in range(len(sample_y)):
        answ.append(newton_interpolation(sample_x, sample_z[i], x))

    result = func(x, y)
    print('Real result: {}'.format(result))
    return newton_interpolation(sample_y, answ, y)

# Функция интерполяции
def interpolation(data, arg_x, arg_y, pow_x, pow_y):
    #data = (data[:,data[0,:].argsort()])[data[:, 0].argsort(), :]
    # Проверка на необходимое кол-во узлов.
    if pow_x + 1 > data.shape[0] - 1 or pow_y + 1 > data.shape[1] - 1:
        print('Недостаточное кол-во узлов для интерполяции.')
        exit(1)
    # Исключение экстраполяции
    if arg_x > data[len(data) - 1][0] or arg_x < data[1][0] or arg_y > data[0][len(data) - 1] or arg_y < data[0][1]:
        print('Экстраполяция недоступна.')
        exit(2)
    indexes_x = find_indexes(data[1:,0], pow_x, arg_x)
    indexes_y = find_indexes(data[0,1:], pow_y, arg_y)
    data = np.vstack([data[0], data[indexes_x[0]:indexes_x[1]+1]])
    data = np.column_stack((data[:, 0], data[:, indexes_y[0]:indexes_y[1] + 1]))
    buffer = []
    for i in range(0, len(data[:, 0]) - 1):
        if (pow_y > 0):
            razd_razn_founded.clear()
            razd_razn(np.transpose(np.vstack([data[0, 1:], data[i + 1, 1:]])), 0, len(data[0]) - 2)
        buffer.append(find_root(np.transpose(np.vstack([data[0, 1:], data[i + 1, 1:]])), arg_y))
    if (pow_x > 0):
        razd_razn_founded.clear()
        razd_razn(np.column_stack((data[1:, 0], np.transpose(buffer))), 0, len(buffer) - 1)
    return find_root(np.column_stack((data[1:, 0], np.transpose(buffer))), arg_x)
