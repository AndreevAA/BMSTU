.386P

; Структура дескриптора сегмента.
DESCR   STRUC
    LIMIT   DW  0
    BASE_L  DW  0
    BASE_M  DB  0
    ATTR_1  DB  0
    ATTR_2  DB  0
    BASE_H  DB  0
DESCR   ENDS

; Сегмент данных.
; USE16 - использование 16-битных адресов по умолчанию.
DATA    SEGMENT USE16
    GDT_NULL DESCR<0,0,0,0,0,0>
    GDT_DATA DESCR<DATA_SIZE-1,0,0,92H,0,0>
    GDT_CODE DESCR<CODE_SIZE-1,0,0,98H,0,0>
    GDT_STACK DESCR<255,0,0,92H,0,0>
    GDT_SCREEN DESCR<4095,8000H,0BH,92H,0,0>
    GDT_DATA32 DESCR<0FFFFH,0,0,92H,11001111B,0>
    GDT_SIZE=$-GDT_NULL

    PDESCR  DF  0

    MSGRM  DB  '!REAL MODE!'
    MSGRM_LEN=$-MSGRM
    MSGPM  DB  '!PROTECTED MODE!'
    MSGPM_LEN=$-MSGPM

    PARAM=1CH
    COL=30
    ROW=12

    DATA_SIZE=$-GDT_NULL
DATA    ENDS

TEXT    SEGMENT 'CODE' USE16
    ASSUME  CS:TEXT, DS:DATA
    MAIN    PROC
        MOV AX, DATA
        MOV DS, AX
        MOV AX, 0B800H
        MOV ES, AX

        MOV DI, ROW * 160 + COL * 2
        MOV BX, OFFSET MSGRM
        MOV CX, MSGRM_LEN
        MOV AH, PARAM

        PRINTRM: 
            MOV AL, BYTE PTR [BX]
            INC BX
            STOSW
        LOOP    PRINTRM

        XOR EAX, EAX
        MOV AX, DATA
        SHL EAX, 4
        MOV EBP, EAX
        MOV BX, OFFSET GDT_DATA
        MOV WORD PTR [BX].BASE_L, AX
        SHR EAX, 16
        MOV BYTE PTR [BX].BASE_M, AL

        XOR EAX, EAX
        MOV AX, CS
        SHL EAX, 4
        MOV BX, OFFSET GDT_CODE
        MOV WORD PTR [BX].BASE_L, AX
        SHR EAX, 16
        MOV BYTE PTR [BX].BASE_M, AL

        XOR EAX, EAX
        MOV AX, SS
        SHL EAX, 4
        MOV BX, OFFSET GDT_STACK
        MOV WORD PTR [BX].BASE_L, AX
        SHR EAX, 16
        MOV BYTE PTR [BX].BASE_M, AL

        MOV DWORD PTR PDESCR + 2, EBP
        MOV WORD PTR PDESCR, GDT_SIZE - 1
        LGDT    PDESCR

        CLI

        MOV EAX, CR0
        OR  EAX, 1
        MOV CR0, EAX

        DB  0EAH
        DW  OFFSET CONTINUE
        DW  16

    CONTINUE:
        MOV AX, 8
        MOV DS, AX

        MOV AX, 24
        MOV SS, AX

        MOV AX, 32
        MOV ES, AX

        MOV AX, 40
        MOV GS, AX

        MOV DI, (ROW + 1) * 160 + COL * 2
        MOV BX, OFFSET MSGPM
        MOV CX, MSGPM_LEN
        MOV AH, PARAM

        PRINTPM:
            MOV AL, BYTE PTR [BX]
            INC BX
            STOSW
        LOOP    PRINTPM


        MOV GDT_DATA.LIMIT, 0FFFFH
        MOV GDT_CODE.LIMIT, 0FFFFH
        MOV GDT_STACK.LIMIT, 0FFFFH
        MOV GDT_SCREEN.LIMIT, 0FFFFH

        PUSH DS
        POP  DS
        PUSH ES
        POP  ES
        PUSH SS
        POP  SS

        DB  0EAH
        DW  OFFSET GO
        DW  16

    GO:
        MOV EAX, CR0
        AND EAX, 0FFFFFFFEH
        MOV CR0, EAX
        DB  0EAH
        DW  OFFSET RETURN
        DW  TEXT

    RETURN:
        MOV AX, DATA
        MOV DS, AX
        MOV AX, STK
        MOV SS, AX

        STI

        MOV DI, (ROW + 2) * 160 + COL * 2
        MOV BX, OFFSET MSGRM
        MOV CX, MSGRM_LEN
        MOV AH, PARAM

        PRINTRMAG:
            MOV AL, BYTE PTR [BX]
            INC BX
            STOSW
        LOOP    PRINTRMAG

        MOV AX, 4C00H
        INT 21H

    MAIN    ENDP
    CODE_SIZE=$-MAIN
TEXT    ENDS

STK SEGMENT STACK 'STACK'
    DB  256 DUP('^')
STK ENDS
END MAIN