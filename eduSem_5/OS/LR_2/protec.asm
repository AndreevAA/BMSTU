.386p
descr struc
	lim 	dw 0
	base_l 	dw 0
	base_m 	db 0
	attr_1	db 0
	attr_2	db 0
	base_h 	db 0
descr ends

int_descr struc
	offs_l 	dw 0
	sel		dw 0
	counter db 0
	attr	db 0
	offs_h 	dw 0
int_descr ends

; Protected mode
PM_seg	segment para public 'code' use32
	    ASSUME cs:PM_seg
  	GDT	label byte
  	gdt_null	descr <>
  	gdt_flatDS	descr <0FFFFh,		 	0,		0,	92h,11001111b,0> ;92h = 10010010b
  	gdt_16bitCS	descr <RM_seg_size-1,	0,		0,	98h,0		 ,0> ;98h = 10011010b
  	gdt_32bitCS	descr <PM_seg_size-1,	0,		0,	98h,01000000b,0>
  	gdt_32bitDS	descr <PM_seg_size-1,	0,		0,	92h,01000000b,0>
  	gdt_32bitSS	descr <stack_len-1,	 	0,		0,	92h,01000000b,0>
	gdt_32Video	descr <0FFFFh,			8000h,	0Bh,92H,01001111b,0>
  	gdt_size = $ - GDT
  	gdtr df 0

    SEL_flatDS	equ   8
    SEL_16bitCS	equ   16
    SEL_32bitCS	equ   24
    SEL_32bitDS	equ   32
    SEL_32bitSS	equ   40
	SEL_32Video equ   48

    IDT	label byte
    int_descr 13 dup 	(<0, SEL_32bitCS,0, 8Fh, 0>) ; 10001111,type - trap
	gen_exp int_descr    <0, SEL_32bitCS,0, 8Fh, 0>
	int_descr 18 dup 	(<0, SEL_32bitCS,0, 8Fh, 0>)
    int_timer int_descr  <0, SEL_32bitCS,0, 8Eh, 0>	 ; 10001110,type - interrupt
    int_key int_descr	 <0, SEL_32bitCS,0, 8Eh, 0>
    idt_size = $ - IDT
    idtr		df 0
    idtr_real 	dw 3FFh, 0, 0

    master		db 0
    slave		db 0

    escape		db 0
    time_save	dd 0

	msg1 db 'In Real Mode now. To move to Protected Mode press any key...$'
	msg2 db 'Back in Real Mode$'
	msg3 db 'Protected Mode$'

	ASCII_table	db 0, 0, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48 ; NullEsc1234567890
				db 45, 61, 0, 0									; -=,Backspace,Tab
				db 113, 119, 101, 114, 116, 121					; qwerty
				db 117, 105, 111, 112, 91, 93					; uiop[]
				db 0, 0 										; Enter,Ctrl
				db 97, 115, 100, 102, 103						; asdfg
				db 104, 106, 107, 108, 59, 39					; hjkl;'-symbol
				db 96, 0, 92									; `LShift,\'-screen
				db 122, 120, 99, 118, 98 						; zxcvb
				db 110, 109, 44, 46, 47							; nm,./
				db 0, 42, 0, 32									; RShift,*Alt,Space
				db 0											;CapsLock
				db 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0					;F1-F10
				db 0, 0, 0, 0, 0		; NumLock,ScrollLock,Home,UpArrow,PgUp
				db 45 					; -
				db 0, 0, 0  			; LeftArrow,CenterKey,RightArrow
				db 43 					; +
				db 0, 0, 0, 0, 0  		; End,DownArrow,PgDown,Ins,Del
	out_pos		dd 1E0h					; 80 * 2 * 3 -> 3 line in VideoMem
	line_curr	dd 1E0h
	char_cont   db 0
	; Bright color 4bit - 1
	font_col	db 00000010b ;white - 111b, black - 000b,blue - 001b, green - 010b,red - 100b

print_str macro str
	mov ah,9
	mov dx, str
	int 21h
endm

num_convert macro
	local number1
		cmp dl,10
		jl number1
		add dl,'A' - '0' - 10
	number1:
		add dl,'0'
endm

print_eax macro
	local cycle
		push ecx
		push dx
			
		mov ecx,8
		add esi,10
	cycle:
		mov dl,al
		and dl,0Fh
		mov dh,font_col
		num_convert
			
		mov es:[esi],dx
		ror eax,4
		dec esi
		dec esi
		loop cycle

		pop dx
		pop ecx
endm

PM_entry:
	mov	ax,SEL_32bitDS
	mov	ds,ax
	mov ax,SEL_32Video
	mov es,ax
	mov	ax,SEL_flatDS
	mov	gs,ax
	mov	ax,SEL_32bitSS
	mov	ebx,stack_len
	mov	ss,ax
	mov	esp,ebx

	sti
	call memory_counter
; Print that we are in Protected Mode
	mov esi,offset msg3
	xor edi,edi
	push ecx
	push dx
	mov dh,font_col
	or dh,00001000b
	mov ecx,14
cycle1:
	mov dl,ds:[esi]
	mov es:[edi],dx
	inc esi
	inc edi
	inc edi
	loop cycle1
	
	pop dx
	pop ecx
work:
	test escape, 1
	jz	work
return:
	cli
; Far jmp to RM_return (6 byte)
	db	0EAh
	dd	offset RM_return
	dw	SEL_16bitCS

; Timer interrupt
timer_int:
	push eax
	push ebp
	push ecx
	push dx
		
	mov  eax,time_save

	xor esi,esi
	mov esi,164
	print_eax

	inc eax
	mov time_save,eax

	pop dx
	pop ecx
	pop ebp

	mov	al,20h
	out	20h,al
	pop eax
	iretd

; Keyboard interrupt
keyboard_int:
	push eax
	push ebx
	push ebp
	push edx
	
	in	al,60h
	
	cmp	al,1Ch  ; Enter keycode
	jne	stay
	mov escape,1
	jmp quit
stay:
	cmp al,80h
	ja quit

; Delete cursor
	mov ebx,out_pos
	mov dx,0000h
	mov dh,font_col
	mov es:[ebx],dx
	
	cmp al,0Eh	; Backspace keycode
	jne print
	
	xor dx,dx
	mov dh,font_col
	dec ebx
	dec ebx
	
	cmp ebx,1E0h
	jl	border
	
	mov es:[ebx],dx
	mov out_pos,ebx	
	dec char_cont
	
	cmp char_cont,0
	jl backline
	
	jmp quit
border:
	mov out_pos,1E0h
	jmp quit
backline:
	mov ebx,line_curr
	sub ebx,160
	mov line_curr,ebx
	mov char_cont,80
	jmp quit
print:
	xor ah,ah
	mov bp,ax
	inc char_cont
	cmp char_cont,80
	jne continue
	mov char_cont,0
	add line_curr,160
continue:	
	mov dl,ASCII_table[ebp]
	mov dh, font_col
	mov ebx,out_pos
	mov es:[ebx],dx
	inc ebx
	inc ebx
	mov out_pos,ebx
quit:
	mov ebx,out_pos
	mov dl,60
	mov dh,10000000b ; 7 - sym flash, 6-4 - font color, 2-0 - sym color  
	or dh,font_col
	mov es:[ebx],dx

	in	al,61h  ; Output received
	or	al,80h
	out	61h,al

	mov	al,20h  ; End of Interrupt
	out	20h,al
	pop edx
	pop ebp
	pop ebx
	pop	eax
	iretd
	

; General defence exception handler 
new_gen_exp:
	pop EAX
	pop EAX
	mov ax, 0Dh
	iretd

; Compute available memory
memory_counter	proc
	push	ds
	mov	ax, SEL_flatDS	; 4GB limit
	mov	ds, ax
	mov	ebx, 100001h
	mov	dl,	10101010b
	mov	ecx, 0FFEFFFFEh	; 1MB off (BIOS,ROM area)
check:
	mov	dh, ds:[ebx]
	mov	ds:[ebx],dl
	cmp	ds:[ebx],dl
	jnz	mem_end
	mov	ds:[ebx],dh
	inc	ebx
	loop check
mem_end:
	pop	ds
	xor	edx, edx
	mov	eax, ebx
	mov	ebx, 100000h
	div	ebx	; To write in MB

	xor esi,esi
	mov esi,182;20
	print_eax
	ret
	memory_counter	endp
	PM_seg_size = $ - GDT
PM_seg	ENDS

SS_seg segment para stack 'stack'
	stack_start	db	100h dup(?)
	stack_len = $ - stack_start
SS_seg 	ENDS

; Real Mode
RM_seg	segment para public 'code' use16
	ASSUME cs:RM_seg, ds:PM_seg, ss:SS_seg
start:
	mov ax,PM_seg
	mov ds,ax

	mov ah, 09h
	mov edx, offset msg1
	int 21h

	push eax
	mov ah,10h
	int 16h
	pop eax
		
	mov	ax,3
	int	10h

; Shadow register setup
	;push PM_seg
	;pop ds

	xor	eax,eax
	mov	ax,RM_seg
	shl	eax,4
	mov	word ptr gdt_16bitCS.base_l,ax
	shr	eax,16
	mov	byte ptr gdt_16bitCS.base_m,al
	mov	ax,PM_seg
	shl	eax,4
	push eax
	push eax
	mov	word ptr GDT_32bitCS.base_l,ax
	mov	word ptr GDT_32bitSS.base_l,ax
	mov	word ptr GDT_32bitDS.base_l,ax
	shr	eax,16
	mov	byte ptr GDT_32bitCS.base_m,al
	mov	byte ptr GDT_32bitSS.base_m,al
	mov	byte ptr GDT_32bitDS.base_m,al

	pop eax
	add	eax,offset GDT
		
	mov	dword ptr gdtr + 2,eax
	mov word ptr gdtr, gdt_size - 1
		
	lgdt fword ptr gdtr
	pop	eax
	add	eax,offset IDT
	mov	dword ptr idtr + 2,eax
	mov word ptr idtr, idt_size - 1

	mov	eax, offset timer_int
	mov	int_timer.offs_l,ax
	shr	eax, 16
	mov	int_timer.offs_h,ax
	mov	eax, offset keyboard_int
	mov	int_key.offs_l,ax
	shr	eax, 16
	mov	int_key.offs_h,ax
	mov	eax, offset new_gen_exp
	mov	gen_exp.offs_l,ax
	shr	eax, 16
	mov	gen_exp.offs_h,ax
; Save masks
	in	al, 21h
	mov	master,al
	in	al, 0A1h
	mov	slave,al

	mov	al, 11h
	out	20h, al
	mov	AL, 20h
	out	21h, al
	mov	al, 4

	out	21h, al
	mov	al, 1
	out	21h, al
		
	mov	al, 0FCh
	out	21h, al
	mov	al, 0FFh
	out	0A1h, al

	lidt fword ptr idtr

; Enable A20 line
	in	al,92h
	or	al,2
	out	92h,al

; Clear Interrup Flag - no interrupts
	cli
; Turn off NMI
	in	al,70h
	or	al,80h
	out	70h,al
; Enter protected mode
	mov	eax,cr0
	or	al,1
	mov	cr0,eax
; Far jmp with operand modificator 
	db	66h
	db	0EAh
	dd	offset PM_entry
	dw	SEL_32bitCS

RM_return:
	mov	eax,cr0
	and	al,0FEh
	mov	cr0,eax
; Far jmp to "mov ax,PM_seg"
	db	0EAh
	dw	$ + 4
	dw	RM_seg

	mov	ax,PM_seg
	mov	ds,ax
	mov	es,ax
	mov	ax,SS_seg
	mov	bx,stack_len
	mov	ss,ax
	mov	sp,bx

; Return base vector
	mov	al, 11h
	out	20h, al
	mov	al, 8
	out	21h, al
	mov	al, 4
	out	21h, al
	mov	al, 1
	out	21h, al

; Return masks
	mov	al, master
	out	21h, al
	mov	al, slave
	out	0A1h, al

	lidt fword ptr idtr_real
; NMI on
	in	al,70h
	and	al,07FH
	out	70h,al
; Interrupts on
	sti
	mov	ax,3
	int	10h
	mov ah, 09h
	mov edx, offset msg2
	int 21h
; Disable A20 line
	in	al,92h
	or	al,2
	out	92h,al
; Exit in RM
	mov	ah,4Ch
	int	21h
RM_seg_size = $ - start
RM_seg	ENDS
END start