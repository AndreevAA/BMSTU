import time
from random import *
import matplotlib.pyplot as plt
from tkinter import *
from PIL import *
import tkinter.ttk as ttk
from tkinter import messagebox as mb
import matplotlib
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

START = 1000;
STEP = 1000;
NUM_OF_LISTS = 7; # Поставить 7
ARRAY_LENGTHS = []
ARRAY_TIMES = []
MAX_LIST_LENGTH = 10

def show_message():
    mb.showinfo("GUI Python", "Something went wrong... Try again.")

def get_val_motion_start(event):
    global START
    START = scal_start.get();

def get_val_motion_step(event):
    global STEP
    STEP = scal_step.get();

def get_val_motion_num_of_lists(event):
    global NUM_OF_LISTS
    NUM_OF_LISTS = scal_num_of_lists.get();

# Сортировка Шейкера
def shaker_sort(array): 
    length = len(array) 
    swapped = True
    start_index = 0
    end_index = length - 1
        
    startTime = int(round(time.time() * 1000));

    while (swapped == True): 
        
        swapped = False
          
        # проход слева направо
        for i in range(start_index, end_index): 
            if (array[i] > array[i + 1]) : 
                # обмен элементов
                array[i], array[i + 1] = array[i + 1], array[i] 
                swapped = True
  
        # если не было обменов прерываем цикл
        if (not(swapped)): 
            break

        swapped = False

        end_index = end_index - 1
  
        #проход справа налево
        for i in range(end_index - 1, start_index - 1, -1): 
            if (array[i] > array[i + 1]): 
                # обмен элементов
                array[i], array[i + 1] = array[i + 1], array[i] 
                swapped = True
 
        start_index = start_index + 1
    return int(round(time.time() * 1000)) - startTime;

def comparator():
    global MAX_LIST_LENGTH

    temp_x = message_entry.get().replace("  ", " ").lstrip().rstrip()
    temp_x = temp_x.split(" ")

    try: 
        if len(temp_x) > MAX_LIST_LENGTH:
            show_message();
        else:
            for i in range(len(temp_x)):
                temp_x[i] = int(temp_x[i])
        temp_time = shaker_sort(temp_x);
        message_entry.delete(0, END)
        message_entry.insert(0, str(temp_x).replace("]", "").replace("[", "").replace(",", ""))
    except:
        show_message();

# Генерация массива
def generate_array(length):
    array = []
    for i in range(length):
        array.append(randint(-1000000, 1000000))
    return array

def create_graph():
    im = PhotoImage(file='lab_03.png')
    l = Label(root, image=im)
    l.pack()

def reversed(array):
    array.reverse();
    return shaker_sort(array);
# Головная функция

def counter():
    global NUM_OF_LISTS, START, STEP
    
    while NUM_OF_LISTS != 0:
        generated_array = generate_array(START)

        ARRAY_LENGTHS.append(len(generated_array))

        time_shaker = shaker_sort(generated_array);
        ARRAY_TIMES.append(time_shaker)
        
        START += STEP
        NUM_OF_LISTS -= 1;

def fill_up_table():
    here_list = [generate_array(100), generate_array(500), generate_array(1000)]
    row_1 = [str(shaker_sort(here_list[0])), str(shaker_sort(here_list[1])), str(shaker_sort(here_list[2]))]
    row_2 = [str(shaker_sort(here_list[0])), str(shaker_sort(here_list[1])), str(shaker_sort(here_list[2]))]
    row_3 = [str(reversed(here_list[0])), str(reversed(here_list[1])), str(reversed(here_list[2]))]
    
    tree.insert('', 'end', text="Упорядоченный",values=(row_2[0], row_2[1], row_2[2]))
    tree.insert('', 'end', text="Случайный", values=(row_1[0], row_1[1], row_1[2]))
    tree.insert('', 'end', text="Упорядоченный (обратно)", values=(row_3[0], row_3[1], row_3[2]))
        
def showPlot(root, statistics = None, canvas = None):
    global ARRAY_LENGTHS, ARRAY_TIMES
    figure = Figure(figsize=(5, 4), dpi=100);
    if len(ARRAY_TIMES) == 0:
        statistics = [0, 0]
    else:
        statistics = [ARRAY_LENGTHS, ARRAY_TIMES]
    figure.add_subplot(111).plot(statistics[0], statistics[1], color='black', linestyle='dashed', marker='o',markerfacecolor='red', markersize=7);
    figure.add_subplot(111).set_xlabel('количество N')
    figure.add_subplot(111).set_ylabel('время t')
    if canvas is None:
        canvas = FigureCanvasTkAgg(figure, master=root);
        canvas.draw();
        canvas.get_tk_widget().grid(row=1, column=4, rowspan=2)
    else:
        canvas.figure = figure;
        canvas.draw();
        canvas.get_tk_widget().update();
    return canvas;

root = Tk()
root.wm_title("Лабораторная работа №3")

tree = ttk.Treeview(root)

tree["columns"]=("one","two","three")
tree.column("#0", width=300, minwidth=200)
tree.column("one", width=300, minwidth=200)
tree.column("two", width=300, minwidth=200)
tree.column("three", width=300, minwidth=200)

tree.heading("#0",text="Массив")
tree.heading("one", text="100")
tree.heading("two", text="500")
tree.heading("three", text="1000")

message_label = Label(text="Data array: ")
message = StringVar()
message_entry = Entry(textvariable=message)
message_entry.grid(row=1, column=2)
message_label.grid(row=1, column=1)
main_button = Button(text=" Sort array ", command=comparator)
main_button.grid(row=1, column=3)

tree.grid(row=3, column=1, columnspan=4)

counter();
showPlot(root, statistics = None, canvas = None);
fill_up_table();

root.mainloop()

