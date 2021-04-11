# Андреев Александр ИУ7-14Б
# Защита лабораторной работы №5

x = float(input("Введите значение x: "))
eps = float(input("Введите точность eps: "))

n = 1; ans = 0
prev_num = ((-1) ** n) * ((2 * x)** 2) / 2;
ans = prev_num; 

#print(ans, prev_num)
while abs(prev_num) >= eps:
    prev_num = ((-1) ** (n + 1)) * abs(prev_num) * (4 * x * x) / ((n * 2) + 1) / ((n * 2) + 2)
    #print( ((-1) ** (n + 1)), prev_num, (4 * x * x), ((n * 2) + 1), ((n * 2) + 2) )
    ans += prev_num
    n += 1
    print (prev_num)

print("Сумма ряда: {:<10.6}".format(ans))
