section .text       ;куда попадет программа
global asm_strncpy

asm_strncpy:
    mov rcx, rdx
    cmp rdi, rsi
    jle copy            ;куда <= что - обычная копия

    mov rax, rdi
    sub rax, rsi        ; куда > что - вычисляем разницу адресов

    cmp rax, rcx
    jge copy            ; разница адресов >= количество копируемых - простое копирование

    ; иначе - копируем с конца
    add rdi, rcx
    dec rdi
    add rsi, rcx
    dec rsi
    std             ; меняем флаг напраления на обрытный

copy:
    rep movsb
    cld             ; восстанавливаем флаг направления

quit:
    ret
