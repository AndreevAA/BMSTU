# Лабораторная работа №6
# Программа выполняет поворот введенной квадратной матрицы длиной <= 8 на 180
# градусов по часовой стрелке
k = int(input("Введите размер квадратной матрицы k <= 8: "))

input_matrix  = []
none_lists = [0]
for i in range(k - 1):
        none_lists.append(0)
result_matrix = [none_lists] * k
for i in range(k):
	input_matrix.append(input().split())
for i in range(k):
        temp = []
        j = k - 1
        while j >= 0:
                temp.append(input_matrix[i][j])
                j -= 1
        result_matrix[k - i - 1] = temp
        #print(temp)
                
print("Введенная таблица: ")
for i in range(k):
        for j in range(k):
                print("{:<4.4}".format(input_matrix[i][j]), end = " ")
        print()

print("\nПовернутая на 180 градусов по часовой стрелке таблица: ")
for i in range(k):
        for j in range(k):
                print("{:<4.4}".format(result_matrix[i][j]), end = " ")
        print()
