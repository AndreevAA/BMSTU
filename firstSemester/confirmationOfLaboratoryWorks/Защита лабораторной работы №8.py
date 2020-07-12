# Защита лабораторной работы №8
# Андреев Александр ИУ7-14Б

def f(x):
   return x ** 3 + 1

def main():
   # Ввод
   a, b = list(map(float, input("Введите границы a, b через пробел: ").split()))
   n = int(input("Введите количество разбиений: "))
   h = (b - a) / n # Ширина прямоугольника
   s = 0
   for i in range(1, n + 1):
      s += f(a + i * h)
   s *= h
   return s
   
print("Интеграл на заданном промежутке: {:10.6}".format(main()))
