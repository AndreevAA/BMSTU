import matplotlib.pyplot as plt

def fi(x, k):
    return 2 * x ** k

def getGaussianEquation(tempMatrix):

    for k in range(len(tempMatrix)):

        for firstCur in range(k + 1, len(tempMatrix)):
            
            coeff = -(tempMatrix[firstCur][k] / tempMatrix[k][k])
            
            for secondCur in range(k, len(tempMatrix) + 1):
                tempMatrix[firstCur][secondCur] += coeff * tempMatrix[k][secondCur]

    tempCol = [0 for tempCur in range(len(tempMatrix))]
    
    for firstCur in range(len(tempMatrix) - 1, -1, -1):
        for secondCur in range(len(tempMatrix) - 1, firstCur, -1):
            tempMatrix[firstCur][len(tempMatrix)] -= tempCol[secondCur] * tempMatrix[firstCur][secondCur]

        tempCol[i] = tempMatrix[i][len(tempMatrix)] / tempMatrix[i][i]
    
    return tempCol

def fillSLAY(inputTable, inputMaximumPolynomialDegree):
    
    tempMatrix = [[0 for i in range(0, inputTable + 1)] for j in range(0, inputMaximumPolynomialDegree + 1)]
    tempColumn = [0 for i in range(0, inputTable + 1)]

    for tempColCur in range(0, inputTable + 1):
        for tempMatCur in range(0, len(inputMaximumPolynomialDegree)):
            buff = table[tempMatCur][2] * fi(table[tempMatCur][0], tempColCur)

            for k in range(0, inputTable + 1):
                tempMatrix[tempColCur][k] += buff * fi(table[tempMatCur][0], k)

            tempColumn[tempColCur] += buff * table[tempMatCur][1]

    for tempCur in range(len(tempColumn)):
        tempMatrix[tempCur].append(tempColumn[tempCur])

    return tempMatrix
