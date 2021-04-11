# Предложения из только слов с чередующейся гласной и согласной
# Защита лабораторной работы №9

def w_check(word):
    glasn = ["а", "е", "ё", "и", "о", "у", "э", "ы", "я"]
    if len(word) == 1:
        return 1
    else:
        for i in range(len(glasn)):
            word.replace(glasn[i], "1")
        if word[0] == "1" and word[1] != "1":
            i = 0; par = 0
            while i < len(word) // 2 * 2:
                if word[i] == "1" and word[i + 1] != "1":
                    i += 2
                else: par = 1; break
            if par == 0:
                return 1
        elif word[0] != "1" and word[1] == "1":
            i = 0; par = 0
            while i < len(word) // 2 * 2:
                if word[i] != "1" and word[i + 1] == "1":
                    i += 2
                else: par = 1; break
            if par == 0:
                return 1
        return 0
    return 0
# Проверка
def check(s):
	s = s.replace(",", "")
	s = s.replace(".", "")
	s = s.replace("-", "")
	s = s.replace(":", "")
	s = s.replace("?", "")
	s = s.replace("!", "")
	s = s.split()
	ans = 0
	for i in range(len(s)): ans += w_check(s[i])
	if ans == len(s): return 1
	else: return 0

# Удаление предложения с самым коротким словом
def f(text):
    base = ""
    for i in range(len(text)): base += text[i] + "\n"
    #print(base)
    ans_sentance  = ""
    temp_sentance = ""
    for i in range(len(base) - 1):
        if base[i - 1] == "." or base[i - 1] == "!" or base[i - 1] == "?":
            if check(temp_sentance) == 1 and len(temp_sentance) != 0:
                print(temp_sentance)
            temp_sentance = ""
        else: temp_sentance += base[i]; 
    base = base.replace(ans_sentance, "")
    ans = base.split("\n")
    return ans

# Работа на считывание файлов
def main():
   output_text = open("output_text.txt", "w")
   input_text_0 = open("input_text.txt")
   input_text = str(input_text_0.read()).split("\n")

   # Чтение
   for_write_input_text = open("input_text.txt", "r").read();

   #input_text = right_side(input_text)
   #output_text.write(coordinator(input_text))
   
   f(input_text)
   
main()
