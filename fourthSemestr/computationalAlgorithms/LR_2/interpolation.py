import globals
import numpy as np
from math import *

# Получение значения обтекающей функции
def getFunction():
	return x ** 2 + y ** 2;

# # Поиск ближайшего числа
# def getNearestNumberComparator(data, tempNumber, tempValidator):
# 	leftCur = 0; rightCur = len(data) - 1;
# 	while leftCur < rightCur:
# 		middleCur = int((leftCur + rightCur) / 2)
# 		if (tempValidator == "x"):
# 			if tempNumber > data[middleCur].xValue:
# 				leftCur = middleCur + 1
# 			else:
# 				rightCur = middleCur
# 		if (tempValidator == "y"):
# 			if tempNumber > data[middleCur].yValue:
# 				leftCur = middleCur + 1
# 			else:
# 				rightCur = middleCur
# 		else:
# 			if tempNumber > data[middleCur].zValue:
# 				leftCur = middleCur + 1
# 			else:
# 				rightCur = middleCur
# 	return rightCur

# def getRecursFunction(data):
#     temoDataLength = len(data)
#     if temoDataLength == 1:
#         return data[0].zValue;
#     else:
#         return (recurs_function(data[:-1]) - recurs_function(data[1:])) / (data[0].xValue - data[temoDataLength - 1].xValue)

# # Произведение интерполяциии Ньютона
# def getNewtonInterpolation(data, x):
# 	tempNumberOfNearestXValue(data, x, "x");
# 	z_x = data[0].zValue;
# 	for i in range(1, len(data)):
#         k = 1
#         for j in range(i):
#             k *= (x - data[j].xValue)
#         dd = getRecursFunction(data[:i+1]) #x, z
#         z_x += (k * dd)
#     return z_x


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

def create_table(data):
	xs = [];
	ys = [];
	zs = [];

	for tempCur in data:
		xs.append(tempCur.xValue);
		ys.append(tempCur.yValue);
		zs.append(tempCur.zValue);

	return xs, ys, zs;

def getComparatorStatus(data, x, y, n, m):
    xs, ys, zs = create_table(data)

    print();

    for i in range(len(data)):
    	print(xs[i], ys[i], zs[i]);

    i_x = nearest_number(xs, x)
    i_y = nearest_number(ys, y)

    lx = len(data)
    ly = len(data)
    
    sample_x = [];
    sample_y = [];
    sample_z = [];

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

    print(sample_z);
    for i in range(len(sample_z)):
        sample_z[i] = sample_z[i][int(left):int(right)]

    answ = []

    for i in range(len(sample_y)):
        answ.append(newton_interpolation(sample_x, sample_z[i], x))

    result = func(x, y)
    print('Real result: {}'.format(result))
    return newton_interpolation(sample_y, answ, y)
