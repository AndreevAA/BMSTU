PUBLIC READ_SIZE
PUBLIC READ_MAT
PUBLIC PRINT_MAT
;---------------------
EXTRN MATRIX_HEIGHT:BYTE                
EXTRN MATRIX_WIDTH:BYTE
EXTRN MAT:BYTE
;---------------------
CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODES
;---------------------
; Перемещение курсора через пробел
PRINT_SPACE:
    MOV AH, 2
    MOV DL, " "
    INT 21H
    RET
;---------------------
; Переход на новую строчку
NEW_LINE:
    MOV AH, 2
    MOV DL, 10                  ; Перевод курсора на новую строку
    INT 21H

    MOV DL, 13                  ; Перевод курсора в начало строки
    INT 21H
    RET
;---------------------
; Чтение высоты и ширины через автоматическое перемещение курсора (пробел)
READ_SIZE PROC NEAR

    MOV AH, 1                   ; Чтение символа из строки (так как макс 9)
    INT 21H

    MOV MATRIX_HEIGHT, AL
    SUB MATRIX_HEIGHT, "0"      ; Получаю разницу с нулем -> В результате остается самое число
    
    CALL PRINT_SPACE
    
    MOV AH, 1                   ; Чтение символа из строки (так как макс 9)
    INT 21H

    MOV MATRIX_WIDTH, AL
    SUB MATRIX_WIDTH, "0"       ; Получаю разницу с нулем -> В результате остается самое число
    
    CALL NEW_LINE
    RET
READ_SIZE ENDP
;---------------------
; Чтение матрицы
READ_MAT PROC NEAR
    MOV CH, 0
    MOV DH, MATRIX_HEIGHT       
    MOV SI, 0                   ; Указатель номера элемента в матрице

    READ:
        CALL NEW_LINE           ; Перевод строки

        MOV CL, MATRIX_WIDTH   

        READ_ROW:
            MOV AH, 1           ; Чтение символа из строки
            INT 21H 

            MOV MAT[SI], AL     ; Запись на SI-элемента 
            INC SI              ; Увеличение указателя элемента в матрице

            CALL PRINT_SPACE    ; Вывод перевода курсора (пробела)
            LOOP READ_ROW

        MOV CL, DH
        DEC DH
        LOOP READ
    RET
READ_MAT ENDP
;---------------------
; Вывод матрицы
PRINT_MAT PROC NEAR
    CALL NEW_LINE               ; Переход на новую строку

    MOV CH, 0
    MOV DH, MATRIX_HEIGHT
    MOV SI, 0                   ; Указатель номера строки в матрице

    PRINT:
        CALL NEW_LINE

        MOV CL, MATRIX_WIDTH

        PRINT_ROW:
            MOV AH, 2           ; Вывод из DL на экран
            MOV DL, MAT[SI]     ; Помещение в DL следующей строки
            INT 21H

            INC SI              ; Увеличение строки
            CALL PRINT_SPACE    ; Вывод пробела между символами
            LOOP PRINT_ROW      

        MOV CL, DH
        DEC DH
        LOOP PRINT
    RET
PRINT_MAT ENDP
CODES ENDS
END
