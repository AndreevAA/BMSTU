PUBLIC TO_HEX
PUBLIC TO_OCT
;---------------------
EXTRN SIGN:BYTE
EXTRN SBHVALUE:BYTE
EXTRN SBLVALUE:BYTE
EXTRN HEXTABLE:BYTE
EXTRN UOVALUE:BYTE
EXTRN SHVALUE:BYTE
;---------------------
CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODES
;---------------------
TO_HEX PROC NEAR
    MOV BX , OFFSET  HEXTABLE               ; Скорректировал границу
    MOV AL, SBHVALUE                        ; Запись в AL считанного слова

    ; Логически сдвигаю битами - заполняю нулями
    MOV CL, 4
    SHR AL, CL

    XLAT                                    ; Используя индекс из регистра AL, выбирает элемент из таблицы, расположенной в памяти по адресу DS:(E)BX, и помещает его в AL;

    MOV SHVALUE[0], AL
    MOV AL, SBHVALUE
    AND AL, 00001111B                       ; обнулит старшие биты 0 регистра al, а младшие не изменит

    XLAT
    
    MOV SHVALUE[1], AL 
    MOV AL, SBLVALUE
    
    ; Логически сдвигаю битами - заполняю нулями
    SHR AL, CL

    XLAT

    MOV SHVALUE[2], AL
    MOV AL, SBLVALUE
    AND AL, 00001111B

    XLAT

    MOV SHVALUE[3], AL

    RET
TO_HEX ENDP
;---------------------
TO_OCT PROC NEAR

    CALL FILL_OCT
    RET

    REVERSE:
        NEG SBLVALUE

        CMP SBLVALUE, 00000000B

        JE F

        CALL FILL_OCT

        SUB SBLVALUE, 1
        NOT SBLVALUE
        NOT SBHVALUE

        RET

        F:
            ADD SBHVALUE, 1
            CALL FILL_OCT

            SUB SBLVALUE, 1
            SUB SBHVALUE, 1

            NOT SBLVALUE
            NOT SBHVALUE
    RET
TO_OCT ENDP
;---------------------
FILL_OCT PROC NEAR
    MOV AL, SBHVALUE
    AND AL, 01110000B
    SHR AL, 1
    SHR AL, 1
    SHR AL, 1
    SHR AL, 1
    ADD AL, "0"

    MOV UOVALUE[0], AL
    MOV AL, SBHVALUE
    AND AL, 00001110B
    SHR AL, 1
    ADD AL, "0"

    MOV UOVALUE[1], AL
    MOV AL, SBHVALUE
    AND AL, 00000001B
    MOV DL, 4
    MUL DL
    MOV DL, AL
    MOV AL, SBLVALUE
    AND AL, 11000000B
    ROL AL, 1
    ROL AL, 1
    ADD AL, DL
    ADD AL, "0"

    MOV UOVALUE[2], AL
    MOV AL, SBLVALUE
    AND AL, 00111000B
    SHR AL, 1
    SHR AL, 1
    SHR AL, 1
    ADD AL, "0"

    MOV UOVALUE[3], AL
    MOV AL, SBLVALUE
    AND AL, 00000111B
    ADD AL, "0"
    MOV UOVALUE[4], AL
    RET
FILL_OCT ENDP
;---------------------
CODES ENDS
END

