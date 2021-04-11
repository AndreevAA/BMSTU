# Найти подпоследовательность в списке с наибольшим количеством нечетных элементов
# Андреев А.А. ИУ7-14Б Защита 6

a = input("Введите последовательность через пробел: ").split()


ans = []; temp_ans = []; prev_k = 0;
for i in range(0, len(a)):
    numbers = 0
    points = 0
    for j in range(len(a[i])):
        if "0" <= a[i][j] <= "9":
            numbers += 1
        if a[i][j] == ".":
            points += 1
        
    if numbers + points == len(a[i]) and points <= 1:
        if len(temp_ans) == 0:
            if float(a[i]) % 2 != 0:
                temp_ans = [float(a[i])];
                prev_k = i
        else:
            if float(a[i]) % 2 != 0 and prev_k + 1 == i:
                temp_ans.append(float(a[i]));
                prev_k += 1
            else:
                if len(temp_ans) > len(ans):
                    ans = temp_ans; temp_ans = []
                    prev_k = i + 1
       # print(prev_k, i, a[i], temp_ans)
if len(temp_ans) > len(ans):
    ans = temp_ans
    
if len(a) == 1 and a[0] % 2 != 0:
    print("Длина наибольшей числовой последовательности: " + str(1) + "\nЭлементы наибольшей числовой последовательности:", *a) 
elif len(ans) == 0:
    print("В веденной силовой последовательности отсутстсвуют нечетные элементы.")
else:
    print("Длина наибольшей числовой последовательности: " + str(len(ans)) + "\nЭлементы наибольшей числовой последовательности:", *ans) 
