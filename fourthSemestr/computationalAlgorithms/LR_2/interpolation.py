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
	tempZline = [];

	for tempCur in range(len(data)):
		if (tempCur % globals.numberOfColls == 0):
			dataCompRow[0].append(data[tempCur].xValue);

		if (tempCur < globals.numberOfColls):
			dataCompRow[1].append(data[tempCur].yValue);

		if (tempCur % globals.numberOfColls == 0 and tempCur > 0):
			
			dataCompRow[2].append(tempZline);
			tempZline = [];

		tempZline.append(data[tempCur].zValue);

def setSampleStart(samples, data, dataCompRow, y, m):
	i_y = nearest_number(dataCompRow[1], y)

	if i_y - (m + 1) / 2 < 0:
		samples[1] = dataCompRow[1][:int(i_y + int(ceil((m + 1) / 2)) + 1)]
		samples[2] = dataCompRow[2][:int(i_y + int(ceil((m + 1) / 2)) + 1)]
	elif len(data) < i_y + (m + 1) / 2:
	    samples[1] = dataCompRow[1][i_y - int(ceil((m + 1) / 2)):]
	    samples[2] = dataCompRow[2][i_y - int(ceil((m + 1) / 2)):]
	else:
	    if m % 2 != 0:
	        samples[1] = dataCompRow[1][i_y - int(ceil((m + 1) / 2)): i_y + int(ceil((m + 1) / 2))]
	        samples[2] = dataCompRow[2][i_y - int(ceil((m + 1) / 2)): i_y + int(ceil((m + 1) / 2))]
	    else:
	        samples[1] = dataCompRow[1][i_y - int(ceil((m + 1) / 2)) - 1: i_y + int(ceil((m + 1) / 2))]
	        samples[2] = dataCompRow[2][i_y - int(ceil((m + 1) / 2)) - 1: i_y + int(ceil((m + 1) / 2))]

def setSampleCur(samples, data, dataCompRow, x, n):
	left = 0
	right = 0	

	i_x = nearest_number(dataCompRow[0], x)

	if i_x - (n + 1) / 2 < 0:
		samples[0] = dataCompRow[0][:int(i_x + int(ceil((n + 1) / 2)) + 1)]
		right = i_x + int(ceil((n + 1) / 2) + 1)
	elif len(data) < i_x + (n + 1) / 2:
		samples[0] = dataCompRow[0][i_x - int(ceil((n + 1) / 2)):]
		left = i_x - int(ceil((n + 1) / 2))
		right = 6
	elif n % 2 != 0:
		samples[0] = dataCompRow[0][i_x - int(ceil((n + 1) / 2)): i_x + int(ceil((n + 1) / 2))]
		left = i_x - int(ceil((n + 1) / 2))
		right = i_x + int(ceil((n + 1) / 2))
	else:
		samples[0] = dataCompRow[0][i_x - int(ceil((n + 1) / 2)) - 1: i_x + int(ceil((n + 1) / 2))]
		left = i_x - int(ceil((n + 1) / 2)) - 1
		right = i_x + int(ceil((n + 1) / 2))

	for i in range(len(dataCompRow[2])):
		dataCompRow[2][i] = dataCompRow[2][i][int(left):int(right)]

def getMiddleCellStart(nearestList, nLevel):
	return nearestList - int(ceil((nLevel + 1) / 2));

def getMiddleCellEnd(nearestList, nLevel):
	return nearestList + int(ceil((nLevel + 1) / 2));

def setAllSamples(allSamples, dataCompRow, dataSize, x, y, nx, ny):
	i_y = nearest_number(dataCompRow[1], y) 

	if i_y - (ny + 1) / 2 < 0:
		allSamples[1], allSamples[2] = dataCompRow[1][:int(getMiddleCellEnd(i_y, ny) + 1)], dataCompRow[2][:int(getMiddleCellEnd(i_y, ny) + 1)]
	elif dataSize < i_y + (ny + 1) / 2:
		allSamples[1], allSamples[2] = dataCompRow[1][getMiddleCellStart(i_y, ny):], dataCompRow[2][getMiddleCellStart(i_y, ny):]
	else:
		if ny % 2 != 0:
			allSamples[1], allSamples[2] = dataCompRow[1][getMiddleCellStart(i_y, ny): getMiddleCellEnd(i_y, ny)], dataCompRow[2][getMiddleCellStart(i_y, ny): getMiddleCellEnd(i_y, ny)]
		else:
			allSamples[1], allSamples[2] = dataCompRow[1][getMiddleCellStart(i_y, ny) - 1: getMiddleCellEnd(i_y, ny)], dataCompRow[2][getMiddleCellStart(i_y, ny) - 1: getMiddleCellEnd(i_y, ny)]

def setAllCurs(allSamples, dataCompRow, dataSize, x, y, nx, ny):
	left = 0
	right = 0	

	i_x = nearest_number(dataCompRow[0], x)

	if i_x - (nx + 1) / 2 < 0:
		allSamples[0] = dataCompRow[0][:int(getMiddleCellEnd(i_x, nx) + 1)]
		right = getMiddleCellEnd(i_x, nx) + 1
	elif dataSize < i_x + (nx + 1) / 2:
		allSamples[0] = dataCompRow[0][getMiddleCellStart(i_x, nx):]
		left = getMiddleCellStart(i_x, nx)
		right = 6
	elif nx % 2 != 0:
		allSamples[0] = dataCompRow[0][getMiddleCellStart(i_x, nx): getMiddleCellEnd(i_x, nx)]
		left = getMiddleCellStart(i_x, nx)
		right = getMiddleCellEnd(i_x, nx)
	else:
		allSamples[0] = dataCompRow[0][getMiddleCellStart(i_x, nx) - 1: getMiddleCellEnd(i_x, nx)]
		left = getMiddleCellStart(i_x, nx) - 1
		right = getMiddleCellEnd(i_x, nx)

	for i in range(len(allSamples[2])):
		allSamples[2][i] = allSamples[2][i][int(left):int(right)]


def getComparatorStatus(dataCompRow, data, x, y, nx, ny):
    create_table(dataCompRow, data)

    allSamples = [[], [], []]
    	
    setAllSamples(allSamples, dataCompRow, len(data), x, y, nx, ny);
    setAllCurs(allSamples, dataCompRow, len(data), x, y, nx, ny);
    
    answ = []

    for i in range(len(allSamples[1])):
        answ.append(newton_interpolation(allSamples[0], allSamples[2][i], x))

    result = getFunction(x, y)
    
    print('Real result: {}'.format(result))

    return newton_interpolation(allSamples[1], answ, y)
