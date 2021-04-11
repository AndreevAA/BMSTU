# В самом длинном предложении найти самое короткое слово
# Защита лабораторный работы №9

# Проверка
def check(s):
    s = s.replace(",", "")
    s = s.replace(".", "")
    s = s.replace("-", "")
    s = s.replace(":", "")
    s = s.replace("?", "")
    s = s.replace("!", "")
    s = s.split()
    ans = ""
    for i in range(len(s)):
        if i == 0:
            ans = s[i]
        if len(s[i]) <= len(ans) and i != 0:
            ans = s[i]

    return (ans)
# Удаление предложения с самым коротким словом
def f(text):
    base = ""
    for i in range(len(text)):
        base += text[i] + "\n"
    
    ans_sentance = ""
    temp_sentance = ""
    for i in range(len(base) - 1):
        if base[i - 1] == "." or base[i - 1] == "!" or base[i - 1] == "?":
            #print(temp_sentance, len(temp_sentance), ans_sentance, len(ans_sentance))
            if len(temp_sentance) >= len(ans_sentance):
                ans_sentance = temp_sentance
                temp_sentance = ""
        else:
            temp_sentance += base[i]
    print("Самое длинное предложение в тексте: \n" + ans_sentance + "\n") 
    return (check(ans_sentance))
    
def main():
   # Работа на считывание файлов
   output_text = open("output_text.txt", "w")
   input_text_0 = open("input_text.txt")
   input_text = str(input_text_0.read()).split("\n")

   # Чтение
   for_write_input_text = open("input_text.txt", "r").read();

   print("Самое короткое слово в этом предложении: \n" + f(input_text)) 
main()
