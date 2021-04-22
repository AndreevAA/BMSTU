EXTRN SBHVALUE:BYTE
EXTRN SBLVALUE:BYTE
EXTRN SIGN:BYTE
EXTRN SIGNOCT:BYTE
;---------------------
PUBLIC READ_NUM
;---------------------
CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODES
;---------------------
READ_SIGN PROC NEAR
    MOV AH, 1
    INT 21H

    CMP AL, "-"
    JE CHANGE_SIGN
    RET

    CHANGE_SIGN:
        MOV SIGN, "-"
    RET
READ_SIGN ENDP
;---------------------
READ_NUM PROC NEAR
    CALL READ_SIGN
    MOV SBHVALUE, 00000000B
    MOV SBLVALUE, 00000000B

    MOV CX, 8

    READ_SYMB:
        MOV AH, 1                           ; Чтение одного символа
        INT 21H

        CMP AL, 13                       ; Проверка на ошибку
        JE FINISHSWITCH

        SUB AL, "0"                         ; Получние численного значения введенного символа 
        SHL SBHVALUE, 1                     ; Сдвиг всех разрядов вправо, установил ноль в начало 111 -> 0111
        ADD SBHVALUE, AL

        LOOP READ_SYMB

    FINISHSWITCH:
        MOV BL, SBHVALUE
        MOV SBLVALUE, BL
        MOV SBHVALUE, 0

    FINISH:
    RET
READ_NUM ENDP
;---------------------
CODES ENDS
END
