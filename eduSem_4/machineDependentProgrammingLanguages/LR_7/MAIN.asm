.MODEL TINY
.186

CODES SEGMENT
    ASSUME CS:CODES, DS:CODES
    ORG 100H

MAIN:
    jmp init
    cur db 0
    speed db 01fh
    OLD_8H dd ?
    FLAG db 228

MY_NEW_8H proc
    pusha
    pushf
    push es
    push ds

    mov ah, 02h
    int 1ah

    cmp dh, cur
    mov cur, dh
    je end_loop

    mov al, 0F3h
    out 60h, al
    mov al, speed
    out 60h, al

    dec speed
    test speed, 01fh
    jz reset
    jmp end_loop

    reset:
        mov speed, 01fh

    end_loop:
        pop ds
        pop es

        popf
        popa

        jmp CS:OLD_8H

MY_NEW_8H endp

init:
    mov AX, 3508h
    int 21h

    cmp ES:FLAG, 228
    je uninstall

    mov word ptr OLD_8H, BX
    mov word ptr OLD_8H + 2, ES

    mov AX, 2508h

    mov DX, offset MY_NEW_8H
    int 21h

    mov DX, offset INSTALL_MSG
    mov AH, 9
    int 21h

    mov DX, offset init
    int 27H

uninstall:
    push ES
    push DS

    mov al, 0F3h
    out 60h, al
    mov al, 0
    out 60h, al

    mov DX, word ptr ES:OLD_8H
    MOV DS, word ptr ES:OLD_8H + 2
    mov AX, 2508h
    int 21h

    pop DS
    pop ES

    mov AH, 49h
    int 21h

    mov DX, offset UNINSTALL_MSG
    mov AH, 9h
    int 21h

    mov AX, 4C00h
    int 21h

    INSTALL_MSG   DB 'Install custom breaking$'
    UNINSTALL_MSG DB 'Uninstall custom breaking$'

CODES ENDS
END MAIN