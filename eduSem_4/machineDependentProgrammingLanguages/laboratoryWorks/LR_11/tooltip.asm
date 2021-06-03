; Name        : tooltip.asm
;
; Build       : aclocal && autoconf && automake --add-missing --foreign
;               mkdir build
;               cd build
;               ../configure
;               make
;
; Description : tooltip demo
;
; Source      : http://zetcode.com/gui/gtk2/firstprograms/

bits 64

[list -]
    %define   TRUE                  1
    %define   FALSE                 0
    %define   NULL                  0

    extern    gtk_init
    extern    gtk_window_new
    extern    gtk_window_set_title
    extern    gtk_window_set_default_size
    extern    gtk_container_set_border_width
    extern    gtk_button_new_with_label

    extern    gtk_spin_button_new_with_range
    extern    gtk_spin_button_set_digits
    extern    gtk_spin_button_get_value
    extern    gtk_spin_button_set_value

    extern    gtk_label_new
    extern    gtk_label_set_text

    extern    gtk_box_new
    extern    gtk_widget_set_tooltip_text

    extern    gtk_container_add
    extern    gtk_widget_show_all
    extern    gtk_main_quit
    extern    g_signal_connect_data
    extern    gtk_main
    extern    exit

    extern    g_strdup_printf
    extern    g_free

    extern printf
[list +]

section .rodata
    szTitle:         db  "Lab 11", 0
    szDestroy:       db  "destroy", 0
    szTooltip:       db  "Button Widget",0

    szFloatMask      db  "%.2f", 0
section .data
    window:         dq  0
    vbox:           dq  0
    a_spin:         dq  0
    b_spin:         dq  0
    button:
     .handle:  dq   0
     .label:   db   "Sum", 0

    signal:
     .clicked: db   "clicked", 0
    res_label:
     .handle         dq 0
     .default:       dq "0,00", 0
     .one:           dq "1", 0
     .two:           dq "2", 0

    str:             dq 0
section .text

global _start

button_clicked:
    push  rsi

    pxor        xmm0, xmm0
    pxor        xmm1, xmm1

    ; xor         rax, rax
    mov         rdi, qword[a_spin]
    call        gtk_spin_button_get_value
    movsd       xmm1, xmm0

    ; pxor        xmm0, xmm0
    mov         rdi, qword[b_spin]
    call        gtk_spin_button_get_value

    addsd       xmm0, xmm1

    movq        qword[rcx], xmm0
    mov         rsi, rcx
    mov         rax, 1
    mov         rdi, szFloatMask
    call        g_strdup_printf
    mov         [str],  rax

    mov         rdi, qword[res_label.handle]
    mov         rsi, [str]
    call        gtk_label_set_text

    mov         rdi, [str]
    call        g_free
    mov         qword[str], 0

    pop  rsi
    ret

_start:
    ;init gtk
    xor     rsi,rsi                         ;argv
    xor     rdi,rdi                         ;argc
    call    gtk_init
    ;the main window
    xor     rdi,rdi                         ;GTK_WINDOW_TOPLEVEL
    call    gtk_window_new
    mov     qword[window],rax
    ;set title
    mov     rdi,qword[window]
    mov     rsi,szTitle
    call    gtk_window_set_title
    ;set size
    mov     rdi,qword[window]
    mov     rsi,300                         ;width
    mov     rdx,200                         ;height
    call    gtk_window_set_default_size
    ;set border width
    mov     rdi,qword[window]
    mov     rsi,15                          ;borderwidth
    call    gtk_container_set_border_width

    mov     rdi, TRUE
    mov     rsi, 1
    call    gtk_box_new
    mov     qword[vbox], rax

    ;add the a_spin to the vbox container
    mov     rdi, __?float64?__(0.0)
    movq    XMM0, rdi
    mov     rsi, __?float64?__(1000.0)
    movq    XMM1, rsi
    mov     rdx, __?float64?__(1.0)
    movq    XMM2, rdx
    call    gtk_spin_button_new_with_range
    mov     qword[a_spin],rax

    mov     rdi, rax
    mov     rsi, 2
    movq    XMM0, rsi
    call    gtk_spin_button_set_digits

    mov     rdi,qword[vbox]
    mov     rsi,qword[a_spin]
    call    gtk_container_add

    ;add the b_spin to the vbox container
    mov     rdi, __?float64?__(0.0)
    movq    XMM0, rdi
    mov     rsi, __?float64?__(1000.0)
    movq    XMM1, rsi
    mov     rdx, __?float64?__(1.0)
    movq    XMM2, rdx
    call    gtk_spin_button_new_with_range
    mov     qword[b_spin],rax

    mov     rdi, rax
    mov     rsi, 2
    movq    XMM0, rsi
    call    gtk_spin_button_set_digits

    mov     rdi,qword[vbox]
    mov     rsi,qword[b_spin]
    call    gtk_container_add

    ;add the button to the vbox container
    mov     rdi,button.label
    call    gtk_button_new_with_label
    mov     qword[button],rax

    mov     rdi,qword[button]
    mov     rsi,szTooltip
    call    gtk_widget_set_tooltip_text

    mov     rdi,qword[vbox]
    mov     rsi,qword[button]
    call    gtk_container_add

    ;add the label to the vbox container
    call    gtk_label_new
    mov     qword[res_label.handle], rax

    mov     rdi,qword[res_label.handle]
    mov     rsi,res_label.default
    call    gtk_label_set_text

    mov     rdi,qword[vbox]
    mov     rsi,qword[res_label.handle]
    call    gtk_container_add

    ;add the vbox container to the window
    mov     rdi,qword[window]
    mov     rsi,qword[vbox]
    call    gtk_container_add


    ; signal for button
    xor       r9d, r9d
    xor       r8d, r8d
    mov       rcx, NULL
    mov       rdx, button_clicked
    mov       rsi, signal.clicked
    mov       rdi, qword[button.handle]
    call      g_signal_connect_data

    ;show window
    mov     rdi,qword[window]
    call    gtk_widget_show_all
    ;connect destroy signal to the window
    xor     r9d,r9d                      ;combination of GConnectFlags
    xor     r8d,r8d                      ;a GClosureNotify for data
    mov     rcx,qword[window]            ;pointer to window instance in RCX
    mov     rdx,gtk_main_quit            ;pointer to the handler
    mov     rsi,szDestroy                ;pointer to the signal
    mov     rdi,qword[window]            ;pointer to window instance in RDI
    call    g_signal_connect_data        ;the value in RAX is the handler, but we don't store it now
    ;go into application main loop
    call    gtk_main
    ;exit program
    xor     rdi, rdi
    call    exit
