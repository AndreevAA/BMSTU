from math import *
from matplotlib import pyplot as plt
from tkinter import *
from PIL import ImageTk, Image 
from matplotlib import rcParams
import time
from tkinter import ttk

NUMBER_OF_SPACES = [5,14,14,16,15,22]
TYPE_OF_ERROR = 'NULL'
EPS = ""
BASE_TEXT = {"START-END":"Введите границы интервала START, END через пробел: ",
"EPS":"Введите точность: ",
"STEP":"Введите шаг: ",
"1-Line":"┌─────┬──────────────┬──────────────┬────────────────┬───────────────┬──────────────────────┐",
"2-Line":"│  №  │  Промежуток  │Значение корня│Значение функции│Кол-во итераций│      Код ошибки      │",
"Between_Lines":"├─────┼──────────────┼──────────────┼────────────────┼───────────────┼──────────────────────┤",
"Latest-Line":"└─────┴──────────────┴──────────────┴────────────────┴───────────────┴──────────────────────┘"
}

root = Tk()

# Функция F
def function(x):
    return sin(x) - cos(x) #sin(x) #sin(x)#x**2-4

# Дифференциал функции F
def dfunc(x):
    return cos(x) + sin(x) #cos(x) #cos(x)#2*x

def check(x, k, local_start, local_end):
	##print(float("{:.5}".format(x)))
	if local_start < float("{:.5}".format(x)) <= local_end: 
		##print(x, k, local_start, local_end)
		return [x, k]
	else: 
		return [-1e200, 0, str(e)] 

# Основная функция вычисления локальноего значения функции Ньютона
def Method_Newton(local_start, local_end):
    try:
        x0 = local_end
        x = x0-1 / dfunc(x0) * function(x0)
        k = 1
        while abs(x - x0) > EPS:
            x0 = x
            x = x-1/dfunc(x) * function(x)
            k += 1
            if x < local_start-1e-5 or x > local_end+1e-5 :
                break
        if x < local_start - 1e-5 or x > local_end+1e-5 :
            x0 = local_start
            x = x0-1/dfunc(x0)*function(x0)
            k = 1
            while abs(x - x0) > EPS:
                x0 = x
                x = x-1/dfunc(x)*function(x)
                k += 1
                if x < local_start-1e-5 or x>local_end + 1e-5 :
                    break
            if x < local_start-1e-5 or x>local_end + 1e-5 :
                return [-1e200,0]
            else :
                return check(x,k, local_start, local_end)
        else:
            return check(x,k, local_start, local_end)
    except:
        try:
            x0 = local_start
            x = x0-1 / dfunc(x0) * function(x0)
            k = 1
            while abs(x - x0) > EPS:
                x0 = x
                x = x-1/dfunc(x) * function(x)
                k += 1
                if x < local_start-1e-5 or x > local_end+1e-5 :
                    break
            if x < local_start - 1e-5 or x>local_end+1e-5 :
                x0 = local_end
                x = x0-1/dfunc(x0)*function(x0)
                k = 1
                while abs(x - x0) > EPS:
                    x0 = x
                    x = x-1/dfunc(x)*function(x)
                    k += 1
                    if x < local_start-1e-5 or x>local_end + 1e-5 :
                        break
                if x < local_start-1e-5 or x>local_end + 1e-5 :
                    return [-1e200,0]
                else :
                    return check(x,k, local_start, local_end)
            else:
                return check(x,k, local_start, local_end)
        except Exception as e:
            return [-1e200, 0, str(e)]

# Трансформирование i-го вывода
def __transformation__(s1,s2,i):
    global NUMBER_OF_SPACES, TYPE_OF_ERROR, EPS
    if len(s2)> NUMBER_OF_SPACES[i]:
        s2 = s2[:NUMBER_OF_SPACES[i]]
    s1 += ' ' * ((NUMBER_OF_SPACES[i]-len(s2)) // 2)
    s1 += s2
    s1 += ' ' * ((NUMBER_OF_SPACES[i]-len(s2)) // 2 + (NUMBER_OF_SPACES[i] - len(s2))%2) + '│'
    return s1

# Ура!! ФИнальное
def __final__(S):
	global tree
	##print(S)
	answers_X = []
	answers_Y = []
	rowi = 7
	i = len(S) - 1
	num = 0
	for s in S:
		temp_data = s.split('│')
		if len(s) > 0 and temp_data[len(temp_data) - 3].replace(" ", "") != "NULL":
			num += 1
	#print(num)
	while i >= 0:
		if len(S[i]) > 0:
			temp_data = S[i].split('│')
			#print(temp_data)
			if temp_data[len(temp_data) - 3].replace(" ", "") != "NULL":
				tree.insert('', 0, text=str(num - (rowi - 6) + 1), values=(temp_data[2].replace(" ", ""),temp_data[3].replace(" ", ""),temp_data[4].replace(" ", ""),temp_data[5].replace(" ", ""),temp_data[6].replace(" ", ""),temp_data[7].replace(" ", "")))

				answers_X.append(float(temp_data[3].replace(" ", "")))
				answers_Y.append(float(temp_data[4].replace(" ", "")))
				rowi += 1
		i -= 1
	plt.plot(answers_X, answers_Y, "-*r", '0', alpha=0.7, label="first", lw=5, mec='b', mew=2, ms=10, linestyle="None");
	##print(answers_X, answers_Y)

# Форматированный вывод
def __formatted_output__(start, end, step): 
	global NUMBER_OF_SPACES, TYPE_OF_ERROR, EPS   
	k = 0; temp_position = start; counter = 1
	#(BASE_TEXT["1-Line"] + "\n" + BASE_TEXT["2-Line"])
	number = 0
	S = []
	while temp_position < end:
		L = Method_Newton(temp_position, temp_position + step)
		if len(L) == 2: k,x = L[1],L[0]
		else: k,x,TYPE_OF_ERROR = L[1],L[0],L[2]
		s = __transformation__('│', '{:1}'.format(counter),0)
		#temp = Label(text = '{:1}'.format(counter))
		#temp.grid(row = counter + 6, column = 0)

		if temp_position + step <= end: 
			if int(temp_position) == int(temp_position + step):
				s = __transformation__(s,'({:4.2f};{:4.2f}]'.format(temp_position - 0.01,temp_position + step), 1)
			else:
				s = __transformation__(s,'({:4.2f};{:4.2f}]'.format(temp_position,temp_position + step), 1)
			
			#temp = Label(text = '({:4.2f};{:4.2f})'.format(temp_position,temp_position + step))
			#temp.grid(row = counter + 6, column = 1)
		else: 
			s = __transformation__(s,'({:4.2f};{:4.2f})'.format(temp_position,end),1)
			#temp = Label(text = '({:4.2f};{:4.2f})'.format(temp_position,end))
			#temp.grid(row = counter + 6, column = 1)

		if x != -1e200:
			s = __transformation__(s,'{:2.2e}'.format(x),2)
			s = __transformation__(s,'{:2.1e}'.format(function(x)),3)
			s = __transformation__(s,'{:1}'.format(k),4)

			'''
			temp = Label(text = '{:2.2e}'.format(x))
			temp.grid(row = counter + 6, column = 2)

			temp = Label(text = '{:2.1e}'.format(function(x)))
			temp.grid(row = counter + 6, column = 3)

			temp = Label(text = '{:1}'.format(k))
			temp.grid(row = counter + 6, column = 4)'''
		else:
			s = __transformation__(s,'NULL',2)
			s = __transformation__(s,'NULL',3)
			s = __transformation__(s,'NULL',4)

		s = __transformation__(s,TYPE_OF_ERROR,5)
		if x != -1e200 or TYPE_OF_ERROR != 'NULL' :
			##print(BASE_TEXT["Between_Lines"])
			#print(s)
			S.append(s)
			#temp = Label(text = s)
			#temp.grid(row = counter + 6, column = 0)
		TYPE_OF_ERROR = 'NULL'
		temp_position += step
		counter += 1
	#print(S)
	__final__(S);
	##print(BASE_TEXT["Latest-Line"])

def __comparator__():
	global EPS, tree, root;
	tree = ttk.Treeview(root)
	tree.grid_forget()
	tree.grid(row=5, column=0, columnspan=4, padx=5, pady=5)
	tree["columns"]=("Промежуток","Значение корня","Значение функции","Кол-во итераций","Код ошибки")
	tree.column("#0", width=80, minwidth=80)
	tree.column("Промежуток", width=150, minwidth=150)
	tree.column("Значение корня", width=150, minwidth=150)
	tree.column("Значение функции", width=150, minwidth=150)
	tree.column("Кол-во итераций", width=150, minwidth=150)
	tree.column("Код ошибки", width=150, minwidth=150)

	tree.heading("#0",text="№")
	tree.heading("Промежуток", text="Промежуток")
	tree.heading("Значение корня", text="Значение корня")
	tree.heading("Значение функции", text="Значение функции")
	tree.heading("Кол-во итераций", text="Кол-во итераций")
	tree.heading("Код ошибки", text="Код ошибки")
	START, END, STEP, EPS = float(start.get()), float(end.get()), float(step.get()), float(eps.get());
	EPS = float(eps.get())
	__formatted_output__(START, END, STEP)

	temp_position = START; X, Y = [], []
	EXT_X = []; EXT_Y = [];
	temp_data = [];
	row = 0
	low_STEP = 0.0001
	while temp_position <= END:
		temp_y = function(temp_position)
		X.append(temp_position)
		Y.append(temp_y)

		if row <= 2:
			temp_data.append(temp_y)
		else: 
			if temp_data[0] < temp_data[1] > temp_data[2] or temp_data[0] > temp_data[1] < temp_data[2]:
				EXT_X.append(temp_position - low_STEP)
				EXT_Y.append(temp_data[1])
			temp_data = [temp_data[1], temp_data[2], temp_y]

		temp_position += low_STEP
		row += 1
	
	plt.plot(X, Y)
	plt.plot(EXT_X, EXT_Y, "-*r", linestyle="None");
	plt.legend ( ("sin(x) - cos(x) = 0", "cos(x) + sin(x) = 0", "f(x) = sin(x) - cos(x)", ) )
	plt.show()

root.title("Лабораторная работа №11 (Метод Ньютона / Секущих)")

start = StringVar()
end = StringVar()
step = StringVar()
eps = StringVar()
 
start_label = Label(text="Start: ")
end_label = Label(text="End: ")
step_label = Label(text="Step: ")
eps_label = Label(text="Eps: ")
 
start_label.grid(row=0, column=0, sticky="w")
end_label.grid(row=1, column=0, sticky="w")
step_label.grid(row=2, column=0, sticky="w")
eps_label.grid(row=3, column=0, sticky="w")

information_mistake_id = Label(text = "")
mistake_NONE_id = Label(text = "")
mistake_dev_by_zero_id = Label(text = "")

information_mistake_id.grid(row = 0, column = 2, sticky="w")
mistake_NONE_id.grid(row=1, column=2, sticky="w")
mistake_dev_by_zero_id.grid(row=2, column=2, sticky="w")

information_mistake = Label(text = "TYPE_OF_ERROR")
mistake_Null = Label(text = "0 - NULL (Mistake hasn't been found)")
mistake_dev_by_zero = Label(text = "1 - float division by zero")

information_mistake.grid(row = 0, column = 3, sticky="w")
mistake_Null.grid(row=1, column=3, sticky="w")
mistake_dev_by_zero.grid(row=2, column=3, sticky="w")

start_entry = Entry(textvariable=start)
end_entry = Entry(textvariable=end)
step_entry = Entry(textvariable=step)
eps_entry = Entry(textvariable=eps)

start_entry.grid(row=0,column=1, padx=5, pady=5)
end_entry.grid(row=1,column=1, padx=5, pady=5)
step_entry.grid(row=2, column=1, padx=5, pady=5)
eps_entry.grid(row=3, column=1, padx=5, pady=5)

try:
	message_button = Button(text="Enter", command=__comparator__)
	message_button.grid(row=4,column=1, padx=5, pady=5, sticky="e")
except:
	pass

scrollbar = Scrollbar(root)
#scrollbar.pack( side = RIGHT, fill = Y )

mylist = Listbox(root, yscrollcommand = scrollbar.set )
for line in range(100):
   mylist.insert(END, "This is line number " + str(line))

#mylist.pack( side = LEFT, fill = BOTH )
scrollbar.config( command = mylist.yview )

root.mainloop()