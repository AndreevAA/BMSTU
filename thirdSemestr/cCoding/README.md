# Welcome to cCoding!

In repository of **[cCoding](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/cCoding)** you can find all laboratory works, made during the **[thirdSemestr](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr)** of **[BMSTU](https://github.com/AndreevAA/BMSTU)** IU7 Studying by **[AndreevAA](https://github.com/AndreevAA)**.

# Labs

## [LR6](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/cCoding/lab_06_01_01)

You need security
Strengthen in practice the skills of processing an array of structures with static fields
and text files, including:
1. reading from a text file;
2. search in the structure array by attribute;
3. use of command line arguments in the program.

Option number 1
The text file stores information about movies, which includes the name of the movie, the name of the director and the year it was released. In the title of the movie
no more than twenty five characters. The name of the filmmaker has no more than twenty-five characters. The release year is specified as an integer. The number of movies in the file itself is not
indicated. It is required to write a program that, being called from the command line:
app.exe FILE FIELD [KEY]
where FILE is the file name, FIELD is the analyzed field, KEY is the key value;
1. reads information about movies into an array. Information after reading the fields
of each structure is placed in an array so that it is immediately
ordered by the specified field.
1
2. If no key value is specified, outputs an ordered array.
3. If a key value is specified, performs a binary search1 on the field and value
key. If a movie with the required key value is found, the program outputs
information about it on the screen, otherwise the program displays the message "Not found".

Possible FIELD values:
1. "title" - the title of the movie;
2. "name" - the name of the director;
3. "year" - year of release.

Examples of a valid program call:
1.app.exe films.txt title
2.app.exe films.txt title CasinoRoyale
3. app.exe films title "Tinker Tailor Soldier Spy"
4. app.exe films.txt name "Marceau (Maupu)"
5. app.exe movies.txt name "John Howard Carpenter"

## [LR7](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/lab_07_04)

In progress..

## [LR8](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/lab_08_05_01)

In progress..

## [LR9](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/lab_09_01_01)

In progress..

## [LR10](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/lab_10)

In progress...

## [LR11](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/lab_11_01_01)

Implement a custom version of the snprintf function that processes the specified type specifiers. The function must be called my_snprintf. When implementing this function, it is prohibited to use any standard functions for processing strings.
Implemented specifiers (% c,% d,% i,% x,% o,% s) and modifiers (l and h) are assigned by the teacher.
The source code for the lab is located in the lab_11 branch. In this branch, the lab_11 folder is created, in which the program source code is located. Implemented
specifiers are saved in the format.txt file as the string "d hx s" (no quotation marks). To check the correctness of the solution to the problem, only modular
tests in which you need to compare the behavior (specification) of your function and the corresponding standard.
Function reference (eng.):
https://pubs.opengroup.org/onlinepubs/9699919799/functions/snprintf.html

---

Реализовать собственную версию функции snprintf, обрабатывающую указанные спецификаторы типа. Функция должна называться my_snprintf. При реализации этой функции запрещается использовать любые стандартные функции для обработки строк.
Реализуемые спецификаторы (%c, %d, %i, %x, %o, %s) и модификаторы (l и h) распределяются преподавателем.
Исходный код лабораторной работы располагается в ветке lab_11. В этой ветке создается папка lab_11, в которой располагается исходный код программы. Реализованные
спецификаторы сохраняются в файле format.txt в виде строки «d hx s» (кавычки не указываются). Для проверки правильности решения задачи реализуются только модульные
тесты, в которых нужно сравнить поведение (спецификацию) своей функции и соответствующей стандартной.
Справка по функции (англ.):
https://pubs.opengroup.org/onlinepubs/9699919799/functions/snprintf.html

