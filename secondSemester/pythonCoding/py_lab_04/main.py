'''
Выполнена Андреевым А.А., ИУ7-24Б

Лабораторная работа №4 “Решение планиметрических задач”
Разработать приложение с графическим интерфейсом для решения поставленной задачи.
Приложение позволяет пользователю задавать параметры фигур как с помощью клавиатуры
вводя цифровые значения, так и задавая мышкой характеристики фигуры на поле
графического экрана.
Также необходимо сделать графическую интерпретацию
* полученного решения

На плоскости задано множество окружностей. Определить окружность,
которая пересекает наибольшее количество окружностей.
Дать графическое изображение результатов.
'''

import time
from math import *
import numpy as np
from tkinter import *    
from tkinter import messagebox    

CIRCLES = [];
CLICKES = [];
FIELDFLAG = 0;
LATEST = [];

# Создаем окно программы
root = Tk()
root.wm_title("Лабораторная работа №4")

# Создаем поле для рисования
canvasField = Canvas(root, width=500, height=500, bg='white')
canvasField.grid(row=1, rowspan=5, column=1)

# Создаем сообщение об ошибке
def show_message(message_text):
    messagebox.showinfo(message_text)

# Вычисление расстояния между двумя точками
def distance(x1, y1, x2, y2):
    answer = sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)
    return answer;

# Отрисовываем окружность по введенным данным центра окружности и ее радиуса
def drawCircle(x, y, radious):
    canvasField.create_oval(x - radious, y + radious, x + radious, y - radious, width=2)

# Создание поля отрисовки
def createField(event):
    global FIELDFLAG, LATEST;
    if (FIELDFLAG == 0):
        canvasField.create_rectangle(0, 0, 500, 500, 
                    tag="rect", fill="grey95")

        for x in range(500):
            if (x % 5 == 0):
                canvasField.create_line(x, 500, x, 0, width = 0.5, fill = 'grey90')
                canvasField.create_line(0, x, 500, x, width = 0.5, fill = 'grey90')

        for x in range(500): 
            if (x % 25 == 0):
                canvasField.create_line(x, 500, x, 0, width = 0.5, fill = 'grey80')
                canvasField.create_line(0, x, 500, x, width = 0.5, fill = 'grey80')

        for x in range(500):
            if (x % 50 == 0):
                canvasField.create_line(x, 500, x, 0, width = 0.5, fill = 'grey70')
                canvasField.create_line(0, x, 500, x, width = 0.5, fill = 'grey70')

        canvasField.create_line(5,5,5,500,width=2,arrow=LAST) 
        canvasField.create_line(5,5,500,5,width=2,arrow=LAST)
        
        for x in range(500):
            if (x % 50 == 0):
                canvasField.create_line(x, 10, x, 0, width = 1, fill = 'black')
                canvasField.create_text(x, 15, text = str(x), fill="purple", font=("Helvectica", "10"))
                canvasField.create_line(0, x, 10, x, width = 1, fill = 'black')
                canvasField.create_text(20, x, text = str(x), fill="purple", font=("Helvectica", "10"))
        
        FIELDFLAG = 1;
    x = event.x
    y = event.y
    r = 1;
    if (LATEST != [x-r,y-r,x+r,y+r]):
        canvasField.delete("ff");
        canvasField.create_oval(x-r,y-r,x+r,y+r,fill='orange', tag = 'ff')
        LATEST = [x-r,y-r,x+r,y+r];
        

# Добавление окружности в массив отображенных на экране окружностей
def addCirclesToList(x, y, radious):
    global CIRCLES;
    CIRCLES.append([x, y, radious, 0]);

# Проверка позициии клика
def checkpos(x, y):
    answer = 0;

    if (0 <= x <= 500 and 0 <= y <= 500):
        answer = 1;
    else:
        show_message("Вы ввели некорректные координаты при помощи клика: клики должны быть строго внутри окна с окружнсотями");

    return 1;

# Создаем окружность по нажатию мыши
def b3(event):
    global CLICKES;

    x = event.x
    y = event.y

    if (checkpos(x, y) == 1 and len(CLICKES) != 2):
        CLICKES.append([x, y]);

    if (len(CLICKES) == 2):
        radious = distance(CLICKES[0][0], CLICKES[0][1], CLICKES[1][0], CLICKES[1][1]);
        drawCircle(CLICKES[0][0], CLICKES[0][1], radious);
        addCirclesToList(CLICKES[0][0], CLICKES[0][1], radious);
        CLICKES = [];
        
# Обработка ввода из поля ввода
def addCircle():
    global CIRCLES
    if (0 < int(str(message_x_entry.get())) < 500 and 0 < int(str(message_y_entry.get())) < 500 and int(str(message_radious_entry.get())) < 250):
        drawCircle(int(str(message_x_entry.get())), int(str(message_y_entry.get())), int(str(message_radious_entry.get())));
        addCirclesToList(int(str(message_x_entry.get())), int(str(message_y_entry.get())), int(str(message_radious_entry.get())));
    else:
        show_message("Координаты должны быть строго больше 0 и строго меньше 500, радиус должен быть не более 250");

# Вычисление количества пересечений
def countIntersections(temp_i):
    global CIRCLES;
    answer = 0;
    for i in range(len(CIRCLES)):
        if (i != temp_i and (CIRCLES[i][2] + CIRCLES[temp_i][2]) >= distance(CIRCLES[i][0], CIRCLES[i][1], CIRCLES[temp_i][0], CIRCLES[temp_i][1])):
            answer += 1;
    return answer;

# Ввести текст в текстовое поле
def insertText(temp):
    text.insert(1.0, temp)

# Получить текст в текстовом поле
def getText():
    s = text.get(1.0, END)
    label['text'] = s

# Очистить текстовое поле
def deleteText():
    text.delete(1.0, END)

# Форматирование ответа
def formatOutput(pointInformation):
    x = pointInformation[0];
    y = pointInformation[1];
    radious = pointInformation[2];
    numberOfIntersections = pointInformation[3];
    answer = "Наибольшее количество пересечений найдено у окружности,\nс положением центра: (" + str(x) + ";" + str(y) + "),\nрадиусом: " + str(radious) + "\nколичеством пересечений: " + str(numberOfIntersections);
    return answer;

# Обновление количества пересечений
def editIntersections():
    global CIRCLES;
    pointInformation = [0, 0, 0, 0];
    for i in range(len(CIRCLES)):
        CIRCLES[i][3] += countIntersections(i);
        if (CIRCLES[i][3] >= pointInformation[3]):
            pointInformation = CIRCLES[i];
    insertText(formatOutput(pointInformation));

# Обработка вывода ответа
def outputAnswer():
    deleteText();
    editIntersections();

# Очистка поля ввода ответа
def deleteCircles():
    global FIELDFLAG, CIRCLES, CLICKES;
    deleteText();
    insertText("На данный момент поле ответа пустое, потому что расчеты не произведены / поле очищено");
    canvasField.delete("all") 
    FIELDFLAG = 0;
    CIRCLES = [];
    CLICKES = [];

# Создаем поля ввода данных
message_x_label = Label(text="Позиция по Х центра окружноти: ")
message_x = StringVar()
message_x_entry = Entry(textvariable=message_x)
message_x_entry.grid(row=1, column=3, columnspan=2)
message_x_label.grid(row=1, column=2)

message_y_label = Label(text="Позиция по Y центра окружноти: ")
message_y = StringVar()
message_y_entry = Entry(textvariable=message_y)
message_y_entry.grid(row=2, column=3, columnspan=2)
message_y_label.grid(row=2, column=2)

message_radious_label = Label(text="Радиус окружности: ")
message_radious = StringVar()
message_radious_entry = Entry(textvariable=message_radious)
message_radious_entry.grid(row=3, column=3, columnspan=2)
message_radious_label.grid(row=3, column=2)

add_button = Button(text="Добавить окружность", command=addCircle)
add_button.grid(row=4, column=2)

count_button = Button(text="Расчитать", command=outputAnswer)
count_button.grid(row=4, column=3)

delete_button = Button(text="Очистить", command=deleteCircles)
delete_button.grid(row=4, column=4)

text = Text(width=60, height=5)
text.grid(row=5, column=2, columnspan=3)

#root.bind('<Button-1>', b1)
root.bind('<Button-2>', b3)
root.bind('<Motion>', createField)

root.mainloop()
