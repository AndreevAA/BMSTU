from math import *

# Ввод значений
start = float(input("Введите вещественное значение начала перебора значения X: "))
end   = float(input("Введите вещественное значание конца перебора  значения X: "))
step  = float(input("Введите вещественное значание шага перебора  значения  X: "))

width = 70
height= 50
y_min = 1e100
y_max = -1e100

temp_x = start
while temp_x <= end:
    y = 2 * cos(2*temp_x) + 2
    y_min = min(y_min, y)
    y_max = max(y_max, y)
    temp_x += step

temp_x = start
delen = abs(y_max - y_min) / width

print(" " * 10 + "{:<6.4}".format(y_min) + " " * 69 + "{:<6.4}".format(y_max))
print(" " * 10 + chr(9472) * 2 + chr(9532)  + 69 * chr(9472) +  chr(9532))

while temp_x <= end:
    y = 2 * cos(2*temp_x) + 2
    ans = str("{:<10.6}".format(temp_x)) + chr(9474) + " " * floor(y / delen) + "*"
    print(ans)
    temp_x += step
