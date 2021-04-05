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
    
def outputResults(founded_root, exact_root):
	print("\nНайденное значение: ", founded_root)
	print("Точное значение:    ", exact_root)
	print("Относительная ошибка: %.2f" % abs(abs(exact_root - founded_root) / exact_root * 100), '%')
