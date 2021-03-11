import globals
import numpy as np

def getFunction():
	return x ** 2 + y ** 2;

# Функция интерполяции
def interpolation(data, arg_x, arg_y, pow_x, pow_y):
    data = (data[:,data[0,:].argsort()])[data[:, 0].argsort(), :]
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
