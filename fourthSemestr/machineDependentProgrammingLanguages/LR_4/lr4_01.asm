StkSeg SEGMENT PARA STACK 'STACK'
		DB 200h DUP (?)
StkSeg ENDS
;
;---------------------
DATASG SEGMENT PARA
	    MAX_LEN = 10
	    STRING DB MAX_LEN, MAX_LEN DUP('$')
DATASG ENDS
;---------------------
Code SEGMENT PARA
   		ASSUME DS:DATASG, CS:Code, ES:Code
START:
	    .386
	    PUSH DS
	    MOV AX, DATASG
	    MOV DS, AX
	    MOV ES, AX
	    XOR AX, AX
	    ;--------------------
	    LEA DX, STRING
	    MOV AH, 10
	    INT 21H

	    ;вывод на экран
	    MOV STRING+1, 0AH
	    LEA DX, STRING+1
	    MOV AH, 9
	    INT 21H

	    ;завершение программы
	    MOV AX, 4C00h
	    INT 21h
Code 	ENDS
		END START