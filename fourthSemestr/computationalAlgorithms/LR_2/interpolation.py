import globals
import numpy as np
from math import *

# Получение значения обтекающей функции
def getFunction(x, y):
	return x ** 2 + y ** 2;

# Поиск ближайшего числа
def nearest_number(lst, x):
    a = 0
    b = len(lst) - 1
    while a < b:
        m = int((a + b) / 2)
        if x > lst[m]:
            a = m + 1
        else:
            b = m
    return b

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

def create_table(dataCompRow, data):
	for tempCur in range(len(data)):
		if (tempCur % globals.numberOfColls == 0):
			dataCompRow[0].append(data[tempCur].xValue);

		if (tempCur < globals.numberOfColls):
			dataCompRow[1].append(data[tempCur].yValue);

		if (tempCur % globals.numberOfColls == 0 and tempCur > 0):
			
			dataCompRow[2].append(tempZline);
			tempZline = [];

		tempZline.append(data[tempCur].zValue);

def getComparatorStatus(dataCompRow, data, x, y, n, m):
    create_table(dataCompRow, data)

    i_y = nearest_number(ys, y)

    if i_y - (m + 1) / 2 < 0:
        sample_y = ys[:int(i_y + int(ceil((m + 1) / 2)) + 1)]
        sample_z = zs[:int(i_y + int(ceil((m + 1) / 2)) + 1)]
    elif len(data) < i_y + (m + 1) / 2:
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

    i_x = nearest_number(xs, x)
    
    if i_x - (n + 1) / 2 < 0:
        sample_x = xs[:int(i_x + int(ceil((n + 1) / 2)) + 1)]
        right = i_x + int(ceil((n + 1) / 2) + 1)
    elif len(data) < i_x + (n + 1) / 2:
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

    result = getFunction(x, y)
    
    print('Real result: {}'.format(result))

    return newton_interpolation(sample_y, answ, y)
