StkSeg SEGMENT PARA STACK 'STACK'
		DB 200h DUP (?)
StkSeg ENDS
;
;---------------------
DATASG SEGMENT PARA
	    MAX_LEN = 10 		; установил максимальный размер введенной строки
	    STRING DB MAX_LEN, MAX_LEN DUP('$') ; Передал строке максимальный размер ввода и указал последний символ строки
DATASG ENDS
;---------------------
Code SEGMENT PARA
   		ASSUME DS:DATASG, CS:Code, ES:Code
;---------------------
INPUT:
		LEA DX, STRING
	    MOV AH, 10
	    INT 21H

	    RET
;---------------------
OUTPUT: 
		mov AX,DATASG
		mov DS,AX
		mov DX,OFFSET STRING
		
		mov AH,9
		int 21h
			
		mov AH,7
		INT 21h
		mov AH,4Ch
		int 21h
		
		RET 
;---------------------	
START:
	    PUSH DS
	    MOV AX, DATASG		; загрузка в AX адреса сегмента данных
	    MOV DS, AX			; установка DS
	    MOV ES, AX			; установка ES
	    XOR AX, AX

	    ;Ввод данных
	    CALL INPUT

	    ;Вывод на экран
	    CALL OUTPUT

	    ;Завершение программы
	    MOV AX, 4C00h		; AH=4Ch завершение процесса
	    INT 21H				; вызов функции DOS
Code 	ENDS
		END START