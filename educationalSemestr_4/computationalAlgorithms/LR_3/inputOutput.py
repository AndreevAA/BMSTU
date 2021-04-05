# Подгрузка данных из файла
def uploadData(inputDataFileName):
    inputDataTable = []; tempInputFile = open(inputDataFileName, "r").read().split();
    for tempCur in range(0, len(tempInputFile), 2): inputDataTable.append([float(tempInputFile[tempCur]), float(tempInputFile[tempCur + 1])])
    return inputDataTable;

def inputTemparatedX():
    inputTemparatedX = float(input('Введите X: '))
    return inputTemparatedX;

def inputDataComparator():
    return inputTemparatedX(), uploadData("input.txt");
    
