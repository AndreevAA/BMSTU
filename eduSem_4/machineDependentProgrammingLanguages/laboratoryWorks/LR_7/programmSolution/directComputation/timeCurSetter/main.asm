.MODEL TINY
.186
;---------------------
CODES SEGMENT
    ASSUME CS:CODES, DS:CODES
    ORG 100H
;---------------------
MAIN:
    ; Инициализирую данные
    jmp initialize

    ; Указатель в строке
    cur db 0

    ; Инициализация максимальной скорости
    speed db 01fh

    ; Адрес старой функции
    OLD_8H dd ?

    ; Флаг того, что программа запускается первый раз
    FLAG db 0
;---------------------
MY_NEW_8H proc
    
    ; пушу флаги в стек для иммитирования прерывания
    pushf

    ; Отработка старого
    call cs:OLD_8H;

    ; Пушу все нужные регистры в стек
    push ax 
    push dx
    push ds
    push es

    ; Обращаюсь к таймеру биоса 
    mov ah, 02h
    int 1ah; Устанавливает адрес и пишет в dh текущую абс сек

    ; Сраниваю текущее время с тем временем, которое должно быть. Чтобы каждую секунду менялось.
    cmp dh, cur
    
    je end_loop
    mov cur, dh

    ; Использовал для того, чтобы изменить скорость "дубль ввода". Первые два байта номер команды, а потом само значение параметра.
    mov al, 0F3h
    out 60h, al

    ; Скорость непосредственно
    mov al, speed
    out 60h, al

    ; Уменьшая скорость 
    dec speed

    ; Что не достигла нуля, при нуле ресет
    test speed, 01fh

    ; Обновляю полностью в начало
    mov speed, 01fh

    ; Вовращаю регистры на место
    end_loop:
        pop es
        pop ds
        pop dx
        pop ax

    iret;

MY_NEW_8H endp
;---------------------
initialize:
    ; Считал адрес предыдущего прерывания
    mov AX, 3508h
    int 21h

    ; Сравниваю флаг с 0. Проверка на первый запуск. При первом запуске деинсталяция.
    cmp ES:FLAG, 0
    je uninstall

    ; Записи считанный адрес в переменную
    mov word ptr OLD_8H, BX
    mov word ptr OLD_8H + 2, ES

    ; Запись адреса в AX. Вместе предыдущего значения вставляю свое.
    mov AX, 2508h

    ; Добавляю смещение
    mov DX, offset MY_NEW_8H
    int 21h

    ; Добавляю смещение по установке
    mov DX, offset INSTALL_MSG
    mov AH, 9
    int 21h

    ; Добавляю смещение по инициализации
    mov DX, offset initialize

    int 27H
;---------------------
uninstall:
    ; Уменьшаю содержимое указателя стека
    push ES
    push DS

    ; Устанавливаю макс. скорость печати
    mov al, 0F3h
    out 60h, al
    mov al, 0
    out 60h, al

    ; Устанавливаю старый адрес функции таймера наместо
    mov DX, word ptr ES:OLD_8H
    MOV DS, word ptr ES:OLD_8H + 2
    mov AX, 2508h   
    int 21h

    ; Вовращаю адреса из стека
    pop DS
    pop ES

    ; Освобождаю распределительный блок памяти
    mov AH, 49h
    int 21h

    ; Делаю смещение 
    mov DX, offset UNINSTALL_MSG
    mov AH, 9h
    int 21h

    ; Завершение пирограммы
    mov AX, 4C00h
    int 21h

    INSTALL_MSG   DB 'Install custom breaking$'
    UNINSTALL_MSG DB 'Uninstall custom breaking$'
;---------------------
CODES ENDS
END MAIN
