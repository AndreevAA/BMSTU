PUBLIC DEL_ROW
;---------------------
EXTRN MATRIX_HEIGHT:BYTE
EXTRN MATRIX_WIDTH:BYTE
EXTRN MAT:BYTE
;---------------------
DATAS SEGMENT PARA PUBLIC 'DATA'
    ROW DB 1                        ; Номер столбца с минимальной цифрой
    IND DB 1
    TEMP_ROW DB 1
    MIN DB 1                        ; Минимальное значение цифры в матрице
DATAS ENDS
;---------------------
CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODES, DS:DATAS
;---------------------
REPLACE:
    MOV MIN, DH                     ; Замена минимального числао текущим числом матрицы
    MOV AX, SI                      ; Ставка в AX номера элемента
    DIV MATRIX_WIDTH                ; Получение номера столбца матрицы делением AX на MATRIX_WIDTH в AH 
    ;MOV IND, AL                     ; Запись номера стобца в ROW из остатка в AH
    MOV ROW, AH                     ; Запись номера стобца в ROW из остатка в AH

    JMP BACK
;---------------------
FIND_MIN:
    MOV AL, MATRIX_HEIGHT
    MUL MATRIX_WIDTH

    MOV CX, AX
    MOV SI, 0                       ; Номер проверяемой строки

    BRUTE:
        MOV DH, MAT[SI]             ; Поставка в данные текущего значения элемента матрицы
        CMP MIN, DH                 ; Сравнивую минимум и 
        JG REPLACE                  ; Проверка флага ZF на предмет верность = 0
        BACK:
        INC SI                      ; Переход на новый символ
        LOOP BRUTE
    RET
;---------------------
DELETE_NUMBER:
    INC SI
    JMP S_BACK
;---------------------
DELETE:

    SHIFT:

        DIV MATRIX_WIDTH

        CMP ROW, AH 

        JNE DELETE_NUMBER

        S_BACK:

        MOV DL, MAT[SI]

        INC DL
        INC AX
        LOOP SHIFT

    DEC MATRIX_WIDTH
    RET
;--------------------- 
DEL_ROW PROC NEAR
    MOV MIN, "9"                    ; Устанавливаю максимальное значение в минимальное

    CALL FIND_MIN                   ; Вызов поиска минимального элемента 
    CALL DELETE                     ; Вызов удаления строки

    RET
DEL_ROW ENDP
CODES ENDS
END
