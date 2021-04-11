from tkinter import *
from decimal import *
from math import *
from tkinter import messagebox 

root = Tk()
root.title('Калькулятор перевода из четверичной в десятичную и обратно системы счисления')

buttons = (('7', '8', '9', '/', '('),
           ('4', '5', '6', '*', ')'),
           ('1', '2', '3', '-', 'decimal to quaternary'),
           ('0', '.', '=', '+', 'quaternary to decimal')
           )

activeStr = ''
stack = []
latest = ''

message = StringVar()
label_author = Entry(textvariable=message)

def open_history():
    temp = open("history.txt", "r").read()
    if len(temp) == 0:
        return 
    return temp;

history = open_history()

def save_history(temp_history):
    global history;
    history = str(temp_history) + "\n" + str(history)
    temp = open("history.txt", "w")
    temp.write(history)
    temp.close()

def quit():
    exit()

def author():
    global button
    global label_author
    global buttonrepeat
    global bn0, bn1, bn2, bn3, bn4, bn5, bn6, bn7, bn8, bn9, bn10, bn11, bn12, bn13, bn14, bn15, bn16, bn17, bn18, bn19
    global text

    try: label_author.grid_remove()
    except: pass;

    try: text.delete(1.0, END)
    except: pass

    #label_author.grid(row=0, column=0, columnspan=20, sticky="nsew")
    #message_entry.place(relx=.5, rely=.1, anchor="c")
    label1 = Label(text="Калькулятор перевода из четверичной в\n десятичную и обратно системы счисления.\n\nРазработа Андреевым А.А. ИУ7-24Б", fg="#eee", bg="#333")
    label1.grid(row=6, column=0, columnspan=5, sticky='nsew')
    #label_author.grid(row=6, column=0, columnspan=5, sticky='nsew')
    #label_author.insert(0, "Калькулятор для перевода из четверичной в десятичную и обратно системы счисления. Разработа Андреевым А.А. ИУ7-24Б")

def history():
    global history;
    global button
    global label_author
    global buttonrepeat
    global bn0, bn1, bn2, bn3, bn4, bn5, bn6, bn7, bn8, bn9, bn10, bn11, bn12, bn13, bn14, bn15, bn16, bn17, bn18, bn19
    global text

    try:
        message_entry.grid_remove()
        bn0.grid_remove()
        bn1.grid_remove()
        bn2.grid_remove()
        bn3.grid_remove()
        bn4.grid_remove()
        bn5.grid_remove()
        bn6.grid_remove()
        bn7.grid_remove()
        bn8.grid_remove()
        bn9.grid_remove()
        bn10.grid_remove()
        bn11.grid_remove()
        bn12.grid_remove()
        bn13.grid_remove()
        bn14.grid_remove()
        bn15.grid_remove()
        bn16.grid_remove()
        bn17.grid_remove()
        bn18.grid_remove()
        bn19.grid_remove()
        buttonrepeat.grid_remove()
        button.grid_remove()
    except: pass

    try: label_author.grid_remove()
    except: pass;

    try: text.delete(1.0, END)
    except: pass

    text = Text(width=20, height=7)
    
    text.pack(side=LEFT)

    text.insert(1.0, history)
     
    scroll = Scrollbar(command=text.yview)
    scroll.pack(side=LEFT, fill=Y)
     
    text.config(yscrollcommand=scroll.set)

mainmenu = Menu(root) 

root.config(menu=mainmenu) 

def check_4(activeStr):
    temp = str(activeStr)
    ans = 0
    for i in range(len(temp)):
        if temp[i] == ".":
            ans += 1
        elif 0 <= float(temp[i]) <= 3:
            ans += 1
    if ans == len(temp):
        return 1
    else:
        return 0

def convert_base_10_4(num, to_base = 4, from_base = 10):
    #print(num, to_base, from_base)
    # first convert to decimal number
    if isinstance(num, str):
        n = int(num, from_base)
    else:
        n = int(num)
    # now convert decimal to 'to_base' base
    alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    if n < to_base:
        return alphabet[n]
    else:
        return convert_base_10_4(n // to_base, to_base) + alphabet[n % to_base]

def convert_base_4_10(num, to_base = 4, from_base = 10):
    #print(num, to_base, from_base)
    # first convert to decimal number
    if isinstance(num, str):
        n = int(num, from_base)
    else:
        n = int(num)
    # now convert decimal to 'to_base' base
    alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    if n < to_base:
        return alphabet[n]
    else:
        return convert_base_4_10(n // to_base, to_base) + alphabet[n % to_base]

def spl(temp):
    ans = []
    word = ""
    if temp[0] == "+" or temp[0] == "-" or temp[0] == "/" or temp[0] == "*":
        temp = "0" + temp;
    if temp[len(temp) - 1]  == "+" or temp[len(temp) - 1] == "-" or temp[len(temp) - 1] == "*" or temp[len(temp) - 1] == "/":
        temp += "0"
    for i in range(len(temp)):
        if temp[i] == "+" or temp[i] == "-" or temp[i] == "*" or temp[i] == "/":
            ans.append(float(word.replace(" ","")))
            ans.append(temp[i])
            word = ""
        else:
            word += temp[i]
    ans.append(float(word.replace(" ","")))
    return ans

def calculate(temp):
    znak = [0, 0, 0, 0] # * / + - 
    for i in range(len(temp)):
        if temp[i] == "*":
            znak[0] += 1
        elif temp[i] == "/":
            znak[1] += 1
        elif temp[i] == "+":
            znak[2] += 1
        elif temp[i] == "-":
            znak[3] += 1
    ##print(temp, znak)
    i = 0
    while znak[0] != 0:
        if temp[i] == "*":
            ##print(temp, znak)
            temp[i - 1] = temp[i - 1] * temp[i + 1];
            del temp[i];
            del temp[i]
            znak[0] -= 1;
            i -= 1;
        else:
            i += 1
    i = 0
    while znak[1] != 0:
        if temp[i] == "/":
            ##print(temp, znak)
            if temp[i + 1] == 0:
                messagebox.showinfo("Ошибка", "Деление на ноль")
                break;
            else:
                temp[i - 1] = temp[i - 1] / temp[i + 1];
                del temp[i];
                del temp[i]
                znak[1] -= 1;
                i -= 1;
        else:
            i += 1
    i = 0
    while znak[2] != 0:
        if temp[i] == "+":
            ##print(temp, znak)
            temp[i - 1] = temp[i - 1] + temp[i + 1];
            del temp[i];
            del temp[i]
            znak[2] -= 1;
            i -= 1;
        else:
            i += 1
    i = 0
    while znak[3] != 0:
        if temp[i] == "-":
            ##print(temp, znak)
            temp[i - 1] = temp[i - 1] - temp[i + 1];
            del temp[i];
            del temp[i]
            znak[3] -= 1;
            i -= 1;
        else:
            i += 1
    ##print(temp)
    return str(temp[0])

def count(text):
    temp = "(" + text + ")"
    while temp.count("+") != 0 or temp.count("-") != 0 or temp.count("*") != 0 or temp.count("/") != 0:
        left = 0;
        right = len(temp) - 1

        i = 0
        while True:
            if temp[i] == "(":
                left = i;
            elif temp[i] == ")":
                right = i
                temp = temp[:left] + calculate(spl((temp[left + 1:right]).replace(" ", ""))) + temp[right + 1:]
                break
            i += 1
    return temp

def click(text):
    global activeStr
    global stack
    global latest
    global message_entry

    #try:
    if text == 'CE':
        stack.clear()
        activeStr = ''
        #label.configure(text='0')
        message_entry.delete(0, END)
        message_entry.insert(0, "0")
    elif text == "=":
        input_text = message_entry.get()
        if len(input_text) == 0:
            messagebox.showinfo("Ошибка", "Должно быть введено число")
        else:
            latest = input_text
            #label.configure(text = count(activeStr))
            message_entry.delete(0, END)
            message_entry.insert(0, count(input_text).replace("(", "").replace(")", ""))
            save_history(input_text);
            activeStr = ''
    elif text == "repeat":
        activeStr = latest
        message_entry.delete(0, END)
        message_entry.insert(0, (activeStr))        
        #label.configure(text = activeStr)
    elif text == "decimal to quaternary":
        latest = activeStr
        #label.configure(text = convert_base_10_4(float(count(activeStr)[1:-1])))
        message_entry.delete(0, END)
        message_entry.insert(0, convert_base_10_4(float(count(activeStr)[1:-1])))
        activeStr = ''        
    elif text == "quaternary to decimal":
        if check_4(float(count(activeStr)[1:-1])) == 1:
            latest = activeStr
            #label.configure(text = convert_base_4_10(float(count(activeStr)[1:-1])))
            message_entry.delete(0, END)
            message_entry.insert(0, convert_base_4_10(float(count(activeStr)[1:-1])))
            activeStr = ''
        else:
            messagebox.showinfo("Ошибка", "Введите корректное число. При переводе из 4й в 10й каждая цифра изначального число должна быть меньше либо равно 3 и больше либо равна 0")
    else:
        activeStr += text
        message_entry.delete(0, END)
        message_entry.insert(0, activeStr)
        #label.configure(text = activeStr)
    #except:
    #    messagebox.showinfo("Ошибка", "Проверьте корректность введенных данных")

#app = UI(root)

#label = Label(root, text='0', width=35)
#label.grid(row=0, column=0, columnspan=4, sticky="nsew")
def main():
    global bn0, bn1, bn2, bn3, bn4, bn5, bn6, bn7, bn8, bn9, bn10, bn11, bn12, bn13, bn14, bn15, bn16, bn17, bn18, bn19
    global message_entry
    global button
    global buttonrepeat

    global label_author
    global bn0, bn1, bn2, bn3, bn4, bn5, bn6, bn7, bn8, bn9, bn10, bn11, bn12, bn13, bn14, bn15, bn16, bn17, bn18, bn19
    global text

    try:
        message_entry.grid_remove()
        bn0.grid_remove()
        bn1.grid_remove()
        bn2.grid_remove()
        bn3.grid_remove()
        bn4.grid_remove()
        bn5.grid_remove()
        bn6.grid_remove()
        bn7.grid_remove()
        bn8.grid_remove()
        bn9.grid_remove()
        bn10.grid_remove()
        bn11.grid_remove()
        bn12.grid_remove()
        bn13.grid_remove()
        bn14.grid_remove()
        bn15.grid_remove()
        bn16.grid_remove()
        bn17.grid_remove()
        bn18.grid_remove()
        bn19.grid_remove()
        buttonrepeat.grid_remove()
        button.grid_remove()
    except: pass

    try: label_author.grid_remove()
    except: pass;

    try: text.delete(1.0, END)
    except: pass


    button = Button(root, text='CE', command=lambda text='CE': click(text))
    button.grid(row=1, column=3, sticky="nsew")

    buttonrepeat = Button(root, text='repeat', command=lambda text='repeat': click(text))
    buttonrepeat.grid(row=1, column=4, sticky="nsew")

    message = StringVar()
     
    message_entry = Entry(textvariable=message)
    message_entry.grid(row=0, column=0, columnspan=4, sticky="nsew")
    #message_entry.place(relx=.5, rely=.1, anchor="c")

    message_entry.insert(0, "0")

    #bn0 = Button(root, text=buttons[0][0], bg = '#000000', activebackground = '#555555', fg = '#ffffff', activeforeground = '#ffffff',command=lambda row=0, col=0: click(buttons[0][0]))
    bn0 = Button(root, text=buttons[0][0],command=lambda row=0, col=0: click(buttons[0][0]))
    bn0.grid(row=2, column=0, sticky='nsew')
    bn1 = Button(root, text=buttons[0][1],command=lambda row=0, col=1: click(buttons[0][1]))
    bn1.grid(row=2, column=1, sticky='nsew')
    bn2 = Button(root, text=buttons[0][2],command=lambda row=0, col=2: click(buttons[0][2]))
    bn2.grid(row=2, column=2, sticky='nsew')
    bn3 = Button(root, text=buttons[0][3],command=lambda row=0, col=3: click(buttons[0][3]))
    bn3.grid(row=2, column=3, sticky='nsew')
    bn4 = Button(root, text=buttons[0][4],command=lambda row=0, col=4: click(buttons[0][4]))
    bn4.grid(row=2, column=4, sticky='nsew')
    bn5 = Button(root, text=buttons[1][0],command=lambda row=1, col=0: click(buttons[1][0]))
    bn5.grid(row=3, column=0, sticky='nsew')
    bn6 = Button(root, text=buttons[1][1],command=lambda row=1, col=1: click(buttons[1][1]))
    bn6.grid(row=3, column=1, sticky='nsew')
    bn7 = Button(root, text=buttons[1][2],command=lambda row=1, col=2: click(buttons[1][2]))
    bn7.grid(row=3, column=2, sticky='nsew')
    bn8 = Button(root, text=buttons[1][3],command=lambda row=1, col=3: click(buttons[1][3]))
    bn8.grid(row=3, column=3, sticky='nsew')
    bn9 = Button(root, text=buttons[1][4],command=lambda row=1, col=4: click(buttons[1][4]))
    bn9.grid(row=3, column=4, sticky='nsew')
    bn10 = Button(root, text=buttons[2][0],command=lambda row=2, col=0: click(buttons[2][0]))
    bn10.grid(row=4, column=0, sticky='nsew')
    bn11 = Button(root, text=buttons[2][1],command=lambda row=2, col=1: click(buttons[2][1]))
    bn11.grid(row=4, column=1, sticky='nsew')
    bn12 = Button(root, text=buttons[2][2],command=lambda row=2, col=2: click(buttons[2][2]))
    bn12.grid(row=4, column=2, sticky='nsew')
    bn13 = Button(root, text=buttons[2][3],command=lambda row=2, col=3: click(buttons[2][3]))
    bn13.grid(row=4, column=3, sticky='nsew')
    bn14 = Button(root, text=buttons[2][4],command=lambda row=2, col=4: click(buttons[2][4]))
    bn14.grid(row=4, column=4, sticky='nsew')
    bn15 = Button(root, text=buttons[3][0],command=lambda row=3, col=0: click(buttons[3][0]))
    bn15.grid(row=5, column=0, sticky='nsew')
    bn16 = Button(root, text=buttons[3][1],command=lambda row=3, col=1: click(buttons[3][1]))
    bn16.grid(row=5, column=1, sticky='nsew')
    bn17 = Button(root, text=buttons[3][2],command=lambda row=3, col=2: click(buttons[3][2]))
    bn17.grid(row=5, column=2, sticky='nsew')
    bn18 = Button(root, text=buttons[3][3],command=lambda row=3, col=3: click(buttons[3][3]))
    bn18.grid(row=5, column=3, sticky='nsew')
    bn19 = Button(root, text=buttons[3][4],command=lambda row=3, col=4: click(buttons[3][4]))
    bn19.grid(row=5, column=4, sticky='nsew')

    #bnt1 = Button(root, text=buttons[0][0], command=lambda row=row, col=col: click(buttons[0][0]))
    #bnt1.grid(row=row + 2, column=col, sticky="nsew")
    '''k = 0
    for row in range(4):
        for col in range(5):
            print("bn" + str(k) + " = Button(root, text=buttons[" + str(row) + "][" + str(col) + "]" + ",command=lambda row=" + str(row) + ", col=" + str(col) + ": click(buttons[" + str(row) + "][" + str(col) + "]))")
            print("bn" + str(k) + ".grid(row=" + str(row + 2) + ", column=" + str(col) + ", sticky='nsew')")
            button = Button(root, text=buttons[row][col],
                    command=lambda row=row, col=col: click(buttons[row][col]))
            button.grid(row=row + 2, column=col, sticky="nsew")
            k += 1
    '''
main()

filemenu = Menu(mainmenu, tearoff=0)
filemenu.add_command(label="Новые вычисления", command = main)
#filemenu.add_command(label="История", command = history)
filemenu.add_command(label="Об программе", command = author)
filemenu.add_command(label="Выход", command=quit)
 
#helpmenu = Menu(mainmenu, tearoff=0)
#helpmenu.add_command(label="Вычисление текущего модуля")
#helpmenu.add_command(label="Вычисление последнего модуля")
 
mainmenu.add_cascade(label="Файл", menu=filemenu)
#mainmenu.add_cascade(label="Вычисление", menu=helpmenu)

root.grid_rowconfigure(6, weight=1)
root.grid_columnconfigure(4, weight=1)

root.mainloop()
