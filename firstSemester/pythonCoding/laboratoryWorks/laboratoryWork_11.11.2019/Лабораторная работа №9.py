# Андреев Александр Алексеевич ИУ7-14Б Лабораторная работа №8

# 
def max_string_size(text):
   ans = -1
   for i in text: ans = max(ans, len(i))
   return ans

#
def width_side(text):
   m = max_string_size
   for i in range(len(text)):
      temp = text[i]
      #temp.ljust(
      text[i] = str("{:^"+str(max_string_size(text))+"."+str(max_string_size(text))+"}").format(text[i])
   return text

#
def right_side(text):
   print("dsgfd")
   left = 0
   
   for i in range(len(text)):
      left = 0
      right = max_size_string(text)
      while text[i][left] == " ":
         left += 1
      while text[i]
      text[i] = str("{:>"+str(max_string_size(text))+"."+str(max_string_size(text))+"}").format(text[i])
   return text

#   
def left_side(text):
   for i in range(len(text)):
      text[i] = str("{:<"+str(max_string_size(text))+"."+str(max_string_size(text))+"}").format(text[i])
   return text

#   
def word_replace(text):
   begin, end = input("Введите слово которое хотите заменить и на которое хотите заменить через пробел: ").split()
   for i in range(len(text)): text[i] = text[i].replace(begin, end)
   return text

#   
def delete_word(text):
   word = input("Введите слово, которое необходимо удалить: ").split()
   for i in range(len(text)): text[i] = text[i].replace(word, "")
   return text

#   
def transformation_arifmetics(text):
   print(1)

#
def tranformation_to_string(text):
   res = ""
   for i in range(len(text)): res += text[i]
   return res

#
def shortest_word(text):
   res = ""; temp_width = None; string_number = -1;
   for i in range(text):
      temp = text[i].split()
      if temp_width == None: temp_width = len(temp)
      else:
         if len(temp) < temp_width: temp_width = len(temp); res = temp; string_number = i;
   return res, string_number

#
def delete_shortest_word_sentences(text):
   print(1)

def coordinator(text):
   res = ""
   for i in range(len(text)): res += text[i] + "\n"
   return res    

def main():
   output_text = open("output_text.txt", "w")
   input_text_0 = open("input_text.txt")
   input_text = str(input_text_0.read()).split("\n")

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

      flag = int(input("Введите код операции: "))
      if flag == 1:
         input_text = width_side(input_text)
      if flag == 2:
         input_text = left_side(input_text)
      if flag == 3:
         input_text = right_side(input_text)
         print(coordinator(input_text))
      if flag == 4:
         input_text = word_replace(input_text)
      if flag == 5:
         input_text = delete_word(input_text)
      if flag == 6:
         input_text = width_side(input_text)
      if flag == 7:
         input_text = width_side(input_text)
      if flag == 0:
         output_text.write(coordinator(input_text))
         break
      
main()

