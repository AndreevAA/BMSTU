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

START = 300;
STEP = 200;
NUM_OF_LISTS = 1;
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

def comparator():
    global MAX_LIST_LENGTH

    temp_x = message_entry.get().replace("  ", " ").lstrip().rstrip()
    temp_x = temp_x.split(" ")
    
    if var.get() == 0:
        counter(1, []);
        showPlot(root, statistics = None, canvas = None)
    elif var.get() == 1:
        try: 
            if len(temp_x) > MAX_LIST_LENGTH:
                show_message();
            else:
                for i in range(len(temp_x)):
                    temp_x[i] = int(temp_x[i])
            counter(0, temp_x)
            showPlot(root, statistics = None, canvas = None)
        except:
            show_message();

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

def counter(flag, input_list):
    global NUM_OF_LISTS, START, STEP
    for i in tree.get_children():
            tree.delete(i)
    if flag == 1:
        while NUM_OF_LISTS != 0:
            generated_array = generate_array(START)

            ARRAY_LENGTHS.append(len(generated_array))

            time_shaker = shaker_sort(generated_array);
            ARRAY_TIMES.append(time_shaker)
            
            tree.insert('', 'end', text=str(len(generated_array)),
                                     values=(str(time_shaker),
                                             str(shaker_sort(generated_array)), reversed(generated_array)))
            START += STEP
            NUM_OF_LISTS -= 1;
    elif flag == 0:
        generated_array = input_list

        ARRAY_LENGTHS.append(len(generated_array))

        time_shaker = shaker_sort(generated_array);
        ARRAY_TIMES.append(time_shaker)
        
        tree.insert('', 'end', text=str(len(generated_array)),
                                 values=(str(time_shaker),
                                         str(shaker_sort(generated_array)), reversed(generated_array)))

def showPlot(root, statistics = None, canvas = None):
    global ARRAY_LENGTHS, ARRAY_TIMES
    figure = Figure(figsize=(5, 4), dpi=100);
    if len(ARRAY_TIMES) == 0:
        statistics = [0, 0]
    else:
        statistics = [ARRAY_LENGTHS, ARRAY_TIMES]
    figure.add_subplot(111).plot(statistics[0], statistics[1], color='black', linestyle='dashed', marker='o',markerfacecolor='red', markersize=7);
    if canvas is None:
        canvas = FigureCanvasTkAgg(figure, master=root);
        canvas.draw();
        canvas.get_tk_widget().grid(row=1, column=4, rowspan=5)
    else:
        canvas.figure = figure;
        canvas.draw();
        canvas.get_tk_widget().update();
    return canvas;

root = Tk()
root.wm_title("Tkinter window")

tree = ttk.Treeview(root)

tree["columns"]=("one","two","three")
tree.column("#0", width=270, minwidth=270)
tree.column("one", width=150, minwidth=150)
tree.column("two", width=400, minwidth=200)
tree.column("three", width=80, minwidth=50)

tree.heading("#0",text="Длина")
tree.heading("one", text="Случайный")
tree.heading("two", text="Упорядоченный")
tree.heading("three", text="Обратный")

var = IntVar()
var.set(0)
choose_label = Label(text="Choose type of\n calculations: ");
generation = Radiobutton(text="Element generation", variable=var, value=0)
input_elements = Radiobutton(text="Input elements in the input field", variable=var, value=1)
generation.grid(row=1, column=2)
input_elements.grid(row=1, column=3)
choose_label.grid(row=1, column=1)

scal_start_label = Label(text="Initial value of\n calculations: ");
scal_start = Scale(root,orient=HORIZONTAL,length=300,from_=300,to=1000,tickinterval=100,resolution=50)
scal_start.bind("<B1-Motion>",get_val_motion_start)
#scal_start.pack()
scal_start_label.grid(row=2, column=1)
scal_start.grid(row=2, column=2)

scal_step_label = Label(text=" Calculation step: ");
scal_step = Scale(root,orient=HORIZONTAL,length=300,from_=200,to=1000,tickinterval=100,resolution=50)
scal_step.bind("<B1-Motion>",get_val_motion_step)
scal_step.grid(row=3, column=2)
scal_step_label.grid(row=3, column=1)
#scal_step.pack()

scal_num_of_lists_labl = Label(text="Number of \niterations: ")
scal_num_of_lists = Scale(root,orient=HORIZONTAL,length=300,from_=1,to=10,tickinterval=1,resolution=1)
scal_num_of_lists.bind("<B1-Motion>",get_val_motion_num_of_lists)
scal_num_of_lists.grid(row=4, column=2)
scal_num_of_lists_labl.grid(row=4, column=1)
#scal_num_of_lists.pack()

#fig, ax = plt.subplots()
#f = figure(figsize=(5,5), dpi=100)
#a = fig.add_subplot(111)
#a.plot(ARRAY_LENGTHS, ARRAY_TIMES, 'rx', ARRAY_LENGTHS, ARRAY_TIMES, 'b+', linestyle='solid')
#ax.plot(ARRAY_LENGTHS, ARRAY_TIMES, 'rx', ARRAY_LENGTHS, ARRAY_TIMES, 'b+', linestyle='solid')
#fig.savefig('lab_03.png')

showPlot(root, statistics = None, canvas = None);
#l.pack()

message_label = Label(text="Data array: ")
message = StringVar()
message_entry = Entry(textvariable=message)
#message_entry.pack()
message_entry.grid(row=5, column=2)
message_label.grid(row=5, column=1)
 
main_button = Button(text=" Make calculations with\n the current settings ", command=comparator)
#main_button.pack()
main_button.grid(row=5, column=3)

#tree.pack()
tree.grid(row=6, column=1, columnspan=4)

#plt.show()



root.mainloop()

