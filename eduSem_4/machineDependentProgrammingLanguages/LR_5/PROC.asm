PUBLIC DEL_ROW
;---------------------
EXTRN MATRIX_HEIGHT:BYTE
EXTRN MATRIX_WIDTH:BYTE
EXTRN MAT:BYTE
;---------------------
DATAS SEGMENT PARA PUBLIC 'DATA'
    IND DB 1
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
    MOV IND, AL                     ; Запись номера стобца в ROW из остатка в AH

    JMP BACK
;---------------------
FIND_MIN:
    MOV AL, MATRIX_HEIGHT
    MUL MATRIX_WIDTH

    MOV CX, AX
    XOR SI, SI                       ; Номер проверяемого символа


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
    ;JMP S_BACK
;---------------------
DELETE:
    MOV DH, IND

    CMP MATRIX_HEIGHT, DH 
    JG DECR

    INIT_DEL:
        MOV AL, IND
        MOV AH, MATRIX_HEIGHT
        MOV IND, AH
        SUB IND, AL
        SUB IND, 1
        MUL MATRIX_WIDTH
        MOV SI, AX
        MOV AL, MATRIX_WIDTH
        MUL IND

        MOV CX, AX
        MOV DH, 0
        MOV DL, MATRIX_WIDTH
        MOV DI, DX
        ADD DI, SI

    SHIFT:
        MOV AL, MAT[DI]
        MOV MAT[SI], AL

        INC SI
        INC DI
        LOOP SHIFT

    DECR:
        DEC MATRIX_HEIGHT

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
