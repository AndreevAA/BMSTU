EXTRN OUTPUT: far
PUBLIC STRING

StkSeg SEGMENT PARA STACK 'STACK'
		DB 100h DUP (?)
StkSeg ENDS
;
;---------------------
DATASG1 SEGMENT PARA PUBLIC 'DATASG' 
	    STRING DB 10, 10 DUP('$') ; Передал строке максимальный размер ввода и указал последний символ строки
DATASG1 ENDS
;---------------------
Code1 SEGMENT PARA PUBLIC 'Code' 
   		ASSUME DS:DATASG1, CS:Code1, ES:Code1
;---------------------
CRLF:
	mov ah, 02h
	mov al, 13
	int 21h
	mov al, 10
	int 21h
	ret
;---------------------
INPUT:
		MOV AX, DATASG1			; загрузка в AX адреса сегмента данных
	    MOV DS, AX				; установка DS

	    MOV AH, 10				; Чтение строки
	    
	    mov DX, OFFSET STRING 	; DX на смещение

	    INT 21H

	    RET
;---------------------
START:	
	    ;Ввод данных
	    CALL INPUT

	    ;Вывод на экран
	    CALL OUTPUT

	    ;call CRLF

	    ;Завершение программы
	    ;MOV AX, 4Ch		; AH=4Ch завершение процесса
	    INT 21H				; вызов функции DOS
;---------------------
Code1 	ENDS
		END START
