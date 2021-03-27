EXTRN OUTPUT: far

StkSeg SEGMENT PARA STACK 'STACK'
		DB 200h DUP (?)
StkSeg ENDS
;
;---------------------
DATASG1 SEGMENT PARA PUBLIC 'DATASG' 
		DB   13
		DB   10
	    MAX_LEN = 10 		; установил максимальный размер введенной строки
	    STRING DB MAX_LEN, MAX_LEN DUP('$') ; Передал строке максимальный размер ввода и указал последний символ строки
DATASG1 ENDS
;---------------------
Code1 SEGMENT PARA PUBLIC 'Code' 
   		ASSUME DS:DATASG1, CS:Code1, ES:Code1
;---------------------
INPUT:
		MOV AX, DATASG1		; загрузка в AX адреса сегмента данных
	    MOV DS, AX			; установка DS

		LEA DX, STRING
	    MOV AH, 10
	    mov DX, OFFSET STRING

	    INT 21H

	    RET
;---------------------
PUBLIC STRING
;---------------------
START:	
	    ;Ввод данных
	    CALL INPUT

	    mov DX,OFFSET STRING

	    ;Вывод на экран
	    jmp OUTPUT

	    ;Завершение программы
	    ;MOV AX, 4Ch		; AH=4Ch завершение процесса
	    INT 21H				; вызов функции DOS
;---------------------
Code1 	ENDS
		END START