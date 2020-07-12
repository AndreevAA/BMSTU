# Андреев Александр ИУ7-14Б
# Вычисление интеграла методом правых прямоугольников и гипербол

base = []

def f(x): # Функция а исходном виде
  return 3 * x - x * x

def F(x): # Первообразная функции 
  return 1.5 * x * x - x ** 3 / 3

def simpson(f, a, b, n): # Вычисление методом симпсона
  global base
  h = (b - a) / n
  k = 0.0
  x = a + h
  for i in range(1, int(n // 2 + 1)):
      k += 4 * f(x)
      x += 2 * h

  x = a + 2 * h
  for i in range(1, n // 2):
      k += 2 * f(x)
      x += 2 * h
  return (h / 3) * (f(a) + f(b) + k)

def right_retangle(f, a, b, e): # Вычисление методом интеграла правых прямоугольников
  width = (b - a) / e; x = a; ans = 0
  while x <= b:
    ans += width * f(x + width)
    x += width
  return ans

def main():
  a, b = list(map(int, input("Введите через пробел левую и правую границу вычисления интеорала: ").split()))
  n1, n2 = list(map(int, input("Введите значения точности вычисления интеграла n1 и n2 через пробел: ").split()))
  simpson_integral_1 = simpson(f, a, b, n1)
  simpson_integral_2 = simpson(f, a, b, n2)
  right_retangle_integral_1 = right_retangle(f, a, b, n1)
  right_retangle_integral_2 = right_retangle(f, a, b, n2)
  column_1 = " Методы интегрирования"
  column_2 = " Участок разбиения 1"
  column_3 = " Участок разбиения 2"
  method_1 = " Метод парабол"
  method_2 = " Метод правых прямоугольников"
  #print("Вычисленный определенный интеграл методом")
  #print("  парабол равен:", simpson_integral);
  #print("  правых прямоугольников равен:", right_retangle_integral)
  print(chr(9484) + chr(9472) * 30 + chr(9516) + chr(9472)*22 + chr(9516) + chr(9472)*22 + chr(9488))
  
  print(chr(9474) + "{:<30}".format(column_1) + chr(9474) + "{:<22}".format(column_2) + chr(9474) + "{:<22}".format(column_3) + chr(9474))
  
  print(chr(9500) + chr(9472) * 30 + chr(9532) + chr(9472)*22 + chr(9532) + chr(9472)*22 + chr(9508) + "\n" + chr(9474) + "{:<30}".format(method_1) + chr(9474) + " {:<21.8}".format(simpson_integral_1) + chr(9474) + " {:<21.8}".format(simpson_integral_2) + chr(9474))
  
  print(chr(9500) + chr(9472) * 30 + chr(9532) + chr(9472) * 22 + chr(9532) + chr(9472) * 22 + chr(9508) + "\n" + chr(9474) + "{:<30}".format(method_2) + chr(9474) + " {:<21.8}".format(right_retangle_integral_1) + chr(9474) + " {:<21.8}".format(right_retangle_integral_2) + chr(9474))
  
  print(chr(9492) + chr(9472)*30 + chr(9524) + chr(9472) * 22 + chr(9524) + chr(9472) * 22 + chr(9496))

  real_sum = abs(F(a) - F(b))

  dif_simpson_integral_1 = abs(real_sum - simpson_integral_1) / real_sum
  dif_right_retangle_integral_1 = abs(right_retangle_integral_1 - real_sum) / real_sum

  #print(dif_simpson_integral_1, dif_right_retangle_integral_1)
  if dif_simpson_integral_1 > dif_right_retangle_integral_1:
    print("Вычисление интеграла методом правых треугольников более точнее!")
  elif dif_simpson_integral_1 < dif_right_retangle_integral_1:
    print("Вычисление интеграла методом гипербол треугольников более точнее!")
  else:
    print("Точность вычисления обоими методами одинаковая!")
  #print(dif_right_retangle_integral_1 / dif_right_retangle_integral_1 * 100)

  eps = float(input("Введите точность eps: "))
  i = 1

  if (right_retangle_integral_1 + right_retangle_integral_2) / 2 <= (simpson_integral_1 + simpson_integral_2) / 2:
    while (abs(right_retangle(f, a, b, i) - real_sum)) > eps:
      if i >= 10000:
        break
      i += 1
    if i == 10000:
      print("Вычислить интеграл заданной точности не удалось.")
    else:
      print("Интеграл равен =", "{:<.6}".format(right_retangle(f, a, b, i)),"за",i,"разбиений.")
      print("Разница:", "{:<.4}".format(abs(right_retangle(f, a, b, i) - real_sum)), "(" + str("{:<.4}".format((abs(right_retangle(f, a, b, i) - real_sum)) / real_sum * 100) + "%)"))
  else:
    while (abs(simpson(f, a, b, i) - real_sum)) > eps:
      if i >= 10000:
        break
      i += 1
    if i == 10000:
      print("Вычислить интеграл заданной точности не удалось.")
    else:
      print("Интеграл равен =", "{:<.6}".format(simpson(f, a, b, i)),"за",i,"разбиений.")
main()
