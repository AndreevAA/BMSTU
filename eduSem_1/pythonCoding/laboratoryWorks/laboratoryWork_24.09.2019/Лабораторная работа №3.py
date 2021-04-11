# Лабораторная работа №3 Андреев Александр ИУ7-14Б
# Задание:
# - Определить длину сторон треугольника по целочисленным координатам вершин треугольника. 
# - Найти также длину биссектрисы, проведенную из наименьшего угла треугольника. 
# - Ввести координаты одной точки и определить ее принадлежность треугольнику. Если находится, то найти расстояние от этой точки до ближайшей стороны или ее продолжения. 
# - Проверить, является ли треугольник прямоугольным.

from math import *

print("Введите целочисленное значение координат:")
X1, Y1 = list(map(int, input(" Первой  вершины треугольника X1, Y1 через пробел: ").split()));
X2, Y2 = list(map(int, input(" Второй  вершины треугольника X2, Y2 через пробел: ").split()));
X3, Y3 = list(map(int, input(" Третьей вершины треугольника X3, Y3 через пробел: ").split()));

# Определение длин сторон треугольника по целочисленным координатам вершин треугольника
triangle_side_1 = sqrt((X1 - X2) ** 2 + (Y1 - Y2) ** 2);
triangle_side_2 = sqrt((X2 - X3) ** 2 + (Y2 - Y3) ** 2);
triangle_side_3 = sqrt((X3 - X1) ** 2 + (Y3 - Y1) ** 2);

max_side = max([triangle_side_1, triangle_side_2, triangle_side_3])
min_side = min([triangle_side_1, triangle_side_2, triangle_side_3])
sum_side = triangle_side_1 + triangle_side_2 + triangle_side_3;
if triangle_side_1 + triangle_side_2 + triangle_side_3 - max_side > max_side:
                
        # Нахождение длины биссектрисы, проведенной из наименьшего угла треугольника
        P1 = 0.5 * (triangle_side_1 + triangle_side_2 + triangle_side_3)
        P2 = 0.5 * (triangle_side_1 + triangle_side_2 + triangle_side_3)
        P3 = 0.5 * (triangle_side_1 + triangle_side_2 + triangle_side_3)
        devision_length_1 = 2 * (sqrt(triangle_side_1 * triangle_side_2 * P1 * (P1 - triangle_side_3))) / (triangle_side_1 + triangle_side_2);
        devision_length_2 = 2 * (sqrt(triangle_side_2 * triangle_side_3 * P2 * (P2 - triangle_side_1))) / (triangle_side_2 + triangle_side_3);
        devision_length_3 = 2 * (sqrt(triangle_side_3 * triangle_side_1 * P3 * (P3 - triangle_side_2))) / (triangle_side_3 + triangle_side_1);

        # Определение принадлжености точки треугольнику и нахождение расстояния до ближайшей стороны или ее продолжения
        temp_X, temp_Y = list(map(int, input("Введите целочисленное значение координат точки для проверки ее принадлежности треугольнику temp_X, temp_Y через пробел: ").split()));
        D1 = (X1 - temp_X) * (Y2 - Y1) - (Y1 - temp_Y) * (X2 - X1);
        D2 = (X2 - temp_X) * (Y3 - Y2) - (Y2 - temp_Y) * (X3 - X2);
        D3 = (X3 - temp_X) * (Y1 - Y3) - (Y3 - temp_Y) * (X1 - X3);

        par = 0;

        print("\n" + "Заданы: \n  - треугольник (1-2-3) координатами вершин X1 = ", X1, "Y1 =", Y1, "X2 =", X2, "Y2 =", Y2, "X3 =", X3, "Y3 =", Y3, "\n  - точка temp(" + str(temp_X) + ", " + str(temp_Y) + ")\nОтвет:");
        if (D1 <= 0 and D2 <= 0 and D3 <= 0) or (D1 >= 0 and D2 >= 0 and D3 >= 0):
                print("  - Введенная   точка  temp(" + str(temp_X) + ", " + str(temp_Y) + "):  расположена внутри треугольника")
                distance_temp_1_2 = ((Y1 - Y2) * temp_X + (X2 - X1) * temp_Y + (X1 * Y2 - X2 * Y1)) / (sqrt((X2 - X1) ** 2 + (Y2 - Y1) ** 2));
                distance_temp_2_3 = ((Y2 - Y3) * temp_X + (X3 - X2) * temp_Y + (X2 * Y3 - X3 * Y2)) / (sqrt((X3 - X2) ** 2 + (Y3 - Y2) ** 2));
                distance_temp_3_1 = ((Y3 - Y1) * temp_X + (X1 - X3) * temp_Y + (X3 * Y1 - X1 * Y3)) / (sqrt((X1 - X3) ** 2 + (Y1 - Y3) ** 2));
                par = 1
                print("  - Растояние до ближайшей стороны:", min(min(distance_temp_1_2, distance_temp_2_3), distance_temp_3_1), "");
        if par == 0:
                print("  - Введенная   точка  temp(" + str(temp_X) + ", " + str(temp_Y) + "):  расположена снаружи треугольника")


        # Проверка треугольника на прямоугольность
        temp_a1 = ((X1 - X2) ** 2 + (Y1 - Y2) ** 2)
        temp_b1 = ((X2 - X3) ** 2 + (Y2 - Y3) ** 2)
        temp_c1 = ((X3 - X1) ** 2 + (Y3 - Y1) ** 2)
        a2 = temp_a1 + temp_b1 - temp_c1
        b2 = temp_b1 + temp_c1 - temp_a1
        c2 = temp_c1 + temp_a1 - temp_b1
        if a2 * b2 * c2 == 0:
            print("  - Треугольник с веденными координатыми вершин X1 = ", X1, "Y1 =", Y1, "X2 =", X2, "Y2 =", Y2, "X3 =", X3, "Y3 =", Y3, "является прямоугольным")
        if a2 * b2 * c2 != 0:
            print("  - Введенный  треугольник (1-2-3): не является прямоугольным")
        print("  - Длина биссектрисы из наименьшего угла:", "{:.6}".format(max(devision_length_1, devision_length_2, devision_length_3)))

else:
        print(" Треугольник с данными координатами не может существовать, так как длина максимальной стороны равна сумме двух других! Попробуйте повторить ввод с другими данными!") 
