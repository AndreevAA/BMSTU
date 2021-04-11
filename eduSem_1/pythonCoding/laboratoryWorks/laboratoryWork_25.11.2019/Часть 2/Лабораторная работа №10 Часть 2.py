'''
    Лабораторная работа №10 Андреева Александра Иу7-14Б
'''

import pickle

data = {
     'a': [1, 2.0, 3, 4+6j],
     'b': ("character string", b"byte string"),
     'c': {None, True, False}
     }

#with open('data.pickle', 'wb') as f:
#    pickle.dump(data, f)
#with open('data.pickle', 'rb') as f:
#    data_new = pickle.load(f)
#print(data_new)

# Функция 0 Выбор файла
def open_file(text):
    name = input("Введите название файла в формате <name>.txt: ")#Проверка возможности создания файла с заданным именем
    while len(name) < 5 or (name[-4:]!='.txt') or ('\\' in name) or ('/' in name)\
    or (':' in name) or ('*' in name) or ('?' in name) or ('"' in name) or ('<' in name)\
    or ('>' in name) or ('|' in name)or name == 'program_10_element.txt':
        print('Неправильно введено название файла, попробуйте ещё раз')
        name = input()
    return name #Входящее значения для функций option 1-6

# Вывод всех значений
def all_information(name):
    try:
        with open(name,'rb') as f:
            for i in range (pickle.load(f)):#Чтение количества записей + продвижение на 1 строку
                print('{:3}'.format(i + 1) + '   ' + str(pickle.load(f))[1:-1].replace("'",""))
                #Относительно удобный для чтения вывод
    except EOFError and pickle.UnpicklingError:
        print('Файл не найден, повреждён или не содержит записей')

#print(data)

# Поиск по одному полю
def Search_1_Field(name):
    try:
        SEARCH=False
        with open(name,'rb') as f:
            STRING = pickle.load(f)#Продвижение на строку
            KEY = list(dict(pickle.load(f)).keys())#Изъятие ключей в удобном виде (list)
        print('Выберите ключ, по которому нужно совершить поиск:')
        for j in range (len(KEY)):
            print('{:3}'.format(j+1)+'   '+KEY[j])
        Js=input() #Защита от неправильного ввода(встечается несколько раз в коде)
        while not(Js.isdigit() == True and (1<=int(Js)<=len(KEY))):
            Js=input()   
        KEYs=KEY[int(Js)-1]#Ключ и значение
        print('Введите искомое значение ключа "'+KEYs+'":')
        VALUEs=input()
        with open(name,'rb') as f:
            for i in range (pickle.load(f)):
                STRING=dict(pickle.load(f))
                if STRING.get(KEYs)==VALUEs: #Реализация поиска
                    print('{:3}'.format(i+1)+'   '+str(STRING)[1:-1].replace("'",""))
                    SEARCH=True
            if SEARCH==False: #Случай - ни одна строка не соответствует условию
                print('Поиск не дал результатов')
    except EOFError and pickle.UnpicklingError: #Исключение распространённых ошибок(пустой файл, отсутствие файла, испорченный файл)
        print('Файл не найден, повреждён или не содержит записей')

# Поиск по двум полям
def Search_2_Fields(name):
    try:
        SEARCH = False #См. комментарии к option_2
        with open(name,'rb') as f:
            STRING = pickle.load(f)
            KEY = list(dict(pickle.load(f)).keys())
        print('Выберите ключ №1, по которому нужно совершить поиск:')
        for j in range (len(KEY)):
            print('{:3}'.format(j+1)+'   '+KEY[j])
        Js1 = input()
        while not(Js1.isdigit() == True and (1 <= int(Js1) <= len(KEY))):
            Js1=input()   
        KEYs1=KEY[int(Js1)-1]
        print('Выберите ключ №2, по которому нужно совершить поиск:')
        for j in range (len(KEY)):
            print('{:3}'.format(j+1)+'   '+KEY[j])
        Js2=input()
        while not(Js2.isdigit()==True and (1<=int(Js2)<=len(KEY)) and int(Js2)!=int(Js1)):#Доп. условие - разные ключи
            Js2=input()   
        KEYs2=KEY[int(Js2)-1]
        print('Введите искомое значение ключа "'+KEYs1+'":')
        VALUEs1=input()
        print('Введите искомое значение ключа "'+KEYs2+'":')
        VALUEs2=input()
        with open(name,'rb') as f:
            for i in range (pickle.load(f)):
                STRING=dict(pickle.load(f))
                if STRING.get(KEYs1)==VALUEs1 and STRING.get(KEYs2)==VALUEs2:
                    print('{:3}'.format(i+1)+'   '+str(STRING)[1:-1].replace("'",""))
                    SEARCH=True
            if SEARCH==False:
                print('Поиск не дал результатов')
    except EOFError and pickle.UnpicklingError:
        print('Файл не найден, повреждён или не содержит записей')

# Новая запись
def new_note(name):
    try:
        with open (name,'rb') as f, open ('program_10_element.txt','wb') as g:
            I = int(pickle.load(f))
            print('Введите количество дополнительных записей:')
            Ia = input()
            while Ia.isdigit() != True:
                print("Вы ввели некорректное количество записей, попробуйте повторить ввод...")
                Ia = input()
            Ia=int(Ia)
            pickle.dump((I+Ia),g)
            for i in range (I):
                STRING=pickle.load(f)
                pickle.dump(STRING,g)
            KEY=list(dict(STRING).keys())#Извлечение ключей
            for i in range (Ia):#Доп. записи
                DICT={}
                for j in range (len(KEY)):
                    print('Запись №'+str(I+i+1)+', значение ключа "'+KEY[j]+'":')
                    VALUE=input()
                    DICT.update({KEY[j]:VALUE})
                pickle.dump(DICT,g)#Запись в "буфер"
        with open (name,'wb') as f, open ('program_10_element.txt','rb') as g:#Запись из "буфера"
            for i in range (I+Ia+1):
                pickle.dump(pickle.load(g),f)
    except EOFError and pickle.UnpicklingError:
        print('Файл не найден, повреждён или не содержит записей')

# Удаление записи
def delete_note(name):
    try:
        with open (name,'rb') as f, open ('program_10_element.txt','wb') as g:
            I=int(pickle.load(f))
            print('Введите № записи, которую нужно удалить:')
            Id=input()
            while Id.isdigit()!=True:
                print("Вы ввели некорректное количество записей, попробуйте повторить ввод...")
                Id = input()
            Id=int(Id)-1
            pickle.dump((I-1),g)
            for i in range (I):
                if i!=Id:
                    pickle.dump(pickle.load(f),g)#Перезапись с помощью "буфера"
                else:
                    p=pickle.load(f)
        with open (name,'wb') as f, open ('program_10_element.txt','rb') as g:
            for i in range (I):
                pickle.dump(pickle.load(g),f)
    except EOFError and pickle.UnpicklingError:
        print('Файл не найден, повреждён или не содержит записей')

# Создание нового файла
def Create_New_File(name):
    with open(name,'wb') as f:
        print('Введите количество ключей:')#Запись ключей в list
        J=input()
        while J.isdigit()!=True:
            J=input()
        J=int(J)
        KEY=['']*J
        for i in range (J):
            print('Введите название ключа №'+str(i+1)+':')
            KEY[i]=input()
        print('Введите количество записей:')
        I=input()
        while I.isdigit()!=True:
            I=input()
        I=int(I)
        pickle.dump(I,f)
        for i in range (I):#Создание dict
            DICT={}
            for j in range (J):
                print('Запись №'+str(i+1)+', значение ключа "'+KEY[j]+'":')
                VALUE=input()
                DICT.update({KEY[j]:VALUE})
            pickle.dump(DICT,f)

# Меню действий            
actions = [
    open_file, all_information, Search_1_Field, Search_2_Fields, new_note, delete_note, Create_New_File
]

def main(name='name.txt'):
    global actions

    # Ввод данных
    while True:
        print("Выберете действие:")
        print("1 - Открытие существующей БД")
        print("2 - Вывод всех значений БД")
        print("3 - Поиск по одному полю")
        print("4 - Поиск по двум полям")
        print("5 - Новая запись")
        print("6 - Удаление записи")
        print("7 - Создание нового файла")
        print("0 - Выход")

        # Проверка на правильность ввода
        action = ""
        try:
            flag = int(input("Введите номер нужной функции: "))
            action = actions[flag - 1]
            action(name)
            main(name)
        except:
            print("Введено неверно\n")
            continue
    res = action
main()
