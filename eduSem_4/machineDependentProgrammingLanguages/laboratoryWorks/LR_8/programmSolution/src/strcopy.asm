global strcopy
section .text

strcopy:
    mov RCX, RDX
    cmp RSI, RDI
    jle STRAIGHT

    mov RAX, RDI
    sub RAX, RSI

STRAIGHT:
    mov RCX, RDX

    cmp RSI, RDI
    je exit
    jl not_equal

not_equal:
    cmp RSI, RDI
    jg simple_copy

    mov RAX, RDI
    sub RAX, RSI

    cmp RAX, RCX
    jge simple_copy

    add RDI, RCX
    add RSI, RCX
    dec RSI
    dec RDI

    std

simple_copy:
    rep movsb
    cld

    exit:
    ret
