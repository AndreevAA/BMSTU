# Лабораторная работа №7 21.10.2019
# Ввести матрицу А(8, 10), записать в список P отрицательные элементы.
# Если отрицательных элементов нет, то вывести сообщение
# Андреев А.А. ИУ7-14Б

# Рекурсивный анализ ввода до того момента, пока пользователь не введет строку верно
def vvod(m, temp_line):
   returned_B = check(temp_line)
   #print (len(returned_B), len(temp_line), m)
   
   if len(returned_B) == len(temp_line) == m:
      #print(returned_B)
      return returned_B
   else:
      temp_line = input("Ошибка при вводе строки. Попробуйте снова!\n").split()
      vvod(m, temp_line)

#Проверка на спец. символы
def check_special(a):
   ans = 0
   #print(a)
   for i in range(len(a)):
      if a[i] == "-" or a[i] == "+" or a[i] == ";" or a[i] == "- " or a[i] == "+ " or a[i] =="; ":
         ans += 1
   #print(ans)
   if a == "-" or a == "+" or a==";" or a == "- " or a == "+ " or a=="; ": return 0

   else:
      if ans <= 1:
         return 1
      else: return 0
   
# Проверка списка на действительность его элементов
def check(A):
   kol = 0
   B = []

   # Пробег по всей строке
   for i in range(len(A)):
       S = A[i]
       kole = 0
       koltochka = 0
       kolminus = 0
       kolplus = 0
       flag = 1

       # Пробег по подстроке
       for j in range(len(S)):
           if "0" <= S[j] <= "9":
               pass
           elif S[j] == "e":
               kole += 1
           elif S[j] == ".":
               koltochka += 1
           elif S[j] == "-":
               kolminus += 1
           elif S[j] == "+":
               kolplus += 1
           else:
               flag = 0
       if len(S) == 1:
           S += " "
       if S[1] == "-" or S[1] == "+":
           continue
       if ((kolminus <= 1 or kolplus <= 1) and kole == 0 and koltochka <= 1) \
               and (S[0] == "-" or S[0] == "+") and check_special(S) == 1:
           B.append(float(S))
           continue
       if kole > 1 or koltochka > 1 or kolminus > 2 or kolplus > 2:
           flag = 0
       if flag:
           indexe = -1
           indextochka = -1
           indexminus = 1e30
           indexplus = 1e30
           start = 0
           if S[0] == "-":
               start = 1
           elif S[0] == "+":
               start = 1
           elif S[0] == ".":
               pass
           for j in range(start, len(S), 1):
               if S[j] == "e":
                   indexe = j
               elif S[j] == ".":
                   indextochka = j
               elif S[j] == "-":
                   indexminus = j
               elif S[j] == "+":
                   indexplus = j
           if indextochka < indexe and (indexe + 1 == indexminus or indexe + 1 == indexplus or\
                   (indexminus == 1e30 and indexplus == 1e30)) and\
                   indexe > 0 and indexminus > indexe and indexplus > indexe:
               flag = 1
           else:
               flag = 0
           if indexe == len(S) - 1:
               flag = 0
       if flag and check_special(S) == 1:
           B.append(float(S))

       # Проверяю без е
       if kolminus <= 1 and kolplus <= 1 and kole == 0 and koltochka <= 1:
           koltochka = 0
           kolminus = 0
           kolwords = 0
           numberminus = 0
           chislo = ""
           for j in range(len(A[i])):
               if S[j] == "-":
                   kolminus += 1
                   numberminus = j
                   chislo += S[j]
               elif S[j] == ".":
                   koltochka += 1
                   chislo += S[j]
               elif "0" <= S[j] <= "9":
                   chislo += S[j]
               else:
                   kolwords += 1
           if koltochka < 2 and kolwords == 0 and S[j] != "." and S[j] != "-." and numberminus == 0 and check_special(chislo) == 1:
               B.append(float(chislo))
   return B

# Ввод данных
A = []; P = [];
n, m = list(map(int, input("Введите размер матрицы A(n, m) через пробел: ").split()))
print("\nВведите вещественные значения матрицы A("+str(n) + ", " + str(m) + "):")
for i in range(n):
      temp_line = input().split()
      temp_line = vvod(m, temp_line)
      print("В " + str(i + 1) + "-й строке матрицы вы ввели элементы:", *temp_line)
      A.append(temp_line)
      
for i in range(n):
      for j in range(m):
            if A[i][j] < 0:
                  P.append(A[i][j])
P.sort()

# Вывод данных
print("\nВведенная матрица A("+str(n) + ", " + str(m) + "):")
for i in range(n):
      for j in range(m):
            print(A[i][j], end = " ")
      print()
if len(P) == 0:
      print("\nВ веденной матрице не было найдено ни одного отрицательного элемента!")
else:
      print("\nВектор P: \n", *P)
