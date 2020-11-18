# Welcome to TaDS!

In repository of **[TaDS](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures)** you can find all laboratory works, made during the **[thirdSemestr](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr)** of **[BMSTU](https://github.com/AndreevAA/BMSTU)** IU7 Studying by **[AndreevAA](https://github.com/AndreevAA)**.

# Labs

## [LR1](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/LR1)

### Purpose of work
It is necessary to write a program that simulates the multiplication of an integer up to 30 decimal digits long by a real number in the form + -m.nE + -K, where the total length of the mantissa (m + n) is up to 30 significant digits (excluding the dot), and the value is of the order of K - up to 5 digits. The compiled program should give their product in the form + -0.m1EK1, where m1 is up to 30 significant digits, and K1 up to 5 digits.

### Description of the problem condition

a. Description of input data and results
As initial data, the program receives as input two numbers entered in two different lines, where in the first - an integer is entered, and in the second - a real number is entered in the format + -m.nE + -K.

Restrictions on the entered integer:
Up to 30 significant digits

Restrictions on the entered real number:
 (m + n) - up to 30 significant digits
value of the order of K - up to 5 digits

After an appropriate explanation, the program should output the product of the entered integer and a real number in a specific form + -0.m1EK1, where m1 is up to 30 significant digits, and K1 up to 5 digits.

If it is not possible to multiply, the program must inform the user about it in the console.
b. Description of the task carried out by the program
When storing real numbers in the computer's RAM, it is necessary to provide the following format for their representation (see Fig. 1)

Figure: 1
This data presentation format must be provided with a special data storage structure number, containing four different fields: mantisa_sign (number mantissa sign), mantisa (number mantissa), order_sign (order sign

## [LR2](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/LR2)

### Purpose of work
The goal of the work is to acquire skills in working with the data type “record” (“structure”), containing the variant part, and with the data stored in tables. evaluate the relative efficiency of the program (in percent) in terms of time and memory used, depending on the algorithm used and the amount of information being sorted.

### Description of the problem condition

Create a table containing at least 40 records (type - record with variants (joins)). Sort the data in it in ascending order of keys, by two sorting algorithms, where the key is any nonvariant field (according to the programmer's choice, it is Student's age / Student's GPA / House or dorm number / Room or apartment number), using: a) the table itself, b) an array of keys. (Ability to add and delete records manually is required). Search for information by option.
There are descriptions:
Type of housing = (house, dorm);
Data: Last name, first name, group, gender (m, f), age, average score for the session, date of admission
address :
house: (street, house no., apartment no.);
hostel: (no., no.);
Enter a general list of students.
Display a list of students living in a hostel for the specified year of admission

## [LR3](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/LR3)

### Purpose of work
The goal of the work is to implement an algorithm for processing sparse matrices, to compare the efficiency of using these algorithms in time and the desired memory with standard matrix algorithms for different percentages of matrices filling with nonzero values ​​and for different matrix sizes.

### Description of the problem condition

A sparse (containing many zeros) matrix is ​​stored in the form of 3 objects:
- vector A contains values ​​of nonzero elements;
- vector JA contains column numbers for elements of vector A;
- a linked list IA, the element of which contains the number of components in A and JA, with which the description of the row Nk of the matrix A.

1. Simulate a sequence of operations of multiplication of a vector-matrix stored in a form with obtaining a result in the same form.
2. Perform the multiplication operation using the standard algorithm for working with matrices.
3. Compare the execution time of operations and the amount of memory when using these two algorithms with different percentages of matrix filling.

## [LR4](https://github.com/AndreevAA/BMSTU/tree/master/thirdSemestr/typesAndDataStructures/LR4)

### Purpose of work
The goal of the work is to acquire the skills to implement the operation of working with a stack, which is presented in the form of an array (static or dynamic) and in the form of a singly linked linear list; evaluate the advantages and disadvantages of each implementation: get an idea of the mechanisms for allocating and freeing memory when working with the stack.

### Description of the problem condition

Create a program for working with a stack that performs operations of adding, removing elements and displaying the current state of the stack.
Implement a stack:
a) an array;
b) a list.
All standard stack operations must be subroutine. When implementing a stack as a list, add a lookup of the addresses of stack elements to the output of the current state of the stack and create your own list or array of free areas (addresses of freed elements) with displaying it on the screen.
Using the stack, determine if a string is a palindrome