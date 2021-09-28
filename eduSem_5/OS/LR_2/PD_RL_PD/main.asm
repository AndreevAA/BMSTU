.386P

SEGDESCR STRUC
    LIMIT   DW 0
    BASE_L  DW 0
    BASE_M  DB 0
    ATTR_1  DB 0
    ATTR_2  DB 0
    BASE_H  DB 0
SEGDESCR ENDS

INTDESCR STRUC
    OFFS_L  DW 0
    SEL     DW 0
    CNTR    DB 0
    ATTR    DB 0
    OFFS_H  DW 0
INTDESCR ENDS

STACK32 SEGMENT  PARA STACK 'STACK'
    STACK_START DB  100H DUP(?)
    STACK_SIZE=$-STACK_START
STACK32 ENDS

DATA32 SEGMENT PARA 'DATA'
    GDT_NULL    SEGDESCR<>
    GDT_CODE16  SEGDESCR<CODE16_SIZE-1,0,0,98H>
    GDT_DATA4GB SEGDESCR<0FFFFH,0,0,92H,0CFH>
    GDT_CODE32  SEGDESCR<CODE32_SIZE-1,0,0,98H,40H>
    GDT_DATA32  SEGDESCR<DATA_SIZE-1,0,0,92H,40H>
    GDT_STACK32 SEGDESCR<STACK_SIZE-1,0,0,92H,40H>
    GDT_VIDEO16 SEGDESCR<3999,8000H,0BH,92H>

    GDT_SIZE=$-GDT_NULL
    PDESCR    DF 0

    CODE16S=8
    DATA4GBS=16
    CODE32S=24
    DATA32S=32
    STACK32S=40
    VIDEO16S=48

    IDT LABEL BYTE

    INTDESCR_0_12     INTDESCR 13 DUP (<0,CODE32S,0,8FH,0>)
    INTDESCR_13       INTDESCR <0,CODE32S,0,8FH,0>
    INTDESCR_14_31    INTDESCR 18 DUP (<0,CODE32S,0,8FH,0>)

    INT08 INTDESCR <0,CODE32S,0,10001110B,0> 
    INT09 INTDESCR <0,CODE32S,0,10001110B,0>

    IDT_SIZE=$-IDT 

    IPDESCR     DF 0
    IPDESCR16   DW 3FFH, 0, 0

    MASK_MASTER DB 0        
    MASK_SLAVE  DB 0        
    
    ASCIIMAP   DB 0, 0, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 45, 61, 0, 0
    DB 81, 87, 69, 82, 84, 89, 85, 73, 79, 80, 91, 93, 0, 0, 65, 83
    DB 68, 70, 71, 72, 74, 75, 76, 59, 39, 96, 0, 92, 90, 88, 67
    DB 86, 66, 78, 77, 44, 46, 47

    PR_FLAG     DB 0
    CNT_TIME    DB 0            

    SYML_POS    DD 2 * 80 * 5

    INTERVAL=10

    MEM_POS=30*2
    MEM_VALUE_POS=36*2
    MB_POS=45*2
    CURSOR_POS=80*2*2+38*2
    PARAM=21H

    CURSOR_SYMB_ON=221
    CURSOR_SYMB_OFF=222
    
    RM_MSG      DB 27, '[43;1m!NOW IN REAL MODE! ', 27, '[0m$'
    PM_MSG_WAIT DB 27, '[43;1m!PRESS ANY KEY TO ENTER PROTECTED MODE!', 27, '[0m$'
    PM_MSG_OUT  DB 27, '[43;1m!NOW IN REAL MODE AGAIN! ', 27, '[0m$'

    DATA_SIZE=$-GDT_NULL 
DATA32 ENDS

CODE32 SEGMENT PARA PUBLIC 'CODE' USE32
    ASSUME CS:CODE32, DS:DATA32, SS:STACK32

PM_START:
    MOV AX, DATA32S
    MOV DS, AX
    MOV AX, VIDEO16S
    MOV ES, AX
    MOV AX, STACK32S
    MOV SS, AX
    MOV EAX, STACK_SIZE
    MOV ESP, EAX

    STI 
       
    MOV DI, MEM_POS
    MOV AH, PARAM

    MOV AL, 'M'
    STOSW
    MOV AL, 'E'
    STOSW
    MOV AL, 'M'
    STOSW
    MOV AL, 'O'
    STOSW
    MOV AL, 'R'
    STOSW
    MOV AL, 'Y'
    STOSW
    MOV AL, ':'
    STOSW

    CALL COUNT_MEM
    
    PROCCESS:
        TEST PR_FLAG, 1
        JZ  PROCCESS
    
    CLI 

    DB  0EAH
    DD  OFFSET RETURN_RM
    DW  CODE16S

    EXCEPT_1 PROC
        IRET
    EXCEPT_1 ENDP

    EXCEPT_13 PROC FAR
        POP EAX
        IRET
    EXCEPT_13 ENDP

    NEW_INT08 PROC FAR
        MOV EDI, CURSOR_POS
        CMP CNT_TIME, INTERVAL
        JE X
        CMP CNT_TIME, INTERVAL*2
        JNE SKIP

        MOV AL, CURSOR_SYMB_OFF
        MOV CNT_TIME, 0
        JMP PR
        X:
            MOV AL, CURSOR_SYMB_ON
        PR:
            MOV AH, PARAM
            STOSW

        SKIP:
            MOV  AL, CNT_TIME
            INC AL
            MOV CNT_TIME, AL
            
            MOV AL, 20H
            OUT 20H, AL

            IRETD
    NEW_INT08 ENDP

    NEW_INT09 PROC FAR
        IN  AL, 60H
        CMP AL, 1CH

        JNE PRINT_VALUE         
        OR PR_FLAG, 1
        JMP ALLOW_KB

    PRINT_VALUE:
        CMP AL, 80H  
        JA ALLOW_KB     

        XOR AH, AH   

        XOR EBX, EBX
        MOV BX, AX

        MOV DH, PARAM
        MOV DL, ASCIIMAP[EBX]   
        MOV EBX, SYML_POS   
        MOV ES:[EBX], DX

        ADD EBX, 2          
        MOV SYML_POS, EBX

    ALLOW_KB:
        IN  AL, 61H 
        OR  AL, 80H 
        OUT 61H, AL 
        AND AL, 7FH 
        OUT 61H, AL

        MOV AL, 20H 
        OUT 20H, AL

        IRETD
    NEW_INT09 ENDP

    COUNT_MEM PROC NEAR
        MOV AX, DATA4GBS
        MOV DS, AX

        MOV EBX,  100001H
        MOV DL,   0AEH

        MOV ECX, 0FFEFFFFEH

        ITER_MEM:
            MOV DH, DS:[EBX] 

            MOV DS:[EBX], DL        
            CMP DS:[EBX], DL        
        
            JNZ PRINT_MEM        

            MOV DS:[EBX], DH 
            INC EBX
        LOOP ITER_MEM

        PRINT_MEM:
            MOV EAX, EBX 
            XOR EDX, EDX

            MOV EBX, 100000H
            DIV EBX

            ; Смена места вывода.
            MOV EBX, MEM_VALUE_POS
            CALL PRINT_EAX

            ; Смена места вывода.
            MOV AH, PARAM
            MOV EBX, MB_POS
            MOV AL, 'M'
            MOV ES:[EBX], AX

            MOV EBX, MB_POS + 2
            MOV AL, 'B'
            MOV ES:[EBX], AX
            RET
    COUNT_MEM ENDP
        
    PRINT_EAX PROC NEAR
        ADD EBX, 10H
        MOV ECX, 8
        MOV DH, PARAM

        PRINT_SYMBOL:
            MOV DL, AL
            AND DL, 0FH

            CMP DL, 10
            JL ADD_ZERO_SYM
            ADD DL, 'A' - '0' - 10

        ADD_ZERO_SYM:
            ADD DL, '0' 
            MOV ES:[EBX], DX 
            ROR EAX, 4       
            SUB EBX, 2       
        LOOP PRINT_SYMBOL

        RET
    PRINT_EAX ENDP

    CODE32_SIZE = $-PM_START
CODE32 ENDS

CODE16 SEGMENT PARA PUBLIC 'CODE' USE16
ASSUME CS:CODE16, DS:DATA32, SS: STACK32
START:
    MOV AX, DATA32
    MOV DS, AX

    MOV AH, 09H
    LEA DX, RM_MSG
    INT 21H

    XOR DX, DX
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H

    MOV AH, 09H
    LEA DX, PM_MSG_WAIT
    INT 21H
    XOR DX, DX
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H

    ; Ожидание нажатия.
    MOV AH, 10H
    INT 16H
    
    ; Очистка экрана.
    MOV AX, 3
    INT 10H

    XOR EAX, EAX

    MOV AX, CODE16
    SHL EAX, 4                        
    MOV WORD PTR GDT_CODE16.BASE_L, AX  
    SHR EAX, 16                       
    MOV BYTE PTR GDT_CODE16.BASE_M, AL  
    MOV BYTE PTR GDT_CODE16.BASE_H, AH  

    MOV AX, CODE32
    SHL EAX, 4                        
    MOV WORD PTR GDT_CODE32.BASE_L, AX  
    SHR EAX, 16                       
    MOV BYTE PTR GDT_CODE32.BASE_M, AL  
    MOV BYTE PTR GDT_CODE32.BASE_H, AH  

    MOV AX, DATA32
    SHL EAX, 4                        
    MOV WORD PTR GDT_DATA32.BASE_L, AX  
    SHR EAX, 16                       
    MOV BYTE PTR GDT_DATA32.BASE_M, AL  
    MOV BYTE PTR GDT_DATA32.BASE_H, AH  

    MOV AX, STACK32
    SHL EAX, 4                        
    MOV WORD PTR GDT_STACK32.BASE_L, AX  
    SHR EAX, 16                       
    MOV BYTE PTR GDT_STACK32.BASE_M, AL  
    MOV BYTE PTR GDT_STACK32.BASE_H, AH  

    MOV AX, DATA32
    SHL EAX, 4
    ADD EAX, OFFSET GDT_NULL

    MOV DWORD PTR PDESCR+2, EAX
    MOV WORD PTR  PDESCR, GDT_SIZE-1  
    LGDT FWORD PTR PDESCR             

    LEA EAX, ES:EXCEPT_1
    MOV INTDESCR_0_12.OFFS_L, AX 
    SHR EAX, 16             
    MOV INTDESCR_0_12.OFFS_H, AX 

    LEA EAX, ES:EXCEPT_13
    MOV INTDESCR_13.OFFS_L, AX 
    SHR EAX, 16             
    MOV INTDESCR_13.OFFS_H, AX 

    LEA EAX, ES:EXCEPT_1
    MOV INTDESCR_14_31.OFFS_L, AX 
    SHR EAX, 16             
    MOV INTDESCR_14_31.OFFS_H, AX 

    LEA EAX, ES:NEW_INT08
    MOV INT08.OFFS_L, AX
    SHR EAX, 16
    MOV INT08.OFFS_H, AX

    LEA EAX, ES:NEW_INT09
    MOV INT09.OFFS_L, AX 
    SHR EAX, 16             
    MOV INT09.OFFS_H, AX 

    MOV AX, DATA32
    SHL EAX, 4
    ADD EAX, OFFSET IDT

    MOV  DWORD PTR IPDESCR + 2, EAX 
    MOV  WORD PTR  IPDESCR, IDT_SIZE-1 
    
    ; Сохранение масок.
    IN  AL, 21H                     
    MOV MASK_MASTER, AL             
    IN  AL, 0A1H                    
    MOV MASK_SLAVE, AL
    
    ; Перепрограммирование ведущего контроллера.
    MOV AL, 11H
    OUT 20H, AL                     
    MOV AL, 32
    OUT 21H, AL                     
    MOV AL, 4
    OUT 21H, AL
    MOV AL, 1
    OUT 21H, AL

    ; Маска для ведущего контроллера.
    MOV AL, 0FCH
    OUT 21H, AL

    ; Маска для ведомого контроллера (запрет прерываний).
    MOV AL, 0FFH
    OUT 0A1H, AL
    
    LIDT FWORD PTR IPDESCR                                    
    
    ; Открытие линии А20.
    IN  AL, 92H
    OR  AL, 2
    OUT 92H, AL

    CLI

    MOV EAX, CR0
    OR EAX, 1     
    MOV CR0, EAX

    DB  66H 
    DB  0EAH
    DD  OFFSET PM_START
    DW  CODE32S

RETURN_RM:
    MOV EAX, CR0
    AND AL, 0FEH                
    MOV CR0, EAX
    
    DB  0EAH    
    DW  OFFSET GO
    DW  CODE16

GO:
    MOV AX, DATA32   
    MOV DS, AX
    MOV AX, CODE32
    MOV ES, AX
    MOV AX, STACK32   
    MOV SS, AX
    MOV AX, STACK_SIZE
    MOV SP, AX
    
    MOV AL, 11H
    OUT 20H, AL
    MOV AL, 8
    OUT 21H, AL
    MOV AL, 4
    OUT 21H, AL
    MOV AL, 1
    OUT 21H, AL

    MOV AL, MASK_MASTER
    OUT 21H, AL
    MOV AL, MASK_SLAVE
    OUT 0A1H, AL

    LIDT    FWORD PTR IPDESCR16

    ; A20
    IN  AL, 70H 
    AND AL, 7FH
    OUT 70H, AL

    STI     
    
    ; Очистка экрана.
    MOV AX, 3
    INT 10H

    MOV AH, 09H
    LEA DX, PM_MSG_OUT
    INT 21H
    XOR DX, DX
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H

    MOV AX, 4C00H
    INT 21H

    CODE16_SIZE = $-START  
CODE16 ENDS

END START