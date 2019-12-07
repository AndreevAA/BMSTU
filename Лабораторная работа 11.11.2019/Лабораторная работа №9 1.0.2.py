# Андреев Александр Алексеевич ИУ7-14Б Лабораторная работа №9

from math import *
from time import *

# Трансировка строк списка
def trans(text_string):
   for i in range(2, len(text_string)):
      text_string = text_string.replace(" " * i, " ")
   return text_string

# Очистка "лишних" пробелов
def clean_spaces(text_string):
   if len(text_string) > 0:
      text_string = text_string.lstrip()
      text_string = text_string.rstrip()
      text_string = trans(trans(trans(text_string)))
   return text_string

# Нахождение максимальной длины строки в списке
def max_string_size(text):
   ans = -1
   for i in text: ans = max(ans, len(i))
   return ans

# Нахождение длины строки
def string_size(text):
   return len(text)

# Форматирование текста по ширине
def width_side(text):
   # Очистка от "лишних" пробелов
   for i in range(len(text)):
      text[i] = clean_spaces(text[i])

   # Нахождение самой длинной строки
   m = max_string_size(text)
   #print(m)
   l_words = []
   for i in range(len(text)):
      if text[i].count(" ") > 0 and abs(len(text[i]) - m) != 0:
         l_words.append(text[i].split()[len(text[i].split()) - 1])
      
         text[i] = text[i].replace(" ", ceil((m - len(text[i])) / text[i].count(" ")) * " " + " ")
         #text[i] = str("{:"+str(max_string_size(text))+"."+str(max_string_size(text))+"}").format(text[i][:len(text[i]) - len(latest_word)])
         #print("{:>" + str(m - len(text[i])) + "." + str(m - len(text[i])) + "}")
         #print(m, len(text[i]))
         text[i] = text[i][:len(text[i]) - 1 - len(l_words[len(l_words) - 1])]
         text[i] += str("{:>" + str(abs(m - len(text[i]))) + "." + str(abs(m - len(text[i]))) + "}").format(l_words[len(l_words) - 1])
   return text

# Форматирование текта по правой стороне
def right_side(text):
   left = 0
   
   for i in range(len(text)):
      if len(text[i]) > 0:
         text[i] = clean_spaces(text[i])
         text[i] = str("{:>"+str(max_string_size(text))+"."+str(max_string_size(text))+"}").format(text[i])
   return text

# Форматирование текста по левой стороне
def left_side(text):
   for i in range(len(text)):
      if len(text[i]) > 0:
         text[i] = clean_spaces(text[i])
      text[i] = str("{:<"+str(max_string_size(text))+"."+str(max_string_size(text))+"}").format(text[i])
   return text

# Замена слова в тексте
def word_replace(text):
   begin, end = input("Введите слово которое хотите заменить и на которое хотите заменить через пробел: ").split()
   for i in range(len(text)): text[i] = text[i].replace(begin, end)
   return text

# Удаление слова из текста
def delete_word(text):
   ans = []
   word = input("Введите слово, которое необходимо удалить: ")
   for i in range(len(text)):
      temp = text[i].split()
      res = []
      for j in range(len(temp)):
         if temp[j] != word: res.append(temp[j])
      prev = ""
      for j in range(len(res)): prev += res[j] + " "
      ans.append(prev)
   return ans

# Нахождение результата арифмитических выражений текста
def transformation_arifmetics(text):
   print(1)

# Преобразрование к строке списка 
def tranformation_to_string(text):
   res = ""
   for i in range(len(text)): res += text[i]
   return res

# Нахождение самого короткого слова
def shortest_word(text):
   res = ""; temp_width = None; string_number = -1;
   for i in range(text):
      temp = text[i].split()
      if temp_width == None: temp_width = len(temp)
      else:
         if len(temp) < temp_width: temp_width = len(temp); res = temp; string_number = i;
   return res, string_number

# Координатор вывода текста из списка
def coordinator(text):
   res = ""
   for i in range(len(text)): res += text[i] + "\n"
   return res    

# List to String
def list_to_str(temp):
   answer = ""
   for i in range(len(temp)):
      answer += temp[i] + " "
   return clean_spaces(answer)

# Счет
def trans_arifmetics(text):
   operations = []
   for i in range(len(text)):
      if text[i] == "/":
         operations.append(1)
      if text[i] == "*":
         operations.append(0)
   numbers = list(map(int, text.replace('*', '/').split('/')))
   answer = numbers[0]
   i = 1
   while i != len(numbers):
      if operations[i - 1] == 1:
         answer /= numbers[i]
      else:
         answer *= numbers[i]
      i += 1
   return str(answer)

# Замена арифметических выражений
def count_results(text):
   answer = []
   for i in range(len(text)):
      temp = text[i].split()
      for j in range(len(temp)):
         if temp[j].find("/0") == -1:
            
            if temp[j].find("/") != -1 or temp[j].find("*") != -1:
               temp[j] = trans_arifmetics(temp[j])
      answer.append(list_to_str(temp))
   return answer

# Проверка
def check(s):
	s = s.replace(",", "")
	s = s.replace(".", "")
	s = s.replace("-", "")
	s = s.replace(":", "")
	s = s.replace("?", "")
	s = s.replace("!", "")
	s = s.split()
	ans = 1000
	for i in range(len(s)):
		ans = min(ans, len(s[i]))
	return ans

# Удаление предложения с самым коротким словом
def f(text):
	base = ""
	for i in range(len(text)): base += text[i] + "\n"
	ans_sentance  = ""
	temp_sentance = ""
	for i in range(len(base) - 1):
		if base[i - 1] == "." or base[i - 1] == "!" or base[i - 1] == "?":
			if check(temp_sentance) < check(ans_sentance): ans_sentance = temp_sentance
			temp_sentance = ""
		else: temp_sentance += base[i]
	base = base.replace(ans_sentance, "")
	ans = base.split("\n")
	return ans

# Визуализация просса перезапуска
def end():
   print("Программа будет перезагружена", end = "")
   for i in range(3):
      sleep(1)
      print(".", end = "")
      
# Основная рабочая функция программы
def main():
   # Работа на считывание файлов
   output_text = open("output_text.txt", "w")
   input_text_0 = open("input_text.txt")
   input_text = str(input_text_0.read()).split("\n")

   # Чтение
   for_write_input_text = open("input_text.txt", "r").read();

   #input_text = right_side(input_text)
   #output_text.write(coordinator(input_text))
   
   flag = -1
   while flag != 0:
      print("\nВаш текст: ")
      print(coordinator(input_text))
      print("\n1) Выравнивание по ширине")
      print("2) Выравнивание по левому краю")
      print("3) Выравнивание по правому краю")
      print("4) Замена во всем тексте одного слова из текста другим")
      print("5) Удаление заданного слова из текста")
      print("6) Замена арифметических выражений, состоящих из умножения, деления, на результат вычисления")
      print("7) Удаление из текста предложения с самым коротким словом")
      print("0) Выход из программы\n")

      try:
         flag = int(input("Введите код операции: "))
         if flag == 1:
            input_text = width_side(input_text)
         elif flag == 2:
            input_text = left_side(input_text)
         elif flag == 3:
            input_text = right_side(input_text)
            print(coordinator(input_text))
         elif flag == 4:
            input_text = word_replace(input_text)
         elif flag == 5:
            input_text = delete_word(input_text)
         elif flag == 6:
            input_text = count_results(input_text)
         elif flag == 7:
            input_text = f(input_text)
         elif flag == 0:
            output_text.write(coordinator(input_text))
            break
      except ValueError:
         print("Попробуйте повторить ввод.")
         end()
         main()
   output_text.write(coordinator(input_text))
main(