CODES SEGMENT PARA PUBLIC 'CODE'
         ASSUME CS:CODES, DS:CODES
ORG 100H
BEGIN:  JMP INIT
SAVEINT9 DD ?
MSG DB "Andreev", 10, 13
NEWINT9:
        IN AL, 60H
        CMP AL, 42
        JE UNINSTALL
        CMP AL, 58
        JNE EXIT
        MOV AL, 1
        MOV BH, 0
        MOV BL, 11110000B
        MOV CX, 9
        MOV DH, 24
        MOV DL, 11
        PUSH CS
        POP ES
        MOV BP, OFFSET MSG
        MOV AH, 13H
        INT 10H
EXIT:
        JMP CS:SAVEINT9
UNINSTALL:
        MOV AX, 2509H
        LDS DX, CS:SAVEINT9
        INT 21H
        MOV ES, CS:2CH
        MOV AH, 49H
        INT 21H
        PUSH CS
        POP ES
        MOV AH, 49H
        INT 21H
        JMP CS:SAVEINT9
INIT:
        CLI
        MOV AX, 3509H
        INT 21H
        MOV WORD PTR SAVEINT9, BX
        MOV WORD PTR SAVEINT9+2,ES
        MOV AX, 2509H
        MOV DX, OFFSET NEWINT9
        INT 21H
        MOV AX, 3100H
        MOV DX, (init - begin + 10FH) / 16
        STI
        INT 21H
CODES ENDS
END BEGIN