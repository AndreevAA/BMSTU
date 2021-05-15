section .text       ;куда попадет программа
global asm_strncpy

asm_strncpy:
    ; Помещаю количество копируемых
    mov rcx, rdx

    ; Стандартное копирование: куда <= что
    cmp rdi, rsi
    jle copy           

    ; Вычисляю разницу адресов
    mov rax, rdi
    sub rax, rsi    ; В rax помещаю разницу адресов при вычитании значения rsi и rax    

    ; Проверка на наслоение при куда > что - вычисляем разницу адресов
    cmp rax, rcx        ; Сравниваю разницу адресов и количество копируемых
    jge copy            ; Разницу адресов >= количество копируемых - стандартное копирование

    ; Копирование при наслоении
    add rdi, rcx
    dec rdi             ; Двигаю на 1 влево для Что

    add rsi, rcx
    dec rsi             ; Двигаю на 1 вправо для Куда

    std             ; меняем флаг напраления на обрытный

copy:
    rep movsb       ; Копирую байт из DS:(E)SI в ES:(E)DI
    cld             ; восстанавливаем флаг направления

quit:
    ret
