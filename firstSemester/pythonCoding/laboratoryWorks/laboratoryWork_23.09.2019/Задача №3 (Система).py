#Решение задачи №3 на нахождение значения S  при заданных параметрах a,c
from math import sqrt

a,c,x = list(map(float, input("Введите значения a,c,x через пробел: ").split()));

if a * x * x < c:
    s = 2 * (c ** (0.85 * a));
elif a * x * x >= c:
    s = sqrt(a * x * x - c);

print("Вычисленное начение переменной S =", s, "при введенных значениях a =", a, "c =", c, "x = ", x)
