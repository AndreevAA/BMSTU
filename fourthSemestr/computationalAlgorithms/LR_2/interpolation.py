import globals, input_output
import numpy as np
from math import *

# Получение значения обтекающей функции
def getFunction(x, y):
	return x ** 2 + y ** 2;

# Поиск ближайшего числа
def getNearNumbers(tempInputList, x):
    leftCur, rightCur = 0, len(tempInputList) - 1;
    while leftCur < rightCur:
        if tempInputList[int((leftCur + rightCur) / 2)] >= x: rightCur = int((leftCur + rightCur) / 2)
        else: leftCur = int((leftCur + rightCur) / 2) + 1
    return rightCur


def recurs_function(xs, ys):
    l = len(xs)
    if l == 1:
        return ys[0]
    else:
        return (recurs_function(xs[:-1], ys[:-1]) - recurs_function(xs[1:], ys[1:])) / (xs[0] - xs[l - 1])


def getNumberByNewtonInterpolationInSamples(tempInputListX, tempInputListZ, x):
    z_x = tempInputListZ[0]
    for i in range(1, len(tempInputListX)):
        k = 1
        for j in range(i):
            k *= (x - tempInputListX[j])
        dd = recurs_function(tempInputListX[:i+1], tempInputListZ[:i+1])
        z_x += (k * recurs_function(tempInputListX[:i+1], tempInputListZ[:i+1]))
    return z_x

def getTrasmittedTable(dataCompRow, data):
	try:
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
		return globals.SUCCESS_STATUS;
	except:
		return globals.ERROR_STATUS;

def getMiddleCellStart(nearestList, nLevel):
	return nearestList - int(ceil((nLevel + 1) / 2));

def getMiddleCellEnd(nearestList, nLevel):
	return nearestList + int(ceil((nLevel + 1) / 2));

def setAllSamples(allSamples, dataCompRow, dataSize, x, y, nx, ny):
	i_y = getNearNumbers(dataCompRow[1], y) 

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

	i_x = getNearNumbers(dataCompRow[0], x)

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

def getAnswerListOfNewtonInterpolations(allSamples, x):
	aswerListOfNewtonInterpolations = list();
	for tempCur in range(len(allSamples[1])):
		aswerListOfNewtonInterpolations.append(getNumberByNewtonInterpolationInSamples(allSamples[0], allSamples[2][tempCur], x))
	return aswerListOfNewtonInterpolations;

def getComparatorStatus(dataCompRow, data, x, y, nx, ny, functionValue, newtonInterpolationValue):
	try:
	    allSamples = [[], [], []]
	    setAllSamples(allSamples, dataCompRow, len(data), x, y, nx, ny);
	    setAllCurs(allSamples, dataCompRow, len(data), x, y, nx, ny);
	    globals.functionValue, globals.newtonInterpolationValue = getFunction(x, y), getNumberByNewtonInterpolationInSamples(allSamples[1], getAnswerListOfNewtonInterpolations(allSamples, x), y);
	    return globals.SUCCESS_STATUS;
	except:
		return globals.ERROR_STATUS;

