# Решение задачи №3 на определение принадлежности точки выделенной области

X, Y = list(map(float, input("Введите значения X,Y через пробел: ").split()));

if Y >= 0 and 0 <= X <= 4 and Y <= (-X + 4) and Y <= X:
    if (1 <= X <= 3):
        if (Y * Y >= 1 - (X - 2)**2):
            print("Точка с координатами X =", X, "Y =", Y, "принадлежит выделенной области");
        else:
            print("Точка с координатами X =", X, "Y =", Y, "не принадлежит выделенной области");   
    else:
        print("Точка с координатами X =", X, "Y =", Y, "принадлежит выделенной области");
else:
    print("Точка с координатами X =", X, "Y =", Y, "не принадлежит выделенной области");    
