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

# Рекурсивна обработка до единичного
def getCongestionValue(xValues, yValues):
    numberOfColls = len(xValues)
    while numberOfColls != 1:
    	return (getCongestionValue(xValues[:-1], yValues[:-1]) - getCongestionValue(xValues[1:], yValues[1:])) / (xValues[0] - xValues[numberOfColls - 1]);
    return yValues[0];

# Получение значения интерполяции Ньютона 
def getNumberByNewtonInterpolationInSamples(tempInputListX, tempInputListZ, x):
    answerNumberByNewtonInterpolationInSamples = tempInputListZ[0]
    for rightCur in range(1, len(tempInputListX)):
        multiplyedValue = 1
        for leftCur in range(rightCur): multiplyedValue *= (x - tempInputListX[leftCur])
        answerNumberByNewtonInterpolationInSamples += (multiplyedValue * getCongestionValue(tempInputListX[:rightCur + 1], tempInputListZ[:rightCur + 1]))
    return answerNumberByNewtonInterpolationInSamples

# Преобразование таблицы в удобный вид
def getTrasmittedTable(dataCompRow, data):
	try:
		tempZline = [];
		for tempCur in range(len(data)):
			if (tempCur % globals.numberOfColls == 0): dataCompRow[0].append(data[tempCur].xValue);
			if (tempCur < globals.numberOfColls): dataCompRow[1].append(data[tempCur].yValue);
			if (tempCur % globals.numberOfColls == 0 and tempCur > 0):
				dataCompRow[2].append(tempZline);
				tempZline = [];
			tempZline.append(data[tempCur].zValue);
		return globals.SUCCESS_STATUS;
	except:
		return globals.ERROR_STATUS;

# Получение среднего для старта
def getMiddleCellStart(nearestList, nLevel):
	return nearestList - int(ceil((nLevel + 1) / 2));

# Получение среднего для конца
def getMiddleCellEnd(nearestList, nLevel):
	return nearestList + int(ceil((nLevel + 1) / 2));

# Установка всех промежутков для каждого этапа по Х, У, Z
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

# Сдвиг курсоров 
def setAllCurs(allSamples, dataCompRow, dataSize, x, y, nx, ny):
	leftCur, rightCur = 0, 0;
	nearestXValueNumber = getNearNumbers(dataCompRow[0], x)
	if nearestXValueNumber - (nx + 1) / 2 < 0:
		allSamples[0] = dataCompRow[0][:int(getMiddleCellEnd(nearestXValueNumber, nx) + 1)]
		rightCur = getMiddleCellEnd(nearestXValueNumber, nx) + 1
	elif dataSize < nearestXValueNumber + (nx + 1) / 2:
		allSamples[0] = dataCompRow[0][getMiddleCellStart(nearestXValueNumber, nx):]
		leftCur, rightCur = getMiddleCellStart(nearestXValueNumber, nx), 6
	elif nx % 2 != 0:
		allSamples[0] = dataCompRow[0][getMiddleCellStart(nearestXValueNumber, nx): getMiddleCellEnd(nearestXValueNumber, nx)]
		leftCur, rightCur = getMiddleCellStart(nearestXValueNumber, nx), getMiddleCellEnd(nearestXValueNumber, nx)
	else:
		allSamples[0] = dataCompRow[0][getMiddleCellStart(nearestXValueNumber, nx) - 1: getMiddleCellEnd(nearestXValueNumber, nx)]
		leftCur, rightCur = getMiddleCellStart(nearestXValueNumber, nx) - 1, getMiddleCellEnd(nearestXValueNumber, nx)

	for tempCur in range(len(allSamples[2])):
		allSamples[2][tempCur] = allSamples[2][tempCur][int(leftCur):int(rightCur)]

# Заполнение массива значениями интерполяции
def getAnswerListOfNewtonInterpolations(allSamples, x):
	aswerListOfNewtonInterpolations = list();
	for tempCur in range(len(allSamples[1])):
		aswerListOfNewtonInterpolations.append(getNumberByNewtonInterpolationInSamples(allSamples[0], allSamples[2][tempCur], x))
	return aswerListOfNewtonInterpolations;

# Основной компаратор вызова функций обработки
def getComparatorStatus(dataCompRow, data, x, y, nx, ny, functionValue, newtonInterpolationValue):
	try:
	    allSamples = [[], [], []]
	    setAllSamples(allSamples, dataCompRow, len(data), x, y, nx, ny);
	    setAllCurs(allSamples, dataCompRow, len(data), x, y, nx, ny);
	    globals.functionValue, globals.newtonInterpolationValue = getFunction(x, y), getNumberByNewtonInterpolationInSamples(allSamples[1], getAnswerListOfNewtonInterpolations(allSamples, x), y);
	    return globals.SUCCESS_STATUS;
	except:
		return globals.ERROR_STATUS;

