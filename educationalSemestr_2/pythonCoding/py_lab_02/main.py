#!/usr/bin/python
# -*- coding: utf-8 -*-
 
from tkinter import *
 
class UI(Frame):
    def __init__(self, parent):
        Frame.__init__(self, parent)   
        self.parent = parent        
        self.initUI()
        self.calculatorUI()
        
    def initUI(self):
        self.parent.title("Quaternary calculator")
        
        menubar = Menu(self.parent)
        self.parent.config(menu=menubar)
        
        fileMenu = Menu(menubar)
        runMenu = Menu(menubar)

        ## File Menu ##
        fileMenu.add_command(label="Exit", command=self.onExit)   ## Выход из программы
        fileMenu.add_command(label="About", command=self.onExit)  ## О программе: информация о создателе и назначении программы
        #fileMenu.add_command(label="History", comand=self.onExit) ## История вычислений с момента последнего запуска
        menubar.add_cascade(label="File", menu=fileMenu)

       	## Run Menu ##
        runMenu.add_command(label="Run module", command=self.onExit) ## Запуск вычислений с текущими введенными в поля данными
        runMenu.add_command(label="Run recent", command=self.onExit) ## запуск последних вычислений
        menubar.add_cascade(label="Run", menu=runMenu)          

    def calculatorUI(self):
    	## Поле ввода ##
    	Label(text="Entry field:").grid(row=0, column=0, sticky=W, pady=1, padx=10)
    	input_data = Text(width=50)
    	input_data.grid(row = 0, column = 1, columnspan = 7)

    	## Поле вывода ##
    	Label(text="Ouput field:").grid(row=1, column=0, sticky=W, pady=1, padx=10)
    	output_data = Text(width=50)
    	output_data.grid(row = 1, column = 1, columnspan = 7)

    	## Кнопки значений ##
    	B1 = Button(text = "1", width = 5, height = 5)
    	B1.grid(row = 2, column = 1, command=self.insert_input("1", input_data))

    	B2 = Button(text = "2", width = 5, height = 5)
    	B2.grid(row = 2, column = 2)

    	B3 = Button(text = "3", width = 5, height = 5)
    	B3.grid(row = 2, column = 3)

    	BDEL = Button(text = "DEL", width = 5, height = 5)
    	BDEL.grid(row = 2, column = 4)

    	BAC = Button(text = "AC", width = 5, height = 5)
    	BAC.grid(row = 2, column = 5)

    	BAC = Button(text = "CALC", width = 5, height = 5)
    	BAC.grid(row = 2, column = 6)

    	B4 = Button(text = "4", width = 5, height = 5)
    	B4.grid(row = 3, column = 1)

    	B5 = Button(text = "5", width = 5, height = 5)
    	B5.grid(row = 3, column = 2)

    	B6 = Button(text = "6", width = 5, height = 5)
    	B6.grid(row = 3, column = 3)

    	BDEL = Button(text = "*", width = 5, height = 5)
    	BDEL.grid(row = 3, column = 4)

    	BAC = Button(text = "/", width = 5, height = 5)
    	BAC.grid(row = 3, column = 5)

    	B7 = Button(text = "7", width = 5, height = 5)
    	B7.grid(row = 4, column = 1)

    	B8 = Button(text = "8", width = 5, height = 5)
    	B8.grid(row = 4, column = 2)

    	B9 = Button(text = "9", width = 5, height = 5)
    	B9.grid(row = 4, column = 3)

    	BDEL = Button(text = "+", width = 5, height = 5)
    	BDEL.grid(row = 4, column = 4)

    	BAC = Button(text = "-", width = 5, height = 5)
    	BAC.grid(row = 4, column = 5)

    	B0 = Button(text = "0", width = 5, height = 5)
    	B0.grid(row = 5, column = 1)

    	Bpoint = Button(text = ".", width = 5, height = 5)
    	Bpoint.grid(row = 5, column = 1)

    def insert_input(self, string, input_data):
    	text = str(input_data.get(1.0, END) + str(string))
    	input_data.insert(1.0, text)


    def onExit(self):
        self.quit()
 
def main():
    root = Tk()
    root.geometry("250x150+300+300")
    app = UI(root)
    root.mainloop()
 
if __name__ == '__main__':
    main()