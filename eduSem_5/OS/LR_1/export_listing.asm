		call	sub_4			; (07B9)
		push	es
		push	ds
		push	ax
		push	dx
		mov	ax,40h
		mov	ds,ax
		xor	ax,ax			; Zero register
		mov	es,ax
		inc	word ptr ds:[6Ch]	; (0040:006C=22A7h)
		jnz	loc_3			; Jump if not zero
		inc	word ptr ds:[6Eh]	; (0040:006E=16h)
loc_3:
		cmp	word ptr ds:[6Eh],18h	; (0040:006E=16h)
		jne	loc_4			; Jump if not equal
		cmp	word ptr ds:[6Ch],0B0h	; (0040:006C=22A7h)
		jne	loc_4			; Jump if not equal
		mov	word ptr ds:[6Eh],ax	; (0040:006E=16h)
		mov	word ptr ds:[6Ch],ax	; (0040:006C=22A7h)
		mov	byte ptr ds:[70h],1	; (0040:0070=0)
		or	al,8
loc_4:
		push	ax
		dec	byte ptr ds:[40h]	; (0040:0040=35h)
		jnz	loc_5			; Jump if not zero
		and	byte ptr ds:[3Fh],0F0h	; (0040:003F=0)
		mov	al,0Ch
		mov	dx,3F2h
		out	dx,al			; port 3F2h, dsk0 contrl output
loc_5:
		pop	ax
		test	word ptr ds:[314h],4	; (0040:0314=3200h)
		jnz	loc_6			; Jump if not zero
		lahf				; Load ah from flags
		xchg	ah,al
		push	ax
		call	dword ptr es:[70h]	; (0000:0070=6ADh)
		jmp	short loc_7		; (07A5)
		nop
loc_6:
		int	1Ch			; Timer break (call each 18.2ms)
loc_7:
		call	sub_4			; (07B9)
		mov	al,20h			; ' '
		out	20h,al			; port 20h, 8259-1 int command
						;  al = 20h, end of interrupt
		pop	dx
		pop	ax
		pop	ds
		pop	es
		jmp	$-164h
		db	0C4h
		les	cx,dword ptr ds:[93E9h]	; (0000:93E9=0E181h) Load 32 bit ptr
		db	0FEh
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_4		proc	near
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		lahf				; Load ah from flags
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_9			; Jump if not zero
           lock	and	word ptr ds:[314h],0FDFFh	; (0040:0314=3200h)
loc_8:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		jmp	short loc_10		; (07D8)
loc_9:
		cli				; Disable interrupts
		jmp	short loc_8		; (07D0)
loc_10:
		retn
sub_4		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_5		proc	near
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		lahf				; Load ah from flags
		test	word ptr ds:[314h],3	; (0040:0314=3200h)
		jnz	loc_12			; Jump if not zero
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_12			; Jump if not zero
           lock	or	word ptr ds:[314h],200h	; (0040:0314=3200h)
loc_11:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		jmp	short loc_13		; (0800)
loc_12:
		sti				; Enable interrupts
		jmp	short loc_11		; (07F8)
loc_13:
		retn
sub_5		endp
  
		add	[bx+si],al
		add	[bx+si],al
		add	byte ptr ds:[6FFh],ch	; (0000:06FF=6)
		add	al,8
		cmp	ax,13FFh
		jne	loc_16			; Jump if not equal
		cmp	cx,1
		je	loc_14			; Jump if equal
		push	si
		mov	si,0A4h
		sub	si,word ptr cs:[802h]	; (020C:0802=0)
		cmp	cx,si
		jae	loc_15			; Jump if above or =
		push	di
		push	cx
		push	dx
		push	ds
		push	es
		mov	dx,es
		mov	ds,dx
		mov	dx,0B000h
		mov	es,dx
		mov	dx,cx
		mov	si,di
		mov	di,word ptr cs:[802h]	; (020C:0802=0)
		cld				; Clear direction
		shr	cx,1			; Shift w/zeros fill
		rep	movsw			; Rep when cx >0 Mov [si] to es:[di]
		adc	cl,0
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
data_136	dw	1601h
		add	cl,[bx+si]
		pop	es
		pop	ds
		pop	dx
		pop	cx
		pop	di
		pop	si
		stc				; Set carry flag
		dec	word ptr cs:[804h]	; (020C:0804=0)
		retn
loc_14:
		push	ax
		mov	ah,0Eh
		mov	al,es:[di]
		call	sub_7			; (0870)
		pop	ax
		retn
loc_15:
		pop	si
		dec	word ptr cs:[804h]	; (020C:0804=0)
		db	0C4h
		les	ax,dword ptr [bp+si-7]	; Load 32 bit ptr
		retn
loc_16:
		cmp	ah,0Eh
		jne	loc_17			; Jump if not equal
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_7		proc	near
		push	si
		mov	si,word ptr cs:[802h]	; (020C:0802=0)
		cmp	si,0A4h
		jae	loc_15			; Jump if above or =
		push	ds
		mov	si,0B000h
		mov	ds,si
		mov	si,word ptr cs:[802h]	; (020C:0802=0)
		mov	[si],al
		inc	si
		mov	word ptr cs:[802h],si	; (020C:0802=0)
		pop	ds
		pop	si
		stc				; Set carry flag
		dec	word ptr cs:[804h]	; (020C:0804=0)
		retn
sub_7		endp
  
loc_17:
		push	ax
		mov	ax,13FEh
		db	0C4h
		les	ax,dword ptr [bp+si+58h]	; Load 32 bit ptr
		clc				; Clear carry flag
		dec	word ptr cs:[804h]	; (020C:0804=0)
		retn
data_137	db	0
data_138	db	0
		cmp	cs:data_137,2		; (020C:08A7=0)
		jne	loc_18			; Jump if not equal
;*		call	sub_6			;*(0806)
		db	0E8h, 52h,0FFh
		jc	loc_24			; Jump if carry Set
loc_18:
		cmp	cs:data_137,1		; (020C:08A7=0)
		je	loc_26			; Jump if equal
		cmp	ah,0
		je	loc_22			; Jump if equal
		cmp	ah,1Ch
		ja	loc_19			; Jump if above
		cmp	ah,4
		je	loc_21			; Jump if equal
		db	0C4h
		les	ax,dword ptr [bp+si-15h]	; Load 32 bit ptr
		inc	bx
		nop
loc_19:
		cmp	ah,4Fh			; 'O'
		jne	loc_20			; Jump if not equal
		db	0C4h
		les	di,dword ptr [bp+73EBh]	; Load 32 bit ptr
		nop
loc_20:
		cmp	ah,0F0h
		jb	loc_25			; Jump if below
		cmp	ah,0F7h
		jbe	loc_21			; Jump if below or =
		cmp	ah,0FAh
		jne	loc_25			; Jump if not equal
loc_21:
		db	0C4h
		les	di,dword ptr [bp+23EBh]	; Load 32 bit ptr
		nop
loc_22:
		mov	cs:data_138,1		; (020C:08A8=0)
		db	0C4h
		les	di,dword ptr [bp-6F70h]	; Load 32 bit ptr
		push	ax
		and	ax,7Fh
		cmp	al,3
		jbe	loc_23			; Jump if below or =
		cmp	al,7
		je	loc_23			; Jump if equal
		pop	ax
		jmp	short loc_26		; (091B)
		nop
loc_23:
		pop	ax
		mov	cs:data_138,0		; (020C:08A8=0)
loc_24:
		jmp	$-2C9h
loc_25:
		stc				; Set carry flag
		jmp	short loc_24		; (0915)
loc_26:
		mov	cs:data_138,0		; (020C:08A8=0)
		cmp	ax,13FFh
		je	loc_30			; Jump if equal
		cmp	ah,0F0h
		jb	loc_27			; Jump if below
		cmp	ah,0F7h
		jbe	loc_21			; Jump if below or =
		cmp	ah,0FAh
		je	loc_21			; Jump if equal
		jmp	short loc_29		; (0950)
		nop
loc_27:
		cmp	ah,4
		je	loc_21			; Jump if equal
		cmp	ah,0
		jne	loc_28			; Jump if not equal
		db	0C4h
		les	di,dword ptr [bp+9EBh]	; Load 32 bit ptr
		nop
loc_28:
		cmp	ah,11h
		jne	loc_29			; Jump if not equal
		db	0C4h
		les	di,dword ptr [bp+10EAh]	; Load 32 bit ptr
		add	[bx+si],ax
		db	0C0h
loc_30:
		push	si
		push	di
		push	bp
  
locloop_31:
		mov	dx,46h
		push	dx
		push	cs
		mov	bx,96Ch
		push	bx
		mov	bx,7
		mov	ah,0Eh
		mov	al,es:[di]
		inc	di
;*		jmp	short loc_29		;*(0950)
		db	0EBh,0E4h
		loop	locloop_31		; Loop if cx > 0
  
		pop	bp
		pop	di
		pop	si
		mov	ax,1
loc_32:
		jmp	short loc_24		; (0915)
		cmp	cs:data_137,2		; (020C:08A7=0)
		jne	loc_33			; Jump if not equal
;*		call	sub_6			;*(0806)
		db	0E8h, 85h,0FEh
		jc	loc_32			; Jump if carry Set
loc_33:
		cmp	cs:data_137,1		; (020C:08A7=0)
		je	loc_34			; Jump if equal
		db	0C4h
		les	dx,dword ptr [bx+si]	; Load 32 bit ptr
		jmp	$-342h
loc_34:
		cmp	ah,13h
		jne	loc_35			; Jump if not equal
		cmp	al,0FFh
		je	loc_30			; Jump if equal
loc_35:
;*		jmp	far ptr loc_2772	;*(F000:FF53)
		db	0EAh, 53h,0FFh, 00h,0F0h
		int	10h			; Video display   ah=functn 00h
						;  set display mode in al
		db	0C4h
		db	0C4h
		inc	ah
		les	dx,dword ptr [bx+di]	; Load 32 bit ptr
		jmp	$-35Bh
		db	0C4h
		les	dx,dword ptr [bp+si]	; Load 32 bit ptr
		jmp	$-361h
		db	0C4h
		les	dx,dword ptr [si]	; Load 32 bit ptr
		jmp	$-367h
		xchg	bx,bx
data_140	dw	0
		add	[bx+si],al
data_141	dw	65FEh
		add	[bx+si],al
data_142	dw	32h
		add	[bx+si],al
		push	ds
		push	bx
		mov	bx,40h
		mov	ds,bx
		cmp	ah,10h
		call	sub_4			; (07B9)
		jc	locloop_36		; Jump if carry Set
		jmp	$+0E3h
  
locloop_36:
		or	ah,ah			; Zero ?
		jz	loc_41			; Jump if zero
		dec	ah
		jz	loc_45			; Jump if zero
		dec	ah
		jz	loc_38			; Jump if zero
		dec	ah
		jz	loc_37			; Jump if zero
		dec	ah
		jz	loc_37			; Jump if zero
		dec	ah
		jz	loc_39			; Jump if zero
loc_37:
		pop	bx
		pop	ds
		jmp	$-3A4h
loc_38:
		mov	al,byte ptr data_67+1	; (020C:0017=0)
		jmp	short loc_37		; (09EE)
loc_39:
		push	si
		mov	bx,word ptr data_70+2	; (020C:001C=148Fh)
		mov	si,bx
		call	sub_12			; (0BBB)
		cmp	bx,word ptr ds:[1Ah]	; (020C:001A=0AE9Ch)
		je	loc_40			; Jump if equal
		mov	[si],cx
		mov	word ptr data_70+2,bx	; (020C:001C=148Fh)
		mov	al,0
		pop	si
		jmp	short loc_37		; (09EE)
loc_40:
		mov	al,1
		pop	si
		jmp	short loc_37		; (09EE)
loc_41:
		mov	bx,word ptr ds:[1Ah]	; (020C:001A=0AE9Ch)
		cmp	bx,word ptr data_70+2	; (020C:001C=148Fh)
		jne	loc_43			; Jump if not equal
		call	sub_5			; (07D9)
		mov	ax,9002h
		int	15h			; General services, ah=func 90h
						;  device busy, al=type
loc_42:
		call	sub_4			; (07B9)
		mov	bx,word ptr ds:[1Ah]	; (020C:001A=0AE9Ch)
		cmp	bx,word ptr data_70+2	; (020C:001C=148Fh)
loc_43:
		call	sub_13			; (0BC8)
		jnz	loc_44			; Jump if not zero
		call	sub_8			; (0B20)
		jmp	short loc_42		; (0A2A)
loc_44:
		mov	ax,[bx]
		call	sub_12			; (0BBB)
		mov	word ptr ds:[1Ah],bx	; (020C:001A=0AE9Ch)
		call	sub_11			; (0B74)
		jc	loc_42			; Jump if carry Set
		call	sub_9			; (0B4C)
		jmp	short loc_37		; (09EE)
loc_45:
		mov	bx,word ptr ds:[1Ah]	; (020C:001A=0AE9Ch)
		cmp	bx,word ptr data_70+2	; (020C:001C=148Fh)
		mov	ax,[bx]
		call	sub_13			; (0BC8)
		jz	loc_47			; Jump if zero
		call	sub_9			; (0B4C)
		call	sub_11			; (0B74)
		call	sub_5			; (07D9)
		jnc	loc_49			; Jump if carry=0
		call	sub_12			; (0BBB)
		mov	word ptr ds:[1Ah],bx	; (020C:001A=0AE9Ch)
		jmp	short loc_45		; (0A52)
loc_46:
		mov	bx,word ptr ds:[1Ah]	; (020C:001A=0AE9Ch)
		cmp	bx,word ptr data_70+2	; (020C:001C=148Fh)
		mov	ax,[bx]
		call	sub_13			; (0BC8)
		jz	loc_47			; Jump if zero
		call	sub_9			; (0B4C)
		call	sub_10			; (0B5B)
		call	sub_5			; (07D9)
		jmp	short loc_49		; (0AB1)
		nop
loc_47:
		call	sub_5			; (07D9)
		push	ax
		lahf				; Load ah from flags
		push	ax
		mov	ax,cs:data_140		; (020C:09B8=0)
		cmp	ax,cs:data_142		; (020C:09C0=32h)
		jb	loc_48			; Jump if below
		mov	ah,1
		db	0C4h
		les	dx,dword ptr ds:[6EBh]	; (020C:06EB=52D2h) Load 32 bit ptr
		nop
loc_48:
		inc	cs:data_141		; (020C:09BC=66C4h)
		pop	ax
		sahf				; Store ah into flags
		pop	ax
loc_49:
		pop	bx
		pop	ds
		retf	2
		sub	ah,10h
		jz	loc_51			; Jump if zero
		dec	ah
		jz	loc_46			; Jump if zero
		dec	ah
		jz	loc_50			; Jump if zero
		jmp	loc_37			; (09EE)
loc_50:
		mov	al,byte ptr data_67+2	; (020C:0018=0)
		mov	ah,al
		and	al,4
		push	cx
		mov	cl,5
		shl	al,cl			; Shift w/zeros fill
		pop	cx
		and	ah,73h			; 's'
		or	al,ah
		mov	ah,byte ptr ds:[96h]	; (020C:0096=0)
		and	ah,0Ch
		or	ah,al
		mov	al,byte ptr data_67+1	; (020C:0017=0)
		jmp	loc_37			; (09EE)
loc_51:
		mov	bx,word ptr ds:[1Ah]	; (020C:001A=0AE9Ch)
		cmp	bx,word ptr data_70+2	; (020C:001C=148Fh)
		jne	loc_53			; Jump if not equal
		call	sub_5			; (07D9)
		mov	ax,9002h
		int	15h			; General services, ah=func 90h
						;  device busy, al=type
loc_52:
		call	sub_4			; (07B9)
		mov	bx,word ptr ds:[1Ah]	; (020C:001A=0AE9Ch)
		cmp	bx,word ptr data_70+2	; (020C:001C=148Fh)
loc_53:
		call	sub_13			; (0BC8)
		jnz	loc_54			; Jump if not zero
		call	sub_8			; (0B20)
		jmp	short loc_52		; (0AF9)
loc_54:
		mov	ax,[bx]
		call	sub_12			; (0BBB)
		mov	word ptr ds:[1Ah],bx	; (020C:001A=0AE9Ch)
		call	sub_10			; (0B5B)
		call	sub_9			; (0B4C)
		jmp	loc_37			; (09EE)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_8		proc	near
		push	ax
		call	sub_5			; (07D9)
		mov	ah,2
		db	0C4h
		les	dx,dword ptr ds:[1E8Bh]	; (020C:1E8B=0) Load 32 bit ptr
		sbb	al,[bx+si]
		cmp	bx,word ptr data_70+2	; (020C:001C=148Fh)
		jne	loc_57			; Jump if not equal
		mov	ax,cs:data_140		; (020C:09B8=0)
		cmp	ax,cs:data_142		; (020C:09C0=32h)
		jae	loc_56			; Jump if above or =
		inc	cs:data_141		; (020C:09BC=673Eh)
;*		jmp	short loc_55		;*(0B29)
		db	0EBh,0E4h
loc_56:
		mov	ah,1
		db	0C4h
		les	dx,dword ptr ds:[0C358h]	; (020C:C358=585Bh) Load 32 bit ptr
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_9:
		mov	cs:data_140,0		; (020C:09B8=0)
		mov	cs:data_141,0		; (020C:09BC=674Eh)
		retn
sub_8		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_10		proc	near
		push	bx
		push	ax
		lahf				; Load ah from flags
		mov	bx,ax
		pop	ax
		push	bx
		cmp	al,0F0h
		jne	loc_58			; Jump if not equal
		or	ah,ah			; Zero ?
		jz	loc_58			; Jump if zero
		xor	al,al			; Zero register
loc_58:
		mov	bx,ax
		pop	ax
		sahf				; Store ah into flags
		mov	ax,bx
		pop	bx
		retn
sub_10		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_11		proc	near
		push	bx
		push	ax
		lahf				; Load ah from flags
		mov	bx,ax
		pop	ax
		push	bx
		cmp	ah,0E0h
		jne	loc_59			; Jump if not equal
		mov	ah,1Ch
		cmp	al,0Dh
		je	loc_61			; Jump if equal
		cmp	al,0Ah
		je	loc_61			; Jump if equal
		mov	ah,35h			; '5'
		jmp	short loc_61		; (0BA9)
		nop
loc_59:
		cmp	ah,84h
		ja	loc_62			; Jump if above
		cmp	al,0F0h
		jne	loc_60			; Jump if not equal
		or	ah,ah			; Zero ?
		jz	loc_61			; Jump if zero
		jmp	short loc_62		; (0BB2)
		nop
loc_60:
		cmp	al,0E0h
		jne	loc_61			; Jump if not equal
		or	ah,ah			; Zero ?
		jz	loc_61			; Jump if zero
		xor	al,al			; Zero register
loc_61:
		mov	bx,ax
		pop	ax
		sahf				; Store ah into flags
		mov	ax,bx
		pop	bx
		clc				; Clear carry flag
		retn
loc_62:
		mov	bx,ax
		pop	ax
		sahf				; Store ah into flags
		mov	ax,bx
		pop	bx
		stc				; Set carry flag
		retn
sub_11		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_12		proc	near
		inc	bx
		inc	bx
		cmp	bx,word ptr ds:[82h]	; (020C:0082=10h)
		jne	loc_63			; Jump if not equal
		mov	bx,word ptr ds:[80h]	; (020C:0080=1850h)
loc_63:
		retn
sub_12		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_13		proc	near
		push	bx
		push	cx
		push	ax
		lahf				; Load ah from flags
		push	ax
		mov	al,byte ptr data_67+1	; (020C:0017=0)
		and	al,70h			; 'p'
		mov	cl,4
		shr	al,cl			; Shift w/zeros fill
		and	al,7
		mov	bl,byte ptr ds:[97h]	; (020C:0097=0)
		xor	bl,al
		and	bl,7
		jz	loc_64			; Jump if zero
		test	byte ptr ds:[97h],40h	; (020C:0097=0) '@'
		jnz	loc_64			; Jump if not zero
		or	byte ptr ds:[97h],40h	; (020C:0097=0) '@'
		shl	bl,cl			; Shift w/zeros fill
		or	al,bl
		mov	ah,3
		db	0C4h
		les	dx,dword ptr ds:[2680h]	; (020C:2680=6572h) Load 32 bit ptr
		xchg	ax,di
		add	al,bh
		and	al,0Fh
		or	byte ptr ds:[97h],al	; (020C:0097=0)
		and	byte ptr ds:[97h],0BFh	; (020C:0097=0)
loc_64:
		pop	ax
		sahf				; Store ah into flags
		pop	ax
		pop	cx
data_145	db	5Bh			; Data table (indexed access)
		retn
sub_13		endp
  
		db	0C4h
		les	bx,dword ptr [bx+si]	; Load 32 bit ptr
		jmp	$-5C5h
		db	0C4h
		les	bx,dword ptr [bx+di]	; Load 32 bit ptr
		jmp	$-5CBh
data_146	dw	22A7h
data_147	dw	16h
data_148	db	0
		call	sub_5			; (07D9)
		cmp	ah,2
		jb	loc_65			; Jump if below
		db	0C4h
		les	bx,dword ptr [bp+si]	; Load 32 bit ptr
		jmp	$-5DEh
loc_65:
		push	ds
		push	bx
		push	ax
		mov	ax,40h
		mov	ds,ax
		pop	ax
		call	sub_4			; (07B9)
		or	ah,ah			; Zero ?
		jnz	loc_68			; Jump if not zero
loc_66:
		mov	al,byte ptr ds:[70h]	; (0040:0070=0)
		mov	cx,word ptr ds:[6Eh]	; (0040:006E=16h)
		mov	dx,word ptr ds:[6Ch]	; (0040:006C=22A8h)
		cmp	cs:data_147,cx		; (020C:0C1C=16h)
		jne	loc_69			; Jump if not equal
		mov	bx,cs:data_146		; (020C:0C1A=22A7h)
		cmp	bx,dx
		je	loc_67			; Jump if equal
		inc	bx
		cmp	bx,dx
		jne	loc_69			; Jump if not equal
loc_67:
		inc	cs:data_148		; (020C:0C1E=0)
		cmp	cs:data_148,10h		; (020C:0C1E=0)
		jb	loc_70			; Jump if below
		call	sub_5			; (07D9)
		xor	ax,ax			; Zero register
		dec	cs:data_146		; (020C:0C1A=22A7h)
		db	0C4h
		les	bx,dword ptr [bp+si-18h]	; Load 32 bit ptr
		aas				; Ascii adjust
		sti				; Enable interrupts
		jmp	short loc_66		; (0C3D)
loc_68:
		mov	word ptr ds:[6Ch],dx	; (0040:006C=22A8h)
		mov	word ptr ds:[6Eh],cx	; (0040:006E=16h)
loc_69:
		mov	cs:data_148,0		; (020C:0C1E=0)
loc_70:
		mov	cs:data_146,dx		; (020C:0C1A=22A7h)
		mov	cs:data_147,cx		; (020C:0C1C=16h)
		mov	byte ptr ds:[70h],0	; (0040:0070=0)
		pop	bx
		pop	ds
		jmp	$-64Fh
		db	0C4h
		les	bx,data_626		; (020C:A8E9=453Ah) Load 32 bit ptr
		stc				; Set carry flag
		db	0C4h
		les	si,dword ptr [bx+si-17h]	; Load 32 bit ptr
		mov	data_677,al		; (020C:E8F9=92h)
		sub	al,0FBh
		int	4Ah			; RTC Alarm occurred
		jmp	short $+3		; delay for I/O
		nop
		jmp	short $+3		; delay for I/O
		nop
		jmp	short $+3		; delay for I/O
		nop
		call	sub_4			; (07B9)
		db	0C4h
		db	0C4h
		inc	ah
		les	si,dword ptr [bx+di-33h]	; Load 32 bit ptr
		or	ch,cl
		xchg	bh,cl
		db	0C4h
loc_71:
		les	si,dword ptr [di-33h]	; Load 32 bit ptr
		add	ch,cl
		jle	loc_71			; Jump if < or =
		call	sub_5			; (07D9)
		jmp	short $+2		; delay for I/O
		jmp	short $+2		; delay for I/O
		jmp	short $+2		; delay for I/O
		db	0C4h
		db	0C4h
		db	0FEh
		xor	si,si			; Zero register
		mov	ds,si
		mov	ax,4400h
		esc	3,[bp+si]		; coprocessor escape
		dec	si
		add	[bp+di],cl
		esc	3,[bx]			; coprocessor escape
		dec	ax
		dec	cx
		dec	bp
		inc	bp
		dec	bp
		and	[bx+si],ah
		and	[si],ah
		add	[bx+si+0],dh
		add	[bx+si+41h],ah
		nop				;*ASM fixup - displacement
		dec	sp
		add	[bx+si+4Dh],bl
		push	bx
		pop	ax
		pop	ax
		pop	ax
		pop	ax
		xor	dh,bl
		add	al,74h			; 't'
		add	[bp+si-4FCh],al
		lea	dx,[si+0]		; Load effective addr
		add	[bx+si],al
		inc	dx
		add	ax,20Ch
		movsb				; Mov [si] to es:[di]
		adc	byte ptr ds:[100h][bx],ah	; (0000:0100=8Ah)
		add	[bx+di],ax
		add	[bx+si],ax
		add	[bx+si],ax
		add	[bx+si],ax
		add	[bx+si],ax
		db	10 dup (0)
		add	al,[bx+di]
		add	[bx+si],al
		add	[bx+si],al
		mov	word ptr cs:[16h],bx	; (020C:0016=0)
		mov	word ptr cs:data_67+2,es	; (020C:0018=0)
		retf
		push	bx
		push	ds
		lds	bx,dword ptr cs:[16h]	; (020C:0016=0) Load 32 bit ptr
		cmp	byte ptr [bx+2],10h
		mov	word ptr [bx+3],100h
		jbe	loc_72			; Jump if below or =
		or	word ptr [bx+3],8003h
loc_72:
		pop	ds
		pop	bx
		retf
		call	sub_22			; (1134)
		cmp	ah,43h			; 'C'
		jne	loc_74			; Jump if not equal
		or	al,al			; Zero ?
		jnz	loc_73			; Jump if not zero
		mov	al,80h
		jmp	loc_125			; (115C)
loc_73:
		cmp	al,10h
		jne	loc_74			; Jump if not equal
		push	cs
		pop	es
		mov	bx,0AFh
		jmp	loc_125			; (115C)
loc_74:
		call	sub_21			; (1114)
		jmp	dword ptr cs:[22h]	; (020C:0022=0FFh)
		adc	ah,byte ptr ds:[265h][bx+si]	; (020C:0265=0)
		cbw				; Convrt byte to word
		add	dh,[bp+si-2BFEh]
		add	dh,dh
		add	dh,[bx+si]
		add	bx,data_337[bx+di]	; (020C:2B03=8D1Eh)
		mov	al,data_592		; (020C:A03C=3Bh)
		xchg	ax,sp
		mov	al,data_604		; (020C:A264=0Ah)
		iret				; Interrupt return
		mov	al,data_596		; (020C:A0FF=2Ah)
		and	sp,data_597[bx+di]	; (020C:A159=0F906h)
		adc	[bp+si-5DEAh],sp
		jmp	short loc_75		; (0DA4)
		nop
		nop
		nop
loc_75:
		push	cx
		push	si
		push	di
		push	ds
		push	es
		pushf				; Push flags
		cld				; Clear direction
		push	ds
		pop	es
		push	cs
		pop	ds
		push	ax
		or	ah,ah			; Zero ?
		jz	loc_78			; Jump if zero
		cmp	ah,12h
		jb	loc_76			; Jump if below
		pop	ax
		xor	ax,ax			; Zero register
		mov	bl,80h
		jmp	short loc_82		; (0E32)
loc_76:
		pushf				; Push flags
		call	sub_21			; (1114)
		cmp	word ptr data_72+2,0	; (020C:0020=0A3B9h)
		jne	loc_77			; Jump if not equal
		push	dx
		call	sub_15			; (0E45)
		pop	dx
loc_77:
		push	cs
		call	word ptr ds:[14h]	; (020C:0014=0E0Dh)
		cmp	byte ptr ds:[2Ch],0	; (020C:002C=39h)
		je	loc_78			; Jump if equal
		pop	ax
		xor	ax,ax			; Zero register
		mov	bl,81h
		xor	dx,dx			; Zero register
data_150	db	0EBh
		dec	bp
loc_78:
		pop	ax
		push	ax
		mov	al,ah
		xor	ah,ah			; Zero register
		shl	ax,1			; Shift w/zeros fill
		mov	di,ax
		pop	ax
		mov	di,word ptr ds:[8Bh][di]	; (020C:008B=504Fh)
		or	di,di			; Zero ?
		jns	loc_81			; Jump if not sign
		cmp	byte ptr ds:[2Bh],0	; (020C:002B=38h)
		je	loc_79			; Jump if equal
		push	si
		push	di
		push	ax
		push	bx
		push	cx
		call	sub_17			; (0FE6)
		cmp	ax,1
		pop	cx
		pop	bx
		pop	ax
		pop	di
		pop	si
		jnz	loc_80			; Jump if not zero
loc_79:
		push	cs
		call	sub_14			; (0E3F)
		cmp	byte ptr ds:[2Bh],0	; (020C:002B=38h)
		je	loc_82			; Jump if equal
		push	ax
		push	bx
		call	sub_18			; (1020)
		cmp	ax,1
		pop	bx
		pop	ax
		jz	loc_82			; Jump if zero
loc_80:
		xor	ax,ax			; Zero register
		xor	dx,dx			; Zero register
		mov	bl,82h
		jmp	short loc_82		; (0E32)
loc_81:
		call	di			;*
loc_82:
		push	cs
		call	word ptr ds:[14h]	; (020C:0014=0E0Dh)
		pop	es
		pop	ds
		pop	di
		pop	si
		pop	cx
		retf				; Return far
		db	6Eh
		sti				; Enable interrupts
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_14		proc	near
		push	word ptr ds:[14Dh]	; (020C:014D=5582h)
		push	di
		retf				; Return far
sub_14		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_15		proc	near
		push	es
		call	sub_16			; (0EBA)
		cmp	byte ptr ds:[2Ch],0	; (020C:002C=39h)
		je	loc_83			; Jump if equal
		pop	es
		retn
loc_83:
		mov	ax,20Dh
		db	0C4h
		les	dx,dword ptr [bp+si+9]	; Load 32 bit ptr
		les	si,dword ptr ds:[1Ah]	; (020C:001A=0AE9Ch) Load 32 bit ptr
		xchg	ax,es:[si]
		mov	word ptr ds:[1Eh],ax	; (020C:001E=961Fh)
		mov	ax,cs
		xchg	ax,es:[si+2]
		mov	word ptr data_72+2,ax	; (020C:0020=0A3B9h)
		mov	ax,cx
		cmp	ax,3C00h
		jb	loc_84			; Jump if below
		mov	ax,3C00h
loc_84:
		sub	ax,word ptr ds:[37h]	; (020C:0037=0)
		cmp	ax,40h
		jb	loc_85			; Jump if below
		cmp	word ptr ds:[35h],0	; (020C:0035=80Fh)
		jne	loc_85			; Jump if not equal
		mov	byte ptr ds:[29h],1	; (020C:0029=14h)
loc_85:
		or	ax,ax			; Zero ?
		jz	loc_88			; Jump if zero
		mov	cx,400h
		xor	bx,bx			; Zero register
		cmp	byte ptr ds:[29h],0	; (020C:0029=14h)
		je	loc_86			; Jump if equal
		mov	bx,40h
loc_86:
		cmp	bx,word ptr ds:[35h]	; (020C:0035=80Fh)
		jae	loc_87			; Jump if above or =
		mov	bx,word ptr ds:[35h]	; (020C:0035=80Fh)
loc_87:
		add	cx,bx
		sub	ax,bx
		call	sub_20			; (1091)
loc_88:
		pop	es
		retn
sub_15		endp
  
		adc	ax,[bx+si]
		db	0FFh
		call	word ptr [bp+44h]	;*
		dec	cx
		push	bx
		dec	bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_16		proc	near
		push	es
		xor	ax,ax			; Zero register
		mov	es,ax
		mov	es,word ptr es:[66h]	; (0000:0066=20Ch)
		mov	di,12h
		mov	si,1C5h
		mov	cx,5
		cld				; Clear direction
		repe	cmpsb			; Rep zf=1+cx >0 Cmp [si] to es:[di]
		pop	es
		jz	loc_89			; Jump if zero
		call	sub_17			; (0FE6)
		push	es
		les	di,dword ptr cs:[1C1h]	; (020C:01C1=0) Load 32 bit ptr
		mov	si,1C5h
		mov	cx,5
		cld				; Clear direction
		repe	cmpsb			; Rep zf=1+cx >0 Cmp [si] to es:[di]
		pop	es
		pushf				; Push flags
		call	sub_18			; (1020)
		push	cs
		call	word ptr ds:[14h]	; (020C:0014=0E0Dh)
		jz	loc_89			; Jump if zero
		mov	byte ptr ds:[2Ch],0	; (020C:002C=39h)
		retn
loc_89:
		mov	byte ptr ds:[2Ch],1	; (020C:002C=39h)
		retn
sub_16		endp
  
		cmp	ah,88h
		je	loc_90			; Jump if equal
		cmp	ah,87h
		je	loc_91			; Jump if equal
		jmp	dword ptr cs:[1Eh]	; (020C:001E=961Fh)
loc_90:
		mov	ax,word ptr cs:[35h]	; (020C:0035=80Fh)
		jmp	loc_125			; (115C)
loc_91:
		call	sub_21			; (1114)
		sub	sp,4
		db	60h
		call	sub_19			; (1089)
		mov	bp,sp
		mov	[bp+12h],ax
		mov	ax,[bp+18h]
		mov	[bp+10h],ax
		db	61h
		call	dword ptr cs:[1Eh]	; (020C:001E=961Fh)
		push	ax
		pushf				; Push flags
		push	bp
		mov	bp,sp
		mov	ax,[bp+2]
		mov	[bp+0Ch],ax
		cmp	word ptr [bp+6],0
		pop	bp
		pop	ax
		pop	ax
		jz	loc_92			; Jump if zero
		call	sub_21			; (1114)
		db	60h
		mov	ax,1
		call	sub_23			; (11BE)
		db	61h
loc_92:
		add	sp,2
		jmp	loc_125			; (115C)
		add	[bx+si],al
		call	sub_21			; (1114)
		mov	bl,91h
		cmp	al,40h			; '@'
		jne	loc_93			; Jump if not equal
		cmp	dx,word ptr ds:[263h]	; (020C:0263=0)
		je	loc_94			; Jump if equal
loc_93:
		cmp	byte ptr ds:[26h],1	; (020C:0026=3)
		je	loc_94			; Jump if equal
		mov	bl,90h
		cmp	byte ptr ds:[29h],0	; (020C:0029=14h)
		je	loc_94			; Jump if equal
		mov	bl,92h
		cmp	dx,word ptr ds:[33h]	; (020C:0033=0Ch)
		jb	loc_94			; Jump if below
		mov	ax,1
		mov	byte ptr ds:[26h],al	; (020C:0026=3)
		xor	bl,bl			; Zero register
		retn
loc_94:
		xor	ax,ax			; Zero register
		retn
		call	sub_21			; (1114)
		mov	al,byte ptr ds:[26h]	; (020C:0026=3)
		or	al,al			; Zero ?
		jz	loc_95			; Jump if zero
		mov	byte ptr ds:[26h],0	; (020C:0026=3)
		mov	ax,1
		xor	bl,bl			; Zero register
		retn
loc_95:
		xor	ax,ax			; Zero register
		mov	bl,93h
		retn
		call	sub_21			; (1114)
		cmp	word ptr ds:[31h],1	; (020C:0031=3F3Eh)
		je	loc_96			; Jump if equal
		call	sub_17			; (0FE6)
		or	ax,ax			; Zero ?
		jz	loc_97			; Jump if zero
		mov	word ptr ds:[31h],1	; (020C:0031=3F3Eh)
loc_96:
		mov	ax,1
		xor	bl,bl			; Zero register
		retn
loc_97:
		mov	bl,82h
		xor	ax,ax			; Zero register
		retn
		call	sub_21			; (1114)
		cmp	word ptr ds:[31h],0	; (020C:0031=3F3Eh)
		je	loc_98			; Jump if equal
		call	sub_18			; (1020)
		or	ax,ax			; Zero ?
		jz	loc_99			; Jump if zero
		mov	word ptr ds:[31h],0	; (020C:0031=3F3Eh)
loc_98:
		mov	ax,1
		xor	bl,bl			; Zero register
		retn
loc_99:
		mov	bl,82h
data_152	db	33h
		db	0C0h
		retn
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_17		proc	near
		call	sub_21			; (1114)
		cmp	byte ptr ds:[27h],1	; (020C:0027=4)
		jne	loc_103			; Jump if not equal
		mov	byte ptr ds:[3Bh],3	; (020C:003B=0)
		cmp	word ptr ds:[2Fh],0	; (020C:002F=3D3Ch)
		je	loc_101			; Jump if equal
loc_100:
		call	sub_19			; (1089)
		or	ax,ax			; Zero ?
		jnz	loc_102			; Jump if not zero
loc_101:
		mov	ax,1
		call	sub_23			; (11BE)
		dec	byte ptr ds:[3Bh]	; (020C:003B=0)
		jnz	loc_100			; Jump if not zero
		jmp	short loc_104		; (101B)
loc_102:
		inc	word ptr ds:[2Fh]	; (020C:002F=3D3Ch)
loc_103:
		mov	ax,1
		xor	bl,bl			; Zero register
		retn
loc_104:
		mov	bl,82h
		xor	ax,ax			; Zero register
		retn
sub_17		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_18		proc	near
		call	sub_21			; (1114)
		cmp	byte ptr ds:[27h],0	; (020C:0027=4)
		je	loc_109			; Jump if equal
		cmp	word ptr ds:[2Fh],0	; (020C:002F=3D3Ch)
		je	loc_110			; Jump if equal
		mov	byte ptr ds:[3Bh],3	; (020C:003B=0)
loc_105:
		call	sub_19			; (1089)
		cmp	word ptr ds:[2Fh],1	; (020C:002F=3D3Ch)
		jne	loc_106			; Jump if not equal
		or	ax,ax			; Zero ?
		jz	loc_108			; Jump if zero
		xor	ax,ax			; Zero register
		jmp	short loc_107		; (104F)
loc_106:
		or	ax,ax			; Zero ?
		jnz	loc_108			; Jump if not zero
		mov	ax,1
loc_107:
		call	sub_23			; (11BE)
		dec	byte ptr ds:[3Bh]	; (020C:003B=0)
		jnz	loc_105			; Jump if not zero
		jmp	short loc_110		; (1064)
loc_108:
		dec	word ptr ds:[2Fh]	; (020C:002F=3D3Ch)
loc_109:
		mov	ax,1
		xor	bl,bl			; Zero register
		retn
loc_110:
		mov	bl,82h
		xor	ax,ax			; Zero register
		retn
sub_18		endp
  
		cmp	byte ptr cs:[2Bh],0	; (020C:002B=38h)
		je	loc_111			; Jump if equal
		mov	ax,1
		retf				; Return far
loc_111:
		call	sub_17			; (0FE6)
		retf
		cmp	byte ptr cs:[2Bh],0	; (020C:002B=38h)
		je	loc_112			; Jump if equal
		mov	ax,1
		retf				; Return far
loc_112:
		call	sub_18			; (1020)
		retf				; Return far
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_19		proc	near
		mov	al,byte ptr cs:[3Ch]	; (020C:003C=10h)
		cbw				; Convrt byte to word
		xor	bl,bl			; Zero register
		retn
sub_19		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_20		proc	near
		mov	dx,ax
		mov	si,cx
		xor	di,di			; Zero register
		push	es
		mov	es,word ptr ds:[14Dh]	; (020C:014D=5582h)
		mov	bx,word ptr es:[0A004h]	; (5582:A004=0FFFFh)
		mov	cx,word ptr es:[0A008h]	; (5582:A008=0FFFFh)
  
locloop_113:
		cmp	byte ptr es:[bx],4
		jne	loc_114			; Jump if not equal
		or	di,di			; Zero ?
		jnz	loc_117			; Jump if not zero
		mov	di,bx
		jmp	short loc_117		; (10F8)
loc_114:
		cmp	byte ptr es:[bx],1
		jne	loc_117			; Jump if not equal
		mov	ax,es:[bx+2]
		add	ax,es:[bx+4]
		cmp	ax,si
		jb	loc_117			; Jump if below
		mov	ax,si
		add	ax,dx
		cmp	ax,es:[bx+2]
		jb	loc_117			; Jump if below
		cmp	si,es:[bx+2]
		jbe	loc_115			; Jump if below or =
		add	dx,si
		mov	si,es:[bx+2]
		sub	dx,si
loc_115:
		mov	ax,es:[bx+2]
		add	ax,es:[bx+4]
		sub	ax,dx
		sub	ax,si
		jbe	loc_116			; Jump if below or =
		add	dx,ax
loc_116:
		mov	byte ptr es:[bx],4
		or	di,di			; Zero ?
		jnz	loc_117			; Jump if not zero
		mov	di,bx
loc_117:
		add	bx,6
		loop	locloop_113		; Loop if cx > 0
  
		or	di,di			; Zero ?
		jz	loc_118			; Jump if zero
		mov	byte ptr es:[di+1],0
		mov	byte ptr es:[di],1
		mov	es:[di+2],si
		mov	es:[di+4],dx
loc_118:
		pop	es
		retn
sub_20		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_21		proc	near
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		lahf				; Load ah from flags
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_120			; Jump if not zero
           lock	and	word ptr ds:[314h],0FDFFh	; (0040:0314=3200h)
loc_119:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		jmp	short loc_121		; (1133)
loc_120:
		cli				; Disable interrupts
		jmp	short loc_119		; (112B)
loc_121:
		retn
sub_21		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_22		proc	near
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		lahf				; Load ah from flags
		test	word ptr ds:[314h],3	; (0040:0314=3200h)
		jnz	loc_123			; Jump if not zero
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_123			; Jump if not zero
           lock	or	word ptr ds:[314h],200h	; (0040:0314=3200h)
loc_122:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		jmp	short loc_124		; (115B)
loc_123:
		sti				; Enable interrupts
		jmp	short loc_122		; (1153)
loc_124:
		retn
sub_22		endp
  
loc_125:
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_133			; Jump if not zero
		push	bp
		mov	bp,sp
		mov	ax,[bp+0Ah]
		pop	bp
		test	ax,100h
		jnz	loc_133			; Jump if not zero
		test	ax,200h
		jz	loc_129			; Jump if zero
           lock	or	word ptr ds:[314h],200h	; (0040:0314=3200h)
		test	word ptr ds:[314h],3	; (0040:0314=3200h)
		jnz	loc_133			; Jump if not zero
loc_126:
		xchg	ah,al
		cld				; Clear direction
		test	al,4
		jnz	loc_132			; Jump if not zero
loc_127:
		test	al,8
		jnz	loc_130			; Jump if not zero
		jo	loc_131			; Jump if overflow=1
loc_128:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		retf	2			; Return far
loc_129:
           lock	and	word ptr ds:[314h],0FDFFh	; (020C:0314=3231h)
		jmp	short loc_126		; (118B)
loc_130:
		jo	loc_128			; Jump if overflow=1
		push	ax
		mov	al,7Fh
		add	al,2
		pop	ax
		jmp	short loc_128		; (1198)
loc_131:
		push	ax
		xor	al,al			; Zero register
		pop	ax
		jmp	short loc_128		; (1198)
loc_132:
		std				; Set direction flag
		jmp	short loc_127		; (1192)
loc_133:
		pop	ax
		pop	ds
		iret				; Interrupt return
		add	[di],bh
		add	al,[bx+si]
		jnz	loc_134			; Jump if not zero
		mov	al,byte ptr cs:[3Ch]	; (020C:003C=10h)
		cbw				; Convrt byte to word
		retn
loc_134:
		db	0C4h
		les	dx,dword ptr [bp+si+0]	; Load 32 bit ptr
		retn
		mov	byte ptr cs:[bp+2Ah],3
		dec	cx
		add	[bx+si],al
		or	ax,2Fh
		add	byte ptr ds:[600h],al	; (020C:0600=2)
		add	[bx],cl
		db	61h
		db	0FFh
		inc	data_223		; (020C:2300=0)
		db	0
data_154	db	0
data_155	db	0
data_156	db	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
data_157	dw	0
data_158	dw	0
data_159	dw	0
data_160	dw	0
data_161	dw	0
		add	[bx+si],al
		add	[bx+si],al
data_164	db	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
data_165	db	0
data_166	dw	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
data_169	db	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
data_170	db	0
data_171	db	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
  
;ДДДДД Indexed Entry Point ДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДД
  
loc_135:
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		or	al,0
		add	byte ptr [bx+di],54h	; 'T'
		add	bx,[bx+si+74h]
		add	cx,[bx+di]
		add	[bx+di],bl
		add	[bx+si],al
		or	al,0
		add	byte ptr [bx+di],52h	; 'R'
		add	ax,[bx+si]
		add	bh,bh
		db	0FFh
		esc	1,[bx+di]		; coprocessor escape
		add	al,0
		add	[bx+si],al
		db	 41h, 41h, 41h
data_173	db	'AAAAAAAAAAAAAA', 0
		add	[bx+si],al
		add	[bx+di+41h],al
		inc	cx
		inc	cx
		inc	cx
		inc	cx
		inc	cx
		inc	cx
		inc	cx
		inc	cx
		add	[bx+si],al
		db	17 dup (41h)
		add	[bx+si],al
		add	[bx+si],al
		db	10 dup (41h)
		add	[bx+si],al
		db	17 dup (41h)
		add	[bx+si],al
		add	[bx+si],al
		db	10 dup (41h)
		add	[bx+si],al
		db	17 dup (41h)
		add	[bx+si],al
		add	[bx+si],al
		db	10 dup (41h)
		add	[bx+si],al
		add	[bx+si],al
		xchg	ax,bp
		sbb	al,4Ch			; 'L'
		jle	loc_136			; Jump if < or =
		adc	al,[bx+si]
		add	[bp+si+3],dl
		add	[bx+si],al
		add	[bx+si],al
		db	0C7h
		sbb	al,0
		add	[bx+di+3Ah],al
		pop	sp
		db	65 dup (0)
		pop	ax
		add	al,[bx+si]
		inc	dx
		cmp	bl,[si+0]
		db	64 dup (0)
		pop	ax
		add	al,[bx+si]
		inc	bx
		cmp	bl,[si+0]
		db	64 dup (0)
		push	sp
		add	al,[bx+si]
		inc	sp
		cmp	bl,[si+0]
		db	64 dup (0)
		pop	sp
		add	al,[bx+si]
		mov	ch,1
		add	[bx+si],al
		push	bx
		xchg	ax,cx
		add	di,[bp]
		add	[si],cl
		add	[bx+si+0],bl
		stosb				; Store al to es:[di]
		add	ax,[bx+si]
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+di],cl
		add	[bx+si+0],cl
		add	byte ptr [bx+si],0
		add	dl,al
		add	ax,[bx+si]
		add	[bx+si+0],al
		inc	ax
		add	dl,ch
		db	6Dh
		add	al,dh
		call	sub_25			; (1A37)
		adc	al,[bx+si]
		inc	si
		pop	es
		or	al,2
		call	sub_25			; (1A37)
		sbb	ax,[bx+si]
		or	al,[si]
		or	al,2
		jmp	short loc_137		; (187C)
		nop
		add	al,ch
		mov	ax,2401h
		add	byte ptr ds:[0C0Ch][si],ah	; (ss:0C0C=2Eh)
		add	ch,al
		scasw				; Scan es:[di] for ax
		add	[bx+di],si
		add	bl,ch
		adc	bh,bh
		add	cx,[si]
		add	cl,[bp+di+42h]
		add	bl,ch
data_187	dw	0Ch, 0
		add	[bx+si],al
		add	[bx+si],al
		call	sub_25			; (1A37)
		cmp	al,0
		jmp	loc_153			; (19D6)
		jmp	short loc_138		; (18B6)
		inc	word ptr [bp+di]
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_138:
		call	sub_25			; (1A37)
		push	si
		add	cl,ch
		sbb	[bx+di],al
		jmp	short loc_139		; (18D0)
		inc	word ptr [bp+di]
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_139:
		call	sub_25			; (1A37)
		jo	loc_140			; Jump if overflow=1
loc_140:
		jmp	loc_153			; (19D6)
		jmp	short loc_141		; (18EA)
		inc	word ptr [bp+di]
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_141:
		call	sub_25			; (1A37)
		mov	al,[bx+si]
		jmp	loc_153			; (19D6)
		jmp	short loc_142		; (1904)
		mov	bl,7
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_142:
		call	sub_25			; (1A37)
		movsb				; Mov [si] to es:[di]
		add	cl,ch
		retf	0EB00h			; Return far
		adc	byte ptr ds:[0C06h][si],dh	; (020C:0C06=0)
		add	cl,[bp+di+42h]
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		call	sub_25			; (1A37)
		mov	si,0E900h
		mov	al,0
		jmp	short loc_143		; (1938)
		mov	ah,6
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_143:
		call	sub_25			; (1A37)
		esc	0,[bx+si]		; coprocessor escape
		jmp	loc_153			; (19D6)
		jmp	short loc_144		; (1952)
		mov	ah,6
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_144:
		call	sub_25			; (1A37)
		db	0F2h
		add	bl,ch
		jge	loc_141			; Jump if > or =
		jmp	short loc_145		; (196C)
		mov	ah,6
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_145:
		call	sub_25			; (1A37)
		or	al,1
		jmp	short loc_153		; (19D6)
		nop
		jmp	short loc_146		; (1986)
		mov	ah,6
		or	al,2
		dec	bx
		inc	dx
		add	bl,ch
		or	al,0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_146:
		call	sub_25			; (1A37)
		db	26h
		add	bx,bp
		dec	cx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_24		proc	near
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		lahf				; Load ah from flags
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_148			; Jump if not zero
           lock	and	word ptr ds:[314h],0FDFFh	; (0040:0314=3200h)
loc_147:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		jmp	short loc_149		; (19AD)
loc_148:
		cli				; Disable interrupts
		jmp	short loc_147		; (19A5)
loc_149:
		retn
sub_24		endp
  
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		lahf				; Load ah from flags
		test	word ptr ds:[314h],3	; (0040:0314=3200h)
		jnz	loc_151			; Jump if not zero
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_151			; Jump if not zero
           lock	or	word ptr ds:[314h],200h	; (0040:0314=3200h)
loc_150:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		jmp	short loc_152		; (19D5)
loc_151:
		sti				; Enable interrupts
		jmp	short loc_150		; (19CD)
loc_152:
		retn
loc_153:
		push	ds
		push	ax
		mov	ax,40h
		mov	ds,ax
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_161			; Jump if not zero
		push	bp
		mov	bp,sp
		mov	ax,[bp+0Ah]
		pop	bp
		test	ax,100h
		jnz	loc_161			; Jump if not zero
		test	ax,200h
		jz	loc_157			; Jump if zero
           lock	or	word ptr ds:[314h],200h	; (0040:0314=3200h)
		test	word ptr ds:[314h],3	; (0040:0314=3200h)
		jnz	loc_161			; Jump if not zero
loc_154:
		xchg	ah,al
		cld				; Clear direction
		test	al,4
		jnz	loc_160			; Jump if not zero
loc_155:
		test	al,8
		jnz	loc_158			; Jump if not zero
		jo	loc_159			; Jump if overflow=1
loc_156:
		sahf				; Store ah into flags
		pop	ax
		pop	ds
		retf	2			; Return far
loc_157:
           lock	and	word ptr ds:[314h],0FDFFh	; (020C:0314=3231h)
		jmp	short loc_154		; (1A05)
loc_158:
		jo	loc_156			; Jump if overflow=1
		push	ax
		mov	al,7Fh
		add	al,2
		pop	ax
		jmp	short loc_156		; (1A12)
loc_159:
		push	ax
		xor	al,al			; Zero register
		pop	ax
		jmp	short loc_156		; (1A12)
loc_160:
		std				; Set direction flag
		jmp	short loc_155		; (1A0C)
loc_161:
		pop	ax
		pop	ds
		iret				; Interrupt return
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_25		proc	near
		push	ax
		push	bp
		push	es
		mov	es,word ptr cs:[0Ah]	; (020C:000A=272Dh)
		mov	bp,word ptr cs:[10h]	; (020C:0010=1FBFh)
		mov	al,1
		xchg	al,es:[bp]
		cmp	al,0
		jne	loc_163			; Jump if not equal
		sub	word ptr cs:[10h],8	; (020C:0010=1FBFh)
loc_162:
		mov	es:[bp+2],sp
		mov	es:[bp+4],ss
		mov	ax,bp
		mov	bp,es:[bp+6]
		cmp	es:[bp],ax
		jne	loc_165			; Jump if not equal
		push	bp
		mov	bp,sp
		mov	ax,[bp+8]
		pop	bp
		push	es
		pop	ss
		mov	sp,bp
		mov	bp,ax
		mov	bp,cs:[bp]
		pushf				; Push flags
		call	dword ptr cs:[bp]	;*
		mov	bp,sp
		mov	bp,es:[bp]
		mov	ss,es:[bp+4]
		mov	sp,es:[bp+2]
		mov	byte ptr es:[bp],0
		mov	word ptr cs:[10h],bp	; (020C:0010=1FBFh)
		pop	es
		pop	bp
		pop	ax
		add	sp,2
		jmp	loc_153			; (19D6)
loc_163:
		cmp	al,1
		je	loc_164			; Jump if equal
		xchg	al,es:[bp]
loc_164:
		call	sub_26			; (1ABC)
		jmp	short loc_162		; (1A54)
loc_165:
		cmp	bp,word ptr cs:[0Ch]	; (020C:000C=9028h)
		jb	loc_164			; Jump if below
		mov	bp,ax
		mov	byte ptr es:[bp],3
		jmp	short loc_164		; (1AA7)
sub_25		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_26		proc	near
		mov	bp,word ptr cs:[0Eh]	; (020C:000E=0A02Bh)
loc_166:
		cmp	byte ptr es:[bp],0
		jne	loc_168			; Jump if not equal
		mov	al,1
		xchg	al,es:[bp]
		cmp	al,0
		je	loc_169			; Jump if equal
		cmp	al,1
		je	loc_168			; Jump if equal
		mov	es:[bp],al
loc_168:
		cmp	bp,word ptr cs:[0Ch]	; (020C:000C=9028h)
		je	loc_170			; Jump if equal
		sub	bp,8
		jmp	short loc_166		; (1AC1)
loc_169:
		retn
loc_170:
		call	sub_24			; (198E)
  
locloop_171:
		mov	al,0FFh
		out	21h,al			; port 21h, 8259-1 int comands
		out	0A1h,al			; port 0A1h, inhibit IRQ8 RTC
						;  al = 0FFh, inhibit interrupts
		mov	si,cs
		mov	ds,si
		mov	si,2CBh
		push	ax
		push	ds
		mov	ax,70h
		mov	ds,ax
		test	byte ptr ds:[337h],1	; (0070:0337=0)
		pop	ds
		pop	ax
		jz	loc_172			; Jump if zero
;*		call	far ptr sub_2		;*(0070:0338)
		db	 9Ah, 38h, 03h, 70h, 00h
loc_172:
		lodsb				; String [si] to al
		cmp	al,24h			; '$'
		je	loc_174			; Jump if equal
		mov	bl,7
		mov	ah,0Eh
		int	10h			; Video display   ah=functn 0Eh
						;  write char al, teletype mode
		jmp	short loc_172		; (1B0C)
loc_174:
		jmp	short loc_174		; (1B19)
sub_26		endp
  
		or	ax,70Ah
		or	ax,8F0Ah
		movsw				; Mov [si] to es:[di]
;*		loopnz	locloop_167		;*Loop if zf=0, cx>0
  
		db	0E0h,0A5h
		scasw				; Scan es:[di] for ax
		scasb				; Scan es:[di] for al
		stosw				; Store ax to es:[di]
		lodsw				; String [si] to ax
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		test	al,0A5h
		and	[bp+si-1C53h],ah
;*		loop	locloop_173		;*Loop if cx > 0
  
		db	0E2h,0E0h
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		lodsw				; String [si] to ax
		movsw				; Mov [si] to es:[di]
		mov	data_207,ax		; (020C:20AE=2020h)
;*		loopz	locloop_175		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		movsw				; Mov [si] to es:[di]
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[0A0Dh]	; (020C:0A0D=0)
		xchg	ax,cx
		test	al,0E1h
		loop	locloop_171		; Loop if cx > 0
  
		lodsb				; String [si] to al
		mov	al,data_637		; (020C:AE20=73h)
;*		loopz	locloop_176		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		mov	al,data_640		; (020C:AEAD=0FFh)
		mov	data_615,al		; (020C:A5AB=0E9h)
		lodsw				; String [si] to ax
		mov	al,byte ptr ds:[0A0Dh]	; (020C:0A0D=0)
		and	al,7
		add	[bx+di],cl
		db	69h
		add	[bx+si],al
		push	es
		add	byte ptr ds:[0],al	; (020C:0000=28h)
		nop				;*ASM fixup - sign extn byte
		add	[bx+si],al
		add	[bx+si],al
		add	dh,al
		db	7 dup (0)
		inc	si
		add	[bx+si],ax
		add	[bx+si],al
		add	[bx+si],al
		add	dh,al
		add	[bx+si],ax
		add	[bx+si],al
		add	[bx+si],al
		add	[bp+2],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		mov	byte ptr [bp+si],0
		add	[bx+si],al
		add	[bx+si],al
		add	[bp+3],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		mov	byte ptr [bp+di],0
		add	[bx+si],al
		add	[bx+si],al
		add	[bp+4],al
		add	[bx+si],al
		push	es
		push	es
		sti				; Enable interrupts
		db	8Dh
		mov	byte ptr [si],0
		db	253 dup (0)
		or	[bx+si],al
		db	120 dup (0)
data_191	db	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],dl
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],bl
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],ah
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		dd	00000h
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],ch
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],dh
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],bh
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+di],al
		xchg	ax,cx
		add	word ptr ds:[8DFBh][bx+di],dx	; (020C:8DFB=1548h)
		db	0F3h
		add	si,data_688[bx]		; (020C:FB00=6C7h)
		lea	bp,cs:[9102h]		; Load effective addr
		add	ax,[bp+30h]
		inc	ax
		add	[si],al
		add	bl,al
		cmp	al,0
		add	data_551,al		; (020C:4D00=16h)
		adc	[si],al
		mov	ch,0
		add	byte ptr data_504+1,al	; (020C:4300=89h)
		dec	di
		dec	bp
		dec	bp
		inc	cx
		dec	si
		inc	sp
		add	ch,cl
		and	bh,bh
		lahf				; Load ah from flags
		add	[bp+si-110h],bl
		sbb	ax,7FF0h
		add	[bx+si],dx
		add	al,4Bh			; 'K'
		add	[bx+si],dx
		add	al,56h			; 'V'
		add	[bx+si],dx
		add	al,10h
		add	al,1
		add	[bx+di],ax
		add	[bp+si],al
		db	15 dup (0FFh)
		into				; Int 4 on overflow
		add	al,0FAh
		add	ax,410h
		adc	al,0
		sbb	[bx+si],al
		adc	[si],al
		db	0FFh
		db	0FFh
		db	0FFh
		inc	word ptr [bx+si]
		add	[bx+si],al
		add	[di],al
		db	15 dup (0)
		int	21h			; DOS Services  ah=function 86h
		retf				; Return far
		db	10 dup (0)
		db	 20h, 20h, 20h
data_204	db	20h			; Data table (indexed access)
		and	[bx+si],ah
		and	[bx+si],ah
data_205	dw	2020h			; Data table (indexed access)
		and	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
data_206	db	20h
data_207	dw	2020h
		db	8 dup (20h)
		db	9 dup (0)
		or	ax,2020h
		and	[bp+di+45h],dl
		push	sp
		and	[bp+si+4Ch],al
		inc	cx
		push	bx
		push	sp
		inc	bp
		push	dx
		cmp	ax,3041h
		or	ax,0A8ADh
		movsw				; Mov [si] to es:[di]
		and	data_681[si],ah		; (020C:EFAB=0)
		and	data_618[bx+di],ah	; (020C:A7A2=0D9h)
loc_185:
		scasb				; Scan es:[di] for al
		mov	data_608,al		; (020C:A3AE=0E3h)
		scasb				; Scan es:[di] for al
		and	data_666[bx],ch		; (020C:E0AE=0BEh)
;*		loop	locloop_179		;*Loop if cx > 0
  
		db	0E2h,0A0h
		and	[bp+si-515Eh],ah
		movsb				; Mov [si] to es:[di]
data_210	db	0A0h
		sub	ax,0EBA2h
		mov	byte ptr data_613,al	; (020C:A4AE=15h)
		mov	al,data_554		; (020C:5320=56h)
		inc	dx
		sub	al,20h			; ' '
		lodsw				; String [si] to ax
		mov	al,data_667		; (020C:E0AF=6Dh)
		test	al,0ACh
		movsw				; Mov [si] to es:[di]
		loopnz	locloop_187		; Loop if zf=0, cx>0
  
		or	ax,0DECh
;*		loopnz	locloop_186		;*Loop if zf=0, cx>0
  
		db	0E0h,0EBh
		movsw				; Mov [si] to es:[di]
		or	ax,0
		db	50 dup (0)
loc_188:
		jmp	loc_364			; (3890)
		add	[bx],dl
		db	64h
		db	0FFh
		push	word ptr [bx]
		pop	si
		db	0FFh
;*		push	bp
		db	0FFh,0F5h
		pop	sp
		db	0FFh
		jmp	word ptr [si]		;*
		db	61h
loc_189:
		db	0FFh
		db	0FFh
;*		jmp	loc_181			;*(20B3)
		db	0E9h, 5Ch,0FFh
		jmp	word ptr [bp+di+5Fh]	;*
		db	0FFh
		inc	word ptr [bx+di]
		db	61h
		db	0FFh
loc_190:
;*		jmp	dword ptr [bp+5Eh]	;*7 entries
		db	0FFh, 6Eh, 5Eh
		db	0FFh
;*		call	dword ptr [bp+si+64h]	;*3 entries
		db	0FFh, 5Ah, 64h
		db	0FFh
		inc	word ptr [bp+si-0A1h]
		call	bx			;*
		db	64h
		db	0FFh
		jmp	dword ptr data_663[bx]	;*(020C:DB00=445h)
		add	al,[bx+di]
		sti				; Enable interrupts
loc_191:
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[104h]	; (020C:0104=908h)
		sti				; Enable interrupts
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[108h]	; (020C:0108=0A302h)
		sti				; Enable interrupts
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[10Ch]	; (020C:010C=9028h)
		sti				; Enable interrupts
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[110h]	; (020C:0110=1FBFh)
loc_193:
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[114h]	; (020C:0114=0C0Bh)
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[118h]	; (020C:0118=0)
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[11Ch]	; (020C:011C=145Dh)
loc_194:
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[120h]	; (020C:0120=0A3BAh)
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[124h]	; (020C:0124=201h)
		call	sub_27			; (21DD)
		push	ds
		push	cs
		jmp	dword ptr cs:[128h]	; (020C:0128=1405h)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_27		proc	near
		pushf				; Push flags
		push	ax
		cmp	byte ptr cs:[134h],0	; (020C:0134=0)
		je	loc_195			; Jump if equal
		call	sub_28			; (21F7)
		jnc	loc_195			; Jump if carry=0
		call	sub_29			; (220A)
loc_195:
		pop	ax
		popf				; Pop flags
		retn
sub_27		endp
  
;*		jmp	far ptr loc_2765	;*(0410:0135)
		db	0EAh, 35h, 01h, 10h, 04h
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_28		proc	near
		push	bx
		push	ax
		mov	ah,7
		call	dword ptr cs:[130h]	; (020C:0130=3E3Dh)
		or	ax,ax			; Zero ?
		pop	ax
loc_197:
		pop	bx
		jnz	loc_198			; Jump if not zero
		stc				; Set carry flag
		retn
loc_198:
		clc				; Clear carry flag
		retn
sub_28		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_29		proc	near
		push	bx
		push	ax
loc_199:
		mov	ah,5
		call	dword ptr cs:[130h]	; (020C:0130=3E3Dh)
		or	ax,ax			; Zero ?
loc_200:
		jz	loc_201			; Jump if zero
		pop	ax
		pop	bx
		retn
loc_201:
		jmp	short loc_201		; (221A)
sub_29		endp
  
		int	21h			; DOS Services  ah=function BDh
		cli				; Disable interrupts
		push	cs
		pop	ss
		mov	sp,612h
		sti				; Enable interrupts
		push	cs
		pop	ds
		pushf				; Push flags
		push	ax
		mov	al,byte ptr cs:[614h]	; (020C:0614=2Eh)
		test	al,80h
		jz	loc_203			; Jump if zero
		and	al,7Fh
		call	dword ptr cs:[12Ch]	; (020C:012C=3A39h)
loc_203:
		and	byte ptr cs:[614h],7Fh	; (020C:0614=2Eh)
		pop	ax
		popf				; Pop flags
		jmp	loc_193			; (21A1)
		add	al,[bx+si]
		add	[bx+di],al
		or	[bp+si],ax
		inc	cx
loc_205:
		add	al,[bx+si]
		add	[bp+si],al
		adc	[bp+si],al
		db	9 dup (0)
		add	ah,[bp+si]
		add	al,[bp+di]
		xor	[bp+si],al
		add	bp,word ptr ds:[2]	; (020C:0002=10h)
		db	16 dup (0)
		add	[bx+di],cx
		add	al,[bp+si]
		pop	dx
		add	al,[bx+di]
		cmp	al,2
		inc	bx
		add	bh,[si+4]
		db	10 dup (0)
data_215	db	0
		adc	[si],al
		jg	loc_209			; Jump if >
		adc	[si],al
		db	7 dup (0)
		inc	bx
		cmp	bl,[si+57h]
		dec	cx
		dec	si
		inc	sp
		dec	di
		push	di
		push	bx
		pop	sp
		push	bx
		pop	cx
		push	bx
		push	sp
		inc	bp
		dec	bp
		xor	si,[bp+si]
		pop	sp
		inc	bx
data_217	dw	4D4Fh
		dec	bp
		inc	cx
data_218	dw	444Eh
data_219	dw	432Eh
		dec	di
		dec	bp
		db	0, 0, 0, 0, 0, 0
data_221	dw	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+2],dh
		sub	al,1
loc_210:
		mov	ah,95h
		add	[bx+si],ax
		add	[bp+di],al
		call	dword ptr ds:[1EEEh][bx]	;*(020C:1EEE=0)
		add	[bx+si],ax
		add	ax,[bx+si]
		add	[bx+si],ax
		add	[bx+di],ax
		add	[bx+si],ax
		add	[bx+si],ax
		add	[bx+si],al
		db	0FFh
		inc	word ptr [bx+si]
		db	9 dup (0)
data_223	dw	0
		add	al,31h			; '1'
		or	sp,[bx+0]
		nop				;*ASM fixup - displacement
		nop				;*ASM fixup - sign extn byte
		add	[bx+si],al
		add	bh,ah
		or	al,0A7h
		db	88 dup (0)
		add	[bx+si],ax
		add	[bx+si],al
		add	[bx+si],ax
		db	7 dup (0)
		push	ds
		push	es
		push	cs
		pop	ds
		mov	dx,data_221		; (020C:22BD=0)
		mov	ax,data_218		; (020C:22B1=444Eh)
		mov	bx,data_217		; (020C:22AD=4D4Fh)
		mov	cx,data_219		; (020C:22B3=432Eh)
		push	ax
		push	bx
		push	cx
		mov	bx,ds
		mov	es,bx
		mov	bx,word ptr ds:[593h]	; (020C:0593=3)
		mov	ah,4Ah			; 'J'
		int	21h			; DOS Services  ah=function 4Ah
						;  change mem allocation, bx=siz
		cmp	byte ptr ds:[2B0h],1	; (020C:02B0=1Dh)
		jne	loc_211			; Jump if not equal
		cmp	word ptr ds:[256h],0	; (020C:0256=0)
		je	loc_211			; Jump if equal
		mov	bx,7
		mov	ah,48h			; 'H'
		int	21h			; DOS Services  ah=function 48h
						;  allocate memory, bx=bytes/16
		jc	loc_211			; Jump if carry Set
		mov	es,ax
		xor	di,di			; Zero register
		xor	si,si			; Zero register
		push	ds
		mov	ds,word ptr ds:[256h]	; (020C:0256=0)
		mov	cx,21h
		add	cx,40h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	ds
		mov	cx,es
		mov	es,word ptr ds:[256h]	; (020C:0256=0)
		mov	ah,49h			; 'I'
		int	21h			; DOS Services  ah=function 49h
						;  release memory block, es=seg
		mov	word ptr ds:[256h],cx	; (020C:0256=0)
loc_211:
		pop	cx
		pop	bx
		pop	bp
		mov	ah,48h			; 'H'
		int	21h			; DOS Services  ah=function 48h
						;  allocate memory, bx=bytes/16
		jc	loc_212			; Jump if carry Set
		mov	word ptr ds:[458h],ax	; (020C:0458=0C40Eh)
		mov	word ptr ds:[2Ch],ax	; (020C:002C=3A39h)
		mov	es,ax
		cmp	byte ptr ds:[2B0h],1	; (020C:02B0=1Dh)
		jne	loc_213			; Jump if not equal
		push	bx
		mov	bx,0
		db	0C4h
		les	dx,dword ptr [si+0Fh]	; Load 32 bit ptr
		mov	ax,bx
		pop	bx
		cmp	ax,0
		je	loc_213			; Jump if equal
		add	bx,ax
		mov	ah,49h			; 'I'
		int	21h			; DOS Services  ah=function 49h
						;  release memory block, es=seg
		mov	ah,48h			; 'H'
		int	21h			; DOS Services  ah=function 48h
						;  allocate memory, bx=bytes/16
		jc	loc_216			; Jump if carry Set
		mov	word ptr ds:[458h],ax	; (020C:0458=0C40Eh)
		mov	word ptr ds:[2Ch],ax	; (020C:002C=3A39h)
		mov	es,ax
		mov	data_217,bx		; (020C:22AD=4D4Fh)
		push	bx
		db	0C4h
		les	dx,dword ptr [si+0Fh]	; Load 32 bit ptr
		pop	ax
		cmp	bx,ax
		jbe	loc_214			; Jump if below or =
loc_212:
		jmp	short loc_216		; (2478)
loc_213:
		push	ds
		mov	ds,bp
		xor	si,si			; Zero register
		mov	di,si
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	ds
loc_214:
		cmp	data_215,0		; (020C:228A=0)
		jne	loc_215			; Jump if not equal
		mov	es,bp
		mov	ah,49h			; 'I'
		int	21h			; DOS Services  ah=function 49h
						;  release memory block, es=seg
loc_215:
		mov	byte ptr ds:[29Eh],1	; (020C:029E=0)
		push	es
		mov	si,2760h
		mov	di,0
		mov	cx,0A4ADh
		mov	bx,0FFFFh
		mov	ah,48h			; 'H'
		int	21h			; DOS Services  ah=function 48h
						;  allocate memory, bx=bytes/16
		cmp	bx,dx
		jb	loc_216			; Jump if below
		mov	ah,48h			; 'H'
		int	21h			; DOS Services  ah=function 48h
						;  allocate memory, bx=bytes/16
		jc	loc_216			; Jump if carry Set
		push	ax
		add	ax,bx
		sub	ax,dx
		mov	word ptr ds:[29Ch],ax	; (020C:029C=0)
		mov	es,ax
		pop	ax
		add	si,cx
		dec	si
		add	di,cx
		dec	di
		std				; Set direction flag
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cld				; Clear direction
		mov	es,ax
		mov	ah,49h			; 'I'
		int	21h			; DOS Services  ah=function 49h
						;  release memory block, es=seg
		mov	byte ptr ds:[330h],0	; (020C:0330=61h)
		pop	es
		pop	ds
		jmp	loc_194			; (21BF)
loc_216:
		jmp	loc_487			; (423B)
		db	25 dup (0)
		xor	ax,[bp+di]
		add	byte ptr [bp+di],0CEh
		add	al,80h
		add	[bx+si],dl
		add	al,5Ch			; '\'
		add	[bx+si],dl
		add	al,6Ch			; 'l'
		add	[bx+si],dl
		add	al,93h
		add	[bx+si],dx
		add	al,0
		adc	[bx],ch
		pop	sp
		esc	4,[bx+di]		; coprocessor escape
		adc	[si],al
		db	6Bh
		add	[bx+si],dx
		add	al,0
		add	[bp+di],dl
		add	ax,0
		db	'\\MAC\ALLFILES\APPL~WSI\OS\DROP~'
		db	'9U0\SR.EXE'
		db	231 dup (0)
		db	66h
		add	bl,bl
		add	al,[bp+0Bh]
		mov	ch,0
		db	66 dup (0)
		db	63h
		or	ax,94h
		add	[bx+si],al
		add	bh,ah
		or	al,0C5h
		and	cl,[si]
		xchg	ax,sp
;*		jmp	far ptr loc_2767	;*(1222:EA22)
		db	0EAh, 22h,0EAh, 22h, 12h
		pop	es
		add	[bx],al
		esc	3,[bp+si]		; coprocessor escape
		add	[bx+si],ax
		esc	3,[bp+si]		; coprocessor escape
		inc	di
		add	bx,bx
  
locloop_218:
		add	ah,[si]
		and	ax,95B4h
data_231	db	0
data_232	dw	0B23Eh
data_233	db	9Ah
data_234	db	10h
data_235	dw	4
data_236	db	0
data_237	db	0
		add	[bx+si],ax
		add	word ptr ds:[1000h][bx+di],ax	; (020C:1000=75C0h)
		add	al,10h
		add	al,0DEh
		add	[bx+si],dx
		add	al,46h			; 'F'
		xor	al,[bx+si]
		add	[bx+si],al
		inc	cx
		push	dx
		dec	cx
		inc	si
		pop	cx
		dec	si
		or	al,41h			; 'A'
		db	62h
		db	6Fh
		jc	loc_230			; Jump if carry Set
		and	[bx+si],ch
;*		loopz	locloop_220		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		scasb				; Scan es:[di] for al
		scasw				; Scan es:[di] for ax
		sub	[bx+si],dx
		sub	al,20h			; ' '
loc_221:
		push	dx
		db	65h
		jz	loc_231			; Jump if zero
		jns	loc_224			; Jump if not sign
		sub	data_606[bx],ch		; (020C:A2AE=2Ah)
;*		loop	locloop_217		;*Loop if cx > 0
  
		db	0E2h,0AEh
		loopnz	locloop_226		; Loop if zf=0, cx>0
  
		adc	ch,[si]
		and	[bx+di+67h],cl
		db	6Eh
		db	6Fh
		dd	28206572h
		scasw				; Scan es:[di] for ax
		loopnz	locloop_218		; Loop if zf=0, cx>0
  
		scasw				; Scan es:[di] for ax
		jcxz	loc_221			; Jump if cx=0
		stosb				; Store al to es:[di]
		sub	word ptr ds:[202Ch],cx	; (020C:202C=0)
		inc	si
		db	61h
loc_224:
		db	69h
		db	6Ch
		and	[bx+si],ch
;*		loopz	locloop_219		;*Loop if zf=1, cx>0
  
		db	0E1h,0A1h
;*		loopnz	locloop_220		;*Loop if zf=0, cx>0
  
		db	0E0h,0AEh
		loopz	locloop_229		; Loop if zf=1, cx>0
  
		add	[bx],di
		pop	es
		out	0E2h,ax			; port 0E2h
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
  
locloop_226:
		test	al,0A5h
  
locloop_228:
		add	[bx],al
		cmpsw				; Cmp [si] to es:[di]
		mov	al,data_624		; (020C:A8AF=0)
;*		loopz	locloop_225		;*Loop if zf=1, cx>0
  
		db	0E1h,0ECh
		add	[di],cl
		and	[di],ah
		xor	[bx+si],sp
		movsb				; Mov [si] to es:[di]
		test	al,0E1h
		stosb				; Store al to es:[di]
		and	[di],ah
		xor	cl,[di]
		or	dl,[bp+di]
		and	[di],ah
		xor	[bx+si],sp
;*		jcxz	loc_227			;*Jump if cx=0
		db	0E3h,0E1h
		loop	locloop_228		; Loop if cx > 0
  
  
locloop_229:
		scasb				; Scan es:[di] for al
		test	ax,0E2E1h
		mov	byte ptr data_207,al	; (020C:20AE=20h)
		and	ax,0D32h
		or	ah,[bx]
		and	cl,0E2h
		mov	al,data_680		; (020C:ECA2=0B4h)
;*		loop	locloop_222		;*Loop if cx > 0
  
		db	0E2h,0A5h
		and	dl,ah
		scasb				; Scan es:[di] for al
		lodsb				; String [si] to al
		and	[di],ah
		xor	[si],bp
		and	cl,ah
		movsw				; Mov [si] to es:[di]
;*		loopnz	locloop_223		;*Loop if zf=0, cx>0
  
		db	0E0h,0A8h
		test	ax,0EBADh
		test	ax,0AD20h
		scasb				; Scan es:[di] for al
		lodsb				; String [si] to al
		movsw				; Mov [si] to es:[di]
		loopnz	locloop_233		; Loop if zf=0, cx>0
  
		and	ax,2D32h
		and	ax,0D33h
data_239	dw	370Ah, 0E188h
data_240	dw	0AEAFh, 0E7E0h
data_241	dw	0ADA5h, 20A0h
data_242	dw	0A0E2h, 0ABA1h
data_243	dw	0E6A8h, 20A0h
data_244	dw	0A0E0h, 0ACA7h
data_245	dw	0E9A5h, 0ADA5h
data_246	dw	0EFA8h, 0E420h
data_247	dw	0A9A0h, 0AEABh
data_248	dw	20A2h, 4628h
data_249	dw	5441h, 2029h
data_250	dw	0A0ADh, 0A420h
data_251	dw	0E1A8h, 0A5AAh
data_252	dw	2520h, 0D31h
data_253	dw	1A0Ah, 0A58Dh
data_254	dw	0E0AFh, 0A2A0h
data_255	dw	0ABA8h, 0ADECh
data_256	dw	0A9EBh, 4320h
data_257	dw	4D4Fh, 414Dh
data_258	dw	444Eh, 432Eh
data_259	dw	4D4Fh, 0A0Dh
data_260	dw	8222h, 0E2E1h
data_261	dw	0A2A0h, 0E2ECh
data_262	dw	20A5h, 0A8A4h
data_263	dw	0AAE1h, 0E120h
data_264	dw	2520h, 2031h
data_265	dw	20A2h, 0A8A4h
data_266	dw	0AAE1h, 0A2AEh
data_267	dw	0A4AEh, 2520h
data_268	dw	0D32h, 1A0Ah
data_269	dw	0A08Dh, 0ACA6h
data_270	dw	0E2A8h, 20A5h
data_271	dw	0EEABh, 0E3A1h
data_272	dw	20EEh, 0ABAAh
data_273	dw	0A2A0h, 0E8A8h
data_274	dw	2EE3h, 2E2Eh
data_275	dw	0A0Dh, 0D39h
data_276	dw	8F0Ah, 0A5E0h
data_278	dw	0E0AAh, 0E2A0h
data_280	dw	0E2A8h, 20ECh
data_281	dw	0EBA2h, 0AEAFh
data_282	dw	0ADABh, 0ADA5h
data_283	dw	0A5A8h, 0AF20h
data_284	dw	0AAA0h, 0E2A5h
data_285	dw	0AEADh, 0AEA3h
data_286	dw	0A720h, 0A4A0h
data_287	dw	0ADA0h, 0EFA8h
data_288	dw	5B20h, 2859h
data_289	dw	0A0A4h, 2F29h
		dec	si
		sub	data_671[di],ch		; (020C:E2A5=48h)
		sub	[di+3Fh],bx
		sbb	data_205[di],cx		; (020C:20A5=2020h)
;*		jcxz	loc_234			;*Jump if cx=0
		db	0E3h,0A4h
		mov	al,data_671		; (020C:E2A5=48h)
;*		loopz	locloop_237		;*Loop if zf=1, cx>0
  
		db	0E1h,0EFh
		and	[bp+si-5015h],ah
		scasb				; Scan es:[di] for al
  
locloop_239:
		stosw				; Store ax to es:[di]
		lodsw				; String [si] to ax
		test	al,0E2h
		in	al,dx			; port 0BF04h
		and	[di],ah
		xor	[di],cx
  
locloop_240:
		or	dl,[si]
  
locloop_241:
		db	8Eh
		call	sub_158			; (C989)
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[0A220h]	; (94E8:A220=20h)
		and	[di+58h],al
  
locloop_242:
		inc	bp
		sub	ax,0A0E4h
		test	ax,0A5ABh
		or	ax,210Ah
		db	8Fh
;*		loopnz	locloop_235		;*Loop if zf=0, cx>0
  
		db	0E0h,0AEh
		mov	word ptr ds:[0A0E0h],ax	; (94E8:A0E0=4F44h)
		lodsb				; String [si] to al
		lodsb				; String [si] to al
data_290	db	0A0h
data_291	dw	0AD20h
		movsw				; Mov [si] to es:[di]
		and	bl,ah
		lodsb				; String [si] to al
		movsw				; Mov [si] to es:[di]
		jmp	loc_2201		; (CDA5)
		loop	locloop_242		; Loop if cx > 0
  
		out	dx,ax			; port 0BF86h
loc_243:
		and	[bp+si-50E0h],ah
		mov	al,byte ptr ds:[0EFACh]	; (94E8:EFAC=0)
;*		loop	locloop_236		;*Loop if cx > 0
  
		db	0E2h,0A8h
		or	ax,230Ah
		or	ax,8D0Ah
		movsw				; Mov [si] to es:[di]
		loop	locloop_248		; Loop if cx > 0
  
;*		loopz	locloop_238		;*Loop if zf=1, cx>0
  
		db	0E1h,0A2h
		scasb				; Scan es:[di] for al
		mov	ax,word ptr ds:[0A4AEh]	; (94E8:A4AE=445Ch)
		lodsw				; String [si] to ax
		jmp	short loc_243		; (2808)
		and	byte ptr ds:[0E1A5h][si],ah	; (94E8:E1A5=0)
		stosb				; Store al to es:[di]
		loopnz	locloop_239		; Loop if zf=0, cx>0
  
		scasw				; Scan es:[di] for ax
		loop	locloop_240		; Loop if cx > 0
  
		loopnz	locloop_241		; Loop if zf=0, cx>0
  
  
locloop_246:
		mov	byte ptr ds:[0E420h],al	; (94E8:E420=0)
		mov	al,byte ptr ds:[0ABA9h]	; (94E8:ABA9=0)
		scasb				; Scan es:[di] for al
		mov	byte ptr ds:[0AD24h],al	; (94E8:AD24=0)
		movsw				; Mov [si] to es:[di]
  
locloop_248:
		scasw				; Scan es:[di] for ax
		loopnz	locloop_241		; Loop if zf=0, cx>0
  
		mov	byte ptr ds:[0ABA8h],al	; (94E8:ABA8=0)
		in	al,dx			; port 0BF86h
		lodsw				; String [si] to ax
		mov	al,byte ptr ds:[20EFh]	; (94E8:20EF=6)
		stosb				; Store al to es:[di]
		scasb				; Scan es:[di] for al
  
locloop_249:
		lodsb				; String [si] to al
		mov	al,byte ptr ds:[0A4ADh]	; (94E8:A4AD=53h)
		mov	al,byte ptr ds:[0A820h]	; (94E8:A820=0)
		stosw				; Store ax to es:[di]
		test	al,20h			; ' '
		test	al,0ACh
		out	dx,ax			; port 0BF86h
		and	ah,ah
  
locloop_250:
		mov	al,byte ptr ds:[0ABA9h]	; (94E8:ABA9=0)
		mov	al,byte ptr ds:[0A0Dh]	; (94E8:0A0D=2)
		or	al,8Dh
		movsw				; Mov [si] to es:[di]
		loop	locloop_253		; Loop if cx > 0
  
		movsb				; Mov [si] to es:[di]
		scasb				; Scan es:[di] for al
		loopz	locloop_249		; Loop if zf=1, cx>0
  
;*		jcxz	loc_244			;*Jump if cx=0
		db	0E3h,0AFh
		mov	al,byte ptr ds:[1D20h]	; (94E8:1D20=6)
		or	ax,8E0Ah
		call	sub_159			; (CA18)
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[0AF20h]	; (94E8:AF20=0)
;*		loopnz	locloop_245		;*Loop if zf=0, cx>0
  
		db	0E0h,0A8h
		and	[bp+si-5B15h],ah
		movsw				; Mov [si] to es:[di]
		stosw				; Store ax to es:[di]
		movsw				; Mov [si] to es:[di]
  
locloop_251:
		lodsw				; String [si] to ax
  
locloop_252:
		test	al,0A8h
		and	byte ptr ds:[0ACA0h][bx],ch	; (94E8:ACA0=0)
		out	dx,ax			; port 0BF86h
		loop	locloop_246		; Loop if cx > 0
  
		cmp	[di],cx
		or	cl,byte ptr ds:[20A5h][di]	; (94E8:20A5=0BFh)
;*		jcxz	loc_247			;*Jump if cx=0
		db	0E3h,0A4h
		mov	al,byte ptr ds:[0E2A5h]	; (94E8:E2A5=0)
  
locloop_255:
;*		loopz	locloop_254		;*Loop if zf=1, cx>0
  
		db	0E1h,0EFh
		and	byte ptr ds:[0A3A0h][bx],ah	; (94E8:A3A0=0)
		loopnz	locloop_251		; Loop if zf=0, cx>0
  
		cmpsw				; Cmp [si] to es:[di]
		test	al,0E2h
		in	al,dx			; port 0BF86h
		and	[bp+di+4Fh],al
		dec	bp
		dec	bp
  
locloop_257:
		inc	cx
  
locloop_258:
		dec	si
		inc	sp
		db	2Eh
		inc	bx
		dec	di
		dec	bp
		sub	al,20h			; ' '
		loopz	locloop_250		; Loop if zf=1, cx>0
  
		loopz	locloop_255		; Loop if zf=1, cx>0
  
		movsw				; Mov [si] to es:[di]
		lodsb				; String [si] to al
		mov	al,byte ptr ds:[0AE20h]	; (94E8:AE20=0)
  
locloop_259:
;*		loopz	locloop_256		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		mov	al,byte ptr ds:[0AEADh]	; (94E8:AEAD=0)
		mov	byte ptr ds:[0A5ABh],al	; (94E8:A5AB=0)
  
locloop_260:
		lodsw				; String [si] to ax
		mov	al,byte ptr ds:[0A0Dh]	; (94E8:0A0D=2)
		aaa				; Ascii adjust
		or	ax,8D0Ah
		movsw				; Mov [si] to es:[di]
		and	bl,ah
		movsb				; Mov [si] to es:[di]
		mov	al,byte ptr ds:[0E2A5h]	; (94E8:E2A5=0)
		loopz	locloop_260		; Loop if zf=1, cx>0
  
  
locloop_262:
		and	byte ptr ds:[0AFA0h][bx],ah	; (94E8:AFA0=0)
		jcxz	locloop_259		; Jump if cx=0
  
locloop_263:
		loop	locloop_252		; Loop if cx > 0
  
;*		loop	locloop_261		;*Loop if cx > 0
  
		db	0E2h,0ECh
		and	[bp+di+4Fh],al
		dec	bp
		dec	bp
		inc	cx
		dec	si
		inc	sp
		db	2Eh
		inc	bx
  
locloop_264:
		dec	di
		dec	bp
		sub	al,20h			; ' '
		cmpsw				; Cmp [si] to es:[di]
		mov	al,byte ptr ds:[0A5A2h]	; (94E8:A5A2=0)
		loopnz	locloop_263		; Loop if zf=0, cx>0
  
  
locloop_265:
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		test	al,0A5h
		and	al,ah
		mov	al,byte ptr ds:[0AEA1h]	; (94E8:AEA1=0)
		loop	locloop_264		; Loop if cx > 0
  
loc_266:
		or	ax,3B0Ah
		or	ax,8F0Ah
		loopnz	locloop_258		; Loop if zf=0, cx>0
  
		loopnz	locloop_257		; Loop if zf=0, cx>0
  
		mov	al,byte ptr ds:[20ADh]	; (94E8:20AD=89h)
		scasw				; Scan es:[di] for ax
		loopnz	locloop_259		; Loop if zf=0, cx>0
  
		out	0A5h,al			; port 0A5h
		loopz	locloop_265		; Loop if zf=1, cx>0
  
		and	[bp+si-1F5Bh],ah
		in	ax,0ADh			; port 0ADh
		movsw				; Mov [si] to es:[di]
		mov	word ptr ds:[20AEh],ax	; (94E8:20AE=816h)
		jcxz	loc_266			; Jump if cx=0
		scasb				; Scan es:[di] for al
		mov	byte ptr ds:[0EFADh],al	; (94E8:EFAD=0)
		sub	al,20h			; ' '
		scasw				; Scan es:[di] for ax
		loopnz	locloop_262		; Loop if zf=0, cx>0
  
		movsb				; Mov [si] to es:[di]
		scasb				; Scan es:[di] for al
		stosw				; Store ax to es:[di]
		cmpsb				; Cmp [si] to es:[di]
		movsw				; Mov [si] to es:[di]
  
locloop_268:
		lodsw				; String [si] to ax
		test	al,0A5h
		and	byte ptr ds:[0A2A5h][di],ch	; (94E8:A2A5=0)
		scasb				; Scan es:[di] for al
		cmpsw				; Cmp [si] to es:[di]
		lodsb				; String [si] to al
		scasb				; Scan es:[di] for al
		cmpsb				; Cmp [si] to es:[di]
		lodsw				; String [si] to ax
		scasb				; Scan es:[di] for al
		or	ax,20Ah
		or	ax,580Ah
;*		pop	cs			; Dangerous 8088 only
		db	0Fh
		add	[bx+si],ax
		xchg	cx,[si]
		add	[bx+si],ax
		pop	ax
loc_269:
;*		pop	cs			; Dangerous 8088 only
		db	0Fh
		add	[bx+si],ax
		add	[bx+si],al
		add	[bx+si],al
		mov	[bx+di],ax
		adc	[si],al
  
locloop_271:
		pop	ss
		db	8Eh
		call	sub_160			; (CAF9)
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[0A720h]	; (94E8:A720=0)
  
locloop_272:
		mov	al,byte ptr ds:[0A8E9h]	; (94E8:A8E9=0)
;*		loop	locloop_270		;*Loop if cx > 0
  
		db	0E2h,0EBh
		and	[bp+20E2h],ch
		cmpsw				; Cmp [si] to es:[di]
		mov	al,byte ptr ds:[0A8AFh]	; (94E8:A8AF=0)
  
locloop_274:
;*		loopz	locloop_267		;*Loop if zf=1, cx>0
  
		db	0E1h,0A8h
		pop	ss
		lea	sp,[di-1F51h]		; Load effective addr
		mov	al,byte ptr ds:[0A8A2h]	; (94E8:A8A2=0)
  
locloop_275:
		stosw				; Store ax to es:[di]
		in	al,dx			; port 0BF86h
loc_276:
		lodsw				; String [si] to ax
		scasb				; Scan es:[di] for al
		movsw				; Mov [si] to es:[di]
		and	bl,ah
;*		loopz	locloop_273		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		loopnz	locloop_268		; Loop if zf=0, cx>0
  
		test	ax,0E2E1h
		mov	byte ptr ds:[0EAEh],al	; (94E8:0EAE=0E3h)
		lea	sp,[di+20E2h]		; Load effective addr
		mov	word ptr ds:[0E2AEh],ax	; (94E8:E2AE=0)
		scasb				; Scan es:[di] for al
		mov	byte ptr ds:[0AEADh],al	; (94E8:AEAD=0)
		loopz	locloop_275		; Loop if zf=1, cx>0
  
		test	al,20h			; ' '
		lea	sp,[di-1F51h]		; Load effective addr
		mov	al,byte ptr ds:[0A8A2h]	; (94E8:A8A2=0)
		stosw				; Store ax to es:[di]
		in	al,dx			; port 0BF86h
		lodsw				; String [si] to ax
		jmp	short loc_269		; (2941)
		and	byte ptr ds:[0AFA0h][bx],ah	; (94E8:AFA0=0)
  
locloop_280:
		loopnz	locloop_271		; Loop if zf=0, cx>0
  
		loopz	locloop_284		; Loop if zf=1, cx>0
  
		stosb				; Store al to es:[di]
loc_281:
		and	bl,ah
;*		loopz	locloop_278		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		loopnz	locloop_272		; Loop if zf=0, cx>0
  
		test	ax,0E2E1h
		mov	byte ptr ds:[0FE3h],al	; (94E8:0FE3=80h)
		db	8Eh
		call	sub_161			; (CB59)
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[0A220h]	; (94E8:A220=20h)
		and	byte ptr ds:[0ADA0h][si],ah	; (94E8:ADA0=0)
		lodsw				; String [si] to ax
		jmp	short loc_281		; (29A1)
		sub	cx,word ptr ds:[0AFA5h][di]	; (94E8:AFA5=4B01h)
  
locloop_284:
		loopnz	locloop_274		; Loop if zf=0, cx>0
  
		mov	byte ptr ds:[0ABA8h],al	; (94E8:ABA8=0)
		in	al,dx			; port 0BF86h
		lodsw				; String [si] to ax
		jmp	short loc_276		; (296E)
		and	byte ptr ds:[0A3E0h][bx+si],ah	; (94E8:A3E0=0)
;*		jcxz	locloop_277		;*Jump if cx=0
		db	0E3h,0ACh
  
locloop_287:
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
  
locloop_288:
;*		loop	locloop_283		;*Loop if cx > 0
  
		db	0E2h,0EBh
		and	byte ptr ds:[0AFA0h][bx],ah	; (94E8:AFA0=0)
;*		loopnz	locloop_278		;*Loop if zf=0, cx>0
  
		db	0E0h,0AEh
;*		loopz	locloop_277		;*Loop if zf=1, cx>0
  
		db	0E1h,0A0h
		and	[bp+si-1CE0h],ch
;*		loopz	locloop_285		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
;*		loopnz	locloop_279		;*Loop if zf=0, cx>0
  
		db	0E0h,0AEh
		test	ax,0E2E1h
		mov	byte ptr ds:[0DE3h],al	; (94E8:0DE3=2)
		db	8Eh
		call	sub_162			; (CB95)
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[0AF20h]	; (94E8:AF20=0)
		scasb				; Scan es:[di] for al
		test	al,0E1h
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[8D19h]	; (94E8:8D19=0AFh)
		movsw				; Mov [si] to es:[di]
		scasw				; Scan es:[di] for ax
		loopnz	locloop_280		; Loop if zf=0, cx>0
  
  
locloop_289:
		mov	byte ptr ds:[0ABA8h],al	; (94E8:ABA8=0)
		in	al,dx			; port 0BF86h
		lodsw				; String [si] to ax
;*		jmp	short loc_282		;*(29AC)
		db	0EBh,0A9h
		and	dl,ah
		test	al,0AFh
		and	byte ptr ds:[0E1AEh][di],ch	; (94E8:E1AE=0)
		test	al,0E2h
		movsw				; Mov [si] to es:[di]
		stosw				; Store ax to es:[di]
		out	dx,ax			; port 0BF86h
		adc	byte ptr ds:[0AAA5h][bx+di],dl	; (94E8:AAA5=0)
;*		loop	locloop_286		;*Loop if cx > 0
  
		db	0E2h,0AEh
data_292	dw	20E0h
		lodsw				; String [si] to ax
		movsw				; Mov [si] to es:[di]
		and	byte ptr ds:[0A9A0h][di],ch	; (94E8:A9A0=0)
data_295	db	0A4h
data_296	db	0A5h
		lodsw				; String [si] to ax
		adc	ax,2082h
data_298	dw	0E0AFh
data_299	db	0A8h
		lodsw				; String [si] to ax
		loop	locloop_287		; Loop if cx > 0
  
		loopnz	locloop_288		; Loop if zf=0, cx>0
  
		and	byte ptr ds:[0E2A5h][di],ch	; (94E8:E2A5=0)
		and	byte ptr ds:[0ACE3h][bx+di],ah	; (94E8:ACE3=0)
		mov	al,byte ptr ds:[0A8A3h]	; (94E8:A8A3=0)
		adc	[bp-5718h],cx
		mov	ax,word ptr ds:[0A0AAh]	; (94E8:A0AA=4944h)
data_306	dw	0AF20h
data_307	dw	0A8E0h
data_308	dw	0A720h
data_309	dw	0AFA0h
		test	al,0E1h
		test	al,11h
data_310	dw	0E88Eh
data_311	dw	0A1A8h
  
locloop_294:
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[0AF20h]	; (94E8:AF20=0)
		loopnz	locloop_289		; Loop if zf=0, cx>0
  
		and	bh,ah
;*		loop	locloop_290		;*Loop if cx > 0
  
		db	0E2h,0A5h
		lodsw				; String [si] to ax
		test	al,0A8h
		adc	cl,[bp-165Fh]
		test	al,0A9h
		and	cl,ah
data_315	dw	0AEA1h
data_316	dw	20A9h
data_317	dw	0A8E1h
  
locloop_296:
data_318	dw	0E2E1h
data_319	dw	0ACA5h
data_320	dw	24EBh
		lea	sp,[bx+si-1C20h]	; Load effective addr
		call	sub_164			; (D81B)
data_322	db	0A8h
data_323	db	0A5h
data_324	db	20h
loc_298:
data_325	db	0E0h
data_326	db	0A5h
  
locloop_299:
		cmpsb				; Cmp [si] to es:[di]
data_327	db	0A8h
data_328	db	0ACh
data_329	db	0A0h
data_330	db	20h
		loopz	$-50h			; Loop if zf=1, cx>0
  
data_331	dw	0ACA2h
data_332	dw	0E1A5h
		loop	$-51h			; Loop if cx > 0
  
data_333	dw	0A3AEh
		scasb				; Scan es:[di] for al
		and	byte ptr ds:[0E1AEh][si],ah	; (94E8:E1AE=0)
data_334	dw	0E3E2h
		scasw				; Scan es:[di] for ax
		mov	al,byte ptr ds:[8D14h]	; (94E8:8D14=0E2h)
		mov	al,byte ptr ds:[0E3E0h]	; (94E8:E3E0=0)
		call	sub_165			; (D840)
		test	al,0A5h
		and	byte ptr ds:[0AEABh][bx+di],ah	; (94E8:AEAB=0)
		stosb				; Store al to es:[di]
		test	al,0E0h
		scasb				; Scan es:[di] for al
		mov	byte ptr ds:[0A8AAh],al	; (94E8:A8AA=0)
		sbb	byte ptr ds:[0AFA5h][di],cl	; (94E8:AFA5=1)
		loopnz	locloop_294		; Loop if zf=0, cx>0
  
		mov	byte ptr ds:[0ABA8h],al	; (94E8:ABA8=0)
		in	al,dx			; port 0BF86h
  
locloop_305:
		lodsw				; String [si] to ax
		mov	al,byte ptr ds:[20EFh]	; (94E8:20EF=6)
  
locloop_306:
;*		loopz	locloop_295		;*Loop if zf=1, cx>0
  
		db	0E1h,0ACh
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		mov	al,byte ptr ds:[0A420h]	; (94E8:A420=0)
		test	al,0E1h
		stosb				; Store al to es:[di]
		mov	al,byte ptr ds:[8D27h]	; (94E8:8D27=0E1h)
		movsw				; Mov [si] to es:[di]
		movsb				; Mov [si] to es:[di]
		scasb				; Scan es:[di] for al
;*		loopz	locloop_302		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		jcxz	loc_298			; Jump if cx=0
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		and	[bp+43h],al
		inc	dx
		and	[bx+si],ch
		mov	ax,word ptr ds:[0AEABh]	; (94E8:AEAB=0)
		stosb				; Store al to es:[di]
		and	bl,ah
  
locloop_308:
		scasw				; Scan es:[di] for ax
		loopnz	locloop_299		; Loop if zf=0, cx>0
  
		mov	byte ptr ds:[0A5ABh],al	; (94E8:A5AB=0)
		lodsw				; String [si] to ax
		test	al,0EFh
		and	ah,ah
		mov	al,byte ptr ds:[0ABA9h]	; (94E8:ABA9=0)
		scasb				; Scan es:[di] for al
		lodsb				; String [si] to al
		sub	[bx+di],bx
		nop
		movsw				; Mov [si] to es:[di]
;*		loopz	locloop_307		;*Loop if zf=1, cx>0
  
		db	0E1h,0E3h
;*		loopnz	locloop_307		;*Loop if zf=0, cx>0
  
		db	0E0h,0E1h
		jmp	short loc_313		; (2B12)
;*		loopz	locloop_301		;*Loop if zf=1, cx>0
  
		db	0E1h,0A8h
		loopz	locloop_308		; Loop if zf=1, cx>0
  
		movsw				; Mov [si] to es:[di]
		lodsb				; String [si] to al
		jmp	short loc_314		; (2B1A)
		test	al,0E1h
		out	0A5h,ax			; port 0A5h
  
locloop_311:
;*		loopnz	locloop_304		;*Loop if zf=0, cx>0
  
		db	0E0h,0AFh
		mov	al,byte ptr ds:[0EBADh]	; (94E8:EBAD=0)
data_337	dw	8D1Eh			; Data table (indexed access)
		movsw				; Mov [si] to es:[di]
		loopz	locloop_306		; Loop if zf=1, cx>0
  
		scasb				; Scan es:[di] for al
;*		loop	locloop_303		;*Loop if cx > 0
  
		db	0E2h,0A2h
  
locloop_312:
		movsw				; Mov [si] to es:[di]
;*		loop	locloop_309		;*Loop if cx > 0
  
		db	0E2h,0E1h
		loop	locloop_305		; Loop if cx > 0
  
		test	al,0A5h
loc_313:
		and	[bp+si-5B52h],ch
		scasb				; Scan es:[di] for al
		mov	byte ptr ds:[0E5EBh],al	; (94E8:E5EB=0)
loc_314:
		and	cl,ah
		loop	locloop_311		; Loop if cx > 0
  
loc_315:
		mov	al,byte ptr ds:[0A8ADh]	; (94E8:A8AD=0)
		out	1Dh,al			; port 1Dh
		lea	sp,[di-515Ch]		; Load effective addr
		loopz	locloop_312		; Loop if zf=1, cx>0
  
  
locloop_317:
		mov	al,byte ptr ds:[0AEE2h]	; (94E8:AEE2=0)
		out	0ADh,ax			; port 0ADh
		scasb				; Scan es:[di] for al
		and	[bp+si-5A5Eh],ah
		movsb				; Mov [si] to es:[di]
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		lodsw				; String [si] to ax
		jmp	short loc_315		; (2B1E)
		and	byte ptr ds:[0ADA0h][si],ah	; (94E8:ADA0=0)
		lodsw				; String [si] to ax
;*		jmp	short loc_316		;*(2B25)
		db	0EBh,0E5h
		sbb	cx,word ptr ds:[0A4A5h][di]	; (94E8:A4A5=4C50h)
		scasb				; Scan es:[di] for al
		loopz	locloop_317		; Loop if zf=1, cx>0
  
		mov	al,byte ptr ds:[0AEE2h]	; (94E8:AEE2=0)
		out	0ADh,ax			; port 0ADh
		scasb				; Scan es:[di] for al
		and	byte ptr ds:[0E1A5h][si],ch	; (94E8:E1A5=0)
;*		loop	locloop_310		;*Loop if cx > 0
  
		db	0E2h,0A0h
		and	byte ptr ds:[20A0h][di],ch	; (94E8:20A0=56h)
		movsb				; Mov [si] to es:[di]
		test	al,0E1h
		stosb				; Store al to es:[di]
		movsw				; Mov [si] to es:[di]
		or	al,9
		and	al,9
		cmp	al,9
		dec	bx
		or	[si+9],bp
		jl	loc_318			; Jump if <
		test	al,9
		mov	dh,9
		ror	byte ptr [bx+di],1	; Rotate
		loopz	locloop_319		; Loop if zf=1, cx>0
  
		db	0F7h
loc_318:
		or	[bx+di],cx
		or	bl,[bp+di]
		or	ch,byte ptr ds:[530Ah]	; (94E8:530A=69h)
  
locloop_319:
		or	ch,[bx+si+0Ah]
		or	word ptr [bp+si],0AA9h
		retn
		or	ah,dl
		or	al,[bx+si]
		or	bx,[bx+si]
		xchg	ax,cx
		stosw				; Store ax to es:[di]
		test	al,0E8h
		stosb				; Store al to es:[di]
		scasb				; Scan es:[di] for al
		lodsb				; String [si] to al
		and	[si+4Dh],ch
		nop				;*ASM fixup - displacement
		add	[bx],al
		add	data_665[bx],ch		; (020C:E0A0=46h)
		mov	al,data_616		; (020C:A5AC=63h)
;*		loop	locloop_320		;*Loop if cx > 0
  
		db	0E2h,0E0h
		scasb				; Scan es:[di] for al
		mov	byte ptr data_72+3,al	; (020C:0021=0A3h)
		add	[bx+si],ax
  
locloop_321:
		add	[bx+si],al
		add	[bx+si],al
		add	ah,al
data_338	dw	0Ch
data_339	dw	0FF00h
		db	0FFh,0FFh,0FFh,0FFh,0FFh
data_341	db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		inc	word ptr [bp+di+3Ah]
		pop	sp
		push	di
		dec	cx
		dec	si
		inc	sp
		dec	di
		push	di
		push	bx
		pop	sp
		push	sp
		inc	bp
		dec	bp
		push	ax
		pop	sp
		jnc	loc_326			; Jump if carry=0
		jnc	loc_325			; Jump if carry=0
		cmp	data_569,bp		; (020C:6D74=5D07h)
		jo	loc_322			; Jump if overflow=1
loc_322:
		db	25 dup (0)
data_343	db	0
		add	[bx+si],al
data_345	db	0
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		loopnz	locloop_321		; Loop if zf=0, cx>0
  
		lodsb				; String [si] to al
		movsw				; Mov [si] to es:[di]
;*		loop	locloop_323		;*Loop if cx > 0
  
		db	0E2h,0E0h
		mov	al,data_602		; (020C:A220=2Ah)
;*		jmp	short loc_324		;*(2BF1)
		db	0EBh,0E5h
		scasb				; Scan es:[di] for al
		movsb				; Mov [si] to es:[di]
		test	al,0E2h
		dec	bp
		adc	[si],al
		inc	sp
		add	al,ah
		movsw				; Mov [si] to es:[di]
loc_325:
		movsb				; Mov [si] to es:[di]
		movsw				; Mov [si] to es:[di]
		stosw				; Store ax to es:[di]
		jmp	short loc_327		; (2C3C)
		movsb				; Mov [si] to es:[di]
		scasb				; Scan es:[di] for al
		scasw				; Scan es:[di] for ax
		jcxz	loc_328			; Jump if cx=0
		dec	di
		dec	bp
		push	bx
		push	ax
		inc	bp
		inc	bx
		cmp	ax,3A43h
		pop	sp
		push	di
		dec	cx
		dec	si
		inc	sp
		dec	di
		push	di
		push	bx
		pop	sp
		push	bx
		pop	cx
loc_326:
		push	bx
		push	sp
		inc	bp
		dec	bp
		xor	si,[bp+si]
		pop	sp
loc_327:
data_346	db	'COMMAND.COM', 0
		db	'ALLUSERSPROFILE=C:\DOCUME~1\'
loc_328:
data_350	db	'ALLUSE~1', 0
		db	'APPDATA=C:\DOCUME~1\9335~1\APPLI'
		db	'C~1', 0
		db	'CLIENTNAME=Console', 0
		db	'COMMONPROGRAMFILES=C:\PROGRA~1\C'
		db	'OMMON~1', 0
		db	'COMPUTERNAME=2F30', 0
		db	'FP_NO_HOST_CHECK=NO', 0
		db	'HOMEDRIVE=C:', 0
		db	'HOMEPATH=\Documents and Settings'
		db	'\_'
		std				; Set direction flag
		mov	di,2DF0h
           lock	mov	ax,data_593		; (020C:A0A2=2C40h)
		jmp	word ptr [bp+si-5FAEh]
		add	[si+4Fh],cl
		db	'GONSERVER=\\2F30', 0
		db	'NUMBER_OF_PROCESSORS=2', 0
		db	'O'
data_353	dw	3D53h
		push	di
		db	69h
		db	6Eh
		db	64h
		db	6Fh
		ja	$+75h			; Jump if above
		pop	di
		dec	si
		push	sp
		add	[bx+si+41h],dl
		push	sp
		dec	ax
		cmp	ax,3A43h
		pop	sp
		push	ax
		push	dx
		dec	di
		inc	di
		push	dx
		inc	cx
		jle	$+33h			; Jump if < or =
		pop	sp
		push	ax
		inc	cx
		push	dx
		inc	cx
		dec	sp
		dec	sp
		jle	$+33h			; Jump if < or =
		pop	sp
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_32		proc	near
		push	ax
		inc	cx
data_354	dw	4152h
data_355	dw	4C4Ch
data_356	dw	317Eh
data_357	dw	415Ch
data_358	dw	5050h
		dec	sp
data_359	db	49h
		inc	bx
data_360	db	7Eh
data_361	db	31h
data_362	dw	433Bh
data_363	db	3Ah
data_364	dw	575Ch
data_365	dw	4E49h
		inc	sp
		dec	di
		push	di
		push	bx
		pop	sp
		jnc	$+7Bh			; Jump if carry=0
		jnc	$+76h			; Jump if carry=0
		db	65h
		db	6Dh
		xor	si,[bp+si]
		cmp	ax,[bp+di+3Ah]
		pop	sp
		push	di
		dec	cx
		dec	si
		inc	sp
		dec	di
		push	di
		push	bx
data_366	dw	433Bh
data_367	dw	5C3Ah
		push	di
		dec	cx
data_368	dw	444Eh
		dec	di
		push	di
data_369	dw	5C53h
data_370	db	'System32\Wbem', 0
		push	ax
		inc	cx
		push	sp
		dec	ax
		inc	bp
		pop	ax
		push	sp
		cmp	ax,432Eh
		dec	di
		dec	bp
		cmp	bp,word ptr ds:[5845h]	; (020C:5845=0FA80h)
		inc	bp
		cmp	bp,word ptr ds:[4142h]	; (020C:4142=260Ah)
		push	sp
		cmp	bp,word ptr ds:[4D43h]	; (020C:4D43=0B315h)
		inc	sp
		cmp	bp,word ptr ds:[4256h]	; (020C:4256=274h)
		push	bx
		cmp	bp,word ptr ds:[4256h]	; (020C:4256=274h)
		inc	bp
		cmp	bp,word ptr ds:[534Ah]	; (020C:534A=448Ah)
		cmp	bp,word ptr ds:[534Ah]	; (020C:534A=448Ah)
		inc	bp
		cmp	bp,word ptr ds:[5357h]	; (020C:5357=644h)
		inc	si
		cmp	bp,word ptr ds:[5357h]	; (020C:5357=644h)
		dec	ax
		add	[bx+si+52h],dl
		dec	di
		inc	bx
		inc	bp
		push	bx
		push	bx
		dec	di
		push	dx
		pop	di
		inc	cx
		push	dx
		inc	bx
		dec	ax
		dec	cx
		push	sp
		inc	bp
		inc	bx
		push	sp
		push	bp
		push	dx
		inc	bp
		cmp	ax,3878h
		add	ss:[bx+si+52h],dl
		dec	di
		inc	bx
		inc	bp
		push	bx
		push	bx
		dec	di
		push	dx
		pop	di
		dec	cx
		inc	sp
		inc	bp
		dec	si
		push	sp
		dec	cx
		inc	si
		dec	cx
		inc	bp
		push	dx
		cmp	ax,3878h
		db	36h
		and	[bp+61h],al
		db	6Dh
		db	69h
		db	6Ch
		jns	$+22h			; Jump if not sign
		and	ss:[di+6Fh],cl
		db	64h
		db	65h
		db	6Ch
		and	[bx+di],dh
		xor	al,32h			; '2'
		and	[bp+di+74h],dl
		db	65h
		jo	$+72h			; Jump if overflow=1
		db	69h
		db	6Eh
		db	67h
		and	[bx+di],bh
		sub	al,20h			; ' '
		inc	di
		db	65h
		db	6Eh
		jnz	$+6Bh			; Jump if not zero
		db	6Eh
		db	65h
		dec	cx
		db	6Eh
		jz	$+67h			; Jump if zero
		db	6Ch
		add	[bx+si+52h],dl
		dec	di
		inc	bx
		inc	bp
		push	bx
		push	bx
		dec	di
		push	dx
		pop	di
		dec	sp
		inc	bp
		push	si
		inc	bp
		dec	sp
		cmp	ax,36h
		push	ax
		push	dx
		dec	di
		inc	bx
		inc	bp
		push	bx
		push	bx
		dec	di
		push	dx
data_371	db	'_REVISION=8e09', 0
		push	ax
		push	dx
		dec	di
		inc	di
		push	dx
		inc	cx
		dec	bp
		inc	si
		dec	cx
		dec	sp
		inc	bp
		push	bx
		cmp	ax,3A43h
		pop	sp
		push	ax
		push	dx
		dec	di
		inc	di
		push	dx
		inc	cx
		jle	$+33h			; Jump if < or =
		add	[bx+si+52h],dl
		dec	di
		dec	bp
		push	ax
		push	sp
		cmp	ax,5024h
		and	al,47h			; 'G'
data_372	db	0
data_373	db	53h
data_374	dw	5345h
data_375	dw	4953h
data_376	db	4Fh
data_377	db	4Eh
		dec	si
data_378	db	41h
data_379	db	4Dh
data_380	db	45h
data_381	db	3Dh
		inc	bx
data_382	db	6Fh
		db	6Eh
		jnc	$+71h			; Jump if carry=0
		db	6Ch
data_383	dw	65h
data_384	dw	5953h
		push	bx
		push	sp
data_385	db	45h
		dec	bp
data_386	db	44h
data_387	dw	4952h
data_388	db	56h
data_389	dw	3D45h
data_391	dw	3A43h
data_393	dw	5300h
		pop	cx
		push	bx
data_394	dw	4554h
		dec	bp
		push	dx
		dec	di
		dec	di
		push	sp
		cmp	ax,3A43h
		pop	sp
		push	di
data_396	dw	4E49h
		inc	sp
		dec	di
data_397	dw	5357h
		add	[si+45h],dl
		dec	bp
		push	ax
		cmp	ax,3A43h
data_399	dw	575Ch
data_400	dw	4E49h
data_401	dw	4F44h
data_402	dw	5357h
data_403	dw	545Ch
		inc	bp
		dec	bp
		push	ax
		add	[si+4Dh],dl
		push	ax
		cmp	ax,3A43h
		pop	sp
		push	di
		dec	cx
		dec	si
		inc	sp
		dec	di
		push	di
		push	bx
		pop	sp
		push	sp
		inc	bp
		dec	bp
		push	ax
		add	[di+53h],dl
		inc	bp
		push	dx
		inc	sp
		dec	di
		dec	bp
		inc	cx
		dec	cx
		dec	si
		cmp	ax,4632h
loc_329:
		xor	si,[bx+si]
		add	[di+53h],dl
		inc	bp
		push	dx
		dec	si
		inc	cx
		dec	bp
		inc	bp
		cmp	ax,0FD5Fh
		mov	di,2DF0h
           lock	mov	ax,data_593		; (020C:A0A2=2C40h)
		jmp	word ptr [bp+si-5FAEh]	;*
		add	[di+53h],dl
		db	'ERPROFILE=C:\DOCUME~1\9335~1', 0
		db	'BLASTER=A220 I5 D1 P330 T3'
		add	[bx+si],al
		jmp	short loc_329		; (2F21)
sub_32		endp
  
		and	[bp+si-5352h],ch
		scasw				; Scan es:[di] for ax
		scasb				; Scan es:[di] for al
		lodsw				; String [si] to ax
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		loop	locloop_333		; Loop if cx > 0
  
;*		loopz	locloop_330		;*Loop if zf=1, cx>0
  
		db	0E1h,0A8h
;*		loopz	locloop_331		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		movsw				; Mov [si] to es:[di]
		lodsb				; String [si] to al
		jmp	short loc_334		; (2FAB)
		lodsw				; String [si] to ax
		movsw				; Mov [si] to es:[di]
		and	bl,ah
;*		loopz	locloop_332		;*Loop if zf=1, cx>0
  
		db	0E1h,0E2h
		mov	al,data_640		; (020C:AEAD=0FFh)
		mov	data_615,al		; (020C:A5AB=0E9h)
		lodsw				; String [si] to ax
		popf				; Pop flags
		or	al,0B2h
		or	al,0C1h
		or	al,0D0h
		or	al,0EDh
		or	al,0FAh
  
locloop_333:
		or	al,12h
		or	ax,0D35h
		dec	cx
		or	ax,0D69h
		xchg	ax,cx
		or	ax,0DA5h
		retn
		or	ax,0
		xlat				; al=[al+[bx]] table
		or	ax,0DEEh
		push	cs
		push	cs
		and	byte ptr ds:[90Ch],cl	; (020C:090C=0Eh)
		and	al,9
		cmp	al,9
		dec	bx
		or	[si+9],bp
		jl	loc_335			; Jump if <
		test	al,9
		mov	dh,9
		ror	byte ptr [bx+di],1	; Rotate
		loopz	locloop_336		; Loop if zf=1, cx>0
  
		db	0F7h
loc_335:
		or	[bx+di],cx
		or	bl,[bp+di]
		or	ch,data_553		; (020C:530A=74h)
  
locloop_336:
		or	ch,[bx+si+0Ah]
		or	word ptr [bp+si],0AA9h
		retn
		or	ah,dl
		or	al,[bx+si]
		or	ax,[bx+si]
		db	79 dup (0)
		xor	cl,byte ptr ds:[0]	; (020C:0000=28h)
		nop				;*ASM fixup - sign extn byte
		inc	dx
		push	cs
		db	66h
		push	cs
		db	8Fh
		push	cs
		mov	bl,0Eh
		iret				; Interrupt return
		push	cs
		jcxz	loc_337			; Jump if cx=0
data_408	db	0F9h
data_409	db	0Eh
		push	cs
;*		pop	cs			; Dangerous 8088 only
		db	0Fh
		db	2Eh
;*		pop	cs			; Dangerous 8088 only
		db	0Fh
		add	[bx+si],al
		add	[bx+si],al
		mov	bx,7F7h
		cmp	al,2
		je	loc_338			; Jump if equal
		mov	bx,7B1h
		cmp	al,8
		je	loc_338			; Jump if equal
		mov	bx,4D9Ch
		dec	bp
		add	ax,39h
		mov	bx,81Ch
		cmp	al,5
		je	loc_338			; Jump if equal
		mov	bx,782h
		mov	si,4F43h
loc_338:
		db	'MSPEC=C:\WINDOWS\SYSTEM32\COMMAN'
		db	'D.COM', 0
		db	'ALLUSERSPROFILE=C:\DOCUME~1\ALLU'
		db	'SE~1', 0
		db	'APPDATA=C:\DOCUME~1\9335~1\APPLI'
		db	'C~1', 0
		db	'CLIENTNAME=Console', 0
		db	'COMMONPROGRAMFILES=C:\PROGRA~1\C'
		db	'OMMON~1', 0
		db	'COMPUTERNAME=2F30', 0
		db	'FP_NO_HOST_CHECK=NO', 0
		db	'HOMEDRIVE=C:', 0
		db	'HOMEPATH=\Documents and Settings'
		db	'\_'
		std				; Set direction flag
		mov	di,2DF0h
           lock	mov	ax,data_593		; (020C:A0A2=2C40h)
		jmp	word ptr [bp+si-5FAEh]
		add	[si+4Fh],cl
		db	'GONSERVER=\\2F30', 0
		db	'NUMBER_OF_PROCESSORS=2', 0
		db	'OS=Windows_NT', 0
		db	'PATH=C:\PROGRA~1\PARALL~1\PARALL'
		db	'~1\APPLIC~1;C:\WINDOWS\system32;'
		db	'C:\WINDOWS;C:\WINDOWS\System32\W'
		db	'bem', 0
		db	'PATHEXT=.COM;.EXE;.BAT;.CMD;.VBS'
		db	';.VBE;.JS;.JSE;.WSF;.WSH', 0
		db	'PROCESSOR_ARCHITECTURE=x86', 0
		db	'PROCESSOR_IDENTIFIER=x86 Family '
		db	'6 Model 142 Stepping 9, GenuineI'
		db	'ntel', 0
		db	'PROCESSOR_LEVEL=6', 0
		db	'PROCESSOR_REVISION=8e09', 0
		db	'PROGRAMFILES=C:\PROGRA~1', 0
		db	'PROMPT=$'
		db	'P$'
		db	'G', 0
		db	'SESSIONNAME=Console', 0
		db	'SYSTEMDRIVE=C:', 0
		db	'SYSTEMROOT=C:\WINDOWS', 0
		db	'TEMP=C:\WINDOWS\TEMP', 0
		db	'TMP=C:\WINDOWS\TEMP', 0
		db	'USERDOMAIN=2F30', 0
		db	'USERNAME=_'
		std				; Set direction flag
		mov	di,2DF0h
           lock	mov	ax,data_593		; (020C:A0A2=2C40h)
		jmp	word ptr [bp+si-5FAEh]
		add	[di+53h],dl
		db	'ERPROFILE=C:\DOCUME~1\9335~1', 0
		db	'BLASTER=A220 I5 D1 P330 T3'
		add	[bx+si],al
		add	[bx+si],ax
		db	'\\MAC\ALLFILES\APPL~WSI\OS\DROP~'
		db	'9U0\SR.EXE', 0
		add	di,[bp+si+72Dh]
		call	sub_35			; (3703)
		call	sub_34			; (33FE)
data_414	db	0C3h			; Data table (indexed access)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_34		proc	near
		mov	ax,5A07h
		dec	bp
		add	ax,9AB2h
		or	al,0CDh
		and	[bp+di+52h],dx
		add	[bx+si+2],bl
		mov	ax,3D00h
		int	20h			; Program Terminate
;*		call	dword ptr data_590[bx]	;*(020C:9A00=53B0h)  3 entries
		db	0FFh, 9Fh, 00h, 9Ah
		db	0F0h
		db	0FEh
		sbb	ax,0DEF0h
		add	[bx+si],dx
		add	al,4Bh			; 'K'
		add	[bx+si],dx
		add	al,56h			; 'V'
		add	[bx+si],dx
		add	al,10h
		add	al,1
		add	[bx+di],ax
		add	[bp+si],al
		db	15 dup (3)
		adc	ax,[di]
		xchg	ax,si
		add	al,0C9h
		push	ss
		adc	al,0
		sbb	[bx+si],al
		dec	bp
		add	ax,0FFFFh
		db	0FFh
		inc	word ptr [bx+si]
		add	[bx+si],al
		add	[di],al
		db	15 dup (0)
		int	21h			; DOS Services  ah=function 4Fh
						;  find next filename match
		retf				; Return far
sub_34		endp
  
		db	10 dup (0)
		db	11 dup (20h)
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],ah
		db	10 dup (20h)
		db	9 dup (0)
		or	ax,2020h
		and	[bp+di+45h],dl
		push	sp
		and	[bp+si+4Ch],al
		inc	cx
		push	bx
		push	sp
		inc	bp
		push	dx
		cmp	ax,3041h
		or	ax,0A8ADh
		movsw				; Mov [si] to es:[di]
		and	data_681[si],ah		; (020C:EFAB=0)
		and	data_618[bx+di],ah	; (020C:A7A2=0D9h)
		scasb				; Scan es:[di] for al
		mov	data_608,al		; (020C:A3AE=0E3h)
		scasb				; Scan es:[di] for al
		and	data_666[bx],ch		; (020C:E0AE=0BEh)
;*		loop	locloop_339		;*Loop if cx > 0
  
		db	0E2h,0A0h
		and	[bp+si-515Eh],ah
		movsb				; Mov [si] to es:[di]
		mov	al,data_603		; (020C:A22D=83h)
;*		jmp	short loc_340		;*(3466)
		db	0EBh,0A2h
		scasb				; Scan es:[di] for al
  
locloop_341:
		movsb				; Mov [si] to es:[di]
		mov	al,data_554		; (020C:5320=56h)
		inc	dx
		sub	al,20h			; ' '
		lodsw				; String [si] to ax
		mov	al,data_667		; (020C:E0AF=6Dh)
		test	al,0ACh
		movsw				; Mov [si] to es:[di]
		loopnz	locloop_342		; Loop if zf=0, cx>0
  
		or	ax,0DECh
		loopnz	locloop_341		; Loop if zf=0, cx>0
  
		movsw				; Mov [si] to es:[di]
		or	ax,0
		db	50 dup (0)
		db	'Sourcer - V Communications, Inc.'
		db	' Copyright 1988, 1989, 1990 V3.0'
		db	'7  s/n B116236By Frank van Gillu'
		db	'we & Geoff Caras (08/10/90,08:59'
		db	':59)'
		db	12 dup (0)
		dec	bp
		add	ax,28E8h
		add	[bx+si],al
		mov	word ptr cs:[90h],es	; (020C:0090=1FBFh)
		call	sub_98			; (7DC8)
;*		call	far ptr sub_253		;*(5DED:2FA0)
		db	 9Ah,0A0h, 2Fh,0EDh, 5Dh
		call	sub_97			; (7D8C)
;*		call	far ptr sub_254		;*(5DED:30F0)
		db	 9Ah,0F0h, 30h,0EDh, 5Dh
		mov	si,80h
		mov	di,140h
		add	di,si
		add	byte ptr cs:[100h][di],0CDh	; (020C:0100=28h)
		mov	cl,[si]
		or	cl,cl			; Zero ?
		jnz	loc_343			; Jump if not zero
		jmp	loc_359			; (372D)
loc_343:
		xor	ch,ch			; Zero register
		mov	si,81h
		push	cx
  
locloop_344:
		cmp	word ptr [si],2D20h
		je	loc_347			; Jump if equal
		cmp	word ptr es:[di],2F20h
		je	loc_347			; Jump if equal
loc_345:
		inc	si
		loop	locloop_344		; Loop if cx > 0
  
loc_346:
		jmp	loc_356			; (370D)
loc_347:
		inc	si
		dec	cx
		jcxz	loc_346			; Jump if cx=0
		inc	si
		dec	cx
		jnz	loc_348			; Jump if not zero
		jmp	loc_356			; (370D)
loc_348:
		mov	al,[si]
		and	al,0DFh
		cmp	al,56h			; 'V'
		jne	loc_349			; Jump if not equal
		mov	es:data_236,1		; (020C:2641=0)
		jmp	short loc_345		; (35E5)
loc_349:
		cmp	al,44h			; 'D'
		jne	loc_350			; Jump if not equal
		mov	byte ptr es:data_435,1	; (020C:38A9=48h)
		jmp	short loc_345		; (35E5)
loc_350:
		cmp	al,53h			; 'S'
		jne	loc_352			; Jump if not equal
		inc	si
		dec	cx
		jcxz	loc_351			; Jump if cx=0
		cmp	byte ptr [si],20h	; ' '
		je	loc_345			; Jump if equal
		mov	ax,[si]
		mov	es:data_160,ax		; (020C:1301=0)
		mov	ax,[si+2]
		mov	es:data_161,ax		; (020C:1303=0)
		add	si,3
		cmp	cx,4
		jbe	loc_351			; Jump if below or =
		sub	cx,3
		jmp	short loc_345		; (35E5)
loc_351:
		jmp	loc_356			; (370D)
loc_352:
		cmp	al,4Eh			; 'N'
		jne	loc_345			; Jump if not equal
		mov	es:data_164,1		; (020C:1309=0)
		mov	es:data_236,1		; (020C:2641=0)
		cmp	byte ptr [si+1],31h	; '1'
		je	loc_354			; Jump if equal
		mov	word ptr es:[7A6h],0BFC0h	; (020C:07A6=11h)
		mov	word ptr es:[7F4h],0D9DAh	; (020C:07F4=314h)
		mov	word ptr es:[7F6h],0C020h	; (020C:07F6=200h)
		mov	es:data_136,20D9h	; (020C:0844=1601h)
		push	cs:data_538		; (020C:4863=7480h)
		push	es
		call	sub_110			; (80D1)
		mov	ah,24h			; '$'
		mov	al,ah
		mov	word ptr es:[5F3h],0BFC0h	; (020C:05F3=2A8h)
		add	word ptr es:[5F3h],ax	; (020C:05F3=2A8h)
		mov	word ptr es:[641h],0D9DAh	; (020C:0641=9AA4h)
		add	word ptr es:[641h],ax	; (020C:0641=9AA4h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,cs:data_537		; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_353			; Jump if not zero
		cmp	dx,cs:data_538		; (020C:4863=7480h)
		je	loc_353			; Jump if equal
		call	sub_115			; (83A4)
loc_353:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		jmp	loc_345			; (35E5)
loc_354:
		mov	es:data_237,1		; (020C:2642=0)
		or	es:data_481,80h		; (020C:42CE=1689h)
		inc	si
		mov	ax,2020h
		mov	word ptr es:[7A6h],ax	; (020C:07A6=11h)
		mov	word ptr es:[7F4h],ax	; (020C:07F4=314h)
		mov	word ptr es:[7F6h],ax	; (020C:07F6=200h)
		mov	es:data_136,ax		; (020C:0844=1601h)
		push	cs:data_538		; (020C:4863=7480h)
		push	es
		call	sub_110			; (80D1)
		mov	ah,44h			; 'D'
		mov	al,ah
		mov	word ptr es:[5F3h],ax	; (020C:05F3=2A8h)
		mov	word ptr es:[641h],ax	; (020C:0641=9AA4h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,cs:data_537		; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_355			; Jump if not zero
		cmp	dx,cs:data_538		; (020C:4863=7480h)
		je	loc_355			; Jump if equal
		call	sub_115			; (83A4)
loc_355:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		jmp	loc_345			; (35E5)
loc_356:
		pop	cx
		mov	si,81h
		mov	di,37AAh
  
locloop_357:
		cmp	byte ptr [si],20h	; ' '
		jne	locloop_358		; Jump if not equal
		inc	si
		loop	locloop_357		; Loop if cx > 0
  
		jmp	short loc_359		; (372D)
  
locloop_358:
		cmp	word ptr [si],2D20h
		je	loc_359			; Jump if equal
		cmp	byte ptr [si],20h	; ' '
		je	loc_359			; Jump if equal
		cld				; Clear direction
		movsb				; Mov [si] to es:[di]
		loop	locloop_358		; Loop if cx > 0
  
loc_359:
		call	sub_104			; (80B9)
		mov	byte ptr ds:[2638h],0	; (94E8:2638=0)
		cmp	word ptr ds:[1301h],0	; (94E8:1301=0BB99h)
		je	loc_360			; Jump if equal
		mov	si,1301h
		mov	ax,si
		add	ax,4
		mov	word ptr ds:[44FCh],ax	; (94E8:44FC=1F7Dh)
		call	sub_41			; (3FF4)
		jc	loc_360			; Jump if carry Set
		mov	word ptr ds:[12FFh],dx	; (94E8:12FF=5F06h)
loc_360:
		mov	cx,4Eh
		sub	cx,41h
		nop				;*ASM fixup - sign extn byte
		mov	di,1A5h
		mov	si,41h
		mov	ax,55Dh
		mov	ds,ax
		call	sub_109			; (80CE)
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		call	sub_104			; (80B9)
		mov	ax,word ptr cs:[90h]	; (020C:0090=1FBFh)
		mov	word ptr ds:[48E1h],ax	; (94E8:48E1=0E810h)
		call	sub_145			; (B8C0)
		mov	dh,al
		test	al,70h			; 'p'
		jz	loc_361			; Jump if zero
		call	sub_104			; (80B9)
		mov	ax,word ptr ds:[2A95h]	; (4D00:2A95=20Ch)
		mov	word ptr ds:[2A99h],ax	; (4D00:2A99=140h)
		mov	ax,word ptr ds:[2A97h]	; (4D00:2A97=5B5Eh)
		mov	word ptr ds:[2A9Bh],ax	; (4D00:2A9B=1600h)
		cmp	dh,40h			; '@'
		jne	loc_361			; Jump if not equal
data_424	dw	6C6h
data_425	dw	2A79h
data_426	db	0Ch
loc_361:
data_427	dw	3688h
data_428	dw	2A78h
		mov	dh,0
		call	sub_62			; (6B04)
		mov	ah,1
;*		call	far ptr sub_203		;*(1548:082C)
		db	 9Ah, 2Ch, 08h, 48h, 15h
data_430	dw	0B8h
data_431	dw	0CD33h
data_432	dw	8821h
		push	ss
		inc	bx
		db	26h
		mov	ax,3301h
		xor	dl,dl			; Zero register
		int	21h			; DOS Services  ah=function 33h
						;  ctrl-break flag al=off/on
		push	ds
		mov	ax,1548h
		mov	dx,8F7h
		mov	ax,2523h
		int	21h			; DOS Services  ah=function 25h
						;  set intrpt vector al to ds:dx
		pop	ds
		mov	cx,350h
		push	cx
		call	sub_109			; (80CE)
		cmp	cx,3
		ja	loc_362			; Jump if above
		jmp	loc_363			; (3860)
loc_362:
		nop
		push	si
		dec	cx
		inc	bp
		push	di
		sub	ax,4E49h
		inc	si
		dec	di
		sub	ax,2031h
		add	ax,[bx+si]
		add	ax,[bx+si]
		add	ax,[bx+si]
		add	ax,[bx+si]
		pop	ax
		pop	ax
		pop	ax
		add	ax,[bx+si]
data_433	dw	0C9E8h
		dec	ax
		add	ax,[bx+si]
		mov	di,5Bh
		add	ax,[bx+si]
		add	ax,[bx+si]
		mov	si,7460h
		add	ax,[bx+si]
		add	ax,[bx+si]
		mov	cx,0BA91h
		sub	cx,76D3h
;*		call	far ptr sub_252		;*(5DED:0000)
		db	 9Ah, 00h, 00h,0EDh, 5Dh
		add	ax,[bx+si]
		add	ax,[bx+si]
		call	sub_104			; (80B9)
		mov	si,76h
		add	ax,[bx+si]
		add	ax,[bx+si]
		mov	cx,122h
		add	ax,[bx+si]
;*		call	far ptr sub_252		;*(5DED:0000)
		db	 9Ah, 00h, 00h,0EDh, 5Dh
		add	ax,[bx+si]
		add	ax,[bx+si]
		mov	si,0Dh
		add	ax,[bx+si]
		add	ax,[bx+si]
		add	ax,[bx+si]
		add	ax,[bx+si]
		mov	cx,36h
		sub	cx,32h
		nop				;*ASM fixup - sign extn byte
;*		call	far ptr sub_252		;*(5DED:0000)
		db	 9Ah, 00h, 00h,0EDh, 5Dh
		add	ax,[bx+si]
		add	ax,[bx+si]
		mov	ax,[di+17h]
		cmp	ax,[di+19h]
		je	loc_363			; Jump if equal
		add	ax,[bx+si]
		mov	di,42A5h
		add	ax,[bx+si]
		add	ax,[bx+si]
		or	word ptr [di+21h],2
		add	ax,[bx+si]
		add	ax,[bx+si]
		add	ax,[bx+si]
		mov	word ptr [di+23h],0FFFFh
loc_363:
		mov	di,1121h
		sub	di,1023h
		call	sub_48			; (4A40)
;*		call	far ptr sub_255		;*(5DED:3120)
		db	 9Ah, 20h, 31h,0EDh, 5Dh
;*		call	far ptr sub_198		;*(1548:0648)
		db	 9Ah, 48h, 06h, 48h, 15h
		call	sub_61			; (6A4C)
		call	sub_148			; (BA90)
		cmp	byte ptr ds:[37AAh],0	; (94E8:37AA=2Ch)
		je	loc_366			; Jump if equal
		mov	di,37AAh
		mov	al,0
;*		call	far ptr sub_195		;*(1548:04A4)
		db	 9Ah,0A4h, 04h, 48h, 15h
;*		call	far ptr sub_196		;*(1548:0510)
		db	 9Ah, 10h, 05h, 48h, 15h
loc_364:
		mov	byte ptr ds:[2C3Fh],al	; (94E8:2C3F=3)
		cmp	al,0
		je	loc_366			; Jump if equal
		push	ax
		push	di
		mov	si,37AAh
		mov	di,2BB2h
		mov	cx,bx
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	di
		dec	di
;*		call	far ptr sub_235		;*(1548:1740)
		db	 9Ah, 40h, 17h, 48h, 15h
		pop	ax
data_436	dw	0FB83h
data_437	db	0Ch
		ja	loc_365			; Jump if above
		cmp	al,1
		je	loc_367			; Jump if equal
		cmp	byte ptr ds:[38A9h],1	; (94E8:38A9=62h)
data_440	db	75h
data_441	db	13h
		jmp	short loc_369		; (38DD)
loc_365:
		mov	byte ptr ds:[2C3Fh],0	; (94E8:2C3F=3)
loc_366:
		cmp	byte ptr ds:[38A9h],1	; (94E8:38A9=62h)
		jne	loc_368			; Jump if not equal
		jmp	short loc_370		; (38E5)
loc_367:
		jmp	loc_689			; (5480)
loc_368:
		mov	bp,37AAh
		mov	si,389Bh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		jmp	loc_689			; (5480)
loc_369:
		call	sub_129			; (9E64)
		jnc	loc_370			; Jump if carry=0
;*		jmp	loc_192			;*(2199)
		db	0E9h,0B4h,0E8h
loc_370:
		mov	byte ptr ds:[2638h],1	; (94E8:2638=0)
		mov	ah,byte ptr ds:[2C3Eh]	; (94E8:2C3E=0B9h)
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
		cmp	byte ptr ds:[4392h],1	; (94E8:4392=3Ch)
		jne	loc_371			; Jump if not equal
		mov	byte ptr ds:[4392h],0	; (94E8:4392=3Ch)
data_444	dw	7DE9h
data_445	db	11h
loc_371:
		call	sub_109			; (80CE)
		mov	ah,7
		int	21h			; DOS Services  ah=function 07h
						;  get keybd char al, no echo
		cmp	al,0
		jne	loc_373			; Jump if not equal
		mov	ah,7
		int	21h			; DOS Services  ah=function 07h
						;  get keybd char al, no echo
		cmp	al,3Bh			; ';'
		jne	loc_372			; Jump if not equal
		jmp	loc_651			; (517B)
loc_372:
		jmp	short loc_376		; (394F)
loc_373:
		cmp	al,3Fh			; '?'
		jne	loc_374			; Jump if not equal
		jmp	loc_651			; (517B)
loc_374:
		cmp	al,1Bh
		jne	loc_375			; Jump if not equal
		jmp	loc_628			; (4F4D)
loc_375:
		cmp	al,80h
		jae	loc_372			; Jump if above or =
		test	al,40h			; '@'
		jz	loc_372			; Jump if zero
		and	al,5Fh			; '_'
		mov	cx,44CAh
		sub	cx,44B2h
		mov	di,44B2h
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		jcxz	loc_376			; Jump if cx=0
		dec	di
		sub	di,44B2h
		shl	di,1			; Shift w/zeros fill
data_446	dw	0C781h
data_447	dw	44CAh
data_448	dw	25FFh
loc_376:
data_449	db	9Ah
		sub	byte ptr ds:[1548h],al	; (94E8:1548=0CDh)
		jmp	short loc_371		; (3903)
		call	sub_63			; (6BFC)
		mov	byte ptr [bx+67h],0Fh
		mov	ah,22h			; '"'
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
		cmp	byte ptr ds:[1309h],1	; (94E8:1309=53h)
		jne	loc_379			; Jump if not equal
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,500h
		call	sub_77			; (70B4)
		mov	si,643h
		mov	cx,0BE3h
		sub	cx,643h
		dec	cx
		call	sub_110			; (80D1)
  
locloop_377:
		mov	dl,es:[si]
		cmp	dl,0F4h
		jb	loc_378			; Jump if below
		mov	dl,20h			; ' '
loc_378:
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		inc	si
		loop	locloop_377		; Loop if cx > 0
  
		jmp	short loc_387		; (39FD)
loc_379:
		mov	dx,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,dx
		mov	di,320h
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		call	sub_58			; (69B0)
		call	sub_105			; (80BC)
		mov	si,643h
		mov	cx,0BE3h
		sub	cx,643h
		mov	al,20h			; ' '
		mov	bh,7
  
locloop_380:
		mov	bl,bh
		cmp	byte ptr [si],0FEh
		jne	loc_383			; Jump if not equal
		cmp	bh,7
		jne	loc_381			; Jump if not equal
		mov	bh,0Fh
		jmp	short loc_382		; (39CB)
loc_381:
		mov	bh,7
loc_382:
		mov	bl,bh
		jmp	short loc_384		; (39DE)
loc_383:
		cmp	byte ptr [si],0F4h
		jb	loc_385			; Jump if below
		push	ds
		call	sub_104			; (80B9)
		mov	bl,byte ptr ds:[11E7h]	; (94E8:11E7=0)
		pop	ds
		cld				; Clear direction
loc_384:
		stosb				; Store al to es:[di]
		inc	si
		mov	es:[di],bl
		inc	di
		dec	cx
		jmp	short loc_386		; (39F5)
loc_385:
		cmp	byte ptr [si],80h
		jb	loc_386			; Jump if below
		push	ds
		call	sub_104			; (80B9)
		mov	bl,byte ptr ds:[11E6h]	; (94E8:11E6=0)
		pop	ds
loc_386:
		cld				; Clear direction
		movsb				; Mov [si] to es:[di]
		mov	es:[di],bl
		inc	di
		loop	locloop_380		; Loop if cx > 0
  
loc_387:
		call	sub_104			; (80B9)
		call	sub_59			; (69D4)
		and	word ptr ds:[42C6h],0FFFEh	; (94E8:42C6=1FF5h)
		mov	bx,word ptr ds:[42CCh]	; (94E8:42CC=71Fh)
		call	sub_72			; (6F20)
loc_388:
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		cmp	al,0
		je	loc_389			; Jump if equal
		and	al,5Fh			; '_'
		cmp	al,41h			; 'A'
		jb	loc_389			; Jump if below
		cmp	al,5Ah			; 'Z'
		jbe	loc_390			; Jump if below or =
loc_389:
		jmp	loc_395			; (3ABD)
loc_390:
		cmp	al,50h			; 'P'
		ja	loc_391			; Jump if above
		sub	al,41h			; 'A'
		mov	bx,8000h
		mov	cl,al
		ror	bx,cl			; Rotate
		mov	dx,word ptr ds:[42CCh]	; (94E8:42CC=71Fh)
		mov	cx,dx
		and	dx,bx
		not	dx
		and	dx,bx
		not	bx
		and	cx,bx
		or	cx,dx
		test	word ptr ds:[42C6h],2	; (94E8:42C6=1FF5h)
		jnz	loc_393			; Jump if not zero
		mov	word ptr ds:[42CCh],cx	; (94E8:42CC=71Fh)
		jmp	short loc_394		; (3AB3)
loc_391:
		cmp	al,54h			; 'T'
		ja	loc_392			; Jump if above
		cmp	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
		je	loc_393			; Jump if equal
		sub	al,51h			; 'Q'
		mov	bl,4
		mov	cl,al
		ror	bl,cl			; Rotate
		mov	dl,byte ptr ds:[430Bh]	; (94E8:430B=21h)
		mov	cl,dl
		and	dl,bl
		not	dl
		and	dl,bl
		not	bl
		and	cl,bl
		or	cl,dl
		test	word ptr ds:[42C6h],2	; (94E8:42C6=1FF5h)
		jnz	loc_393			; Jump if not zero
		mov	byte ptr ds:[430Bh],cl	; (94E8:430B=21h)
		jmp	short loc_394		; (3AB3)
loc_392:
		sub	al,55h			; 'U'
		mov	bx,80h
		mov	cl,al
		ror	bx,cl			; Rotate
		mov	dx,word ptr ds:[42CEh]	; (94E8:42CE=0F78Bh)
		mov	cx,dx
		and	dx,bx
		not	dx
		and	dx,bx
		not	bx
		and	cx,bx
		or	cx,dx
		test	word ptr ds:[42C6h],2	; (94E8:42C6=1FF5h)
		jnz	loc_393			; Jump if not zero
		mov	word ptr ds:[42CEh],cx	; (94E8:42CE=0F78Bh)
		jmp	short loc_394		; (3AB3)
loc_393:
;*		call	far ptr sub_197		;*(1548:0628)
		db	 9Ah, 28h, 06h, 48h, 15h
loc_394:
		mov	bx,word ptr ds:[42CCh]	; (94E8:42CC=71Fh)
		call	sub_72			; (6F20)
		jmp	loc_388			; (3A0F)
loc_395:
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		mov	byte ptr [bx+67h],0
		mov	byte ptr ds:[2638h],1	; (94E8:2638=0)
		mov	ah,byte ptr ds:[2C3Eh]	; (94E8:2C3E=0B9h)
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
		mov	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		test	byte ptr ds:[430Bh],7	; (94E8:430B=21h)
		jz	loc_396			; Jump if zero
		cmp	byte ptr ds:[263Dh],0Ah	; (94E8:263D=86h)
		jae	loc_396			; Jump if above or =
		mov	al,0Ah
		call	sub_83			; (7444)
loc_396:
		call	sub_73			; (6F98)
		jmp	loc_371			; (3903)
		call	sub_63			; (6BFC)
		mov	byte ptr [bx+52h],0
		mov	byte ptr [bx+39h],0Fh
		mov	byte ptr [bx+79h],0Fh
		mov	byte ptr [bx+67h],0Fh
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,1313h
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_56			; (68F0)
		mov	cl,4
		mov	bl,2
		mov	si,679h
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		cmp	al,1Bh
		jne	loc_397			; Jump if not equal
		jmp	loc_403			; (3BC4)
loc_397:
		cmp	cl,0
		je	loc_398			; Jump if equal
		jmp	loc_402			; (3BBF)
loc_398:
		mov	cx,80h
		mov	di,679h
		call	sub_38			; (3DF8)
		jc	loc_399			; Jump if carry Set
		jmp	loc_402			; (3BBF)
loc_399:
		mov	word ptr ds:[2A18h],dx	; (94E8:2A18=0F820h)
		mov	dl,3Ah			; ':'
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		mov	cl,4
		mov	bl,2
		mov	si,67Eh
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		cmp	al,1Bh
		je	loc_403			; Jump if equal
		cmp	cl,0
		jne	loc_402			; Jump if not equal
		mov	cx,80h
		mov	di,67Eh
		call	sub_38			; (3DF8)
		jnc	loc_402			; Jump if carry=0
		call	sub_106			; (80C5)
		mov	word ptr es:[2],dx	; (065D:0002=8015h)
		cmp	word ptr es:[6],0FFFFh	; (065D:0006=32Ah)
		jne	loc_400			; Jump if not equal
		mov	word ptr es:[4],0	; (065D:0004=1E3Eh)
loc_400:
		mov	ax,word ptr ds:[2A18h]	; (94E8:2A18=0F820h)
		mov	word ptr es:[0],ax	; (065D:0000=4817h)
		mov	word ptr es:[6],ax	; (065D:0006=32Ah)
		mov	word ptr es:[8],ax	; (065D:0008=575h)
		mov	byte ptr es:[0Eh],0	; (065D:000E=4)
		cmp	word ptr es:[0Ah],0FFFFh	; (065D:000A=6C6h)
		jne	loc_401			; Jump if not equal
		mov	word ptr es:[0Ah],0	; (065D:000A=6C6h)
		cmp	byte ptr ds:[2A2Bh],0	; (94E8:2A2B=0Ah)
		ja	loc_401			; Jump if above
		inc	byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
loc_401:
		call	sub_109			; (80CE)
		call	sub_92			; (7C70)
		mov	ah,byte ptr ds:[2C3Eh]	; (94E8:2C3E=0B9h)
		call	sub_65			; (6C58)
		jmp	short loc_403		; (3BC4)
loc_402:
;*		call	far ptr sub_197		;*(1548:0628)
		db	 9Ah, 28h, 06h, 48h, 15h
loc_403:
		call	sub_68			; (6E44)
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		mov	byte ptr [bx+79h],7
		mov	byte ptr [bx+67h],0
		call	sub_70			; (6F08)
data_450	db	0E8h
		adc	al,2Dh			; '-'
		jmp	loc_371			; (3903)
		mov	dh,byte ptr ds:[2C40h]	; (94E8:2C40=0)
		inc	dh
		mov	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		cmp	dh,6
data_452	dw	876h
data_453	dw	1B6h
		cmp	al,9
		jne	loc_404			; Jump if not equal
		mov	al,4
loc_404:
		mov	byte ptr ds:[2C40h],dh	; (94E8:2C40=0)
		cmp	dh,1
		jbe	loc_405			; Jump if below or =
		cmp	al,4
		jne	loc_405			; Jump if not equal
		mov	al,12h
loc_405:
		call	sub_47			; (49B4)
		call	sub_83			; (7444)
;*		call	far ptr sub_199		;*(1548:066C)
		db	 9Ah, 6Ch, 06h, 48h, 15h
		call	sub_68			; (6E44)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		call	sub_63			; (6BFC)
		mov	byte ptr [bx+52h],7
		mov	byte ptr [bx+3Ch],0Fh
		mov	byte ptr [bx+4Fh],0Fh
		mov	ah,1Eh
		call	sub_65			; (6C58)
		mov	byte ptr ds:[64Eh],20h	; (94E8:064E=0C7h) ' '
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,1238h
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_56			; (68F0)
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		cmp	al,80h
		jae	loc_406			; Jump if above or =
		test	al,40h			; '@'
		jz	loc_406			; Jump if zero
		and	al,5Fh			; '_'
		cmp	al,41h			; 'A'
		jb	loc_406			; Jump if below
		cmp	al,5Ah			; 'Z'
		ja	loc_406			; Jump if above
		mov	dl,al
		sub	dl,41h			; 'A'
		mov	bl,dl
		push	dx
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,184Fh
		call	sub_77			; (70B4)
		call	sub_70			; (6F08)
		pop	dx
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
loc_406:
		mov	ah,19h
		int	21h			; DOS Services  ah=function 19h
						;  get default drive al  (0=a:)
		mov	byte ptr ds:[2A94h],al	; (94E8:2A94=0C1h)
		add	al,61h			; 'a'
data_455	db	0A2h
		dec	si
		push	es
		call	sub_61			; (6A4C)
		mov	dl,byte ptr ds:[2A93h]	; (94E8:2A93=6)
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		mov	byte ptr [bx+4Fh],7
		mov	ah,byte ptr ds:[2C3Eh]	; (94E8:2C3E=0B9h)
		call	sub_65			; (6C58)
		call	sub_70			; (6F08)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		call	sub_63			; (6BFC)
		mov	byte ptr [bx+52h],0
		mov	byte ptr [bx+3Ah],0Fh
		mov	byte ptr [bx+7Ah],0Fh
		mov	byte ptr [bx+67h],0Fh
		or	byte ptr ds:[1594h],2	; (94E8:1594=0DBh)
		call	sub_68			; (6E44)
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,1418h
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_56			; (68F0)
		mov	cl,4
		mov	bl,2
		mov	si,6CEh
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		cmp	al,1Bh
		je	loc_410			; Jump if equal
		cmp	cl,0
		jne	loc_409			; Jump if not equal
		mov	cx,80h
		mov	di,6CEh
		call	sub_38			; (3DF8)
		jnc	loc_409			; Jump if carry=0
		call	sub_106			; (80C5)
		mov	word ptr es:[4],dx	; (065D:0004=1E3Eh)
		cmp	word ptr es:[0],0FFFFh	; (065D:0000=4817h)
		nop				;*ASM fixup - sign extn byte
		jne	loc_408			; Jump if not equal
		xor	ax,ax			; Zero register
		mov	word ptr es:[0],ax	; (065D:0000=4817h)
		mov	word ptr es:[2],ax	; (065D:0002=8015h)
		mov	word ptr es:[0],ax	; (065D:0000=4817h)
		mov	word ptr es:[6],ax	; (065D:0006=32Ah)
		mov	word ptr es:[8],ax	; (065D:0008=575h)
		mov	byte ptr es:[0Eh],al	; (065D:000E=4)
		cmp	word ptr es:[0Ah],0FFFFh	; (065D:000A=6C6h)
		jne	loc_407			; Jump if not equal
		mov	word ptr es:[0Ah],ax	; (065D:000A=6C6h)
loc_407:
		cmp	byte ptr ds:[2A2Bh],0	; (94E8:2A2B=0Ah)
		ja	loc_408			; Jump if above
		inc	byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
loc_408:
		mov	byte ptr ds:[1594h],1	; (94E8:1594=0DBh)
		call	sub_109			; (80CE)
		call	sub_92			; (7C70)
		mov	ah,byte ptr ds:[2C3Eh]	; (94E8:2C3E=0B9h)
		call	sub_65			; (6C58)
		jmp	short loc_411		; (3D51)
loc_409:
;*		call	far ptr sub_197		;*(1548:0628)
		db	 9Ah, 28h, 06h, 48h, 15h
loc_410:
		and	byte ptr ds:[1594h],0FDh	; (94E8:1594=0DBh)
		call	sub_68			; (6E44)
loc_411:
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		mov	byte ptr [bx+7Ah],7
		mov	byte ptr [bx+67h],0
		call	sub_70			; (6F08)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		call	sub_109			; (80CE)
		mov	al,41h			; 'A'
		cmp	byte ptr ds:[2EBDh],1	; (94E8:2EBD=0)
		je	loc_412			; Jump if equal
		mov	al,4Ch			; 'L'
loc_412:
		call	sub_44			; (4398)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_36		proc	near
		mov	dl,[di]
		cmp	dl,40h			; '@'
		jb	loc_413			; Jump if below
		and	dl,0DFh
loc_413:
		sub	dl,30h			; '0'
		cmp	dl,9
		jbe	loc_414			; Jump if below or =
		sub	dl,7
		cmp	dl,0Fh
		ja	loc_415			; Jump if above
loc_414:
		xor	dh,dh			; Zero register
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_415			; Jump if carry Set
		stc				; Set carry flag
		jmp	short loc_416		; (3DA7)
loc_415:
		clc				; Clear carry flag
loc_416:
		retn
sub_36		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_37		proc	near
		push	cx
		mov	cl,4
		shl	dx,cl			; Shift w/zeros fill
		pop	cx
		mov	al,[di]
		cmp	al,40h			; '@'
		jb	loc_417			; Jump if below
		and	al,0DFh
loc_417:
		sub	al,30h			; '0'
		cmp	al,9
		jbe	loc_418			; Jump if below or =
		sub	al,7
		cmp	al,0Fh
		ja	loc_421			; Jump if above
loc_418:
		xor	ah,ah			; Zero register
		add	dx,ax
		push	cx
		mov	cl,4
		shl	dx,cl			; Shift w/zeros fill
		pop	cx
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_421			; Jump if carry Set
		mov	al,[di]
		cmp	al,40h			; '@'
		jb	loc_419			; Jump if below
		and	al,0DFh
loc_419:
		sub	al,30h			; '0'
		cmp	al,9
		jbe	loc_420			; Jump if below or =
		sub	al,7
		cmp	al,0Fh
		ja	loc_421			; Jump if above
loc_420:
		xor	ah,ah			; Zero register
		add	dx,ax
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_421			; Jump if carry Set
		stc				; Set carry flag
		jmp	short loc_422		; (3DF6)
loc_421:
		clc				; Clear carry flag
loc_422:
		retn
sub_37		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_38		proc	near
		push	bx
		xor	dx,dx			; Zero register
		call	sub_37			; (3DA8)
		jnc	loc_423			; Jump if carry=0
		call	sub_37			; (3DA8)
loc_423:
		pop	bx
		retn
sub_38		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_39		proc	near
		push	es
		push	bx
		push	si
		xor	dx,dx			; Zero register
		mov	byte ptr ds:[2A1Ch],0	; (020C:2A1C=0A0h)
		mov	al,[di]
		cmp	al,40h			; '@'
		jae	loc_424			; Jump if above or =
		jmp	loc_436			; (3F1C)
loc_424:
		and	al,0DFh
		cmp	al,53h			; 'S'
		je	loc_425			; Jump if equal
		jmp	loc_435			; (3F11)
loc_425:
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jnc	loc_426			; Jump if carry=0
		jmp	short loc_431		; (3EAA)
loc_426:
		mov	al,[di]
		and	al,0DFh
		cmp	al,45h			; 'E'
		jne	loc_432			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_431			; Jump if carry Set
		mov	al,[di]
		and	al,0DFh
		cmp	al,47h			; 'G'
		jne	loc_431			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_431			; Jump if carry Set
		mov	al,[di]
		cmp	al,5Fh			; '_'
		jne	loc_427			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_431			; Jump if carry Set
loc_427:
		mov	al,[di]
		and	al,0DFh
		sub	al,41h			; 'A'
		cmp	al,19h
		ja	loc_431			; Jump if above
		push	ax
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jnc	loc_428			; Jump if carry=0
		pop	ax
		jmp	loc_437			; (3F26)
loc_428:
		mov	dl,[di]
		and	dl,0DFh
		sub	dl,41h			; 'A'
		cmp	dl,19h
		ja	loc_430			; Jump if above
		pop	ax
		inc	al
		push	dx
		mov	dl,1Ah
		mul	dl			; ax = reg * al
		pop	dx
		xor	dh,dh			; Zero register
		add	ax,dx
		cmp	ax,0FAh
		jae	loc_429			; Jump if above or =
		jmp	short loc_434		; (3EF4)
loc_429:
		jmp	loc_437			; (3F26)
loc_430:
		pop	ax
		xor	ah,ah			; Zero register
		rol	ax,1			; Rotate
		mov	si,28F3h
		call	sub_106			; (80C5)
		add	si,ax
		mov	dx,es:[si]
		cmp	dx,0FFFFh
		je	loc_431			; Jump if equal
		jmp	loc_438			; (3F29)
loc_431:
		jmp	short loc_437		; (3F26)
loc_432:
		cmp	al,47h			; 'G'
		jne	loc_437			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_437			; Jump if carry Set
		mov	al,[di]
		cmp	al,5Fh			; '_'
		jne	loc_433			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_431			; Jump if carry Set
loc_433:
		mov	al,[di]
		and	al,0DFh
		sub	al,41h			; 'A'
		cmp	al,19h
		ja	loc_437			; Jump if above
		mov	dl,1Ah
		mul	dl			; ax = reg * al
		push	ax
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_437			; Jump if carry Set
		mov	dl,[di]
		and	dl,0DFh
		sub	dl,41h			; 'A'
		cmp	dl,19h
		ja	loc_437			; Jump if above
		pop	ax
		xor	dh,dh			; Zero register
		add	ax,dx
		add	ax,1Ah
		cmp	ax,0FAh
		jae	loc_437			; Jump if above or =
loc_434:
		xor	ah,ah			; Zero register
		rol	ax,1			; Rotate
		mov	si,28F3h
		call	sub_106			; (80C5)
		add	si,ax
		mov	dx,es:[si]
		cmp	dx,0FFFFh
		je	loc_437			; Jump if equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_437			; Jump if carry Set
		jmp	short loc_438		; (3F29)
loc_435:
		cmp	al,4Eh			; 'N'
		jne	loc_436			; Jump if not equal
		mov	byte ptr ds:[2A1Ch],1	; (020C:2A1C=0A0h)
		jmp	short loc_438		; (3F29)
loc_436:
		call	sub_37			; (3DA8)
		jnc	loc_437			; Jump if carry=0
		call	sub_37			; (3DA8)
		jmp	short loc_438		; (3F29)
loc_437:
		clc				; Clear carry flag
		jmp	short loc_439		; (3F2A)
loc_438:
		stc				; Set carry flag
loc_439:
		pop	si
		pop	bx
		pop	es
		retn
sub_39		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_40		proc	near
		push	si
		call	sub_41			; (3FF4)
		jc	loc_440			; Jump if carry Set
		jmp	loc_449			; (3FEE)
loc_440:
		cmp	byte ptr [si],20h	; ' '
		je	loc_441			; Jump if equal
		cmp	byte ptr [si],9
		je	loc_441			; Jump if equal
		cmp	byte ptr [si],3Dh	; '='
		jne	loc_442			; Jump if not equal
loc_441:
		inc	si
		cmp	si,data_519		; (020C:44FC=29BFh)
		jbe	loc_440			; Jump if below or =
		jmp	loc_450			; (3FF1)
loc_442:
		mov	al,[si]
		and	al,0DFh
		cmp	al,53h			; 'S'
		jne	loc_445			; Jump if not equal
		inc	si
		cmp	si,data_519		; (020C:44FC=29BFh)
		je	loc_445			; Jump if equal
		mov	al,[si]
		and	al,0DFh
		cmp	al,47h			; 'G'
		je	loc_446			; Jump if equal
		cmp	al,45h			; 'E'
		jne	loc_445			; Jump if not equal
		add	si,2
		cmp	si,data_519		; (020C:44FC=29BFh)
		je	loc_445			; Jump if equal
		mov	al,[si]
		cmp	al,5Fh			; '_'
		jne	loc_444			; Jump if not equal
		inc	si
		mov	al,[si]
		cmp	si,data_519		; (020C:44FC=29BFh)
		je	loc_445			; Jump if equal
		inc	si
		cmp	si,data_519		; (020C:44FC=29BFh)
		je	loc_443			; Jump if equal
		mov	al,[si]
		and	al,0DFh
		cmp	al,41h			; 'A'
		jb	loc_443			; Jump if below
		cmp	al,5Ah			; 'Z'
		jbe	loc_447			; Jump if below or =
loc_443:
		dec	si
		mov	al,[si]
loc_444:
		and	al,0DFh
		sub	al,41h			; 'A'
		cmp	al,1Ah
		jb	loc_448			; Jump if below
loc_445:
		jmp	short loc_450		; (3FF1)
loc_446:
		add	si,2
loc_447:
		cmp	si,data_519		; (020C:44FC=29BFh)
		jae	loc_450			; Jump if above or =
		mov	dh,[si]
		and	dh,0DFh
		sub	dh,41h			; 'A'
		cmp	dh,1Ah
		jae	loc_450			; Jump if above or =
		mov	al,[si-1]
		and	al,0DFh
		sub	al,40h			; '@'
		cmp	al,1Bh
		jae	loc_450			; Jump if above or =
		mov	dl,1Ah
		mul	dl			; ax = reg * al
		xor	dl,dl			; Zero register
		xchg	dl,dh
		add	ax,dx
		cmp	ax,0FAh
		jae	loc_450			; Jump if above or =
loc_448:
		xor	ah,ah			; Zero register
		rol	ax,1			; Rotate
		push	si
		push	es
		mov	si,28F3h
		call	sub_106			; (80C5)
		add	si,ax
		mov	dx,es:[si]
		pop	es
		pop	si
		cmp	dx,0FFFFh
		je	loc_450			; Jump if equal
		inc	si
loc_449:
		pop	ax
		clc				; Clear carry flag
		retn
loc_450:
		pop	si
		stc				; Set carry flag
		retn
sub_40		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_41		proc	near
		push	si
loc_451:
		cmp	byte ptr [si],20h	; ' '
		je	loc_452			; Jump if equal
		cmp	byte ptr [si],9
		je	loc_452			; Jump if equal
		cmp	byte ptr [si],3Dh	; '='
		jne	loc_453			; Jump if not equal
loc_452:
		inc	si
		cmp	si,word ptr ds:[44FCh]	; (94E8:44FC=1F7Dh)
		jbe	loc_451			; Jump if below or =
		jmp	short loc_460		; (4066)
loc_453:
		xor	dx,dx			; Zero register
		mov	ch,4
		mov	cl,ch
loc_454:
		mov	al,[si]
		cmp	al,40h			; '@'
		jb	loc_455			; Jump if below
		and	al,0DFh
loc_455:
		sub	al,30h			; '0'
		cmp	al,9
		jbe	loc_456			; Jump if below or =
		sub	al,7
		cmp	al,0Fh
		ja	loc_459			; Jump if above
		cmp	al,0Ah
		jb	loc_459			; Jump if below
loc_456:
		xor	ah,ah			; Zero register
		add	dx,ax
		rol	dx,cl			; Rotate
		dec	ch
		cmp	ch,0
		je	loc_457			; Jump if equal
		inc	si
		cmp	si,word ptr ds:[44FCh]	; (94E8:44FC=1F7Dh)
		jbe	loc_454			; Jump if below or =
loc_457:
		inc	si
loc_458:
		ror	dx,cl			; Rotate
		pop	ax
		clc				; Clear carry flag
		retn
loc_459:
		cmp	ch,4
		je	loc_460			; Jump if equal
		mov	al,[si]
		cmp	al,20h			; ' '
		je	loc_458			; Jump if equal
		cmp	al,9
		je	loc_458			; Jump if equal
		cmp	al,0
		je	loc_458			; Jump if equal
		cmp	al,2Ch			; ','
		je	loc_458			; Jump if equal
		cmp	al,3Ah			; ':'
		je	loc_458			; Jump if equal
		and	al,0DFh
		cmp	al,48h			; 'H'
		je	loc_458			; Jump if equal
loc_460:
		stc				; Set carry flag
		pop	si
		retn
sub_41		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_42		proc	near
loc_461:
		cmp	byte ptr [di],20h	; ' '
		je	loc_462			; Jump if equal
		cmp	byte ptr [di],9
		je	loc_462			; Jump if equal
		clc				; Clear carry flag
		jmp	short loc_463		; (4082)
loc_462:
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_463			; Jump if carry Set
		jmp	short loc_461		; (406C)
loc_463:
		retn
sub_42		endp
  
		db	13 dup (0)
		cmp	data_234,1		; (020C:263E=10h)
		jne	loc_464			; Jump if not equal
		cmp	data_381,1		; (020C:2EBD=3Dh)
		je	loc_465			; Jump if equal
loc_464:
		jmp	loc_475			; (417E)
loc_465:
		push	ax
		push	cx
		push	dx
		push	di
		mov	dl,bh
		xor	bh,bh			; Zero register
		mov	di,27B5h
		add	di,15h
		cmp	bp,di
		ja	loc_466			; Jump if above
		jmp	short loc_470		; (4125)
loc_466:
		mov	di,27E8h
		sub	di,27D5h
		add	di,2
		mov	ax,bp
		sub	ax,27D5h
		add	ax,bx
		add	ax,bx
		inc	ax
		cmp	bl,4
		jne	loc_467			; Jump if not equal
		test	data_323,0E0h		; (020C:2A77=0A5h)
		jz	loc_467			; Jump if zero
		inc	ax
loc_467:
		cmp	dl,0
		je	loc_468			; Jump if equal
		inc	ax
loc_468:
		cmp	ax,di
		jb	loc_470			; Jump if below
		mov	bp,27E8h
		mov	byte ptr ds:[bp],2Bh	; '+'
		mov	di,27B5h
		cmp	byte ptr [di],0
		jne	loc_470			; Jump if not equal
		cld				; Clear direction
		mov	al,20h			; ' '
		push	cx
		mov	cx,15h
		push	cs:data_538		; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,cs:data_537		; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_469			; Jump if not zero
		cmp	dx,cs:data_538		; (020C:4863=7480h)
		je	loc_469			; Jump if equal
		call	sub_115			; (83A4)
loc_469:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	cx
		mov	bp,27B5h
loc_470:
		cmp	bl,1
		jne	loc_471			; Jump if not equal
		mov	al,es:[si]
;*		call	far ptr sub_181		;*(1548:0078)
		db	 9Ah, 78h, 00h, 48h, 15h
		cmp	dl,0
		je	loc_474			; Jump if equal
		mov	ds:[bp],dl
		inc	bp
		jmp	short loc_474		; (4179)
loc_471:
		cmp	bl,2
		jne	loc_472			; Jump if not equal
		mov	ax,es:[si]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		jmp	short loc_474		; (4179)
loc_472:
		test	byte ptr ds:[2A77h],0E0h	; (94E8:2A77=4Ah)
		jz	loc_473			; Jump if zero
		mov	ax,es:[si+2]
		mov	bx,es:[si]
;*		call	far ptr sub_186		;*(1548:0218)
		db	 9Ah, 18h, 02h, 48h, 15h
		jmp	short loc_474		; (4179)
loc_473:
		mov	ax,es:[si+2]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
		mov	ax,es:[si]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_474:
		inc	bp
		pop	di
		pop	dx
		pop	cx
		pop	ax
loc_475:
		retn
		add	[bp+si+5],bh
		nop				;*ASM fixup - displacement
		mov	bx,0C7Ch
		call	sub_32			; (2D80)
		retn
		xchg	bx,bx
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	ds
		mov	di,8
		mov	si,0
		call	sub_102			; (80B0)
loc_476:
		mov	ax,[si]
		mov	bx,[si+2]
		mov	cx,[si+4]
		cmp	di,word ptr es:[0]	; (020C:0000=1828h)
		nop				;*ASM fixup - sign extn byte
		jb	loc_477			; Jump if below
		jmp	short loc_483		; (4205)
loc_477:
		test	byte ptr es:[di+4],40h	; '@'
		jz	loc_479			; Jump if zero
		cmp	ax,es:[di]
		jb	loc_478			; Jump if below
		ja	loc_482			; Jump if above
		cmp	bx,es:[di+2]
		ja	loc_482			; Jump if above
		cmp	cx,es:[di+2]
		jb	loc_478			; Jump if below
		jmp	short loc_479		; (41D4)
loc_478:
		add	si,15h
		cmp	word ptr [si],0FFFFh
		je	loc_482			; Jump if equal
		jmp	short loc_476		; (419D)
loc_479:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		push	ds
		call	sub_104			; (80B9)
		xlat				; al=[al+[bx]] table
		pop	ds
		or	al,al			; Zero ?
		jnz	loc_480			; Jump if not zero
		mov	al,es:[di+6]
loc_480:
		add	di,ax
		cmp	di,word ptr es:[0]	; (020C:0000=1828h)
		nop				;*ASM fixup - sign extn byte
		jb	loc_481			; Jump if below
		jmp	short loc_483		; (4205)
loc_481:
		cmp	word ptr [si],0FFFFh
		je	loc_482			; Jump if equal
		jmp	short loc_476		; (419D)
loc_482:
data_459	dw	8026h
		dec	bp
data_460	db	5
data_461	db	80h
data_462	db	0EBh
data_463	db	0CFh
loc_483:
data_464	db	1Fh
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
		add	[bx+si],al
		push	ax
		push	bx
		push	di
		mov	di,8
		mov	bx,377Fh
loc_484:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_485			; Jump if not equal
		cmp	word ptr es:[di+2],0FFFEh
		jae	loc_489			; Jump if above or =
loc_485:
		and	byte ptr es:[di+7],0EFh
		test	byte ptr es:[di+7],80h
		jz	loc_486			; Jump if zero
		mov	byte ptr data_468,1	; (020C:42B4=77h)
loc_486:
		mov	al,es:[di+5]
loc_487:
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_488			; Jump if not zero
		mov	al,es:[di+6]
loc_488:
		add	di,ax
		jmp	short loc_484		; (4219)
loc_489:
		pop	di
		pop	bx
		pop	ax
		retn
		add	bh,dh
		push	es
		mov	byte ptr [bp+si+2],0
		dw	274h
loc_490:
		jmp	short loc_498		; (42D5)
loc_491:
		mov	al,[si]
		mov	ah,al
		cmp	al,0
		je	loc_490			; Jump if equal
		and	al,5Fh			; '_'
		cmp	al,41h			; 'A'
		jb	loc_490			; Jump if below
		cmp	al,5Ah			; 'Z'
		ja	loc_490			; Jump if above
		cmp	al,50h			; 'P'
		ja	loc_493			; Jump if above
		sub	al,41h			; 'A'
		mov	bx,8000h
		mov	cl,al
		ror	bx,cl			; Rotate
		mov	dx,data_480		; (020C:42CC=0D323h)
		or	dx,bx
		test	ah,20h			; ' '
		jz	loc_492			; Jump if zero
		not	bx
		and	dx,bx
loc_492:
		mov	data_480,dx		; (020C:42CC=0D323h)
		jmp	short loc_497		; (42D2)
loc_493:
		cmp	al,54h			; 'T'
		ja	loc_495			; Jump if above
		cmp	data_381,0		; (020C:2EBD=3Dh)
		je	loc_497			; Jump if equal
		sub	al,51h			; 'Q'
		mov	bl,4
		mov	cl,al
		ror	bl,cl			; Rotate
		mov	dl,data_507		; (020C:430B=72h)
		or	dl,bl
		test	ah,20h			; ' '
		jz	loc_494			; Jump if zero
		not	bl
		and	dl,bl
loc_494:
data_465	db	88h
data_466	dw	0B16h
data_467	db	43h
data_468	db	77h
		sbb	al,2Ch			; ','
data_469	db	55h
		mov	bx,80h
		mov	cl,al
		ror	bx,cl			; Rotate
data_473	db	8Bh
data_474	db	16h
data_475	dw	42CEh
		or	dx,bx
		test	ah,20h			; ' '
data_478	dw	474h
data_479	dw	0D3F7h
data_480	dw	0D323h
loc_496:
data_481	dw	1689h
data_482	dw	42CEh
loc_497:
data_483	dw	0EB46h
data_484	dw	0A085h
data_485	dw	263Dh
data_486	dw	6F6h
data_487	dw	430Bh
data_488	dw	7407h
data_489	dw	800Ch
data_490	dw	3D3Eh
data_491	dw	0A26h
data_492	dw	573h
data_493	dw	0AB0h
data_494	dw	59E8h
data_495	dw	0E831h
data_496	dw	2CAAh
data_497	dw	6F7h
data_498	db	0CCh
data_499	dw	142h
data_500	dw	7400h
data_501	dw	0B007h
data_502	dw	9A01h
data_503	dw	12D0h
		dec	ax
		adc	ax,87C3h
data_504	dw	89DBh
data_506	dw	0FC36h
		inc	sp
		add	data_519,bx		; (020C:44FC=29BFh)
		call	sub_41			; (3FF4)
data_507	db	72h
		adc	ax,0D6E8h
		cmp	ax,5
		adc	[bp+di],bh
		sal	byte ptr [bp+si+0Bh],1	; Shift w/zeros fill
data_511	dw	1689h
data_512	db	22h
		sub	ch,byte ptr ds:[1689h]	; (020C:1689=41h)
		db	67h
		dec	ax
		jmp	short loc_501		; (4327)
		mov	byte ptr data_516,31h	; (020C:4457=7) '1'
loc_501:
		retn
		mov	ah,1
		cmp	al,46h			; 'F'
		je	loc_502			; Jump if equal
		inc	ah
		cmp	al,43h			; 'C'
		je	loc_502			; Jump if equal
		inc	ah
		cmp	al,45h			; 'E'
		je	loc_502			; Jump if equal
		inc	ah
		cmp	al,5Ah			; 'Z'
		je	loc_502			; Jump if equal
		inc	ah
		cmp	al,44h			; 'D'
		je	loc_502			; Jump if equal
		inc	ah
		cmp	al,4Fh			; 'O'
		je	loc_502			; Jump if equal
		mov	byte ptr data_516,9	; (020C:4457=7)
		jmp	short loc_503		; (435F)
loc_502:
		mov	byte ptr data_346+4,ah	; (020C:2C40=41h)
		call	sub_47			; (49B4)
;*		call	far ptr sub_199		;*(1548:066C)
		db	 9Ah, 6Ch, 06h, 48h, 15h
loc_503:
		retn
		cmp	al,41h			; 'A'
		jb	loc_504			; Jump if below
		cmp	al,5Ah			; 'Z'
		ja	loc_504			; Jump if above
		mov	dl,al
		sub	dl,41h			; 'A'
		mov	bl,dl
		mov	ah,19h
		int	21h			; DOS Services  ah=function 19h
						;  get default drive al  (0=a:)
		push	ax
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
		mov	ah,19h
		int	21h			; DOS Services  ah=function 19h
						;  get default drive al  (0=a:)
		mov	byte ptr ds:[2A94h],al	; (020C:2A94=8Dh)
		add	al,61h			; 'a'
		mov	byte ptr ds:[64Eh],al	; (020C:064E=0B8h)
		call	sub_61			; (6A4C)
		pop	ax
		mov	dl,al
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
data_513	dw	5EBh
loc_504:
data_514	dw	6C6h
data_515	db	57h
		inc	sp
		or	bx,ax
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_44		proc	near
		push	ax
		mov	di,34Ah
		mov	cx,9
		mov	al,2Eh			; '.'
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		dec	di
		pop	ax
		cmp	al,4Ch			; 'L'
		je	loc_506			; Jump if equal
		cmp	al,41h			; 'A'
		je	loc_507			; Jump if equal
		mov	byte ptr ds:[4457h],9	; (94E8:4457=0FFh)
		jmp	loc_513			; (4486)
loc_506:
		jmp	short loc_511		; (442C)
loc_507:
		mov	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
;*		call	far ptr sub_193		;*(1548:0420)
		db	 9Ah, 20h, 04h, 48h, 15h
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	byte ptr [bx+30h],0
		mov	byte ptr [bx+33h],0
		mov	byte ptr [bx+34h],0
		mov	byte ptr [bx+65h],0
		mov	byte ptr [bx+66h],0
		mov	byte ptr [bx+69h],0
		mov	byte ptr [bx+6Ah],0
		mov	byte ptr [bx+6Bh],0
		mov	byte ptr [bx+6Ch],0
		mov	byte ptr [bx+70h],0
		mov	byte ptr [bx+71h],0
		mov	byte ptr [bx+7Bh],0
		mov	byte ptr ds:[430Bh],0	; (94E8:430B=21h)
		mov	cx,8
		mov	di,13A1h
		mov	al,byte ptr ds:[139Eh]	; (94E8:139E=6)
  
locloop_508:
		cmp	al,[di]
		je	loc_509			; Jump if equal
		add	di,0Fh
		loop	locloop_508		; Loop if cx > 0
  
loc_509:
		cmp	word ptr [di+1],4F4Eh
		jne	loc_510			; Jump if not equal
		mov	di,13A1h
		mov	al,[di]
		mov	byte ptr ds:[139Eh],al	; (94E8:139E=6)
		mov	ax,[di+0Dh]
		mov	word ptr ds:[139Fh],ax	; (94E8:139F=10E9h)
;*		call	far ptr sub_198		;*(1548:0648)
		db	 9Ah, 48h, 06h, 48h, 15h
		call	sub_56			; (68F0)
loc_510:
		jmp	short loc_512		; (4475)
loc_511:
		mov	byte ptr ds:[2EBDh],1	; (94E8:2EBD=0)
;*		call	far ptr sub_193		;*(1548:0420)
		db	 9Ah, 20h, 04h, 48h, 15h
		mov	al,byte ptr ds:[11E9h]	; (94E8:11E9=0)
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	byte ptr [bx+30h],0Fh
		mov	byte ptr [bx+33h],0Fh
		mov	byte ptr [bx+34h],0Fh
		mov	[bx+65h],al
		mov	byte ptr [bx+66h],7
		mov	byte ptr [bx+69h],7
		mov	byte ptr [bx+6Ah],7
		mov	byte ptr [bx+6Ch],7
		mov	[bx+70h],al
		mov	byte ptr [bx+71h],7
		mov	byte ptr [bx+7Bh],7
		call	sub_73			; (6F98)
		cmp	byte ptr ds:[2EBCh],0	; (94E8:2EBC=3Dh)
		je	loc_512			; Jump if equal
		mov	byte ptr [bx+6Bh],7
loc_512:
		mov	di,2BF5h
		mov	cx,3Fh
		mov	al,2Eh			; '.'
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		dec	di
;*		call	far ptr sub_193		;*(1548:0420)
		db	 9Ah, 20h, 04h, 48h, 15h
loc_513:
		retn
sub_44		endp
  
		nop
		mov	byte ptr ds:[4392h],1	; (94E8:4392=3Ch)
		retn
		xchg	bx,bx
		cmp	data_381,0		; (020C:2EBD=3Dh)
		je	loc_515			; Jump if equal
		mov	di,358h
		mov	cx,21h
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	cx,20h
		cmp	bx,20h
		ja	loc_514			; Jump if above
		mov	cx,bx
loc_514:
		mov	di,358h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
loc_515:
		retn
		nop
		cmp	bx,0
		jne	loc_516			; Jump if not equal
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
		jmp	loc_526			; (4577)
loc_516:
		cmp	byte ptr [si],3Fh	; '?'
		je	loc_518			; Jump if equal
		mov	di,si
		mov	al,0
;*		call	far ptr sub_195		;*(1548:04A4)
		db	 9Ah,0A4h, 04h, 48h, 15h
;*		call	far ptr sub_196		;*(1548:0510)
		db	 9Ah, 10h, 05h, 48h, 15h
		mov	byte ptr data_346+3,al	; (020C:2C3F=4Dh)
		cmp	al,1
		jbe	loc_517			; Jump if below or =
		cmp	al,0Bh
		jbe	loc_519			; Jump if below or =
loc_517:
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
		jmp	loc_526			; (4577)
loc_518:
		cmp	byte ptr data_346+3,1	; (020C:2C3F=4Dh)
		ja	loc_520			; Jump if above
		jmp	loc_527			; (4584)
loc_519:
		mov	di,2BB2h
		mov	cx,40h
		mov	al,0
		cld				; Clear direction
data_518	dw	0AAF3h
data_519	dw	29BFh
data_520	dw	0B906h
data_521	db	0Ch
		add	byte ptr ds:[0F320h][bx+si],dh	; (020C:F320=0F6h)
		stosb				; Store al to es:[di]
		mov	di,2BB2h
data_524	dw	0CB8Bh
data_525	dw	0A4F3h
data_526	dw	9A4Fh
data_527	dw	1740h
data_528	dw	1548h
loc_520:
		cmp	data_295,3		; (020C:2A1E=0A4h)
		jne	loc_521			; Jump if not equal
		mov	data_295,4		; (020C:2A1E=0A4h)
loc_521:
		call	sub_129			; (9E64)
		jnc	loc_522			; Jump if carry=0
		mov	byte ptr ds:[4457h],al	; (020C:4457=7)
		jmp	short loc_526		; (4577)
loc_522:
		cmp	data_231,1		; (020C:263A=0)
		je	loc_523			; Jump if equal
		mov	al,0Ah
		call	sub_83			; (7444)
loc_523:
		call	sub_106			; (80C5)
		mov	si,0
		mov	bx,28F3h
		mov	cx,0FAh
		xor	dl,dl			; Zero register
  
locloop_524:
		mov	ax,es:[si]
		mov	es:[bx],ax
		cmp	ax,0FFFFh
		je	loc_525			; Jump if equal
		inc	dl
loc_525:
		add	si,15h
		inc	bx
		inc	bx
		loop	locloop_524		; Loop if cx > 0
  
		mov	byte ptr ds:[2A2Dh],dl	; (020C:2A2D=0ADh)
		cmp	data_295,4		; (020C:2A1E=0A4h)
		jne	loc_526			; Jump if not equal
		dec	data_295		; (020C:2A1E=0A4h)
		mov	di,0
		mov	ax,0FFh
		mov	cx,15h
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	byte ptr ds:[2A2Bh],0	; (020C:2A2B=0A5h)
loc_526:
		call	sub_109			; (80CE)
		push	cx
		mov	ah,2Ah			; '*'
		call	sub_65			; (6C58)
		call	sub_56			; (68F0)
		pop	cx
loc_527:
		retn
		xchg	bx,bx
		nop
		mov	data_519,si		; (020C:44FC=29BFh)
		add	data_519,bx		; (020C:44FC=29BFh)
		call	sub_41			; (3FF4)
		jc	loc_528			; Jump if carry Set
		mov	data_383,dx		; (020C:2EC4=65h)
		mov	data_384,dx		; (020C:2EC6=5953h)
		and	data_384,0FFE7h		; (020C:2EC6=5953h)
		mov	data_529,dh		; (020C:47B1=0EDh)
		test	data_383,2		; (020C:2EC4=65h)
		jz	loc_529			; Jump if zero
		mov	di,2D1Ch
		sub	di,4
		mov	cx,4
		sub	di,cx
		mov	al,58h			; 'X'
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		jmp	short loc_529		; (45C4)
loc_528:
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
loc_529:
		retn
		xchg	bx,bx
		nop
		cmp	byte ptr ds:[2A2Bh],0	; (020C:2A2B=0A5h)
		je	loc_530			; Jump if equal
		mov	ah,12h
		call	sub_65			; (6C58)
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	al,data_156		; (020C:11E8=0)
		mov	[bx+52h],al
		call	sub_56			; (68F0)
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		mov	ah,2Ah			; '*'
		call	sub_65			; (6C58)
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	al,0Fh
		mov	[bx+52h],al
		call	sub_56			; (68F0)
		mov	al,42h			; 'B'
loc_530:
		mov	ah,1
		cmp	al,46h			; 'F'
		je	loc_531			; Jump if equal
		inc	ah
		cmp	al,42h			; 'B'
		je	loc_531			; Jump if equal
		inc	ah
		cmp	al,44h			; 'D'
		je	loc_531			; Jump if equal
		sub	al,31h			; '1'
		cmp	al,2
		ja	loc_532			; Jump if above
		inc	al
		mov	ah,al
loc_531:
		mov	data_295,ah		; (020C:2A1E=0A4h)
		mov	data_296,ah		; (020C:2A1F=0A5h)
		jmp	short loc_533		; (4624)
loc_532:
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
loc_533:
		retn
		xchg	bx,bx
		nop
		xor	ah,ah			; Zero register
		cmp	al,44h			; 'D'
		je	loc_534			; Jump if equal
		inc	ah
		cmp	al,5Ah			; 'Z'
		je	loc_534			; Jump if equal
		inc	ah
		cmp	al,53h			; 'S'
		je	loc_534			; Jump if equal
		inc	ah
		cmp	al,4Ch			; 'L'
		je	loc_534			; Jump if equal
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
		jmp	short loc_535		; (4651)
loc_534:
		mov	data_169,ah		; (020C:14AD=0)
		call	sub_74			; (6FDC)
		call	sub_45			; (4921)
loc_535:
		retn
		xchg	bx,bx
		mov	data_325,1		; (020C:2A79=0E0h)
		jmp	loc_560			; (4834)
		retn
		xchg	bx,bx
		nop
		cmp	bx,0
		jne	loc_536			; Jump if not equal
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
		jmp	loc_542			; (46FC)
loc_536:
		cld				; Clear direction
		mov	di,2BF5h
		mov	cx,29h
		mov	al,0
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	di,34Ah
		mov	cx,0Ch
		mov	al,20h			; ' '
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	di,2BF5h
		mov	cx,bx
  
locloop_537:
		cmp	byte ptr [si],2Eh	; '.'
		je	loc_538			; Jump if equal
		movsb				; Mov [si] to es:[di]
		loop	locloop_537		; Loop if cx > 0
  
loc_538:
		sub	bx,cx
;*		call	far ptr sub_193		;*(1548:0420)
		db	 9Ah, 20h, 04h, 48h, 15h
		add	bx,4
		inc	di
		mov	cx,bx
loc_539:
		mov	al,[di]
		cmp	al,3Ah			; ':'
		je	loc_540			; Jump if equal
		cmp	al,5Ch			; '\'
		je	loc_540			; Jump if equal
		cmp	cx,1
		jbe	loc_541			; Jump if below or =
		dec	cx
		dec	di
		jmp	short loc_539		; (469C)
loc_540:
		inc	di
loc_541:
		sub	bx,cx
		mov	cx,bx
		inc	cx
		cmp	cx,0Ch
		ja	loc_542			; Jump if above
		mov	si,di
		mov	di,34Ah
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cmp	data_345,3Ah		; (020C:2BF6=0) ':'
		jne	loc_542			; Jump if not equal
		mov	al,byte ptr ds:[2BF5h]	; (020C:2BF5=0)
		and	al,5Fh			; '_'
		cmp	al,41h			; 'A'
		jb	loc_542			; Jump if below
		cmp	al,5Ah			; 'Z'
		ja	loc_542			; Jump if above
		mov	dl,al
		sub	dl,41h			; 'A'
		mov	bl,dl
		mov	ah,19h
		int	21h			; DOS Services  ah=function 19h
						;  get default drive al  (0=a:)
		push	ax
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
		mov	ah,19h
		int	21h			; DOS Services  ah=function 19h
						;  get default drive al  (0=a:)
		mov	byte ptr ds:[2A94h],al	; (020C:2A94=8Dh)
		add	al,61h			; 'a'
		mov	byte ptr ds:[64Eh],al	; (020C:064E=0B8h)
		call	sub_61			; (6A4C)
		pop	ax
		mov	dl,al
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
loc_542:
		retn
		xchg	bx,bx
		nop
		sub	al,32h			; '2'
		cmp	al,7
		ja	loc_543			; Jump if above
		add	al,2
		shl	al,1			; Shift w/zeros fill
		call	sub_83			; (7444)
		mov	data_231,1		; (020C:263A=0)
		jmp	short loc_544		; (4719)
loc_543:
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
loc_544:
		retn
		xchg	bx,bx
		xor	ah,ah			; Zero register
		cmp	al,4Eh			; 'N'
		je	loc_546			; Jump if equal
		inc	ah
		cmp	al,44h			; 'D'
		je	loc_546			; Jump if equal
		inc	ah
		cmp	al,49h			; 'I'
		je	loc_546			; Jump if equal
		mov	ah,4
		cmp	al,4Fh			; 'O'
		je	loc_546			; Jump if equal
		mov	ah,7
		cmp	al,41h			; 'A'
		je	loc_546			; Jump if equal
		cmp	al,45h			; 'E'
		jne	loc_547			; Jump if not equal
loc_545:
		inc	si
		dec	bx
		jz	loc_547			; Jump if zero
		cmp	byte ptr [si],20h	; ' '
		jne	loc_545			; Jump if not equal
		inc	si
		dec	bx
		jz	loc_547			; Jump if zero
		mov	ah,6
		cmp	byte ptr [si],44h	; 'D'
		je	loc_546			; Jump if equal
		dec	ah
		cmp	byte ptr [si],49h	; 'I'
		je	loc_546			; Jump if equal
		mov	ah,3
		cmp	byte ptr [si],4Fh	; 'O'
		jne	loc_547			; Jump if not equal
loc_546:
		mov	data_170,ah		; (020C:152A=0)
		call	sub_75			; (7024)
		jmp	short loc_548		; (476E)
loc_547:
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
loc_548:
		retn
		nop
		cmp	data_381,0		; (020C:2EBD=3Dh)
		je	loc_549			; Jump if equal
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	data_380,0		; (020C:2EBC=45h)
		mov	byte ptr [bx+6Bh],0
loc_549:
		retn
		xchg	bx,bx
		nop
		mov	di,13A1h
		mov	al,[di]
		mov	data_165,al		; (020C:139E=0)
		xor	bp,bp			; Zero register
		lea	dx,[di+0Dh]		; Load effective addr
		lea	cx,[di+1]		; Load effective addr
		sub	dx,cx
		mov	cx,dx
		xor	bx,bx			; Zero register
		push	si
  
locloop_550:
		mov	al,[si]
		cmp	al,0
		je	loc_554			; Jump if equal
		cmp	al,20h			; ' '
		je	loc_551			; Jump if equal
		cmp	al,9
		je	loc_551			; Jump if equal
		jmp	short loc_552		; (47B2)
loc_551:
		inc	si
		jmp	short locloop_550	; (479F)
loc_552:
		cmp	[bx+di+1],al
data_531	db	75h
		adc	al,[bp+di+46h]
		cmp	byte ptr [bx+di+1],2Eh	; '.'
		je	loc_555			; Jump if equal
		cmp	byte ptr [bx+di+1],20h	; ' '
		je	loc_555			; Jump if equal
		loop	locloop_550		; Loop if cx > 0
  
		jcxz	loc_555			; Jump if cx=0
loc_553:
		pop	si
		push	si
		inc	bp
		cmp	bp,8
		jae	loc_554			; Jump if above or =
		mov	cx,dx
		add	di,0Fh
		xor	bx,bx			; Zero register
		jmp	short locloop_550	; (479F)
loc_554:
		pop	si
data_533	dw	36B4h
;*		jmp	loc_208			;*(226C)
		db	0E9h, 8Ch,0DAh
loc_555:
		mov	al,[di]
		mov	data_165,al		; (020C:139E=0)
		mov	ax,[di+0Dh]
		mov	data_166,ax		; (020C:139F=0)
;*		call	far ptr sub_198		;*(1548:0648)
		db	 9Ah, 48h, 06h, 48h, 15h
		call	sub_56			; (68F0)
		pop	si
		retn
		xchg	bx,bx
		nop
		mov	ax,[si]
		mov	bl,[si+2]
		mov	di,4413h
loc_556:
		cmp	ax,[di]
		jne	loc_557			; Jump if not equal
		cmp	bl,[di+2]
		je	loc_558			; Jump if equal
loc_557:
		add	di,4
		cmp	di,4457h
		jb	loc_556			; Jump if below
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
		jmp	short loc_564		; (4870)
loc_558:
		mov	al,[di+3]
		cmp	al,80h
		je	loc_564			; Jump if equal
		mov	dh,data_323		; (020C:2A77=0A5h)
		cmp	al,40h			; '@'
		jne	loc_559			; Jump if not equal
		mov	al,data_324		; (020C:2A78=20h)
		test	al,0F0h
		jz	loc_559			; Jump if zero
		or	al,8
loc_559:
		mov	data_323,al		; (020C:2A77=0A5h)
loc_560:
		mov	al,data_323		; (020C:2A77=0A5h)
		test	data_325,0Fh		; (020C:2A79=0E0h)
		jz	loc_562			; Jump if zero
		mov	data_325,1		; (020C:2A79=0E0h)
		test	al,10h
		jz	loc_561			; Jump if zero
		mov	data_325,2		; (020C:2A79=0E0h)
		jmp	short loc_563		; (486B)
loc_561:
		test	al,20h			; ' '
		jz	loc_562			; Jump if zero
		mov	data_325,4		; (020C:2A79=0E0h)
data_535	dd	0C0A812EBh
		jz	loc_563			; Jump if zero
		mov	data_325,0Ch		; (020C:2A79=0E0h)
		test	al,80h
		jz	loc_563			; Jump if zero
		mov	data_325,14h		; (020C:2A79=0E0h)
loc_563:
data_542	dw	1B6h
data_543	dw	94E8h
data_544	dw	0C322h
data_545	dw	0DB87h
data_546	dw	5590h
data_547	dw	0EB8Bh
data_548	dw	0DB33h
		xor	cl,cl			; Zero register
		mov	bl,[si]
		sub	bl,30h			; '0'
		cmp	bl,9
		jbe	loc_565			; Jump if below or =
		jmp	loc_571			; (4917)
loc_565:
		mov	al,bl
		inc	si
		dec	bp
		inc	cl
		mov	bl,[si]
		sub	bl,30h			; '0'
		cmp	bl,9
		jbe	loc_566			; Jump if below or =
		mov	bl,al
		jmp	short loc_567		; (48BE)
loc_566:
		mov	ch,0Ah
		mul	ch			; ax = reg * al
		add	bx,ax
		inc	si
		dec	bp
		inc	cl
		mov	dl,[si]
		sub	dl,30h			; '0'
		cmp	dl,9
		ja	loc_567			; Jump if above
		inc	si
		dec	bp
		inc	cl
		mov	ax,bx
		mul	ch			; ax = reg * al
		xor	dh,dh			; Zero register
		add	ax,dx
		mov	bx,ax
loc_567:
		cmp	bx,0
		je	loc_568			; Jump if equal
		cmp	bx,0Ah
		jb	loc_571			; Jump if below
		cmp	bx,0FFh
		ja	loc_571			; Jump if above
loc_568:
		mov	data_382,bl		; (020C:2EBF=6Fh)
		cmp	bl,0
		je	loc_571			; Jump if equal
		mov	di,4BF3h
		mov	word ptr [di-1],2020h
		push	si
		dec	si
		xor	ch,ch			; Zero register
		std				; Set direction flag
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cld				; Clear direction
		pop	si
		cmp	bp,2
		jb	loc_571			; Jump if below
		cmp	bp,32h
		ja	loc_571			; Jump if above
loc_569:
		cmp	byte ptr [si],2Ch	; ','
		je	loc_570			; Jump if equal
		dec	bp
		jz	loc_571			; Jump if zero
		inc	si
		jmp	short loc_569		; (48F2)
loc_570:
		inc	si
		dec	bp
		jz	loc_571			; Jump if zero
		cmp	byte ptr [si],20h	; ' '
		je	loc_570			; Jump if equal
		cmp	byte ptr [si],43h	; 'C'
		jne	loc_571			; Jump if not equal
		inc	si
		mov	al,[si]
		sub	al,30h			; '0'
		cmp	al,3
		ja	loc_571			; Jump if above
		mov	data_378,al		; (020C:2EBA=41h)
loc_571:
		pop	bp
		retn
		xchg	bx,bx
		nop
		mov	data_377,0		; (020C:2EB8=4Eh)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_45		proc	near
		mov	si,3B0h
		mov	dx,3
loc_572:
		mov	cx,17h
		call	sub_85			; (7790)
		add	si,39h
		dec	dx
		jnz	loc_572			; Jump if not zero
		mov	cx,3429h
		sub	cx,2F0Ch
		mov	si,2F0Ch
		call	sub_85			; (7790)
		mov	cx,5030h
		sub	cx,4CDEh
		mov	si,4CDEh
		call	sub_85			; (7790)
		retn
sub_45		endp
  
		xchg	bx,bx
		cmp	data_381,0		; (020C:2EBD=3Dh)
		je	loc_576			; Jump if equal
		cmp	bx,2
		jb	loc_573			; Jump if below
		mov	al,[si+1]
		mov	bl,7
		cmp	al,4Eh			; 'N'
		je	loc_574			; Jump if equal
		xor	bl,bl			; Zero register
		cmp	al,46h			; 'F'
		je	loc_574			; Jump if equal
loc_573:
		mov	byte ptr ds:[4457h],9	; (020C:4457=7)
		jmp	short loc_576		; (498C)
loc_574:
		mov	data_507,bl		; (020C:430B=72h)
		cmp	bl,0
		je	loc_575			; Jump if equal
		cmp	data_233,0Ah		; (020C:263D=9Ah)
		jae	loc_576			; Jump if above or =
		mov	al,0Ah
		call	sub_83			; (7444)
		jmp	short loc_576		; (498C)
loc_575:
		call	sub_73			; (6F98)
loc_576:
		retn
		xchg	bx,bx
		nop
		sub	al,30h			; '0'
		cmp	al,1Fh
		ja	loc_577			; Jump if above
		mov	data_372,al		; (020C:2EB1=0)
loc_577:
		retn
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_46		proc	near
		and	al,0DFh
loc_578:
		cmp	byte ptr [bx],0
		je	loc_580			; Jump if equal
		cmp	al,[bx]
		je	loc_579			; Jump if equal
		add	bx,3
		jmp	short loc_578		; (499E)
loc_579:
		pop	ax
		mov	ax,[bx+1]
		push	ax
		retn
loc_580:
		retn
sub_46		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_47		proc	near
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	dh,byte ptr ds:[2C40h]	; (94E8:2C40=0)
		cmp	dh,2
		jne	loc_581			; Jump if not equal
		call	sub_106			; (80C5)
		cmp	word ptr es:[0],50h	; (065D:0000=4817h)
		nop				;*ASM fixup - sign extn byte
		jbe	loc_582			; Jump if below or =
		cmp	word ptr es:[2],0	; (065D:0002=8015h)
		jne	loc_582			; Jump if not equal
		mov	word ptr es:[2],100h	; (065D:0002=8015h)
		sub	word ptr es:[0],10h	; (065D:0000=4817h)
		nop				;*ASM fixup - sign extn byte
		cmp	word ptr es:[4],0FE00h	; (065D:0004=1E3Eh)
		jae	loc_582			; Jump if above or =
		add	word ptr es:[4],100h	; (065D:0004=1E3Eh)
		jmp	short loc_582		; (4A1E)
loc_581:
		call	sub_106			; (80C5)
		cmp	word ptr es:[2],100h	; (065D:0002=8015h)
		jne	loc_582			; Jump if not equal
		mov	word ptr es:[2],0	; (065D:0002=8015h)
		add	word ptr es:[0],10h	; (065D:0000=4817h)
		nop				;*ASM fixup - sign extn byte
		cmp	word ptr es:[4],100h	; (065D:0004=1E3Eh)
		jbe	loc_582			; Jump if below or =
		sub	word ptr es:[4],100h	; (065D:0004=1E3Eh)
loc_582:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_583			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_583			; Jump if equal
		call	sub_115			; (83A4)
loc_583:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
sub_47		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_48		proc	near
		push	bx
		push	cx
		push	si
		push	ds
		push	es
		call	sub_109			; (80CE)
		mov	si,1551h
		push	cs
		pop	ds
		mov	cx,16h
		mov	bl,70h			; 'p'
		cld				; Clear direction
  
locloop_584:
		lodsb				; String [si] to al
		sub	al,bl
		stosb				; Store al to es:[di]
		inc	bl
		loop	locloop_584		; Loop if cx > 0
  
		pop	es
		pop	ds
		pop	si
		pop	cx
		pop	bx
		retn
sub_48		endp
  
		db	0C6h
		xchg	ax,cx
		mov	ch,0C2h
		db	0C1h
		retn	0C5CBh
		db	0C1h
		mov	sp,0CFBBh
		db	0C5h
		int	3			; Debug breakpoint
		int	3			; Debug breakpoint
		shr	data_662[si],cl		; (020C:CBA1=0BEh) Shift w/zeros fill
		rol	di,1			; Rotate
		mov	bl,0
		db	8 dup (0)
loc_585:
		mov	si,42F0h
		cmp	byte ptr data_346+2,0	; (020C:2C3E=4Dh)
		je	loc_586			; Jump if equal
		jmp	loc_370			; (38E5)
loc_586:
		mov	dh,1
		mov	dl,37h			; '7'
		call	sub_157			; (C364)
		or	dh,dh			; Zero ?
		jz	loc_587			; Jump if zero
		or	word ptr [si-2Ah],4
		mov	dl,25h			; '%'
		call	sub_157			; (C364)
loc_587:
		mov	ax,data_480		; (020C:42CC=0D323h)
		mov	data_478,ax		; (020C:42C8=474h)
		mov	ax,data_481		; (020C:42CE=1689h)
		mov	data_479,ax		; (020C:42CA=0D3F7h)
		test	data_480,2		; (020C:42CC=0D323h)
		jz	loc_588			; Jump if zero
		mov	al,1
;*		call	far ptr sub_222		;*(1548:12D0)
		db	 9Ah,0D0h, 12h, 48h, 15h
loc_588:
		mov	dl,byte ptr ds:[2A94h]	; (020C:2A94=8Dh)
		add	dl,61h			; 'a'
		mov	data_343,dl		; (020C:2BF3=0)
		mov	dx,386Fh
		mov	ah,1Ah
		int	21h			; DOS Services  ah=function 1Ah
						;  set DTA to ds:dx
		mov	dx,2BF5h
		cmp	data_345,3Ah		; (020C:2BF6=0) ':'
		je	loc_589			; Jump if equal
		mov	dx,2BF3h
loc_589:
		mov	cx,0
		mov	ah,4Eh			; 'N'
		int	21h			; DOS Services  ah=function 4Eh
						;  find 1st filenam match @ds:dx
		jc	loc_592			; Jump if carry Set
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,174Bh
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_63			; (6BFC)
		mov	al,data_156		; (020C:11E8=0)
		mov	[bx+52h],al
		mov	ah,19h
		call	sub_65			; (6C58)
		call	sub_56			; (68F0)
loc_590:
		test	data_383,4		; (020C:2EC4=65h)
		jnz	loc_592			; Jump if not zero
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		and	al,0DFh
		cmp	al,59h			; 'Y'
		je	loc_592			; Jump if equal
		cmp	al,4Eh			; 'N'
		je	loc_591			; Jump if equal
;*		call	far ptr sub_197		;*(1548:0628)
		db	 9Ah, 28h, 06h, 48h, 15h
		jmp	short loc_590		; (4B02)
loc_591:
		mov	dl,byte ptr ds:[2A93h]	; (020C:2A93=14h)
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
		call	sub_70			; (6F08)
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		jmp	loc_370			; (38E5)
loc_592:
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	byte ptr [bx+52h],0Fh
		call	sub_70			; (6F08)
		call	sub_109			; (80CE)
		mov	cx,0Ch
		mov	si,34Ah
		mov	di,2CD0h
  
locloop_593:
		cmp	byte ptr [si],0
		je	loc_594			; Jump if equal
		cmp	byte ptr [si],20h	; ' '
		je	loc_594			; Jump if equal
		cld				; Clear direction
		movsb				; Mov [si] to es:[di]
		loop	locloop_593		; Loop if cx > 0
  
loc_594:
		mov	bx,4298h
		mov	cx,20h
		mov	si,358h
		mov	di,2CE0h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		test	word ptr [bx+2Eh],2
		jz	loc_595			; Jump if zero
		jmp	loc_199			; (220C)
loc_595:
		test	word ptr ds:[42CEh],20h	; (94E8:42CE=0F78Bh)
		jnz	loc_596			; Jump if not zero
		mov	byte ptr ds:[587Fh],2Ah	; (94E8:587F=0C8h) '*'
		mov	byte ptr ds:[5A95h],2Ah	; (94E8:5A95=8Ah) '*'
loc_596:
		cmp	word ptr ds:[2A24h],0	; (94E8:2A24=0F300h)
		jne	loc_599			; Jump if not equal
		mov	bx,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		mov	ax,cs
		sub	ax,10h
		push	es
		mov	es,ax
		mov	ah,4Ah			; 'J'
		int	21h			; DOS Services  ah=function 4Ah
						;  change mem allocation, bx=siz
		pop	es
		jnc	loc_597			; Jump if carry=0
		mov	ax,8
;*		jmp	loc_192			;*(2199)
		db	0E9h,0F4h,0D5h
loc_597:
		call	sub_112			; (80E6)
		mov	bx,cs
		sub	ax,bx
		sub	ax,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		mov	cx,0FFFFh
		cmp	ax,1000h
		jae	loc_598			; Jump if above or =
		mov	cx,ax
		shl	cx,1			; Shift w/zeros fill
		shl	cx,1			; Shift w/zeros fill
		shl	cx,1			; Shift w/zeros fill
		shl	cx,1			; Shift w/zeros fill
loc_598:
		mov	word ptr ds:[430Eh],cx	; (94E8:430E=83EBh)
		shr	cx,1			; Shift w/zeros fill
		jmp	short loc_601		; (4BF0)
loc_599:
		call	sub_110			; (80D1)
		mov	ax,es
		mov	cx,word ptr ds:[2A24h]	; (94E8:2A24=0F300h)
		sub	cx,ax
		cmp	cx,1000h
		jbe	loc_600			; Jump if below or =
		mov	cx,1000h
loc_600:
		shl	cx,1			; Shift w/zeros fill
		shl	cx,1			; Shift w/zeros fill
		shl	cx,1			; Shift w/zeros fill
		mov	word ptr ds:[430Eh],cx	; (94E8:430E=83EBh)
		dec	word ptr ds:[430Eh]	; (94E8:430E=83EBh)
		shl	word ptr ds:[430Eh],1	; (94E8:430E=83EBh) Shift w/zeros fill
loc_601:
		call	sub_110			; (80D1)
		mov	ax,0FFFFh
		xor	di,di			; Zero register
		cld				; Clear direction
		rep	stosw			; Rep when cx >0 Store ax to es:[di]
		call	sub_109			; (80CE)
		mov	ah,2Ch			; ','
		int	21h			; DOS Services  ah=function 2Ch
						;  get time, cx=hrs/min, dh=sec
		mov	word ptr ds:[42FFh],cx	; (94E8:42FF=2688h)
		mov	word ptr ds:[4301h],dx	; (94E8:4301=383h)
		call	sub_63			; (6BFC)
		mov	al,byte ptr ds:[11E7h]	; (94E8:11E7=0)
		mov	[bx+4Ch],al
		mov	byte ptr [bx+4Eh],7
		mov	byte ptr [bx+3Fh],0
		mov	byte ptr [bx+40h],0
		mov	byte ptr [bx+56h],0
		mov	byte ptr [bx+70h],0
		mov	byte ptr [bx+71h],0
		mov	byte ptr [bx+72h],0
		mov	byte ptr [bx+73h],0
		mov	byte ptr [bx+74h],0
		mov	byte ptr [bx+75h],0
		mov	byte ptr [bx+34h],0
		mov	byte ptr [bx+35h],0
		mov	byte ptr [bx+36h],0
		call	sub_114			; (81F8)
		mov	dl,0
loc_602:
		call	sub_106			; (80C5)
		mov	ax,15h
		mul	dl			; ax = reg * al
		add	ax,0
		mov	bx,ax
		mov	ax,es:[bx+0Ah]
		and	al,3
		cmp	al,2
		ja	loc_604			; Jump if above
		mov	ax,es:[bx]
		mov	di,es:[bx+2]
		mov	cx,es:[bx+4]
		mov	es,ax
		sub	cx,di
		cmp	cx,3E8h
		jb	loc_603			; Jump if below
		mov	cx,3E8h
loc_603:
		call	sub_86			; (77B4)
		jc	loc_605			; Jump if carry Set
loc_604:
		inc	dl
		cmp	dl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		jbe	loc_602			; Jump if below or =
loc_605:
		jmp	loc_2534		; (EBB0)
		cmp	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
		je	loc_606			; Jump if equal
		call	sub_109			; (80CE)
		mov	di,358h
		mov	cx,21h
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		call	sub_63			; (6BFC)
		mov	byte ptr [bx+52h],0
		mov	byte ptr [bx+69h],0Fh
		mov	byte ptr [bx+33h],0Fh
		mov	byte ptr [bx+66h],0Fh
		mov	byte ptr [bx+67h],0Fh
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,912h
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_56			; (68F0)
		mov	si,358h
		mov	cl,20h			; ' '
		mov	bl,1
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		mov	byte ptr [bx+69h],7
		mov	byte ptr [bx+66h],7
		mov	byte ptr [bx+67h],0
		call	sub_70			; (6F08)
		call	sub_57			; (699C)
loc_606:
		jmp	loc_371			; (3903)
		cmp	byte ptr cs:[4CE7h],0	; (020C:4CE7=1Fh)
		je	loc_607			; Jump if equal
;*		call	far ptr sub_197		;*(1548:0628)
		db	 9Ah, 28h, 06h, 48h, 15h
		jmp	loc_371			; (3903)
loc_607:
		call	sub_49			; (4D18)
		cmp	byte ptr ds:[2BB2h],0	; (94E8:2BB2=7)
		je	loc_608			; Jump if equal
		call	sub_114			; (81F8)
loc_608:
		call	sub_64			; (6C24)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_49		proc	near
		call	sub_63			; (6BFC)
		mov	byte ptr [bx+53h],0
		mov	byte ptr [bx+67h],0Fh
		mov	ah,2
		call	sub_65			; (6C58)
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,171Ah
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_56			; (68F0)
		mov	cl,28h			; '('
		mov	bl,1
		mov	si,7C0h
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		mov	bl,28h			; '('
		sub	bl,cl
		xor	bh,bh			; Zero register
		cmp	bx,0
		jne	loc_609			; Jump if not equal
		jmp	short loc_613		; (4DC9)
loc_609:
		cmp	al,1Bh
		jne	loc_610			; Jump if not equal
		jmp	short loc_613		; (4DC9)
loc_610:
		call	sub_109			; (80CE)
		mov	di,7C0h
		mov	al,20h			; ' '
		mov	cx,bx
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		jz	loc_613			; Jump if zero
		mov	di,7C0h
		mov	al,20h			; ' '
;*		call	far ptr sub_195		;*(1548:04A4)
		db	 9Ah,0A4h, 04h, 48h, 15h
;*		call	far ptr sub_196		;*(1548:0510)
		db	 9Ah, 10h, 05h, 48h, 15h
		mov	byte ptr ds:[2C3Fh],al	; (94E8:2C3F=3)
		cmp	al,1
		jbe	loc_611			; Jump if below or =
		cmp	al,0Bh
		jbe	loc_612			; Jump if below or =
loc_611:
		mov	ah,10h
		call	sub_65			; (6C58)
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	al,byte ptr ds:[11E8h]	; (94E8:11E8=0)
		mov	[bx+52h],al
		call	sub_70			; (6F08)
		call	sub_56			; (68F0)
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		jmp	short loc_613		; (4DC9)
loc_612:
		mov	di,2BB2h
		mov	cx,40h
		mov	al,0
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	di,629h
		mov	cx,0Ch
		mov	al,20h			; ' '
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	si,7C0h
		mov	di,2BB2h
		mov	cx,bx
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		dec	di
;*		call	far ptr sub_235		;*(1548:1740)
		db	 9Ah, 40h, 17h, 48h, 15h
		call	sub_129			; (9E64)
		jnc	loc_613			; Jump if carry=0
;*		jmp	loc_192			;*(2199)
		db	0E9h,0D0h,0D3h
loc_613:
		mov	ah,byte ptr ds:[2C3Eh]	; (94E8:2C3E=0B9h)
		call	sub_65			; (6C58)
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		mov	byte ptr [bx+53h],7
		mov	byte ptr [bx+67h],0
		call	sub_70			; (6F08)
		call	sub_57			; (699C)
		retn
sub_49		endp
  
		cmp	byte ptr ds:[14ACh],1	; (020C:14AC=0)
		jne	loc_614			; Jump if not equal
		xor	data_169,1		; (020C:14AD=0)
		jmp	short loc_615		; (4DFD)
loc_614:
		inc	data_169		; (020C:14AD=0)
		and	data_169,3		; (020C:14AD=0)
loc_615:
		call	sub_74			; (6FDC)
		call	sub_45			; (4921)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		test	data_323,0C0h		; (020C:2A77=0A5h)
		jnz	loc_618			; Jump if not zero
		mov	dh,data_325		; (020C:2A79=0E0h)
		test	dh,0Fh
		jz	loc_616			; Jump if zero
		mov	dh,0
		jmp	short loc_620		; (4E42)
loc_616:
		mov	dh,1
		test	data_323,10h		; (020C:2A77=0A5h)
		jz	loc_617			; Jump if zero
		mov	dh,2
loc_617:
		test	data_323,20h		; (020C:2A77=0A5h) ' '
		jz	loc_620			; Jump if zero
		mov	dh,4
		jmp	short loc_620		; (4E42)
loc_618:
		test	data_323,40h		; (020C:2A77=0A5h) '@'
		jz	loc_619			; Jump if zero
		mov	dh,0Ch
		jmp	short loc_620		; (4E42)
loc_619:
		mov	dh,14h
		jmp	short loc_620		; (4E42)
loc_620:
		mov	data_325,dh		; (020C:2A79=0E0h)
		mov	dh,1
		call	sub_62			; (6B04)
		jmp	loc_371			; (3903)
		call	sub_63			; (6BFC)
		mov	byte ptr [bx+68h],0
		mov	byte ptr [bx+67h],0Fh
		mov	ah,3
		call	sub_65			; (6C58)
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,171Ah
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_56			; (68F0)
		mov	cl,28h			; '('
		mov	bl,3
		mov	si,7C0h
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		mov	bl,28h			; '('
		sub	bl,cl
		xor	bh,bh			; Zero register
		cmp	bx,0
		je	loc_621			; Jump if equal
		cmp	al,1Bh
		je	loc_621			; Jump if equal
		call	sub_109			; (80CE)
		mov	di,7C0h
		mov	al,20h			; ' '
		mov	cx,bx
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		jnz	loc_622			; Jump if not zero
loc_621:
		jmp	loc_626			; (4F21)
loc_622:
		cld				; Clear direction
		mov	di,2BF5h
		mov	cx,29h
		mov	al,0
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	di,34Ah
		mov	cx,0Ch
		mov	al,20h			; ' '
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	si,7C0h
		mov	di,2BF5h
		mov	cx,bx
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
;*		call	far ptr sub_193		;*(1548:0420)
		db	 9Ah, 20h, 04h, 48h, 15h
		add	bx,4
		inc	di
		mov	cx,bx
loc_623:
		mov	al,[di]
		cmp	al,3Ah			; ':'
		je	loc_624			; Jump if equal
		cmp	al,5Ch			; '\'
		je	loc_624			; Jump if equal
		cmp	cx,1
		jbe	loc_625			; Jump if below or =
		dec	cx
		dec	di
		jmp	short loc_623		; (4EC5)
loc_624:
		inc	di
loc_625:
		sub	bx,cx
		mov	cx,bx
		inc	cx
		cmp	cx,0Ch
		ja	loc_626			; Jump if above
		mov	si,di
		mov	di,34Ah
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cmp	byte ptr ds:[2BF6h],3Ah	; (94E8:2BF6=9Ah) ':'
		jne	loc_626			; Jump if not equal
		mov	al,byte ptr ds:[2BF5h]	; (94E8:2BF5=66h)
		and	al,5Fh			; '_'
		cmp	al,41h			; 'A'
		jb	loc_626			; Jump if below
		cmp	al,5Ah			; 'Z'
		ja	loc_626			; Jump if above
		mov	dl,al
		sub	dl,41h			; 'A'
		mov	bl,dl
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
		mov	ah,19h
		int	21h			; DOS Services  ah=function 19h
						;  get default drive al  (0=a:)
		mov	byte ptr ds:[2A94h],al	; (94E8:2A94=0C1h)
		add	al,61h			; 'a'
		mov	byte ptr ds:[64Eh],al	; (94E8:064E=0C7h)
		call	sub_61			; (6A4C)
		mov	dl,byte ptr ds:[2A93h]	; (94E8:2A93=6)
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
loc_626:
		call	sub_64			; (6C24)
		mov	byte ptr [bx+68h],7
		mov	byte ptr [bx+67h],0
		mov	ah,byte ptr ds:[2C3Eh]	; (94E8:2C3E=0B9h)
		call	sub_65			; (6C58)
		call	sub_70			; (6F08)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		mov	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		add	al,2
		cmp	al,14h
		jb	loc_627			; Jump if below
		mov	al,4
loc_627:
		call	sub_83			; (7444)
		jmp	loc_371			; (3903)
loc_628:
		mov	ah,11h
;*		jmp	loc_208			;*(226C)
		db	0E9h, 1Ah,0D3h
		mov	al,byte ptr ds:[152Ah]	; (94E8:152A=0EBh)
		mov	bx,152Ch
		xlat				; al=[al+[bx]] table
		mov	byte ptr ds:[152Ah],al	; (94E8:152A=0EBh)
		call	sub_75			; (7024)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		cmp	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
		je	loc_631			; Jump if equal
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		cmp	byte ptr ds:[2EBCh],0	; (94E8:2EBC=3Dh)
		je	loc_629			; Jump if equal
		mov	byte ptr ds:[2EBCh],0	; (94E8:2EBC=3Dh)
		mov	byte ptr [bx+6Bh],0
		jmp	short loc_630		; (4F8B)
loc_629:
		mov	byte ptr ds:[2EBCh],1	; (94E8:2EBC=3Dh)
		mov	byte ptr [bx+6Bh],7
loc_630:
		call	sub_57			; (699C)
loc_631:
		jmp	loc_371			; (3903)
		mov	di,13A1h
		mov	al,byte ptr ds:[139Eh]	; (94E8:139E=6)
		xor	cl,cl			; Zero register
loc_632:
		cmp	al,[di]
		je	loc_633			; Jump if equal
		inc	cl
		cmp	cl,8
		jae	loc_633			; Jump if above or =
		add	di,0Fh
		jmp	short loc_632		; (4F99)
loc_633:
		cmp	cl,7
		jb	loc_634			; Jump if below
		mov	di,1392h
loc_634:
		add	di,0Fh
		mov	al,[di]
		mov	byte ptr ds:[139Eh],al	; (94E8:139E=6)
		mov	ax,[di+0Dh]
		mov	word ptr ds:[139Fh],ax	; (94E8:139F=10E9h)
;*		call	far ptr sub_198		;*(1548:0648)
		db	 9Ah, 48h, 06h, 48h, 15h
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		add	[bp+si],ax
		add	al,10h
		sbb	[bx+si],ah
		sub	[bx+si+48h],al
		add	byte ptr ds:[8A88h][bx+si],al	; (94E8:8A88=0A4h)
		db	36h
		ja	loc_638			; Jump if above
		mov	ax,0
		push	si
		mov	si,1ABAh
loc_635:
		cmp	dh,cs:[si]
		je	loc_637			; Jump if equal
		inc	si
		cmp	byte ptr cs:[si],0
		je	loc_636			; Jump if equal
		jmp	short loc_635		; (4FE1)
loc_636:
		mov	dh,1
		mov	byte ptr ds:[2A79h],0	; (94E8:2A79=0BFh)
		dec	si
loc_637:
		inc	si
		cmp	byte ptr cs:[si],0
		jne	loc_639			; Jump if not equal
		mov	si,1ABAh
		mov	byte ptr ds:[2A79h],0	; (94E8:2A79=0BFh)
loc_639:
		mov	dh,cs:[si]
		pop	si
		mov	byte ptr ds:[2A77h],dh	; (94E8:2A77=4Ah)
		test	byte ptr ds:[2A79h],0Fh	; (94E8:2A79=0BFh)
		jz	loc_641			; Jump if zero
		mov	byte ptr ds:[2A79h],1	; (94E8:2A79=0BFh)
		test	dh,10h
		jz	loc_640			; Jump if zero
		mov	byte ptr ds:[2A79h],2	; (94E8:2A79=0BFh)
		jmp	short loc_641		; (5032)
loc_640:
		test	dh,20h			; ' '
		jz	loc_641			; Jump if zero
		mov	byte ptr ds:[2A79h],4	; (94E8:2A79=0BFh)
		jmp	short loc_642		; (504A)
loc_641:
		test	byte ptr ds:[2A77h],0C0h	; (94E8:2A77=4Ah)
		jz	loc_642			; Jump if zero
		mov	byte ptr ds:[2A79h],0Ch	; (94E8:2A79=0BFh)
		test	byte ptr ds:[2A77h],80h	; (94E8:2A77=4Ah)
		jz	loc_642			; Jump if zero
		mov	byte ptr ds:[2A79h],14h	; (94E8:2A79=0BFh)
loc_642:
		mov	dh,1
		call	sub_62			; (6B04)
		jmp	loc_371			; (3903)
		cmp	byte ptr ds:[2EB8h],0	; (94E8:2EB8=0FFh)
		je	loc_643			; Jump if equal
		mov	byte ptr ds:[2EB8h],0	; (94E8:2EB8=0FFh)
		jmp	short loc_644		; (5065)
loc_643:
		mov	byte ptr ds:[2EB8h],60h	; (94E8:2EB8=0FFh) '`'
loc_644:
		call	sub_45			; (4921)
		call	sub_57			; (699C)
		jmp	loc_371			; (3903)
		cmp	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
		je	loc_647			; Jump if equal
		mov	bl,byte ptr ds:[430Bh]	; (94E8:430B=21h)
		test	bl,7
		jz	loc_645			; Jump if zero
		mov	byte ptr ds:[430Bh],0	; (94E8:430B=21h)
		jmp	short loc_646		; (5092)
loc_645:
		or	byte ptr ds:[430Bh],7	; (94E8:430B=21h)
		mov	al,0Ah
		call	sub_83			; (7444)
		jmp	loc_371			; (3903)
loc_646:
		call	sub_73			; (6F98)
		jmp	loc_371			; (3903)
loc_647:
		jmp	loc_376			; (394F)
		call	sub_63			; (6BFC)
		mov	ah,18h
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		sub	al,30h			; '0'
		cmp	al,3Fh			; '?'
		ja	loc_648			; Jump if above
		mov	byte ptr ds:[2EB1h],al	; (94E8:2EB1=0C9h)
		push	ax
		push	cx
		push	di
		push	es
		push	ds
		pop	es
		mov	cx,1Dh
		mov	al,20h			; ' '
		mov	di,6E8h
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	bp,6FCh
		mov	ax,word ptr ds:[430Eh]	; (94E8:430E=83EBh)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	di,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	byte ptr [di+5Dh],7
		pop	es
		pop	di
		pop	cx
		pop	ax
		test	al,8
		jnz	loc_649			; Jump if not zero
loc_648:
		jmp	loc_650			; (5172)
loc_649:
		and	byte ptr ds:[2EB1h],0F7h	; (94E8:2EB1=0C9h)
		mov	ah,23h			; '#'
		call	sub_65			; (6C58)
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,1710h
		call	sub_77			; (70B4)
		call	sub_71			; (6F14)
		call	sub_56			; (68F0)
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		mov	dl,al
		sub	al,30h			; '0'
		cmp	al,10h
		ja	loc_650			; Jump if above
		shl	al,1			; Shift w/zeros fill
		mov	byte ptr ds:[2EB2h],al	; (94E8:2EB2=33h)
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,1727h
		call	sub_77			; (70B4)
		mov	cl,4
		mov	bl,2
		mov	si,7CDh
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		cmp	al,1Bh
		je	loc_650			; Jump if equal
		cmp	cl,0
		jne	loc_650			; Jump if not equal
		mov	cx,80h
		mov	di,7CDh
		call	sub_38			; (3DF8)
		jnc	loc_650			; Jump if carry=0
		mov	word ptr ds:[2EB3h],dx	; (94E8:2EB3=0E8D2h)
		mov	dl,3Ah			; ':'
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		mov	cl,4
		mov	bl,2
		mov	si,7D2h
;*		call	far ptr sub_188		;*(1548:02B0)
		db	 9Ah,0B0h, 02h, 48h, 15h
		cmp	al,1Bh
		je	loc_650			; Jump if equal
		cmp	cl,0
		jne	loc_650			; Jump if not equal
		mov	cx,80h
		mov	di,7D2h
		call	sub_38			; (3DF8)
		jnc	loc_650			; Jump if carry=0
		mov	word ptr ds:[2EB5h],dx	; (94E8:2EB5=819h)
		or	byte ptr ds:[2EB1h],8	; (94E8:2EB1=0C9h)
loc_650:
		call	sub_70			; (6F08)
		call	sub_64			; (6C24)
		jmp	loc_370			; (38E5)
loc_651:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		cmp	byte ptr ds:[1309h],1	; (94E8:1309=53h)
		jne	loc_655			; Jump if not equal
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,500h
		call	sub_77			; (70B4)
		mov	si,53h
		mov	cx,643h
		sub	cx,53h
		nop				;*ASM fixup - sign extn byte
		dec	cx
		call	sub_110			; (80D1)
  
locloop_652:
		mov	dl,es:[si]
		sub	dl,24h			; '$'
		cmp	dl,23h			; '#'
		je	loc_653			; Jump if equal
		cmp	dl,40h			; '@'
		jne	loc_654			; Jump if not equal
loc_653:
		mov	dl,20h			; ' '
loc_654:
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		inc	si
		loop	locloop_652		; Loop if cx > 0
  
		jmp	loc_663			; (526A)
loc_655:
		mov	dx,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,dx
		mov	di,320h
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	si,53h
		mov	cx,643h
		sub	cx,53h
		nop				;*ASM fixup - sign extn byte
		call	sub_58			; (69B0)
		mov	al,20h			; ' '
		mov	bh,7
		call	sub_105			; (80BC)
  
locloop_656:
		mov	bl,bh
		cmp	byte ptr [si],64h	; 'd'
		jne	loc_657			; Jump if not equal
		mov	bh,0Fh
		mov	bl,bh
		jmp	short loc_658		; (51F9)
loc_657:
		cmp	byte ptr [si],47h	; 'G'
		jne	loc_659			; Jump if not equal
		push	ds
		call	sub_104			; (80B9)
		mov	bl,byte ptr ds:[11E7h]	; (94E8:11E7=0)
		pop	ds
loc_658:
		cld				; Clear direction
		stosb				; Store al to es:[di]
		inc	si
		mov	es:[di],bl
		inc	di
		dec	cx
		jmp	short loc_660		; (5211)
loc_659:
		cmp	byte ptr [si],0A4h
		jb	loc_660			; Jump if below
		push	ds
		call	sub_104			; (80B9)
		mov	bl,byte ptr ds:[11E6h]	; (94E8:11E6=0)
		pop	ds
loc_660:
		cld				; Clear direction
		push	ax
		lodsb				; String [si] to al
		sub	al,24h			; '$'
		stosb				; Store al to es:[di]
		pop	ax
		mov	es:[di],bl
		inc	di
		loop	locloop_656		; Loop if cx > 0
  
		mov	si,21h
		mov	cx,3Ah
		sub	cx,21h
		nop				;*ASM fixup - sign extn byte
		mov	di,14Bh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		push	ds
		call	sub_104			; (80B9)
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		pop	ds
		cld				; Clear direction
  
locloop_661:
		movsb				; Mov [si] to es:[di]
		inc	di
		loop	locloop_661		; Loop if cx > 0
  
		mov	si,3Ah
		mov	cx,3Ah
		sub	cx,21h
		nop				;*ASM fixup - sign extn byte
		mov	di,14Bh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,0A0h
		push	ds
		call	sub_104			; (80B9)
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		pop	ds
		cld				; Clear direction
  
locloop_662:
		movsb				; Mov [si] to es:[di]
		inc	di
		loop	locloop_662		; Loop if cx > 0
  
		call	sub_104			; (80B9)
		call	sub_59			; (69D4)
loc_663:
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_664			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_664			; Jump if equal
		call	sub_115			; (83A4)
loc_664:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		jmp	loc_370			; (38E5)
		db	15 dup (0)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_50		proc	near
		test	word ptr ds:[2EC4h],8	; (94E8:2EC4=8BA4h)
		jnz	loc_665			; Jump if not zero
		jmp	short loc_669		; (531B)
loc_665:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_666			; Jump if not equal
		cmp	byte ptr cs:[4CE7h],0	; (020C:4CE7=1Fh)
		je	loc_669			; Jump if equal
loc_666:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	bx,1E0Ch
		mov	dx,7
		call	sub_32			; (2D80)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_667			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_667			; Jump if equal
		call	sub_115			; (83A4)
loc_667:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_668			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
data_553	db	74h
		add	bp,ax
		xchg	ax,bp
		xor	byte ptr ds:[168Bh],ch	; (94E8:168B=0F9h)
		xchg	ax,dx
		add	[di+5Fh],bl
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
loc_669:
		retn
sub_50		endp
  
		push	ax
		push	bx
		push	cx
		push	dx
data_554	db	56h
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	bp,word ptr es:[0]	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		mov	si,8
		call	sub_104			; (80B9)
		cmp	word ptr ds:[2A82h],6	; (94E8:2A82=0F71Bh)
		jbe	loc_670			; Jump if below or =
		jmp	short loc_679		; (53BA)
loc_670:
		mov	di,6C4Bh
		mov	bx,377Fh
		dw	448Ah
		add	ax,0F25h
		add	bh,dl
		or	al,al			; Zero ?
		jnz	loc_671			; Jump if not zero
		mov	al,es:[si+6]
loc_671:
		cmp	ax,6
		ja	loc_672			; Jump if above
		jmp	loc_682			; (5400)
loc_672:
		mov	cx,ax
		mov	al,es:[si+5]
		and	al,0Ch
		cmp	si,8
		jne	loc_673			; Jump if not equal
		mov	dl,al
loc_673:
		mov	di,6C5Ah
		cmp	al,dl
		je	loc_674			; Jump if equal
		jmp	loc_682			; (5400)
loc_674:
		cmp	al,8
		je	loc_675			; Jump if equal
		cmp	al,4
		je	loc_675			; Jump if equal
		cmp	al,0
		je	loc_675			; Jump if equal
		jmp	short loc_682		; (5400)
loc_675:
		mov	di,6C2Dh
		mov	bx,es:[si]
		mov	ax,es:[si+2]
		cmp	bx,0FFFFh
		jne	loc_676			; Jump if not equal
		cmp	ax,0FFFFh
		jne	loc_676			; Jump if not equal
		jmp	short loc_678		; (53B1)
loc_676:
		add	si,cx
		cmp	bx,es:[si]
		jb	loc_677			; Jump if below
		ja	loc_682			; Jump if above
		cmp	ax,es:[si+2]
		jbe	loc_677			; Jump if below or =
		ja	loc_682			; Jump if above
loc_677:
		jmp	short loc_670		; (5343)
loc_678:
		mov	di,6C3Ch
		add	si,cx
		cmp	si,bp
		jne	loc_682			; Jump if not equal
loc_679:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_680			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_680			; Jump if equal
		call	sub_115			; (83A4)
loc_680:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_681			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_681			; Jump if equal
		call	sub_115			; (83A4)
loc_681:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
loc_682:
		call	sub_104			; (80B9)
		push	si
		mov	bp,2432h
		cmp	dl,8
		je	loc_683			; Jump if equal
		cmp	dl,4
		je	loc_684			; Jump if equal
		cmp	dl,0
		je	loc_685			; Jump if equal
		mov	si,6C01h
		jmp	short loc_686		; (542A)
loc_683:
		mov	si,6BF6h
		jmp	short loc_686		; (542A)
loc_684:
		mov	si,6BE0h
		jmp	short loc_686		; (542A)
loc_685:
		mov	si,6BEBh
		jmp	short loc_686		; (542A)
loc_686:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	bp,243Dh
		mov	ax,es
		cmp	ax,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		jne	loc_687			; Jump if not equal
		mov	si,6C17h
		mov	ax,word ptr cs:[4863h]	; (020C:4863=7480h)
		jmp	short loc_688		; (5447)
loc_687:
		mov	si,6C22h
loc_688:
		push	ax
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	ax
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		pop	si
		mov	ax,si
		mov	bp,2457h
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	bp,245Eh
		mov	al,byte ptr data_232	; (020C:263B=3Eh)
;*		call	far ptr sub_181		;*(1548:0078)
		db	 9Ah, 78h, 00h, 48h, 15h
		mov	si,di
		mov	bp,2461h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
;*		jmp	loc_206			;*(2253)
		db	0E9h,0DDh,0CDh
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_51		proc	near
		retn
sub_51		endp
  
		db	7 dup (0)
loc_689:
		mov	ah,2Ah			; '*'
		call	sub_65			; (6C58)
		call	sub_56			; (68F0)
		mov	dx,37AAh
		mov	ah,3Dh			; '='
		mov	al,0
		mov	cx,0
		int	21h			; DOS Services  ah=function 3Dh
						;  open file, al=mode,name@ds:dx
		jnc	loc_692			; Jump if carry=0
		cmp	byte ptr ds:[2C3Fh],1	; (94E8:2C3F=3)
		ja	loc_691			; Jump if above
		jnz	loc_690			; Jump if not zero
		mov	bl,1
;*		jmp	loc_182			;*(20B5)
		db	0E9h, 11h,0CCh
loc_690:
		jmp	loc_370			; (38E5)
loc_691:
		jmp	loc_369			; (38DD)
loc_692:
		mov	word ptr ds:[37EAh],ax	; (94E8:37EA=7400h)
		mov	byte ptr ds:[2A2Bh],0	; (94E8:2A2B=0Ah)
		mov	byte ptr ds:[38AEh],0FFh	; (94E8:38AE=3Ch)
		inc	word ptr ds:[38ACh]	; (94E8:38AC=82h)
		call	sub_109			; (80CE)
loc_693:
		cmp	byte ptr ds:[386Eh],1	; (94E8:386E=5Fh)
		je	loc_695			; Jump if equal
		mov	byte ptr ds:[386Eh],0	; (94E8:386E=5Fh)
		mov	ah,3Fh			; '?'
		mov	bx,word ptr ds:[37EAh]	; (94E8:37EA=7400h)
		mov	cx,80h
		mov	dx,37EEh
		int	21h			; DOS Services  ah=function 3Fh
						;  read file, cx=bytes, to ds:dx
		jnc	loc_694			; Jump if carry=0
		mov	bl,0Eh
		jmp	loc_868			; (60F1)
loc_694:
		cmp	ax,80h
		je	loc_698			; Jump if equal
		cmp	ax,0
		jne	loc_696			; Jump if not equal
loc_695:
		jmp	loc_870			; (60F7)
loc_696:
		mov	byte ptr ds:[386Eh],1	; (94E8:386E=5Fh)
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	di,37EEh
		add	di,ax
		mov	cx,80h
		sub	cx,ax
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_697			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_697			; Jump if equal
		call	sub_115			; (83A4)
loc_697:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_698:
		mov	di,37EEh
		mov	cx,80h
loc_699:
		cmp	byte ptr ds:[38AEh],0FFh	; (94E8:38AE=3Ch)
		jne	loc_700			; Jump if not equal
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
		jmp	short loc_703		; (5575)
loc_700:
		mov	al,0Ah
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		pushf				; Push flags
		pop	bp
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_701			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_701			; Jump if equal
		call	sub_115			; (83A4)
loc_701:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		push	bp
		popf				; Pop flags
		jz	loc_702			; Jump if zero
		jmp	loc_693			; (54BE)
loc_702:
		inc	word ptr ds:[38ACh]	; (94E8:38AC=82h)
loc_703:
		push	cx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	ax,word ptr ds:[38ACh]	; (94E8:38AC=82h)
		mov	bl,1
		mov	bp,21F3h
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	cx,5
		mov	es,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	bp,21F3h
		mov	di,7A9h
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		add	di,21F3h
		sub	di,21D5h
		shl	di,1			; Shift w/zeros fill
  
locloop_704:
		push	ds
		call	sub_104			; (80B9)
		mov	ah,ds:[bp]
		pop	ds
		call	sub_60			; (69F0)
		inc	bp
		inc	di
		inc	di
		loop	locloop_704		; Loop if cx > 0
  
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_705			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_705			; Jump if equal
		call	sub_115			; (83A4)
loc_705:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	cx
		cmp	di,386Eh
		jb	loc_706			; Jump if below
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jnc	loc_706			; Jump if carry=0
		cmp	byte ptr ds:[38AEh],1	; (94E8:38AE=3Ch)
		jae	loc_707			; Jump if above or =
		jmp	loc_867			; (60EC)
loc_706:
		cmp	byte ptr [di],20h	; ' '
		je	loc_708			; Jump if equal
		cmp	byte ptr [di],9
		je	loc_708			; Jump if equal
		cmp	byte ptr [di],0Dh
		je	loc_708			; Jump if equal
		cmp	byte ptr [di],1Ah
		je	loc_707			; Jump if equal
		jmp	short loc_713		; (563A)
loc_707:
		jmp	loc_870			; (60F7)
loc_708:
		cmp	byte ptr ds:[4507h],2	; (94E8:4507=3)
		jb	loc_709			; Jump if below
		jmp	loc_834			; (5E92)
loc_709:
		cmp	byte ptr ds:[38AEh],14h	; (94E8:38AE=3Ch)
		je	loc_710			; Jump if equal
		cmp	byte ptr ds:[38AEh],3	; (94E8:38AE=3Ch)
		je	loc_712			; Jump if equal
		cmp	byte ptr ds:[38AEh],1	; (94E8:38AE=3Ch)
		je	loc_711			; Jump if equal
loc_710:
		jmp	loc_699			; (552E)
loc_711:
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
		call	sub_106			; (80C5)
		jmp	loc_699			; (552E)
loc_712:
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
		jmp	loc_699			; (552E)
loc_713:
		cmp	byte ptr ds:[38AEh],1	; (94E8:38AE=3Ch)
		jbe	loc_718			; Jump if below or =
		cmp	byte ptr ds:[38AEh],2	; (94E8:38AE=3Ch)
		jne	loc_714			; Jump if not equal
		jmp	loc_734			; (5762)
loc_714:
		cmp	byte ptr ds:[38AEh],3	; (94E8:38AE=3Ch)
		jne	loc_715			; Jump if not equal
		jmp	loc_735			; (5766)
loc_715:
		cmp	byte ptr ds:[38AEh],4	; (94E8:38AE=3Ch)
		jne	loc_716			; Jump if not equal
		jmp	loc_749			; (58C4)
loc_716:
		cmp	byte ptr ds:[4507h],2	; (94E8:4507=3)
		jb	loc_717			; Jump if below
		jmp	loc_834			; (5E92)
loc_717:
		jmp	loc_751			; (591A)
loc_718:
		mov	al,[di]
		mov	byte ptr ds:[4319h],al	; (94E8:4319=0B4h)
		cmp	byte ptr ds:[38AEh],1	; (94E8:38AE=3Ch)
		je	loc_719			; Jump if equal
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
loc_719:
		call	sub_109			; (80CE)
		mov	byte ptr ds:[4500h],1	; (94E8:4500=8Eh)
		mov	al,byte ptr ds:[4319h]	; (94E8:4319=0B4h)
		and	al,0DFh
		push	cx
		push	di
		mov	cx,4332h
		sub	cx,431Ah
		mov	di,431Ah
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		or	cx,cx			; Zero ?
		jnz	loc_720			; Jump if not zero
		pop	di
		pop	cx
		mov	al,1
		jmp	loc_866			; (60E5)
loc_720:
		dec	di
		sub	di,431Ah
		shl	di,1			; Shift w/zeros fill
		shl	di,1			; Shift w/zeros fill
		add	di,4332h
		mov	ax,[di+2]
		mov	word ptr ds:[4390h],ax	; (94E8:4390=740Dh)
		mov	ax,[di]
		mov	word ptr ds:[438Eh],ax	; (94E8:438E=3CF4h)
		pop	di
		pop	cx
		mov	si,4393h
		mov	bx,4413h
		sub	bx,4393h
		dec	bx
		test	ah,10h
		jnz	loc_729			; Jump if not zero
loc_721:
		mov	al,[di]
		cmp	al,0Dh
		je	loc_728			; Jump if equal
		cmp	al,1Ah
		je	loc_728			; Jump if equal
		test	ah,1
		jnz	loc_722			; Jump if not zero
		cmp	al,3Dh			; '='
		jne	loc_727			; Jump if not equal
		or	ah,1
		jmp	short loc_727		; (5711)
loc_722:
		test	ah,2
		jz	loc_723			; Jump if zero
		test	ah,40h			; '@'
		jnz	loc_724			; Jump if not zero
loc_723:
		cmp	al,20h			; ' '
		je	loc_727			; Jump if equal
		cmp	al,9
		je	loc_727			; Jump if equal
loc_724:
		cmp	al,9
		jne	loc_725			; Jump if not equal
		mov	al,20h			; ' '
loc_725:
		or	ah,2
		test	ah,20h			; ' '
		jz	loc_726			; Jump if zero
		test	al,40h			; '@'
		jz	loc_726			; Jump if zero
		and	al,0DFh
loc_726:
		mov	[si],al
		inc	si
		dec	bx
		jz	loc_729			; Jump if zero
loc_727:
		push	ax
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		pop	ax
		jnc	loc_721			; Jump if carry=0
		jmp	loc_866			; (60E5)
loc_728:
		push	ax
		mov	ax,4413h
		sub	ax,4393h
		dec	ax
		cmp	bx,ax
		pop	ax
		jz	loc_730			; Jump if zero
loc_729:
		mov	byte ptr [si],0
		mov	ax,4413h
		sub	ax,4393h
		dec	ax
		sub	ax,bx
		mov	bx,ax
		push	cx
		push	di
		call	sub_109			; (80CE)
		mov	byte ptr ds:[4457h],0	; (94E8:4457=0FFh)
		mov	si,4393h
		mov	al,[si]
		call	word ptr ds:[4390h]	; (94E8:4390=740Dh)
		pop	di
		pop	cx
		cmp	byte ptr ds:[4457h],0	; (94E8:4457=0FFh)
		je	loc_731			; Jump if equal
loc_730:
		mov	al,1
		jmp	loc_866			; (60E5)
loc_731:
		jmp	loc_699			; (552E)
loc_732:
		jmp	loc_866			; (60E5)
loc_733:
		jmp	loc_867			; (60EC)
loc_734:
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
loc_735:
		cmp	byte ptr ds:[2A1Eh],1	; (94E8:2A1E=9Ah)
		jne	loc_736			; Jump if not equal
		jmp	loc_699			; (552E)
loc_736:
		mov	ax,15h
		mov	bl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		mul	bl			; ax = reg * al
		add	ax,0
		mov	bx,ax
		call	sub_39			; (3E08)
		jnc	loc_732			; Jump if carry=0
		cmp	byte ptr ds:[2A1Ch],1	; (94E8:2A1C=0BEh)
		jne	loc_737			; Jump if not equal
		jmp	loc_699			; (552E)
loc_737:
		mov	es:[bx],dx
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_733			; Jump if carry Set
		call	sub_38			; (3DF8)
		jnc	loc_732			; Jump if carry=0
		mov	es:[bx+2],dx
		call	sub_42			; (406C)
		jc	loc_733			; Jump if carry Set
		call	sub_38			; (3DF8)
		jnc	loc_732			; Jump if carry=0
		mov	es:[bx+4],dx
		call	sub_42			; (406C)
		jc	loc_733			; Jump if carry Set
		cmp	dx,es:[bx+2]
		jne	loc_738			; Jump if not equal
		jmp	loc_866			; (60E5)
loc_738:
		call	sub_39			; (3E08)
		jnc	loc_732			; Jump if carry=0
		mov	es:[bx+6],dx
		mov	word ptr ds:[2A40h],dx	; (94E8:2A40=0F800h)
		call	sub_42			; (406C)
		jc	loc_733			; Jump if carry Set
		call	sub_39			; (3E08)
		jnc	loc_732			; Jump if carry=0
		mov	es:[bx+8],dx
		call	sub_42			; (406C)
		jc	loc_733			; Jump if carry Set
		mov	al,[di]
		sub	al,30h			; '0'
		cmp	al,5
		jbe	loc_741			; Jump if below or =
		mov	dl,[di]
		and	dl,0DFh
		xor	al,al			; Zero register
		cmp	dl,41h			; 'A'
		je	loc_741			; Jump if equal
		inc	al
		cmp	dl,43h			; 'C'
		je	loc_741			; Jump if equal
		inc	al
		cmp	dl,44h			; 'D'
		je	loc_741			; Jump if equal
		inc	al
		cmp	dl,53h			; 'S'
		je	loc_741			; Jump if equal
		inc	al
		cmp	dl,52h			; 'R'
		je	loc_739			; Jump if equal
		jmp	loc_747			; (58BE)
loc_739:
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jnc	loc_740			; Jump if carry=0
		jmp	loc_748			; (58C1)
loc_740:
		mov	al,4
		mov	dl,[di]
		and	dl,0DFh
		cmp	dl,41h			; 'A'
		je	loc_741			; Jump if equal
		inc	al
		cmp	dl,43h			; 'C'
		je	loc_741			; Jump if equal
		jmp	loc_747			; (58BE)
loc_741:
		mov	ah,1
		mov	es:[bx+0Ah],ax
		mov	byte ptr es:[bx+0Eh],0
loc_742:
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jnc	loc_743			; Jump if carry=0
		jmp	short loc_748		; (58C1)
loc_743:
		mov	dl,[di]
		dw	0FA80h
		or	ax,4D74h
		cmp	dl,0Ah
		je	loc_744			; Jump if equal
		cmp	dl,3Bh			; ';'
		je	loc_744			; Jump if equal
		and	dl,0DFh
		cmp	dl,55h			; 'U'
		jne	loc_742			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		mov	dl,[di]
		and	dl,0DFh
		cmp	dl,53h			; 'S'
		jne	loc_742			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		mov	dl,[di]
		and	dl,0DFh
		cmp	dl,45h			; 'E'
		jne	loc_744			; Jump if not equal
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
data_556	db	8Ah
		adc	ax,0FA80h
		xor	si,[di+11h]
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		mov	dl,[di]
		cmp	dl,32h			; '2'
		jne	loc_744			; Jump if not equal
		or	byte ptr es:[bx+0Eh],1
loc_744:
		cmp	al,3
		jne	loc_745			; Jump if not equal
		mov	byte ptr ds:[2A26h],1	; (94E8:2A26=0A4h)
		mov	ax,es:[bx]
		mov	word ptr ds:[2A4Ch],ax	; (94E8:2A4C=0E0D3h)
		mov	ax,es:[bx+4]
		mov	word ptr ds:[2A4Ah],ax	; (94E8:2A4A=1)
loc_745:
		inc	byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		cmp	byte ptr ds:[2A2Bh],0FAh	; (94E8:2A2B=0Ah)
		jb	loc_746			; Jump if below
;*		jmp	loc_183			;*(20BF)
		db	0E9h, 04h,0C8h
loc_746:
		jmp	loc_699			; (552E)
loc_747:
		jmp	loc_866			; (60E5)
loc_748:
		jmp	loc_867			; (60EC)
loc_749:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
;*		call	sub_31			;*(2C50)
		db	0E8h, 82h,0D3h
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		je	loc_750			; Jump if equal
		call	sub_114			; (81F8)
		cmp	byte ptr cs:[4CE7h],0	; (020C:4CE7=1Fh)
		jne	loc_750			; Jump if not equal
		call	sub_49			; (4D18)
		call	sub_114			; (81F8)
		cmp	byte ptr cs:[4CE7h],0	; (020C:4CE7=1Fh)
		jne	loc_750			; Jump if not equal
		mov	bx,2
;*		jmp	loc_192			;*(2199)
		db	0E9h,0A4h,0C8h
loc_750:
		mov	ah,2Ah			; '*'
		call	sub_65			; (6C58)
		call	sub_56			; (68F0)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
		jmp	short $+2		; delay for I/O
		cmp	byte ptr ds:[4500h],1	; (94E8:4500=8Eh)
		jne	loc_751			; Jump if not equal
		inc	byte ptr ds:[4500h]	; (94E8:4500=8Eh)
		mov	byte ptr ds:[38AEh],14h	; (94E8:38AE=3Ch)
loc_751:
		call	sub_39			; (3E08)
		jnc	loc_755			; Jump if carry=0
		cmp	byte ptr ds:[2A1Ch],1	; (94E8:2A1C=0BEh)
		jne	loc_752			; Jump if not equal
		jmp	loc_870			; (60F7)
loc_752:
		mov	word ptr ds:[44FAh],dx	; (94E8:44FA=0E88Dh)
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_756			; Jump if carry Set
		call	sub_38			; (3DF8)
		jnc	loc_755			; Jump if carry=0
		mov	word ptr ds:[44F8h],dx	; (94E8:44F8=0E9BAh)
loc_753:
		mov	bx,78h
		mov	si,4393h
loc_754:
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		jc	loc_756			; Jump if carry Set
		mov	al,[di]
		cmp	al,1Ah
		je	loc_757			; Jump if equal
		cmp	al,0Dh
		je	loc_757			; Jump if equal
		mov	[si],al
		inc	si
		dec	bx
		jnz	loc_754			; Jump if not zero
		jmp	short loc_757		; (5962)
loc_755:
		jmp	loc_866			; (60E5)
loc_756:
		jmp	loc_867			; (60EC)
loc_757:
		mov	word ptr [si],0
		mov	word ptr ds:[44FCh],si	; (94E8:44FC=1F7Dh)
		push	di
		push	cx
		mov	si,4393h
loc_758:
		cmp	byte ptr [si],20h	; ' '
		je	loc_759			; Jump if equal
		cmp	byte ptr [si],9
		jne	loc_760			; Jump if not equal
loc_759:
		inc	si
		cmp	si,word ptr ds:[44FCh]	; (94E8:44FC=1F7Dh)
		jne	loc_758			; Jump if not equal
		jmp	loc_864			; (60D8)
loc_760:
		mov	dl,[si]
		and	dl,0DFh
		mov	al,dl
		cmp	byte ptr ds:[4507h],0	; (94E8:4507=3)
		je	loc_761			; Jump if equal
		cmp	al,44h			; 'D'
		jne	loc_762			; Jump if not equal
loc_761:
		inc	si
		mov	bx,4459h
		call	sub_46			; (499C)
loc_762:
		jmp	loc_864			; (60D8)
		mov	di,472Bh
		mov	ax,word ptr ds:[44FAh]	; (94E8:44FA=0E88Dh)
		mov	[di],ax
		mov	ax,word ptr ds:[44F8h]	; (94E8:44F8=0E9BAh)
		mov	[di+2],ax
		mov	byte ptr [di+4],40h	; '@'
		mov	byte ptr [di+5],2
		mov	byte ptr [di+6],0
loc_763:
;*		call	far ptr sub_192		;*(1548:03E4)
		db	 9Ah,0E4h, 03h, 48h, 15h
		jc	loc_766			; Jump if carry Set
		inc	si
		cmp	dl,46h			; 'F'
		jne	loc_764			; Jump if not equal
		mov	word ptr [di+7],203Fh
		jmp	loc_770			; (5A54)
loc_764:
		mov	bx,4466h
		call	sub_46			; (499C)
loc_765:
		jmp	loc_864			; (60D8)
		call	sub_41			; (3FF4)
		jc	loc_765			; Jump if carry Set
		mov	[di+6],dl
		mov	byte ptr ds:[394Fh],1	; (94E8:394F=5Bh)
		jmp	short loc_763		; (59B9)
		or	byte ptr [di+5],10h
		jmp	short loc_763		; (59B9)
		or	byte ptr [di+5],30h	; '0'
		jmp	short loc_763		; (59B9)
		or	byte ptr [di+5],20h	; ' '
		jmp	short loc_763		; (59B9)
		and	byte ptr [di+4],0BFh
		jmp	short loc_763		; (59B9)
loc_766:
		push	di
		add	di,7
;*		call	far ptr sub_206		;*(1548:0EE0)
		db	 9Ah,0E0h, 0Eh, 48h, 15h
		pop	di
		jnc	loc_768			; Jump if carry=0
		mov	byte ptr ds:[14ACh],1	; (94E8:14AC=8Eh)
		and	byte ptr [di+5],0FCh
		cmp	byte ptr ds:[14ADh],2	; (94E8:14AD=1Eh)
		jae	loc_767			; Jump if above or =
		or	byte ptr [di+5],1
loc_767:
		jmp	loc_860			; (60A2)
loc_768:
		push	di
		mov	ax,[di+7]
		or	ax,6060h
		cmp	ax,7473h
		jne	loc_769			; Jump if not equal
		mov	ax,[di+9]
		or	ax,6060h
		cmp	ax,7261h
		jne	loc_769			; Jump if not equal
		mov	ax,[di+0Bh]
		or	ax,60h
		cmp	ax,2074h
		jne	loc_769			; Jump if not equal
		mov	byte ptr ds:[3BD9h],1	; (94E8:3BD9=0)
loc_769:
		pop	di
		mov	ax,16h
;*		call	far ptr sub_207		;*(1548:0F40)
		db	 9Ah, 40h, 0Fh, 48h, 15h
		jmp	loc_860			; (60A2)
loc_770:
		mov	byte ptr [di+4],5Fh	; '_'
		mov	bl,[si+1]
		and	bl,0DFh
		push	si
		mov	si,4206h
		xor	ch,ch			; Zero register
		mov	cl,byte ptr ds:[42B0h]	; (94E8:42B0=12h)
  
locloop_771:
		cmp	ax,[si]
		jne	loc_772			; Jump if not equal
		cmp	byte ptr [si+2],20h	; ' '
		je	loc_773			; Jump if equal
		cmp	bl,[si+2]
		jne	loc_772			; Jump if not equal
		jmp	short loc_773		; (5A82)
loc_772:
		add	si,5
		loop	locloop_771		; Loop if cx > 0
  
		pop	si
		jmp	loc_765			; (59D4)
loc_773:
		mov	dx,[si+3]
		pop	si
		mov	[di+9],dl
		cmp	dh,1
		jne	loc_774			; Jump if not equal
		jmp	loc_798			; (5BAA)
loc_774:
		cmp	dh,3
		jne	loc_775			; Jump if not equal
		jmp	loc_791			; (5B61)
loc_775:
		cmp	dh,4
		jne	loc_776			; Jump if not equal
		jmp	loc_794			; (5B81)
loc_776:
		cmp	dh,5
		je	loc_779			; Jump if equal
		cmp	dh,6
		je	loc_777			; Jump if equal
		jmp	loc_801			; (5C09)
loc_777:
		mov	byte ptr [di+5],2
		mov	ax,16h
		push	di
;*		call	far ptr sub_207		;*(1548:0F40)
		db	 9Ah, 40h, 0Fh, 48h, 15h
		pop	di
		cmp	byte ptr [di+5],2
		je	loc_778			; Jump if equal
		jmp	loc_860			; (60A2)
loc_778:
		jmp	loc_861			; (60AA)
loc_779:
		mov	word ptr [di+0Ah],0
		mov	byte ptr [di+0Ch],0
		mov	word ptr [di+0Dh],0FFFFh
		mov	byte ptr [di+0Fh],0FFh
loc_780:
		mov	al,[si]
		cmp	al,3Dh			; '='
		je	loc_782			; Jump if equal
		cmp	al,0
		je	loc_781			; Jump if equal
		inc	si
		jmp	short loc_780		; (5ADA)
loc_781:
		jmp	short loc_790		; (5B5E)
loc_782:
		inc	si
loc_783:
		mov	al,[si]
		mov	ah,al
		cmp	al,0
		je	loc_790			; Jump if equal
		cmp	al,20h			; ' '
		je	loc_789			; Jump if equal
		cmp	al,9
		je	loc_789			; Jump if equal
		and	al,5Fh			; '_'
		cmp	al,41h			; 'A'
		jb	loc_790			; Jump if below
		cmp	al,5Ah			; 'Z'
		ja	loc_790			; Jump if above
		cmp	ah,5Ah			; 'Z'
		jbe	loc_786			; Jump if below or =
		cmp	ah,70h			; 'p'
		ja	loc_785			; Jump if above
		sub	ah,61h			; 'a'
		mov	bx,8000h
		mov	cl,ah
		ror	bx,cl			; Rotate
		not	bx
		and	[di+0Dh],bx
loc_784:
		jmp	short loc_789		; (5B5B)
loc_785:
		cmp	ah,74h			; 't'
		jbe	loc_784			; Jump if below or =
		sub	ah,75h			; 'u'
		mov	bl,80h
		mov	cl,ah
		ror	bl,cl			; Rotate
		not	bl
		and	[di+0Fh],bl
		jmp	short loc_789		; (5B5B)
loc_786:
		cmp	ah,50h			; 'P'
		ja	loc_788			; Jump if above
		sub	ah,41h			; 'A'
		mov	bx,8000h
		mov	cl,ah
		ror	bx,cl			; Rotate
		or	[di+0Ah],bx
loc_787:
		jmp	short loc_789		; (5B5B)
loc_788:
		cmp	ah,54h			; 'T'
		jbe	loc_787			; Jump if below or =
		sub	ah,55h			; 'U'
		mov	bl,80h
		mov	cl,ah
		ror	bl,cl			; Rotate
		or	[di+0Ch],bl
		jmp	short loc_789		; (5B5B)
loc_789:
		inc	si
		jmp	short loc_783		; (5AEA)
loc_790:
		jmp	loc_860			; (60A2)
loc_791:
		inc	si
		inc	si
		inc	si
		cmp	word ptr [si],3233h
		je	loc_792			; Jump if equal
		cmp	word ptr [si],3631h
		je	loc_793			; Jump if equal
		jmp	loc_860			; (60A2)
loc_792:
		mov	byte ptr [di+9],5
		jmp	loc_860			; (60A2)
loc_793:
		mov	byte ptr [di+9],4
		jmp	loc_860			; (60A2)
loc_794:
		inc	si
		mov	cx,5
  
locloop_795:
;*		call	far ptr sub_216		;*(1548:117C)
		db	 9Ah, 7Ch, 11h, 48h, 15h
		jc	loc_796			; Jump if carry Set
		cmp	si,word ptr ds:[44FCh]	; (94E8:44FC=1F7Dh)
		ja	loc_797			; Jump if above
		inc	si
		loop	locloop_795		; Loop if cx > 0
  
loc_796:
		call	sub_41			; (3FF4)
		jc	loc_797			; Jump if carry Set
		mov	[di+0Ch],dx
		call	sub_41			; (3FF4)
		jc	loc_797			; Jump if carry Set
		mov	[di+0Ah],dx
		jmp	short loc_801		; (5C09)
loc_797:
		jmp	loc_864			; (60D8)
loc_798:
		test	byte ptr [di+9],40h	; '@'
		jnz	loc_799			; Jump if not zero
		cmp	byte ptr [di+9],8
		jne	loc_800			; Jump if not equal
		inc	si
		mov	dh,[si]
		and	dh,5Fh			; '_'
		cmp	dh,53h			; 'S'
		je	loc_799			; Jump if equal
		inc	byte ptr [di+9]
		cmp	dh,4Ch			; 'L'
		je	loc_799			; Jump if equal
		inc	byte ptr [di+9]
		cmp	dh,44h			; 'D'
		je	loc_799			; Jump if equal
		jmp	loc_864			; (60D8)
loc_799:
		mov	word ptr [di+0Ah],0FFFFh
loc_800:
		inc	si
		call	sub_40			; (3F30)
		jc	loc_802			; Jump if carry Set
		mov	[di+0Ah],dx
		test	byte ptr [di+9],10h
		jz	loc_801			; Jump if zero
		cmp	byte ptr [si],3Ah	; ':'
		jne	loc_803			; Jump if not equal
		inc	si
		call	sub_41			; (3FF4)
		jc	loc_803			; Jump if carry Set
		mov	[di+0Ch],dx
		mov	byte ptr [di+0Eh],0
		inc	si
		cmp	si,word ptr ds:[44FCh]	; (94E8:44FC=1F7Dh)
		jae	loc_801			; Jump if above or =
		call	sub_41			; (3FF4)
		jc	loc_801			; Jump if carry Set
		mov	[di+0Eh],dl
loc_801:
		jmp	loc_860			; (60A2)
loc_802:
		test	byte ptr [di+9],48h	; 'H'
		jnz	loc_801			; Jump if not zero
loc_803:
		jmp	loc_864			; (60D8)
		mov	di,472Bh
		mov	ax,word ptr ds:[44FAh]	; (94E8:44FA=0E88Dh)
		mov	[di],ax
		mov	ax,word ptr ds:[44F8h]	; (94E8:44F8=0E9BAh)
		mov	[di+2],ax
		mov	byte ptr [di+5],6
		mov	word ptr [di+8],1
		mov	word ptr ds:[44FEh],0	; (94E8:44FE=0BFEBh)
		mov	word ptr [di+6],0
		mov	al,[si]
		inc	si
		mov	bx,4476h
		call	sub_46			; (499C)
		jmp	loc_864			; (60D8)
		mov	byte ptr [di+4],60h	; '`'
		jmp	short loc_804		; (5C8E)
		mov	byte ptr [di+4],41h	; 'A'
		jmp	short loc_804		; (5C8E)
		mov	byte ptr [di+4],44h	; 'D'
		mov	word ptr [di+8],4
		jmp	short loc_804		; (5C8E)
		cmp	byte ptr ds:[4507h],0	; (94E8:4507=3)
		jne	loc_807			; Jump if not equal
		mov	byte ptr ds:[4507h],1	; (94E8:4507=3)
		mov	word ptr ds:[450Dh],0	; (94E8:450D=1F0Eh)
		mov	word ptr ds:[450Fh],0	; (94E8:450F=1EC3h)
		jmp	short loc_804		; (5C8E)
		mov	byte ptr [di+4],42h	; 'B'
		mov	word ptr [di+8],2
		jmp	short loc_804		; (5C8E)
		cmp	byte ptr ds:[4507h],0	; (94E8:4507=3)
		jne	loc_807			; Jump if not equal
		mov	byte ptr [di+4],41h	; 'A'
		or	byte ptr [di+7],10h
loc_804:
;*		call	far ptr sub_192		;*(1548:03E4)
		db	 9Ah,0E4h, 03h, 48h, 15h
		jnc	loc_805			; Jump if carry=0
		jmp	loc_813			; (5D83)
loc_805:
		cmp	byte ptr ds:[4507h],1	; (94E8:4507=3)
		jne	loc_806			; Jump if not equal
		cmp	al,52h			; 'R'
		jne	loc_807			; Jump if not equal
loc_806:
		inc	si
		mov	bx,4489h
		call	sub_46			; (499C)
loc_807:
		jmp	loc_864			; (60D8)
		mov	al,[di+4]
		and	al,3Fh			; '?'
		cmp	al,2
		ja	loc_807			; Jump if above
		cmp	al,0
		jne	loc_808			; Jump if not equal
		or	byte ptr [di+4],1
loc_808:
		or	byte ptr [di+4],20h	; ' '
		jmp	short loc_804		; (5C8E)
		or	byte ptr [di+7],40h	; '@'
		or	byte ptr [di+7],20h	; ' '
		jmp	short loc_804		; (5C8E)
		or	byte ptr [di+7],80h
		jmp	short loc_804		; (5C8E)
		mov	al,[di+4]
		and	al,3Fh			; '?'
		cmp	al,2
		jne	loc_812			; Jump if not equal
		mov	ax,si
		inc	ax
		cmp	ax,word ptr ds:[44FCh]	; (94E8:44FC=1F7Dh)
		jae	loc_812			; Jump if above or =
		mov	ax,[si]
		and	ax,0DFDFh
		and	byte ptr [di+4],0C0h
		or	byte ptr [di+4],10h
		mov	word ptr [di+8],2
		cmp	ah,4Eh			; 'N'
		je	loc_809			; Jump if equal
		cmp	ah,46h			; 'F'
		jne	loc_812			; Jump if not equal
		or	byte ptr [di+4],1
		mov	word ptr [di+8],4
loc_809:
		cmp	al,53h			; 'S'
		je	loc_811			; Jump if equal
		cmp	al,4Ch			; 'L'
		jne	loc_810			; Jump if not equal
		or	byte ptr [di+4],2
		jmp	short loc_811		; (5D21)
loc_810:
		cmp	al,44h			; 'D'
		jne	loc_812			; Jump if not equal
		or	byte ptr [di+4],4
loc_811:
		inc	si
		jmp	loc_804			; (5C8E)
loc_812:
		jmp	loc_864			; (60D8)
		call	sub_41			; (3FF4)
		jc	loc_812			; Jump if carry Set
		and	dx,3FFh
		mov	[di+6],dx
		mov	byte ptr ds:[394Fh],1	; (94E8:394F=5Bh)
		jmp	loc_804			; (5C8E)
		call	sub_41			; (3FF4)
		jc	loc_812			; Jump if carry Set
		mov	word ptr ds:[44FEh],dx	; (94E8:44FE=0BFEBh)
		jmp	loc_804			; (5C8E)
		push	di
		mov	di,472Bh
		mov	ax,word ptr ds:[44FAh]	; (94E8:44FA=0E88Dh)
		mov	[di],ax
		mov	ax,word ptr ds:[44F8h]	; (94E8:44F8=0E9BAh)
		mov	[di+2],ax
		push	word ptr [di+4]
		push	word ptr [di+5]
		push	word ptr [di+6]
		mov	byte ptr [di+4],5Fh	; '_'
		mov	byte ptr [di+5],0
		mov	byte ptr [di+6],0
		call	sub_124			; (9120)
		pop	word ptr [di+4]
		pop	word ptr [di+5]
		pop	word ptr [di+6]
		pop	di
		jmp	loc_804			; (5C8E)
		and	byte ptr [di+4],0BFh
		jmp	loc_804			; (5C8E)
loc_813:
		cmp	byte ptr ds:[4507h],1	; (94E8:4507=3)
		jne	loc_816			; Jump if not equal
		inc	byte ptr ds:[4507h]	; (94E8:4507=3)
		mov	ax,word ptr ds:[44FEh]	; (94E8:44FE=0BFEBh)
		cmp	ax,100h
		jb	loc_814			; Jump if below
		mov	al,0FFh
loc_814:
		or	al,al			; Zero ?
		jnz	loc_815			; Jump if not zero
		inc	al
loc_815:
		mov	byte ptr ds:[4508h],al	; (94E8:4508=0FDh)
		jmp	loc_862			; (60AF)
loc_816:
		cmp	word ptr ds:[44FEh],0	; (94E8:44FE=0BFEBh)
		je	loc_817			; Jump if equal
		jmp	loc_828			; (5E41)
loc_817:
		inc	word ptr ds:[44FEh]	; (94E8:44FE=0BFEBh)
		mov	al,[di+4]
		and	al,3Fh			; '?'
		cmp	al,20h			; ' '
		je	loc_818			; Jump if equal
		jmp	loc_828			; (5E41)
loc_818:
		push	cx
		push	dx
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	si,[di+2]
		mov	ax,[di]
		push	si
		mov	si,28EFh
		call	sub_106			; (80C5)
loc_819:
		cmp	si,0
		nop				;*ASM fixup - sign extn byte
		je	loc_825			; Jump if equal
		sub	si,15h
		cmp	es:[si],ax
		jne	loc_819			; Jump if not equal
		mov	cx,es:[si+4]
		pop	si
		mov	es,ax
		cmp	cx,si
		jbe	loc_826			; Jump if below or =
		sub	cx,si
		inc	cx
		jnz	loc_820			; Jump if not zero
		dec	cx
loc_820:
		mov	dx,cx
		mov	bx,47DDh
  
locloop_821:
		mov	al,es:[si]
		or	al,al			; Zero ?
		jz	loc_823			; Jump if zero
		cmp	al,24h			; '$'
		je	loc_823			; Jump if equal
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jz	loc_822			; Jump if zero
		cmp	cx,dx
		jne	loc_824			; Jump if not equal
loc_822:
		inc	si
		loop	locloop_821		; Loop if cx > 0
  
		jmp	short loc_824		; (5E11)
loc_823:
		dec	cx
loc_824:
		sub	dx,cx
		cmp	dx,0
		je	loc_826			; Jump if equal
		mov	word ptr ds:[44FEh],dx	; (94E8:44FE=0BFEBh)
		jmp	short loc_826		; (5E1F)
loc_825:
		pop	si
loc_826:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_827			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_827			; Jump if equal
		call	sub_115			; (83A4)
loc_827:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		pop	dx
		pop	cx
loc_828:
		mov	ax,[di+8]
		mul	word ptr ds:[44FEh]	; (94E8:44FE=0BFEBh) ax = data * ax
		jc	loc_829			; Jump if carry Set
		or	ax,ax			; Zero ?
		jnz	loc_830			; Jump if not zero
loc_829:
		jmp	loc_812			; (5D25)
loc_830:
		mov	[di+8],ax
		mov	word ptr ds:[450Fh],ax	; (94E8:450F=1EC3h)
		add	word ptr ds:[450Dh],ax	; (94E8:450D=1F0Eh)
		push	di
		add	di,0Ah
;*		call	far ptr sub_206		;*(1548:0EE0)
		db	 9Ah,0E0h, 0Eh, 48h, 15h
		pop	di
		jnc	loc_832			; Jump if carry=0
		mov	byte ptr ds:[14ACh],1	; (94E8:14AC=8Eh)
		and	byte ptr [di+5],0FCh
		cmp	byte ptr ds:[14ADh],2	; (94E8:14AD=1Eh)
		jae	loc_831			; Jump if above or =
		or	byte ptr [di+5],1
loc_831:
		jmp	loc_862			; (60AF)
loc_832:
		cmp	byte ptr ds:[4507h],0	; (94E8:4507=3)
		jne	loc_833			; Jump if not equal
		mov	ax,19h
;*		call	far ptr sub_207		;*(1548:0F40)
		db	 9Ah, 40h, 0Fh, 48h, 15h
		jmp	short loc_833		; (5E8F)
loc_833:
		jmp	loc_862			; (60AF)
loc_834:
		cmp	byte ptr [di],20h	; ' '
		je	loc_835			; Jump if equal
		cmp	byte ptr [di],9
		jne	loc_837			; Jump if not equal
loc_835:
		mov	ax,word ptr ds:[44F8h]	; (94E8:44F8=0E9BAh)
		add	ax,word ptr ds:[450Fh]	; (94E8:450F=1EC3h)
		jc	loc_836			; Jump if carry Set
		mov	word ptr ds:[44F8h],ax	; (94E8:44F8=0E9BAh)
		jmp	loc_753			; (593D)
loc_836:
		jmp	loc_864			; (60D8)
loc_837:
		dec	word ptr ds:[38ACh]	; (94E8:38AC=82h)
		push	di
		push	cx
		cmp	byte ptr ds:[4508h],1	; (94E8:4508=0FDh)
		jne	loc_838			; Jump if not equal
		jmp	loc_854			; (5FFA)
loc_838:
		mov	di,word ptr es:[6]	; (7480:0006=0)
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_839			; Jump if not zero
		mov	al,es:[di+6]
loc_839:
		add	di,ax
		mov	word ptr ds:[4509h],di	; (94E8:4509=0E08h)
		sub	di,word ptr ds:[450Bh]	; (94E8:450B=330h)
		mov	al,byte ptr ds:[4508h]	; (94E8:4508=0FDh)
		dec	al
		xor	ah,ah			; Zero register
		push	dx
		mul	di			; dx:ax = reg * ax
		cmp	dx,0
		pop	dx
		jz	loc_840			; Jump if zero
		jmp	loc_865			; (60DE)
loc_840:
		mov	cx,ax
		push	bx
		mov	bx,word ptr es:[0]	; (7480:0000=0)
		nop				;*ASM fixup - sign extn byte
		add	bx,cx
		pop	bx
		jnc	loc_841			; Jump if carry=0
		jmp	loc_865			; (60DE)
loc_841:
		mov	si,word ptr es:[0]	; (7480:0000=0)
		nop				;*ASM fixup - sign extn byte
		add	word ptr es:[0],cx	; (7480:0000=0)
		nop				;*ASM fixup - sign extn byte
		dec	si
		mov	di,si
		add	di,cx
		mov	cx,si
		sub	cx,word ptr ds:[4509h]	; (94E8:4509=0E08h)
		inc	cx
		push	ds
		push	es
		pop	ds
		std				; Set direction flag
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cld				; Clear direction
		pop	ds
		mov	di,word ptr es:[6]	; (7480:0006=0)
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_842			; Jump if not zero
		mov	al,es:[di+6]
loc_842:
		add	di,ax
		mov	word ptr ds:[4511h],di	; (94E8:4511=2E50h)
		mov	si,word ptr ds:[450Bh]	; (94E8:450B=330h)
		mov	dl,2
		push	es
		pop	ds
loc_843:
		push	ds
		call	sub_104			; (80B9)
		cmp	byte ptr ds:[4508h],1	; (7480:4508=0)
		pop	ds
		ja	loc_844			; Jump if above
		jmp	loc_854			; (5FFA)
loc_844:
		cld				; Clear direction
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		mov	bx,ax
		mov	al,dl
		dec	al
		xor	ah,ah			; Zero register
		push	dx
		push	ds
		call	sub_104			; (80B9)
		mul	word ptr ds:[450Dh]	; (7480:450D=0) ax = data * ax
		pop	ds
		pop	dx
		jc	loc_845			; Jump if carry Set
		add	ax,bx
		jnc	loc_846			; Jump if carry=0
loc_845:
		call	sub_104			; (80B9)
		jmp	loc_864			; (60D8)
loc_846:
		stosw				; Store ax to es:[di]
		movsw				; Mov [si] to es:[di]
		lodsw				; String [si] to ax
		and	ax,0FC00h
		stosw				; Store ax to es:[di]
		movsw				; Mov [si] to es:[di]
		test	byte ptr [si-5],2
		jnz	loc_847			; Jump if not zero
		test	byte ptr [si-5],1
		jz	loc_852			; Jump if zero
		add	di,2
		add	si,2
		dec	dl
		jmp	short loc_852		; (5FDA)
loc_847:
		mov	cx,0Fh
		cmp	word ptr [si],203Fh
		je	loc_851			; Jump if equal
		mov	cx,0Dh
  
locloop_848:
		cmp	byte ptr [si],20h	; ' '
		je	loc_849			; Jump if equal
		movsb				; Mov [si] to es:[di]
		loop	locloop_848		; Loop if cx > 0
  
loc_849:
		mov	al,dl
		dec	al
;*		call	far ptr sub_177		;*(1548:0000)
		db	 9Ah, 00h, 00h, 48h, 15h
		cmp	bl,30h			; '0'
		jne	loc_851			; Jump if not equal
		cmp	byte ptr [si],20h	; ' '
		je	loc_850			; Jump if equal
		movsb				; Mov [si] to es:[di]
		mov	[di],bh
		inc	di
		inc	si
		jmp	short loc_852		; (5FDA)
loc_850:
		mov	bl,bh
		mov	bh,20h			; ' '
loc_851:
		mov	[di],bx
		add	di,2
		add	si,2
		jcxz	loc_852			; Jump if cx=0
		mov	byte ptr [di],20h	; ' '
		inc	di
		inc	si
		dec	cx
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
loc_852:
		push	ds
		call	sub_104			; (80B9)
		cmp	si,word ptr ds:[4509h]	; (7480:4509=0)
		pop	ds
		jnc	loc_853			; Jump if carry=0
		jmp	loc_844			; (5F56)
loc_853:
		inc	dl
		push	ds
		call	sub_104			; (80B9)
		mov	si,word ptr ds:[450Bh]	; (7480:450B=0)
		dec	byte ptr ds:[4508h]	; (7480:4508=0)
		pop	ds
		jmp	loc_843			; (5F47)
loc_854:
		call	sub_104			; (80B9)
		mov	byte ptr ds:[4507h],0	; (7480:4507=0)
		pop	cx
		pop	di
;*		call	far ptr sub_217		;*(1548:1198)
		db	 9Ah, 98h, 11h, 48h, 15h
		inc	word ptr ds:[38ACh]	; (7480:38AC=0)
		jmp	loc_706			; (55EE)
		call	sub_104			; (80B9)
		pop	cx
		pop	di
		jmp	loc_864			; (60D8)
		mov	di,472Bh
		mov	ax,word ptr ds:[44FAh]	; (7480:44FA=0)
		mov	[di],ax
		mov	ax,word ptr ds:[44F8h]	; (7480:44F8=0)
		mov	[di+2],ax
		mov	byte ptr [di+4],40h	; '@'
		mov	byte ptr [di+5],0Ah
		mov	word ptr [di+6],0
		push	di
		mov	cx,32h
		add	di,9
		mov	al,0
  
locloop_855:
		mov	[di],al
		inc	di
		loop	locloop_855		; Loop if cx > 0
  
		pop	di
loc_856:
;*		call	far ptr sub_192		;*(1548:03E4)
		db	 9Ah,0E4h, 03h, 48h, 15h
		jc	loc_857			; Jump if carry Set
		inc	si
		mov	bx,44A5h
		call	sub_46			; (499C)
		jmp	loc_864			; (60D8)
		or	byte ptr [di+4],80h
		jmp	short loc_856		; (6042)
		call	sub_41			; (3FF4)
		jc	loc_864			; Jump if carry Set
		mov	[di+6],dl
		mov	byte ptr ds:[394Fh],1	; (7480:394F=0)
		jmp	short loc_856		; (6042)
		or	byte ptr [di+4],8
		mov	byte ptr [di+32h],38h	; '8'
		jmp	short loc_856		; (6042)
		and	byte ptr [di+4],0BFh
		jmp	short loc_856		; (6042)
loc_857:
		push	di
		add	di,3Bh
;*		call	far ptr sub_206		;*(1548:0EE0)
		db	 9Ah,0E0h, 0Eh, 48h, 15h
		pop	di
		jnc	loc_859			; Jump if carry=0
		mov	byte ptr ds:[14ACh],1	; (7480:14AC=0)
		and	byte ptr [di+5],0FCh
		cmp	byte ptr ds:[14ADh],2	; (7480:14AD=0)
		jae	loc_858			; Jump if above or =
		or	byte ptr [di+5],1
loc_858:
		jmp	short loc_860		; (60A2)
loc_859:
		mov	ax,4Ah
;*		call	far ptr sub_207		;*(1548:0F40)
		db	 9Ah, 40h, 0Fh, 48h, 15h
loc_860:
		call	sub_124			; (9120)
;*		call	far ptr sub_217		;*(1548:1198)
		db	 9Ah, 98h, 11h, 48h, 15h
loc_861:
		pop	cx
		pop	di
		jmp	loc_699			; (552E)
loc_862:
		cmp	byte ptr ds:[4507h],2	; (7480:4507=0)
		jne	loc_863			; Jump if not equal
		inc	byte ptr ds:[4507h]	; (7480:4507=0)
		jmp	short loc_861		; (60AA)
loc_863:
		call	sub_124			; (9120)
;*		call	far ptr sub_217		;*(1548:1198)
		db	 9Ah, 98h, 11h, 48h, 15h
		cmp	byte ptr ds:[4507h],3	; (7480:4507=0)
		jne	loc_861			; Jump if not equal
		inc	byte ptr ds:[4507h]	; (7480:4507=0)
		mov	ax,word ptr es:[6]	; (A80C:0006=0)
		mov	word ptr ds:[450Bh],ax	; (7480:450B=0)
		jmp	short loc_861		; (60AA)
loc_864:
		pop	cx
		pop	di
		mov	al,1
		jmp	short loc_866		; (60E5)
loc_865:
		pop	cx
		pop	di
		call	sub_104			; (80B9)
		jmp	short loc_869		; (60F4)
loc_866:
		or	ax,ax			; Zero ?
		jz	loc_867			; Jump if zero
		jmp	loc_185			; (20DF)
loc_867:
		cmp	bl,0
		je	loc_870			; Jump if equal
loc_868:
		jmp	loc_188			; (2140)
loc_869:
		jmp	loc_189			; (2152)
loc_870:
		mov	bx,word ptr ds:[37EAh]	; (7480:37EA=0)
		call	sub_130			; (A8A0)
		mov	dh,0
		call	sub_62			; (6B04)
		call	sub_66			; (6C9C)
		call	sub_92			; (7C70)
		call	sub_68			; (6E44)
		push	ds
		pop	es
		mov	ah,2Bh			; '+'
		call	sub_65			; (6C58)
		call	sub_56			; (68F0)
		mov	byte ptr ds:[2A1Eh],0	; (94E8:2A1E=9Ah)
		cmp	byte ptr ds:[394Fh],1	; (94E8:394F=5Bh)
		je	loc_871			; Jump if equal
		jmp	loc_904			; (6354)
loc_871:
		mov	cx,40h
		mov	si,37AAh
		mov	di,3905h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	byte ptr ds:[38B7h],0	; (94E8:38B7=0Ah)
		mov	di,3905h
		mov	al,0
;*		call	far ptr sub_195		;*(1548:04A4)
		db	 9Ah,0A4h, 04h, 48h, 15h
		sub	di,3
		mov	byte ptr [di],72h	; 'r'
		inc	di
		mov	word ptr [di],6D65h
		mov	byte ptr ds:[386Eh],0	; (94E8:386E=5Fh)
		mov	dx,3905h
		cmp	byte ptr ds:[3906h],3Ah	; (94E8:3906=33h) ':'
		je	loc_872			; Jump if equal
		mov	dx,3903h
loc_872:
		mov	ah,3Dh			; '='
		mov	al,0
		mov	cx,0
		int	21h			; DOS Services  ah=function 3Dh
						;  open file, al=mode,name@ds:dx
		jnc	loc_873			; Jump if carry=0
		jmp	loc_905			; (6357)
loc_873:
		mov	word ptr ds:[37EAh],ax	; (94E8:37EA=7400h)
		mov	byte ptr ds:[38AEh],0FFh	; (94E8:38AE=3Ch)
		mov	word ptr ds:[38ACh],1	; (94E8:38AC=82h)
		mov	word ptr ds:[3945h],0	; (94E8:3945=0FB3Bh)
		mov	word ptr ds:[3947h],0	; (94E8:3947=3F72h)
		call	sub_107			; (80C8)
loc_874:
		cmp	byte ptr ds:[386Eh],1	; (94E8:386E=5Fh)
		je	loc_876			; Jump if equal
		mov	ah,3Fh			; '?'
		mov	bx,word ptr ds:[37EAh]	; (94E8:37EA=7400h)
		mov	cx,80h
		mov	dx,37EEh
		int	21h			; DOS Services  ah=function 3Fh
						;  read file, cx=bytes, to ds:dx
		jnc	loc_875			; Jump if carry=0
		mov	bl,0Eh
		jmp	loc_901			; (633F)
loc_875:
		cmp	ax,80h
		je	loc_879			; Jump if equal
		cmp	ax,0
		jne	loc_877			; Jump if not equal
loc_876:
		jmp	loc_901			; (633F)
loc_877:
		mov	byte ptr ds:[386Eh],1	; (94E8:386E=5Fh)
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	di,37EEh
		add	di,ax
		mov	cx,80h
		sub	cx,ax
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_878			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_878			; Jump if equal
		call	sub_115			; (83A4)
loc_878:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_879:
		mov	di,37EEh
		mov	cx,80h
loc_880:
		cmp	byte ptr ds:[38AEh],0FFh	; (94E8:38AE=3Ch)
		jne	loc_881			; Jump if not equal
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
		jmp	short loc_885		; (6248)
loc_881:
		mov	al,0Ah
		push	cx
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		pushf				; Push flags
		pop	bp
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_882			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_882			; Jump if equal
		call	sub_115			; (83A4)
loc_882:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	ax
		push	bp
		sub	ax,cx
		add	word ptr ds:[3947h],ax	; (94E8:3947=3F72h)
		jnc	loc_883			; Jump if carry=0
		inc	word ptr ds:[3945h]	; (94E8:3945=0FB3Bh)
loc_883:
		popf				; Pop flags
		jz	loc_884			; Jump if zero
		jmp	loc_874			; (6188)
loc_884:
		inc	word ptr ds:[38ACh]	; (94E8:38AC=82h)
loc_885:
		cmp	di,386Eh
		jb	loc_887			; Jump if below
;*		call	far ptr sub_187		;*(1548:0230)
		db	 9Ah, 30h, 02h, 48h, 15h
		dec	word ptr ds:[3947h]	; (94E8:3947=3F72h)
		jnc	loc_886			; Jump if carry=0
		dec	word ptr ds:[3945h]	; (94E8:3945=0FB3Bh)
loc_886:
		jnc	loc_887			; Jump if carry=0
		jmp	loc_901			; (633F)
loc_887:
		cmp	byte ptr [di],26h	; '&'
		je	loc_889			; Jump if equal
		test	byte ptr ds:[38AEh],1	; (94E8:38AE=3Ch)
		jnz	loc_892			; Jump if not zero
		cmp	byte ptr [di],20h	; ' '
		je	loc_888			; Jump if equal
		cmp	byte ptr [di],9
		je	loc_888			; Jump if equal
		cmp	byte ptr [di],0Dh
		je	loc_888			; Jump if equal
		jmp	short loc_890		; (6285)
loc_888:
		jmp	loc_880			; (61F3)
loc_889:
		jmp	loc_903			; (6345)
loc_890:
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
		mov	si,0
		cmp	byte ptr ds:[38AEh],1	; (94E8:38AE=3Ch)
		je	loc_893			; Jump if equal
		mov	si,1000h
		cmp	byte ptr ds:[38AEh],3	; (94E8:38AE=3Ch)
		je	loc_891			; Jump if equal
		mov	si,13FCh
loc_891:
		jmp	short loc_897		; (62E7)
loc_892:
		cmp	byte ptr ds:[38AEh],1	; (94E8:38AE=3Ch)
		jne	loc_897			; Jump if not equal
loc_893:
		cmp	byte ptr [di],0Dh
		je	loc_895			; Jump if equal
		cmp	byte ptr [di],20h	; ' '
		je	loc_895			; Jump if equal
		mov	ax,word ptr ds:[3945h]	; (94E8:3945=0FB3Bh)
		mov	es:[si],ax
		inc	si
		inc	si
		mov	ax,word ptr ds:[3947h]	; (94E8:3947=3F72h)
		mov	es:[si],ax
		call	sub_36			; (3D80)
		jnc	loc_896			; Jump if carry=0
		mov	al,[di]
		and	al,5Fh			; '_'
		cmp	al,4Eh			; 'N'
		je	loc_894			; Jump if equal
		inc	si
		inc	si
		inc	word ptr ds:[3949h]	; (94E8:3949=5150h)
		cmp	word ptr ds:[3949h],400h	; (94E8:3949=5150h)
		jne	loc_895			; Jump if not equal
		jmp	short loc_902		; (6342)
loc_894:
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
loc_895:
		jmp	loc_880			; (61F3)
loc_896:
		jmp	short loc_901		; (633F)
loc_897:
		cmp	byte ptr [di],0Dh
		je	loc_900			; Jump if equal
		cmp	byte ptr [di],20h	; ' '
		je	loc_900			; Jump if equal
		mov	ax,word ptr ds:[3945h]	; (94E8:3945=0FB3Bh)
		mov	es:[si],ax
		inc	si
		inc	si
		mov	ax,word ptr ds:[3947h]	; (94E8:3947=3F72h)
		mov	es:[si],ax
		call	sub_36			; (3D80)
		jnc	loc_901			; Jump if carry=0
		mov	al,[di]
		and	al,5Fh			; '_'
		cmp	al,4Eh			; 'N'
		je	loc_899			; Jump if equal
		inc	si
		inc	si
		cmp	byte ptr ds:[38AEh],5	; (94E8:38AE=3Ch)
		je	loc_898			; Jump if equal
		inc	word ptr ds:[394Bh]	; (94E8:394B=0E853h)
		cmp	word ptr ds:[394Bh],0FEh	; (94E8:394B=0E853h)
		jbe	loc_900			; Jump if below or =
		jmp	short loc_902		; (6342)
loc_898:
		inc	word ptr ds:[394Dh]	; (94E8:394D=0E1F8h)
		cmp	word ptr ds:[394Dh],0FFh	; (94E8:394D=0E1F8h)
		jbe	loc_900			; Jump if below or =
		jmp	short loc_902		; (6342)
loc_899:
		inc	byte ptr ds:[38AEh]	; (94E8:38AE=3Ch)
		cmp	byte ptr ds:[38AEh],6	; (94E8:38AE=3Ch)
		je	loc_903			; Jump if equal
loc_900:
		jmp	loc_880			; (61F3)
loc_901:
		jmp	loc_200			; (2215)
loc_902:
;*		jmp	loc_202			;*(222B)
		db	0E9h,0E6h,0BEh
loc_903:
		mov	byte ptr ds:[38B7h],1	; (94E8:38B7=0Ah)
		mov	bx,word ptr ds:[37EAh]	; (94E8:37EA=7400h)
		call	sub_130			; (A8A0)
		call	sub_109			; (80CE)
loc_904:
		jmp	loc_370			; (38E5)
loc_905:
		call	sub_63			; (6BFC)
		mov	al,byte ptr ds:[11E8h]	; (94E8:11E8=0)
		mov	[bx+52h],al
		mov	ah,1Ah
		call	sub_65			; (6C58)
		call	sub_56			; (68F0)
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		call	sub_64			; (6C24)
		mov	byte ptr [bx+52h],0Fh
		jmp	loc_370			; (38E5)
		db	9 dup (0)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_52		proc	near
		cmp	data_234,1		; (020C:263E=10h)
		je	loc_906			; Jump if equal
		jmp	loc_911			; (640F)
loc_906:
		push	bx
		push	cx
		push	dx
		push	di
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		dec	al
		mov	cl,6
		mul	cl			; ax = reg * al
		mov	si,4950h
		add	si,ax
		mov	ax,[si+4]
		mov	dx,[si]
loc_907:
		push	ax
		mov	cx,2850h
		sub	cx,27CAh
		mov	di,2965h
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	di,dx
		mov	cx,2850h
		sub	cx,27EAh
		mov	bx,cx
		mov	al,0Ah
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		sub	bx,cx
		mov	cx,bx
		mov	si,dx
		mov	di,2985h
		dec	cx
		jcxz	loc_908			; Jump if cx=0
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
loc_908:
		inc	si
		mov	dx,2965h
		call	sub_53			; (6418)
		mov	dx,si
		pop	ax
		dec	ax
		jnz	loc_907			; Jump if not zero
		clc				; Clear carry flag
		jmp	short loc_909		; (63E9)
		pop	ax
		stc				; Set carry flag
loc_909:
		jc	loc_912			; Jump if carry Set
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_910			; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_910			; Jump if equal
		call	sub_115			; (83A4)
loc_910:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		pop	di
		pop	dx
		pop	cx
		pop	bx
loc_911:
		retn
loc_912:
		add	sp,10h
		jmp	loc_191			; (2176)
sub_52		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_53		proc	near
		test	word ptr ds:[42CEh],8	; (94E8:42CE=0F78Bh)
		jz	loc_913			; Jump if zero
		mov	bl,0
		clc				; Clear carry flag
		retn
loc_913:
		call	sub_55			; (65A8)
		nop
sub_53		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_54		proc	near
		push	cx
		push	di
		push	si
		call	sub_109			; (80CE)
		mov	di,2850h
		sub	di,27CAh
		dec	di
		add	di,dx
		mov	cx,2850h
		sub	cx,27CAh
		dec	cx
		mov	al,20h			; ' '
		std				; Set direction flag
		repe	scasb			; Rep zf=1+cx >0 Scan es:[di] for al
		cld				; Clear direction
		inc	di
		inc	di
		mov	word ptr [di],0A0Dh
		add	cx,4
		test	word ptr ds:[42CEh],10h	; (94E8:42CE=0F78Bh)
		jz	loc_915			; Jump if zero
		cmp	byte ptr ds:[2EBDh],1	; (94E8:2EBD=0)
		je	loc_914			; Jump if equal
		cmp	cx,22h
		jbe	loc_914			; Jump if below or =
		sub	cx,20h
		add	dx,20h
loc_914:
		jmp	loc_923			; (651A)
loc_915:
		cmp	cx,23h
		jb	loc_914			; Jump if below
		push	cx
		mov	di,28DCh
		mov	si,dx
		mov	cx,20h
;*		call	far ptr sub_213		;*(1548:10C8)
		db	 9Ah,0C8h, 10h, 48h, 15h
		pop	cx
		push	di
		cmp	cx,33h
		jb	loc_918			; Jump if below
		push	cx
		mov	cx,10h
;*		call	far ptr sub_213		;*(1548:10C8)
		db	 9Ah,0C8h, 10h, 48h, 15h
		cmp	byte ptr ds:[2EBAh],3	; (94E8:2EBA=74h)
		jne	loc_917			; Jump if not equal
		mov	bx,dx
		cmp	byte ptr [bx+20h],3Bh	; ';'
		je	loc_917			; Jump if equal
		cmp	word ptr [di-2],909h
		je	loc_916			; Jump if equal
		cmp	word ptr [bx+30h],2020h
		jne	loc_917			; Jump if not equal
		cmp	byte ptr [bx+60h],3Bh	; ';'
		jne	loc_917			; Jump if not equal
		cmp	byte ptr [di-1],9
		jne	loc_917			; Jump if not equal
loc_916:
		dec	di
loc_917:
		pop	cx
		cmp	cx,3Bh
		jb	loc_918			; Jump if below
		push	cx
		mov	cx,8
;*		call	far ptr sub_213		;*(1548:10C8)
		db	 9Ah,0C8h, 10h, 48h, 15h
		pop	cx
		cmp	cx,63h
		jb	loc_918			; Jump if below
		push	cx
		mov	cx,28h
;*		call	far ptr sub_213		;*(1548:10C8)
		db	 9Ah,0C8h, 10h, 48h, 15h
		pop	cx
		cmp	byte ptr ds:[2EBAh],0	; (94E8:2EBA=74h)
		je	loc_918			; Jump if equal
		cmp	byte ptr [si],3Bh	; ';'
		jne	loc_918			; Jump if not equal
		cmp	word ptr [di-2],909h
		jne	loc_918			; Jump if not equal
		dec	di
		cmp	byte ptr ds:[2EBAh],1	; (94E8:2EBA=74h)
		je	loc_918			; Jump if equal
		cmp	byte ptr [di-2],9
		jne	loc_918			; Jump if not equal
		dec	di
loc_918:
		mov	bx,si
		sub	bx,dx
loc_919:
		cmp	cx,bx
		je	loc_920			; Jump if equal
		cld				; Clear direction
		movsb				; Mov [si] to es:[di]
		inc	bx
		jmp	short loc_919		; (64FE)
loc_920:
		mov	cx,di
		pop	di
		cmp	byte ptr ds:[2EBDh],1	; (94E8:2EBD=0)
		je	loc_921			; Jump if equal
		mov	dx,di
		jmp	short loc_922		; (6518)
loc_921:
		mov	dx,28DCh
loc_922:
		sub	cx,dx
loc_923:
		cmp	byte ptr ds:[2EBCh],1	; (94E8:2EBC=3Dh)
		je	loc_925			; Jump if equal
		cmp	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
		je	loc_925			; Jump if equal
		test	word ptr ds:[42CEh],10h	; (94E8:42CE=0F78Bh)
		jz	loc_924			; Jump if zero
		cmp	cx,8
		jbe	loc_925			; Jump if below or =
		mov	di,dx
		cmp	byte ptr [di],0Ch
		je	loc_925			; Jump if equal
		add	dx,5
		sub	cx,5
		jmp	short loc_925		; (6559)
loc_924:
		mov	di,dx
		cmp	byte ptr [di+4],3Ah	; ':'
		jne	loc_925			; Jump if not equal
		mov	word ptr [di],2020h
		mov	word ptr [di+2],2020h
		mov	byte ptr [di+4],20h	; ' '
loc_925:
		test	word ptr ds:[42CEh],80h	; (94E8:42CE=0F78Bh)
		jz	loc_929			; Jump if zero
		mov	di,dx
		push	cx
  
locloop_926:
		test	byte ptr [di],80h
		jz	loc_928			; Jump if zero
		cmp	byte ptr [di],0B1h
		jne	loc_927			; Jump if not equal
		mov	byte ptr [di],5Fh	; '_'
		jmp	short loc_928		; (6576)
loc_927:
		mov	byte ptr [di],3Dh	; '='
loc_928:
		inc	di
		loop	locloop_926		; Loop if cx > 0
  
		pop	cx
loc_929:
		inc	word ptr ds:[2DBAh]	; (94E8:2DBA=8D61h)
		jnz	loc_930			; Jump if not zero
		inc	byte ptr ds:[2DBCh]	; (94E8:2DBC=0E8h)
loc_930:
		mov	bx,word ptr ds:[2C3Ch]	; (94E8:2C3C=0BC7h)
		mov	ah,40h			; '@'
		int	21h			; DOS Services  ah=function 40h
						;  write file cx=bytes, to ds:dx
		jnc	loc_931			; Jump if carry=0
		mov	bl,0Ah
		jmp	short loc_932		; (6598)
loc_931:
		cmp	ax,cx
		je	loc_933			; Jump if equal
		mov	bl,0Bh
loc_932:
		stc				; Set carry flag
		jmp	short loc_934		; (659C)
loc_933:
		clc				; Clear carry flag
loc_934:
		pop	si
		pop	di
		pop	cx
		jc	loc_935			; Jump if carry Set
		retn
loc_935:
		pop	ax
		jmp	loc_191			; (2176)
sub_54		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_55		proc	near
		test	word ptr ds:[42CEh],8	; (94E8:42CE=0F78Bh)
		jz	loc_936			; Jump if zero
		mov	bl,0
		clc				; Clear carry flag
		retn
loc_936:
		push	dx
		cmp	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
		je	loc_945			; Jump if equal
		mov	ax,word ptr ds:[2DBAh]	; (94E8:2DBA=8D61h)
		xor	dx,dx			; Zero register
		mov	bl,byte ptr ds:[2EBFh]	; (94E8:2EBF=75h)
		cmp	bl,0
		jne	loc_937			; Jump if not equal
		cmp	word ptr ds:[2D59h],0	; (94E8:2D59=0D88Bh)
		je	loc_938			; Jump if equal
		jmp	short loc_945		; (662F)
loc_937:
		xor	bh,bh			; Zero register
		div	bx			; ax,dx rem=dx:ax/reg
		cmp	dx,0
		jne	loc_945			; Jump if not equal
loc_938:
		push	cx
		push	bp
		inc	word ptr ds:[2D59h]	; (94E8:2D59=0D88Bh)
		mov	bp,2D37h
		mov	ax,word ptr ds:[2D59h]	; (94E8:2D59=0D88Bh)
		cmp	ax,1
		je	loc_939			; Jump if equal
		mov	byte ptr ds:[2CCAh],0Ch	; (94E8:2CCA=0F3h)
loc_939:
		mov	bl,0
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	word ptr ds:[bp],2020h
		mov	dx,2CCAh
		call	sub_54			; (6428)
		inc	word ptr ds:[2DBAh]	; (94E8:2DBA=8D61h)
		jnz	loc_940			; Jump if not zero
		inc	byte ptr ds:[2DBCh]	; (94E8:2DBC=0E8h)
loc_940:
		mov	dx,38AAh
		mov	cx,2
		mov	bx,word ptr ds:[2C3Ch]	; (94E8:2C3C=0BC7h)
		mov	ah,40h			; '@'
		int	21h			; DOS Services  ah=function 40h
						;  write file cx=bytes, to ds:dx
		jnc	loc_941			; Jump if carry=0
		mov	bl,0Ah
		jmp	short loc_942		; (6629)
loc_941:
		cmp	ax,cx
		je	loc_943			; Jump if equal
		mov	bl,0Bh
loc_942:
		stc				; Set carry flag
		jmp	short loc_944		; (662D)
loc_943:
		clc				; Clear carry flag
loc_944:
		pop	bp
		pop	cx
loc_945:
		pop	dx
		jc	loc_946			; Jump if carry Set
		retn
loc_946:
		pop	ax
		jmp	loc_191			; (2176)
sub_55		endp
  
		nop
		call	sub_55			; (65A8)
		push	si
		push	di
		push	dx
		call	sub_109			; (80CE)
		mov	word ptr ds:[3900h],0	; (94E8:3900=0EDEBh)
		test	byte ptr ds:[38BAh],10h	; (94E8:38BA=0F7h)
		jz	loc_947			; Jump if zero
		jmp	loc_964			; (675D)
loc_947:
		cmp	byte ptr ds:[38B7h],1	; (94E8:38B7=0Ah)
		jne	loc_949			; Jump if not equal
		cmp	word ptr ds:[38B8h],0	; (94E8:38B8=74C0h)
		je	loc_949			; Jump if equal
		mov	byte ptr ds:[3902h],0	; (94E8:3902=33h)
		mov	ax,word ptr ds:[3949h]	; (94E8:3949=5150h)
		mov	di,0
		cmp	byte ptr ds:[38BAh],2	; (94E8:38BA=0F7h)
		je	loc_948			; Jump if equal
		mov	ax,word ptr ds:[394Bh]	; (94E8:394B=0E853h)
		mov	di,1000h
		cmp	byte ptr ds:[38BAh],1	; (94E8:38BA=0F7h)
		je	loc_948			; Jump if equal
		mov	ax,word ptr ds:[394Dh]	; (94E8:394D=0E1F8h)
		mov	di,13FCh
loc_948:
		cmp	ax,word ptr ds:[38B8h]	; (94E8:38B8=74C0h)
		jae	loc_950			; Jump if above or =
loc_949:
		jmp	loc_991			; (68C2)
loc_950:
		mov	ax,word ptr ds:[38B8h]	; (94E8:38B8=74C0h)
		dec	ax
		shl	ax,1			; Shift w/zeros fill
		shl	ax,1			; Shift w/zeros fill
		add	di,ax
		call	sub_107			; (80C8)
		mov	dx,es:[di+2]
		mov	ax,es:[di+6]
		sub	ax,dx
		mov	word ptr ds:[3900h],ax	; (94E8:3900=0EDEBh)
		mov	cx,es:[di]
		mov	word ptr ds:[38FCh],cx	; (94E8:38FC=7604h)
		call	sub_109			; (80CE)
loc_951:
		mov	word ptr ds:[38FEh],dx	; (94E8:38FE=4607h)
		mov	cx,word ptr ds:[38FCh]	; (94E8:38FC=7604h)
		mov	ah,42h			; 'B'
		mov	al,0
		mov	bx,word ptr ds:[37EAh]	; (94E8:37EA=7400h)
		int	21h			; DOS Services  ah=function 42h
						;  move file ptr, cx,dx=offset
		mov	ah,3Fh			; '?'
		mov	bx,word ptr ds:[37EAh]	; (94E8:37EA=7400h)
		mov	cx,200h
		mov	dx,3950h
		int	21h			; DOS Services  ah=function 3Fh
						;  read file, cx=bytes, to ds:dx
		jnc	loc_952			; Jump if carry=0
		mov	bl,0Eh
		jmp	loc_991			; (68C2)
loc_952:
		cmp	ax,0
		jne	loc_953			; Jump if not equal
		jmp	loc_991			; (68C2)
loc_953:
		cmp	byte ptr ds:[38BAh],2	; (94E8:38BA=0F7h)
		jne	loc_954			; Jump if not equal
		jmp	loc_974			; (67F5)
loc_954:
		mov	si,3950h
loc_955:
;*		call	far ptr sub_212		;*(1548:10B8)
		db	 9Ah,0B8h, 10h, 48h, 15h
		mov	di,3B70h
		mov	cx,4
  
locloop_956:
		cmp	byte ptr [si],0Dh
		je	loc_957			; Jump if equal
		inc	si
		dec	word ptr ds:[3900h]	; (94E8:3900=0EDEBh)
		jz	loc_957			; Jump if zero
		loop	locloop_956		; Loop if cx > 0
  
		mov	word ptr [di],203Bh
		inc	di
		inc	di
loc_957:
		mov	cx,word ptr ds:[3900h]	; (94E8:3900=0EDEBh)
		cld				; Clear direction
  
locloop_958:
		cmp	byte ptr [si],0Dh
		je	loc_960			; Jump if equal
		cmp	di,3BD6h
		jae	loc_959			; Jump if above or =
		movsb				; Mov [si] to es:[di]
		dec	si
loc_959:
		inc	si
		loop	locloop_958		; Loop if cx > 0
  
		jmp	short loc_961		; (6729)
loc_960:
		inc	si
		inc	si
		dec	cx
		jz	loc_961			; Jump if zero
		dec	cx
loc_961:
		mov	dx,3B50h
		call	sub_53			; (6418)
		cmp	cx,0
		je	loc_963			; Jump if equal
		mov	word ptr ds:[3900h],cx	; (94E8:3900=0EDEBh)
		mov	ax,3B50h
		sub	ax,si
		cmp	cx,ax
		jb	loc_955			; Jump if below
		cmp	si,3AF6h
		jb	loc_955			; Jump if below
		mov	dx,si
		sub	dx,3950h
		add	dx,word ptr ds:[38FEh]	; (94E8:38FE=4607h)
		jnc	loc_962			; Jump if carry=0
		inc	word ptr ds:[38FCh]	; (94E8:38FC=7604h)
loc_962:
		jmp	loc_951			; (66B1)
loc_963:
		jmp	loc_991			; (68C2)
loc_964:
;*		call	far ptr sub_212		;*(1548:10B8)
		db	 9Ah,0B8h, 10h, 48h, 15h
		cmp	byte ptr ds:[38BAh],15h	; (94E8:38BA=0F7h)
		jb	loc_965			; Jump if below
		mov	cl,byte ptr ds:[38BBh]	; (94E8:38BB=0E8h)
		xor	ch,ch			; Zero register
		xor	bx,bx			; Zero register
		mov	di,3B70h
		mov	byte ptr [di],3Bh	; ';'
		add	di,0Ah
		mov	si,38BCh
		call	sub_104			; (80B9)
		jmp	short loc_968		; (67B4)
loc_965:
		pop	dx
		push	dx
		push	si
		mov	di,3B50h
		mov	si,dx
		mov	cx,282Ah
		sub	cx,27CAh
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	si
		mov	si,38BCh
		call	sub_104			; (80B9)
loc_966:
		mov	cl,byte ptr ds:[38BBh]	; (94E8:38BB=0E8h)
		xor	ch,ch			; Zero register
		mov	bx,cx
		cmp	cx,24h
		jbe	loc_967			; Jump if below or =
		mov	cx,1Ch
loc_967:
		mov	di,3BB0h
		mov	word ptr [di],203Bh
		inc	di
		inc	di
loc_968:
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cmp	bx,24h
		ja	loc_969			; Jump if above
		xor	bx,bx			; Zero register
		jmp	short loc_972		; (67D4)
loc_969:
		sub	bx,1Ch
		mov	cx,8
		mov	ax,cx
  
locloop_970:
		cmp	byte ptr [si],20h	; ' '
		je	loc_971			; Jump if equal
		movsb				; Mov [si] to es:[di]
		loop	locloop_970		; Loop if cx > 0
  
loc_971:
		sub	ax,cx
		sub	bx,ax
loc_972:
		call	sub_104			; (80B9)
		mov	byte ptr ds:[38BBh],bl	; (94E8:38BB=0E8h)
		mov	dx,3B50h
		call	sub_53			; (6418)
		cmp	byte ptr ds:[38BBh],0	; (94E8:38BB=0E8h)
		je	loc_973			; Jump if equal
;*		call	far ptr sub_212		;*(1548:10B8)
		db	 9Ah,0B8h, 10h, 48h, 15h
		jmp	short loc_966		; (679B)
loc_973:
		jmp	loc_989			; (68AB)
		jmp	loc_992			; (68CE)
loc_974:
		mov	si,3950h
loc_975:
;*		call	far ptr sub_212		;*(1548:10B8)
		db	 9Ah,0B8h, 10h, 48h, 15h
		cmp	byte ptr ds:[3902h],2	; (94E8:3902=33h)
		jae	loc_979			; Jump if above or =
		cmp	byte ptr [si+4],0B0h
		jb	loc_977			; Jump if below
		cmp	byte ptr ds:[3902h],0	; (94E8:3902=33h)
		jne	loc_976			; Jump if not equal
		mov	al,3
		call	sub_52			; (6380)
		inc	byte ptr ds:[3902h]	; (94E8:3902=33h)
loc_976:
		jmp	short loc_979		; (6840)
loc_977:
		cmp	byte ptr ds:[3902h],1	; (94E8:3902=33h)
		jne	loc_978			; Jump if not equal
		mov	al,3
		call	sub_52			; (6380)
loc_978:
		pop	dx
		push	dx
		push	si
		mov	di,3B50h
		mov	si,dx
		mov	cx,282Ah
		sub	cx,27CAh
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	si
		mov	byte ptr ds:[3902h],2	; (94E8:3902=33h)
loc_979:
		mov	di,3BB0h
		mov	cx,4
  
locloop_980:
		cmp	byte ptr [si],0Dh
		je	loc_981			; Jump if equal
		inc	si
		dec	word ptr ds:[3900h]	; (94E8:3900=0EDEBh)
		jz	loc_981			; Jump if zero
		loop	locloop_980		; Loop if cx > 0
  
		mov	word ptr [di],203Bh
		inc	di
		inc	di
loc_981:
		mov	cx,word ptr ds:[3900h]	; (94E8:3900=0EDEBh)
		cld				; Clear direction
  
locloop_982:
		cmp	byte ptr [si],0Dh
		je	loc_984			; Jump if equal
		cmp	di,3BD6h
		jae	loc_983			; Jump if above or =
		movsb				; Mov [si] to es:[di]
		dec	si
loc_983:
		inc	si
		loop	locloop_982		; Loop if cx > 0
  
		jmp	short loc_985		; (6877)
loc_984:
		inc	si
		inc	si
		dec	cx
		jz	loc_985			; Jump if zero
		dec	cx
loc_985:
		mov	dx,3B50h
		call	sub_53			; (6418)
		cmp	cx,0
		je	loc_989			; Jump if equal
		mov	word ptr ds:[3900h],cx	; (94E8:3900=0EDEBh)
		mov	ax,3B50h
		sub	ax,si
		cmp	cx,ax
		jb	loc_986			; Jump if below
		cmp	si,3AF6h
		jae	loc_987			; Jump if above or =
loc_986:
		jmp	loc_975			; (67F8)
loc_987:
		mov	dx,si
		sub	dx,3950h
		add	dx,word ptr ds:[38FEh]	; (94E8:38FE=4607h)
		jnc	loc_988			; Jump if carry=0
		inc	word ptr ds:[38FCh]	; (94E8:38FC=7604h)
loc_988:
		jmp	loc_951			; (66B1)
loc_989:
		mov	al,byte ptr ds:[38BAh]	; (94E8:38BA=0F7h)
		and	al,0Fh
		cmp	al,5
		jae	loc_992			; Jump if above or =
		cmp	al,2
		jne	loc_990			; Jump if not equal
		or	byte ptr ds:[38BAh],13h	; (94E8:38BA=0F7h)
loc_990:
;*		call	sub_33			;*(3154)
		db	0E8h, 94h,0C8h
		jmp	short loc_992		; (68CE)
loc_991:
		cmp	byte ptr ds:[38BAh],5	; (94E8:38BA=0F7h)
		jae	loc_992			; Jump if above or =
		pop	dx
;*		call	sub_33			;*(3154)
		db	0E8h, 87h,0C8h
		push	dx
loc_992:
		mov	word ptr ds:[38B8h],0	; (94E8:38B8=74C0h)
		pushf				; Push flags
		and	byte ptr ds:[38BAh],0Fh	; (94E8:38BA=0F7h)
		cmp	byte ptr ds:[38BAh],4	; (94E8:38BA=0F7h)
		ja	loc_993			; Jump if above
		mov	byte ptr ds:[38BAh],4	; (94E8:38BA=0F7h)
loc_993:
		popf				; Pop flags
		pop	dx
		pop	di
		pop	si
		retn
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si+53h],dl
		push	cx
		push	dx
		push	si
		push	di
		push	es
		cmp	data_164,1		; (020C:1309=0)
		je	loc_995			; Jump if equal
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	es,data_157		; (020C:12FB=0)
		mov	si,76h
		mov	dx,0A16h
		mov	di,data_158		; (020C:12FD=0)
		call	sub_58			; (69B0)
		mov	cx,846h
		sub	cx,76h
		nop				;*ASM fixup - sign extn byte
  
locloop_994:
		cld				; Clear direction
		movsb				; Mov [si] to es:[di]
		xchg	dx,si
		mov	al,[si]
		xchg	si,dx
		inc	dx
		xlat				; al=[al+[bx]] table
		mov	es:[di],al
		inc	di
		loop	locloop_994		; Loop if cx > 0
  
		call	sub_59			; (69D4)
		jmp	short loc_1003		; (6992)
loc_995:
		cmp	data_237,1		; (020C:2642=0)
		jne	loc_996			; Jump if not equal
		call	sub_78			; (7118)
		jmp	short loc_997		; (6943)
loc_996:
		mov	ah,3
		xor	bh,bh			; Zero register
		call	sub_77			; (70B4)
		push	dx
loc_997:
		mov	ah,2
		xor	bh,bh			; Zero register
		xor	dx,dx			; Zero register
		call	sub_77			; (70B4)
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
data_559	dw	46B9h
data_560	dw	8008h
		db	3Eh
		inc	dx
		add	es:[di+3],si
		mov	cx,7F6h
loc_998:
		sub	cx,76h
		nop				;*ASM fixup - sign extn byte
		dec	cx
		mov	si,76h
		mov	di,0A16h
  
locloop_999:
		mov	al,[di]
		xlat				; al=[al+[bx]] table
		cmp	al,0
		jne	loc_1000		; Jump if not equal
		mov	dl,20h			; ' '
		jmp	short loc_1001		; (6975)
loc_1000:
		mov	dl,[si]
loc_1001:
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		inc	si
		inc	di
		loop	locloop_999		; Loop if cx > 0
  
		cmp	data_237,1		; (020C:2642=0)
		jne	loc_1002		; Jump if not equal
		call	sub_79			; (714C)
		jmp	short loc_1003		; (6992)
loc_1002:
		mov	ah,2
		xor	bh,bh			; Zero register
		pop	dx
		call	sub_77			; (70B4)
loc_1003:
		pop	es
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_57		proc	near
;*		call	sub_56			;*(68F0)
		db	0E8h, 51h,0FFh
		push	ax
		push	bx
		push	dx
		mov	ah,2
		xor	bh,bh			; Zero register
		mov	dx,184Fh
		call	sub_77			; (70B4)
		pop	dx
		pop	bx
		pop	ax
		retn
sub_57		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_58		proc	near
		cmp	byte ptr ds:[1308h],1	; (94E8:1308=21h)
		je	loc_1005		; Jump if equal
		push	dx
		mov	dx,3DAh
loc_1004:
		in	al,dx			; port 3DAh, CGA/EGA vid status
		test	al,8
		jnz	loc_1004		; Jump if not zero
		mov	dx,3D8h
		push	ds
		xor	ax,ax			; Zero register
		mov	ds,ax
		mov	al,byte ptr ds:[465h]	; (0000:0465=29h)
		and	al,0F7h
		mov	byte ptr ds:[465h],al	; (0000:0465=29h)
		out	dx,al			; port 3D8h, CGA video control
		pop	ds
		pop	dx
loc_1005:
		retn
sub_58		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_59		proc	near
		cmp	byte ptr ds:[1308h],1	; (94E8:1308=21h)
		je	loc_1006		; Jump if equal
		push	dx
		mov	dx,3D8h
		push	ds
		xor	ax,ax			; Zero register
		mov	ds,ax
		mov	al,byte ptr ds:[465h]	; (0000:0465=29h)
		or	al,8
		mov	byte ptr ds:[465h],al	; (0000:0465=29h)
		out	dx,al			; port 3D8h, CGA video control
		pop	ds
		pop	dx
loc_1006:
		retn
sub_59		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_60		proc	near
		cmp	byte ptr ds:[1308h],1	; (94E8:1308=21h)
		jne	loc_1007		; Jump if not equal
		mov	es:[di],ah
		retn
loc_1007:
		push	cx
		push	dx
		push	ax
		cmp	byte ptr ds:[1309h],1	; (94E8:1309=53h)
		je	loc_1011		; Jump if equal
		mov	dx,3DAh
loc_1008:
		sti				; Enable interrupts
		mov	ch,9
		cli				; Disable interrupts
		in	al,dx			; port 3DAh, CGA/EGA vid status
		test	al,8
		jnz	loc_1010		; Jump if not zero
		test	al,1
		jnz	loc_1008		; Jump if not zero
loc_1009:
		in	al,dx			; port 3DAh, CGA/EGA vid status
		test	al,ch
		jz	loc_1009		; Jump if zero
loc_1010:
		cld				; Clear direction
		mov	al,ah
		stosb				; Store al to es:[di]
		sti				; Enable interrupts
		dec	di
		jmp	short loc_1012		; (6A45)
loc_1011:
		cmp	ah,20h			; ' '
		jb	loc_1012		; Jump if below
		push	bx
		push	ax
		mov	dl,0A0h
		mov	ax,di
		div	dl			; al, ah rem = ax/reg
		xchg	al,ah
		shr	al,1			; Shift w/zeros fill
		mov	dx,ax
		mov	ah,2
		xor	bh,bh			; Zero register
		call	sub_77			; (70B4)
		pop	ax
		mov	dl,ah
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		pop	bx
loc_1012:
		pop	ax
		pop	dx
		pop	cx
		retn
sub_60		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_61		proc	near
		push	dx
		call	sub_109			; (80CE)
		mov	di,699h
		mov	cx,0Ah
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	ah,36h			; '6'
		xor	dl,dl			; Zero register
		int	21h			; DOS Services  ah=function 36h
						;  get free space, drive dl,1=a:
		cmp	ax,0FFFFh
		jne	loc_1013		; Jump if not equal
		jmp	loc_1019		; (6AFF)
loc_1013:
		mul	cx			; dx:ax = reg * ax
		mul	bx			; dx:ax = reg * ax
		cmp	dx,5F5h
		jb	loc_1014		; Jump if below
		push	si
		mov	bp,69Eh
		mov	si,4913h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		jmp	short loc_1019		; (6AFF)
loc_1014:
		mov	cx,2710h
		div	cx			; ax,dx rem=dx:ax/reg
		push	ax
		mov	bp,69Eh
		mov	bl,1
		mov	ax,dx
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		sub	bp,4
		mov	cl,ds:[bp]
		pop	ax
		cmp	ax,0
		jne	loc_1015		; Jump if not equal
		cmp	cl,20h			; ' '
		je	loc_1019		; Jump if equal
		mov	byte ptr ds:[bp],2Ch	; ','
		dec	bp
		mov	ds:[bp],cl
		jmp	short loc_1019		; (6AFF)
loc_1015:
		cmp	cl,20h			; ' '
		jne	loc_1016		; Jump if not equal
		mov	cl,30h			; '0'
loc_1016:
		mov	byte ptr ds:[bp],2Ch	; ','
		dec	bp
		mov	ds:[bp],cl
		add	bp,2
		cmp	byte ptr ds:[bp],20h	; ' '
		jne	loc_1017		; Jump if not equal
		mov	byte ptr ds:[bp],30h	; '0'
loc_1017:
		inc	bp
		cmp	byte ptr ds:[bp],20h	; ' '
		jne	loc_1018		; Jump if not equal
		mov	byte ptr ds:[bp],30h	; '0'
loc_1018:
		mov	bp,699h
		mov	bl,1
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		sub	bp,4
		mov	ax,ds:[bp]
		cmp	ah,20h			; ' '
		je	loc_1019		; Jump if equal
		mov	byte ptr ds:[bp+1],2Ch	; ','
		dec	bp
		mov	ds:[bp],ax
loc_1019:
		pop	dx
		retn
sub_61		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_62		proc	near
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	ah,dh
		mov	dh,byte ptr ds:[2A77h]	; (94E8:2A77=4Ah)
		mov	si,1314h
		mov	di,719h
		mov	cx,1320h
		sub	cx,1314h
		mov	bx,1ABAh
loc_1020:
		cmp	dh,cs:[bx]
		je	loc_1022		; Jump if equal
		inc	bx
		add	si,cx
		cmp	byte ptr cs:[bx],0
		je	loc_1021		; Jump if equal
		jmp	short loc_1020		; (6B23)
loc_1021:
		jmp	short loc_1022		; (6B35)
loc_1022:
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	dh,byte ptr ds:[2A79h]	; (94E8:2A79=0BFh)
		mov	si,1380h
		mov	di,70Eh
		mov	cx,1385h
		sub	cx,1380h
		test	dh,0Fh
		jz	loc_1024		; Jump if zero
		add	si,cx
		test	dh,1
		jnz	loc_1024		; Jump if not zero
		add	si,cx
		test	dh,2
		jnz	loc_1024		; Jump if not zero
		add	si,cx
		push	dx
		mov	dl,dh
		and	dl,0FBh
		test	dl,14h
		pop	dx
		jz	loc_1023		; Jump if zero
		add	si,cx
		add	si,cx
		jmp	short loc_1024		; (6B7E)
loc_1023:
		push	dx
		mov	dl,dh
		and	dl,0FBh
		test	dl,0Ch
		pop	dx
		jz	loc_1024		; Jump if zero
		add	si,cx
loc_1024:
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cmp	ah,0
		je	loc_1028		; Jump if equal
		cmp	byte ptr ds:[1309h],1	; (94E8:1309=53h)
		jne	loc_1025		; Jump if not equal
;*		call	sub_56			;*(68F0)
		db	0E8h, 60h,0FDh
		jmp	short loc_1028		; (6BDB)
loc_1025:
		mov	si,719h
		mov	di,719h
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	ax,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,ax
		mov	cx,1320h
		sub	cx,1314h
  
locloop_1026:
		mov	ah,[si]
		call	sub_60			; (69F0)
		add	di,2
		inc	si
		loop	locloop_1026		; Loop if cx > 0
  
		mov	si,70Eh
		mov	di,70Eh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	cx,1385h
		sub	cx,1380h
  
locloop_1027:
		mov	ah,[si]
		call	sub_60			; (69F0)
		add	di,2
		inc	si
		loop	locloop_1027		; Loop if cx > 0
  
loc_1028:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1029		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1029		; Jump if equal
		call	sub_115			; (83A4)
loc_1029:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
sub_62		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_63		proc	near
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	cx,11h
  
locloop_1030:
		mov	byte ptr [bx+30h],7
		inc	bx
		loop	locloop_1030		; Loop if cx > 0
  
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		cmp	byte ptr ds:[2EBDh],1	; (94E8:2EBD=0)
		je	loc_1031		; Jump if equal
		mov	byte ptr [bx+30h],0
		mov	byte ptr [bx+33h],0
		mov	byte ptr [bx+34h],0
loc_1031:
		retn
sub_63		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_64		proc	near
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	cx,11h
  
locloop_1032:
		mov	byte ptr [bx+30h],0Fh
		inc	bx
		loop	locloop_1032		; Loop if cx > 0
  
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		cmp	byte ptr ds:[2EBDh],1	; (94E8:2EBD=0)
		je	loc_1033		; Jump if equal
		mov	byte ptr [bx+30h],0
		mov	byte ptr [bx+33h],0
		mov	byte ptr [bx+34h],0
loc_1033:
		cmp	byte ptr cs:[4CE7h],1	; (020C:4CE7=1Fh)
		jne	loc_1034		; Jump if not equal
		mov	byte ptr [bx+38h],7
loc_1034:
		retn
sub_64		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_65		proc	near
		push	di
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	cx,15FBh
		sub	cx,15B1h
		mov	si,15B1h
		mov	al,cl
		mul	ah			; ax = reg * al
		add	si,ax
		mov	di,7A9h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1035		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1035		; Jump if equal
		call	sub_115			; (83A4)
loc_1035:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		pop	di
		retn
sub_65		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_66		proc	near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	es
		mov	bp,68Eh
		mov	ax,word ptr ds:[2A63h]	; (94E8:2A63=6C6h)
		mov	bl,1
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	bp,72Eh
		mov	ax,word ptr ds:[2A67h]	; (94E8:2A67=8B00h)
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
data_564	dw	475h
data_565	dw	603h
		db	6Fh
data_566	dw	0B32Ah			; Data table (indexed access)
data_567	dw	9A01h			; Data table (indexed access)
data_568	dw	0D4h			; Data table (indexed access)
		dec	ax
		adc	ax,0DEBDh
		push	es
		mov	ax,word ptr ds:[2A6Bh]	; (94E8:2A6B=1BAh)
		mov	bl,1
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		cmp	byte ptr [bx+4Eh],0
		jne	loc_1037		; Jump if not equal
		jmp	loc_1044		; (6D74)
loc_1037:
		mov	si,68Eh
		mov	cx,5
		cmp	byte ptr ds:[1309h],1	; (94E8:1309=53h)
		jne	loc_1040		; Jump if not equal
		mov	bl,3
		mov	dx,1328h
loc_1038:
		mov	ah,2
		xor	bh,bh			; Zero register
		call	sub_77			; (70B4)
		cld				; Clear direction
		mov	cx,5
		push	dx
  
locloop_1039:
		lodsb				; String [si] to al
		mov	dl,al
;*		call	far ptr sub_190		;*(1548:0350)
		db	 9Ah, 50h, 03h, 48h, 15h
		loop	locloop_1039		; Loop if cx > 0
  
		pop	dx
		add	dx,100h
		add	si,4Bh
		dec	bl
		jnz	loc_1038		; Jump if not zero
		jmp	short loc_1044		; (6D74)
loc_1040:
		mov	ax,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,ax
		mov	di,68Eh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
  
locloop_1041:
		cld				; Clear direction
		lodsb				; String [si] to al
		mov	ah,al
		call	sub_60			; (69F0)
		add	di,2
		loop	locloop_1041		; Loop if cx > 0
  
		mov	si,6DEh
		mov	di,6DEh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	cx,5
  
locloop_1042:
		lodsb				; String [si] to al
		mov	ah,al
		call	sub_60			; (69F0)
		add	di,2
		loop	locloop_1042		; Loop if cx > 0
  
		mov	si,72Eh
		mov	di,72Eh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	cx,5
  
locloop_1043:
		lodsb				; String [si] to al
		mov	ah,al
		call	sub_60			; (69F0)
		add	di,2
		loop	locloop_1043		; Loop if cx > 0
  
loc_1044:
data_569	dw	5D07h
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_66		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_67		proc	near
		push	ax
		push	bx
		push	cx
		push	dx
		push	di
		push	bp
		push	es
		mov	ax,word ptr ds:[2D82h]	; (AAC0:2D82=0)
		mov	bp,7BCh
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	ax,word ptr ds:[2D84h]	; (AAC0:2D84=0)
		inc	bp
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	ax,word ptr ds:[12FBh]	; (AAC0:12FB=0)
		mov	es,ax
		mov	di,7A9h
		add	di,13h
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (AAC0:12FD=0)
		mov	bp,7BCh
		mov	cx,9
  
locloop_1045:
		mov	ah,ds:[bp]
		call	sub_60			; (69F0)
		inc	di
		inc	di
		inc	bp
		loop	locloop_1045		; Loop if cx > 0
  
		mov	bx,word ptr ds:[2D88h]	; (AAC0:2D88=0)
		sub	bx,word ptr ds:[2D86h]	; (AAC0:2D86=0)
		jz	loc_1048		; Jump if zero
		mov	ax,word ptr ds:[2D84h]	; (AAC0:2D84=0)
		sub	ax,word ptr ds:[2D86h]	; (AAC0:2D86=0)
		mov	cx,40h
		mul	cx			; dx:ax = reg * ax
		div	bx			; ax,dx rem=dx:ax/reg
		mov	cx,word ptr ds:[2D84h]	; (AAC0:2D84=0)
		cmp	cx,word ptr ds:[2A3Eh]	; (AAC0:2A3E=0)
		je	loc_1046		; Jump if equal
		cmp	ax,word ptr ds:[2D8Ah]	; (AAC0:2D8A=0)
		je	loc_1048		; Jump if equal
loc_1046:
		mov	dx,ax
		mov	di,7A9h
		add	di,1Eh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (AAC0:12FD=0)
		mov	ax,word ptr ds:[2D8Ah]	; (AAC0:2D8A=0)
		and	al,0FEh
		add	di,ax
		mov	ah,0FAh
		call	sub_60			; (69F0)
		inc	di
		mov	ah,0Fh
		call	sub_60			; (69F0)
		mov	word ptr ds:[2D8Ah],dx	; (AAC0:2D8A=0)
		mov	di,7A9h
		add	di,1Eh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (AAC0:12FD=0)
		mov	ah,0DDh
		test	dx,1
		jz	loc_1047		; Jump if zero
		mov	ah,0DEh
loc_1047:
		and	dl,0FEh
		add	di,dx
		call	sub_60			; (69F0)
		inc	di
		mov	ah,byte ptr ds:[11E7h]	; (AAC0:11E7=0)
		call	sub_60			; (69F0)
loc_1048:
		pop	es
		pop	bp
		pop	di
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_67		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_68		proc	near
		push	dx
		push	cx
		push	si
		push	di
		push	es
		call	sub_109			; (80CE)
		mov	si,1595h
		test	byte ptr ds:[1594h],3	; (94E8:1594=0DBh)
		jnz	loc_1049		; Jump if not zero
		mov	si,15A3h
loc_1049:
		mov	di,6B9h
		mov	cx,15A3h
		sub	cx,1595h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		xor	dl,dl			; Zero register
		call	sub_106			; (80C5)
		mov	ax,word ptr es:[0]	; (065D:0000=4817h)
		cmp	ax,0FFFFh
		jne	loc_1050		; Jump if not equal
		mov	dl,1
		xor	ax,ax			; Zero register
loc_1050:
		mov	bp,679h
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	ax,word ptr es:[2]	; (065D:0002=8015h)
		or	dl,dl			; Zero ?
		jz	loc_1051		; Jump if zero
		xor	ax,ax			; Zero register
loc_1051:
		mov	bp,67Eh
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	si,0
		test	byte ptr ds:[1594h],3	; (94E8:1594=0DBh)
		jnz	loc_1052		; Jump if not zero
		mov	al,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		dec	al
		mov	bl,15h
		mul	bl			; ax = reg * al
		add	si,ax
loc_1052:
		mov	ax,es:[si]
		or	dl,dl			; Zero ?
		jz	loc_1053		; Jump if zero
		xor	ax,ax			; Zero register
loc_1053:
		mov	bp,6C9h
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	ax,es:[si+4]
		mov	bp,6CEh
		or	dl,dl			; Zero ?
		jz	loc_1054		; Jump if zero
		xor	ax,ax			; Zero register
loc_1054:
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		pop	es
		pop	di
		pop	si
		pop	dx
		pop	cx
		call	sub_104			; (80B9)
		retn
sub_68		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_69		proc	near
		mov	di,2D5Bh
		push	di
		mov	cx,3Ch
		mov	bl,0
  
locloop_1055:
		mov	al,es:[si]
		cmp	al,20h			; ' '
		jb	loc_1056		; Jump if below
		cmp	al,80h
		jae	loc_1056		; Jump if above or =
		mov	[di],al
		inc	bl
		inc	di
		jmp	short loc_1057		; (6EFD)
loc_1056:
		cmp	bl,0
		je	loc_1057		; Jump if equal
		cmp	bl,8
		ja	loc_1058		; Jump if above
		pop	di
		push	di
		mov	bl,0
loc_1057:
		inc	si
		cmp	bl,20h			; ' '
		ja	loc_1058		; Jump if above
		loop	locloop_1055		; Loop if cx > 0
  
loc_1058:
		pop	di
		retn
sub_69		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_70		proc	near
		push	ax
		mov	ch,20h			; ' '
		mov	ah,1
		call	sub_77			; (70B4)
		pop	ax
		retn
sub_70		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_71		proc	near
		push	ax
		mov	cx,word ptr ds:[2A91h]	; (94E8:2A91=20D0h)
		mov	ah,1
		call	sub_77			; (70B4)
		pop	ax
		retn
sub_71		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_72		proc	near
		push	es
		mov	ax,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,ax
		mov	di,6E7h
		sub	di,643h
		add	di,190h
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	cx,19h
		mov	dl,41h			; 'A'
		mov	dh,61h			; 'a'
  
locloop_1059:
		mov	ah,dl
		mov	al,byte ptr ds:[11E7h]	; (94E8:11E7=0)
		test	bx,8000h
		jnz	loc_1060		; Jump if not zero
		mov	ah,dh
		mov	al,7
loc_1060:
		call	sub_60			; (69F0)
		inc	di
		mov	ah,al
		call	sub_60			; (69F0)
		add	di,9Fh
		inc	dl
		inc	dh
		rol	bx,1			; Rotate
		cmp	cx,0Ch
		jne	loc_1061		; Jump if not equal
		mov	di,70Dh
		sub	di,643h
		add	di,190h
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
loc_1061:
		cmp	cx,0Ah
		jne	loc_1062		; Jump if not equal
		add	di,1E0h
		mov	bh,byte ptr ds:[430Bh]	; (94E8:430B=21h)
		ror	bh,1			; Rotate
		ror	bh,1			; Rotate
		ror	bh,1			; Rotate
loc_1062:
		cmp	cx,6
		jne	loc_1063		; Jump if not equal
		mov	bh,byte ptr ds:[42CEh]	; (94E8:42CE=8Bh)
loc_1063:
		loop	locloop_1059		; Loop if cx > 0
  
		pop	es
		retn
sub_72		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_73		proc	near
		push	cx
		push	di
		push	si
		push	es
		call	sub_109			; (80CE)
		mov	si,14A6h
		mov	di,2EFh
		mov	cx,3
		test	byte ptr ds:[430Bh],7	; (94E8:430B=21h)
		jnz	loc_1064		; Jump if not zero
		add	si,cx
loc_1064:
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	si,2EFh
		mov	di,2EFh
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	ax,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,ax
		mov	cx,3
  
locloop_1065:
		mov	ah,[si]
		call	sub_60			; (69F0)
		add	di,2
		inc	si
		loop	locloop_1065		; Loop if cx > 0
  
		pop	es
		pop	si
		pop	di
		pop	cx
		retn
sub_73		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_74		proc	near
		call	sub_109			; (80CE)
		mov	al,byte ptr ds:[14ADh]	; (94E8:14AD=1Eh)
		mov	cx,14C5h
		sub	cx,14AEh
		mul	cl			; ax = reg * al
		add	ax,14AEh
		mov	si,ax
		mov	di,460h
		mov	cx,14B9h
		sub	cx,14AEh
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	cx,14C5h
		sub	cx,14B9h
		mov	di,552h
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	cx,151Ah
		sub	cx,150Ah
		mov	si,150Ah
		mov	di,46Fh
		test	byte ptr ds:[14ADh],2	; (94E8:14AD=1Eh)
		jz	loc_1066		; Jump if zero
		mov	si,151Ah
loc_1066:
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		retn
sub_74		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_75		proc	near
		call	sub_109			; (80CE)
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	byte ptr [bx+6Fh],0
		mov	byte ptr [bx+5Ch],0
		mov	byte ptr [bx+6Eh],0
		mov	al,byte ptr ds:[152Ah]	; (94E8:152A=0EBh)
		test	al,1
		jz	loc_1067		; Jump if zero
		mov	byte ptr [bx+6Fh],7
loc_1067:
		test	al,2
		jz	loc_1068		; Jump if zero
		mov	byte ptr [bx+5Ch],7
loc_1068:
		test	al,4
		jz	loc_1069		; Jump if zero
		mov	byte ptr [bx+6Eh],7
loc_1069:
		mov	bx,1534h
		xlat				; al=[al+[bx]] table
		mov	ah,al
		and	ax,0FF0h
		mov	cl,4
		ror	al,cl			; Rotate
		mov	bl,ah
		xor	ah,ah			; Zero register
		mov	cx,1542h
		sub	cx,153Ch
		mul	cl			; ax = reg * al
		add	ax,153Ch
		mov	si,ax
		mov	di,51Dh
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	ax,1564h
		sub	ax,1554h
		mov	cx,ax
		mul	bl			; ax = reg * al
		mov	si,ax
		add	si,1554h
		mov	di,563h
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		retn
sub_75		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_76		proc	near
		push	ax
		push	bx
		mov	ah,al
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	al,data_156		; (020C:11E8=0)
		mov	[bx+52h],al
		call	sub_65			; (6C58)
;*		call	sub_56			;*(68F0)
		db	0E8h, 4Ch,0F8h
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	byte ptr [bx+52h],0Fh
		pop	bx
		pop	ax
		retn
sub_76		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_77		proc	near
		cmp	byte ptr ds:[2642h],1	; (94E8:2642=0CDh)
		je	loc_1070		; Jump if equal
		jmp	short loc_1073		; (7115)
loc_1070:
		cmp	ah,2
		je	loc_1071		; Jump if equal
		jmp	short loc_1074		; (7117)
loc_1071:
		push	ax
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		call	sub_104			; (80B9)
		mov	al,dh
		inc	al
		aam				; Ascii adjust
		or	ax,3030h
		xchg	ah,al
		mov	word ptr ds:[2646h],ax	; (94E8:2646=0A00Ah)
		mov	al,dl
		inc	al
		aam				; Ascii adjust
		or	ax,3030h
		xchg	ah,al
		mov	word ptr ds:[2649h],ax	; (94E8:2649=249Bh)
		push	dx
		mov	dx,2644h
		mov	ah,9
		int	21h			; DOS Services  ah=function 09h
						;  display char string at ds:dx
		pop	dx
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1072		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1072		; Jump if equal
		call	sub_115			; (83A4)
loc_1072:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	ax
		jmp	short loc_1074		; (7117)
loc_1073:
		int	10h			; Video display   ah=functn 02h
						;  set cursor location in dx
loc_1074:
		retn
sub_77		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_78		proc	near
		push	dx
		push	ax
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		call	sub_104			; (80B9)
		mov	dx,2651h
		mov	ah,9
		int	21h			; DOS Services  ah=function 09h
						;  display char string at ds:dx
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1075		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1075		; Jump if equal
		call	sub_115			; (83A4)
loc_1075:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	ax
		pop	dx
		retn
sub_78		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_79		proc	near
		push	dx
		push	ax
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		call	sub_104			; (80B9)
		mov	dx,264Dh
		mov	ah,9
		int	21h			; DOS Services  ah=function 09h
						;  display char string at ds:dx
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1076		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1076		; Jump if equal
		call	sub_115			; (83A4)
loc_1076:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	ax
		pop	dx
		retn
sub_79		endp
  
		push	ax
loc_1077:
		cmp	word ptr ds:[bp],2020h
		je	loc_1078		; Jump if equal
		inc	bp
		dec	al
		jnz	loc_1077		; Jump if not zero
loc_1078:
		pop	ax
		retn
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_80		proc	near
		call	sub_109			; (80CE)
		mov	si,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		mov	di,2791h
		mov	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	ds,ax
		mov	cx,10h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		call	sub_104			; (80B9)
		mov	si,2791h
		retn
sub_80		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_81		proc	near
		push	bx
		push	cx
		push	si
		mov	bx,di
		add	bx,cx
		mov	al,es:[di+5]
		test	al,2
		jz	loc_1079		; Jump if zero
		jmp	loc_1106		; (735C)
loc_1079:
		and	al,0Ch
		mov	cx,1
		cmp	data_169,2		; (020C:14AD=0)
		je	loc_1082		; Jump if equal
		mov	cx,4
		cmp	al,4
		je	loc_1082		; Jump if equal
		mov	cx,3
		or	al,al			; Zero ?
		jnz	loc_1082		; Jump if not zero
		cmp	byte ptr es:[di+6],0FFh
		jne	loc_1080		; Jump if not equal
		mov	al,0Ch
		jmp	short loc_1081		; (71EC)
loc_1080:
		cmp	byte ptr es:[di+6],0FEh
		jne	loc_1082		; Jump if not equal
		mov	al,10h
loc_1081:
		mov	cx,7
loc_1082:
		shl	al,1			; Shift w/zeros fill
		xor	ah,ah			; Zero register
		mov	si,2FFDh
		add	si,ax
  
locloop_1083:
		mov	al,[si]
		mov	ds:[bp],al
		inc	si
		inc	bp
		loop	locloop_1083		; Loop if cx > 0
  
		mov	byte ptr ds:[bp],5Fh	; '_'
		inc	bp
		cmp	data_169,1		; (020C:14AD=0)
		ja	loc_1089		; Jump if above
		mov	ax,es:[bx]
		cmp	ax,0FFFFh
		jne	loc_1084		; Jump if not equal
		mov	data_376,1		; (020C:2EB7=4Fh)
		mov	ax,270Fh
loc_1084:
		xor	bl,bl			; Zero register
		cmp	data_169,0		; (020C:14AD=0)
		je	loc_1085		; Jump if equal
		inc	bl
loc_1085:
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		cmp	data_169,0		; (020C:14AD=0)
		je	loc_1088		; Jump if equal
		sub	bp,5
		mov	cx,4
  
locloop_1086:
		mov	al,ds:[bp+1]
		cmp	al,20h			; ' '
		jne	loc_1087		; Jump if not equal
		mov	al,30h			; '0'
loc_1087:
		mov	ds:[bp],al
		inc	bp
		loop	locloop_1086		; Loop if cx > 0
  
		mov	byte ptr ds:[bp],20h	; ' '
loc_1088:
		jmp	loc_1103		; (7334)
loc_1089:
		cmp	byte ptr ds:[2A31h],0	; (020C:2A31=0A1h)
		jne	loc_1090		; Jump if not equal
		mov	ax,es:[di]
		cmp	ax,data_354		; (020C:2D82=4152h)
		jne	loc_1090		; Jump if not equal
		jmp	loc_1101		; (730E)
loc_1090:
		cmp	data_169,2		; (020C:14AD=0)
		jne	loc_1091		; Jump if not equal
		jmp	loc_1099		; (7300)
loc_1091:
		mov	ax,es:[di]
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_106			; (80C5)
		mov	bx,0
loc_1092:
		cmp	word ptr es:[bx],0FFFFh
		je	loc_1096		; Jump if equal
		cmp	es:[bx],ax
		je	loc_1093		; Jump if equal
		add	bx,15h
		jmp	short loc_1092		; (7281)
loc_1093:
		mov	ax,es:[bx+0Ch]
		or	al,data_377		; (020C:2EB8=4Eh)
		mov	ds:[bp],al
		inc	bp
		cmp	ah,20h			; ' '
		je	loc_1094		; Jump if equal
		or	ah,data_377		; (020C:2EB8=4Eh)
		mov	ds:[bp],ah
		inc	bp
loc_1094:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1095		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1095		; Jump if equal
		call	sub_115			; (83A4)
loc_1095:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		jmp	short loc_1100		; (7308)
loc_1096:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1097		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1097		; Jump if equal
		call	sub_115			; (83A4)
loc_1097:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		sub	bp,3
		mov	al,es:[di+5]
		and	al,0Ch
		cmp	al,4
		jne	loc_1098		; Jump if not equal
		dec	bp
loc_1098:
		mov	byte ptr ds:[bp],5Fh	; '_'
		inc	bp
loc_1099:
		mov	ax,es:[di]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_1100:
		mov	byte ptr ds:[bp],5Fh	; '_'
		inc	bp
loc_1101:
		mov	ax,es:[di+2]
		mov	cl,es:[di+5]
		and	cl,0Ch
		cmp	cl,4
		jne	loc_1102		; Jump if not equal
		test	byte ptr es:[di+5],80h
		jz	loc_1102		; Jump if zero
		mov	cx,es:[di+6]
		and	cx,3FFh
		sub	ax,cx
loc_1102:
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_1103:
		mov	al,es:[di+5]
		and	al,0Ch
		cmp	al,4
		jne	loc_1105		; Jump if not equal
		test	byte ptr es:[di+7],40h	; '@'
		jz	loc_1105		; Jump if zero
		test	byte ptr es:[di+5],1
		jnz	loc_1104		; Jump if not zero
		mov	byte ptr ds:[bp],5Fh	; '_'
		inc	bp
loc_1104:
		mov	al,data_408		; (020C:3046=0F9h)
		mov	ds:[bp],al
		inc	bp
loc_1105:
		jmp	short loc_1109		; (7384)
loc_1106:
		mov	cx,0Fh
		cmp	byte ptr es:[bx],7Fh
		jae	loc_1107		; Jump if above or =
		cmp	byte ptr es:[bx],20h	; ' '
		jae	locloop_1108		; Jump if above or =
loc_1107:
		mov	word ptr ds:[bp],3F3Fh
		inc	bp
		inc	bp
		jmp	short loc_1109		; (7384)
  
locloop_1108:
		mov	al,es:[bx]
		cmp	al,20h			; ' '
		je	loc_1109		; Jump if equal
		mov	ds:[bp],al
		inc	bx
		inc	bp
		loop	locloop_1108		; Loop if cx > 0
  
loc_1109:
		mov	al,es:[di+5]
		and	al,0Ch
		cmp	al,4
		jne	loc_1110		; Jump if not equal
		test	byte ptr es:[di+5],80h
		jz	loc_1110		; Jump if zero
		mov	byte ptr ds:[bp],2Bh	; '+'
		inc	bp
		mov	ax,es:[di+6]
		and	ax,3FFh
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
loc_1110:
		pop	si
		pop	cx
		pop	bx
		retn
sub_81		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_82		proc	near
		push	es
		test	byte ptr ds:[2EB1h],1	; (94E8:2EB1=0C9h)
		jz	loc_1112		; Jump if zero
		mov	di,6E8h
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		mov	ax,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,ax
		mov	si,2791h
		mov	cx,4
  
locloop_1111:
		mov	al,[si]
;*		call	far ptr sub_177		;*(1548:0000)
		db	 9Ah, 00h, 00h, 48h, 15h
		mov	ah,bl
		call	sub_60			; (69F0)
		inc	di
		mov	ah,0Fh
		call	sub_60			; (69F0)
		inc	di
		mov	ah,bh
		call	sub_60			; (69F0)
		inc	di
		mov	ah,0Fh
		call	sub_60			; (69F0)
		add	di,3
		inc	si
		loop	locloop_1111		; Loop if cx > 0
  
loc_1112:
		test	byte ptr ds:[2EB1h],2	; (94E8:2EB1=0C9h)
		jz	loc_1114		; Jump if zero
		mov	cx,5000h
		test	byte ptr ds:[2A78h],0F0h	; (94E8:2A78=0ACh)
		jnz	locloop_1113		; Jump if not zero
		mov	cx,1000h
  
locloop_1113:
		jmp	short $+2		; delay for I/O
		jmp	short $+2		; delay for I/O
		jmp	short $+2		; delay for I/O
		loop	locloop_1113		; Loop if cx > 0
  
loc_1114:
		test	byte ptr ds:[2EB1h],8	; (94E8:2EB1=0C9h)
		jz	loc_1116		; Jump if zero
		mov	al,byte ptr ds:[2EB2h]	; (94E8:2EB2=33h)
		cmp	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		ja	loc_1115		; Jump if above
		cmp	al,byte ptr ds:[2638h]	; (94E8:2638=0)
		jne	loc_1116		; Jump if not equal
loc_1115:
		mov	ax,word ptr ds:[2EB3h]	; (94E8:2EB3=0E8D2h)
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		jne	loc_1116		; Jump if not equal
		mov	ax,word ptr ds:[2EB5h]	; (94E8:2EB5=819h)
		cmp	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		jne	loc_1116		; Jump if not equal
;*		call	far ptr sub_197		;*(1548:0628)
		db	 9Ah, 28h, 06h, 48h, 15h
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		nop
loc_1116:
		pop	es
		retn
sub_82		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_83		proc	near
		push	di
		push	es
		mov	byte ptr ds:[263Dh],al	; (94E8:263D=86h)
		mov	ah,al
		shr	ah,1			; Shift w/zeros fill
		add	ah,30h			; '0'
		mov	byte ptr ds:[5806h],ah	; (94E8:5806=80h)
		mov	bp,752h
		mov	ds:[bp],ah
		mov	bx,word ptr ds:[12FBh]	; (94E8:12FB=65Dh)
		mov	es,bx
		mov	di,752h
		sub	di,76h
		nop				;*ASM fixup - sign extn byte
		shl	di,1			; Shift w/zeros fill
		add	di,word ptr ds:[12FDh]	; (94E8:12FD=8E2Eh)
		call	sub_60			; (69F0)
		pop	es
		cmp	byte ptr ds:[2EBDh],0	; (94E8:2EBD=0)
		je	loc_1119		; Jump if equal
		cmp	byte ptr ds:[263Dh],0Ah	; (94E8:263D=86h)
		jb	loc_1117		; Jump if below
		test	byte ptr ds:[430Bh],7	; (94E8:430B=21h)
		jnz	loc_1118		; Jump if not zero
		or	byte ptr ds:[430Bh],7	; (94E8:430B=21h)
		jmp	short loc_1118		; (7493)
loc_1117:
		and	byte ptr ds:[430Bh],0F8h	; (94E8:430B=21h)
loc_1118:
		call	sub_73			; (6F98)
loc_1119:
		pop	di
		retn
sub_83		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_84		proc	near
		push	ax
		push	bx
		push	si
		push	bp
		mov	byte ptr ds:[47B3h],0	; (020C:47B3=41h)
		mov	bp,2
		mov	si,ax
		mov	data_430,ax		; (020C:37A4=0B8h)
		mov	cx,bx
		mov	word ptr ds:[37A2h],bx	; (020C:37A2=1548h)
		cmp	dx,20h
		jne	loc_1120		; Jump if not equal
		call	sub_109			; (80CE)
		mov	dx,2Ch
		mov	di,3C7Dh
		jmp	short loc_1127		; (7517)
loc_1120:
		cmp	dx,10h
		jne	loc_1121		; Jump if not equal
		call	sub_106			; (80C5)
		mov	dx,15h
		mov	di,0
		jmp	short loc_1127		; (7517)
loc_1121:
		cmp	dx,1
		je	loc_1124		; Jump if equal
		cmp	dx,2
		je	loc_1126		; Jump if equal
		cmp	dx,4
		je	loc_1122		; Jump if equal
		cmp	dx,40h
		je	loc_1123		; Jump if equal
		mov	bx,4
		jmp	loc_190			; (215F)
loc_1122:
		call	sub_118			; (84C0)
		mov	bx,3Bh
		mov	dx,4Ah
		jmp	short loc_1137		; (7546)
loc_1123:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		je	loc_1124		; Jump if equal
		call	sub_111			; (80D7)
		jmp	short loc_1125		; (7504)
loc_1124:
		call	sub_117			; (844C)
loc_1125:
		mov	bx,7
		mov	dx,16h
		jmp	short loc_1137		; (7546)
loc_1126:
		call	sub_116			; (83D8)
		mov	bx,0Ah
		mov	dx,19h
		jmp	short loc_1137		; (7546)
loc_1127:
		xor	bp,bp			; Zero register
		push	es
		mov	ax,ds
		mov	es,ax
		pop	ds
		mov	bx,0FFFFh
loc_1128:
		cmp	[di+2],si
		je	loc_1131		; Jump if equal
loc_1129:
		cmp	[di],bx
		je	loc_1132		; Jump if equal
loc_1130:
		add	di,dx
		inc	bp
		jmp	short loc_1128		; (7522)
loc_1131:
		cmp	[di],cx
		jne	loc_1129		; Jump if not equal
		jmp	short loc_1134		; (753F)
loc_1132:
		cmp	[di+2],bx
		jne	loc_1133		; Jump if not equal
		jmp	short loc_1135		; (7542)
loc_1133:
		jmp	short loc_1130		; (752B)
loc_1134:
		stc				; Set carry flag
		jmp	short loc_1136		; (7543)
loc_1135:
		clc				; Clear carry flag
loc_1136:
		jmp	loc_1182		; (7782)
loc_1137:
		mov	di,8
		mov	ax,word ptr es:[2]	; (94E8:0002=0C416h)
		cmp	ax,cx
		ja	loc_1139		; Jump if above
		jc	loc_1138		; Jump if carry Set
		mov	ax,word ptr es:[4]	; (94E8:0004=8B14h)
		cmp	ax,si
		ja	loc_1139		; Jump if above
loc_1138:
		mov	di,word ptr es:[6]	; (94E8:0006=0C80Eh)
loc_1139:
		push	es
		mov	ax,ds
		mov	es,ax
		pop	ds
		mov	ah,3
		cmp	byte ptr es:[14ADh],1	; (A80C:14AD=0)
		ja	loc_1140		; Jump if above
		add	bx,bp
		jmp	loc_1156		; (7613)
loc_1140:
		cmp	[di],cx
		jae	loc_1144		; Jump if above or =
		mov	al,[di+5]
		test	al,ah
		jnz	loc_1141		; Jump if not zero
		add	di,bx
		jmp	short loc_1140		; (7575)
loc_1141:
		test	al,2
		jnz	loc_1142		; Jump if not zero
		add	di,bx
		add	di,bp
		jmp	short loc_1140		; (7575)
loc_1142:
		test	al,1
		jnz	loc_1143		; Jump if not zero
		add	di,dx
		jmp	short loc_1140		; (7575)
loc_1143:
		mov	al,[di+6]
		xor	ah,ah			; Zero register
		add	di,ax
		mov	ah,3
		jmp	short loc_1140		; (7575)
loc_1144:
		jz	loc_1145		; Jump if zero
		cmp	word ptr [di],0FFFFh
		jne	loc_1151		; Jump if not equal
		cmp	word ptr [di+2],0FFFFh
		je	loc_1151		; Jump if equal
loc_1145:
		cmp	[di],cx
		jne	loc_1151		; Jump if not equal
		cmp	[di+2],si
		jae	loc_1150		; Jump if above or =
loc_1146:
		mov	al,[di+5]
		test	al,ah
		jnz	loc_1147		; Jump if not zero
		add	di,bx
		jmp	short loc_1145		; (75AE)
loc_1147:
		test	al,2
		jnz	loc_1148		; Jump if not zero
		add	di,bx
		add	di,bp
		jmp	short loc_1145		; (75AE)
loc_1148:
		test	al,1
		jnz	loc_1149		; Jump if not zero
		add	di,dx
		jmp	short loc_1145		; (75AE)
loc_1149:
		mov	al,[di+6]
		xor	ah,ah			; Zero register
		add	di,ax
		mov	ah,3
		jmp	short loc_1145		; (75AE)
loc_1150:
		jz	loc_1152		; Jump if zero
loc_1151:
		jmp	short loc_1155		; (7610)
loc_1152:
		cmp	dx,16h
		jne	loc_1154		; Jump if not equal
		cmp	byte ptr es:[4204h],1	; (A80C:4204=0)
		je	loc_1154		; Jump if equal
		cmp	byte ptr es:[47B3h],0	; (A80C:47B3=0)
		jne	loc_1153		; Jump if not equal
		mov	word ptr ds:[6],di	; (94E8:0006=0C80Eh)
		mov	byte ptr es:[47B3h],1	; (A80C:47B3=0)
loc_1153:
		mov	al,[di+4]
		and	al,1Fh
		cmp	al,1Fh
		jne	loc_1154		; Jump if not equal
		jmp	short loc_1146		; (75B7)
loc_1154:
		jmp	loc_1170		; (76B0)
loc_1155:
		jmp	loc_1177		; (7728)
loc_1156:
		cmp	[di],cx
		jae	loc_1160		; Jump if above or =
		mov	al,[di+5]
		and	al,ah
		cmp	al,1
		jne	loc_1157		; Jump if not equal
		add	di,bx
		jmp	short loc_1156		; (7613)
loc_1157:
		or	al,al			; Zero ?
		jnz	loc_1158		; Jump if not zero
		add	di,bx
		sub	di,bp
		jmp	short loc_1156		; (7613)
loc_1158:
		cmp	al,2
		jne	loc_1159		; Jump if not equal
		add	di,dx
		jmp	short loc_1156		; (7613)
loc_1159:
		mov	al,[di+6]
		xor	ah,ah			; Zero register
		add	di,ax
		mov	ah,3
		jmp	short loc_1156		; (7613)
loc_1160:
		jz	loc_1161		; Jump if zero
		cmp	word ptr [di],0FFFFh
		jne	loc_1167		; Jump if not equal
		cmp	word ptr [di+2],0FFFFh
		je	loc_1167		; Jump if equal
loc_1161:
		cmp	[di],cx
		jne	loc_1167		; Jump if not equal
		cmp	[di+2],si
		jae	loc_1166		; Jump if above or =
loc_1162:
		mov	al,[di+5]
		and	al,ah
		cmp	al,1
		jne	loc_1163		; Jump if not equal
		add	di,bx
		jmp	short loc_1161		; (764E)
loc_1163:
		or	al,al			; Zero ?
		jnz	loc_1164		; Jump if not zero
		add	di,bx
		sub	di,bp
		jmp	short loc_1161		; (764E)
loc_1164:
		cmp	al,2
		jne	loc_1165		; Jump if not equal
		add	di,dx
		jmp	short loc_1161		; (764E)
loc_1165:
		mov	al,[di+6]
		xor	ah,ah			; Zero register
		add	di,ax
		mov	ah,3
		jmp	short loc_1161		; (764E)
loc_1166:
		jz	loc_1168		; Jump if zero
loc_1167:
		jmp	loc_1177		; (7728)
loc_1168:
		cmp	dx,16h
		jne	loc_1170		; Jump if not equal
		cmp	byte ptr es:[4204h],1	; (A80C:4204=0)
		je	loc_1170		; Jump if equal
		cmp	byte ptr es:[47B3h],0	; (A80C:47B3=0)
		jne	loc_1169		; Jump if not equal
		mov	word ptr ds:[6],di	; (94E8:0006=0C80Eh)
		mov	byte ptr es:[47B3h],1	; (A80C:47B3=0)
loc_1169:
		mov	al,[di+4]
		and	al,1Fh
		cmp	al,1Fh
		jne	loc_1170		; Jump if not equal
		jmp	short loc_1162		; (7657)
loc_1170:
		mov	ax,[di]
		mov	word ptr ds:[2],ax	; (94E8:0002=0C416h)
		mov	ax,[di+2]
		mov	word ptr ds:[4],ax	; (94E8:0004=8B14h)
		cmp	byte ptr es:[47B3h],0	; (A80C:47B3=0)
		jne	loc_1171		; Jump if not equal
		mov	word ptr ds:[6],di	; (94E8:0006=0C80Eh)
loc_1171:
		mov	ax,word ptr es:[37A2h]	; (A80C:37A2=0)
		cmp	ax,word ptr es:[2D82h]	; (A80C:2D82=0)
		jne	loc_1176		; Jump if not equal
		mov	ax,word ptr es:[37A4h]	; (A80C:37A4=0)
		cmp	ax,word ptr es:[2D84h]	; (A80C:2D84=0)
		jne	loc_1176		; Jump if not equal
		mov	bx,377Fh
		mov	al,[di+5]
		and	ax,0Fh
		xlat es:[bx]			; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1172		; Jump if not zero
		mov	al,[di+6]
loc_1172:
		mov	bx,ax
		mov	ax,[bx+di]
		cmp	ax,word ptr es:[2D82h]	; (A80C:2D82=0)
		mov	ax,[bx+di+2]
		jz	loc_1173		; Jump if zero
		mov	ax,0FFFFh
loc_1173:
		mov	dl,[bx+di+5]
		and	dl,0Ch
		cmp	dl,0
		je	loc_1174		; Jump if equal
		cmp	dl,4
		je	loc_1175		; Jump if equal
		cmp	dl,8
		jne	loc_1176		; Jump if not equal
		mov	word ptr es:[4317h],ax	; (A80C:4317=0)
		jmp	short loc_1176		; (7725)
loc_1174:
		mov	word ptr es:[4315h],ax	; (A80C:4315=0)
		jmp	short loc_1176		; (7725)
loc_1175:
		mov	word ptr es:[4313h],ax	; (A80C:4313=0)
loc_1176:
		stc				; Set carry flag
		jmp	short loc_1182		; (7782)
loc_1177:
		mov	ax,[di]
		mov	word ptr ds:[2],ax	; (94E8:0002=0C416h)
		mov	ax,[di+2]
		mov	word ptr ds:[4],ax	; (94E8:0004=8B14h)
		mov	word ptr ds:[6],di	; (94E8:0006=0C80Eh)
		mov	ax,word ptr es:[37A2h]	; (A80C:37A2=0)
		cmp	ax,word ptr es:[2D82h]	; (A80C:2D82=0)
		jne	loc_1181		; Jump if not equal
		mov	ax,word ptr es:[37A4h]	; (A80C:37A4=0)
		cmp	ax,word ptr es:[2D84h]	; (A80C:2D84=0)
		jne	loc_1181		; Jump if not equal
		mov	ax,0FFFFh
		mov	bx,[di]
		cmp	bx,word ptr es:[2D82h]	; (A80C:2D82=0)
		jne	loc_1178		; Jump if not equal
		mov	ax,[di+2]
loc_1178:
		mov	dl,[di+5]
		and	dl,0Ch
		cmp	dl,0
		je	loc_1179		; Jump if equal
		cmp	dl,4
		je	loc_1180		; Jump if equal
		cmp	dl,8
		jne	loc_1181		; Jump if not equal
		mov	word ptr es:[4317h],ax	; (A80C:4317=0)
		jmp	short loc_1181		; (7781)
loc_1179:
		mov	word ptr es:[4315h],ax	; (A80C:4315=0)
		jmp	short loc_1181		; (7781)
loc_1180:
		mov	word ptr es:[4313h],ax	; (A80C:4313=0)
loc_1181:
		clc				; Clear carry flag
loc_1182:
		push	ds
		mov	ax,es
		mov	ds,ax
		pop	es
		mov	cx,bp
		pop	bp
		pop	si
		pop	bx
		pop	ax
		retn
sub_84		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_85		proc	near
  
locloop_1183:
		mov	al,[si]
		test	al,40h			; '@'
		jz	loc_1185		; Jump if zero
		cmp	al,40h			; '@'
		je	loc_1185		; Jump if equal
		cmp	al,5Bh			; '['
		jb	loc_1184		; Jump if below
		cmp	al,7Bh			; '{'
		jae	loc_1185		; Jump if above or =
		cmp	al,60h			; '`'
		jbe	loc_1185		; Jump if below or =
loc_1184:
		and	al,0DFh
		or	al,data_377		; (020C:2EB8=4Eh)
		mov	[si],al
loc_1185:
		inc	si
		loop	locloop_1183		; Loop if cx > 0
  
		retn
sub_85		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_86		proc	near
		push	dx
		push	cx
		mov	dx,di
		mov	al,43h			; 'C'
		mov	ah,0
loc_1186:
		mov	di,dx
		pop	cx
		push	cx
loc_1187:
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		cmp	cx,0
		jne	loc_1189		; Jump if not equal
		cmp	al,63h			; 'c'
		jne	loc_1188		; Jump if not equal
		jmp	loc_1200		; (7895)
loc_1188:
		mov	al,63h			; 'c'
		jmp	short loc_1186		; (77BC)
loc_1189:
		cmp	byte ptr es:[di-2],28h	; '('
		jne	loc_1191		; Jump if not equal
		cmp	byte ptr es:[di],29h	; ')'
		je	loc_1190		; Jump if equal
		mov	bx,es:[di]
		and	bx,0DFDFh
		cmp	bx,2943h
		jne	loc_1187		; Jump if not equal
		mov	ah,1
		dec	di
loc_1190:
		dec	di
		dec	di
		jmp	short loc_1194		; (782C)
loc_1191:
		mov	bx,es:[di]
		and	bx,0DFDFh
		cmp	bx,504Fh
		jne	loc_1192		; Jump if not equal
		mov	bx,es:[di+2]
		and	bx,0DFDFh
		cmp	bx,5259h
		je	loc_1193		; Jump if equal
		cmp	bx,2E52h
		je	loc_1193		; Jump if equal
loc_1192:
		cmp	bx,4F43h
		jne	loc_1187		; Jump if not equal
		mov	bx,es:[di+2]
		and	bx,0DFDFh
		cmp	bx,504Fh
		jne	loc_1187		; Jump if not equal
		mov	ah,1
loc_1193:
		dec	di
loc_1194:
		push	di
		mov	si,512Ah
		mov	cx,32h
  
locloop_1195:
		mov	al,es:[di]
		cmp	al,20h			; ' '
		jb	loc_1198		; Jump if below
		cmp	al,80h
		jae	loc_1198		; Jump if above or =
		mov	[si],al
		cmp	ah,1
		jne	loc_1196		; Jump if not equal
		inc	di
		cmp	al,es:[di]
		jne	loc_1198		; Jump if not equal
		jmp	short loc_1197		; (7854)
loc_1196:
		cmp	word ptr es:[di],2020h
		je	loc_1198		; Jump if equal
loc_1197:
		inc	di
		inc	si
		loop	locloop_1195		; Loop if cx > 0
  
loc_1198:
		mov	cx,di
		pop	di
		sub	cx,di
		mov	ax,di
		mov	bx,es
		pop	dx
		push	cx
		mov	dx,2
		call	sub_84			; (7498)
		pop	cx
		jc	loc_1199		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],60h	; '`'
		mov	byte ptr [di+5],6
		mov	[di+8],cx
		mov	word ptr [di+6],0
		mov	ax,0Ah
		mov	si,33AAh
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
loc_1199:
		stc				; Set carry flag
		jmp	short loc_1201		; (7897)
loc_1200:
		pop	cx
		clc				; Clear carry flag
loc_1201:
		pop	dx
		retn
sub_86		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_87		proc	near
		mov	byte ptr ds:[2A35h],0	; (94E8:2A35=0A5h)
		mov	dx,2
		mov	bx,439Ch
		call	sub_32			; (2D80)
		retn
sub_87		endp
  
		nop
		mov	di,8
		mov	si,0
		call	sub_102			; (80B0)
loc_1202:
		mov	ax,[si]
		mov	bx,[si+2]
		mov	cx,[si+4]
		cmp	word ptr es:[di],0FFFFh
		je	loc_1205		; Jump if equal
		test	byte ptr es:[di+4],40h	; '@'
		jz	loc_1206		; Jump if zero
		test	byte ptr es:[di+7],80h
		jnz	loc_1206		; Jump if not zero
		test	byte ptr es:[di+7],40h	; '@'
		jnz	loc_1204		; Jump if not zero
		cmp	ax,es:[di]
		jb	loc_1207		; Jump if below
		ja	loc_1204		; Jump if above
		cmp	bx,es:[di+2]
		ja	loc_1204		; Jump if above
		cmp	cx,es:[di+2]
		jb	loc_1207		; Jump if below
		push	ds
		call	sub_104			; (80B9)
		test	data_480,100h		; (020C:42CC=0D323h)
		pop	ds
		jnz	loc_1208		; Jump if not zero
		mov	dx,[si+0Ah]
		and	dl,3
		cmp	dl,1
		ja	loc_1208		; Jump if above
		mov	dl,es:[di+4]
		test	dl,80h
		jz	loc_1208		; Jump if zero
		test	dl,10h
		jnz	loc_1208		; Jump if not zero
		test	byte ptr es:[di+5],2
		jnz	loc_1208		; Jump if not zero
		cmp	word ptr es:[di+2],200h
		jae	loc_1208		; Jump if above or =
		push	ds
		call	sub_104			; (80B9)
		test	data_480,200h		; (020C:42CC=0D323h)
		pop	ds
		jnz	loc_1203		; Jump if not zero
		cmp	word ptr es:[di+2],100h
		jae	loc_1208		; Jump if above or =
loc_1203:
		and	byte ptr es:[di+4],0BFh
loc_1204:
		jmp	short loc_1210		; (7977)
loc_1205:
		jmp	loc_1215		; (7A24)
loc_1206:
		jmp	short loc_1208		; (794C)
loc_1207:
		add	si,15h
		cmp	word ptr [si],0FFFFh
		je	loc_1210		; Jump if equal
		jmp	loc_1202		; (78B5)
loc_1208:
		call	sub_102			; (80B0)
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		push	ds
		call	sub_104			; (80B9)
		xlat				; al=[al+[bx]] table
		pop	ds
		or	al,al			; Zero ?
		jnz	loc_1209		; Jump if not zero
		mov	al,es:[di+6]
loc_1209:
		add	di,ax
		cmp	word ptr es:[di],0FFFFh
		je	loc_1205		; Jump if equal
		cmp	word ptr [si],0FFFFh
		je	loc_1210		; Jump if equal
		jmp	loc_1202		; (78B5)
loc_1210:
		call	sub_104			; (80B9)
		or	byte ptr es:[di+7],40h	; '@'
		or	byte ptr es:[di+4],40h	; '@'
		or	byte ptr es:[di+5],40h	; '@'
		test	byte ptr es:[di+5],80h
		jnz	loc_1208		; Jump if not zero
		call	sub_91			; (7C34)
		mov	bp,27CFh
		mov	byte ptr ds:[bp],3Dh	; '='
		inc	bp
		inc	bp
		mov	ax,es:[di+2]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	bp,27EAh
		mov	cx,0Ah
		call	sub_81			; (71AC)
		mov	cl,0
		mov	data_290,65h		; (020C:27FA=0A0h) 'e'
		mov	data_291,7571h		; (020C:27FB=0AD20h)
		cmp	data_377,0		; (020C:2EB8=4Eh)
		jne	loc_1211		; Jump if not equal
		mov	data_290,45h		; (020C:27FA=0A0h) 'E'
		mov	data_291,5551h		; (020C:27FB=0AD20h)
loc_1211:
		mov	bp,2802h
		mov	ax,es:[di+2]
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		mov	bh,0
		mov	al,es:[di+4]
		and	al,3Fh			; '?'
		cmp	al,2
		je	loc_1212		; Jump if equal
		cmp	al,0
		jne	loc_1213		; Jump if not equal
		cmp	word ptr es:[di+8],2
		jne	loc_1213		; Jump if not equal
loc_1212:
		mov	bh,20h			; ' '
loc_1213:
		call	sub_88			; (7A28)
		mov	dx,27CAh
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_53			; (6418)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1214		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1214		; Jump if equal
		call	sub_115			; (83A4)
loc_1214:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		jmp	loc_1208		; (794C)
loc_1215:
		retn
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_88		proc	near
		push	cx
		push	es
		push	bp
		test	data_170,1		; (020C:152A=0)
		jz	loc_1216		; Jump if zero
		cmp	data_171,1		; (020C:152B=0)
		je	loc_1216		; Jump if equal
		cmp	data_461,1		; (020C:4202=80h)
		jne	loc_1217		; Jump if not equal
loc_1216:
		jmp	loc_1231		; (7B39)
loc_1217:
		call	sub_89			; (7B44)
		xor	cl,cl			; Zero register
		mov	al,28h			; '('
		cmp	byte ptr ds:[2A35h],0	; (020C:2A35=0A3h)
		je	loc_1218		; Jump if equal
		mov	al,5Bh			; '['
loc_1218:
		mov	ds:[bp],al
		inc	bp
		push	bx
		mov	ax,cs
		cmp	ax,es:[di]
		jne	loc_1219		; Jump if not equal
		mov	word ptr ds:[bp],7373h
		inc	bp
		inc	bp
		jmp	short loc_1224		; (7AB6)
loc_1219:
		mov	ax,es:[di]
		and	ax,0FFF0h
		cmp	ax,0FBA0h
		jne	loc_1222		; Jump if not equal
		inc	cl
		mov	word ptr ds:[bp],3F3Fh
		inc	bp
		inc	bp
		mov	ax,es:[di]
		and	al,0Fh
		cmp	al,0Fh
		je	loc_1221		; Jump if equal
		add	al,30h			; '0'
		cmp	al,39h			; '9'
		jbe	loc_1220		; Jump if below or =
		add	al,7
loc_1220:
		mov	ds:[bp],al
		inc	bp
loc_1221:
		jmp	short loc_1224		; (7AB6)
loc_1222:
		test	byte ptr es:[di+5],2
		jnz	loc_1223		; Jump if not zero
		cmp	data_169,2		; (020C:14AD=0)
		jb	loc_1223		; Jump if below
		test	byte ptr es:[di+4],40h	; '@'
		jz	loc_1223		; Jump if zero
		jmp	short loc_1225		; (7AC5)
loc_1223:
		mov	ax,es:[di]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_1224:
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
		mov	ax,es:[di+2]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_1225:
		pop	bx
		or	cl,cl			; Zero ?
		jnz	loc_1229		; Jump if not zero
		test	bh,30h			; '0'
		jz	loc_1226		; Jump if zero
		cmp	word ptr es:[di+2],0FFFFh
		je	loc_1229		; Jump if equal
loc_1226:
		mov	byte ptr ds:[bp],3Dh	; '='
		inc	bp
		test	bh,30h			; '0'
		jz	loc_1228		; Jump if zero
		test	bh,20h			; ' '
		jz	loc_1227		; Jump if zero
		test	data_385,2		; (020C:2ECA=45h)
		jz	loc_1227		; Jump if zero
		cmp	word ptr es:[di+2],0FFFCh
		ja	loc_1229		; Jump if above
		mov	bx,es:[di+2]
		mov	es,es:[di]
		mov	ax,es:[bx+2]
		mov	bx,es:[bx]
;*		call	far ptr sub_185		;*(1548:01E8)
		db	 9Ah,0E8h, 01h, 48h, 15h
		jmp	short loc_1229		; (7B29)
loc_1227:
		mov	bx,es:[di+2]
		mov	es,es:[di]
		mov	ax,es:[bx]
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		jmp	short loc_1229		; (7B29)
loc_1228:
		mov	bx,es:[di+2]
		mov	es,es:[di]
		mov	al,es:[bx]
;*		call	far ptr sub_179		;*(1548:0034)
		db	 9Ah, 34h, 00h, 48h, 15h
loc_1229:
		mov	al,29h			; ')'
		cmp	byte ptr ds:[2A35h],0	; (020C:2A35=0A3h)
		je	loc_1230		; Jump if equal
		mov	al,5Dh			; ']'
loc_1230:
		mov	ds:[bp],al
		inc	bp
loc_1231:
		pop	bp
		pop	es
		pop	cx
		mov	byte ptr ds:[2A35h],0	; (020C:2A35=0A3h)
		retn
sub_88		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_89		proc	near
		push	ax
		push	cx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		xor	ah,ah			; Zero register
		mov	di,284Eh
		mov	cx,26h
		mov	al,3Bh			; ';'
		std				; Set direction flag
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		or	cx,cx			; Zero ?
		jnz	loc_1232		; Jump if not zero
		inc	ah
loc_1232:
		mov	di,284Eh
		mov	cx,26h
		mov	al,20h			; ' '
		std				; Set direction flag
		repe	scasb			; Rep zf=1+cx >0 Scan es:[di] for al
		inc	di
		inc	di
		or	ah,ah			; Zero ?
		jz	loc_1233		; Jump if zero
		mov	byte ptr [di],3Bh	; ';'
		inc	di
loc_1233:
		inc	di
		cld				; Clear direction
		mov	bp,di
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1234		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1234		; Jump if equal
		call	sub_115			; (83A4)
loc_1234:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	cx
		pop	ax
		retn
sub_89		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_90		proc	near
		cmp	byte ptr ds:[263Dh],6	; (94E8:263D=86h)
		jae	loc_1235		; Jump if above or =
		jmp	short loc_1237		; (7BC2)
loc_1235:
		cmp	byte ptr ds:[2638h],4	; (94E8:2638=0)
		jbe	loc_1237		; Jump if below or =
		test	byte ptr ds:[2638h],1	; (94E8:2638=0)
		jnz	loc_1236		; Jump if not zero
		jmp	short loc_1237		; (7BC2)
loc_1236:
		mov	dx,7
		mov	bx,46B4h
		call	sub_32			; (2D80)
loc_1237:
		retn
sub_90		endp
  
		nop
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	di,8
loc_1238:
		mov	bp,1
		cmp	word ptr es:[di],0FFFFh
		jne	loc_1239		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		je	loc_1243		; Jump if equal
loc_1239:
		test	byte ptr es:[di+4],40h	; '@'
		jnz	loc_1241		; Jump if not zero
		mov	ah,es:[di+5]
		and	ah,0Ch
		cmp	ah,4
		jne	loc_1240		; Jump if not equal
		mov	ah,es:[di+4]
		and	ah,3Fh			; '?'
		cmp	ah,21h			; '!'
		je	loc_1241		; Jump if equal
		cmp	ah,22h			; '"'
		je	loc_1241		; Jump if equal
		cmp	ah,20h			; ' '
		jne	loc_1240		; Jump if not equal
		test	byte ptr es:[di+5],2
		jz	loc_1241		; Jump if zero
loc_1240:
		mov	si,di
		call	sub_125			; (92DC)
		jmp	short loc_1238		; (7BCE)
loc_1241:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1242		; Jump if not zero
		mov	al,es:[di+6]
loc_1242:
		add	di,ax
		jmp	short loc_1238		; (7BCE)
loc_1243:
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_91		proc	near
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	di
		mov	al,20h			; ' '
		call	sub_109			; (80CE)
		mov	di,27CAh
		mov	cx,2850h
		sub	cx,27CAh
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		pop	di
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1244		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1244		; Jump if equal
		call	sub_115			; (83A4)
loc_1244:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
sub_91		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_92		proc	near
		push	ax
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_106			; (80C5)
		mov	byte ptr ds:[2C3Eh],1	; (94E8:2C3E=0B9h)
		mov	ax,word ptr es:[0]	; (065D:0000=4817h)
		cmp	ax,0
		jne	loc_1245		; Jump if not equal
		cmp	word ptr es:[4],0	; (065D:0004=1E3Eh)
		je	loc_1246		; Jump if equal
loc_1245:
		cmp	word ptr es:[2],0FFFFh	; (065D:0002=8015h)
		je	loc_1246		; Jump if equal
		mov	ax,word ptr es:[2]	; (065D:0002=8015h)
		cmp	ax,word ptr es:[4]	; (065D:0004=1E3Eh)
		jae	loc_1246		; Jump if above or =
		mov	byte ptr ds:[2C3Eh],0	; (94E8:2C3E=0B9h)
loc_1246:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1247		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1247		; Jump if equal
		call	sub_115			; (83A4)
loc_1247:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	ax
		retn
sub_92		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_93		proc	near
		call	sub_108			; (80CB)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_94:
		mov	di,7420h
		mov	si,2791h
		mov	ax,[si]
		and	al,0F8h
		shr	al,1			; Shift w/zeros fill
		shr	al,1			; Shift w/zeros fill
		xor	ah,ah			; Zero register
		add	di,ax
		mov	di,es:[di]
		mov	ax,[si]
loc_1248:
		cmp	al,es:[di]
		je	loc_1250		; Jump if equal
		jc	loc_1249		; Jump if carry Set
		push	ax
		mov	ax,7474h
		sub	ax,7460h
		add	di,ax
		pop	ax
		cmp	word ptr es:[di],0
		jne	loc_1248		; Jump if not equal
loc_1249:
		clc				; Clear carry flag
		jmp	short loc_1251		; (7D01)
loc_1250:
		stc				; Set carry flag
loc_1251:
		retn
sub_93		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_95		proc	near
		push	ax
		push	cx
		push	si
		mov	cx,7474h
		sub	cx,7460h
		mov	si,27A1h
  
locloop_1252:
		mov	al,es:[di]
		mov	[si],al
		inc	di
		inc	si
		loop	locloop_1252		; Loop if cx > 0
  
		mov	di,27A1h
		call	sub_109			; (80CE)
		pop	si
		pop	cx
		pop	ax
		retn
sub_95		endp
  
		add	byte ptr data_585[bx],al	; (020C:90DB=9)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_96		proc	near
		push	es
		push	di
		les	di,cs:data_535		; (020C:4857=12EBh) Load 32 bit ptr
loc_1253:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_1254		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		jne	loc_1254		; Jump if not equal
		jmp	short loc_1257		; (7D62)
loc_1254:
		cmp	es:[di],bx
		jne	loc_1256		; Jump if not equal
		cmp	byte ptr cs:[4814h],1	; (020C:4814=57h)
		je	loc_1255		; Jump if equal
		cmp	ax,es:[di+4]
		ja	loc_1256		; Jump if above
		cmp	ax,es:[di+2]
		jb	loc_1256		; Jump if below
loc_1255:
		mov	ax,es:[di+0Ch]
		jmp	short loc_1258		; (7D64)
loc_1256:
		add	di,15h
		jmp	short loc_1253		; (7D2F)
loc_1257:
		xor	ax,ax			; Zero register
loc_1258:
		pop	di
		pop	es
		retn
sub_96		endp
  
		add	[bx+si],al
		in	ax,dx			; port 0, DMA-1 bas&add ch 0
		sbb	ax,0E890h
		sub	sp,0CBh
		add	[bx+si],al
		db	0FFh
		db	0FFh
		in	ax,dx			; port 0, DMA-1 bas&add ch 0
		pop	bp
		hlt				; Halt processor
		pop	si
		sbb	al,22h			; '"'
		add	[bx+si],al
		in	ax,dx			; port 0, DMA-1 bas&add ch 0
		sbb	ax,209Ch
		adc	al,17h
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		db	0FFh
		inc	data_585[bx]		; (020C:90DB=3C09h)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_97		proc	near
		call	sub_99			; (7DD0)
		mov	dx,cs:data_542		; (020C:486B=1B6h)
		mov	ax,1
		call	sub_126			; (93E8)
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1259		; Jump if not equal
		mov	dx,0FFFFh
		mov	ax,2
		call	sub_126			; (93E8)
		mov	ax,1
		call	sub_126			; (93E8)
		mov	ax,4
		call	sub_126			; (93E8)
loc_1259:
		mov	cs:data_543,1DEDh	; (020C:486D=94E8h)
		mov	cs:data_544,209Ch	; (020C:486F=0C322h)
		retn
sub_97		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_98		proc	near
		mov	cs:data_545,1714h	; (020C:4871=0DB87h)
		retn
sub_98		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_99		proc	near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		cmp	byte ptr cs:[4860h],0FFh	; (020C:4860=2Ah)
		mov	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jnz	loc_1260		; Jump if not zero
		jmp	loc_1270		; (7F95)
loc_1260:
		mov	ax,1714h
		mov	ds,ax
		mov	ax,3D00h
		mov	dx,6C70h
		int	21h			; DOS Services  ah=function 3Dh
						;  open file, al=mode,name@ds:dx
		jnc	loc_1261		; Jump if carry=0
		jmp	loc_1270		; (7F95)
loc_1261:
		mov	bx,ax
		mov	ah,44h			; 'D'
		mov	al,7
		mov	cx,0
		mov	dx,6C79h
		int	21h			; DOS Services  ah=function 44h
						;  device drivr cntrl al=subfunc
		push	ax
		mov	ah,3Eh			; '>'
		int	21h			; DOS Services  ah=function 3Eh
						;  close file, bx=file handle
		jnc	loc_1263		; Jump if carry=0
		pop	ax
loc_1262:
;*		call	far ptr sub_202		;*(1548:07E8)
		db	 9Ah,0E8h, 07h, 48h, 15h
		jmp	loc_1270		; (7F95)
loc_1263:
		pop	ax
		or	al,al			; Zero ?
		jz	loc_1262		; Jump if zero
		mov	ah,40h			; '@'
		int	67h			; EMS Memory        ah=func 40h
						;  get manager status in ah
		cmp	ah,0
		jne	loc_1262		; Jump if not equal
		mov	ah,42h			; 'B'
		int	67h			; EMS Memory        ah=func 42h
						;  get pages, bx=unused,dx=total
		or	ah,ah			; Zero ?
		jnz	loc_1262		; Jump if not zero
		cmp	bx,14h
		jb	loc_1262		; Jump if below
		mov	ah,41h			; 'A'
		int	67h			; EMS Memory        ah=func 41h
						;  get page frame segment in bx
		or	ah,ah			; Zero ?
		jnz	loc_1262		; Jump if not zero
		mov	word ptr cs:[4861h],bx	; (020C:4861=0A80Ch)
		mov	byte ptr ds:[6CC1h],1	; (1714:6CC1=0)
		mov	ah,43h			; 'C'
		mov	bx,4
		int	67h			; EMS Memory        ah=func 43h
						;  get handle dx,allocate pgs bx
		or	ah,ah			; Zero ?
		jnz	loc_1262		; Jump if not zero
		mov	cs:data_542,dx		; (020C:486B=1B6h)
		mov	word ptr ds:[6CC2h],dx	; (1714:6CC2=0FFFFh)
		mov	ah,43h			; 'C'
		mov	bx,4
		int	67h			; EMS Memory        ah=func 43h
						;  get handle dx,allocate pgs bx
		or	ah,ah			; Zero ?
		jnz	loc_1262		; Jump if not zero
		mov	word ptr cs:[4869h],dx	; (020C:4869=142Ah)
		mov	word ptr ds:[6CC4h],dx	; (1714:6CC4=0FFFFh)
		mov	ah,43h			; 'C'
		mov	bx,4
		int	67h			; EMS Memory        ah=func 43h
						;  get handle dx,allocate pgs bx
		or	ah,ah			; Zero ?
		jnz	loc_1262		; Jump if not zero
		mov	word ptr ds:[6CC6h],dx	; (1714:6CC6=0FFFFh)
		mov	ah,43h			; 'C'
		mov	bx,4
		int	67h			; EMS Memory        ah=func 43h
						;  get handle dx,allocate pgs bx
		or	ah,ah			; Zero ?
		jnz	loc_1262		; Jump if not zero
		mov	word ptr ds:[6CC8h],dx	; (1714:6CC8=0FFFFh)
		mov	ah,43h			; 'C'
		mov	bx,4
		int	67h			; EMS Memory        ah=func 43h
						;  get handle dx,allocate pgs bx
		or	ah,ah			; Zero ?
		jnz	loc_1264		; Jump if not zero
		mov	word ptr ds:[6CCAh],dx	; (1714:6CCA=0FFFFh)
		mov	byte ptr ds:[6D8Ah],3	; (1714:6D8A=0)
		mov	byte ptr ds:[6D8Bh],1	; (1714:6D8B=0)
		jmp	short loc_1265		; (7EBB)
		nop
loc_1264:
;*		call	far ptr sub_202		;*(1548:07E8)
		db	 9Ah,0E8h, 07h, 48h, 15h
		jmp	loc_1270		; (7F95)
loc_1265:
		mov	dx,491Eh
		mov	ah,9
		int	21h			; DOS Services  ah=function 09h
						;  display char string at ds:dx
		mov	cx,4
		mov	bp,0
		mov	dx,word ptr ds:[6CC2h]	; (1714:6CC2=0FFFFh)
		mov	si,6CABh
		call	sub_100			; (8004)
		jc	loc_1264		; Jump if carry Set
		mov	dx,221Ch
		mov	es,dx
		mov	dx,word ptr ds:[6CC4h]	; (1714:6CC4=0FFFFh)
		call	sub_101			; (8068)
		jc	loc_1264		; Jump if carry Set
		mov	dx,word ptr ds:[6CC6h]	; (1714:6CC6=0FFFFh)
		mov	si,6C7Bh
		call	sub_100			; (8004)
		jc	loc_1264		; Jump if carry Set
		mov	dx,word ptr ds:[6CC8h]	; (1714:6CC8=0FFFFh)
		mov	si,6C9Bh
		call	sub_100			; (8004)
		jc	loc_1264		; Jump if carry Set
		mov	dx,word ptr ds:[6CCAh]	; (1714:6CCA=0FFFFh)
		mov	si,6C8Bh
		call	sub_100			; (8004)
		jc	loc_1264		; Jump if carry Set
		mov	byte ptr cs:[4860h],1	; (020C:4860=2Ah)
		mov	ax,221Ch
		mov	es,ax
		mov	ax,5DEDh
		mov	ds,ax
		xor	di,di			; Zero register
		mov	si,di
		cld				; Clear direction
		mov	cx,1064h
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	word ptr cs:[4865h],es	; (020C:4865=0C605h)
		mov	ax,es
		mov	bx,1064h
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		add	ax,bx
		inc	ax
		mov	word ptr cs:[4867h],ax	; (020C:4867=7906h)
		mov	ax,1714h
		mov	ds,ax
		mov	ah,42h			; 'B'
		int	67h			; EMS Memory        ah=func 42h
						;  get pages, bx=unused,dx=total
		or	ah,ah			; Zero ?
		jnz	loc_1269		; Jump if not zero
		cmp	bx,0Ch
		jb	loc_1269		; Jump if below
		mov	ax,bx
		mov	bl,0Ch
		div	bl			; al, ah rem = ax/reg
		cmp	al,0
		je	loc_1269		; Jump if equal
		xor	ah,ah			; Zero register
		cmp	ax,1Fh
		jb	loc_1266		; Jump if below
		mov	ax,1Fh
loc_1266:
		mov	cx,ax
		mov	di,0Ah
  
locloop_1267:
		push	cx
		mov	cx,3
  
locloop_1268:
		mov	ah,43h			; 'C'
		mov	bx,4
		int	67h			; EMS Memory        ah=func 43h
						;  get handle dx,allocate pgs bx
		or	ah,ah			; Zero ?
		jnz	loc_1269		; Jump if not zero
		mov	word ptr ds:[6CC2h][di],dx	; (1714:6CC2=0FFFFh)
		inc	byte ptr ds:[6D8Ah]	; (1714:6D8A=0)
		mov	si,0
		call	sub_100			; (8004)
		jc	loc_1269		; Jump if carry Set
		inc	di
		inc	di
		loop	locloop_1268		; Loop if cx > 0
  
		pop	cx
		inc	byte ptr ds:[6D8Bh]	; (1714:6D8B=0)
		loop	locloop_1267		; Loop if cx > 0
  
		jmp	short loc_1271		; (7FBE)
		nop
loc_1269:
		pop	cx
		jmp	short loc_1271		; (7FBE)
		nop
loc_1270:
		mov	word ptr cs:[4865h],5DEDh	; (020C:4865=0C605h)
		mov	ax,5DEDh
		mov	bx,1064h
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		add	ax,bx
		inc	ax
		mov	word ptr cs:[4867h],ax	; (020C:4867=7906h)
		mov	word ptr cs:[4869h],221Ch	; (020C:4869=142Ah)
		mov	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
loc_1271:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1272		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1272		; Jump if equal
		call	sub_115			; (83A4)
loc_1272:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1273		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1273		; Jump if equal
		call	sub_115			; (83A4)
loc_1273:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_99		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_100		proc	near
		push	ax
		push	bx
		push	cx
		push	bp
		xor	bp,bp			; Zero register
		mov	cx,4
  
locloop_1274:
		mov	ah,44h			; 'D'
		mov	bx,bp
		mov	al,bl
		int	67h			; EMS Memory        ah=func 44h
						;  map memory, dx=handle
		or	ah,ah			; Zero ?
		jnz	loc_1277		; Jump if not zero
		inc	bp
		loop	locloop_1274		; Loop if cx > 0
  
		push	es
		push	di
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		xor	di,di			; Zero register
		mov	ax,0FFFFh
		mov	cx,8000h
		cld				; Clear direction
		rep	stosw			; Rep when cx >0 Store ax to es:[di]
		mov	cx,10h
		cmp	si,0
		je	loc_1275		; Jump if equal
		mov	di,0FFF0h
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		jmp	short loc_1276		; (8040)
		nop
loc_1275:
		rep	stosb			; Rep when cx >0 Store al to es:[di]
loc_1276:
		push	ds
		mov	ds,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		mov	bp,0FFFCh
		mov	ax,dx
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		pop	ds
		pop	di
		pop	es
		mov	ah,47h			; 'G'
		int	67h			; EMS Memory        ah=func 47h
						;  save map context, dx=handle
		or	ah,ah			; Zero ?
		jnz	loc_1277		; Jump if not zero
		clc				; Clear carry flag
		jmp	short loc_1278		; (8060)
		nop
loc_1277:
		stc				; Set carry flag
loc_1278:
		pop	bp
		pop	cx
		pop	bx
		pop	ax
		retn
sub_100		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_101		proc	near
		push	ax
		push	bx
		push	cx
		push	bp
		xor	bp,bp			; Zero register
		mov	cx,4
  
locloop_1279:
		mov	ah,44h			; 'D'
		mov	bx,bp
		mov	al,bl
		int	67h			; EMS Memory        ah=func 44h
						;  map memory, dx=handle
		or	ah,ah			; Zero ?
		jnz	loc_1280		; Jump if not zero
		inc	bp
		loop	locloop_1279		; Loop if cx > 0
  
		push	es
		push	ds
		push	di
		push	si
		push	es
		pop	ds
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		xor	di,di			; Zero register
		mov	si,di
		mov	cx,8000h
		cld				; Clear direction
		rep	movsw			; Rep when cx >0 Mov [si] to es:[di]
		pop	si
		pop	di
		pop	ds
		pop	es
		mov	ah,47h			; 'G'
		int	67h			; EMS Memory        ah=func 47h
						;  save map context, dx=handle
		or	ah,ah			; Zero ?
		jnz	loc_1280		; Jump if not zero
		clc				; Clear carry flag
		jmp	short loc_1281		; (80A9)
		nop
loc_1280:
		stc				; Set carry flag
		jmp	short loc_1281		; (80A9)
		nop
loc_1281:
		pop	bp
		pop	cx
		pop	bx
		pop	ax
		retn
sub_101		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_102		proc	near
		jmp	short loc_1282		; (80EF)
		nop
		jmp	short loc_1283		; (80F5)
		nop
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_103:
		jmp	short loc_1284		; (80FB)
		nop
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_104:
		jmp	short loc_1286		; (8119)
		nop
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_105:
		jmp	short loc_1287		; (811F)
		nop
		jmp	short loc_1288		; (8125)
		nop
		jmp	short loc_1289		; (812B)
		nop
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_106:
		jmp	loc_1291		; (814B)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_107:
		jmp	loc_1292		; (8151)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_108:
		jmp	loc_1293		; (8157)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_109:
		jmp	loc_1295		; (8175)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_110:
		jmp	loc_1296		; (817B)
		jmp	loc_1297		; (8181)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_111:
		jmp	loc_1298		; (8187)
		jmp	loc_1300		; (81A7)
		jmp	loc_1301		; (81AC)
		jmp	loc_1302		; (81B1)
		jmp	loc_1304		; (81CD)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_112:
		jmp	loc_1305		; (81D2)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_113:
		jmp	loc_1306		; (81D7)
		jmp	loc_1307		; (81DC)
loc_1282:
		mov	ds,cs:data_543		; (020C:486D=94E8h)
		retn
loc_1283:
		mov	ds,cs:data_544		; (020C:486F=0C322h)
		retn
loc_1284:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1285		; Jump if not equal
		mov	ds,word ptr cs:[4869h]	; (020C:4869=142Ah)
		retn
loc_1285:
		push	dx
		mov	dx,word ptr cs:[4869h]	; (020C:4869=142Ah)
		call	sub_115			; (83A4)
		mov	ds,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		retn
loc_1286:
		mov	ds,cs:data_545		; (020C:4871=0DB87h)
		retn
loc_1287:
		mov	ds,word ptr cs:[4865h]	; (020C:4865=0C605h)
		retn
loc_1288:
		mov	ds,word ptr cs:[4867h]	; (020C:4867=7906h)
		retn
loc_1289:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1290		; Jump if not equal
		push	ax
		mov	ax,4DEDh
		mov	ds,ax
		pop	ax
		retn
loc_1290:
		push	dx
		mov	dx,cs:data_542		; (020C:486B=1B6h)
		call	sub_115			; (83A4)
		mov	ds,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		retn
loc_1291:
		mov	es,cs:data_543		; (020C:486D=94E8h)
		retn
loc_1292:
		mov	es,cs:data_544		; (020C:486F=0C322h)
		retn
loc_1293:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1294		; Jump if not equal
		mov	es,word ptr cs:[4869h]	; (020C:4869=142Ah)
		retn
loc_1294:
		push	dx
		mov	dx,word ptr cs:[4869h]	; (020C:4869=142Ah)
		call	sub_115			; (83A4)
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		retn
loc_1295:
		mov	es,cs:data_545		; (020C:4871=0DB87h)
		retn
loc_1296:
		mov	es,word ptr cs:[4865h]	; (020C:4865=0C605h)
		retn
loc_1297:
		mov	es,word ptr cs:[4867h]	; (020C:4867=7906h)
		retn
loc_1298:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1299		; Jump if not equal
		push	ax
		mov	ax,4DEDh
		mov	es,ax
		pop	ax
		retn
loc_1299:
		push	dx
		mov	dx,cs:data_542		; (020C:486B=1B6h)
		call	sub_115			; (83A4)
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		retn
loc_1300:
		mov	ax,cs:data_543		; (020C:486D=94E8h)
		retn
loc_1301:
		mov	ax,cs:data_544		; (020C:486F=0C322h)
		retn
loc_1302:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1303		; Jump if not equal
		mov	ax,word ptr cs:[4869h]	; (020C:4869=142Ah)
		retn
loc_1303:
		push	dx
		mov	dx,word ptr cs:[4869h]	; (020C:4869=142Ah)
		call	sub_115			; (83A4)
		mov	ax,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		retn
loc_1304:
		mov	ax,cs:data_545		; (020C:4871=0DB87h)
		retn
loc_1305:
		mov	ax,word ptr cs:[4865h]	; (020C:4865=0C605h)
		retn
loc_1306:
		mov	ax,word ptr cs:[4867h]	; (020C:4867=7906h)
		retn
loc_1307:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1308		; Jump if not equal
		mov	ax,4DEDh
		retn
loc_1308:
		push	dx
		mov	dx,cs:data_542		; (020C:486B=1B6h)
		call	sub_115			; (83A4)
		mov	ax,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		retn
sub_102		endp
  
		add	word ptr ds:[3E80h],bp	; (020C:3E80=0F61Ah)
		out	4Ch,ax			; port 4Ch
		add	[si+3],dh
		jmp	loc_1324		; (83A2)
		inc	byte ptr cs:[4CE7h]	; (020C:4CE7=1Fh)
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1309		; Jump if not equal
		jmp	loc_1324		; (83A2)
loc_1309:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		call	sub_106			; (80C5)
		call	sub_104			; (80B9)
		xor	si,si			; Zero register
		xor	cx,cx			; Zero register
		mov	ax,es:[si+4]
		cmp	ax,es:[si+2]
		jne	loc_1310		; Jump if not equal
		mov	byte ptr cs:[4CE7h],0	; (020C:4CE7=1Fh)
		jmp	loc_1321		; (835D)
loc_1310:
		mov	ax,es:[si]
		cmp	ax,0FFFFh
		je	loc_1311		; Jump if equal
		mov	dx,es:[si+4]
		sub	dx,es:[si+2]
		add	word ptr ds:[6CBBh],dx	; (020C:6CBB=48h)
		adc	data_564,0		; (020C:6CBD=475h)
		add	si,15h
		cmp	ax,es:[si]
		je	loc_1310		; Jump if equal
		inc	cx
		jmp	short loc_1310		; (8243)
loc_1311:
		mov	data_565,cx		; (020C:6CBF=603h)
		cmp	cl,byte ptr ds:[6D8Bh]	; (020C:6D8B=0BCh)
		ja	loc_1314		; Jump if above
		xor	si,si			; Zero register
		mov	bx,4
loc_1312:
		mov	ax,es:[si]
		cmp	ax,0FFFFh
		je	loc_1313		; Jump if equal
		push	ax
		mov	dx,data_566[bx]		; (020C:6CC2=0B32Ah)
		mov	es:[si+11h],dx
		mov	ax,2
		call	sub_126			; (93E8)
		mov	dx,data_567[bx]		; (020C:6CC4=9A01h)
		mov	es:[si+13h],dx
		mov	ax,1
		call	sub_126			; (93E8)
		mov	dx,data_568[bx]		; (020C:6CC6=0D4h)
		mov	es:[si+0Fh],dx
		mov	ax,4
		call	sub_126			; (93E8)
		pop	ax
		add	si,15h
		cmp	ax,es:[si]
		je	loc_1312		; Jump if equal
		add	bx,6
		jmp	short loc_1312		; (8276)
loc_1313:
		jmp	loc_1321		; (835D)
loc_1314:
		xor	bh,bh			; Zero register
		mov	bl,byte ptr ds:[6D8Bh]	; (020C:6D8B=0BCh)
		mov	ax,0FFFFh
		mul	bx			; dx:ax = reg * ax
		cmp	dx,data_564		; (020C:6CBD=475h)
		ja	loc_1316		; Jump if above
		jc	loc_1315		; Jump if carry Set
		cmp	ax,word ptr ds:[6CBBh]	; (020C:6CBB=48h)
		ja	loc_1316		; Jump if above
loc_1315:
		mov	ax,0FFFFh
		jmp	short loc_1317		; (82E8)
		nop
loc_1316:
		xor	bh,bh			; Zero register
		mov	bl,byte ptr ds:[6D8Bh]	; (020C:6D8B=0BCh)
		mov	dx,data_564		; (020C:6CBD=475h)
		mov	ax,word ptr ds:[6CBBh]	; (020C:6CBB=48h)
		div	bx			; ax,dx rem=dx:ax/reg
loc_1317:
		mov	bp,ax
		xor	cx,cx			; Zero register
		xor	dx,dx			; Zero register
		inc	dh
		xor	si,si			; Zero register
		mov	di,4
loc_1318:
		mov	bx,es:[si]
		cmp	bx,0FFFFh
		je	loc_1321		; Jump if equal
		mov	ax,es:[si+4]
		sub	ax,es:[si+2]
		add	cx,ax
		pushf				; Push flags
		mov	ax,data_566[di]		; (020C:6CC2=0B32Ah)
		mov	es:[si+11h],ax
		push	ax
		push	dx
		mov	dx,ax
		mov	ax,2
		call	sub_126			; (93E8)
		pop	dx
		pop	ax
		mov	ax,data_567[di]		; (020C:6CC4=9A01h)
		mov	es:[si+13h],ax
		push	ax
		push	dx
		mov	dx,ax
		mov	ax,1
		call	sub_126			; (93E8)
		pop	dx
		pop	ax
		mov	ax,data_568[di]		; (020C:6CC6=0D4h)
		mov	es:[si+0Fh],ax
		push	ax
		push	dx
		mov	dx,ax
		mov	ax,4
		call	sub_126			; (93E8)
		pop	dx
		pop	ax
		add	si,15h
		popf				; Pop flags
		jc	loc_1319		; Jump if carry Set
		cmp	cx,bp
		jb	loc_1320		; Jump if below
loc_1319:
		xor	cx,cx			; Zero register
		cmp	dh,byte ptr ds:[6D8Bh]	; (020C:6D8B=0BCh)
		jae	loc_1320		; Jump if above or =
		add	di,6
		inc	dh
loc_1320:
		jmp	short loc_1318		; (82F5)
loc_1321:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1322		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1322		; Jump if equal
		call	sub_115			; (83A4)
loc_1322:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1323		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1323		; Jump if equal
		call	sub_115			; (83A4)
loc_1323:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
loc_1324:
		retn
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_115		proc	near
		cmp	word ptr cs:[4863h],dx	; (020C:4863=7480h)
		je	loc_1325		; Jump if equal
		mov	word ptr cs:[4863h],dx	; (020C:4863=7480h)
		push	ax
		mov	ah,48h			; 'H'
		int	67h			; EMS Memory        ah=func 48h
						;  restore map context,dx=handle
		cmp	ah,0
		jne	loc_1326		; Jump if not equal
		mov	ah,47h			; 'G'
		int	67h			; EMS Memory        ah=func 47h
						;  save map context, dx=handle
		cmp	ah,0
		jne	loc_1326		; Jump if not equal
		pop	ax
loc_1325:
		retn
loc_1326:
		call	sub_104			; (80B9)
		mov	bp,24A6h
		xor	al,al			; Zero register
		xchg	al,ah
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
;*		jmp	loc_207			;*(225C)
sub_115		endp
  
		db	0E9h, 85h, 9Eh
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_116		proc	near
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1327		; Jump if not equal
		push	ax
		mov	ax,3DEDh
		mov	es,ax
		pop	ax
		jmp	short loc_1336		; (8449)
		nop
loc_1327:
		call	sub_109			; (80CE)
		cmp	bx,word ptr es:[2D82h]	; (3DED:2D82=2C3Ch)
		jne	loc_1329		; Jump if not equal
		cmp	cs:data_546,0FFFFh	; (020C:4873=5590h)
		je	loc_1329		; Jump if equal
		push	dx
		mov	dx,cs:data_546		; (020C:4873=5590h)
sub_116		endp
  
  
;ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ
;
;			External Entry Point
;
;ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ
  
int_06h_entry	proc	far
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1328		; Jump if equal
		call	sub_115			; (83A4)
loc_1328:
		pop	dx
		jmp	short loc_1335		; (8444)
		nop
loc_1329:
		call	sub_106			; (80C5)
		push	si
		xor	si,si			; Zero register
loc_1330:
		cmp	word ptr es:[si],0FFFFh
		jne	loc_1331		; Jump if not equal
		cmp	word ptr es:[si+2],0FFFFh
		je	loc_1332		; Jump if equal
loc_1331:
		cmp	es:[si],bx
		ja	loc_1332		; Jump if above
		jz	loc_1334		; Jump if zero
		add	si,15h
		jmp	short loc_1330		; (8416)
loc_1332:
		cmp	si,15h
		jae	loc_1333		; Jump if above or =
		mov	si,15h
loc_1333:
		sub	si,15h
loc_1334:
		push	dx
		mov	dx,es:[si+11h]
		call	sub_115			; (83A4)
		pop	dx
		pop	si
loc_1335:
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
loc_1336:
		retn
int_06h_entry	endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_117		proc	near
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1337		; Jump if not equal
		push	ax
		mov	ax,4DEDh
		mov	es,ax
		pop	ax
		jmp	short loc_1346		; (84BD)
		nop
loc_1337:
		call	sub_109			; (80CE)
		cmp	bx,word ptr es:[2D82h]	; (4DED:2D82=41h)
		jne	loc_1339		; Jump if not equal
		cmp	cs:data_547,0FFFFh	; (020C:4875=0EB8Bh)
		je	loc_1339		; Jump if equal
		push	dx
		mov	dx,cs:data_547		; (020C:4875=0EB8Bh)
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1338		; Jump if equal
		call	sub_115			; (83A4)
loc_1338:
		pop	dx
		jmp	short loc_1345		; (84B8)
		nop
loc_1339:
		call	sub_106			; (80C5)
		push	si
		xor	si,si			; Zero register
loc_1340:
		cmp	word ptr es:[si],0FFFFh
		jne	loc_1341		; Jump if not equal
		cmp	word ptr es:[si+2],0FFFFh
		je	loc_1342		; Jump if equal
loc_1341:
		cmp	es:[si],bx
		ja	loc_1342		; Jump if above
		jz	loc_1344		; Jump if zero
		add	si,15h
		jmp	short loc_1340		; (848A)
loc_1342:
		cmp	si,15h
		jae	loc_1343		; Jump if above or =
		mov	si,15h
loc_1343:
		sub	si,15h
loc_1344:
		push	dx
		mov	dx,es:[si+13h]
		call	sub_115			; (83A4)
		pop	dx
		pop	si
loc_1345:
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
loc_1346:
data_574	db	0C3h
		xchg	bx,bx
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_118:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1347		; Jump if not equal
		push	ax
		mov	ax,2DEDh
		mov	es,ax
		pop	ax
		jmp	short loc_1356		; (8531)
		nop
loc_1347:
		call	sub_109			; (80CE)
		cmp	bx,word ptr es:[2D82h]	; (2DED:2D82=0FFFFh)
		jne	loc_1349		; Jump if not equal
		cmp	cs:data_548,0FFFFh	; (020C:4877=0DB33h)
		je	loc_1349		; Jump if equal
		push	dx
		mov	dx,cs:data_548		; (020C:4877=0DB33h)
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1348		; Jump if equal
		call	sub_115			; (83A4)
loc_1348:
		pop	dx
		jmp	short loc_1355		; (852C)
		nop
loc_1349:
		call	sub_106			; (80C5)
		push	si
		xor	si,si			; Zero register
loc_1350:
		cmp	word ptr es:[si],0FFFFh
		jne	loc_1351		; Jump if not equal
		cmp	word ptr es:[si+2],0FFFFh
		je	loc_1352		; Jump if equal
loc_1351:
		cmp	es:[si],bx
		ja	loc_1352		; Jump if above
		jz	loc_1354		; Jump if zero
		add	si,15h
		jmp	short loc_1350		; (84FE)
loc_1352:
		cmp	si,15h
		jae	loc_1353		; Jump if above or =
		mov	si,15h
loc_1353:
		sub	si,15h
loc_1354:
		push	dx
		mov	dx,es:[si+0Fh]
		call	sub_115			; (83A4)
		pop	dx
		pop	si
loc_1355:
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
loc_1356:
		retn
sub_117		endp
  
		xchg	bx,bx
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1357		; Jump if not equal
		push	ax
		mov	ax,3DEDh
		mov	ds,ax
		pop	ax
		jmp	short loc_1366		; (85A0)
		nop
loc_1357:
		call	sub_104			; (80B9)
		cmp	bx,word ptr ds:[2D82h]	; (3DED:2D82=2C3Ch)
		jne	loc_1359		; Jump if not equal
		cmp	cs:data_546,0FFFFh	; (020C:4873=5590h)
		je	loc_1359		; Jump if equal
		push	dx
		mov	dx,cs:data_546		; (020C:4873=5590h)
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1358		; Jump if equal
		call	sub_115			; (83A4)
loc_1358:
		pop	dx
		jmp	short loc_1365		; (859B)
		nop
loc_1359:
		call	sub_102			; (80B0)
		push	si
		xor	si,si			; Zero register
loc_1360:
		cmp	word ptr [si],0FFFFh
		jne	loc_1361		; Jump if not equal
		cmp	word ptr [si+2],0FFFFh
		je	loc_1362		; Jump if equal
loc_1361:
		cmp	[si],bx
		ja	loc_1362		; Jump if above
		jz	loc_1364		; Jump if zero
		add	si,15h
		jmp	short loc_1360		; (8571)
loc_1362:
		cmp	si,15h
		jae	loc_1363		; Jump if above or =
		mov	si,15h
loc_1363:
		sub	si,15h
loc_1364:
		push	dx
		mov	dx,[si+11h]
		call	sub_115			; (83A4)
		pop	dx
		pop	si
loc_1365:
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
loc_1366:
		retn
		xchg	bx,bx
		nop
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1367		; Jump if not equal
		push	ax
		mov	ax,4DEDh
		mov	ds,ax
		pop	ax
		jmp	short loc_1376		; (8610)
		nop
loc_1367:
		call	sub_104			; (80B9)
		cmp	bx,word ptr ds:[2D82h]	; (4DED:2D82=41h)
		jne	loc_1369		; Jump if not equal
		cmp	cs:data_547,0FFFFh	; (020C:4875=0EB8Bh)
		je	loc_1369		; Jump if equal
		push	dx
		mov	dx,cs:data_547		; (020C:4875=0EB8Bh)
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1368		; Jump if equal
		call	sub_115			; (83A4)
loc_1368:
		pop	dx
		jmp	short loc_1375		; (860B)
		nop
loc_1369:
		call	sub_102			; (80B0)
		push	si
		xor	si,si			; Zero register
loc_1370:
		cmp	word ptr [si],0FFFFh
		jne	loc_1371		; Jump if not equal
		cmp	word ptr [si+2],0FFFFh
		je	loc_1372		; Jump if equal
loc_1371:
		cmp	[si],bx
		ja	loc_1372		; Jump if above
		jz	loc_1374		; Jump if zero
		add	si,15h
		jmp	short loc_1370		; (85E1)
loc_1372:
		cmp	si,15h
		jae	loc_1373		; Jump if above or =
		mov	si,15h
loc_1373:
		sub	si,15h
loc_1374:
		push	dx
		mov	dx,[si+13h]
		call	sub_115			; (83A4)
		pop	dx
		pop	si
loc_1375:
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
loc_1376:
		retn
		xchg	bx,bx
		nop
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1377		; Jump if not equal
		push	ax
		mov	ax,2DEDh
		mov	ds,ax
		pop	ax
		jmp	short loc_1386		; (8680)
		nop
loc_1377:
		call	sub_104			; (80B9)
		cmp	bx,word ptr ds:[2D82h]	; (2DED:2D82=0FFFFh)
		jne	loc_1379		; Jump if not equal
		cmp	cs:data_548,0FFFFh	; (020C:4877=0DB33h)
		je	loc_1379		; Jump if equal
		push	dx
		mov	dx,cs:data_548		; (020C:4877=0DB33h)
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1378		; Jump if equal
		call	sub_115			; (83A4)
loc_1378:
		pop	dx
		jmp	short loc_1385		; (867B)
		nop
loc_1379:
		call	sub_102			; (80B0)
		push	si
		xor	si,si			; Zero register
loc_1380:
		cmp	word ptr [si],0FFFFh
		jne	loc_1381		; Jump if not equal
		cmp	word ptr [si+2],0FFFFh
		je	loc_1382		; Jump if equal
loc_1381:
		cmp	[si],bx
		ja	loc_1382		; Jump if above
		jz	loc_1384		; Jump if zero
		add	si,15h
		jmp	short loc_1380		; (8651)
loc_1382:
		cmp	si,15h
		jae	loc_1383		; Jump if above or =
		mov	si,15h
loc_1383:
		sub	si,15h
loc_1384:
		push	dx
		mov	dx,[si+0Fh]
		call	sub_115			; (83A4)
		pop	dx
		pop	si
loc_1385:
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
loc_1386:
		retn
		db	15 dup (0)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_119		proc	near
		push	cx
		push	dx
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		cmp	byte ptr ds:[4202h],1	; (94E8:4202=59h)
		je	loc_1388		; Jump if equal
		test	word ptr ds:[42CCh],20h	; (94E8:42CC=71Fh)
		jnz	loc_1387		; Jump if not zero
		cmp	byte ptr ds:[4202h],2	; (94E8:4202=59h)
		jne	loc_1388		; Jump if not equal
loc_1387:
		jmp	loc_1466		; (8C04)
loc_1388:
		mov	ax,word ptr ds:[37A4h]	; (94E8:37A4=8A12h)
		mov	word ptr ds:[41FEh],ax	; (94E8:41FE=501Eh)
		mov	al,byte ptr ds:[152Ah]	; (94E8:152A=0EBh)
		mov	byte ptr ds:[41FDh],al	; (94E8:41FD=6)
		mov	byte ptr ds:[152Ah],0	; (94E8:152A=0EBh)
		cmp	byte ptr ds:[2A75h],4Fh	; (94E8:2A75=75h) 'O'
		je	loc_1391		; Jump if equal
		push	bx
		push	dx
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	byte ptr ds:[3C7Ch],0	; (94E8:3C7C=0D1h)
		mov	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		mov	bx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	dx,20h
		call	sub_84			; (7498)
		cmp	cx,1Dh
		jae	loc_1389		; Jump if above or =
		inc	cx
		and	cl,1Fh
		mov	byte ptr ds:[3C7Ch],cl	; (A80C:3C7C=0)
		push	si
		mov	[di],bx
		mov	[di+2],ax
		mov	cx,28h
		add	di,4
		mov	si,2ED4h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	si
loc_1389:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1390		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1390		; Jump if equal
		call	sub_115			; (83A4)
loc_1390:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	dx
		pop	bx
loc_1391:
		mov	byte ptr ds:[3C78h],0	; (A80C:3C78=0)
		mov	byte ptr ds:[3C79h],10h	; (A80C:3C79=0)
		cmp	byte ptr ds:[2A75h],4Fh	; (A80C:2A75=0) 'O'
		je	loc_1392		; Jump if equal
		mov	byte ptr ds:[3C79h],12h	; (A80C:3C79=0)
loc_1392:
		test	bh,10h
		jz	loc_1393		; Jump if zero
		or	byte ptr ds:[3C79h],1	; (A80C:3C79=0)
loc_1393:
		xor	di,di			; Zero register
		mov	al,es:[si+1]
		and	al,0C7h
		cmp	al,6
		jne	loc_1394		; Jump if not equal
		jmp	loc_1407		; (87F0)
loc_1394:
		and	al,7
		test	al,4
		jnz	loc_1398		; Jump if not zero
		test	al,2
		jnz	loc_1396		; Jump if not zero
		test	word ptr ds:[42CCh],10h	; (A80C:42CC=0)
		jnz	loc_1395		; Jump if not zero
		cmp	word ptr ds:[2ED8h],180h	; (A80C:2ED8=0)
		jb	loc_1399		; Jump if below
loc_1395:
		mov	di,word ptr ds:[2ED8h]	; (A80C:2ED8=0)
		jmp	short loc_1399		; (8792)
loc_1396:
		test	word ptr ds:[42CCh],10h	; (A80C:42CC=0)
		jnz	loc_1397		; Jump if not zero
		cmp	word ptr ds:[2EECh],180h	; (A80C:2EEC=0)
		jb	loc_1399		; Jump if below
loc_1397:
		mov	di,word ptr ds:[2EECh]	; (A80C:2EEC=0)
		jmp	short loc_1399		; (8792)
loc_1398:
		cmp	al,6
		jae	loc_1403		; Jump if above or =
loc_1399:
		test	al,1
		jz	loc_1401		; Jump if zero
		test	word ptr ds:[42CCh],10h	; (A80C:42CC=0)
		jnz	loc_1400		; Jump if not zero
		cmp	word ptr ds:[2EE8h],180h	; (A80C:2EE8=0)
		jb	loc_1407		; Jump if below
loc_1400:
		add	di,word ptr ds:[2EE8h]	; (A80C:2EE8=0)
		jmp	short loc_1407		; (87F0)
loc_1401:
		test	word ptr ds:[42CCh],10h	; (A80C:42CC=0)
		jnz	loc_1402		; Jump if not zero
		cmp	word ptr ds:[2EE4h],180h	; (A80C:2EE4=0)
		jb	loc_1407		; Jump if below
loc_1402:
		add	di,word ptr ds:[2EE4h]	; (A80C:2EE4=0)
		jmp	short loc_1407		; (87F0)
loc_1403:
		test	al,1
		jz	loc_1405		; Jump if zero
		test	word ptr ds:[42CCh],10h	; (A80C:42CC=0)
		jnz	loc_1404		; Jump if not zero
		cmp	word ptr ds:[2ED8h],180h	; (A80C:2ED8=0)
		jb	loc_1407		; Jump if below
loc_1404:
		add	di,word ptr ds:[2ED8h]	; (A80C:2ED8=0)
		jmp	short loc_1407		; (87F0)
loc_1405:
		test	word ptr ds:[42CCh],10h	; (A80C:42CC=0)
		jnz	loc_1406		; Jump if not zero
		cmp	word ptr ds:[2EECh],180h	; (A80C:2EEC=0)
		jb	loc_1407		; Jump if below
loc_1406:
		add	di,word ptr ds:[2EECh]	; (A80C:2EEC=0)
loc_1407:
		cmp	dl,3Dh			; '='
		je	loc_1408		; Jump if equal
		jmp	short loc_1415		; (8843)
loc_1408:
		test	bh,10h
		jz	loc_1409		; Jump if zero
		jmp	short loc_1417		; (8857)
loc_1409:
		cmp	di,40h
		jae	loc_1410		; Jump if above or =
		jmp	short loc_1418		; (885C)
loc_1410:
		cmp	di,0FFFCh
		jbe	loc_1411		; Jump if below or =
		jmp	short loc_1418		; (885C)
loc_1411:
		push	es
		push	bx
		push	cx
		mov	es,word ptr ds:[3796h]	; (A80C:3796=0)
		mov	cx,19h
		mov	ax,es:[di]
  
locloop_1412:
		mov	bx,ax
		sub	bx,es:[di-2]
		jnc	loc_1413		; Jump if carry=0
		not	bx
loc_1413:
		cmp	bx,200h
		jae	loc_1414		; Jump if above or =
		mov	bx,di
		dec	bx
		cmp	bx,word ptr ds:[2D84h]	; (A80C:2D84=0)
		je	loc_1414		; Jump if equal
		dec	bx
		cmp	bx,word ptr ds:[2D84h]	; (A80C:2D84=0)
		je	loc_1414		; Jump if equal
		sub	di,2
		loop	locloop_1412		; Loop if cx > 0
  
loc_1414:
		pop	es
		pop	bx
		pop	es
		jmp	short loc_1417		; (8857)
loc_1415:
		cmp	di,0FE00h
		jb	loc_1416		; Jump if below
		cmp	word ptr ds:[41FEh],80h	; (A80C:41FE=0)
		jb	loc_1416		; Jump if below
		xor	di,di			; Zero register
loc_1416:
		add	di,word ptr ds:[41FEh]	; (A80C:41FE=0)
loc_1417:
		cmp	di,0FFFCh
		jbe	loc_1419		; Jump if below or =
loc_1418:
		jmp	loc_1458		; (8B81)
loc_1419:
		mov	ax,word ptr ds:[3796h]	; (A80C:3796=0)
		cmp	ax,50h
		ja	loc_1420		; Jump if above
		jmp	loc_1458		; (8B81)
loc_1420:
		mov	word ptr ds:[3C71h],ax	; (A80C:3C71=0)
		mov	al,byte ptr ds:[2F04h]	; (A80C:2F04=0)
		mov	byte ptr ds:[3C73h],al	; (A80C:3C73=0)
		mov	byte ptr ds:[2F04h],90h	; (A80C:2F04=0)
		mov	ax,word ptr ds:[2EF4h]	; (A80C:2EF4=0)
		mov	word ptr ds:[3C74h],ax	; (A80C:3C74=0)
		mov	ax,word ptr ds:[2EF2h]	; (A80C:2EF2=0)
		mov	word ptr ds:[3C76h],ax	; (A80C:3C76=0)
		cmp	byte ptr ds:[4202h],1	; (A80C:4202=0)
		je	loc_1422		; Jump if equal
		test	bh,10h
		jnz	loc_1422		; Jump if not zero
		mov	ax,word ptr ds:[2D82h]	; (A80C:2D82=0)
		cmp	ax,word ptr ds:[3C71h]	; (A80C:3C71=0)
		jne	loc_1422		; Jump if not equal
		mov	ax,di
		sub	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		jnc	loc_1421		; Jump if carry=0
		not	ax
loc_1421:
		cmp	ax,1500h
		jb	loc_1422		; Jump if below
		jmp	loc_1458		; (8B81)
loc_1422:
		push	bx
		mov	bx,word ptr ds:[3C71h]	; (A80C:3C71=0)
		call	sub_117			; (844C)
		mov	ax,bx
		pop	bx
		call	sub_120			; (8C30)
		mov	dx,ax
		push	bx
		mov	bx,word ptr ds:[3C71h]	; (A80C:3C71=0)
		call	sub_116			; (83D8)
		mov	ax,bx
		pop	bx
		call	sub_120			; (8C30)
		cmp	ax,dx
		jae	loc_1423		; Jump if above or =
		mov	dx,ax
loc_1423:
		push	bx
		mov	bx,word ptr ds:[3C71h]	; (020C:3C71=0B421h)
		call	sub_118			; (84C0)
		mov	ax,bx
		pop	bx
		call	sub_120			; (8C30)
		cmp	ax,dx
		jae	loc_1424		; Jump if above or =
		mov	dx,ax
loc_1424:
		sub	dx,di
		shr	dx,1			; Shift w/zeros fill
		cmp	dx,0
		jne	loc_1426		; Jump if not equal
loc_1425:
		jmp	loc_1458		; (8B81)
loc_1426:
		test	bh,10h
		jz	loc_1427		; Jump if zero
		shr	dx,1			; Shift w/zeros fill
		cmp	dx,0
		je	loc_1425		; Jump if equal
loc_1427:
		cmp	byte ptr ds:[4203h],0	; (94E8:4203=0CDh)
		jne	loc_1428		; Jump if not equal
		cmp	dx,32h
		jbe	loc_1428		; Jump if below or =
		mov	dx,32h
loc_1428:
		mov	byte ptr ds:[3C7Ah],dl	; (94E8:3C7A=0F5h)
loc_1429:
		cmp	byte ptr ds:[4203h],0	; (94E8:4203=0CDh)
		je	loc_1430		; Jump if equal
		jmp	loc_1439		; (89C6)
loc_1430:
		test	bh,10h
		jz	loc_1431		; Jump if zero
		jmp	loc_1438		; (89B6)
loc_1431:
		mov	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		cmp	ax,word ptr ds:[3C71h]	; (94E8:3C71=0B400h)
		je	loc_1433		; Jump if equal
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	es,ax
		cmp	word ptr es:[di+2],0
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1432		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1432		; Jump if equal
		call	sub_115			; (83A4)
loc_1432:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		jz	loc_1437		; Jump if zero
		jmp	short loc_1439		; (89C6)
loc_1433:
		cmp	di,word ptr ds:[2A42h]	; (94E8:2A42=8BC3h)
		jb	loc_1437		; Jump if below
		cmp	di,word ptr ds:[2A44h]	; (94E8:2A44=0D1CFh)
		jb	loc_1434		; Jump if below
		cmp	dl,39h			; '9'
		je	loc_1437		; Jump if equal
		mov	di,word ptr ds:[41FEh]	; (94E8:41FE=501Eh)
		cmp	di,word ptr ds:[2A42h]	; (94E8:2A42=8BC3h)
		jb	loc_1437		; Jump if below
		cmp	di,word ptr ds:[2A44h]	; (94E8:2A44=0D1CFh)
		ja	loc_1437		; Jump if above
loc_1434:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	es,ax
		mov	ax,es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1435		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1435		; Jump if equal
		call	sub_115			; (83A4)
loc_1435:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		or	ax,ax			; Zero ?
		jz	loc_1437		; Jump if zero
		sub	ax,di
		jnc	loc_1436		; Jump if carry=0
		not	ax
loc_1436:
		cmp	ax,4000h
		jb	loc_1439		; Jump if below
loc_1437:
		jmp	loc_1457		; (8B75)
loc_1438:
		mov	ax,word ptr ds:[3C71h]	; (94E8:3C71=0B400h)
		cmp	ax,0FFFFh
		je	loc_1437		; Jump if equal
		and	ax,0FFF0h
		cmp	ax,0FBA0h
		je	loc_1437		; Jump if equal
loc_1439:
		mov	ax,di
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		add	ax,word ptr ds:[3C71h]	; (94E8:3C71=0B400h)
		jc	loc_1437		; Jump if carry Set
		mov	ax,di
		xor	bl,bl			; Zero register
		cmp	byte ptr ds:[4202h],1	; (94E8:4202=59h)
		je	loc_1440		; Jump if equal
		mov	bl,es:[si+1]
loc_1440:
		mov	bp,3BEBh
		push	word ptr ds:[42CCh]	; (94E8:42CC=71Fh)
		or	word ptr ds:[42CCh],80h	; (94E8:42CC=71Fh)
		call	sub_127			; (9520)
		pop	word ptr ds:[42CCh]	; (94E8:42CC=71Fh)
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	bx
		mov	bx,word ptr ds:[3796h]	; (94E8:3796=8A50h)
		call	sub_116			; (83D8)
		pop	bx
		mov	di,data_334		; (020C:2A8F=0E3E2h)
		and	byte ptr es:[di],0C0h
		mov	al,byte ptr ds:[3C79h]	; (020C:3C79=4)
		or	es:[di],al
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1441		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1441		; Jump if equal
		call	sub_115			; (83A4)
loc_1441:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	bx
		mov	ax,word ptr ds:[3C71h]	; (020C:3C71=0B421h)
		mov	es,ax
		mov	ax,data_354		; (020C:2D82=4152h)
		xor	cl,cl			; Zero register
		test	bh,10h
		jz	loc_1442		; Jump if zero
		mov	ax,es:[di+2]
		mov	cl,1
loc_1442:
		mov	bx,ax
		cmp	bx,0FFFFh
		je	loc_1443		; Jump if equal
		mov	ax,es:[di]
		cmp	ax,0FFFCh
		jae	loc_1443		; Jump if above or =
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		add	ax,bx
		mov	ax,es:[di]
		jnc	loc_1444		; Jump if carry=0
loc_1443:
		pop	bx
		jmp	loc_1455		; (8B56)
loc_1444:
		mov	bp,3BEBh
		call	sub_128			; (9AA4)
		cmp	byte ptr ds:[42B9h],1	; (020C:42B9=80h)
		jne	loc_1445		; Jump if not equal
		jmp	short loc_1443		; (8A71)
loc_1445:
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		je	loc_1447		; Jump if equal
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_117			; (844C)
		mov	di,word ptr ds:[42BAh]	; (020C:42BA=8A00h)
		and	byte ptr es:[di+4],0E0h
		mov	al,byte ptr ds:[3C7Ch]	; (020C:3C7C=4Eh)
		or	es:[di+4],al
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1446		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1446		; Jump if equal
		call	sub_115			; (83A4)
loc_1446:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
loc_1447:
		pop	bx
		inc	byte ptr ds:[3C78h]	; (020C:3C78=2Ah)
		cmp	di,0FFF8h
		ja	loc_1449		; Jump if above
		cmp	data_462,0		; (020C:4203=0EBh)
		je	loc_1450		; Jump if equal
		dec	data_462		; (020C:4203=0EBh)
		jz	loc_1449		; Jump if zero
		add	di,2
		test	bh,10h
		jz	loc_1448		; Jump if zero
		add	di,2
loc_1448:
		jmp	short loc_1453		; (8B22)
loc_1449:
		jmp	short loc_1455		; (8B56)
loc_1450:
		mov	al,byte ptr ds:[3C7Ah]	; (020C:3C7A=61h)
		cmp	byte ptr ds:[3C78h],al	; (020C:3C78=2Ah)
		jb	loc_1451		; Jump if below
		jmp	short loc_1455		; (8B56)
loc_1451:
		test	bh,10h
		jz	loc_1452		; Jump if zero
		cmp	word ptr es:[di+4],0
		je	loc_1455		; Jump if equal
		add	di,2
loc_1452:
		add	di,2
		cmp	word ptr es:[di],0
		je	loc_1455		; Jump if equal
		test	bh,10h
		jnz	loc_1453		; Jump if not zero
		mov	ax,es:[di]
		cmp	ax,data_308		; (020C:2A42=0A720h)
		jb	loc_1455		; Jump if below
		cmp	ax,data_309		; (020C:2A44=0AFA0h)
		ja	loc_1455		; Jump if above
loc_1453:
		mov	ax,word ptr ds:[3C74h]	; (020C:3C74=21CDh)
		mov	data_400,ax		; (020C:2EF4=4E49h)
		mov	ax,word ptr ds:[3C76h]	; (020C:3C76=94A2h)
		mov	data_399,ax		; (020C:2EF2=575Ch)
		mov	ax,word ptr ds:[3C71h]	; (020C:3C71=0B421h)
		mov	data_428,ax		; (020C:3796=2A78h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1454		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1454		; Jump if equal
		call	sub_115			; (83A4)
loc_1454:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		jmp	loc_1429		; (890E)
loc_1455:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1456		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1456		; Jump if equal
		call	sub_115			; (83A4)
loc_1456:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_1457:
		mov	ax,word ptr ds:[3C71h]	; (020C:3C71=0B421h)
		mov	data_428,ax		; (020C:3796=2A78h)
		mov	al,byte ptr ds:[3C73h]	; (020C:3C73=19h)
		mov	byte ptr ds:[2F04h],al	; (020C:2F04=43h)
loc_1458:
		cmp	byte ptr ds:[3C78h],0	; (020C:3C78=2Ah)
		je	loc_1465		; Jump if equal
		mov	bp,282Ah
		cmp	data_461,1		; (020C:4202=80h)
		je	loc_1459		; Jump if equal
		cmp	byte ptr ds:[bp],3Bh	; ';'
		je	loc_1460		; Jump if equal
loc_1459:
		mov	byte ptr ds:[bp],3Bh	; ';'
		inc	bp
		inc	bp
		jmp	short loc_1461		; (8BAA)
loc_1460:
		mov	byte ptr ds:[bp],3Bh	; ';'
		mov	bp,283Fh
loc_1461:
		mov	al,byte ptr ds:[3C78h]	; (020C:3C78=2Ah)
		xor	ah,ah			; Zero register
		mov	bl,0
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		inc	bp
		mov	word ptr ds:[bp],6E65h
		inc	bp
		inc	bp
		mov	word ptr ds:[bp],7274h
		inc	bp
		inc	bp
		cmp	byte ptr ds:[3C78h],1	; (020C:3C78=2Ah)
		je	loc_1462		; Jump if equal
		mov	word ptr ds:[bp],6569h
		inc	bp
		inc	bp
		mov	byte ptr ds:[bp],73h	; 's'
		jmp	short loc_1463		; (8BE2)
loc_1462:
		mov	byte ptr ds:[bp],79h	; 'y'
loc_1463:
		cmp	data_461,1		; (020C:4202=80h)
		jne	loc_1465		; Jump if not equal
		inc	bp
		mov	cx,377Fh
		sub	cx,3778h
		mov	di,3778h
  
locloop_1464:
		mov	al,[di]
		mov	ds:[bp],al
		inc	di
		inc	bp
		loop	locloop_1464		; Loop if cx > 0
  
loc_1465:
		mov	al,byte ptr ds:[41FDh]	; (020C:41FD=9Fh)
		mov	data_170,al		; (020C:152A=0)
loc_1466:
		mov	data_376,1		; (020C:2EB7=4Fh)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1467		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1467		; Jump if equal
		call	sub_115			; (83A4)
loc_1467:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	dx
		pop	cx
		retn
sub_119		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_120		proc	near
		push	bx
		push	dx
		push	di
		mov	cx,di
		mov	di,8
loc_1468:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_1469		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		je	loc_1471		; Jump if equal
loc_1469:
		mov	dl,es:[di+5]
		and	dl,0Ch
		cmp	dl,4
		jne	loc_1470		; Jump if not equal
		test	byte ptr es:[di+4],10h
		jnz	loc_1474		; Jump if not zero
		test	byte ptr es:[di+4],2
		jz	loc_1470		; Jump if zero
		cmp	es:[di+2],cx
		je	loc_1474		; Jump if equal
loc_1470:
		cmp	es:[di],ax
		jb	loc_1474		; Jump if below
		jz	loc_1472		; Jump if zero
loc_1471:
		mov	ax,0FFFFh
		jmp	short loc_1476		; (8CB0)
loc_1472:
		cmp	es:[di+2],cx
		jb	loc_1474		; Jump if below
		cmp	dl,0
		jne	loc_1473		; Jump if not equal
		mov	bl,es:[di+4]
		and	bl,5Fh			; '_'
		cmp	bl,5Fh			; '_'
		jne	loc_1473		; Jump if not equal
		test	byte ptr es:[di+5],3
		jz	loc_1474		; Jump if zero
loc_1473:
		mov	ax,es:[di+2]
		jmp	short loc_1476		; (8CB0)
loc_1474:
		push	ax
		mov	al,es:[di+5]
		and	ax,0Fh
		push	bx
		mov	bx,377Fh
		xlat				; al=[al+[bx]] table
		pop	bx
		or	al,al			; Zero ?
		jnz	loc_1475		; Jump if not zero
		mov	al,es:[di+6]
loc_1475:
		add	di,ax
		pop	ax
		jmp	short loc_1468		; (8C38)
loc_1476:
		pop	di
		pop	dx
		pop	bx
		retn
sub_120		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_121		proc	near
		push	si
		push	di
		push	cx
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	al,es:[di+4]
		and	al,1Fh
		cmp	al,1Fh
		je	loc_1477		; Jump if equal
		dec	al
		mov	ah,2Ch			; ','
		mul	ah			; ax = reg * al
		mov	si,3C81h
		add	si,ax
		mov	di,2ED4h
data_579	dw	28B9h			; Data table (indexed access)
		add	al,ch
		db	0F3h
		db	0F3h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
loc_1477:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1478		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1478		; Jump if equal
		call	sub_115			; (83A4)
loc_1478:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	cx
		pop	di
		pop	si
		retn
sub_121		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_122		proc	near
		test	word ptr ds:[42CCh],40h	; (94E8:42CC=71Fh)
		jnz	loc_1479		; Jump if not zero
		cmp	byte ptr es:[si+1],21h	; '!'
		jne	loc_1479		; Jump if not equal
		mov	ax,word ptr ds:[2ED4h]	; (94E8:2ED4=7C80h)
		cmp	ah,25h			; '%'
data_582	db	74h
		add	bp,cx
		xor	al,[bx+di]
		push	bx
		push	cx
		push	dx
		push	di
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	ax,word ptr ds:[2EE0h]	; (94E8:2EE0=133Eh)
		mov	bx,word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
		cmp	ax,0
		jne	loc_1480		; Jump if not equal
		cmp	bx,0
		jne	loc_1480		; Jump if not equal
		jmp	loc_1489		; (8E2C)
loc_1480:
		mov	word ptr ds:[37A6h],bx	; (94E8:37A6=0E804h)
		mov	word ptr ds:[37A8h],ax	; (94E8:37A8=163h)
		mov	di,37A6h
		call	sub_109			; (80CE)
		call	sub_136			; (B1A8)
		jc	loc_1481		; Jump if carry Set
		jmp	loc_1489		; (8E2C)
loc_1481:
		mov	ax,word ptr ds:[2EE0h]	; (94E8:2EE0=133Eh)
		mov	dx,1
		call	sub_84			; (7498)
		jc	loc_1483		; Jump if carry Set
		jmp	short loc_1484		; (8DA3)
loc_1482:
		jmp	loc_1489		; (8E2C)
loc_1483:
		or	byte ptr es:[di+5],30h	; '0'
		cmp	byte ptr ds:[2638h],4	; (A80C:2638=0)
		jb	loc_1482		; Jump if below
		or	byte ptr es:[di+4],40h	; '@'
		test	byte ptr es:[di+5],2
		jnz	loc_1482		; Jump if not zero
		push	di
		mov	si,di
		mov	di,472Bh
		mov	cx,7Fh
		mov	ax,es
		push	ds
		pop	es
		mov	ds,ax
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	ax,es
		push	ds
		pop	es
		mov	ds,ax
		pop	si
		call	sub_125			; (92DC)
		mov	di,472Bh
		and	byte ptr [di+5],0FCh
		or	byte ptr [di+5],2
		jmp	short loc_1486		; (8DC8)
loc_1484:
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	al,40h			; '@'
		cmp	byte ptr ds:[263Dh],6	; (A80C:263D=0)
		jb	loc_1485		; Jump if below
		cmp	byte ptr ds:[2638h],4	; (A80C:2638=0)
		jae	loc_1485		; Jump if above or =
		mov	al,0
loc_1485:
		mov	[di+4],al
		mov	byte ptr [di+5],32h	; '2'
		mov	byte ptr [di+6],0
loc_1486:
		mov	ax,word ptr ds:[2ED4h]	; (A80C:2ED4=0)
		mov	bp,33BEh
;*		call	far ptr sub_178		;*(1548:0024)
		db	 9Ah, 24h, 00h, 48h, 15h
		mov	bp,33BAh
		add	di,7
		mov	cx,33C9h
		sub	cx,33BAh
;*		call	far ptr sub_219		;*(1548:1238)
		db	 9Ah, 38h, 12h, 48h, 15h
		cmp	al,0
		je	locloop_1487		; Jump if equal
		push	bp
		push	bx
		mov	bp,33C5h
		mov	byte ptr ds:[bp],5Fh	; '_'
		inc	bp
		xor	ah,ah			; Zero register
		xor	bx,bx			; Zero register
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],20h	; ' '
		pop	bx
		pop	bp
  
locloop_1487:
		mov	al,ds:[bp]
		mov	[di],al
		inc	bp
		inc	di
		loop	locloop_1487		; Loop if cx > 0
  
		call	sub_124			; (9120)
		mov	bp,33C5h
		mov	byte ptr ds:[bp],72h	; 'r'
		inc	bp
		mov	byte ptr ds:[bp],79h	; 'y'
		inc	bp
loc_1488:
		mov	byte ptr ds:[bp],20h	; ' '
		inc	bp
		cmp	bp,33C9h
		jb	loc_1488		; Jump if below
loc_1489:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1490		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1490		; Jump if equal
		call	sub_115			; (83A4)
loc_1490:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		pop	di
		pop	dx
		pop	cx
		pop	bx
data_584	db	0C3h
		xchg	bx,bx
		nop
		mov	si,di
		call	sub_125			; (92DC)
		mov	bx,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	dx,1
		test	al,2
		jnz	loc_1491		; Jump if not zero
		mov	dx,4
loc_1491:
		push	es
		mov	es,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	di,word ptr ds:[2D84h]	; (A80C:2D84=0)
		test	al,1
		jz	loc_1492		; Jump if zero
		mov	bx,es:[di+2]
loc_1492:
		mov	ax,es:[di]
		pop	es
		call	sub_84			; (7498)
		jnc	loc_1493		; Jump if carry=0
		mov	si,di
		call	sub_125			; (92DC)
		mov	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		inc	ax
		mov	word ptr ds:[4315h],ax	; (A80C:4315=0)
		mov	word ptr ds:[4317h],ax	; (A80C:4317=0)
loc_1493:
		retn
sub_122		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_123		proc	near
		push	ax
		push	bx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	al,es:[di+5]
		and	al,0Fh
		jnz	loc_1494		; Jump if not zero
		jmp	loc_1522		; (90F2)
loc_1494:
		mov	al,es:[di+9]
		cmp	al,0
		jne	loc_1495		; Jump if not equal
		mov	byte ptr ds:[2D8Dh],0	; (AAC0:2D8D=0)
		mov	byte ptr ds:[2D8Fh],1	; (AAC0:2D8F=0)
		jmp	loc_1521		; (90ED)
loc_1495:
		cmp	al,1
		jne	loc_1496		; Jump if not equal
		mov	byte ptr ds:[2D8Dh],5	; (AAC0:2D8D=0)
		jmp	loc_1521		; (90ED)
loc_1496:
		cmp	al,2
		jne	loc_1498		; Jump if not equal
		test	byte ptr ds:[2E7Eh],5	; (AAC0:2E7E=0)
		jz	loc_1497		; Jump if zero
		mov	byte ptr ds:[4205h],1	; (AAC0:4205=0)
		jmp	loc_1521		; (90ED)
loc_1497:
		jmp	loc_1522		; (90F2)
loc_1498:
		cmp	al,3
		jne	loc_1499		; Jump if not equal
		call	sub_132			; (A9E7)
		mov	al,3
		call	sub_52			; (6380)
		jmp	loc_1522		; (90F2)
loc_1499:
		cmp	al,4
		jne	loc_1501		; Jump if not equal
		mov	byte ptr ds:[2D8Dh],0	; (94E8:2D8D=0D1h)
		mov	byte ptr ds:[2D8Fh],1	; (94E8:2D8F=0D1h)
		test	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
		jz	loc_1500		; Jump if zero
		and	byte ptr ds:[2ECAh],0CFh	; (94E8:2ECA=0C5h)
		and	byte ptr ds:[2ECAh],0FCh	; (94E8:2ECA=0C5h)
		and	byte ptr ds:[2ECAh],0FBh	; (94E8:2ECA=0C5h)
		mov	al,42h			; 'B'
		call	sub_52			; (6380)
loc_1500:
		jmp	loc_1521		; (90ED)
loc_1501:
		cmp	al,5
		jne	loc_1503		; Jump if not equal
		mov	byte ptr ds:[2D8Dh],0	; (94E8:2D8D=0D1h)
		mov	byte ptr ds:[2D8Fh],1	; (94E8:2D8F=0D1h)
		test	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
		jnz	loc_1502		; Jump if not zero
		or	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
		or	byte ptr ds:[2ECAh],3	; (94E8:2ECA=0C5h)
		mov	al,41h			; 'A'
		call	sub_52			; (6380)
loc_1502:
		jmp	loc_1521		; (90ED)
loc_1503:
		cmp	al,6
		jne	loc_1505		; Jump if not equal
		mov	ax,es:[di+0Ah]
		or	word ptr ds:[42CCh],ax	; (94E8:42CC=71Fh)
		mov	al,es:[di+0Ch]
		xor	ah,ah			; Zero register
		or	word ptr ds:[42CEh],ax	; (94E8:42CE=0F78Bh)
		mov	ax,es:[di+0Dh]
		and	word ptr ds:[42CCh],ax	; (94E8:42CC=71Fh)
		mov	al,es:[di+0Fh]
		mov	ah,0FFh
		and	word ptr ds:[42CEh],ax	; (94E8:42CE=0F78Bh)
		mov	al,0
		test	word ptr ds:[42CCh],2	; (94E8:42CC=71Fh)
		jz	loc_1504		; Jump if zero
		mov	al,1
loc_1504:
;*		call	far ptr sub_222		;*(1548:12D0)
		db	 9Ah,0D0h, 12h, 48h, 15h
		jmp	loc_1521		; (90ED)
loc_1505:
		cmp	al,7
		jne	loc_1506		; Jump if not equal
		mov	ax,es:[di+0Ah]
		mov	word ptr ds:[2EF4h],ax	; (94E8:2EF4=6FFh)
		mov	ax,es:[di+0Ch]
		mov	word ptr ds:[2EF2h],ax	; (94E8:2EF2=35EBh)
		mov	ax,es:[di+0Eh]
		mov	word ptr ds:[2ED4h],ax	; (94E8:2ED4=7C80h)
		mov	ax,es:[di+10h]
		mov	word ptr ds:[2ED8h],ax	; (94E8:2ED8=575h)
		mov	ax,es:[di+12h]
		mov	word ptr ds:[2EE4h],ax	; (94E8:2EE4=83CDh)
		mov	ax,es:[di+14h]
		mov	word ptr ds:[2EE8h],ax	; (94E8:2EE8=99h)
		jmp	loc_1522		; (90F2)
loc_1506:
		cmp	al,17h
		jne	loc_1507		; Jump if not equal
		jmp	short loc_1514		; (9016)
loc_1507:
		cmp	al,90h
		jb	loc_1508		; Jump if below
		cmp	al,96h
		ja	loc_1508		; Jump if above
		jmp	short loc_1515		; (902C)
loc_1508:
		cmp	al,0Ah
		ja	loc_1510		; Jump if above
		cmp	al,8
		jb	loc_1509		; Jump if below
		mov	bx,es:[di+0Ah]
		mov	word ptr ds:[42B1h],bx	; (94E8:42B1=8ECBh)
		mov	byte ptr ds:[42B3h],al	; (94E8:42B3=1Eh)
		jmp	loc_1521		; (90ED)
loc_1509:
		jmp	loc_1522		; (90F2)
loc_1510:
		test	al,10h
		jnz	loc_1516		; Jump if not zero
		test	al,40h			; '@'
		jz	loc_1511		; Jump if zero
		mov	bx,es:[di+0Ah]
		mov	word ptr ds:[2D91h],bx	; (94E8:2D91=0E9D0h)
		mov	byte ptr ds:[2D90h],al	; (94E8:2D90=0E9h)
		jmp	loc_1521		; (90ED)
loc_1511:
		cmp	al,80h
		jb	loc_1509		; Jump if below
		cmp	al,8Ch
		ja	loc_1509		; Jump if above
		mov	bx,es:[di+0Ah]
		mov	si,2ED4h
		and	al,0Fh
		cmp	al,7
		jb	loc_1512		; Jump if below
		mov	si,2EF0h
		sub	al,7
		jmp	short loc_1513		; (900B)
loc_1512:
		shl	al,1			; Shift w/zeros fill
loc_1513:
		shl	al,1			; Shift w/zeros fill
		xor	ah,ah			; Zero register
		add	si,ax
		mov	[si],bx
		jmp	loc_1521		; (90ED)
loc_1514:
		mov	byte ptr ds:[38BAh],13h	; (94E8:38BA=0F7h)
		mov	al,es:[di+6]
		sub	al,16h
		mov	si,16h
;*		call	far ptr sub_215		;*(1548:1154)
		db	 9Ah, 54h, 11h, 48h, 15h
		jmp	loc_1522		; (90F2)
loc_1515:
		sub	al,90h
		xor	ah,ah			; Zero register
		shl	ax,1			; Shift w/zeros fill
		shl	ax,1			; Shift w/zeros fill
		mov	si,2ED4h
		add	si,ax
		mov	bx,es:[di+0Ah]
		mov	[si],bx
		mov	bx,es:[di+0Ch]
		mov	[si+2],bx
		jmp	loc_1521		; (90ED)
loc_1516:
		push	word ptr ds:[37A4h]	; (94E8:37A4=8A12h)
		push	word ptr ds:[3796h]	; (94E8:3796=8A50h)
		push	word ptr ds:[2A8Fh]	; (94E8:2A8F=0F69Ah)
		mov	byte ptr ds:[4202h],1	; (94E8:4202=59h)
		mov	ax,es:[di+0Ch]
		mov	word ptr ds:[37A4h],ax	; (94E8:37A4=8A12h)
		mov	ax,es:[di+0Ah]
		mov	word ptr ds:[3796h],ax	; (94E8:3796=8A50h)
		mov	al,es:[di+0Eh]
		mov	byte ptr ds:[4203h],al	; (94E8:4203=0CDh)
		mov	al,es:[di+9]
		mov	bh,20h			; ' '
		test	al,1
		jz	loc_1517		; Jump if zero
		or	bh,10h
loc_1517:
		mov	byte ptr ds:[2A75h],0	; (94E8:2A75=75h)
		cmp	al,11h
		ja	loc_1518		; Jump if above
		mov	byte ptr ds:[2A75h],4Fh	; (94E8:2A75=75h) 'O'
loc_1518:
		mov	dl,0
		call	sub_109			; (80CE)
		mov	si,41FFh
		call	sub_119			; (8690)
		mov	data_461,2		; (020C:4202=80h)
		mov	data_462,0		; (020C:4203=0EBh)
		mov	byte ptr ds:[2A75h],0	; (020C:2A75=0ADh)
		pop	data_334		; (020C:2A8F=0E3E2h)
		pop	data_428		; (020C:3796=2A78h)
		pop	data_430		; (020C:37A4=0B8h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1519		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1519		; Jump if equal
		call	sub_115			; (83A4)
loc_1519:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	dx,1
		mov	al,es:[di+9]
		cmp	al,11h
		ja	loc_1520		; Jump if above
		mov	dx,4
loc_1520:
		mov	ax,data_355		; (020C:2D84=4C4Ch)
		mov	bx,data_354		; (020C:2D82=4152h)
		call	sub_84			; (7498)
loc_1521:
		mov	byte ptr ds:[27D4h],2Eh	; (A80C:27D4=0) '.'
loc_1522:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1523		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1523		; Jump if equal
		call	sub_115			; (83A4)
loc_1523:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	bx
		pop	ax
		clc				; Clear carry flag
		retn
sub_123		endp
  
		db	10 dup (0)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_124		proc	near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		call	sub_104			; (80B9)
		mov	bp,377Fh
		mov	si,472Bh
		mov	bx,[si]
		mov	al,[si+5]
		and	al,0Ch
		cmp	al,8
		je	loc_1527		; Jump if equal
		cmp	al,4
		je	loc_1524		; Jump if equal
		cmp	al,0
		je	loc_1525		; Jump if equal
		mov	bx,1
		jmp	loc_190			; (215F)
loc_1524:
		call	sub_116			; (83D8)
		add	data_315,1		; (020C:2A63=0AEA1h)
		adc	data_316,0		; (020C:2A65=20A9h)
		jmp	short loc_1528		; (9197)
loc_1525:
		cmp	byte ptr [si+4],5Fh	; '_'
		jne	loc_1526		; Jump if not equal
		cmp	byte ptr [si+5],0
		jne	loc_1526		; Jump if not equal
		call	sub_111			; (80D7)
		add	word ptr ds:[2A6Fh],1	; (94E8:2A6F=0C00Ah)
		adc	word ptr ds:[2A71h],0	; (94E8:2A71=3174h)
		jmp	short loc_1528		; (9197)
loc_1526:
		call	sub_117			; (844C)
		add	word ptr ds:[2A67h],1	; (94E8:2A67=8B00h)
		adc	word ptr ds:[2A69h],0	; (94E8:2A69=477h)
		jmp	short loc_1528		; (9197)
loc_1527:
		call	sub_118			; (84C0)
		add	word ptr ds:[2A6Bh],1	; (94E8:2A6B=1BAh)
		adc	word ptr ds:[2A6Dh],0	; (94E8:2A6D=0AC00h)
		jmp	short loc_1528		; (9197)
loc_1528:
		call	sub_50			; (52A0)
		mov	di,8
		mov	bx,[si]
		mov	ax,[si+2]
		mov	cx,word ptr es:[2]	; (A80C:0002=0)
		cmp	cx,bx
		ja	loc_1530		; Jump if above
		jc	loc_1529		; Jump if carry Set
		mov	cx,word ptr es:[4]	; (A80C:0004=0)
		cmp	cx,ax
		ja	loc_1530		; Jump if above
loc_1529:
		mov	di,word ptr es:[6]	; (A80C:0006=0)
loc_1530:
		mov	bx,[si]
		mov	ax,[si+2]
		cmp	di,word ptr es:[0]	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		jb	loc_1531		; Jump if below
		jmp	short loc_1537		; (920C)
loc_1531:
		cmp	es:[di],bx
		jae	loc_1533		; Jump if above or =
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1532		; Jump if not zero
		mov	al,es:[di+6]
loc_1532:
		mov	cx,ax
		add	di,cx
		jmp	short loc_1530		; (91BB)
loc_1533:
		jz	loc_1534		; Jump if zero
		jmp	short loc_1537		; (920C)
loc_1534:
		cmp	es:[di+2],ax
		jb	loc_1535		; Jump if below
		jmp	short loc_1537		; (920C)
loc_1535:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1536		; Jump if not zero
		mov	al,es:[di+6]
loc_1536:
		mov	cx,ax
		add	di,cx
		jmp	short loc_1530		; (91BB)
loc_1537:
		mov	bx,377Fh
		mov	al,[si+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1538		; Jump if not zero
		mov	al,[si+6]
loc_1538:
		mov	cx,ax
		mov	ax,word ptr es:[0]	; (A80C:0000=0)
		add	ax,cx
		jnc	loc_1539		; Jump if carry=0
;*		jmp	loc_184			;*(20C9)
		db	0E9h, 9Fh, 8Eh
loc_1539:
		mov	si,472Bh
		mov	ax,[si]
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		jne	loc_1543		; Jump if not equal
		mov	ax,[si+2]
		cmp	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		jbe	loc_1543		; Jump if below or =
		mov	bl,[si+5]
		and	bl,0Ch
		cmp	bl,8
		je	loc_1540		; Jump if equal
		cmp	bl,4
		je	loc_1541		; Jump if equal
		cmp	bl,0
		je	loc_1542		; Jump if equal
		jmp	short loc_1543		; (9276)
loc_1540:
		cmp	ax,word ptr ds:[4317h]	; (94E8:4317=382h)
		jae	loc_1543		; Jump if above or =
		mov	word ptr ds:[4317h],ax	; (94E8:4317=382h)
		jmp	short loc_1543		; (9276)
loc_1541:
		cmp	ax,word ptr ds:[4313h]	; (94E8:4313=0CD3Eh)
		jae	loc_1543		; Jump if above or =
		mov	word ptr ds:[4313h],ax	; (94E8:4313=0CD3Eh)
		jmp	short loc_1543		; (9276)
loc_1542:
		cmp	ax,word ptr ds:[4315h]	; (94E8:4315=0BA21h)
		jae	loc_1543		; Jump if above or =
		mov	word ptr ds:[4315h],ax	; (94E8:4315=0BA21h)
		jmp	short loc_1543		; (9276)
loc_1543:
		push	di
		push	cx
		push	ds
		push	es
		pop	ds
		mov	si,word ptr es:[0]	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		dec	si
		mov	ax,si
		sub	ax,di
		inc	ax
		add	word ptr es:[0],cx	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		jnc	loc_1544		; Jump if carry=0
;*		jmp	loc_184			;*(20C9)
		db	0E9h, 39h, 8Eh
loc_1544:
		mov	di,si
		add	di,cx
		mov	cx,ax
		std				; Set direction flag
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	ds
		pop	cx
		pop	di
		mov	si,472Bh
		mov	ax,[si]
		mov	word ptr es:[2],ax	; (A80C:0002=0)
		mov	ax,[si+2]
		mov	word ptr es:[4],ax	; (A80C:0004=0)
		mov	word ptr es:[6],di	; (A80C:0006=0)
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1545		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1545		; Jump if equal
		call	sub_115			; (83A4)
loc_1545:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_124		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_125		proc	near
		call	sub_50			; (52A0)
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	al,es:[si+5]
		and	al,0Ch
		cmp	al,8
		je	loc_1548		; Jump if equal
		cmp	al,4
		je	loc_1546		; Jump if equal
		cmp	al,0
		je	loc_1547		; Jump if equal
		mov	bx,2
		jmp	loc_190			; (215F)
loc_1546:
		sub	word ptr ds:[2A63h],1	; (94E8:2A63=6C6h)
		sbb	word ptr ds:[2A65h],0	; (94E8:2A65=9AC0h)
		jmp	short loc_1549		; (9322)
loc_1547:
		sub	word ptr ds:[2A67h],1	; (94E8:2A67=8B00h)
		sbb	word ptr ds:[2A69h],0	; (94E8:2A69=477h)
		jmp	short loc_1549		; (9322)
loc_1548:
		sub	word ptr ds:[2A6Bh],1	; (94E8:2A6B=1BAh)
		sbb	word ptr ds:[2A6Dh],0	; (94E8:2A6D=0AC00h)
		jmp	short loc_1549		; (9322)
loc_1549:
		mov	bx,377Fh
		mov	al,es:[si+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1550		; Jump if not zero
		mov	al,es:[si+6]
loc_1550:
		mov	cx,ax
		mov	ax,es:[si]
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		jne	loc_1557		; Jump if not equal
		mov	ax,es:[si+2]
		mov	bl,es:[si+5]
		and	bl,0Ch
		cmp	bl,8
		je	loc_1551		; Jump if equal
		cmp	bl,4
		je	loc_1553		; Jump if equal
		cmp	bl,0
		je	loc_1555		; Jump if equal
		jmp	short loc_1557		; (93B1)
loc_1551:
		cmp	ax,word ptr ds:[4317h]	; (94E8:4317=382h)
		jne	loc_1557		; Jump if not equal
		mov	bx,cx
		mov	ax,es:[bx+si]
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	ax,es:[bx+si+2]
		jnz	loc_1552		; Jump if not zero
		mov	ax,0FFFFh
loc_1552:
		mov	word ptr ds:[4317h],ax	; (94E8:4317=382h)
		jmp	short loc_1557		; (93B1)
loc_1553:
		cmp	ax,word ptr ds:[4313h]	; (94E8:4313=0CD3Eh)
		jne	loc_1557		; Jump if not equal
		mov	bx,cx
		mov	ax,es:[bx+si]
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	ax,es:[bx+si+2]
		jnz	loc_1554		; Jump if not zero
		mov	ax,0FFFFh
loc_1554:
		mov	word ptr ds:[4313h],ax	; (94E8:4313=0CD3Eh)
		jmp	short loc_1557		; (93B1)
loc_1555:
		cmp	ax,word ptr ds:[4315h]	; (94E8:4315=0BA21h)
		jne	loc_1557		; Jump if not equal
		mov	bx,cx
		mov	ax,es:[bx+si]
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	ax,es:[bx+si+2]
		jnz	loc_1556		; Jump if not zero
		mov	ax,0FFFFh
loc_1556:
		mov	word ptr ds:[4315h],ax	; (94E8:4315=0BA21h)
loc_1557:
		mov	di,si
		add	si,cx
		mov	ax,es:[si]
		mov	word ptr es:[2],ax	; (A80C:0002=0)
		mov	ax,es:[si+2]
		mov	word ptr es:[4],ax	; (A80C:0004=0)
		mov	word ptr es:[6],di	; (A80C:0006=0)
		mov	ax,cx
		mov	cx,word ptr es:[0]	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		sub	cx,si
		push	ds
		push	es
		pop	ds
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	ds
		sub	word ptr es:[0],ax	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_125		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_126		proc	near
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	si
		push	di
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		jne	loc_1561		; Jump if not equal
		call	sub_104			; (80B9)
		test	ax,2
		jz	loc_1558		; Jump if zero
		call	sub_116			; (83D8)
		jmp	short loc_1562		; (942A)
loc_1558:
		test	ax,1
		jz	loc_1559		; Jump if zero
		call	sub_117			; (844C)
		jmp	short loc_1562		; (942A)
loc_1559:
		test	ax,4
		jz	loc_1560		; Jump if zero
		call	sub_118			; (84C0)
		jmp	short loc_1562		; (942A)
loc_1560:
		jmp	loc_1568		; (94C2)
loc_1561:
		call	sub_115			; (83A4)
		mov	es,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
loc_1562:
		mov	di,8
		mov	word ptr es:[di],0FFFFh
		mov	word ptr es:[di+2],0FFFFh
		mov	byte ptr es:[di+4],0
		mov	byte ptr es:[di+6],0
		test	ax,2
		jnz	loc_1563		; Jump if not zero
		test	ax,1
		jnz	loc_1565		; Jump if not zero
		test	ax,4
		jnz	loc_1567		; Jump if not zero
		jmp	short loc_1568		; (94C2)
loc_1563:
		mov	byte ptr es:[di+5],4
		mov	word ptr es:[0],12h	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		mov	si,6C7Bh
		push	di
		mov	di,0FFF0h
		cmp	byte ptr es:[di],0FFh
		jne	loc_1564		; Jump if not equal
		mov	cx,0Ch
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
loc_1564:
		pop	di
		jmp	short loc_1568		; (94C2)
loc_1565:
		mov	byte ptr es:[di+5],0
		mov	word ptr es:[0],0Fh	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		mov	si,6C9Bh
		push	di
		mov	di,0FFF0h
		cmp	byte ptr es:[di],0FFh
		jne	loc_1566		; Jump if not equal
		mov	cx,0Ch
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
loc_1566:
		pop	di
		jmp	short loc_1568		; (94C2)
loc_1567:
		mov	byte ptr es:[di+5],8
		push	cx
		mov	cx,29h
		xor	ax,ax			; Zero register
		mov	di,11h
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		pop	cx
		mov	word ptr es:[0],43h	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		mov	si,6C8Bh
		mov	di,0FFF0h
		cmp	byte ptr es:[di],0FFh
		jne	loc_1568		; Jump if not equal
		mov	cx,0Ch
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
loc_1568:
		mov	word ptr es:[2],0FFFFh	; (A80C:0002=0)
		mov	word ptr es:[4],0FFFFh	; (A80C:0004=0)
		mov	word ptr es:[6],8	; (A80C:0006=0)
		pop	di
		pop	si
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1569		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1569		; Jump if equal
		call	sub_115			; (83A4)
loc_1569:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1570		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1570		; Jump if equal
		call	sub_115			; (83A4)
loc_1570:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
sub_126		endp
  
		db	8 dup (0)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_127		proc	near
		push	bx
		push	dx
		push	si
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	byte ptr ds:[42B9h],0	; (94E8:42B9=3)
		test	bx,0FF20h
		jz	loc_1572		; Jump if zero
		cmp	ax,0FFFDh
		jb	loc_1571		; Jump if below
		mov	byte ptr ds:[2F06h],0	; (94E8:2F06=17h)
		jmp	short loc_1572		; (955C)
loc_1571:
		test	word ptr ds:[42CCh],8	; (94E8:42CC=71Fh)
		jnz	loc_1572		; Jump if not zero
		cmp	byte ptr ds:[42C5h],1	; (94E8:42C5=6Ch)
		jne	loc_1572		; Jump if not equal
		cmp	byte ptr ds:[2F06h],0Fh	; (94E8:2F06=17h)
		ja	loc_1572		; Jump if above
		or	byte ptr ds:[42C5h],80h	; (94E8:42C5=6Ch)
loc_1572:
		mov	cl,byte ptr ds:[2F04h]	; (94E8:2F04=0)
		mov	byte ptr ds:[2F0Bh],0	; (94E8:2F0B=0)
;*		call	far ptr sub_208		;*(1548:0FA8)
		db	 9Ah,0A8h, 0Fh, 48h, 15h
		jnc	loc_1573		; Jump if carry=0
		mov	dx,word ptr ds:[2EFAh]	; (94E8:2EFA=0B3E8h)
		mov	word ptr ds:[3796h],dx	; (94E8:3796=8A50h)
		test	byte ptr ds:[2ECCh],8	; (94E8:2ECC=91h)
		jnz	loc_1573		; Jump if not zero
		mov	byte ptr ds:[2F0Bh],1	; (94E8:2F0B=0)
loc_1573:
		cmp	cl,90h
		jne	loc_1574		; Jump if not equal
		mov	dx,word ptr ds:[3796h]	; (94E8:3796=8A50h)
		cmp	dx,word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
		jne	loc_1581		; Jump if not equal
;*		call	far ptr sub_205		;*(1548:0E90)
		db	 9Ah, 90h, 0Eh, 48h, 15h
		mov	word ptr ds:[2EF4h],dx	; (94E8:2EF4=6FFh)
		mov	word ptr ds:[3796h],dx	; (94E8:3796=8A50h)
		jmp	short loc_1581		; (9606)
loc_1574:
		cmp	cl,26h			; '&'
		jne	loc_1575		; Jump if not equal
		mov	dx,word ptr ds:[2EF2h]	; (94E8:2EF2=35EBh)
;*		call	far ptr sub_205		;*(1548:0E90)
		db	 9Ah, 90h, 0Eh, 48h, 15h
		mov	word ptr ds:[2EF2h],dx	; (94E8:2EF2=35EBh)
		jmp	short loc_1580		; (9602)
loc_1575:
		cmp	cl,2Eh			; '.'
		jne	loc_1576		; Jump if not equal
		mov	dx,word ptr ds:[2A3Ch]	; (94E8:2A3C=6C6h)
		jmp	short loc_1580		; (9602)
loc_1576:
		cmp	cl,36h			; '6'
		jne	loc_1577		; Jump if not equal
		mov	dx,word ptr ds:[2EFAh]	; (94E8:2EFA=0B3E8h)
		jmp	short loc_1580		; (9602)
loc_1577:
		cmp	cl,64h			; 'd'
		jne	loc_1578		; Jump if not equal
		mov	dx,word ptr ds:[2EF6h]	; (94E8:2EF6=9976h)
;*		call	far ptr sub_205		;*(1548:0E90)
		db	 9Ah, 90h, 0Eh, 48h, 15h
		mov	word ptr ds:[2EF6h],dx	; (94E8:2EF6=9976h)
		jmp	short loc_1580		; (9602)
loc_1578:
		cmp	cl,65h			; 'e'
		jne	loc_1579		; Jump if not equal
		mov	dx,word ptr ds:[2EF8h]	; (94E8:2EF8=0B8EBh)
;*		call	far ptr sub_205		;*(1548:0E90)
		db	 9Ah, 90h, 0Eh, 48h, 15h
		mov	word ptr ds:[2EF8h],dx	; (94E8:2EF8=0B8EBh)
		jmp	short loc_1580		; (9602)
loc_1579:
		cmp	cl,3Eh			; '>'
		jne	loc_1581		; Jump if not equal
		mov	dx,word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
;*		call	far ptr sub_205		;*(1548:0E90)
		db	 9Ah, 90h, 0Eh, 48h, 15h
		mov	word ptr ds:[2EF4h],dx	; (94E8:2EF4=6FFh)
loc_1580:
		mov	word ptr ds:[3796h],dx	; (94E8:3796=8A50h)
loc_1581:
		mov	word ptr ds:[37A4h],ax	; (94E8:37A4=8A12h)
		or	ax,ax			; Zero ?
		jnz	loc_1584		; Jump if not zero
		mov	dl,bl
		and	dl,0C7h
		cmp	dl,46h			; 'F'
		jne	loc_1584		; Jump if not equal
		mov	byte ptr ds:[2A53h],2	; (94E8:2A53=6)
		test	byte ptr ds:[2D8Ch],80h	; (94E8:2D8C=0E9h)
		jnz	loc_1582		; Jump if not zero
		test	bh,0C0h
		jz	loc_1582		; Jump if zero
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
loc_1582:
		cmp	byte ptr ds:[2A29h],1	; (94E8:2A29=83h)
		jne	loc_1583		; Jump if not equal
		test	byte ptr ds:[2ECCh],8	; (94E8:2ECC=91h)
		jz	loc_1583		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_1583:
		and	byte ptr ds:[42BFh],0FBh	; (94E8:42BF=6)
		jmp	loc_1638		; (9A7D)
loc_1584:
		mov	byte ptr ds:[42B6h],0	; (94E8:42B6=0FEh)
		test	bl,38h			; '8'
		jz	loc_1587		; Jump if zero
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jnz	loc_1587		; Jump if not zero
		mov	dl,bl
		and	dl,0C7h
		cmp	dl,6
		je	loc_1587		; Jump if equal
		cmp	byte ptr ds:[2F0Bh],1	; (94E8:2F0B=0)
		je	loc_1586		; Jump if equal
		test	word ptr ds:[42CCh],80h	; (94E8:42CC=71Fh)
		jnz	loc_1587		; Jump if not zero
		cmp	word ptr ds:[2EC0h],ax	; (94E8:2EC0=8168h)
		jbe	loc_1585		; Jump if below or =
		jmp	short loc_1586		; (9680)
loc_1585:
		cmp	word ptr ds:[2EC2h],ax	; (94E8:2EC2=8F3Eh)
		jae	loc_1587		; Jump if above or =
loc_1586:
		mov	byte ptr ds:[42B6h],1	; (94E8:42B6=0FEh)
loc_1587:
		push	bx
		mov	bx,word ptr ds:[3796h]	; (94E8:3796=8A50h)
		test	word ptr ds:[42CCh],8	; (94E8:42CC=71Fh)
		jnz	loc_1591		; Jump if not zero
		push	ax
		mov	ax,word ptr ds:[2A24h]	; (94E8:2A24=0F300h)
		cmp	ax,0
		jne	loc_1588		; Jump if not equal
		call	sub_113			; (80E9)
loc_1588:
		cmp	bx,ax
		jb	loc_1590		; Jump if below
		mov	ax,cs
		add	ax,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		cmp	bx,ax
		ja	loc_1590		; Jump if above
		test	byte ptr ds:[42C5h],80h	; (94E8:42C5=6Ch)
		jz	loc_1590		; Jump if zero
		pop	si
		push	si
		mov	es,bx
		cmp	word ptr es:[si],0
		je	loc_1589		; Jump if equal
		cmp	word ptr es:[si],0FFFFh
		jne	loc_1590		; Jump if not equal
loc_1589:
		mov	byte ptr ds:[2F06h],1	; (94E8:2F06=17h)
loc_1590:
		mov	byte ptr ds:[42C5h],0	; (94E8:42C5=6Ch)
		pop	ax
loc_1591:
		mov	dx,2
		call	sub_84			; (7498)
		pushf				; Push flags
		cmp	byte ptr ds:[42B6h],0	; (A80C:42B6=0)
		je	loc_1595		; Jump if equal
		popf				; Pop flags
		pushf				; Push flags
		jnc	loc_1592		; Jump if carry=0
		test	byte ptr es:[di+7],20h	; ' '
		jz	loc_1592		; Jump if zero
		mov	byte ptr ds:[42B6h],0	; (A80C:42B6=0)
		jmp	short loc_1595		; (9717)
loc_1592:
		popf				; Pop flags
		pop	bx
		test	byte ptr ds:[2D8Ch],80h	; (A80C:2D8C=0)
		jnz	loc_1593		; Jump if not zero
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
loc_1593:
		cmp	byte ptr ds:[2A29h],1	; (A80C:2A29=0)
		jne	loc_1594		; Jump if not equal
		test	byte ptr ds:[2ECCh],8	; (A80C:2ECC=0)
		jz	loc_1594		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_1594:
		and	byte ptr ds:[42BFh],0FBh	; (A80C:42BF=0)
		jmp	loc_1638		; (9A7D)
loc_1595:
		cmp	byte ptr ds:[2639h],2	; (A80C:2639=0)
		jne	loc_1596		; Jump if not equal
		test	byte ptr ds:[430Bh],4	; (A80C:430B=0)
		jz	loc_1596		; Jump if zero
		mov	dx,2
		call	sub_134			; (AC34)
loc_1596:
		popf				; Pop flags
		pop	bx
		jc	loc_1597		; Jump if carry Set
		jmp	loc_1612		; (9834)
loc_1597:
		test	byte ptr es:[di+7],40h	; '@'
		jnz	loc_1599		; Jump if not zero
		cmp	byte ptr ds:[2D93h],2	; (8A50:2D93=0AEh)
		jb	loc_1601		; Jump if below
		ja	loc_1598		; Jump if above
		mov	si,30B1h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	byte ptr ds:[42C0h],0	; (8A50:42C0=4Dh)
		jmp	short loc_1601		; (9765)
loc_1598:
		mov	si,30B9h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		jmp	short loc_1600		; (9760)
loc_1599:
		mov	byte ptr ds:[42B9h],1	; (8A50:42B9=45h)
loc_1600:
		mov	byte ptr ds:[2A53h],2	; (8A50:2A53=0A4h)
loc_1601:
		cmp	byte ptr ds:[263Eh],1	; (8A50:263E=4Ch)
		jne	loc_1603		; Jump if not equal
		test	byte ptr es:[di+7],80h
		jnz	loc_1603		; Jump if not zero
		test	byte ptr es:[di+4],40h	; '@'
		jz	loc_1602		; Jump if zero
		test	byte ptr es:[di+7],40h	; '@'
		jnz	loc_1603		; Jump if not zero
		cmp	byte ptr ds:[263Dh],4	; (8A50:263D=41h)
		jbe	loc_1603		; Jump if below or =
		test	byte ptr es:[di+5],20h	; ' '
		jnz	loc_1603		; Jump if not zero
loc_1602:
		jmp	loc_1616		; (9898)
loc_1603:
		test	byte ptr es:[di+7],10h
		jz	loc_1610		; Jump if zero
		mov	ah,es:[di+4]
		and	ah,3Fh			; '?'
		mov	al,bh
		and	al,0F0h
		test	al,20h			; ' '
		jz	loc_1608		; Jump if zero
		mov	cx,es:[di+8]
		cmp	cx,0Ah
		jae	loc_1609		; Jump if above or =
		cmp	al,0F0h
		jne	loc_1604		; Jump if not equal
		mov	word ptr es:[di+8],8
		jmp	short loc_1607		; (97E5)
loc_1604:
		cmp	cx,8
		jae	loc_1609		; Jump if above or =
		cmp	al,0E0h
		jne	loc_1605		; Jump if not equal
		mov	word ptr es:[di+8],6
		jmp	short loc_1607		; (97E5)
loc_1605:
		cmp	cx,4
		jae	loc_1609		; Jump if above or =
		cmp	al,0B0h
		jne	loc_1606		; Jump if not equal
		mov	word ptr es:[di+8],4
		jmp	short loc_1607		; (97E5)
loc_1606:
		mov	word ptr es:[di+8],2
loc_1607:
		and	byte ptr es:[di+4],0C0h
		or	byte ptr es:[di+4],2
		jmp	short loc_1609		; (9800)
loc_1608:
		cmp	ah,1
		jne	loc_1609		; Jump if not equal
		cmp	al,50h			; 'P'
		jne	loc_1609		; Jump if not equal
		mov	word ptr es:[di+8],0Ah
loc_1609:
		jmp	loc_1620		; (98FF)
loc_1610:
		test	bh,20h			; ' '
		jnz	loc_1609		; Jump if not zero
		mov	cl,es:[di+4]
		and	cl,3Fh			; '?'
		cmp	cl,21h			; '!'
		jne	loc_1611		; Jump if not equal
		test	byte ptr es:[di+5],2
		jnz	loc_1611		; Jump if not zero
		cmp	word ptr es:[di+8],2
		jb	loc_1611		; Jump if below
		and	word ptr es:[di+8],0FFFEh
		and	byte ptr es:[di+4],0C0h
		or	byte ptr es:[di+4],22h	; '"'
loc_1611:
		jmp	loc_1620		; (98FF)
loc_1612:
		mov	di,472Bh
		mov	ax,word ptr ds:[3796h]	; (8A50:3796=5953h)
		mov	[di],ax
		mov	ax,word ptr ds:[37A4h]	; (8A50:37A4=5952h)
		mov	[di+2],ax
		mov	byte ptr [di+4],1
		mov	byte ptr [di+5],4
		cmp	byte ptr ds:[14ADh],1	; (8A50:14AD=0)
		ja	loc_1613		; Jump if above
		or	byte ptr [di+5],1
loc_1613:
		mov	word ptr [di+8],1
		mov	word ptr [di+6],0
		or	byte ptr [di+7],10h
		test	bh,20h			; ' '
		jz	loc_1615		; Jump if zero
		mov	word ptr [di+8],2
		mov	byte ptr [di+4],2
		test	byte ptr ds:[2ECAh],1	; (8A50:2ECA=4Fh)
		jnz	loc_1614		; Jump if not zero
		test	bh,10h
		jz	loc_1615		; Jump if zero
loc_1614:
		mov	word ptr [di+8],4
		mov	byte ptr [di+4],4
loc_1615:
		call	sub_124			; (9120)
		mov	di,word ptr es:[6]	; (A80C:0006=0)
		cmp	byte ptr ds:[263Eh],1	; (8A50:263E=4Ch)
		je	loc_1616		; Jump if equal
		jmp	loc_1636		; (9A36)
loc_1616:
		mov	byte ptr ds:[42B9h],1	; (8A50:42B9=45h)
		mov	byte ptr ds:[2A53h],2	; (8A50:2A53=0A4h)
		or	byte ptr ds:[42BFh],10h	; (8A50:42BF=0)
		and	byte ptr ds:[42BFh],0BFh	; (8A50:42BF=0)
		and	byte ptr es:[di+7],0EFh
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
		test	byte ptr ds:[2ECCh],8	; (8A50:2ECC=2Dh)
		jz	loc_1617		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
		jmp	short loc_1619		; (98E5)
loc_1617:
		mov	al,53h			; 'S'
;*		call	far ptr sub_208		;*(1548:0FA8)
		db	 9Ah,0A8h, 0Fh, 48h, 15h
		jc	loc_1618		; Jump if carry Set
		mov	al,44h			; 'D'
loc_1618:
		or	al,byte ptr ds:[2EB8h]	; (8A50:2EB8=0E2h)
		mov	ds:[bp],al
		inc	bp
		mov	ax,3A53h
		or	al,byte ptr ds:[2EB8h]	; (8A50:2EB8=0E2h)
		mov	ds:[bp],ax
		inc	bp
		inc	bp
loc_1619:
		mov	byte ptr ds:[bp],5Bh	; '['
		inc	bp
		mov	ax,es:[di+2]
		push	bx
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		pop	bx
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
		jmp	loc_1635		; (9A33)
loc_1620:
		cmp	byte ptr ds:[263Eh],1	; (8A50:263E=4Ch)
		jne	loc_1623		; Jump if not equal
		test	byte ptr es:[di+5],80h
		jnz	loc_1623		; Jump if not zero
		test	byte ptr es:[di+5],40h	; '@'
		jnz	loc_1623		; Jump if not zero
		test	byte ptr es:[di+7],80h
		jnz	loc_1623		; Jump if not zero
		mov	ax,es:[di]
		cmp	ax,word ptr ds:[2D82h]	; (8A50:2D82=300Ah)
		jb	loc_1622		; Jump if below
		ja	loc_1621		; Jump if above
		mov	ax,es:[di+2]
		cmp	ax,word ptr ds:[2D84h]	; (8A50:2D84=4F44h)
		jb	loc_1622		; Jump if below
loc_1621:
		call	sub_136			; (B1A8)
		jc	loc_1623		; Jump if carry Set
loc_1622:
		jmp	loc_1616		; (9898)
loc_1623:
		test	byte ptr es:[di+5],80h
		jnz	loc_1630		; Jump if not zero
		test	byte ptr ds:[2D8Ch],40h	; (8A50:2D8C=0Ah) '@'
		jz	loc_1624		; Jump if zero
		test	byte ptr es:[di+5],40h	; '@'
		jz	loc_1630		; Jump if zero
loc_1624:
		test	byte ptr es:[di+7],40h	; '@'
		jz	loc_1626		; Jump if zero
		test	byte ptr ds:[2D8Ch],80h	; (8A50:2D8C=0Ah)
		jnz	loc_1625		; Jump if not zero
		jmp	short loc_1630		; (999D)
loc_1625:
		jmp	short loc_1631		; (99A2)
loc_1626:
		test	bh,0C0h
		jz	loc_1631		; Jump if zero
		mov	al,es:[di+4]
		and	al,3Fh			; '?'
		mov	ah,bh
		and	ah,0F0h
		cmp	ah,40h			; '@'
		jne	loc_1627		; Jump if not equal
		cmp	al,1
		je	loc_1631		; Jump if equal
		cmp	al,21h			; '!'
		je	loc_1631		; Jump if equal
		jmp	short loc_1630		; (999D)
loc_1627:
		cmp	ah,0A0h
		jne	loc_1628		; Jump if not equal
		test	byte ptr ds:[2ECAh],1	; (8A50:2ECA=4Fh)
		jnz	loc_1629		; Jump if not zero
		cmp	al,2
		je	loc_1631		; Jump if equal
		cmp	al,22h			; '"'
		je	loc_1631		; Jump if equal
		jmp	short loc_1630		; (999D)
loc_1628:
		cmp	ah,0B0h
		jne	loc_1630		; Jump if not equal
loc_1629:
		cmp	al,4
		je	loc_1631		; Jump if equal
loc_1630:
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
loc_1631:
		cmp	byte ptr ds:[2A29h],1	; (8A50:2A29=0A0h)
		jne	loc_1633		; Jump if not equal
		test	byte ptr ds:[2ECCh],8	; (8A50:2ECC=2Dh)
		jz	loc_1632		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
		jmp	short loc_1633		; (99E4)
loc_1632:
		cmp	byte ptr ds:[2A26h],1	; (8A50:2A26=0ABh)
		je	loc_1633		; Jump if equal
		cmp	byte ptr ds:[2D93h],0	; (8A50:2D93=0AEh)
		jne	loc_1634		; Jump if not equal
;*		call	far ptr sub_208		;*(1548:0FA8)
		db	 9Ah,0A8h, 0Fh, 48h, 15h
		jnc	loc_1633		; Jump if carry=0
		mov	al,53h			; 'S'
		or	al,byte ptr ds:[2EB8h]	; (8A50:2EB8=0E2h)
		mov	ds:[bp],al
		inc	bp
		mov	ds:[bp],al
		inc	bp
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
		jmp	short loc_1634		; (9A21)
loc_1633:
		cmp	byte ptr ds:[2D93h],0	; (8A50:2D93=0AEh)
		jne	loc_1634		; Jump if not equal
		test	byte ptr es:[di+7],40h	; '@'
		jz	loc_1634		; Jump if zero
		cmp	byte ptr ds:[2F04h],90h	; (8A50:2F04=4Fh)
		jne	loc_1634		; Jump if not equal
		cmp	byte ptr ds:[263Eh],1	; (8A50:263E=4Ch)
		jne	loc_1634		; Jump if not equal
data_590	dd	0A89A53B0h		; Data table (indexed access)
;*		pop	cs			; Dangerous 8088 only
		db	0Fh
		dec	ax
		adc	ax,272h
		mov	al,44h			; 'D'
		or	al,byte ptr ds:[2EB8h]	; (8A50:2EB8=0E2h)
		mov	ds:[bp],al
		inc	bp
		mov	ax,3A53h
		or	al,byte ptr ds:[2EB8h]	; (8A50:2EB8=0E2h)
		mov	ds:[bp],ax
		inc	bp
		inc	bp
loc_1634:
		cmp	byte ptr ds:[263Eh],1	; (8A50:263E=4Ch)
		jne	loc_1636		; Jump if not equal
		mov	cx,0Ah
		call	sub_81			; (71AC)
		and	byte ptr ds:[42BFh],0BFh	; (8A50:42BF=0)
loc_1635:
		call	sub_88			; (7A28)
loc_1636:
		mov	word ptr ds:[2A8Fh],di	; (8A50:2A8F=0A9AEh)
		add	word ptr ds:[2A8Fh],4	; (8A50:2A8F=0A9AEh)
		cmp	byte ptr ds:[263Dh],6	; (8A50:263D=41h)
		jb	loc_1637		; Jump if below
		cmp	byte ptr ds:[2638h],4	; (8A50:2638=4Fh)
		jb	loc_1638		; Jump if below
loc_1637:
		mov	ax,word ptr ds:[2DA8h]	; (8A50:2DA8=0AFA0h)
		mov	word ptr ds:[2DACh],ax	; (8A50:2DAC=0A0AAh)
		mov	ax,word ptr ds:[2DAAh]	; (8A50:2DAA=0E1E3h)
		mov	word ptr ds:[2DAEh],ax	; (8A50:2DAE=0ECE2h)
		mov	ax,word ptr ds:[2DA4h]	; (8A50:2DA4=0EFE1h)
		mov	word ptr ds:[2DA8h],ax	; (8A50:2DA8=0AFA0h)
		mov	ax,word ptr ds:[2DA6h]	; (8A50:2DA6=0A720h)
		mov	word ptr ds:[2DAAh],ax	; (8A50:2DAA=0E1E3h)
		mov	ax,word ptr ds:[37A2h]	; (8A50:37A2=544Eh)
		mov	word ptr ds:[2DA4h],ax	; (8A50:2DA4=0EFE1h)
		mov	ax,word ptr ds:[37A4h]	; (8A50:37A4=5952h)
		mov	word ptr ds:[2DA6h],ax	; (8A50:2DA6=0A720h)
		cmp	byte ptr ds:[263Eh],1	; (8A50:263E=4Ch)
		je	loc_1638		; Jump if equal
		or	byte ptr es:[di+4],40h	; '@'
loc_1638:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1639		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1639		; Jump if equal
		call	sub_115			; (83A4)
loc_1639:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	si
		pop	dx
		pop	bx
		retn
sub_127		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_128		proc	near
		push	ax
		push	dx
		push	si
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	cx
		mov	byte ptr ds:[42B9h],0	; (020C:42B9=80h)
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		je	loc_1640		; Jump if equal
		mov	dx,1
		jmp	short loc_1641		; (9AC3)
loc_1640:
		mov	dx,4
loc_1641:
		mov	di,0
		cmp	byte ptr ds:[2639h],2	; (020C:2639=95h)
		jne	loc_1645		; Jump if not equal
		cmp	dx,4
		je	loc_1643		; Jump if equal
		test	data_507,2		; (020C:430B=72h)
		jz	loc_1645		; Jump if zero
		test	data_507,80h		; (020C:430B=72h)
		jz	loc_1644		; Jump if zero
		cmp	bx,data_354		; (020C:2D82=4152h)
		jne	loc_1644		; Jump if not equal
		push	dx
		mov	dx,data_355		; (020C:2D84=4C4Ch)
		sub	dx,ax
		jnc	loc_1642		; Jump if carry=0
		not	dx
loc_1642:
		cmp	dx,80h
		pop	dx
		jc	loc_1645		; Jump if carry Set
		jmp	short loc_1644		; (9B01)
loc_1643:
		test	data_507,1		; (020C:430B=72h)
		jz	loc_1645		; Jump if zero
loc_1644:
		call	sub_134			; (AC34)
loc_1645:
		call	sub_84			; (7498)
		jnc	loc_1646		; Jump if carry=0
		jmp	loc_1661		; (9C27)
loc_1646:
		cmp	word ptr ds:[2A84h],0	; (A80C:2A84=0)
		jne	loc_1649		; Jump if not equal
		push	es
		push	di
		push	ax
		mov	es,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	di,word ptr ds:[2D84h]	; (A80C:2D84=0)
		cmp	byte ptr es:[di],0EBh
		jne	loc_1648		; Jump if not equal
		sub	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		cmp	ax,3
		ja	loc_1648		; Jump if above
		cmp	ax,2
		je	loc_1647		; Jump if equal
		cmp	byte ptr es:[di+2],90h
		je	loc_1647		; Jump if equal
		jmp	short loc_1648		; (9B45)
loc_1647:
		pop	ax
		pop	di
		pop	es
		mov	byte ptr ds:[2A75h],0F5h	; (A80C:2A75=0)
		jmp	short loc_1652		; (9B8C)
loc_1648:
		pop	ax
		pop	di
		pop	es
loc_1649:
		cmp	byte ptr ds:[263Eh],1	; (A80C:263E=0)
		je	loc_1652		; Jump if equal
		mov	di,472Bh
		mov	ax,word ptr ds:[37A2h]	; (A80C:37A2=0)
		mov	[di],ax
		mov	ax,word ptr ds:[37A4h]	; (A80C:37A4=0)
		mov	[di+2],ax
		xor	cl,cl			; Zero register
		cmp	byte ptr ds:[2A75h],4Fh	; (A80C:2A75=0) 'O'
		je	loc_1650		; Jump if equal
		jmp	loc_1658		; (9BFE)
loc_1650:
		mov	byte ptr [di+4],0
		mov	byte ptr [di+5],8
		cmp	byte ptr ds:[14ADh],1	; (A80C:14AD=0)
		ja	loc_1651		; Jump if above
		mov	byte ptr [di+5],9
loc_1651:
		mov	byte ptr [di+6],0
		mov	byte ptr [di+32h],0
		mov	word ptr [di+7],0
		jmp	loc_1660		; (9C15)
loc_1652:
		mov	ax,word ptr ds:[37A4h]	; (A80C:37A4=0)
		sub	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		mov	word ptr ds:[2ED0h],ax	; (A80C:2ED0=0)
		mov	word ptr ds:[2ED2h],0	; (A80C:2ED2=0)
		mov	byte ptr ds:[bp],24h	; '$'
		inc	bp
		call	sub_143			; (B768)
		mov	byte ptr ds:[42B9h],1	; (020C:42B9=80h)
		mov	ax,data_430		; (020C:37A4=0B8h)
		sub	ax,data_307		; (020C:2A40=0A8E0h)
		cmp	ax,0Fh
		ja	loc_1653		; Jump if above
		jmp	short loc_1654		; (9BBC)
loc_1653:
		pop	cx
		jmp	loc_1688		; (9E3B)
loc_1654:
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		je	loc_1657		; Jump if equal
		mov	ax,data_354		; (020C:2D82=4152h)
		cmp	ax,word ptr ds:[37A2h]	; (020C:37A2=1548h)
		jne	loc_1657		; Jump if not equal
		mov	ax,data_430		; (020C:37A4=0B8h)
		cmp	ax,10h
		jbe	loc_1655		; Jump if below or =
		sub	ax,10h
loc_1655:
		cmp	ax,data_307		; (020C:2A40=0A8E0h)
		jae	loc_1657		; Jump if above or =
		mov	ax,data_430		; (020C:37A4=0B8h)
		cmp	ax,word ptr ds:[2E7Fh]	; (020C:2E7F=4552h)
		jbe	loc_1657		; Jump if below or =
		cmp	ax,280h
		jbe	loc_1656		; Jump if below or =
		sub	ax,280h
		cmp	ax,data_355		; (020C:2D84=4C4Ch)
		ja	loc_1657		; Jump if above
		mov	ax,data_430		; (020C:37A4=0B8h)
loc_1656:
		mov	word ptr ds:[2E7Fh],ax	; (020C:2E7F=4552h)
loc_1657:
		pop	cx
		jmp	loc_1688		; (9E3B)
loc_1658:
		mov	byte ptr [di+4],0
		mov	byte ptr [di+5],0
		cmp	data_169,1		; (020C:14AD=0)
		ja	loc_1659		; Jump if above
		mov	byte ptr [di+5],1
loc_1659:
		mov	byte ptr [di+6],0
loc_1660:
		call	sub_124			; (9120)
		mov	di,word ptr es:[6]	; (A80C:0006=0)
		mov	word ptr ds:[42BCh],di	; (020C:42BC=0D3C8h)
		call	sub_66			; (6C9C)
		jmp	loc_1670		; (9CD7)
loc_1661:
		mov	word ptr ds:[42BCh],di	; (020C:42BC=0D3C8h)
		test	byte ptr es:[di+5],80h
		jz	loc_1662		; Jump if zero
		mov	data_376,1		; (020C:2EB7=4Fh)
		mov	data_469,1		; (020C:42B7=55h)
loc_1662:
		mov	cx,3Bh
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		je	loc_1665		; Jump if equal
		mov	cx,7
		mov	ax,data_354		; (020C:2D82=4152h)
		cmp	ax,word ptr ds:[37A2h]	; (020C:37A2=1548h)
		jne	loc_1665		; Jump if not equal
		mov	ax,data_430		; (020C:37A4=0B8h)
		cmp	ax,10h
		jbe	loc_1663		; Jump if below or =
		sub	ax,10h
loc_1663:
		cmp	ax,data_307		; (020C:2A40=0A8E0h)
		jae	loc_1665		; Jump if above or =
		mov	ax,data_430		; (020C:37A4=0B8h)
		cmp	ax,word ptr ds:[2E7Fh]	; (020C:2E7F=4552h)
		jbe	loc_1665		; Jump if below or =
		cmp	ax,280h
		jbe	loc_1664		; Jump if below or =
		sub	ax,280h
		cmp	ax,data_355		; (020C:2D84=4C4Ch)
		ja	loc_1665		; Jump if above
		mov	ax,data_430		; (020C:37A4=0B8h)
loc_1664:
		mov	word ptr ds:[2E7Fh],ax	; (020C:2E7F=4552h)
loc_1665:
		cmp	data_234,1		; (020C:263E=10h)
		jne	loc_1670		; Jump if not equal
		cmp	byte ptr ds:[3BEAh],1	; (020C:3BEA=6)
		jne	loc_1668		; Jump if not equal
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		je	loc_1666		; Jump if equal
		mov	al,es:[di+5]
		and	al,30h			; '0'
		cmp	al,30h			; '0'
		jne	loc_1668		; Jump if not equal
		jmp	short loc_1667		; (9CA8)
loc_1666:
		test	byte ptr es:[di+4],80h
		jz	loc_1668		; Jump if zero
loc_1667:
		mov	si,3091h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_1668:
		call	sub_81			; (71AC)
		cmp	bp,27CAh
		jb	loc_1670		; Jump if below
		cmp	bp,2853h
		jae	loc_1670		; Jump if above or =
		cmp	byte ptr ds:[282Ch],28h	; (020C:282C=0AEh) '('
		je	loc_1670		; Jump if equal
		test	data_169,2		; (020C:14AD=0)
		jz	loc_1669		; Jump if zero
		test	byte ptr es:[di+5],2
		jz	loc_1670		; Jump if zero
loc_1669:
		call	sub_131			; (A8A8)
loc_1670:
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		je	loc_1671		; Jump if equal
		jmp	loc_1682		; (9DC8)
loc_1671:
		pop	cx
		push	cx
		test	cl,2
		jz	loc_1673		; Jump if zero
		mov	al,es:[di+4]
		and	al,7
		jz	loc_1672		; Jump if zero
		jmp	loc_1682		; (9DC8)
loc_1672:
		jmp	loc_1678		; (9D8C)
loc_1673:
		test	byte ptr es:[di+4],18h
		jnz	loc_1675		; Jump if not zero
		test	data_480,400h		; (020C:42CC=0D323h)
		jz	loc_1674		; Jump if zero
		jmp	loc_1678		; (9D8C)
loc_1674:
		cmp	byte ptr data_346+4,1	; (020C:2C40=41h)
		je	loc_1678		; Jump if equal
loc_1675:
		mov	ax,es:[di]
		mov	data_364,ax		; (020C:2D94=575Ch)
		mov	ax,es:[di+2]
		mov	data_365,ax		; (020C:2D96=4E49h)
		or	data_359,2		; (020C:2D8D=49h)
		mov	data_367,0FFFFh		; (020C:2DB2=5C3Ah)
		mov	al,es:[di+32h]
		and	al,38h			; '8'
		cmp	al,38h			; '8'
		jne	loc_1678		; Jump if not equal
		test	byte ptr es:[di+5],20h	; ' '
		jz	loc_1676		; Jump if zero
		mov	byte ptr ds:[47B4h],1	; (020C:47B4=1)
loc_1676:
		mov	data_359,5		; (020C:2D8D=49h)
		cmp	data_234,1		; (020C:263E=10h)
		jne	loc_1678		; Jump if not equal
		push	cx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		push	bp
		call	sub_89			; (7B44)
		mov	di,bp
		pop	bp
		mov	si,3760h
		mov	cx,3778h
		sub	cx,375Eh
		sub	cx,2
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1677		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1677		; Jump if equal
		call	sub_115			; (83A4)
loc_1677:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	cx
loc_1678:
		mov	al,es:[di+4]
		test	al,1
		jz	loc_1679		; Jump if zero
		test	al,2
		jnz	loc_1680		; Jump if not zero
loc_1679:
		or	al,3
		mov	es:[di+4],al
		push	di
		add	di,9
		mov	si,2ED4h
		mov	cx,29h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	di
loc_1680:
		mov	al,es:[di+32h]
		test	al,80h
		jz	loc_1681		; Jump if zero
		mov	cx,es:[di+33h]
		mov	word ptr ds:[2EF4h],cx	; (94E8:2EF4=6FFh)
loc_1681:
		test	al,40h			; '@'
		jz	loc_1682		; Jump if zero
		mov	cx,es:[di+35h]
		mov	word ptr ds:[2EF2h],cx	; (94E8:2EF2=35EBh)
loc_1682:
		cmp	byte ptr ds:[263Dh],6	; (94E8:263D=86h)
		jb	loc_1683		; Jump if below
		cmp	byte ptr ds:[2638h],4	; (94E8:2638=0)
		jb	loc_1685		; Jump if below
loc_1683:
		cmp	byte ptr ds:[2A75h],4Fh	; (94E8:2A75=75h) 'O'
		je	loc_1684		; Jump if equal
		test	byte ptr es:[di+4],20h	; ' '
		jnz	loc_1685		; Jump if not zero
loc_1684:
		or	byte ptr es:[di+4],40h	; '@'
loc_1685:
		pop	cx
		cmp	byte ptr ds:[2A75h],4Fh	; (94E8:2A75=75h) 'O'
		jne	loc_1686		; Jump if not equal
		test	cl,1
		jz	loc_1688		; Jump if zero
		or	byte ptr es:[di+4],80h
		jmp	short loc_1688		; (9E3B)
loc_1686:
		test	cl,4
		jnz	loc_1687		; Jump if not zero
		mov	ax,word ptr ds:[2D9Ch]	; (94E8:2D9C=8F33h)
		mov	word ptr ds:[2DA0h],ax	; (94E8:2DA0=736h)
		mov	ax,word ptr ds:[2D9Eh]	; (94E8:2D9E=0DAE8h)
		mov	word ptr ds:[2DA2h],ax	; (94E8:2DA2=0DD8Bh)
		mov	ax,word ptr ds:[2D98h]	; (94E8:2D98=430Eh)
		mov	word ptr ds:[2D9Ch],ax	; (94E8:2D9C=8F33h)
		mov	ax,word ptr ds:[2D9Ah]	; (94E8:2D9A=0BA8Fh)
		mov	word ptr ds:[2D9Eh],ax	; (94E8:2D9E=0DAE8h)
loc_1687:
		mov	ax,word ptr ds:[37A2h]	; (94E8:37A2=753Ah)
		mov	word ptr ds:[2D98h],ax	; (94E8:2D98=430Eh)
		mov	ax,word ptr ds:[37A4h]	; (94E8:37A4=8A12h)
		mov	word ptr ds:[2D9Ah],ax	; (94E8:2D9A=0BA8Fh)
		mov	word ptr ds:[42BAh],di	; (94E8:42BA=5706h)
		test	cl,8
		jz	loc_1688		; Jump if zero
		test	byte ptr es:[di+5],2
		jnz	loc_1688		; Jump if not zero
		mov	byte ptr es:[di+6],0FFh
loc_1688:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1689		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1689		; Jump if equal
		call	sub_115			; (83A4)
loc_1689:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	si
		pop	dx
		pop	ax
		retn
sub_128		endp
  
		add	[bx+si],al
		add	[bx+si],al
		add	data_676[si],dh		; (020C:E804=3)
		out	dx,ax			; port 0, DMA-1 bas&add ch 0
		int	0E8h
		test	cl,dl
		call	sub_109			; (80CE)
		call	sub_113			; (80E9)
		cmp	word ptr ds:[2A22h],0	; (94E8:2A22=0BB9h)
		je	loc_1690		; Jump if equal
		mov	ax,word ptr ds:[2A22h]	; (94E8:2A22=0BB9h)
loc_1690:
		mov	word ptr ds:[2A24h],ax	; (94E8:2A24=0F300h)
		call	sub_137			; (B20C)
		mov	ax,word ptr ds:[278Fh]	; (94E8:278F=0DEBh)
		cmp	ax,0
		jne	loc_1691		; Jump if not equal
		cmp	word ptr ds:[278Dh],0	; (94E8:278D=8)
		jne	loc_1691		; Jump if not equal
		mov	ax,2
		jmp	loc_1768		; (A76C)
loc_1691:
		mov	bx,ax
		and	bx,0FFF0h
		mov	byte ptr ds:[1C42h],41h	; (94E8:1C42=0D3h) 'A'
		jz	loc_1692		; Jump if zero
		jmp	short loc_1695		; (9F1C)
loc_1692:
		mov	cl,0Ch
		shl	ax,cl			; Shift w/zeros fill
		mov	bx,word ptr ds:[278Dh]	; (94E8:278D=8)
		mov	cl,4
		shr	bx,cl			; Shift w/zeros fill
		add	bx,ax
		inc	bx
		inc	bx
		cmp	bx,1
		mov	byte ptr ds:[1C42h],42h	; (94E8:1C42=0D3h) 'B'
		jbe	loc_1695		; Jump if below or =
		mov	dx,bx
		call	sub_113			; (80E9)
		cmp	word ptr ds:[2A22h],0	; (94E8:2A22=0BB9h)
		je	loc_1693		; Jump if equal
		mov	ax,word ptr ds:[2A22h]	; (94E8:2A22=0BB9h)
loc_1693:
		mov	cx,cs
		sub	ax,cx
		mov	cx,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		sub	cx,ax
		jc	loc_1695		; Jump if carry Set
		sub	cx,20h
		jc	loc_1695		; Jump if carry Set
		cmp	cx,dx
		jbe	loc_1695		; Jump if below or =
		cmp	word ptr ds:[2A22h],0	; (94E8:2A22=0BB9h)
		jne	loc_1696		; Jump if not equal
		mov	ax,0FFFFh
		sub	ax,1064h
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		shr	ax,1			; Shift w/zeros fill
		sub	cx,dx
		cmp	cx,ax
		jae	loc_1694		; Jump if above or =
		mov	ax,cx
loc_1694:
		add	word ptr ds:[2A24h],ax	; (94E8:2A24=0F300h)
		call	sub_112			; (80E6)
		mov	bx,ax
		mov	ax,word ptr ds:[2A24h]	; (94E8:2A24=0F300h)
		sub	ax,bx
		shl	ax,1			; Shift w/zeros fill
		shl	ax,1			; Shift w/zeros fill
		shl	ax,1			; Shift w/zeros fill
		shl	ax,1			; Shift w/zeros fill
		dec	ax
		mov	word ptr ds:[430Eh],ax	; (94E8:430E=83EBh)
		jmp	short loc_1696		; (9F22)
loc_1695:
		mov	ax,8
		jmp	loc_1768		; (A76C)
loc_1696:
		mov	bx,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		mov	es,word ptr ds:[48E1h]	; (94E8:48E1=0E810h)
		mov	ah,4Ah			; 'J'
		int	21h			; DOS Services  ah=function 4Ah
						;  change mem allocation, bx=siz
		jnc	loc_1697		; Jump if carry=0
		mov	byte ptr ds:[1C42h],44h	; (94E8:1C42=0D3h) 'D'
		jmp	short loc_1695		; (9F1C)
loc_1697:
		mov	ax,cs
		add	ax,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		sub	ax,10h
		mov	dx,ax
		mov	ax,word ptr ds:[2A24h]	; (94E8:2A24=0F300h)
		mov	es,ax
		sub	dx,ax
loc_1698:
		mov	ax,dx
		and	ax,0F000h
		jz	loc_1699		; Jump if zero
		sub	dx,1000h
		mov	cx,8000h
		xor	di,di			; Zero register
		xor	ax,ax			; Zero register
		cld				; Clear direction
		rep	stosw			; Rep when cx >0 Store ax to es:[di]
		mov	ax,es
		add	ax,1000h
		mov	es,ax
		jmp	short loc_1698		; (9F49)
loc_1699:
		mov	cl,3
		shl	dx,cl			; Shift w/zeros fill
		mov	cx,dx
		xor	di,di			; Zero register
		xor	ax,ax			; Zero register
		cld				; Clear direction
		rep	stosw			; Rep when cx >0 Store ax to es:[di]
		mov	word ptr ds:[263Bh],40h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		call	sub_109			; (80CE)
		mov	ax,word ptr ds:[2A24h]	; (94E8:2A24=0F300h)
		add	ax,10h
		mov	word ptr ds:[26D6h],ax	; (94E8:26D6=0E800h)
		mov	word ptr ds:[26D8h],0	; (94E8:26D8=20Ah)
		cmp	byte ptr ds:[2C3Fh],3	; (94E8:2C3F=3)
		jne	loc_1700		; Jump if not equal
		mov	word ptr ds:[26D8h],ax	; (94E8:26D8=20Ah)
loc_1700:
		cli				; Disable interrupts
		mov	cs:data_560,ss		; (020C:6952=8008h)
		mov	cs:data_559,sp		; (020C:6950=46B9h)
		mov	sp,258h
		sti				; Enable interrupts
		mov	dx,2BB2h
		mov	bx,26D6h
		mov	al,3
		mov	ah,4Bh			; 'K'
		int	21h			; DOS Services  ah=function 4Bh
						;  run progm @ds:dx, parm @es:bx
		cli				; Disable interrupts
		mov	ss,cs:data_560		; (020C:6952=8008h)
		mov	sp,cs:data_559		; (020C:6950=46B9h)
		sti				; Enable interrupts
		pushf				; Push flags
		call	sub_109			; (80CE)
		call	sub_104			; (80B9)
		popf				; Pop flags
		jnc	loc_1701		; Jump if carry=0
		mov	byte ptr ds:[1C42h],45h	; (94E8:1C42=0D3h) 'E'
		jmp	loc_1768		; (A76C)
loc_1701:
		mov	word ptr ds:[263Bh],41h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	byte ptr ds:[48DDh],1	; (94E8:48DD=14h)
		mov	ax,word ptr ds:[2A24h]	; (94E8:2A24=0F300h)
		add	ax,10h
		mov	word ptr ds:[2A20h],ax	; (94E8:2A20=0AAC0h)
		cmp	byte ptr ds:[2A1Eh],3	; (94E8:2A1E=9Ah)
		je	loc_1702		; Jump if equal
		cmp	byte ptr ds:[2A2Bh],0	; (94E8:2A2B=0Ah)
		je	loc_1703		; Jump if equal
		call	sub_106			; (80C5)
		mov	byte ptr ds:[2A2Bh],0	; (94E8:2A2B=0Ah)
		mov	byte ptr ds:[2A26h],0	; (94E8:2A26=0A4h)
		mov	di,0
		mov	cx,1482h
		mov	al,0FFh
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		jmp	short loc_1703		; (A018)
loc_1702:
		jmp	loc_1760		; (A66E)
loc_1703:
		mov	bx,0
		cmp	byte ptr ds:[2C3Fh],3	; (94E8:2C3F=3)
		jne	loc_1704		; Jump if not equal
		jmp	loc_1712		; (A103)
loc_1704:
		call	sub_110			; (80D1)
		cmp	byte ptr es:[0BE3h],0E9h	; (0300:0BE3=0A5h)
		jne	loc_1705		; Jump if not equal
		mov	si,3BDAh
		mov	di,0BE6h
		mov	cx,3BE9h
		sub	cx,3BDAh
		cld				; Clear direction
		repe	cmpsb			; Rep zf=1+cx >0 Cmp [si] to es:[di]
		cmp	cx,0
		jne	loc_1705		; Jump if not equal
		push	bx
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	al,byte ptr ds:[11E8h]	; (94E8:11E8=0)
		mov	[bx+52h],al
		mov	ah,2Dh			; '-'
		call	sub_65			; (6C58)
;*		call	sub_56			;*(68F0)
		db	0E8h, 98h,0C8h
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	byte ptr [bx+52h],0Fh
		pop	bx
		mov	byte ptr ds:[3BE9h],1	; (94E8:3BE9=0)
loc_1705:
		mov	word ptr ds:[2A1Ah],2	; (94E8:2A1A=0C307h)
		cmp	byte ptr ds:[2C40h],2	; (94E8:2C40=0)
		je	loc_1706		; Jump if equal
		cmp	byte ptr ds:[2C40h],4	; (94E8:2C40=0)
		je	loc_1706		; Jump if equal
		cmp	byte ptr ds:[2C40h],5	; (94E8:2C40=0)
		jne	loc_1707		; Jump if not equal
loc_1706:
;*		call	far ptr sub_221		;*(1548:1294)
		db	 9Ah, 94h, 12h, 48h, 15h
		jnc	loc_1707		; Jump if carry=0
		mov	byte ptr ds:[2C40h],5	; (94E8:2C40=0)
;*		call	far ptr sub_199		;*(1548:066C)
		db	 9Ah, 6Ch, 06h, 48h, 15h
		mov	word ptr ds:[2A1Ah],0Ah	; (94E8:2A1A=0C307h)
loc_1707:
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		cmp	byte ptr ds:[2C40h],2	; (94E8:2C40=0)
		jne	loc_1708		; Jump if not equal
		sub	ax,10h
data_594	dw	20A3h
		sub	ch,al
		adc	ax,26E0h
		mov	[bx],ax
		mov	es:[bx+6],ax
		mov	es:[bx+8],ax
		mov	byte ptr es:[bx+0Eh],0
		mov	word ptr ds:[2A4Ch],ax	; (94E8:2A4C=0E0D3h)
		xor	ax,ax			; Zero register
		cmp	byte ptr ds:[2C40h],2	; (94E8:2C40=0)
		jne	loc_1709		; Jump if not equal
		mov	ax,100h
		mov	word ptr ds:[2A1Ah],102h	; (94E8:2A1A=0C307h)
loc_1709:
		mov	es:[bx+2],ax
		cmp	word ptr ds:[278Fh],0	; (94E8:278F=0DEBh)
		jne	loc_1711		; Jump if not equal
data_595	dw	603h
		lea	sp,[bx]			; Load effective addr
		cmp	word ptr ds:[278Dh],0	; (94E8:278D=8)
		jne	loc_1710		; Jump if not equal
		mov	ax,2
		jmp	loc_1768		; (A76C)
loc_1710:
		dec	ax
loc_1711:
		mov	es:[bx+4],ax
		mov	word ptr es:[bx+0Ah],0
		inc	byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		jmp	loc_1760		; (A66E)
loc_1712:
		mov	word ptr ds:[263Bh],42h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	di,bx
		mov	word ptr ds:[2A1Ah],2	; (94E8:2A1A=0C307h)
;*		call	far ptr sub_221		;*(1548:1294)
		db	 9Ah, 94h, 12h, 48h, 15h
		jnc	loc_1713		; Jump if carry=0
		mov	byte ptr ds:[2C40h],5	; (94E8:2C40=0)
		mov	byte ptr ds:[1422h],1	; (94E8:1422=26h)
;*		call	far ptr sub_199		;*(1548:066C)
		db	 9Ah, 6Ch, 06h, 48h, 15h
loc_1713:
		call	sub_110			; (80D1)
		cmp	word ptr es:[0BE3h],5A4Dh	; (0300:0BE3=0AFA5h)
		je	loc_1714		; Jump if equal
		mov	ax,14h
		jmp	loc_1768		; (A76C)
loc_1714:
		xor	ax,ax			; Zero register
		cmp	word ptr es:[0BE9h],ax	; (0300:0BE9=0A8ADh)
		jne	loc_1718		; Jump if not equal
		cmp	word ptr es:[0BEDh],ax	; (0300:0BED=0ADA2h)
		je	loc_1718		; Jump if equal
		cmp	word ptr es:[0BF7h],100h	; (0300:0BF7=20AEh)
		ja	loc_1715		; Jump if above
		cmp	word ptr es:[0BF9h],ax	; (0300:0BF9=0E2E1h)
		je	loc_1718		; Jump if equal
loc_1715:
		mov	bx,word ptr es:[0BF7h]	; (0300:0BF7=20AEh)
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		add	ax,word ptr es:[0BF9h]	; (0300:0BF9=0E2E1h)
		push	es
		mov	es,ax
		cmp	word ptr es:[bx-2],4252h
		pop	es
		jz	loc_1716		; Jump if zero
		cmp	bx,10h
		jne	loc_1718		; Jump if not equal
		push	es
		mov	es,ax
		cmp	word ptr es:[0B8h][bx],2EFBh	; (8DA1:00B8=2020h)
data_599	dw	7507h, 634h
data_600	dw	0C08Eh, 8126h
data_601	dw	0BABFh, 0FF00h
		das				; Decimal adjust
		pop	es
		jnz	loc_1718		; Jump if not zero
loc_1716:
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	al,byte ptr ds:[11E8h]	; (94E8:11E8=0)
		mov	[bx+52h],al
		mov	ah,21h			; '!'
		call	sub_65			; (6C58)
;*		call	sub_56			;*(68F0)
		db	0E8h, 48h,0C7h
		test	word ptr ds:[2EC4h],4	; (94E8:2EC4=8BA4h)
		jnz	loc_1717		; Jump if not zero
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
loc_1717:
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	byte ptr [bx+52h],0Fh
loc_1718:
		mov	word ptr ds:[263Bh],43h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	ax,word ptr es:[0BE9h]	; (0300:0BE9=0A8ADh)
		mov	word ptr ds:[38AFh],ax	; (94E8:38AF=753Dh)
		cmp	ax,2243h
		jbe	loc_1719		; Jump if below or =
		mov	ax,2243h
loc_1719:
		mov	word ptr ds:[38B1h],ax	; (94E8:38B1=0C3E2h)
		mov	ax,word ptr es:[0BF1h]	; (0300:0BF1=0A5E0h)
		mov	bx,word ptr es:[0BF3h]	; (0300:0BF3=0ADADh)
		call	sub_106			; (80C5)
		or	ax,ax			; Zero ?
		jnz	loc_1720		; Jump if not zero
		or	bx,bx			; Zero ?
		jz	loc_1721		; Jump if zero
loc_1720:
		mov	byte ptr ds:[2A26h],1	; (94E8:2A26=0A4h)
		add	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		mov	es:[di],ax
		mov	word ptr ds:[2A27h],ax	; (94E8:2A27=0AAACh)
		mov	word ptr ds:[2A4Ch],ax	; (94E8:2A4C=0E0D3h)
		mov	word ptr es:[di+2],0
		dec	bx
		mov	es:[di+4],bx
		mov	word ptr ds:[2A4Ah],bx	; (94E8:2A4A=1)
		mov	word ptr es:[di+0Ah],3
		mov	byte ptr es:[di+0Eh],0
		inc	byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
loc_1721:
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		cmp	byte ptr ds:[2A26h],1	; (94E8:2A26=0A4h)
		jne	loc_1722		; Jump if not equal
		cmp	ax,es:[di]
		je	loc_1725		; Jump if equal
data_603	db	83h
		db	0C7h
		adc	ax,0D88Bh
		sub	bx,10h
		cmp	bx,word ptr ds:[2A27h]	; (94E8:2A27=0AAACh)
		je	loc_1723		; Jump if equal
		mov	es:[di+6],bx
		mov	es:[di+8],bx
		mov	byte ptr es:[di+0Eh],0
		test	word ptr ds:[42CCh],1000h	; (94E8:42CC=71Fh)
		jz	loc_1724		; Jump if zero
loc_1723:
		mov	es:[di+6],ax
		mov	es:[di+8],ax
loc_1724:
		mov	es:[di],ax
		mov	word ptr es:[di+2],0
		mov	word ptr es:[di+0Ah],0
		mov	byte ptr es:[di+0Eh],0
		inc	byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
loc_1725:
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		mov	bx,ax
		xor	ax,ax			; Zero register
		call	sub_110			; (80D1)
		add	bx,word ptr es:[0BF9h]	; (0300:0BF9=0E2E1h)
		mov	dx,10h
		call	sub_84			; (7498)
		jc	loc_1726		; Jump if carry Set
		mov	es:[di],bx
		xor	ax,ax			; Zero register
		mov	es:[di+2],ax
		mov	es:[di+4],ax
		mov	es:[di+0Ah],ax
		mov	byte ptr es:[di+0Eh],0
		mov	ax,word ptr ds:[2A20h]	; (A80C:2A20=0)
		sub	ax,10h
		mov	es:[di+6],ax
		mov	es:[di+8],ax
		inc	byte ptr ds:[2A2Bh]	; (A80C:2A2B=0)
		test	word ptr ds:[42CCh],1000h	; (A80C:42CC=0)
		jz	loc_1726		; Jump if zero
		mov	es:[di+6],bx
		mov	es:[di+6],bx
loc_1726:
		mov	word ptr ds:[263Bh],44h	; (A80C:263B=0)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		call	sub_110			; (80D1)
		mov	bp,word ptr es:[0BFBh]	; (94E8:0BFB=19Ch)
		add	bp,0BE3h
		mov	si,word ptr es:[0BE7h]	; (94E8:0BE7=0FDFFh)
		mov	cl,5
		shl	si,cl			; Shift w/zeros fill
		mov	ax,word ptr es:[0BE5h]	; (94E8:0BE5=314h)
		mov	cl,4
		shr	ax,cl			; Shift w/zeros fill
		add	si,ax
		sub	si,1Fh
		sub	si,word ptr es:[0BEBh]	; (94E8:0BEB=0EB1Fh)
		add	si,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
loc_1727:
		cmp	word ptr ds:[38AFh],0	; (94E8:38AF=753Dh)
		jne	loc_1728		; Jump if not equal
		jmp	loc_1734		; (A394)
loc_1728:
		call	sub_110			; (80D1)
		mov	bx,es:[bp]
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		add	ax,es:[bp+2]
		mov	es,ax
		mov	bx,es:[bx]
		cmp	bx,si
		jb	loc_1729		; Jump if below
		jmp	short loc_1730		; (A349)
loc_1729:
		xor	ax,ax			; Zero register
		mov	dx,10h
		call	sub_84			; (7498)
		jc	loc_1730		; Jump if carry Set
		mov	es:[di],bx
		mov	es:[di+2],ax
		mov	es:[di+4],ax
		mov	es:[di+6],bx
		mov	es:[di+8],bx
		mov	es:[di+0Ah],ax
		mov	byte ptr es:[di+0Eh],0
		inc	byte ptr ds:[2A2Bh]	; (A80C:2A2B=0)
		cmp	byte ptr ds:[2A2Bh],0FAh	; (A80C:2A2B=0)
		jae	loc_1734		; Jump if above or =
loc_1730:
		add	bp,4
		cmp	bp,1060h
		jb	loc_1733		; Jump if below
		mov	bx,1063h
		sub	bx,bp
		or	bx,bx			; Zero ?
		jz	loc_1731		; Jump if zero
		mov	cx,0FFFFh
		xor	dx,dx			; Zero register
		sub	dx,bx
		mov	ax,4201h
		mov	bx,word ptr ds:[37ECh]	; (A80C:37EC=0)
		int	21h			; DOS Services  ah=function 42h
						;  move file ptr, cx,dx=offset
loc_1731:
		mov	cx,1063h
		sub	cx,0C63h
		mov	dx,0C63h
		mov	bx,word ptr ds:[37ECh]	; (A80C:37EC=0)
		call	sub_105			; (80BC)
		mov	ah,3Fh			; '?'
		int	21h			; DOS Services  ah=function 3Fh
						;  read file, cx=bytes, to ds:dx
		call	sub_104			; (80B9)
		jnc	loc_1732		; Jump if carry=0
		mov	bl,0Eh
		jmp	loc_1768		; (A76C)
loc_1732:
		mov	bp,0C63h
loc_1733:
		dec	word ptr ds:[38AFh]	; (A80C:38AF=0)
		jmp	loc_1727		; (A2F5)
loc_1734:
		mov	word ptr ds:[263Bh],45h	; (A80C:263B=0)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
;*		call	sub_31			;*(2C50)
		db	0E8h,0AEh, 88h
		mov	dx,15h
		mov	ax,dx
		mov	bl,byte ptr ds:[2A2Bh]	; (A80C:2A2B=0)
		dec	bl
		mul	bl			; ax = reg * al
		add	ax,0
		mov	bx,ax
		mov	ax,es:[bx+0Ah]
		and	al,3
		cmp	al,3
		jne	loc_1736		; Jump if not equal
		cmp	byte ptr ds:[2A2Bh],1	; (A80C:2A2B=0)
		je	loc_1735		; Jump if equal
		jmp	loc_1739		; (A466)
loc_1735:
		push	ax
		push	bp
		mov	byte ptr ds:[26D5h],1	; (A80C:26D5=0)
		mov	ax,es:[bx+4]
		inc	ax
		push	bx
		mov	bp,5A2Dh
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		pop	bx
		pop	bp
		pop	ax
data_609	db	26h			; Data table (indexed access)
		mov	byte ptr [bx+0Ah],0
		mov	di,es:[bx]
		mov	es:[bx+6],di
		mov	es:[bx+8],di
		test	word ptr ds:[42CCh],1000h	; (A80C:42CC=0)
		jnz	loc_1736		; Jump if not zero
		sub	di,10h
		mov	es:[bx+6],di
		mov	es:[bx+8],di
loc_1736:
		test	ah,80h
		jnz	loc_1739		; Jump if not zero
		push	bx
		call	sub_110			; (80D1)
		mov	ax,word ptr es:[0BE7h]	; (94E8:0BE7=0FDFFh)
		mov	cl,5
		shl	ax,cl			; Shift w/zeros fill
		sub	ax,word ptr es:[0BEBh]	; (94E8:0BEB=0EB1Fh)
		call	sub_106			; (80C5)
		sub	ax,es:[bx]
		add	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		sub	ax,20h
		call	sub_110			; (80D1)
		mov	bx,word ptr es:[0BE5h]	; (94E8:0BE5=314h)
		mov	cl,4
		shr	bx,cl			; Shift w/zeros fill
		add	ax,bx
		test	ax,0F000h
		jz	loc_1737		; Jump if zero
		mov	ax,0FFFFh
		jmp	short loc_1738		; (A45E)
loc_1737:
		mov	cl,4
		shl	ax,cl			; Shift w/zeros fill
		mov	bx,word ptr es:[0BE5h]	; (94E8:0BE5=314h)
		and	bx,0Fh
		add	ax,bx
		dec	ax
		cmp	ax,0FFFFh
		jne	loc_1738		; Jump if not equal
		inc	ax
		pop	bx
		push	bx
		call	sub_106			; (80C5)
		or	word ptr es:[bx+0Ah],4000h
loc_1738:
		pop	bx
		call	sub_106			; (80C5)
		mov	es:[bx+4],ax
loc_1739:
		mov	ax,es:[bx]
		cmp	bx,0
		nop				;*ASM fixup - sign extn byte
		je	loc_1742		; Jump if equal
		sub	bx,dx
		mov	cx,es:[bx+0Ah]
		and	cl,3
		cmp	cl,3
		je	loc_1739		; Jump if equal
		test	ch,80h
		jnz	loc_1739		; Jump if not zero
		sub	ax,es:[bx]
		test	ah,0F0h
		jnz	loc_1740		; Jump if not zero
		mov	cl,4
		shl	ax,cl			; Shift w/zeros fill
		dec	ax
		jmp	short loc_1741		; (A494)
loc_1740:
		mov	ax,0FFFFh
loc_1741:
		mov	es:[bx+4],ax
		jmp	short loc_1739		; (A466)
loc_1742:
		cmp	byte ptr ds:[2A2Bh],1	; (94E8:2A2B=0Ah)
		je	loc_1743		; Jump if equal
		cmp	byte ptr ds:[2A2Bh],0FAh	; (94E8:2A2B=0Ah)
		jb	loc_1744		; Jump if below
loc_1743:
		jmp	short loc_1748		; (A528)
loc_1744:
		mov	di,0
data_612	db	0BBh
data_613	dw	15h
		mov	dl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
loc_1745:
		dec	dl
		cmp	dl,1
		jb	loc_1748		; Jump if below
		mov	ax,es:[di+0Ah]
		and	al,3
		cmp	al,3
		jne	loc_1747		; Jump if not equal
		mov	ax,es:[di+4]
		mov	cl,4
		shr	ax,cl			; Shift w/zeros fill
		test	word ptr es:[di+4],0Fh
		jz	loc_1746		; Jump if zero
		inc	ax
loc_1746:
		add	ax,es:[di]
		cmp	ax,es:[bx+di]
		jae	loc_1748		; Jump if above or =
		push	ax
		mov	dx,es:[bx+di]
		sub	dx,ax
		mov	cl,4
		shl	dx,cl			; Shift w/zeros fill
		dec	dx
		mov	ax,bx
		mov	cl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		dec	cl
		mul	cl			; ax = reg * al
		add	ax,0
		mov	di,ax
		add	di,bx
		pop	ax
		mov	es:[di],ax
		mov	word ptr es:[di+2],0
		mov	es:[di+4],dx
		mov	es:[di+6],ax
		mov	es:[di+8],ax
		mov	word ptr es:[di+0Ah],0
		mov	byte ptr es:[di+0Eh],0
		inc	byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
;*		call	sub_31			;*(2C50)
		db	0E8h, 2Eh, 87h
		jmp	short loc_1748		; (A528)
loc_1747:
		add	di,bx
		jmp	short loc_1745		; (A4B4)
loc_1748:
		call	sub_110			; (80D1)
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		mov	bx,ax
		add	bx,word ptr es:[0BF9h]	; (94E8:0BF9=1E89h)
		mov	ax,word ptr es:[0BF7h]	; (94E8:0BF7=2600h)
		mov	word ptr ds:[2A37h],bx	; (94E8:2A37=0C033h)
		mov	word ptr ds:[2A39h],ax	; (94E8:2A39=0ABABh)
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_106			; (80C5)
		xor	ax,ax			; Zero register
		mov	dx,10h
		call	sub_84			; (7498)
		jnc	loc_1749		; Jump if carry=0
		mov	ax,es:[di+4]
		cmp	ax,word ptr ds:[2A39h]	; (A80C:2A39=0)
		ja	loc_1749		; Jump if above
		mov	ax,word ptr ds:[2A39h]	; (A80C:2A39=0)
		add	ax,2
		mov	es:[di+4],ax
loc_1749:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1750		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1750		; Jump if equal
		call	sub_115			; (83A4)
loc_1750:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		test	word ptr ds:[2EC4h],1	; (A80C:2EC4=0)
		jz	loc_1751		; Jump if zero
		jmp	loc_1760		; (A66E)
loc_1751:
		call	sub_110			; (80D1)
		xor	cx,cx			; Zero register
		mov	dx,word ptr es:[0BFBh]	; (94E8:0BFB=19Ch)
		mov	ax,4200h
		mov	bx,word ptr ds:[37ECh]	; (94E8:37EC=0BF95h)
data_614	db	0CDh
		and	word ptr ds:[0C63h][di],di	; (94E8:0C63=240h)
		mov	cx,1063h
		sub	cx,0C63h
		mov	dx,0C63h
		mov	bx,word ptr ds:[37ECh]	; (94E8:37EC=0BF95h)
		call	sub_105			; (80BC)
		mov	ah,3Fh			; '?'
		int	21h			; DOS Services  ah=function 3Fh
						;  read file, cx=bytes, to ds:dx
		call	sub_104			; (80B9)
		jnc	loc_1753		; Jump if carry=0
		mov	bl,0Eh
		jmp	loc_1768		; (A76C)
loc_1753:
		cmp	word ptr ds:[38B1h],0	; (94E8:38B1=0C3E2h)
		jne	loc_1754		; Jump if not equal
		jmp	loc_1760		; (A66E)
loc_1754:
		call	sub_110			; (80D1)
		mov	bx,es:[bp]
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		add	ax,es:[bp+2]
;*		call	far ptr sub_233		;*(1548:1694)
		db	 9Ah, 94h, 16h, 48h, 15h
		mov	word ptr ds:[38B3h],ax	; (94E8:38B3=80BEh)
		mov	word ptr ds:[38B5h],bx	; (94E8:38B5=0AC00h)
		call	sub_106			; (80C5)
		mov	cx,15h
		mov	di,0
loc_1755:
		mov	ax,es:[di]
		cmp	ax,0FFFFh
		je	loc_1758		; Jump if equal
		mov	bx,es:[di+2]
;*		call	far ptr sub_233		;*(1548:1694)
		db	 9Ah, 94h, 16h, 48h, 15h
		cmp	word ptr ds:[38B3h],ax	; (94E8:38B3=80BEh)
		jb	loc_1758		; Jump if below
		ja	loc_1756		; Jump if above
		cmp	word ptr ds:[38B5h],bx	; (94E8:38B5=0AC00h)
		jb	loc_1758		; Jump if below
loc_1756:
		mov	ax,es:[di]
		mov	bx,es:[di+4]
;*		call	far ptr sub_233		;*(1548:1694)
		db	 9Ah, 94h, 16h, 48h, 15h
		sub	bx,word ptr ds:[38B5h]	; (94E8:38B5=0AC00h)
		sbb	ax,word ptr ds:[38B3h]	; (94E8:38B3=80BEh)
		jnc	loc_1757		; Jump if carry=0
		add	di,15h
		jmp	short loc_1755		; (A5F3)
loc_1757:
		mov	ax,es:[di]
		mov	bx,es:[di+2]
;*		call	far ptr sub_233		;*(1548:1694)
		db	 9Ah, 94h, 16h, 48h, 15h
		mov	ax,bx
		mov	bx,word ptr ds:[38B5h]	; (94E8:38B5=0AC00h)
		sub	bx,ax
		mov	cx,es:[di]
		mov	si,472Bh
		mov	[si],cx
		mov	[si+2],bx
		mov	byte ptr [si+4],5Fh	; '_'
		mov	byte ptr [si+5],0
		mov	byte ptr [si+6],0
		call	sub_124			; (9120)
loc_1758:
		dec	word ptr ds:[38B1h]	; (94E8:38B1=0C3E2h)
		add	bp,4
		cmp	bp,1063h
		jb	loc_1759		; Jump if below
;*		jmp	loc_1752		;*(A5A4)
		db	0E9h, 39h,0FFh
loc_1759:
		jmp	loc_1753		; (A5C6)
loc_1760:
		mov	bx,0
		xor	ch,ch			; Zero register
		mov	cl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		mov	ax,15h
		call	sub_106			; (80C5)
  
locloop_1761:
		and	byte ptr es:[bx+0Bh],7Fh
		or	byte ptr es:[bx+0Bh],1Eh
		add	bx,ax
		loop	locloop_1761		; Loop if cx > 0
  
		cmp	byte ptr ds:[2A1Eh],3	; (94E8:2A1E=9Ah)
		jne	loc_1762		; Jump if not equal
		jmp	short loc_1764		; (A6FC)
loc_1762:
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		mov	es,ax
		mov	si,word ptr ds:[2A1Ah]	; (94E8:2A1A=0C307h)
		call	sub_69			; (6ED4)
		call	sub_109			; (80CE)
		cmp	bl,8
		jbe	loc_1764		; Jump if below or =
		mov	si,di
		mov	di,358h
		xor	ch,ch			; Zero register
		mov	cl,bl
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	cl,22h			; '"'
		sub	cl,bl
		mov	al,20h			; ' '
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	ax,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		mov	es,ax
		mov	di,word ptr ds:[2A1Ah]	; (94E8:2A1A=0C307h)
		mov	al,2Eh			; '.'
		mov	cx,3Ch
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		jcxz	loc_1763		; Jump if cx=0
		mov	ax,es:[di]
		sub	al,30h			; '0'
		cmp	al,9
		ja	loc_1763		; Jump if above
		sub	ah,30h			; '0'
		cmp	ah,9
		ja	loc_1763		; Jump if above
		sub	di,2
		mov	al,es:[di]
		sub	al,30h			; '0'
		cmp	al,9
		ja	loc_1763		; Jump if above
		mov	ax,es:[di]
		mov	word ptr ds:[50E9h],ax	; (94E8:50E9=997Fh)
		mov	ax,es:[di+2]
		mov	word ptr ds:[50EBh],ax	; (94E8:50EB=368Bh)
loc_1763:
		call	sub_109			; (80CE)
loc_1764:
		mov	ah,3Dh			; '='
		mov	al,0
		mov	dx,2BB2h
		int	21h			; DOS Services  ah=function 3Dh
						;  open file, al=mode,name@ds:dx
		jc	loc_1765		; Jump if carry Set
		mov	bx,ax
		mov	word ptr ds:[37ECh],ax	; (94E8:37EC=0BF95h)
		mov	ah,57h			; 'W'
		xor	al,al			; Zero register
		int	21h			; DOS Services  ah=function 57h
						;  get/set file date & time
		jc	loc_1765		; Jump if carry Set
		mov	word ptr ds:[2D7Bh],dx	; (94E8:2D7B=0F286h)
		and	word ptr ds:[2D7Bh],1Fh	; (94E8:2D7B=0F286h)
		mov	cl,5
		shr	dx,cl			; Shift w/zeros fill
		mov	word ptr ds:[2D7Dh],dx	; (94E8:2D7D=0E89h)
		and	word ptr ds:[2D7Dh],0Fh	; (94E8:2D7D=0E89h)
		mov	cl,4
		shr	dx,cl			; Shift w/zeros fill
		and	dx,3Fh
		add	dx,50h
		mov	word ptr ds:[2D7Fh],dx	; (94E8:2D7F=8F38h)
loc_1765:
		cmp	byte ptr ds:[38AEh],0	; (94E8:38AE=3Ch)
		je	loc_1767		; Jump if equal
		mov	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		cmp	al,4
		ja	loc_1766		; Jump if above
		mov	al,4
		cmp	byte ptr ds:[2C40h],1	; (94E8:2C40=0)
		jbe	loc_1766		; Jump if below or =
		mov	al,0Ah
loc_1766:
		call	sub_83			; (7444)
loc_1767:
		mov	byte ptr ds:[1C42h],20h	; (94E8:1C42=0D3h) ' '
		call	sub_92			; (7C70)
		call	sub_68			; (6E44)
		mov	bx,word ptr ds:[37ECh]	; (94E8:37EC=0BF95h)
		call	sub_130			; (A8A0)
		call	sub_149			; (BB24)
		clc				; Clear carry flag
		jmp	short loc_1769		; (A774)
loc_1768:
		mov	bx,word ptr ds:[37ECh]	; (94E8:37EC=0BF95h)
		call	sub_130			; (A8A0)
		stc				; Set carry flag
loc_1769:
		retn
		xchg	bx,bx
		nop
		push	cx
		push	di
		mov	di,si
		mov	cx,32h
		add	si,cx
		mov	al,0
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	al,byte ptr ds:[2A1Dh]	; (020C:2A1D=0A9h)
		mov	es:[si-5],al
		mov	byte ptr ds:[2A1Dh],0	; (020C:2A1D=0A9h)
		pop	di
		pop	cx
		retn
		xchg	bx,bx
		nop
		push	cx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	di,3B50h
		mov	cx,3BD9h
		sub	cx,3B50h
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1770		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1770		; Jump if equal
		call	sub_115			; (83A4)
loc_1770:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	cx
		retn
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	di,5407h
		mov	cx,5439h
		sub	cx,5407h
		dec	cx
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1771		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1771		; Jump if equal
		call	sub_115			; (83A4)
loc_1771:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
		xchg	bx,bx
		nop
		push	cx
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	di,5452h
		mov	cx,5484h
data_619	db	81h
		jmp	loc_2726		; (FC76)
		dec	cx
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1772		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1772		; Jump if equal
		call	sub_115			; (83A4)
loc_1772:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	cx
		retn
		nop
		cmp	data_234,1		; (020C:263E=10h)
		jne	loc_1774		; Jump if not equal
		push	dx
		push	si
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	dx,2DF6h
		call	sub_53			; (6418)
		call	sub_109			; (80CE)
		mov	di,2DF6h
		mov	al,20h			; ' '
		mov	cx,2E7Eh
		sub	cx,2DF6h
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	ax,3
		call	sub_52			; (6380)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1773		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1773		; Jump if equal
		call	sub_115			; (83A4)
loc_1773:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	si
		pop	dx
loc_1774:
		clc				; Clear carry flag
		retn
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_130		proc	near
		push	ax
		mov	ah,3Eh			; '>'
data_621	db	0CDh
		and	[bx+si-3Dh],bx
		nop
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_131:
		push	es
		push	bp
data_622	db	0F7h
		push	es
		into				; Int 4 on overflow
data_623	db	42h
		inc	ax
data_624	db	0
		jnz	loc_1777		; Jump if not zero
		cmp	data_461,1		; (020C:4202=80h)
		je	loc_1777		; Jump if equal
		cmp	byte ptr ds:[2A75h],78h	; (020C:2A75=0ADh) 'x'
		je	loc_1775		; Jump if equal
		cmp	byte ptr ds:[2A75h],0F5h	; (020C:2A75=0ADh)
		je	loc_1775		; Jump if equal
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		jne	loc_1777		; Jump if not equal
loc_1775:
		call	sub_89			; (7B44)
		mov	byte ptr ds:[bp],28h	; '('
		inc	bp
		mov	ax,word ptr ds:[37A2h]	; (94E8:37A2=753Ah)
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		je	loc_1776		; Jump if equal
data_625	db	9Ah			; Data table (indexed access)
		db	68h
		add	[bx+si+15h],cl
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
loc_1776:
		mov	ax,word ptr ds:[37A4h]	; (94E8:37A4=8A12h)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],29h	; ')'
loc_1777:
		pop	bp
		pop	es
		retn
sub_130		endp
  
		nop
		push	bx
		cmp	byte ptr data_346+4,1	; (020C:2C40=41h)
		je	loc_1778		; Jump if equal
		test	data_359,1		; (020C:2D8D=49h)
		jnz	loc_1778		; Jump if not zero
		cmp	data_233,6		; (020C:263D=9Ah)
		jb	loc_1778		; Jump if below
		cmp	data_234,1		; (020C:263E=10h)
		je	loc_1778		; Jump if equal
		mov	ax,data_355		; (020C:2D84=4C4Ch)
		sub	ax,data_366		; (020C:2DB0=433Bh)
		cmp	ax,64h
		ja	loc_1778		; Jump if above
		mov	bx,0FFFFh
		cmp	data_367,bx		; (020C:2DB2=5C3Ah)
		jne	loc_1779		; Jump if not equal
loc_1778:
		jmp	loc_1786		; (A9DE)
loc_1779:
		push	cx
		push	si
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	dx,1
		mov	bx,data_354		; (020C:2D82=4152h)
		mov	ax,data_366		; (020C:2DB0=433Bh)
		cmp	ax,0FFFFh
		je	loc_1784		; Jump if equal
		call	sub_84			; (7498)
		jnc	loc_1784		; Jump if carry=0
		test	byte ptr es:[di+5],2
		jnz	loc_1784		; Jump if not zero
		push	si
		mov	si,di
		call	sub_125			; (92DC)
		pop	si
		mov	si,2D98h
		mov	cx,3
  
locloop_1780:
		mov	di,[si+2]
		cmp	di,0FFFFh
		je	loc_1782		; Jump if equal
		mov	dx,1
		mov	bx,[si]
		mov	ax,[si+2]
		call	sub_84			; (7498)
		jnc	loc_1782		; Jump if carry=0
		test	byte ptr es:[di+5],2
		jnz	loc_1781		; Jump if not zero
		push	si
		mov	si,di
		call	sub_125			; (92DC)
		pop	si
loc_1781:
		add	si,4
		loop	locloop_1780		; Loop if cx > 0
  
loc_1782:
		mov	word ptr ds:[2DB2h],bx	; (A80C:2DB2=0)
		mov	si,2DA4h
		mov	cx,3
  
locloop_1783:
		mov	di,[si+2]
		cmp	di,0FFFFh
		je	loc_1784		; Jump if equal
		mov	bx,[si]
		mov	ax,[si+2]
		mov	dx,2
		call	sub_84			; (7498)
		jnc	loc_1784		; Jump if carry=0
		test	byte ptr es:[di+5],2
data_628	dw	775h
		push	si
		mov	si,di
		call	sub_125			; (92DC)
		pop	si
		add	si,4
		loop	locloop_1783		; Loop if cx > 0
  
loc_1784:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1785		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1785		; Jump if equal
		call	sub_115			; (83A4)
loc_1785:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	si
		pop	cx
loc_1786:
		pop	bx
		retn
		test	data_372,10h		; (020C:2EB1=0)
		jz	loc_1787		; Jump if zero
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_132		proc	near
		cmp	byte ptr ds:[263Eh],1	; (AAC0:263E=0)
		jne	loc_1787		; Jump if not equal
		jmp	short loc_1788		; (A9F3)
loc_1787:
		jmp	loc_1796		; (AA92)
loc_1788:
		mov	al,byte ptr ds:[2EBAh]	; (AAC0:2EBA=0)
		mov	byte ptr ds:[2EBBh],al	; (AAC0:2EBB=0)
		mov	byte ptr ds:[2EBAh],2	; (AAC0:2EBA=0)
		push	ax
		push	bx
		push	cx
		push	si
		push	bp
		test	byte ptr ds:[2A78h],0E0h	; (AAC0:2A78=0)
		jz	loc_1789		; Jump if zero
		test	byte ptr ds:[2A77h],0E0h	; (AAC0:2A77=0)
		jz	loc_1789		; Jump if zero
		jmp	short loc_1790		; (AA15)
loc_1789:
		jmp	short loc_1793		; (AA47)
loc_1790:
		mov	cx,7
		mov	si,2ED4h
		mov	bp,5FFFh
  
locloop_1791:
		mov	bx,[si]
		mov	ax,[si+2]
;*		call	far ptr sub_186		;*(1548:0218)
		db	 9Ah, 18h, 02h, 48h, 15h
		add	si,4
		inc	bp
		loop	locloop_1791		; Loop if cx > 0
  
		mov	cx,6
		mov	si,2EF0h
		mov	bp,6072h
  
locloop_1792:
		mov	ax,[si]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		inc	si
		inc	si
		inc	bp
		loop	locloop_1792		; Loop if cx > 0
  
		mov	al,40h			; '@'
		jmp	short loc_1795		; (AA82)
loc_1793:
		mov	cx,7
		mov	si,2ED4h
		mov	bp,5695h
  
locloop_1794:
		mov	ax,[si]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		add	si,4
		inc	bp
		loop	locloop_1794		; Loop if cx > 0
  
		mov	ax,word ptr ds:[2EF0h]	; (AAC0:2EF0=0)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		inc	bp
		mov	ax,word ptr ds:[2EF2h]	; (AAC0:2EF2=0)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		inc	bp
		mov	ax,word ptr ds:[2EF4h]	; (AAC0:2EF4=0)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		inc	bp
		mov	ax,word ptr ds:[2EFAh]	; (AAC0:2EFA=0)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	al,28h			; '('
loc_1795:
		call	sub_52			; (6380)
		clc				; Clear carry flag
		mov	al,byte ptr ds:[2EBBh]	; (94E8:2EBB=3Eh)
		mov	byte ptr ds:[2EBAh],al	; (94E8:2EBA=74h)
		pop	bp
		pop	si
		pop	cx
		pop	bx
		pop	ax
		retn
loc_1796:
		clc				; Clear carry flag
		retn
sub_132		endp
  
		test	data_372,10h		; (020C:2EB1=0)
		jz	loc_1799		; Jump if zero
		cmp	data_234,1		; (020C:263E=10h)
		jne	loc_1799		; Jump if not equal
		push	ax
		push	bx
		push	bp
data_629	db	0BDh			; Data table (indexed access)
		pop	si
		push	di
		mov	ax,data_427		; (020C:3794=3688h)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	bp,5750h
		mov	ax,data_425		; (020C:3791=2A79h)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		inc	si
		inc	si
		inc	bp
		mov	ax,data_424		; (020C:378F=6C6h)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	bp,5746h
		mov	al,data_426		; (020C:3793=0Ch)
;*		call	far ptr sub_178		;*(1548:0024)
		db	 9Ah, 24h, 00h, 48h, 15h
		mov	bp,5750h
		test	al,40h			; '@'
		jnz	loc_1797		; Jump if not zero
		mov	word ptr ds:[bp],2D2Dh
		mov	word ptr ds:[bp+2],2D2Dh
loc_1797:
		test	al,80h
		jnz	loc_1798		; Jump if not zero
		mov	word ptr ds:[bp+5],2D2Dh
		mov	word ptr ds:[bp+7],2D2Dh
loc_1798:
		mov	al,2Ah			; '*'
		call	sub_52			; (6380)
		pop	bp
		pop	bx
		pop	ax
loc_1799:
		clc				; Clear carry flag
		retn
		add	[bx+si],al
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_133		proc	near
		push	bx
		push	dx
		push	ds
		call	sub_105			; (80BC)
		xor	si,si			; Zero register
		mov	bl,0FFh
		mov	bh,1
		mov	bp,5
loc_1800:
		cmp	[si],bl
		je	loc_1804		; Jump if equal
		cmp	[si+3],ax
		jae	loc_1803		; Jump if above or =
loc_1801:
		xor	dx,dx			; Zero register
		add	dl,[si+2]
		shl	dx,1			; Shift w/zeros fill
		test	bh,[si+1]
		jnz	loc_1802		; Jump if not zero
		add	dx,bp
		add	si,dx
		jmp	short loc_1800		; (AB0F)
loc_1802:
		shl	dx,1			; Shift w/zeros fill
		add	dx,bp
		add	si,dx
		jmp	short loc_1800		; (AB0F)
loc_1803:
		ja	loc_1804		; Jump if above
		cmp	byte ptr [si],0FEh
		je	loc_1801		; Jump if equal
		cmp	[si],cl
		ja	loc_1804		; Jump if above
		jnz	loc_1801		; Jump if not zero
		cmp	[si+1],ch
		je	loc_1805		; Jump if equal
		jmp	short loc_1801		; (AB18)
loc_1804:
		clc				; Clear carry flag
		jmp	short loc_1806		; (AB4A)
loc_1805:
		stc				; Set carry flag
loc_1806:
		mov	bx,ds
		mov	es,bx
		pop	ds
		pop	dx
		pop	bx
		retn
sub_133		endp
  
		xchg	bx,bx
		test	data_480,40h		; (020C:42CC=0D323h)
		jnz	loc_1807		; Jump if not zero
		cmp	byte ptr es:[si+1],21h	; '!'
		jne	loc_1807		; Jump if not equal
		cmp	data_234,1		; (020C:263E=10h)
		je	loc_1807		; Jump if equal
		mov	ax,data_393		; (020C:2ED4=5300h)
		cmp	ah,9
		je	loc_1808		; Jump if equal
loc_1807:
		jmp	loc_1814		; (AC30)
loc_1808:
		push	bx
		push	cx
		push	dx
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	ax,data_400		; (020C:2EF4=4E49h)
		mov	data_452,ax		; (020C:3BEB=876h)
		mov	ax,word ptr ds:[2EE0h]	; (020C:2EE0=3A43h)
		mov	data_453,ax		; (020C:3BED=1B6h)
		mov	di,3BEBh
		call	sub_136			; (B1A8)
		jc	loc_1809		; Jump if carry Set
		jmp	short loc_1812		; (AC0C)
loc_1809:
		push	data_428		; (020C:3796=2A78h)
		mov	ax,data_400		; (020C:2EF4=4E49h)
		mov	data_428,ax		; (020C:3796=2A78h)
		mov	ax,word ptr ds:[2EE0h]	; (020C:2EE0=3A43h)
		xor	bx,bx			; Zero register
		mov	bp,3BEBh
data_630	db	0E8h
data_631	db	75h
		jmp	loc_1895		; (B23C)
		xchg	ax,si
		aaa				; Ascii adjust
		mov	di,word ptr ds:[2EE0h]	; (020C:2EE0=3A43h)
		mov	ax,data_400		; (020C:2EF4=4E49h)
		mov	es,ax
		mov	cx,1F4h
		mov	bx,cx
		mov	al,24h			; '$'
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		cmp	cx,0
		jne	loc_1810		; Jump if not equal
		jmp	short loc_1812		; (AC0C)
loc_1810:
		sub	bx,cx
		mov	di,word ptr ds:[2EE0h]	; (020C:2EE0=3A43h)
		mov	cx,bx
		mov	al,0
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		sub	bx,cx
		push	bx
		mov	bx,es
		call	sub_116			; (83D8)
		pop	bx
		mov	di,data_334		; (020C:2A8F=0E3E2h)
		sub	di,4
		test	byte ptr es:[di+5],2
		jnz	loc_1812		; Jump if not zero
		and	byte ptr es:[di+5],0FCh
		cmp	data_169,1		; (020C:14AD=0)
		ja	loc_1811		; Jump if above
		or	byte ptr es:[di+5],1
loc_1811:
		and	byte ptr es:[di+4],0C0h
		or	byte ptr es:[di+4],20h	; ' '
		mov	es:[di+8],bx
loc_1812:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1813		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1813		; Jump if equal
		call	sub_115			; (83A4)
loc_1813:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	dx
		pop	cx
		pop	bx
loc_1814:
		retn
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_134		proc	near
		call	sub_51			; (5478)
		push	ax
		push	bx
		push	cx
		push	dx
		push	di
		push	si
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	cx,word ptr ds:[430Eh]	; (A80C:430E=0)
		sub	cx,0Bh
		cmp	cx,word ptr ds:[430Ch]	; (A80C:430C=0)
		ja	loc_1815		; Jump if above
		jmp	loc_1833		; (AD77)
loc_1815:
;*		call	far ptr sub_225		;*(1548:1324)
		db	 9Ah, 24h, 13h, 48h, 15h
		cmp	bx,0
		jne	loc_1816		; Jump if not equal
		cmp	ax,400h
		jb	loc_1816		; Jump if below
		cmp	ax,500h
		ja	loc_1817		; Jump if above
		mov	bx,40h
		sub	ax,400h
loc_1816:
		cmp	bx,40h
		jne	loc_1817		; Jump if not equal
		cmp	ax,100h
		jne	loc_1817		; Jump if not equal
		xor	ax,ax			; Zero register
		mov	bx,50h
loc_1817:
		mov	si,0
		call	sub_106			; (80C5)
		mov	ch,1
loc_1818:
		cmp	es:[si],bx
		jne	loc_1819		; Jump if not equal
		cmp	ax,es:[si+2]
		jb	loc_1819		; Jump if below
		cmp	ax,es:[si+4]
		jbe	loc_1820		; Jump if below or =
loc_1819:
		inc	ch
		add	si,15h
		cmp	ch,byte ptr ds:[2A2Bh]	; (A80C:2A2B=0)
		jbe	loc_1818		; Jump if below or =
		jmp	loc_1833		; (AD77)
loc_1820:
		dec	ch
		mov	cl,ch
		xor	ch,ch			; Zero register
		cmp	bx,word ptr ds:[2D82h]	; (A80C:2D82=0)
		je	loc_1821		; Jump if equal
		or	ch,1
loc_1821:
		cmp	dx,4
		je	loc_1823		; Jump if equal
		cmp	dx,2
		je	loc_1822		; Jump if equal
		or	ch,2
		jmp	short loc_1823		; (ACC5)
loc_1822:
		or	ch,4
loc_1823:
		call	sub_133			; (AB00)
		jc	loc_1824		; Jump if carry Set
		mov	bh,1
		jmp	short loc_1829		; (AD16)
loc_1824:
		xor	bh,bh			; Zero register
		mov	dl,es:[si+2]
		cmp	dl,0FFh
		je	loc_1826		; Jump if equal
		mov	di,si
		add	si,5
		xor	dh,dh			; Zero register
		shl	dx,1			; Shift w/zeros fill
		test	ch,1
		jz	loc_1825		; Jump if zero
		shl	dx,1			; Shift w/zeros fill
loc_1825:
		add	si,dx
		mov	dx,word ptr ds:[2D84h]	; (A80C:2D84=0)
		sub	dx,word ptr ds:[48DFh]	; (A80C:48DF=0)
		test	ch,1
		jnz	loc_1827		; Jump if not zero
		cmp	dx,es:[si-2]
		jne	loc_1828		; Jump if not equal
loc_1826:
		jmp	short loc_1833		; (AD77)
loc_1827:
		cmp	dx,es:[si-4]
		jne	loc_1828		; Jump if not equal
		mov	dx,word ptr ds:[2D82h]	; (A80C:2D82=0)
		cmp	dx,es:[si-2]
		jne	loc_1828		; Jump if not equal
		jmp	short loc_1833		; (AD77)
loc_1828:
		inc	byte ptr es:[di+2]
loc_1829:
		mov	dx,si
		mov	bl,ch
		push	cx
		mov	di,word ptr ds:[430Ch]	; (A80C:430C=0)
		mov	si,di
		mov	cx,di
		sub	cx,dx
		add	di,2
		add	cx,2
		or	bh,bh			; Zero ?
		jz	loc_1830		; Jump if zero
		add	di,5
loc_1830:
		test	bl,1
		jz	loc_1831		; Jump if zero
		add	di,2
loc_1831:
		mov	word ptr ds:[430Ch],di	; (A80C:430C=0)
		mov	byte ptr es:[di+1],0FFh
		push	es
		pop	ds
		std				; Set direction flag
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		call	sub_104			; (80B9)
		pop	cx
		mov	si,dx
		or	bh,bh			; Zero ?
		jz	loc_1832		; Jump if zero
		mov	es:[si],cx
		mov	byte ptr es:[si+2],1
		mov	es:[si+3],ax
		add	si,5
loc_1832:
		mov	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		sub	ax,word ptr ds:[48DFh]	; (94E8:48DF=74C7h)
		mov	es:[si],ax
		test	bl,1
		jz	loc_1833		; Jump if zero
		mov	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	es:[si+2],ax
loc_1833:
		cld				; Clear direction
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1834		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1834		; Jump if equal
		call	sub_115			; (83A4)
loc_1834:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	si
		pop	di
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_134		endp
  
		nop
data_636	db	50h			; Data table (indexed access)
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	di,8
		mov	si,0
		call	sub_102			; (80B0)
loc_1835:
		mov	ax,[si]
		mov	bx,[si+2]
		mov	cx,[si+4]
		cmp	word ptr es:[di],0FFFFh
		je	loc_1837		; Jump if equal
		test	byte ptr es:[di+4],40h	; '@'
		jz	loc_1839		; Jump if zero
		test	byte ptr es:[di+7],80h
		jnz	loc_1839		; Jump if not zero
		cmp	ax,es:[di]
		jb	loc_1838		; Jump if below
		ja	loc_1836		; Jump if above
		cmp	bx,es:[di+2]
		ja	loc_1836		; Jump if above
		cmp	cx,es:[di+2]
		jb	loc_1838		; Jump if below
		push	ds
		call	sub_104			; (80B9)
		test	word ptr ds:[42CCh],100h	; (94E8:42CC=71Fh)
		pop	ds
		jz	loc_1839		; Jump if zero
		mov	dx,[si+0Ah]
		and	dl,3
		cmp	dl,1
		ja	loc_1839		; Jump if above
		test	byte ptr es:[di+4],80h
		jz	loc_1839		; Jump if zero
		test	byte ptr es:[di+5],2
		jnz	loc_1839		; Jump if not zero
		cmp	word ptr es:[di+2],200h
		jae	loc_1839		; Jump if above or =
		push	ds
		call	sub_104			; (80B9)
		test	word ptr ds:[42CCh],200h	; (94E8:42CC=71Fh)
		pop	ds
		jnz	loc_1836		; Jump if not zero
		cmp	word ptr es:[di+2],100h
data_637	db	73h
		sbb	ch,bl
		inc	ax
loc_1837:
		jmp	short loc_1842		; (AE6B)
loc_1838:
		add	si,15h
		cmp	word ptr [si],0FFFFh
		je	loc_1841		; Jump if equal
		mov	dx,[si+0Ah]
		and	dl,3
		cmp	dl,3
		je	loc_1838		; Jump if equal
		jmp	loc_1835		; (ADB0)
loc_1839:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		push	ds
		call	sub_104			; (80B9)
		xlat				; al=[al+[bx]] table
		pop	ds
		or	al,al			; Zero ?
		jnz	loc_1840		; Jump if not zero
		mov	al,es:[di+6]
loc_1840:
		add	di,ax
		cmp	word ptr es:[di],0FFFFh
		je	loc_1842		; Jump if equal
		cmp	word ptr [si],0FFFFh
		je	loc_1841		; Jump if equal
		jmp	loc_1835		; (ADB0)
loc_1841:
		and	byte ptr es:[di+4],0BFh
		jmp	short loc_1839		; (AE3C)
loc_1842:
		call	sub_104			; (80B9)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
		xchg	bx,bx
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	di,8
		mov	si,di
		mov	bx,377Fh
		cmp	word ptr es:[di],0FFFFh
		jne	loc_1843		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		jne	loc_1843		; Jump if not equal
		jmp	loc_1882		; (B157)
loc_1843:
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
data_638	db	75h
		add	al,26h			; '&'
		mov	al,[di+6]
		mov	si,di
		add	si,ax
data_639	dw	0FFB8h			; Data table (indexed access)
data_640	db	0FFh
		cmp	es:[si],ax
		jne	loc_1844		; Jump if not equal
		cmp	es:[si+2],ax
		jne	loc_1844		; Jump if not equal
		jmp	loc_1882		; (B157)
loc_1844:
		mov	ax,es:[di]
		cmp	ax,es:[si]
		je	loc_1845		; Jump if equal
		jmp	loc_1879		; (B139)
loc_1845:
		mov	ax,es:[di+2]
		cmp	ax,es:[si+2]
		jne	loc_1846		; Jump if not equal
		jmp	loc_1862		; (B002)
loc_1846:
		test	byte ptr es:[di+5],80h
		jz	loc_1847		; Jump if zero
		jmp	loc_1879		; (B139)
loc_1847:
		mov	ax,es:[di+8]
data_641	db	26h
		add	ax,[di+2]
		jnc	loc_1848		; Jump if carry=0
		inc	ax
		sub	es:[di+8],ax
		jmp	short loc_1846		; (AED4)
loc_1848:
		cmp	ax,es:[si+2]
		ja	loc_1849		; Jump if above
		jmp	loc_1879		; (B139)
loc_1849:
		cmp	data_338,0		; (020C:2BA9=0Ch)
		jne	loc_1850		; Jump if not equal
		mov	al,es:[di+4]
		and	al,3Fh			; '?'
		cmp	al,20h			; ' '
		jne	loc_1850		; Jump if not equal
		mov	ax,es:[di+2]
		add	ax,es:[di+8]
		mov	data_338,ax		; (020C:2BA9=0Ch)
		mov	data_339,di		; (020C:2BAB=0FF00h)
loc_1850:
		mov	al,es:[di+4]
		and	al,3Fh			; '?'
		cmp	al,21h			; '!'
data_642	db	74h
		jz	loc_1853		; Jump if zero
		and	dh,[si+70h]
		mov	al,es:[si+4]
		and	al,3Fh			; '?'
		cmp	al,21h			; '!'
		jne	loc_1852		; Jump if not equal
loc_1851:
		jmp	loc_1859		; (AFB6)
loc_1852:
		cmp	al,22h			; '"'
		je	loc_1851		; Jump if equal
		test	byte ptr es:[si+5],2
		jnz	loc_1857		; Jump if not zero
		test	byte ptr es:[di+5],2
		jnz	loc_1855		; Jump if not zero
		mov	ax,es:[si+2]
		sub	ax,es:[di+2]
		mov	dx,4
		mov	cl,es:[di+4]
		and	cl,3Fh			; '?'
		cmp	cl,20h			; ' '
		jne	loc_1853		; Jump if not equal
		mov	dx,3F0h
loc_1853:
		cmp	ax,dx
		jae	loc_1857		; Jump if above or =
		cmp	dx,3F0h
		je	loc_1854		; Jump if equal
		jmp	loc_1863		; (B008)
loc_1854:
		mov	al,es:[si+4]
		and	al,3Fh			; '?'
		cmp	al,2
		je	loc_1857		; Jump if equal
		cmp	al,4
		je	loc_1857		; Jump if equal
		mov	ax,es:[si+2]
		sub	ax,es:[di+2]
		jmp	loc_1863		; (B008)
loc_1855:
		mov	ax,es:[si+2]
		sub	ax,es:[di+2]
		cmp	ax,3F0h
		jae	loc_1856		; Jump if above or =
		jmp	short loc_1863		; (B008)
loc_1856:
		jmp	short loc_1862		; (B002)
loc_1857:
		mov	ax,es:[si+2]
		sub	ax,es:[di+2]
		mov	cx,ax
data_643	db	26h			; Data table (indexed access)
		xchg	ax,[di+8]
		sub	ax,cx
		cmp	ax,es:[si+8]
		ja	loc_1858		; Jump if above
		jmp	loc_1879		; (B139)
loc_1858:
		sub	ax,es:[si+2]
		jmp	loc_1879		; (B139)
loc_1859:
		mov	ax,es:[di+2]
		add	ax,es:[di+8]
		mov	cx,es:[si+2]
		add	cx,es:[si+8]
		cmp	cx,ax
		jbe	loc_1862		; Jump if below or =
		sub	cx,ax
		mov	es:[si+2],ax
		mov	es:[si+8],cx
		push	di
		mov	al,es:[si+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1860		; Jump if not zero
		mov	al,es:[si+6]
loc_1860:
		mov	di,si
		add	di,ax
		mov	ax,es:[di]
		cmp	ax,es:[si]
		jne	loc_1861		; Jump if not equal
		mov	ax,es:[di+2]
		cmp	ax,es:[si+2]
		ja	loc_1861		; Jump if above
		pop	di
		jmp	short loc_1862		; (B002)
loc_1861:
		pop	di
		jmp	loc_1873		; (B0F0)
loc_1862:
		call	sub_125			; (92DC)
		jmp	loc_1881		; (B151)
loc_1863:
		or	byte ptr es:[si+5],80h
		test	byte ptr es:[di+5],80h
		jz	loc_1865		; Jump if zero
		mov	cx,es:[di+6]
		and	cx,3FFh
		add	ax,cx
		jc	loc_1864		; Jump if carry Set
		cmp	ax,3F0h
		jbe	loc_1865		; Jump if below or =
loc_1864:
		mov	data_338,0		; (020C:2BA9=0Ch)
		jmp	short loc_1862		; (B002)
loc_1865:
		and	word ptr es:[si+6],0FC00h
		or	es:[si+6],ax
		mov	al,es:[di+5]
		and	al,3
		mov	ah,es:[si+5]
		and	ah,3
		rol	ah,1			; Rotate
		rol	ah,1			; Rotate
		or	al,ah
		push	bx
		mov	bx,4303h
		xlat				; al=[al+[bx]] table
		pop	bx
		mov	dl,al
		and	al,7Fh
		xor	ah,ah			; Zero register
		mov	cx,ax
		jcxz	loc_1869		; Jump if cx=0
		mov	al,es:[si+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		push	di
		push	si
		push	es
		pop	ds
		add	si,ax
		test	dl,80h
		jz	loc_1866		; Jump if zero
		mov	di,si
		sub	di,cx
		mov	ax,word ptr es:[0]	; (020C:0000=1828h)
		sub	word ptr es:[0],cx	; (020C:0000=1828h)
		nop				;*ASM fixup - sign extn byte
		mov	cx,ax
		sub	cx,si
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		jmp	short loc_1868		; (B0A3)
loc_1866:
		mov	ax,word ptr es:[0]	; (020C:0000=1828h)
		sub	ax,si
		mov	si,word ptr es:[0]	; (020C:0000=1828h)
		nop				;*ASM fixup - sign extn byte
		dec	si
		mov	di,si
		add	di,cx
		add	word ptr es:[0],cx	; (020C:0000=1828h)
		nop				;*ASM fixup - sign extn byte
		mov	cx,ax
		jnc	loc_1867		; Jump if carry=0
;*		jmp	loc_184			;*(20C9)
		db	0E9h, 2Ah, 70h
loc_1867:
		std				; Set direction flag
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		cld				; Clear direction
loc_1868:
		pop	si
		pop	di
loc_1869:
		or	byte ptr es:[di+4],40h	; '@'
		mov	al,es:[di+4]
		and	al,3Fh			; '?'
		and	byte ptr es:[si+4],0C0h
		or	es:[si+4],al
		mov	al,es:[di+5]
		and	al,3
		cmp	al,3
		jne	loc_1870		; Jump if not equal
		dec	al
loc_1870:
		and	byte ptr es:[si+5],0FCh
		or	es:[si+5],al
		cmp	al,0
		je	loc_1872		; Jump if equal
		push	di
		push	si
		mov	cx,2
		cmp	al,1
		je	loc_1871		; Jump if equal
		mov	cx,0Fh
loc_1871:
		add	di,0Ah
		add	si,0Ah
		xchg	si,di
		push	es
		pop	ds
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	si
		pop	di
loc_1872:
		call	sub_104			; (80B9)
loc_1873:
		call	sub_135			; (B160)
		mov	al,es:[si+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1874		; Jump if not zero
		mov	al,es:[si+6]
loc_1874:
		add	si,ax
		mov	ax,0FFFFh
		cmp	es:[si],ax
		jne	loc_1875		; Jump if not equal
		cmp	es:[si+2],ax
		je	loc_1876		; Jump if equal
loc_1875:
		jmp	loc_1844		; (AEBC)
loc_1876:
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1877		; Jump if not zero
		mov	al,es:[di+6]
loc_1877:
		add	di,ax
		mov	ax,0FFFFh
		cmp	es:[di],ax
		jne	loc_1878		; Jump if not equal
		cmp	es:[di+2],ax
		je	loc_1882		; Jump if equal
loc_1878:
		jmp	loc_1843		; (AE97)
loc_1879:
		call	sub_135			; (B160)
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1880		; Jump if not zero
		mov	al,es:[di+6]
loc_1880:
		add	di,ax
		jmp	loc_1843		; (AE97)
loc_1881:
		call	sub_135			; (B160)
		jmp	loc_1843		; (AE97)
loc_1882:
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_135		proc	near
		mov	al,es:[di+4]
		and	al,3Fh			; '?'
		mov	ah,al
		mov	cx,es:[di+8]
		cmp	al,21h			; '!'
		jne	loc_1883		; Jump if not equal
		cmp	cx,6
		ja	loc_1887		; Jump if above
		mov	ah,1
		jmp	short loc_1886		; (B19E)
loc_1883:
		cmp	al,22h			; '"'
		jne	loc_1884		; Jump if not equal
		cmp	cx,6
		ja	loc_1887		; Jump if above
		mov	ah,2
		jmp	short loc_1886		; (B19E)
loc_1884:
		cmp	al,4
		jne	loc_1885		; Jump if not equal
		cmp	cx,4
		jae	loc_1887		; Jump if above or =
		mov	ah,2
		mov	al,2
loc_1885:
		cmp	al,2
		jne	loc_1886		; Jump if not equal
		cmp	cx,2
		jae	loc_1886		; Jump if above or =
		mov	ah,1
loc_1886:
		and	byte ptr es:[di+4],0C0h
		or	es:[di+4],ah
loc_1887:
		retn
sub_135		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_136		proc	near
		push	bx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	ax,es:[di]
		mov	bx,es:[di+2]
		call	sub_106			; (80C5)
		mov	di,0
loc_1888:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_1889		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		je	loc_1892		; Jump if equal
loc_1889:
		cmp	ax,es:[di]
		jne	loc_1890		; Jump if not equal
		cmp	bx,es:[di+2]
		jb	loc_1890		; Jump if below
		cmp	bx,es:[di+4]
		jbe	loc_1891		; Jump if below or =
loc_1890:
		add	di,15h
		jmp	short loc_1888		; (B1BD)
loc_1891:
		stc				; Set carry flag
		lahf				; Load ah from flags
		jmp	short loc_1893		; (B1E6)
loc_1892:
		clc				; Clear carry flag
		lahf				; Load ah from flags
loc_1893:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1894		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1894		; Jump if equal
		call	sub_115			; (83A4)
loc_1894:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	bx
		sahf				; Store ah into flags
		retn
sub_136		endp
  
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_137		proc	near
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	word ptr ds:[278Dh],0	; (94E8:278D=8)
		mov	word ptr ds:[278Fh],0	; (94E8:278F=0DEBh)
		cmp	byte ptr ds:[26E8h],0	; (94E8:26E8=0EBh)
		je	loc_1897		; Jump if equal
		mov	ah,19h
		int	21h			; DOS Services  ah=function 19h
						;  get default drive al  (0=a:)
		mov	dl,al
		add	al,61h			; 'a'
		mov	byte ptr ds:[2728h],al	; (94E8:2728=74h)
		mov	word ptr ds:[2729h],5C3Ah	; (94E8:2729=8025h)
		mov	ah,47h			; 'G'
		inc	dl
		mov	si,272Bh
		int	21h			; DOS Services  ah=function 47h
						;  get present dir,drive dl,1=a:
		cmp	byte ptr ds:[26E9h],3Ah	; (94E8:26E9=38h) ':'
		jne	loc_1896		; Jump if not equal
		mov	dl,byte ptr ds:[26E8h]	; (94E8:26E8=0EBh)
		or	dl,60h			; '`'
		sub	dl,61h			; 'a'
		mov	ah,0Eh
		int	21h			; DOS Services  ah=function 0Eh
						;  set default drive dl  (0=a:)
loc_1896:
		mov	ah,3Bh			; ';'
		mov	dx,26E8h
		int	21h			; DOS Services  ah=function 3Bh
						;  set current dir, path @ ds:dx
		jnc	loc_1897		; Jump if carry=0
		jmp	short loc_1899		; (B280)
loc_1897:
		mov	ah,29h			; ')'
		mov	al,1
		mov	si,26DAh
		call	sub_109			; (80CE)
		mov	di,2768h
		int	21h			; DOS Services  ah=function 29h
						;  parse filenam @ds:si FCBes:di
		cmp	al,0
		je	loc_1898		; Jump if equal
		jmp	short loc_1899		; (B280)
loc_1898:
		mov	ah,23h			; '#'
		mov	dx,di
		mov	word ptr ds:[2776h],1	; (94E8:2776=0C3DCh)
		int	21h			; DOS Services  ah=function 23h
						;  get file size, FCB @ ds:dx
loc_1899:
		cmp	byte ptr ds:[26E8h],0	; (94E8:26E8=0EBh)
		je	loc_1900		; Jump if equal
		mov	ah,3Bh			; ';'
		mov	dx,2728h
		int	21h			; DOS Services  ah=function 3Bh
						;  set current dir, path @ ds:dx
loc_1900:
		mov	ax,word ptr ds:[278Bh]	; (94E8:278B=0B901h)
		mov	word ptr ds:[278Fh],ax	; (94E8:278F=0DEBh)
		mov	ax,word ptr ds:[2789h]	; (94E8:2789=0C783h)
		mov	word ptr ds:[278Dh],ax	; (94E8:278D=8)
		mov	ah,3Dh			; '='
		mov	al,0
		mov	dx,2BB2h
		int	21h			; DOS Services  ah=function 3Dh
						;  open file, al=mode,name@ds:dx
		jnc	loc_1901		; Jump if carry=0
		mov	bl,1
		jmp	loc_1913		; (B36F)
loc_1901:
		mov	word ptr ds:[37ECh],ax	; (94E8:37EC=0BF95h)
		call	sub_109			; (80CE)
		mov	cx,1063h
		sub	cx,0BE3h
		mov	dx,0BE3h
		mov	bx,word ptr ds:[37ECh]	; (94E8:37EC=0BF95h)
		call	sub_105			; (80BC)
		mov	ah,3Fh			; '?'
		int	21h			; DOS Services  ah=function 3Fh
						;  read file, cx=bytes, to ds:dx
		call	sub_104			; (80B9)
		jnc	loc_1902		; Jump if carry=0
		jmp	loc_1912		; (B36D)
loc_1902:
		call	sub_110			; (80D1)
		mov	si,0BE3h
		cmp	word ptr es:[si],5A4Dh
		je	loc_1903		; Jump if equal
		jmp	loc_1911		; (B36B)
loc_1903:
		mov	ax,es:[si+4]
		xor	dx,dx			; Zero register
		mov	cx,9
  
locloop_1904:
		shl	ax,1			; Shift w/zeros fill
		rcl	dx,1			; Rotate thru carry
		loop	locloop_1904		; Loop if cx > 0
  
		mov	cx,es:[si+2]
		cmp	cx,0
		je	loc_1905		; Jump if equal
		mov	cx,200h
		sub	cx,es:[si+2]
		sub	ax,cx
		sbb	dx,0
loc_1905:
		push	ax
		push	dx
		mov	ax,es:[si+8]
		mov	cx,4
		xor	dx,dx			; Zero register
  
locloop_1906:
		shl	ax,1			; Shift w/zeros fill
		rcl	dx,1			; Rotate thru carry
		loop	locloop_1906		; Loop if cx > 0
  
		sub	word ptr ds:[278Dh],ax	; (94E8:278D=8)
		sbb	word ptr ds:[278Fh],dx	; (94E8:278F=0DEBh)
		pop	dx
		pop	ax
		cmp	dx,word ptr ds:[278Fh]	; (94E8:278F=0DEBh)
		je	loc_1907		; Jump if equal
		ja	loc_1908		; Jump if above
		mov	word ptr ds:[278Dh],ax	; (94E8:278D=8)
		mov	word ptr ds:[278Fh],dx	; (94E8:278F=0DEBh)
		jmp	short loc_1908		; (B33A)
loc_1907:
		cmp	ax,word ptr ds:[278Dh]	; (94E8:278D=8)
		jae	loc_1908		; Jump if above or =
		mov	word ptr ds:[278Dh],ax	; (94E8:278D=8)
		mov	word ptr ds:[278Fh],dx	; (94E8:278F=0DEBh)
loc_1908:
		mov	ax,es:[si+0Eh]
		mov	bx,es:[si+10h]
;*		call	far ptr sub_233		;*(1548:1694)
		db	 9Ah, 94h, 16h, 48h, 15h
		cmp	ax,word ptr ds:[278Fh]	; (94E8:278F=0DEBh)
		jb	loc_1910		; Jump if below
		ja	loc_1909		; Jump if above
		cmp	bx,word ptr ds:[278Dh]	; (94E8:278D=8)
		jbe	loc_1910		; Jump if below or =
loc_1909:
		mov	word ptr ds:[278Fh],ax	; (94E8:278F=0DEBh)
		mov	word ptr ds:[278Dh],bx	; (94E8:278D=8)
loc_1910:
		mov	byte ptr ds:[2C3Fh],3	; (94E8:2C3F=3)
		mov	byte ptr ds:[2C40h],3	; (94E8:2C40=0)
;*		call	far ptr sub_199		;*(1548:066C)
		db	 9Ah, 6Ch, 06h, 48h, 15h
loc_1911:
		jmp	short loc_1913		; (B36F)
loc_1912:
		mov	bl,0Eh
loc_1913:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1914		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1914		; Jump if equal
		call	sub_115			; (83A4)
loc_1914:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
sub_137		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_138		proc	near
		push	ax
		push	bx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	ds
		mov	di,8
		mov	bx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		call	sub_118			; (84C0)
		call	sub_104			; (80B9)
loc_1915:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_1916		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		jne	loc_1916		; Jump if not equal
		jmp	short loc_1918		; (B3D4)
loc_1916:
		and	byte ptr es:[di+4],0FEh
		jmp	short $+2		; delay for I/O
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_1917		; Jump if not zero
		mov	al,es:[di+6]
loc_1917:
		add	di,ax
		jmp	short loc_1915		; (B3A7)
loc_1918:
		pop	ds
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1919		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1919		; Jump if equal
		call	sub_115			; (83A4)
loc_1919:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	bx
		pop	ax
		retn
sub_138		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_139		proc	near
		mov	al,es:[di+12h]
		test	byte ptr ds:[2A77h],0E0h	; (AAC0:2A77=0)
		jnz	loc_1920		; Jump if not zero
		or	al,1
loc_1920:
		not	al
		and	al,byte ptr ds:[2ECCh]	; (AAC0:2ECC=0)
		jnz	loc_1921		; Jump if not zero
		jmp	loc_1928		; (B4A9)
loc_1921:
		cmp	al,40h			; '@'
		jne	loc_1926		; Jump if not equal
		test	byte ptr ds:[2A79h],7	; (AAC0:2A79=0)
		jz	loc_1926		; Jump if zero
		and	byte ptr ds:[2ECCh],0BFh	; (AAC0:2ECC=0)
		test	byte ptr ds:[2ECCh],7Fh	; (AAC0:2ECC=0)
		jz	loc_1922		; Jump if zero
		inc	word ptr ds:[2ECDh]	; (AAC0:2ECD=0)
		jmp	short loc_1923		; (B433)
loc_1922:
		mov	word ptr ds:[2ECDh],0FFFFh	; (AAC0:2ECD=0)
loc_1923:
		cmp	byte ptr ds:[263Eh],1	; (AAC0:263E=0)
		je	loc_1924		; Jump if equal
		jmp	short loc_1928		; (B4A9)
loc_1924:
		push	dx
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	dx,2853h
		call	sub_53			; (6418)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1925		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1925		; Jump if equal
		call	sub_115			; (83A4)
loc_1925:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	dx
		jmp	short loc_1928		; (B4A9)
loc_1926:
		mov	ax,word ptr ds:[2ECDh]	; (AAC0:2ECD=0)
		mov	word ptr ds:[2D84h],ax	; (AAC0:2D84=0)
		mov	byte ptr ds:[2ECCh],0	; (AAC0:2ECC=0)
		mov	byte ptr ds:[2F01h],0	; (AAC0:2F01=0)
		mov	word ptr ds:[2ECDh],0FFFFh	; (AAC0:2ECD=0)
		mov	word ptr ds:[2A16h],0	; (AAC0:2A16=0)
		or	byte ptr ds:[2D8Dh],5	; (AAC0:2D8D=0)
		mov	byte ptr ds:[2A7Ah],0	; (AAC0:2A7A=0)
		call	sub_80			; (7190)
		cmp	byte ptr ds:[263Eh],1	; (3A16:263E=0FFh)
		jne	loc_1927		; Jump if not equal
		mov	ax,word ptr ds:[2D84h]	; (3A16:2D84=0FFFFh)
		mov	bp,27CFh
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_1927:
		stc				; Set carry flag
		jmp	short loc_1929		; (B4AA)
loc_1928:
		clc				; Clear carry flag
loc_1929:
		retn
sub_139		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_140		proc	near
		mov	word ptr ds:[2ECDh],0FFFFh	; (AAC0:2ECD=0)
		mov	byte ptr ds:[2ECCh],0	; (AAC0:2ECC=0)
		mov	byte ptr ds:[2F01h],0	; (AAC0:2F01=0)
		mov	byte ptr cs:data_684,90h	; (020C:F5BA=3Ch)
		mov	byte ptr cs:data_685,90h	; (020C:F5BB=0BEh)
		mov	byte ptr cs:data_686,90h	; (020C:F5BC=72h)
		mov	byte ptr cs:data_687,90h	; (020C:F5BD=5)
		mov	byte ptr ds:[4201h],20h	; (AAC0:4201=0) ' '
		and	byte ptr ds:[2ECAh],0CFh	; (AAC0:2ECA=0)
		and	byte ptr ds:[2ECAh],0FCh	; (AAC0:2ECA=0)
		test	byte ptr ds:[2ECAh],4	; (AAC0:2ECA=0)
		jz	loc_1930		; Jump if zero
		or	byte ptr ds:[2ECAh],3	; (AAC0:2ECA=0)
loc_1930:
		retn
sub_140		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_141		proc	near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		test	byte ptr ds:[2ECCh],6	; (94E8:2ECC=91h)
		jnz	loc_1931		; Jump if not zero
		jmp	short loc_1935		; (B560)
loc_1931:
		cld				; Clear direction
		mov	al,byte ptr ds:[2A75h]	; (94E8:2A75=75h)
		mov	byte ptr ds:[2A76h],al	; (94E8:2A76=2)
		mov	byte ptr ds:[2A75h],34h	; (94E8:2A75=75h) '4'
		call	sub_109			; (80CE)
		mov	si,27FAh
		mov	di,2802h
		mov	cx,7
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	bp,27FAh
		mov	si,30C5h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	bp,27FDh
		test	byte ptr ds:[2ECCh],4	; (94E8:2ECC=91h)
		jnz	loc_1932		; Jump if not zero
		mov	al,dl
		or	al,1
		cmp	al,71h			; 'q'
		je	loc_1933		; Jump if equal
		cmp	al,7Bh			; '{'
		je	loc_1933		; Jump if equal
		jmp	short loc_1935		; (B560)
loc_1932:
		mov	byte ptr ds:[2A75h],35h	; (94E8:2A75=75h) '5'
		mov	al,byte ptr ds:[340Ah]	; (94E8:340A=0A4h)
		mov	ds:[bp],al
		inc	bp
		jmp	short loc_1934		; (B556)
loc_1933:
		mov	byte ptr ds:[2A75h],69h	; (94E8:2A75=75h) 'i'
loc_1934:
		mov	al,byte ptr ds:[3401h]	; (94E8:3401=0CFh)
		mov	ds:[bp],al
		inc	bp
		jmp	short loc_1935		; (B560)
loc_1935:
		test	byte ptr ds:[2ECCh],8	; (94E8:2ECC=91h)
		jnz	loc_1940		; Jump if not zero
		mov	bl,byte ptr ds:[2ECAh]	; (94E8:2ECA=0C5h)
		and	bl,7
		cmp	bl,0
		je	loc_1943		; Jump if equal
		cmp	bl,6
		je	loc_1943		; Jump if equal
		cmp	bl,7
		jne	loc_1936		; Jump if not equal
		test	dl,1
		jz	loc_1943		; Jump if zero
		jmp	short loc_1938		; (B599)
loc_1936:
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_1937		; Jump if zero
		cmp	bl,7
		je	loc_1938		; Jump if equal
		jmp	short loc_1940		; (B5B7)
loc_1937:
		cmp	bl,1
		je	loc_1938		; Jump if equal
		jmp	short loc_1940		; (B5B7)
loc_1938:
		mov	di,27FAh
		test	byte ptr ds:[2ECCh],6	; (94E8:2ECC=91h)
		jz	loc_1939		; Jump if zero
		mov	di,2802h
loc_1939:
		mov	al,byte ptr ds:[3413h]	; (94E8:3413=0B4h)
		mov	cx,7
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		dec	di
		mov	al,byte ptr ds:[3400h]	; (94E8:3400=8Bh)
		mov	[di],al
		jmp	short loc_1943		; (B5D8)
loc_1940:
		mov	di,27FAh
		test	byte ptr ds:[2ECCh],6	; (94E8:2ECC=91h)
		jz	loc_1941		; Jump if zero
		mov	di,2802h
loc_1941:
		mov	al,byte ptr ds:[3413h]	; (94E8:3413=0B4h)
		test	dl,1
		jnz	loc_1942		; Jump if not zero
		mov	al,byte ptr ds:[33FEh]	; (94E8:33FE=0F2h)
loc_1942:
		mov	cx,7
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		dec	di
		mov	byte ptr [di],20h	; ' '
loc_1943:
		mov	di,27FAh
		test	byte ptr ds:[2ECCh],6	; (94E8:2ECC=91h)
		jz	loc_1944		; Jump if zero
		mov	di,2802h
loc_1944:
		mov	cx,7
		mov	al,20h			; ' '
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		mov	bp,di
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1945		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1945		; Jump if equal
		call	sub_115			; (83A4)
loc_1945:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_141		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_142		proc	near
		cmp	byte ptr ds:[2A7Eh],1	; (0000:2A7E=0)
		je	loc_1946		; Jump if equal
		jmp	loc_1957		; (B713)
loc_1946:
		push	ax
		push	bx
		push	cx
		push	si
		xor	ch,ch			; Zero register
		mov	al,byte ptr ds:[2A7Dh]	; (0000:2A7D=54h)
		and	al,7
		cmp	al,5
		jne	loc_1948		; Jump if not equal
		inc	ch
		mov	ah,byte ptr ds:[2A7Ch]	; (0000:2A7C=0B2h)
		and	ah,0C4h
		cmp	ah,4
		jne	loc_1948		; Jump if not equal
		test	byte ptr ds:[2ECCh],8	; (0000:2ECC=58h)
		jz	loc_1947		; Jump if zero
		mov	bh,byte ptr ds:[2A62h]	; (0000:2A62=0C4h)
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_1947:
		mov	byte ptr ds:[bp],5Bh	; '['
		inc	bp
		mov	ax,word ptr ds:[2ED2h]	; (0000:2ED2=2AE8h)
		mov	bx,word ptr ds:[2ED0h]	; (0000:2ED0=0E17h)
;*		call	far ptr sub_185		;*(1548:01E8)
		db	 9Ah,0E8h, 01h, 48h, 15h
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
		and	byte ptr ds:[2A7Fh],0FEh	; (0000:2A7F=0)
		jmp	short loc_1951		; (B6AC)
loc_1948:
		mov	ah,al
		add	al,ah
		add	al,ah
		mov	si,2FA9h
		xor	ah,ah			; Zero register
		add	si,ax
		mov	byte ptr ds:[bp],5Bh	; '['
		inc	bp
		mov	ax,[si]
		mov	ds:[bp],ax
		add	si,2
		add	bp,2
		mov	al,[si]
		mov	ds:[bp],al
		inc	bp
		cmp	ch,1
		jne	loc_1949		; Jump if not equal
		cmp	byte ptr ds:[2ED0h],0	; (0000:2ED0=17h)
		jne	loc_1949		; Jump if not equal
		cmp	byte ptr ds:[2ECFh],1	; (0000:2ECF=75h)
		je	loc_1950		; Jump if equal
loc_1949:
		call	sub_144			; (B770)
loc_1950:
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
loc_1951:
		mov	al,byte ptr ds:[2A7Dh]	; (0000:2A7D=55h)
		mov	cl,3
		shr	al,cl			; Shift w/zeros fill
		and	al,7
		cmp	al,4
		je	loc_1956		; Jump if equal
		mov	ah,al
		add	al,ah
		add	al,ah
		mov	si,2FA9h
		xor	ah,ah			; Zero register
		add	si,ax
		mov	byte ptr ds:[bp],5Bh	; '['
		inc	bp
		mov	ax,[si]
		mov	ds:[bp],ax
		add	si,2
		add	bp,2
		mov	al,[si]
		mov	ds:[bp],al
		inc	bp
		mov	al,byte ptr ds:[2A7Dh]	; (0000:2A7D=55h)
		mov	cl,6
		shr	al,cl			; Shift w/zeros fill
		and	al,3
		cmp	al,0
		je	loc_1955		; Jump if equal
		mov	byte ptr ds:[bp],2Ah	; '*'
		inc	bp
		cmp	al,1
		jne	loc_1952		; Jump if not equal
		mov	al,32h			; '2'
		jmp	short loc_1954		; (B704)
loc_1952:
		cmp	al,2
		jne	loc_1953		; Jump if not equal
		mov	al,34h			; '4'
		jmp	short loc_1954		; (B704)
loc_1953:
		mov	al,38h			; '8'
loc_1954:
		mov	ds:[bp],al
		inc	bp
loc_1955:
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
loc_1956:
		pop	si
		pop	cx
		pop	bx
		pop	ax
loc_1957:
		retn
sub_142		endp
  
		push	dx
		push	cx
		push	di
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	si,27B5h
		cmp	byte ptr [si],0
		je	loc_1958		; Jump if equal
		mov	di,27D5h
		call	sub_91			; (7C34)
		mov	cx,15h
		call	sub_109			; (80CE)
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_1958:
		mov	byte ptr ds:[27B5h],0	; (94E8:27B5=47h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1959		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1959		; Jump if equal
		call	sub_115			; (83A4)
loc_1959:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		pop	di
		pop	cx
		pop	dx
		retn
		add	word ptr ds:[90DBh][bx],ax	; (020C:90DB=3C09h)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_143		proc	near
		mov	byte ptr cs:[8254h],1	; (020C:8254=16h)
		jmp	short loc_1960		; (B776)
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_144:
		mov	byte ptr cs:[8254h],0	; (020C:8254=16h)
loc_1960:
		cmp	byte ptr ds:[2ECFh],0	; (0000:2ECF=75h)
		jne	loc_1961		; Jump if not equal
		jmp	loc_1969		; (B823)
loc_1961:
		push	ax
		push	bx
		xor	ax,ax			; Zero register
		mov	bx,ax
		mov	byte ptr ds:[bp],2Bh	; '+'
		cmp	byte ptr ds:[2ECFh],1	; (0000:2ECF=75h)
		jne	loc_1964		; Jump if not equal
		mov	al,byte ptr ds:[2ED0h]	; (0000:2ED0=17h)
		test	al,80h
		jz	loc_1962		; Jump if zero
		dec	ah
loc_1962:
		cmp	byte ptr cs:[8254h],1	; (020C:8254=16h)
		jne	loc_1963		; Jump if not equal
		xor	ah,ah			; Zero register
		dec	al
		sub	al,byte ptr ds:[2A7Ah]	; (0000:2A7A=0)
		dec	al
		test	al,80h
		jz	loc_1963		; Jump if zero
		mov	ah,0FFh
loc_1963:
		mov	byte ptr ds:[2ED3h],ah	; (0000:2ED3=2Ah)
		mov	byte ptr ds:[2ED2h],ah	; (0000:2ED2=0E8h)
		mov	byte ptr ds:[2ED1h],ah	; (0000:2ED1=0Eh)
		jmp	short loc_1967		; (B7F8)
loc_1964:
		cmp	byte ptr ds:[2ECFh],2	; (0000:2ECF=75h)
		jne	loc_1967		; Jump if not equal
		mov	ax,word ptr ds:[2ED0h]	; (0000:2ED0=0E17h)
		cmp	byte ptr cs:[8254h],1	; (020C:8254=16h)
		jne	loc_1965		; Jump if not equal
		sub	ax,2
		cmp	word ptr ds:[2A84h],0	; (0000:2A84=531Eh)
		jne	loc_1965		; Jump if not equal
		dec	ax
		sub	al,byte ptr ds:[2A7Ah]	; (0000:2A7A=0)
		sbb	ah,0
loc_1965:
		test	ax,8000h
		jz	loc_1966		; Jump if zero
		mov	word ptr ds:[2ED2h],0FFFFh	; (0000:2ED2=2AE8h)
		jmp	short loc_1967		; (B7F8)
loc_1966:
		mov	word ptr ds:[2ED2h],0	; (0000:2ED2=2AE8h)
loc_1967:
		mov	ax,word ptr ds:[2ED2h]	; (0000:2ED2=2AE8h)
		mov	bx,word ptr ds:[2ED0h]	; (0000:2ED0=0E17h)
		test	ax,8000h
		jz	loc_1968		; Jump if zero
		mov	ax,word ptr ds:[2ED0h]	; (0000:2ED0=0E17h)
		not	ax
		adc	ax,1
		mov	bx,ax
		mov	ax,word ptr ds:[2ED2h]	; (0000:2ED2=2AE8h)
		not	ax
		adc	ax,0
		mov	byte ptr ds:[bp],2Dh	; '-'
loc_1968:
		inc	bp
;*		call	far ptr sub_185		;*(1548:01E8)
		db	 9Ah,0E8h, 01h, 48h, 15h
		pop	bx
		pop	ax
loc_1969:
		retn
sub_143		endp
  
		cmp	byte ptr ds:[263Eh],1	; (0000:263E=26h)
		jne	loc_1971		; Jump if not equal
		push	ax
		push	cx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	cx,7
		mov	di,27FAh
		mov	al,20h			; ' '
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		dec	di
		mov	cl,byte ptr ds:[3400h]	; (94E8:3400=8Bh)
		mov	es:[di],cl
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1970		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1970		; Jump if equal
		call	sub_115			; (83A4)
loc_1970:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	cx
		pop	ax
loc_1971:
		retn
		xchg	bx,bx
		nop
		cmp	data_234,1		; (020C:263E=10h)
		jne	loc_1973		; Jump if not equal
		push	ax
		push	cx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	cx,7
		mov	di,27FAh
		mov	al,byte ptr ds:[340Ch]	; (94E8:340C=0BEh)
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		mov	ax,es:[di]
		mov	cl,byte ptr ds:[3400h]	; (94E8:3400=8Bh)
		mov	es:[di],cl
		inc	di
		mov	es:[di],ax
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1972		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1972		; Jump if equal
		call	sub_115			; (83A4)
loc_1972:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	cx
		pop	ax
loc_1973:
		retn
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_145		proc	near
		push	bx
		push	cx
		push	dx
		push	ds
		mov	cl,20h			; ' '
		mov	ax,1
		shr	ax,cl			; Shift w/zeros fill
		cmp	ax,0
		jne	loc_1974		; Jump if not equal
		mov	al,1
		jmp	short loc_1978		; (B922)
loc_1974:
		push	sp
		pop	ax
		cmp	ax,sp
		je	loc_1975		; Jump if equal
		mov	al,4
		jmp	short loc_1978		; (B922)
loc_1975:
		cmp	byte ptr ds:[1311h],0	; (94E8:1311=78h)
		je	loc_1976		; Jump if equal
		mov	al,10h
		jmp	short loc_1981		; (B93F)
loc_1976:
;*		pop	cs			; Dangerous 8088 only
		db	0Fh
		add	ax,sp
		test	ax,1
		jz	loc_1977		; Jump if zero
		mov	al,0
		jmp	short loc_1978		; (B922)
loc_1977:
		mov	ax,3506h
		int	21h			; DOS Services  ah=function 35h
						;  get intrpt vector al in es:bx
		push	es
		push	bx
		mov	ax,2506h
		push	cs
		pop	ds
		mov	dx,8402h
		int	21h			; DOS Services  ah=function 25h
						;  set intrpt vector al to ds:dx
		mov	al,10h
		db	66h
		nop
		mov	al,20h			; ' '
;*		pop	cs			; Dangerous 8088 only
		db	0Fh
		or	data_678[bx+si],si	; (020C:EB40=0D9A1h)
		add	bx,[bx+di+59h]
		pop	cx
		pop	dx
		pop	ds
		mov	bl,al
		mov	ax,2506h
		int	21h			; DOS Services  ah=function 25h
						;  set intrpt vector al to ds:dx
		mov	al,bl
		jmp	short loc_1978		; (B922)
loc_1978:
		mov	bl,al
		call	sub_147			; (B9D0)
		cmp	bl,0
		jne	loc_1979		; Jump if not equal
		mov	bl,al
loc_1979:
		cmp	al,bl
		je	loc_1980		; Jump if equal
		jc	loc_1980		; Jump if carry Set
		mov	bl,al
loc_1980:
		call	sub_146			; (B944)
		cmp	al,bl
		jae	loc_1981		; Jump if above or =
		mov	al,bl
loc_1981:
		pop	ds
		pop	dx
		pop	cx
		pop	bx
		retn
sub_145		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_146		proc	near
		pushf				; Push flags
		mov	cl,20h			; ' '
		mov	ax,1
		shr	ax,cl			; Shift w/zeros fill
		cmp	ax,0
		jne	loc_1982		; Jump if not equal
		mov	al,1
		jmp	short loc_1987		; (B9CE)
loc_1982:
		push	sp
		pop	ax
		cmp	ax,sp
		je	loc_1983		; Jump if equal
		mov	al,4
		jmp	short loc_1987		; (B9CE)
loc_1983:
		cli				; Disable interrupts
		mov	al,1
		jmp	short loc_1984		; (B970)
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
loc_1984:
		mov	byte ptr cs:[8467h],1	; (020C:8467=1Ch)
		mov	al,1
		nop
		cmp	al,10h
		jne	loc_1987		; Jump if not equal
		mov	al,20h			; ' '
		jmp	short loc_1985		; (B990)
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		nop
loc_1985:
		mov	byte ptr cs:[848Ch],10h	; (020C:848C=3Ch)
		nop
		nop
		nop
		nop
		nop
		mov	al,20h			; ' '
		cmp	al,20h			; ' '
		jne	loc_1987		; Jump if not equal
		mov	al,20h			; ' '
		jmp	short loc_1986		; (B9B0)
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		xchg	bx,bx
		nop
loc_1986:
		mov	cs:data_574,20h		; (020C:84BD=0C3h) ' '
		db	22 dup (90h)
		mov	al,40h			; '@'
loc_1987:
		popf				; Pop flags
		retn
sub_146		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_147		proc	near
		xor	ax,ax			; Zero register
		push	ax
		popf				; Pop flags
		pushf				; Push flags
		pop	ax
		and	ax,0F000h
		cmp	ax,0F000h
		mov	al,1
		jz	loc_1989		; Jump if zero
		push	sp
		pop	ax
		cmp	ax,sp
		je	loc_1988		; Jump if equal
		mov	al,4
		jmp	short loc_1989		; (B9FA)
loc_1988:
		mov	ax,0F000h
		push	ax
		popf				; Pop flags
		pushf				; Push flags
		pop	ax
		and	ax,0F000h
		mov	al,10h
		jz	loc_1989		; Jump if zero
		mov	al,20h			; ' '
loc_1989:
		retn
sub_147		endp
  
		nop
		cmp	byte ptr ds:[2638h],4	; (94E8:2638=0)
		jne	loc_1990		; Jump if not equal
		test	byte ptr ds:[2D8Dh],2	; (94E8:2D8D=0D1h)
		jnz	loc_1991		; Jump if not zero
loc_1990:
		jmp	loc_1994		; (BA8C)
loc_1991:
		push	ax
		push	bx
		push	dx
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	bx,word ptr ds:[2D94h]	; (94E8:2D94=86E9h)
		mov	ax,word ptr ds:[2D96h]	; (94E8:2D96=89E9h)
		mov	dx,4
		call	sub_84			; (7498)
		jnc	loc_1992		; Jump if carry=0
		mov	al,es:[di+32h]
		and	al,38h			; '8'
		cmp	al,38h			; '8'
		je	loc_1992		; Jump if equal
		add	byte ptr es:[di+32h],8
		and	byte ptr ds:[2D8Dh],0FDh	; (A80C:2D8D=0)
		test	byte ptr es:[di+5],20h	; ' '
		jnz	loc_1992		; Jump if not zero
		mov	ax,word ptr ds:[2A40h]	; (A80C:2A40=0)
		sub	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		cmp	ax,18h
		jbe	loc_1992		; Jump if below or =
		mov	ax,18h
		mov	byte ptr ds:[47B5h],1	; (A80C:47B5=0)
;*		call	far ptr sub_204		;*(1548:0AA4)
		db	 9Ah,0A4h, 0Ah, 48h, 15h
		mov	byte ptr ds:[47B5h],0	; (A80C:47B5=0)
		cmp	ax,17h
		jb	loc_1992		; Jump if below
		or	byte ptr es:[di+5],20h	; ' '
loc_1992:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1993		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1993		; Jump if equal
		call	sub_115			; (83A4)
loc_1993:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	dx
		pop	bx
		pop	ax
loc_1994:
		retn
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_148		proc	near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_104			; (80B9)
		call	sub_113			; (80E9)
		mov	bx,ax
		mov	ax,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		mov	cx,cs
		sub	bx,cx
		sub	ax,bx
		mov	cx,6
		shr	ax,cl			; Shift w/zeros fill
		mov	bp,6E6h
		mov	bl,1
		cmp	ax,3E7h
		ja	loc_1995		; Jump if above
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	bx,word ptr ds:[1306h]	; (94E8:1306=0CD48h)
		mov	byte ptr [bx+5Eh],7
loc_1995:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		je	loc_1996		; Jump if equal
		mov	byte ptr [bx+5Dh],7
loc_1996:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1997		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1997		; Jump if equal
		call	sub_115			; (83A4)
loc_1997:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_1998		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_1998		; Jump if equal
		call	sub_115			; (83A4)
loc_1998:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_148		endp
  
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_149		proc	near
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_104			; (80B9)
		call	sub_112			; (80E6)
		mov	bx,1064h
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		shr	bx,1			; Shift w/zeros fill
		add	ax,bx
		mov	bx,ax
		mov	ax,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		mov	cx,cs
		sub	bx,cx
data_646	db	2Bh
		retn
sub_149		endp
  
		mov	cx,6
		shr	ax,cl			; Shift w/zeros fill
		mov	dx,ax
		mov	bx,word ptr data_278+1	; (020C:278F=0A0E0h)
		mov	ax,word ptr data_276+3	; (020C:278D=0AAA5h)
		mov	cx,0Ah
		add	ax,3FFh
		adc	bx,0
		clc				; Clear carry flag
  
locloop_1999:
		shr	bx,1			; Shift w/zeros fill
		rcr	ax,1			; Rotate thru carry
		loop	locloop_1999		; Loop if cx > 0
  
		xchg	ax,dx
		sub	ax,dx
		cmp	ax,0
		jge	loc_2000		; Jump if > or =
		xor	ax,ax			; Zero register
loc_2000:
		mov	bp,6E8h
		mov	word ptr ds:[bp],2020h
		mov	byte ptr ds:[bp+2],20h	; ' '
		mov	bp,6E6h
		mov	bl,1
		cmp	ax,3E7h
		ja	loc_2001		; Jump if above
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	bx,word ptr ds:[1306h]	; (020C:1306=0)
		mov	byte ptr [bx+5Eh],7
loc_2001:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		je	loc_2002		; Jump if equal
		mov	byte ptr [bx+5Dh],7
loc_2002:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2003		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2003		; Jump if equal
		call	sub_115			; (83A4)
loc_2003:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2004		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2004		; Jump if equal
		call	sub_115			; (83A4)
loc_2004:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_150		proc	near
		push	es
		push	di
		push	cx
		push	ds
		pop	es
		mov	di,42D0h
		mov	cx,10h
		mov	ax,0FFFFh
		cld				; Clear direction
		rep	stosw			; Rep when cx >0 Store ax to es:[di]
		pop	cx
		pop	di
		pop	es
		mov	ax,0FFFFh
		cmp	data_503,ax		; (020C:42F9=12D0h)
		je	loc_2008		; Jump if equal
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	bx,data_502		; (020C:42F7=9A01h)
		mov	ax,data_503		; (020C:42F9=12D0h)
		mov	dx,4
		call	sub_84			; (7498)
		jnc	loc_2005		; Jump if carry=0
		mov	ax,word ptr ds:[42F3h]	; (A80C:42F3=0)
		mov	es:[di+7],ax
loc_2005:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2006		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2006		; Jump if equal
		call	sub_115			; (83A4)
loc_2006:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2007		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2007		; Jump if equal
		call	sub_115			; (83A4)
loc_2007:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
loc_2008:
		mov	ax,0FFFFh
		mov	data_498,al		; (020C:42F0=0CCh)
		mov	data_502,ax		; (020C:42F7=9A01h)
		mov	data_503,ax		; (020C:42F9=12D0h)
		xor	ax,ax			; Zero register
		mov	data_499,ax		; (020C:42F1=142h)
		mov	data_500,ax		; (020C:42F3=7400h)
		retn
sub_150		endp
  
		push	ax
		push	bx
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_108			; (80CB)
		mov	si,3E04h
loc_2009:
		cmp	dl,es:[si]
		je	loc_2011		; Jump if equal
		jc	loc_2010		; Jump if carry Set
		add	si,25h
		jmp	short loc_2009		; (BCA3)
loc_2010:
		jmp	loc_2024		; (BD66)
loc_2011:
		test	byte ptr es:[si+2],0C0h
		jz	loc_2015		; Jump if zero
		mov	ax,data_393		; (020C:2ED4=5300h)
loc_2012:
		cmp	dl,es:[si]
		jne	loc_2010		; Jump if not equal
		mov	bh,es:[si+3]
		mov	bl,es:[si+4]
		test	byte ptr es:[si+2],20h	; ' '
		jz	loc_2013		; Jump if zero
		xchg	bl,bh
		cmp	ax,bx
		jmp	short loc_2014		; (BCD8)
loc_2013:
		cmp	ah,bh
loc_2014:
		je	loc_2015		; Jump if equal
		jc	loc_2010		; Jump if carry Set
		add	si,25h
		jmp	short loc_2012		; (BCBC)
loc_2015:
		mov	bl,data_323		; (020C:2A77=0A5h)
		and	bl,es:[si+1]
		jz	loc_2024		; Jump if zero
		mov	ax,es:[si+5]
		test	ax,0E0E0h
		jz	loc_2024		; Jump if zero
		test	ax,0E000h
		jz	loc_2020		; Jump if zero
		push	bx
		mov	bx,data_399		; (020C:2EF2=575Ch)
		mov	data_501,bx		; (020C:42F5=0B007h)
		pop	bx
		and	data_499,0FF1Fh		; (020C:42F1=142h)
		test	ax,8000h
		jz	loc_2016		; Jump if zero
		or	data_499,20h		; (020C:42F1=142h)
		jmp	short loc_2018		; (BD27)
loc_2016:
		test	ax,4000h
		jz	loc_2017		; Jump if zero
		or	data_499,40h		; (020C:42F1=142h)
		jmp	short loc_2018		; (BD27)
loc_2017:
		or	data_499,80h		; (020C:42F1=142h)
loc_2018:
		push	ax
		xchg	ah,al
		and	al,7
		call	sub_156			; (C1F8)
		pop	ax
loc_2020:
		test	ax,0E0h
		jz	loc_2024		; Jump if zero
		mov	bx,data_400		; (020C:2EF4=4E49h)
		mov	data_501,bx		; (020C:42F5=0B007h)
		and	data_499,0FF1Fh		; (020C:42F1=142h)
		test	ax,80h
		jz	loc_2021		; Jump if zero
		or	data_499,20h		; (020C:42F1=142h)
		jmp	short loc_2023		; (BD61)
loc_2021:
		test	ax,40h
		jz	loc_2022		; Jump if zero
		or	data_499,40h		; (020C:42F1=142h)
		jmp	short loc_2023		; (BD61)
loc_2022:
		or	data_499,80h		; (020C:42F1=142h)
loc_2023:
		and	al,7
		call	sub_156			; (C1F8)
loc_2024:
		call	sub_150			; (BBF4)
		mov	data_501,0FFFFh		; (020C:42F5=0B007h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2025		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2025		; Jump if equal
		call	sub_115			; (83A4)
loc_2025:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		pop	bx
		pop	ax
		retn
		xchg	bx,bx
		cmp	byte ptr ds:[2A75h],77h	; (020C:2A75=0ADh) 'w'
		jne	loc_2029		; Jump if not equal
		cmp	data_355,0		; (020C:2D84=4C4Ch)
		je	loc_2029		; Jump if equal
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	ax
		push	si
		mov	es,data_354		; (020C:2D82=4152h)
		mov	si,data_368		; (020C:2DB6=444Eh)
		mov	al,es:[si]
		cmp	al,68h			; 'h'
		je	loc_2026		; Jump if equal
		cmp	al,50h			; 'P'
		jb	loc_2027		; Jump if below
		cmp	al,57h			; 'W'
		ja	loc_2027		; Jump if above
		and	al,7
		mov	data_499,44h		; (020C:42F1=142h)
		call	sub_156			; (C1F8)
		jmp	short loc_2027		; (BDDA)
loc_2026:
		mov	ax,data_368		; (020C:2DB6=444Eh)
		mov	data_499,44h		; (020C:42F1=142h)
		call	sub_151			; (BE74)
loc_2027:
		pop	si
		pop	ax
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2028		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2028		; Jump if equal
		call	sub_115			; (83A4)
loc_2028:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
loc_2029:
		call	sub_150			; (BBF4)
		retn
		esc	0,cl			; coprocessor escape
		esc	2,bl			; coprocessor escape
		esc	4,ch			; coprocessor escape
		esc	6,bh			; coprocessor escape
		db	26h
		db	9Bh
		nop
		nop
		test	data_325,0Fh		; (020C:2A79=0E0h)
		jz	loc_2037		; Jump if zero
		test	data_480,1		; (020C:42CC=0D323h)
		jz	loc_2037		; Jump if zero
		push	ax
		push	bx
		push	di
		push	es
		mov	bx,data_354		; (020C:2D82=4152h)
		mov	es,bx
		mov	di,data_355		; (020C:2D84=4C4Ch)
		mov	ax,data_298		; (020C:2A24=0E0AFh)
		cmp	ax,0
		jne	loc_2030		; Jump if not equal
		call	sub_113			; (80E9)
loc_2030:
		cmp	bx,ax
		jae	loc_2031		; Jump if above or =
		clc				; Clear carry flag
		jmp	short loc_2036		; (BE69)
loc_2031:
		mov	ax,9B9Bh
		mov	bx,es:[di]
		cmp	bl,0CDh
		je	loc_2032		; Jump if equal
		clc				; Clear carry flag
		jmp	short loc_2036		; (BE69)
loc_2032:
		mov	bl,bh
		mov	al,bl
		cmp	al,3Eh			; '>'
		jb	loc_2033		; Jump if below
		clc				; Clear carry flag
		jmp	short loc_2036		; (BE69)
loc_2033:
		sub	al,34h			; '4'
		mov	bx,88F0h
		xlat cs:[bx]			; al=[al+[bx]] table
		cmp	al,9Bh
		jne	loc_2034		; Jump if not equal
		mov	al,90h
		jmp	short loc_2035		; (BE65)
loc_2034:
		xchg	ah,al
loc_2035:
		mov	es:[di],ax
		stc				; Set carry flag
loc_2036:
		pop	es
		pop	di
		pop	bx
		pop	ax
		retn
loc_2037:
		clc				; Clear carry flag
		retn
		add	[bx+si],al
		xchg	bx,bx
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_151		proc	near
		test	data_499,0E0h		; (020C:42F1=142h)
		jnz	loc_2038		; Jump if not zero
		retn
loc_2038:
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		jmp	loc_2055		; (BFFD)
		nop
		cmp	data_482,0FFFFh		; (020C:42D0=42CEh)
		je	loc_2039		; Jump if equal
		test	data_499,0E0h		; (020C:42F1=142h)
		jnz	loc_2040		; Jump if not zero
		retn
loc_2039:
		push	ax
		mov	al,1
;*		call	far ptr sub_231		;*(1548:1530)
		db	 9Ah, 30h, 15h, 48h, 15h
		pop	ax
		retn
loc_2040:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,data_482		; (020C:42D0=42CEh)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,data_483		; (020C:42D2=0EB46h)
		jmp	loc_2055		; (BFFD)
		xchg	bx,bx
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_152:
		cmp	word ptr ds:[42D4h],0FFFFh	; (94E8:42D4=301h)
		je	loc_2041		; Jump if equal
		test	word ptr ds:[42F1h],0E0h	; (94E8:42F1=2688h)
		jnz	loc_2042		; Jump if not zero
		retn
loc_2041:
		push	ax
		mov	al,2
;*		call	far ptr sub_231		;*(1548:1530)
		db	 9Ah, 30h, 15h, 48h, 15h
		pop	ax
		retn
loc_2042:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,word ptr ds:[42D4h]	; (94E8:42D4=301h)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,word ptr ds:[42D6h]	; (94E8:42D6=1F06h)
		jmp	loc_2055		; (BFFD)
		xchg	bx,bx
		cmp	word ptr ds:[42D8h],0FFFFh	; (94E8:42D8=33BAh)
		je	loc_2043		; Jump if equal
		test	word ptr ds:[42F1h],0E0h	; (94E8:42F1=2688h)
		jnz	loc_2044		; Jump if not zero
		retn
loc_2043:
		push	ax
		mov	al,3
;*		call	far ptr sub_231		;*(1548:1530)
		db	 9Ah, 30h, 15h, 48h, 15h
		pop	ax
		retn
loc_2044:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,word ptr ds:[42D8h]	; (94E8:42D8=33BAh)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,word ptr ds:[42DAh]	; (94E8:42DA=0B803h)
		jmp	loc_2055		; (BFFD)
		xchg	bx,bx
		cmp	word ptr ds:[42DCh],0FFFFh	; (94E8:42DC=4300h)
		je	loc_2045		; Jump if equal
		test	word ptr ds:[42F1h],0E0h	; (94E8:42F1=2688h)
		jnz	loc_2046		; Jump if not zero
		retn
loc_2045:
		push	ax
		mov	al,4
;*		call	far ptr sub_231		;*(1548:1530)
		db	 9Ah, 30h, 15h, 48h, 15h
		pop	ax
		retn
loc_2046:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,word ptr ds:[42DCh]	; (94E8:42DC=4300h)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,word ptr ds:[42DEh]	; (94E8:42DE=21CDh)
		jmp	loc_2055		; (BFFD)
		xchg	bx,bx
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_153:
		cmp	word ptr ds:[42E4h],0FFFFh	; (94E8:42E4=10h)
		je	loc_2047		; Jump if equal
		test	word ptr ds:[42F1h],0E0h	; (94E8:42F1=2688h)
		jnz	loc_2048		; Jump if not zero
		retn
loc_2047:
		push	ax
		mov	al,6
;*		call	far ptr sub_231		;*(1548:1530)
		db	 9Ah, 30h, 15h, 48h, 15h
		pop	ax
		retn
loc_2048:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,word ptr ds:[42E4h]	; (94E8:42E4=10h)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,word ptr ds:[42E6h]	; (94E8:42E6=175h)
		jmp	loc_2055		; (BFFD)
		xchg	bx,bx
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_154:
		cmp	word ptr ds:[42E0h],0FFFFh	; (94E8:42E0=772h)
		je	loc_2049		; Jump if equal
		test	word ptr ds:[42F1h],0E0h	; (94E8:42F1=2688h)
		jnz	loc_2050		; Jump if not zero
		retn
loc_2049:
		push	ax
		mov	al,5
;*		call	far ptr sub_231		;*(1548:1530)
		db	 9Ah, 30h, 15h, 48h, 15h
		pop	ax
		retn
loc_2050:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,word ptr ds:[42E0h]	; (94E8:42E0=772h)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,word ptr ds:[42E2h]	; (94E8:42E2=0C1F7h)
		jmp	short loc_2055		; (BFFD)
		xchg	bx,bx
		nop
		cmp	word ptr ds:[42ECh],0FFFFh	; (94E8:42EC=7307h)
		je	loc_2051		; Jump if equal
		test	word ptr ds:[42F1h],60h	; (94E8:42F1=2688h)
		jnz	loc_2052		; Jump if not zero
loc_2051:
		retn
loc_2052:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,word ptr ds:[42ECh]	; (94E8:42EC=7307h)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,word ptr ds:[42EEh]	; (94E8:42EE=0B414h)
		jmp	short loc_2055		; (BFFD)
		nop
  
;ЯЯЯЯ External Entry into Subroutine ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
  
sub_155:
		cmp	word ptr ds:[42E8h],0FFFFh	; (94E8:42E8=5EF9h)
		je	loc_2053		; Jump if equal
		test	word ptr ds:[42F1h],0E0h	; (94E8:42F1=2688h)
		jnz	loc_2054		; Jump if not zero
		retn
loc_2053:
		push	ax
		mov	al,7
;*		call	far ptr sub_231		;*(1548:1530)
		db	 9Ah, 30h, 15h, 48h, 15h
		pop	ax
		retn
loc_2054:
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		mov	ax,word ptr ds:[42E8h]	; (94E8:42E8=5EF9h)
		mov	word ptr cs:[8960h],ax	; (020C:8960=443Eh)
		mov	ax,word ptr ds:[42EAh]	; (94E8:42EA=5F1Fh)
		jmp	short loc_2055		; (BFFD)
loc_2055:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	word ptr ds:[37A4h]	; (94E8:37A4=8A12h)
		push	word ptr ds:[37A2h]	; (94E8:37A2=753Ah)
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		jne	loc_2056		; Jump if not equal
		jmp	loc_2076		; (C1B1)
loc_2056:
		mov	bx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	byte ptr ds:[4204h],1	; (94E8:4204=21h)
		mov	dx,1
		call	sub_84			; (7498)
		jnc	loc_2060		; Jump if carry=0
loc_2057:
		mov	cl,es:[di+4]
		and	cl,1Fh
		cmp	cl,1Fh
		jne	loc_2058		; Jump if not equal
		mov	cl,es:[di+9]
		cmp	cl,40h			; '@'
		jb	loc_2058		; Jump if below
		cmp	cl,44h			; 'D'
		ja	loc_2058		; Jump if above
		jmp	loc_2076		; (C1B1)
loc_2058:
		push	ax
		push	bx
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2059		; Jump if not zero
		mov	al,es:[di+6]
loc_2059:
		add	di,ax
		pop	bx
		pop	ax
		cmp	bx,es:[di]
		jne	loc_2060		; Jump if not equal
		cmp	ax,es:[di+2]
		jne	loc_2060		; Jump if not equal
		jmp	short loc_2057		; (C026)
loc_2060:
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],5Fh	; '_'
		mov	byte ptr [di+5],2
		mov	byte ptr [di+6],0
		mov	word ptr [di+7],203Fh
		push	ds
		mov	ds,bx
		mov	bx,ax
		cmp	byte ptr [bx],8Dh
data_647	dw	751Fh			; Data table (indexed access)
		sbb	byte ptr ds:[0F70Ah][bx+si],dh	; (3A16:F70A=0FFh)
		push	es
		db	0F1h
		inc	dx
		and	[bx+si],al
		jnz	loc_2062		; Jump if not zero
		mov	al,9
		test	word ptr ds:[42F1h],40h	; (3A16:42F1=6C00h)
		jnz	loc_2062		; Jump if not zero
		mov	al,8
		jmp	short loc_2062		; (C0BB)
loc_2061:
		mov	al,44h			; 'D'
		test	word ptr ds:[42F1h],20h	; (3A16:42F1=6C00h)
		jnz	loc_2062		; Jump if not zero
		mov	al,42h			; 'B'
		test	word ptr ds:[42F1h],40h	; (3A16:42F1=6C00h)
		jnz	loc_2062		; Jump if not zero
		mov	al,40h			; '@'
loc_2062:
		mov	[di+9],al
		mov	ax,word ptr ds:[2D82h]	; (3A16:2D82=0FFFFh)
		test	word ptr ds:[42F1h],4	; (3A16:42F1=6C00h)
		jnz	loc_2067		; Jump if not zero
		mov	ax,word ptr ds:[42F5h]	; (3A16:42F5=2802h)
		cmp	ax,0FFFFh
		jne	loc_2067		; Jump if not equal
		mov	ax,word ptr ds:[2EF4h]	; (3A16:2EF4=0FFFFh)
		test	byte ptr ds:[2ECCh],8	; (3A16:2ECC=0FFh)
		jz	loc_2067		; Jump if zero
		mov	cl,byte ptr ds:[2F04h]	; (3A16:2F04=0FFh)
		cmp	cl,26h			; '&'
		jne	loc_2063		; Jump if not equal
		mov	ax,word ptr ds:[2EF2h]	; (3A16:2EF2=0FFFFh)
		jmp	short loc_2067		; (C10F)
loc_2063:
		cmp	cl,2Eh			; '.'
		jne	loc_2064		; Jump if not equal
		mov	ax,word ptr ds:[2D82h]	; (3A16:2D82=0FFFFh)
		jmp	short loc_2067		; (C10F)
loc_2064:
		cmp	cl,36h			; '6'
		jne	loc_2065		; Jump if not equal
		mov	ax,word ptr ds:[2EFAh]	; (3A16:2EFA=0FFFFh)
		jmp	short loc_2067		; (C10F)
loc_2065:
		cmp	cl,64h			; 'd'
		jne	loc_2066		; Jump if not equal
		mov	ax,word ptr ds:[2EF6h]	; (3A16:2EF6=0FFFFh)
		jmp	short loc_2067		; (C10F)
loc_2066:
		cmp	cl,65h			; 'e'
		jne	loc_2067		; Jump if not equal
		mov	ax,word ptr ds:[2EF8h]	; (3A16:2EF8=0FFFFh)
loc_2067:
		mov	[di+0Ah],ax
		test	word ptr ds:[42CCh],4000h	; (3A16:42CC=4)
		jz	loc_2068		; Jump if zero
		jmp	loc_2076		; (C1B1)
loc_2068:
		call	sub_124			; (9120)
		mov	di,472Bh
		mov	bx,[di+0Ah]
		mov	ax,word ptr cs:[8960h]	; (020C:8960=443Eh)
;*		call	far ptr sub_224		;*(1548:1308)
		db	 9Ah, 08h, 13h, 48h, 15h
		mov	[di],bx
		mov	[di+2],ax
		cmp	byte ptr ds:[14ADh],1	; (3A16:14AD=0FFh)
		ja	loc_2069		; Jump if above
		or	byte ptr [di+5],1
loc_2069:
		test	word ptr ds:[42F1h],20h	; (3A16:42F1=6C00h)
		jnz	loc_2074		; Jump if not zero
		test	word ptr ds:[42F1h],40h	; (3A16:42F1=6C00h)
		jnz	loc_2070		; Jump if not zero
		test	word ptr ds:[42F1h],80h	; (3A16:42F1=6C00h)
		jnz	loc_2071		; Jump if not zero
loc_2070:
		mov	byte ptr ds:[4204h],0	; (3A16:4204=0Ch)
		mov	dx,1
		call	sub_84			; (7498)
		jc	loc_2076		; Jump if carry Set
		mov	di,472Bh
		mov	byte ptr [di+4],40h	; '@'
		jmp	short loc_2075		; (C1AE)
loc_2071:
		mov	dx,4
loc_2072:
		call	sub_84			; (7498)
		jc	loc_2076		; Jump if carry Set
		mov	di,472Bh
		mov	byte ptr [di+4],43h	; 'C'
		or	byte ptr [di+5],8
		push	di
		push	ds
		pop	es
		add	di,9
		mov	si,2ED4h
		mov	cx,29h
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	di
		jmp	short loc_2075		; (C1AE)
loc_2074:
		mov	dx,2
		call	sub_84			; (7498)
		jc	loc_2076		; Jump if carry Set
		mov	di,472Bh
		mov	byte ptr [di+4],41h	; 'A'
		or	byte ptr [di+5],4
		mov	byte ptr [di+8],1
		mov	word ptr [di+6],1000h
loc_2075:
		call	sub_124			; (9120)
loc_2076:
		mov	byte ptr ds:[4204h],0	; (A80C:4204=0)
		pop	word ptr ds:[37A2h]	; (A80C:37A2=0)
		pop	word ptr ds:[37A4h]	; (A80C:37A4=0)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2077		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2077		; Jump if equal
		call	sub_115			; (83A4)
loc_2077:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_151		endp
  
		jl	loc_2072		; Jump if <
		esc	4,ds:[8A0Ch][bx+di]	; (020C:8A0C=2Ah) coprocessor escape
		lodsb				; String [si] to al
		mov	data_647[si],bx		; (020C:C08A=751Fh)
		mov	ch,[si-76h]
		cmp	al,8Ah
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_156		proc	near
		push	bx
		xor	bx,bx			; Zero register
		mov	bl,al
		shl	bx,1			; Shift w/zeros fill
		call	cs:data_579[bx]		;*(020C:8CD5=28B9h)
		pop	bx
		retn
sub_156		endp
  
;*		jl	loc_2073		;*Jump if <
		db	 7Ch, 89h
		lodsb				; String [si] to al
		mov	sp,bx
		mov	[si],cx
		mov	ch,[si-76h]
		cmp	al,8Ah
		db	0C0h
		mov	dl,[bx+si+53h]
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	ax,data_365		; (020C:2D96=4E49h)
		mov	bx,data_364		; (020C:2D94=575Ch)
		mov	dx,4
		push	data_430		; (020C:37A4=0B8h)
		push	word ptr ds:[37A2h]	; (020C:37A2=1548h)
		call	sub_84			; (7498)
		pop	word ptr ds:[37A2h]	; (A80C:37A2=0)
		pop	word ptr ds:[37A4h]	; (A80C:37A4=0)
		jc	loc_2079		; Jump if carry Set
loc_2078:
		jmp	loc_2088		; (C312)
loc_2079:
		mov	dx,es:[di+7]
		test	dx,777h
		jz	loc_2078		; Jump if zero
		mov	ax,dx
		and	ax,0Fh
		test	ax,7
		jz	loc_2082		; Jump if zero
		mov	bp,word ptr ds:[2EF4h]	; (A80C:2EF4=0)
		test	ax,8
		jz	loc_2080		; Jump if zero
		mov	bp,word ptr ds:[2EF2h]	; (A80C:2EF2=0)
loc_2080:
		mov	word ptr ds:[42F5h],bp	; (A80C:42F5=0)
		mov	bx,ax
		and	bx,7
		dec	bx
		shl	bx,1			; Shift w/zeros fill
		mov	word ptr ds:[42F1h],20h	; (A80C:42F1=0)
		test	dx,1000h
		jz	loc_2081		; Jump if zero
		mov	word ptr ds:[42F1h],40h	; (A80C:42F1=0)
loc_2081:
		call	word ptr cs:[8CF6h][bx]	; (020C:8CF6=0F6ACh)
loc_2082:
		mov	ax,dx
		mov	cl,4
		ror	ax,cl			; Rotate
		and	ax,0Fh
		test	ax,7
		jz	loc_2085		; Jump if zero
		mov	bp,word ptr ds:[2EF4h]	; (A80C:2EF4=0)
		test	ax,8
		jz	loc_2083		; Jump if zero
		mov	bp,word ptr ds:[2EF2h]	; (A80C:2EF2=0)
loc_2083:
		mov	word ptr ds:[42F5h],bp	; (A80C:42F5=0)
		mov	bx,ax
		and	bx,7
		dec	bx
		shl	bx,1			; Shift w/zeros fill
		mov	word ptr ds:[42F1h],20h	; (A80C:42F1=0)
		test	dx,2000h
		jz	loc_2084		; Jump if zero
		mov	word ptr ds:[42F1h],40h	; (A80C:42F1=0)
loc_2084:
		call	word ptr cs:[8CF6h][bx]	;*(020C:8CF6=0F6ACh)
loc_2085:
		mov	ax,dx
		mov	cl,8
		ror	ax,cl			; Rotate
		and	ax,0Fh
		test	ax,7
		jz	loc_2088		; Jump if zero
		mov	bp,es:[di]
		test	dx,8000h
		jnz	loc_2086		; Jump if not zero
		mov	bp,word ptr ds:[2EF4h]	; (A80C:2EF4=0)
		test	ax,8
		jz	loc_2086		; Jump if zero
		mov	bp,word ptr ds:[2EF2h]	; (A80C:2EF2=0)
loc_2086:
		mov	word ptr ds:[42F5h],bp	; (A80C:42F5=0)
		mov	bx,ax
		and	bx,7
		dec	bx
		shl	bx,1			; Shift w/zeros fill
		mov	word ptr ds:[42F1h],20h	; (A80C:42F1=0)
		test	dx,2000h
		jz	loc_2087		; Jump if zero
		mov	word ptr ds:[42F1h],40h	; (A80C:42F1=0)
loc_2087:
		call	word ptr cs:[8CF6h][bx]	;*(020C:8CF6=0F6ACh)
loc_2088:
		call	sub_150			; (BBF4)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2089		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2089		; Jump if equal
		call	sub_115			; (83A4)
loc_2089:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2090		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2090		; Jump if equal
		call	sub_115			; (83A4)
loc_2090:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		dd	0C3585Bh
		add	[bx+si],al
		add	[bx+si],al
		add	word ptr ds:[90DBh][bx],ax	; (020C:90DB=3C09h)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_157		proc	near
		mov	byte ptr ds:[2A5Ch],0	; (020C:2A5C=8Eh)
		mov	byte ptr ds:[2A62h],bh	; (020C:2A62=0E1h)
		mov	cs:data_584,dl		; (020C:8E50=0C3h)
		mov	dh,0
		mov	al,dl
		mov	bl,al
loc_2091:
		push	ax
		push	si
		xor	ah,ah			; Zero register
		mov	si,8E82h
		add	si,ax
		mov	al,cs:[si]
		shl	ax,1			; Shift w/zeros fill
		mov	si,8F82h
		add	si,ax
		mov	cx,cs:[si]
		pop	si
		pop	ax
		push	cx
		retn
sub_157		endp
  
		add	[bx+di],al
		add	al,[bp+di]
		db	7 dup (3)
		db	8 dup (4)
		db	8 dup (7)
		db	8 dup (16h)
		sbb	al,1Ch
		sbb	al,5
		push	es
		or	[bx+di],cl
		db	7 dup (0)
		or	cl,[bp+si]
		add	[bx+si],al
		or	cl,[bp+si]
		and	al,[bx+si]
		add	[bx+si],al
		add	[bx+si],al
		or	cx,[si]
		add	[di],cl
		or	ax,0
		or	ax,0D0Dh
		add	[di],cl
		or	ax,0
		add	[bx+si],al
		add	[bx+si],al
		db	12 dup (0Eh)
		add	[bx+si],al
		add	[bx],cl
		adc	[bx+si],dl
		sbb	dl,[bx+si]
		pop	ds
		pop	ds
		add	[bx+si],al
		add	ax,1D06h
		push	ds
		add	[bx+si],al
		add	[bx+di],ah
		db	8 dup (12h)
		add	[bx+si],al
		adc	[bx+di],dx
		adc	[bx+di],dx
		adc	[bx+di],dx
		db	8 dup (1Bh)
		db	14 dup (13h)
		pop	ss
		pop	ss
		pop	ss
		add	[bx+si],bl
		sbb	[bx+si],bl
		sbb	[bx+si],bl
		sbb	[bp+di],dl
		db	7 dup (13h)
		and	[bx+si],ah
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
		db	8 dup (14h)
		add	[bx+si],al
		sbb	[bx+di],bx
		sbb	[bx+di],bx
		sbb	[di],dx
		db	32 dup (0)
		db	8 dup (13h)
		db	24 dup (0)
		db	3Eh
		movsw				; Mov [si] to es:[di]
		db	0C8h
		db	8Fh
		xlat				; al=[al+[bx]] table
		db	8Fh
		sub	ax,6E98h
		cbw				; Convrt byte to word
;*		jmp	loc_2019		;*(BD2E)
		db	0E9h, 8Fh,0F8h
		db	8Fh
		lodsb				; String [si] to al
		cbw				; Convrt byte to word
		inc	di
		nop
		push	si
		nop
		db	69h
		pushf				; Push flags
		test	bx,[bp-63C7h]
		push	ss
		mov	al,byte ptr ds:[948Fh]	; (0000:948F=0)
		esc	3,ds:[91C2h][si]	; (0000:91C2=0Ah) coprocessor escape
		xor	ax,0A4h
		movsb				; Mov [si] to es:[di]
		xchg	dx,word ptr ds:[919Dh][bx+si]	; (0000:919D=0FEC2h)
		xchg	ax,bp
		xchg	ax,cx
		xor	word ptr ds:[912Eh][si],bx	; (0000:912E=8B15h)
		dec	ax
		xchg	ax,cx
		cmp	ax,2D91h
		xchg	ax,sp
		and	dl,byte ptr ds:[9174h][bx+si]	; (0000:9174=80h)
		db	67h
		nop
;*		jbe	loc_2092		;*Jump if below or =
		db	 76h, 90h
;*		js	loc_2093		;*Jump if sign=1
		db	 78h, 94h
		adc	byte ptr ds:[0A3EDh][bx+di],dl	; (0000:A3ED=10h)
		xor	al,0A6h
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
		mov	cl,3
		ror	bl,cl			; Rotate
		jmp	short loc_2094		; (C4F0)
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
loc_2094:
		and	bl,7
		add	bl,88h
		jmp	loc_2101		; (C597)
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
		mov	cl,3
		ror	bl,cl			; Rotate
		jmp	short loc_2096		; (C52C)
		test	word ptr ds:[42F1h],4	; (0000:42F1=7F24h)
		jz	loc_2095		; Jump if zero
		mov	bl,es:[si+1]
		and	bl,7
		cmp	byte ptr ds:[2638h],6	; (0000:2638=5)
		jb	loc_2095		; Jump if below
		mov	al,bl
		call	sub_156			; (C1F8)
loc_2095:
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
loc_2096:
		and	bl,7
		add	bl,80h
		or	al,1
		cmp	al,69h			; 'i'
		je	loc_2098		; Jump if equal
		cmp	dl,82h
		jne	loc_2097		; Jump if not equal
		cmp	byte ptr ds:[2A75h],50h	; (0000:2A75=0FCh) 'P'
		je	loc_2098		; Jump if equal
		cmp	byte ptr ds:[2A75h],52h	; (0000:2A75=0FCh) 'R'
		je	loc_2098		; Jump if equal
loc_2097:
		test	byte ptr ds:[2ECAh],1	; (0000:2ECA=59h)
		jz	loc_2098		; Jump if zero
		add	bl,20h			; ' '
loc_2098:
		jmp	short loc_2101		; (C597)
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
		mov	cl,3
		ror	bl,cl			; Rotate
		jmp	short loc_2099		; (C56F)
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
loc_2099:
		and	bl,7
		add	bl,90h
		jmp	short loc_2101		; (C597)
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
		mov	cl,3
		ror	bl,cl			; Rotate
		jmp	short loc_2100		; (C58F)
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	bl,es:[si+1]
loc_2100:
		and	bl,7
		add	bl,0A0h
		jmp	short loc_2101		; (C597)
loc_2101:
		cmp	byte ptr ds:[2F06h],2	; (0000:2F06=0E8h)
		jne	loc_2102		; Jump if not equal
		cmp	bl,84h
		jne	loc_2106		; Jump if not equal
		jmp	short loc_2103		; (C5B1)
loc_2102:
		cmp	byte ptr ds:[2F06h],3	; (0000:2F06=0E8h)
		jne	loc_2106		; Jump if not equal
		cmp	bl,92h
		jne	loc_2104		; Jump if not equal
loc_2103:
		cmp	byte ptr ds:[2F08h],1	; (0000:2F08=0)
		je	loc_2105		; Jump if equal
		mov	byte ptr ds:[2F06h],4	; (0000:2F06=0E8h)
		jmp	short loc_2106		; (C5D0)
loc_2104:
		cmp	byte ptr ds:[2F05h],1	; (0000:2F05=6)
		jne	loc_2106		; Jump if not equal
		cmp	bl,91h
		jne	loc_2106		; Jump if not equal
loc_2105:
		mov	byte ptr ds:[2F06h],0	; (0000:2F06=0E8h)
loc_2106:
		xor	bh,bh			; Zero register
		cmp	bl,0E0h
		jae	loc_2108		; Jump if above or =
		cmp	bl,97h
		jbe	loc_2107		; Jump if below or =
		push	di
		mov	di,33FDh
		add	di,4
		mov	al,[di]
		pop	di
		mov	ds:[bp],al
		inc	bp
		sub	bl,20h			; ' '
loc_2107:
		sub	bl,80h
		mov	byte ptr ds:[42F0h],bl	; (0000:42F0=7)
		shl	bl,1			; Shift w/zeros fill
		add	bx,2F0Ch
		mov	ax,[bx]
		mov	ds:[bp],ax
		inc	bp
		jmp	short loc_2109		; (C61A)
loc_2108:
		add	bx,2EE1h
		mov	al,[bx]
		mov	ds:[bp],al
		cmp	byte ptr ds:[2A75h],0EFh	; (0000:2A75=0FCh)
		jne	loc_2109		; Jump if not equal
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
loc_2109:
		inc	bp
		mov	dh,0
		jmp	loc_2355		; (DA45)
		sub	bl,0A8h
		add	bl,14h
		shl	bl,1			; Shift w/zeros fill
		add	bx,2F0Ch
		mov	ax,[bx]
		mov	ds:[bp],ax
		mov	byte ptr ds:[2A5Eh],0	; (0000:2A5E=0F0h)
		inc	bp
		inc	bp
		mov	dh,0
		jmp	loc_2355		; (DA45)
		mov	al,bl
		sub	al,96h
		cmp	al,0
		je	loc_2110		; Jump if equal
		add	al,1
loc_2110:
		mov	bx,2F3Ch
		jmp	short loc_2112		; (C667)
		mov	al,bl
		sub	al,0BAh
		add	al,3
		mov	bx,2F91h
		jmp	short loc_2112		; (C667)
		mov	al,bl
		sub	al,9Ah
		cmp	al,3
		jbe	loc_2111		; Jump if below or =
		add	al,2
loc_2111:
		mov	bx,2F54h
		jmp	short loc_2112		; (C667)
loc_2112:
		xor	ah,ah			; Zero register
		and	al,7
		add	bx,ax
		add	bx,ax
		add	bx,ax
		mov	ax,[bx]
		mov	ds:[bp],ax
		inc	bp
		inc	bp
		mov	al,[bx+2]
		mov	ds:[bp],al
		inc	bp
		jmp	loc_2355		; (DA45)
		mov	al,bl
		mov	bx,2F3Ch
		cmp	al,23h			; '#'
		je	loc_2113		; Jump if equal
		mov	bx,2F54h
		cmp	al,24h			; '$'
		je	loc_2113		; Jump if equal
		mov	bx,2F91h
loc_2113:
		mov	al,es:[si+1]
		ror	al,1			; Rotate
		ror	al,1			; Rotate
		ror	al,1			; Rotate
		and	al,7
		jmp	short loc_2112		; (C667)
		mov	al,es:[si+1]
		and	al,7
		add	al,0B0h
		push	si
		mov	si,2F6Ch
		mov	cx,2
		sub	al,0B0h
		jz	locloop_2114		; Jump if zero
		dec	al
		mov	cx,5
		mul	cl			; ax = reg * al
		add	ax,2F6Eh
		mov	si,ax
  
locloop_2114:
		mov	al,[si]
		mov	ds:[bp],al
		inc	si
		inc	bp
		loop	locloop_2114		; Loop if cx > 0
  
		pop	si
		jmp	loc_2355		; (DA45)
;*		call	far ptr sub_226		;*(1548:1344)
		db	 9Ah, 44h, 13h, 48h, 15h
		mov	bl,es:[si+1]
		mov	dl,36h			; '6'
		mov	dh,2
		cmp	al,63h			; 'c'
		je	loc_2115		; Jump if equal
		test	byte ptr ds:[2ECAh],2	; (0000:2ECA=59h)
		jz	loc_2116		; Jump if zero
		jmp	short loc_2120		; (C721)
loc_2115:
		test	byte ptr ds:[2ECAh],3	; (0000:2ECA=59h)
		jz	loc_2116		; Jump if zero
		jmp	short loc_2120		; (C721)
loc_2116:
		mov	ah,bl
		and	ah,0C7h
		cmp	ah,6
		je	loc_2118		; Jump if equal
		and	ah,0C0h
		cmp	ah,40h			; '@'
		jne	loc_2117		; Jump if not equal
		mov	dl,32h			; '2'
		mov	dh,1
		jmp	short loc_2118		; (C716)
loc_2117:
		cmp	ah,0
		jne	loc_2118		; Jump if not equal
		mov	dl,3Dh			; '='
		mov	dh,0
loc_2118:
		cmp	al,61h			; 'a'
		je	loc_2119		; Jump if equal
		mov	dh,0
loc_2119:
		mov	al,dl
		jmp	loc_2091		; (C378)
loc_2120:
		mov	byte ptr ds:[2A5Eh],1	; (0000:2A5E=0F0h)
		mov	byte ptr ds:[2A7Ch],bl	; (0000:2A7C=0BEh)
		mov	byte ptr ds:[2A7Eh],0	; (0000:2A7E=0)
		mov	byte ptr ds:[2ECFh],0	; (0000:2ECF=75h)
		mov	byte ptr ds:[2A80h],0	; (0000:2A80=32h)
		mov	byte ptr ds:[2A7Fh],0	; (0000:2A7F=0)
		mov	ah,byte ptr ds:[2A7Ch]	; (0000:2A7C=0C8h)
		and	ah,7
		cmp	ah,4
		jne	loc_2121		; Jump if not equal
		mov	ah,es:[si+2]
		mov	byte ptr ds:[2A7Dh],ah	; (0000:2A7D=7)
		mov	byte ptr ds:[2A7Eh],1	; (0000:2A7E=0)
		inc	byte ptr ds:[2A5Ch]	; (0000:2A5C=0FFh)
loc_2121:
		mov	ah,byte ptr ds:[2A7Ch]	; (0000:2A7C=0DAh)
		and	ah,0C7h
		cmp	ah,5
		je	loc_2128		; Jump if equal
		test	ah,0C0h
		jnz	loc_2128		; Jump if not zero
		cmp	byte ptr ds:[2A7Eh],1	; (0000:2A7E=0)
		jne	loc_2123		; Jump if not equal
		mov	ah,byte ptr ds:[2A7Dh]	; (0000:2A7D=7)
		and	ah,7
		cmp	ah,5
		je	loc_2128		; Jump if equal
		jmp	short loc_2123		; (C784)
loc_2122:
		jmp	loc_2144		; (C922)
loc_2123:
		and	byte ptr ds:[2A7Fh],0FEh	; (0000:2A7F=0)
		test	byte ptr ds:[2D8Ch],80h	; (0000:2D8C=7Eh)
		jnz	loc_2124		; Jump if not zero
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
loc_2124:
		test	byte ptr ds:[2ECCh],8	; (0000:2ECC=58h)
		jz	loc_2125		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_2125:
		cmp	byte ptr ds:[2A7Eh],1	; (0000:2A7E=0)
		je	loc_2122		; Jump if equal
		test	byte ptr ds:[2ECAh],2	; (0000:2ECA=59h)
		jz	loc_2126		; Jump if zero
;*		call	far ptr sub_214		;*(1548:10F8)
		db	 9Ah,0F8h, 10h, 48h, 15h
		jmp	short loc_2127		; (C7BF)
loc_2126:
		mov	bl,byte ptr ds:[2A7Ch]	; (0000:2A7C=10h)
		xor	dx,dx			; Zero register
		jmp	loc_2267		; (D3E3)
loc_2127:
		xor	dx,dx			; Zero register
		jmp	loc_2355		; (DA45)
loc_2128:
		or	byte ptr ds:[2A7Fh],1	; (0000:2A7F=0)
		mov	bh,byte ptr ds:[2A62h]	; (0000:2A62=0C4h)
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
		mov	byte ptr ds:[2A80h],1	; (0000:2A80=32h)
		test	byte ptr ds:[2ECCh],8	; (0000:2ECC=58h)
		jz	loc_2129		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_2129:
		mov	ax,word ptr ds:[2EF4h]	; (0000:2EF4=1416h)
		mov	word ptr ds:[3796h],ax	; (0000:3796=4141h)
		mov	dh,4
		test	byte ptr ds:[2ECAh],2	; (0000:2ECA=59h)
		jnz	loc_2130		; Jump if not zero
		mov	dh,2
loc_2130:
		mov	al,byte ptr ds:[2A7Ch]	; (0000:2A7C=34h)
		and	al,0C0h
		cmp	al,40h			; '@'
		jne	loc_2131		; Jump if not equal
		mov	dh,1
loc_2131:
		add	byte ptr ds:[2A5Ch],dh	; (0000:2A5C=0FFh)
		mov	byte ptr ds:[2ECFh],dh	; (0000:2ECF=75h)
;*		call	far ptr sub_200		;*(1548:06B0)
		db	 9Ah,0B0h, 06h, 48h, 15h
		push	si
		inc	si
		inc	si
		cmp	byte ptr ds:[2A7Eh],1	; (0000:2A7E=0)
		jne	loc_2132		; Jump if not equal
		inc	si
loc_2132:
		cmp	dh,1
		jne	loc_2133		; Jump if not equal
		jmp	loc_2139		; (C8AD)
loc_2133:
		mov	ax,es:[si]
		mov	word ptr ds:[2ED0h],ax	; (0000:2ED0=0E17h)
		cmp	dh,2
		je	loc_2134		; Jump if equal
		mov	ax,es:[si+2]
		mov	word ptr ds:[2ED2h],ax	; (0000:2ED2=2AE8h)
		cmp	ax,0
		je	loc_2134		; Jump if equal
		jmp	loc_2141		; (C8DF)
loc_2134:
		cmp	byte ptr ds:[2A7Eh],1	; (0000:2A7E=0)
		jne	loc_2135		; Jump if not equal
		cmp	dh,1
		jne	loc_2135		; Jump if not equal
		cmp	ax,0
		jne	loc_2135		; Jump if not equal
		mov	bl,byte ptr ds:[2A7Dh]	; (0000:2A7D=8)
		and	bl,7
		cmp	bl,5
		jne	loc_2135		; Jump if not equal
		jmp	loc_2143		; (C921)
loc_2135:
		mov	ax,word ptr ds:[2ED0h]	; (0000:2ED0=0E17h)
		mov	bl,byte ptr ds:[2A7Ch]	; (0000:2A7C=84h)
		mov	bh,byte ptr ds:[2A62h]	; (0000:2A62=0C4h)
		mov	byte ptr ds:[2A29h],1	; (0000:2A29=47h)
		call	sub_127			; (9520)
		mov	byte ptr ds:[2ECFh],0	; (8A50:2ECF=0A8h)
		cmp	byte ptr ds:[2A7Eh],1	; (8A50:2A7E=0ABh)
		je	loc_2138		; Jump if equal
		mov	al,byte ptr ds:[2A7Ch]	; (8A50:2A7C=0A5h)
		and	al,0C7h
		cmp	al,5
		je	loc_2137		; Jump if equal
		test	byte ptr ds:[2ECAh],2	; (8A50:2ECA=4Fh)
		jz	loc_2136		; Jump if zero
;*		call	far ptr sub_214		;*(1548:10F8)
		db	 9Ah,0F8h, 10h, 48h, 15h
		jmp	short loc_2137		; (C899)
loc_2136:
		pop	si
		xor	dx,dx			; Zero register
		mov	bl,byte ptr ds:[2A7Ch]	; (8A50:2A7C=0A5h)
		jmp	loc_2267		; (D3E3)
loc_2137:
		pop	si
		xor	dx,dx			; Zero register
		jmp	loc_2355		; (DA45)
loc_2138:
		cmp	byte ptr ds:[42B6h],0	; (8A50:42B6=6)
		je	loc_2143		; Jump if equal
		mov	byte ptr ds:[2ECFh],4	; (8A50:2ECF=0A8h)
		jmp	short loc_2143		; (C921)
loc_2139:
		xor	ax,ax			; Zero register
		mov	al,es:[si]
		mov	word ptr ds:[2ED0h],ax	; (8A50:2ED0=0AEABh)
		xor	ax,ax			; Zero register
		mov	word ptr ds:[2ED2h],ax	; (8A50:2ED2=0A5A6h)
		cmp	byte ptr ds:[2A7Eh],1	; (8A50:2A7E=0ABh)
		jne	loc_2140		; Jump if not equal
		jmp	short loc_2143		; (C921)
loc_2140:
;*		call	far ptr sub_214		;*(1548:10F8)
		db	 9Ah,0F8h, 10h, 48h, 15h
		dec	bp
		mov	al,es:[si]
		mov	byte ptr ds:[2ED0h],al	; (8A50:2ED0=0ABh)
		call	sub_144			; (B770)
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
		mov	byte ptr ds:[42B6h],0	; (8A50:42B6=6)
		jmp	short loc_2143		; (C921)
loc_2141:
		cmp	byte ptr ds:[2A7Eh],1	; (8A50:2A7E=0ABh)
		je	loc_2143		; Jump if equal
		test	byte ptr ds:[2ECCh],8	; (8A50:2ECC=2Dh)
		jz	loc_2142		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_2142:
		mov	byte ptr ds:[bp],5Bh	; '['
		inc	bp
		push	bx
		mov	ax,es:[si+2]
		mov	bx,es:[si]
;*		call	far ptr sub_185		;*(1548:01E8)
		db	 9Ah,0E8h, 01h, 48h, 15h
		pop	bx
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
		mov	al,byte ptr ds:[2A7Ch]	; (8A50:2A7C=0A5h)
		and	al,0C7h
		cmp	al,5
		je	loc_2143		; Jump if equal
		cmp	byte ptr ds:[2A7Eh],1	; (8A50:2A7E=0ABh)
		je	loc_2143		; Jump if equal
;*		call	far ptr sub_214		;*(1548:10F8)
		db	 9Ah,0F8h, 10h, 48h, 15h
loc_2143:
		pop	si
loc_2144:
		call	sub_142			; (B614)
		add	dh,byte ptr ds:[2A7Eh]	; (8A50:2A7E=0ABh)
		cmp	cs:data_584,60h		; (020C:8E50=0C3h) '`'
		je	loc_2145		; Jump if equal
		test	byte ptr ds:[2A7Fh],1	; (8A50:2A7F=0A8h)
		jnz	loc_2146		; Jump if not zero
loc_2145:
		xor	dx,dx			; Zero register
loc_2146:
		jmp	loc_2355		; (DA45)
		mov	bl,es:[si+1]
		mov	byte ptr ds:[2A7Bh],2	; (8A50:2A7B=30h)
		test	byte ptr ds:[2ECAh],2	; (8A50:2ECA=4Fh)
		jz	loc_2147		; Jump if zero
		mov	byte ptr ds:[2A7Bh],4	; (8A50:2A7B=30h)
		mov	byte ptr ds:[2A7Ch],bl	; (8A50:2A7C=0A5h)
		mov	ah,es:[si+2]
		mov	byte ptr ds:[2A7Dh],ah	; (8A50:2A7D=0E1h)
loc_2147:
		mov	ah,bl
		and	ah,0C7h
		cmp	ah,6
		je	loc_2149		; Jump if equal
		and	ah,0C0h
		cmp	ah,40h			; '@'
		jne	loc_2148		; Jump if not equal
		mov	dl,32h			; '2'
		mov	byte ptr ds:[2A7Bh],1	; (8A50:2A7B=30h)
		jmp	short loc_2149		; (C983)
loc_2148:
		cmp	ah,0
		jne	loc_2149		; Jump if not equal
		mov	byte ptr ds:[2A7Bh],0	; (8A50:2A7B=30h)
loc_2149:
		mov	al,60h			; '`'
		jmp	loc_2091		; (C378)
		push	si
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_158		proc	near
		mov	si,3052h
		test	dl,1
		jz	loc_2150		; Jump if zero
		mov	si,3048h
loc_2150:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	al,60h			; '`'
		jmp	loc_2091		; (C378)
sub_158		endp
  
		cmp	data_331,0		; (020C:2A82=0ACA2h)
		ja	loc_2151		; Jump if above
		mov	data_331,1		; (020C:2A82=0ACA2h)
		mov	data_332,1		; (020C:2A84=0E1A5h)
loc_2151:
		mov	byte ptr ds:[2A5Eh],0	; (020C:2A5E=0E9h)
		push	si
		mov	cx,data_331		; (020C:2A82=0ACA2h)
		cmp	al,52h			; 'R'
		jne	loc_2152		; Jump if not equal
		jmp	loc_2161		; (CA44)
loc_2152:
		cmp	cx,6
		jbe	loc_2153		; Jump if below or =
		mov	cx,6
loc_2153:
		cmp	al,51h			; 'Q'
		je	loc_2158		; Jump if equal
		cmp	al,53h			; 'S'
		jne	loc_2154		; Jump if not equal
		jmp	loc_2164		; (CA7D)
loc_2154:
		cmp	al,54h			; 'T'
		jne	loc_2155		; Jump if not equal
		jmp	loc_2178		; (CB61)
loc_2155:
		cmp	al,55h			; 'U'
		jne	loc_2156		; Jump if not equal
		jmp	loc_2179		; (CB8D)
loc_2156:
		cmp	al,56h			; 'V'
		jb	loc_2157		; Jump if below
		jmp	loc_2180		; (CBBB)
		push	si
		inc	bp
		mov	cx,data_332		; (020C:2A84=0E1A5h)
		add	si,cx
		inc	si
		mov	cx,data_475		; (020C:42C1=42CEh)
		mov	data_331,cx		; (020C:2A82=0ACA2h)
		add	data_332,cx		; (020C:2A84=0E1A5h)
loc_2157:
;*		call	far ptr sub_229		;*(1548:140C)
		db	 9Ah, 0Ch, 14h, 48h, 15h
		jmp	loc_2198		; (CD39)
loc_2158:
		cmp	data_331,2		; (020C:2A82=0ACA2h)
		jne	locloop_2159		; Jump if not equal
		cmp	byte ptr data_346+3,1	; (020C:2C3F=4Dh)
		jbe	locloop_2159		; Jump if below or =
		sub	data_331,2		; (020C:2A82=0ACA2h)
		jmp	loc_2205		; (CE01)
  
locloop_2159:
		mov	ax,es:[si]
		inc	si
		inc	si
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		dec	data_331		; (020C:2A82=0ACA2h)
		dec	data_331		; (020C:2A82=0ACA2h)
		jz	loc_2160		; Jump if zero
		cmp	cx,2
		je	loc_2160		; Jump if equal
		mov	byte ptr ds:[bp],2Ch	; ','
		inc	bp
		inc	bp
		dec	cx
		loop	locloop_2159		; Loop if cx > 0
  
loc_2160:
		jmp	loc_2198		; (CD39)
loc_2161:
		mov	ax,es:[si+2]
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		dec	bp
		cmp	byte ptr ds:[bp],48h	; 'H'
		jae	loc_2162		; Jump if above or =
		inc	bp
loc_2162:
		mov	ax,es:[si]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	al,data_409		; (020C:3047=0Eh)
		mov	ds:[bp],al
		cmp	data_331,4		; (020C:2A82=0ACA2h)
		jae	loc_2163		; Jump if above or =
		mov	data_331,0		; (020C:2A82=0ACA2h)
		jmp	loc_2198		; (CD39)
loc_2163:
		sub	data_331,4		; (020C:2A82=0ACA2h)
		jmp	loc_2198		; (CD39)
loc_2164:
		push	dx
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	si,data_355		; (020C:2D84=4C4Ch)
		mov	ax,data_354		; (020C:2D82=4152h)
		mov	es,ax
		mov	dx,data_331		; (020C:2A82=0ACA2h)
		mov	cx,bp
		mov	data_333,0		; (020C:2A88=0A3AEh)
		mov	ah,0
loc_2165:
		mov	al,es:[si]
		cmp	al,0FFh
		je	loc_2167		; Jump if equal
		cmp	al,27h			; '''
		je	loc_2167		; Jump if equal
		cmp	al,7Fh
		je	loc_2167		; Jump if equal
		test	data_481,80h		; (020C:42CE=1689h)
		jz	loc_2166		; Jump if zero
		cmp	al,80h
		jae	loc_2167		; Jump if above or =
loc_2166:
		cmp	al,20h			; ' '
		jae	loc_2170		; Jump if above or =
loc_2167:
		cmp	cx,bp
		je	loc_2169		; Jump if equal
		cmp	ah,0
		jne	loc_2168		; Jump if not equal
		mov	byte ptr ds:[bp],27h	; '''
		inc	bp
loc_2168:
		mov	byte ptr ds:[bp],2Ch	; ','
		inc	bp
		inc	bp
loc_2169:
;*		call	far ptr sub_179		;*(1548:0034)
		db	 9Ah, 34h, 00h, 48h, 15h
		mov	ah,1
		cmp	al,0
		jne	loc_2174		; Jump if not equal
		mov	cx,bp
		sub	cx,21h
		jmp	short loc_2174		; (CB17)
loc_2170:
		cmp	ah,0
		je	loc_2171		; Jump if equal
		mov	ah,0
		mov	byte ptr ds:[bp],2Ch	; ','
		inc	bp
		inc	bp
		jmp	short loc_2172		; (CAF7)
loc_2171:
		cmp	cx,bp
		jne	loc_2173		; Jump if not equal
loc_2172:
		mov	byte ptr ds:[bp],27h	; '''
		inc	bp
loc_2173:
		mov	ds:[bp],al
		inc	bp
		cmp	al,24h			; '$'
		jne	loc_2174		; Jump if not equal
		cmp	dx,1
		jbe	loc_2174		; Jump if below or =
		cmp	byte ptr es:[si+1],24h	; '$'
		je	loc_2174		; Jump if equal
		mov	cx,bp
		sub	cx,21h
loc_2174:
		inc	si
		inc	data_333		; (020C:2A88=0A3AEh)
		dec	dx
		jz	loc_2175		; Jump if zero
		mov	bx,bp
		sub	bx,cx
		cmp	bx,20h
		ja	loc_2175		; Jump if above
		jmp	loc_2165		; (CA9C)
loc_2175:
		cmp	ah,1
		je	loc_2176		; Jump if equal
		mov	byte ptr ds:[bp],27h	; '''
		inc	bp
loc_2176:
		mov	ax,data_333		; (020C:2A88=0A3AEh)
		sub	data_331,ax		; (020C:2A82=0ACA2h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2177		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2177		; Jump if equal
		call	sub_115			; (83A4)
loc_2177:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		pop	dx
		jmp	loc_2198		; (CD39)
loc_2178:
		mov	data_331,0		; (020C:2A82=0ACA2h)
		mov	ax,data_332		; (020C:2A84=0E1A5h)
		mov	bl,0
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		inc	bp
		push	si
		mov	si,309Bh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	al,es:[si]
;*		call	far ptr sub_179		;*(1548:0034)
		db	 9Ah, 34h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],29h	; ')'
		inc	bp
		jmp	loc_2198		; (CD39)
loc_2179:
		mov	data_331,0		; (020C:2A82=0ACA2h)
		mov	ax,data_332		; (020C:2A84=0E1A5h)
		shr	ax,1			; Shift w/zeros fill
		mov	bl,0
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		inc	bp
		push	si
data_662	db	0BEh			; Data table (indexed access)
		db	9Bh
		xor	[bp+si+1004h],bl
		dec	ax
		adc	ax,265Eh
		mov	ax,[si]
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],29h	; ')'
		inc	bp
		jmp	loc_2198		; (CD39)
loc_2180:
		dec	data_331		; (020C:2A82=0ACA2h)
		dec	data_331		; (020C:2A82=0ACA2h)
		test	al,1
		jnz	loc_2181		; Jump if not zero
		cmp	word ptr es:[si],0
		jne	loc_2181		; Jump if not equal
		xor	ax,ax			; Zero register
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		jmp	loc_2198		; (CD39)
loc_2181:
		cmp	al,5Ah			; 'Z'
		jb	loc_2182		; Jump if below
		jmp	loc_2191		; (CC8F)
loc_2182:
		push	si
		mov	si,30B1h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	bl,byte ptr ds:[2A75h]	; (020C:2A75=0ADh)
		mov	data_455,bl		; (020C:3C7B=0A2h)
		xor	cl,cl			; Zero register
		test	al,2
		jz	loc_2183		; Jump if zero
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_163		proc	near
		mov	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		mov	cl,2
loc_2183:
		test	data_361,40h		; (020C:2D90=31h) '@'
		jz	loc_2184		; Jump if zero
		mov	bx,data_362		; (020C:2D91=433Bh)
		jmp	short loc_2185		; (CC0E)
loc_2184:
		mov	bx,data_354		; (020C:2D82=4152h)
loc_2185:
		test	al,1
		jz	loc_2186		; Jump if zero
		mov	bx,es:[si+2]
		or	cl,1
		dec	data_331		; (020C:2A82=0ACA2h)
		dec	data_331		; (020C:2A82=0ACA2h)
loc_2186:
		push	ax
		mov	ax,es:[si]
		push	bx
		push	cx
		mov	data_388,2		; (020C:2ECF=56h)
		call	sub_128			; (9AA4)
		cmp	byte ptr ds:[42B7h],1	; (94E8:42B7=6)
		jne	loc_2187		; Jump if not equal
		mov	byte ptr ds:[42B7h],0	; (94E8:42B7=6)
		mov	byte ptr ds:[2EB7h],0	; (94E8:2EB7=3Dh)
		mov	byte ptr ds:[42B9h],1	; (94E8:42B9=3)
loc_2187:
		cmp	byte ptr ds:[42B9h],1	; (94E8:42B9=3)
		jne	loc_2188		; Jump if not equal
;*		call	far ptr sub_223		;*(1548:12EC)
		db	 9Ah,0ECh, 12h, 48h, 15h
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
loc_2188:
		pop	cx
		pop	bx
		pop	ax
		test	al,1
		jz	loc_2190		; Jump if zero
		mov	byte ptr ds:[bp],2Ch	; ','
		inc	bp
		inc	bp
		cmp	byte ptr ds:[42B9h],1	; (94E8:42B9=3)
		jne	loc_2189		; Jump if not equal
		mov	ax,es:[si+2]
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		jmp	short loc_2190		; (CC86)
loc_2189:
		push	si
		mov	si,30B9h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	ax,es:[si]
		call	sub_128			; (9AA4)
loc_2190:
		mov	al,byte ptr ds:[3C7Bh]	; (94E8:3C7B=0A3h)
		mov	byte ptr ds:[2A75h],al	; (94E8:2A75=75h)
		jmp	loc_2198		; (CD39)
loc_2191:
		test	byte ptr ds:[2D90h],40h	; (94E8:2D90=0E9h) '@'
		jz	loc_2192		; Jump if zero
		mov	cx,word ptr ds:[2D91h]	; (94E8:2D91=0E9D0h)
		jmp	short loc_2193		; (CCA0)
loc_2192:
		mov	cx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
loc_2193:
		test	al,1
		jz	loc_2194		; Jump if zero
		mov	cx,es:[si+2]
		dec	word ptr ds:[2A82h]	; (94E8:2A82=0F71Bh)
		dec	word ptr ds:[2A82h]	; (94E8:2A82=0F71Bh)
loc_2194:
		push	word ptr ds:[3796h]	; (94E8:3796=8A50h)
		push	word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
		mov	ah,byte ptr ds:[152Ah]	; (94E8:152A=0EBh)
		push	ax
		mov	byte ptr ds:[152Ah],0	; (94E8:152A=0EBh)
		mov	byte ptr ds:[2D93h],2	; (94E8:2D93=0D0h)
		mov	bl,byte ptr ds:[2F04h]	; (94E8:2F04=0)
		mov	byte ptr ds:[3C73h],bl	; (94E8:3C73=3Bh)
		mov	byte ptr ds:[2F04h],90h	; (94E8:2F04=0)
		xor	bx,bx			; Zero register
		mov	word ptr ds:[3796h],cx	; (94E8:3796=8A50h)
		mov	word ptr ds:[2EF4h],cx	; (94E8:2EF4=6FFh)
		mov	ax,es:[si]
		call	sub_127			; (9520)
		cmp	byte ptr ds:[42B9h],1	; (8A50:42B9=45h)
		jne	loc_2195		; Jump if not equal
;*		call	far ptr sub_223		;*(1548:12EC)
		db	 9Ah,0ECh, 12h, 48h, 15h
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
loc_2195:
		pop	ax
		push	ax
		test	al,1
		jz	loc_2197		; Jump if zero
		mov	byte ptr ds:[bp],2Ch	; ','
		inc	bp
		inc	bp
		mov	ax,es:[si]
		cmp	byte ptr ds:[42B9h],1	; (8A50:42B9=45h)
		jne	loc_2196		; Jump if not equal
		mov	ax,es:[si+2]
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		jmp	short loc_2197		; (CD21)
loc_2196:
		xor	bx,bx			; Zero register
		mov	byte ptr ds:[2D93h],3	; (8A50:2D93=0AEh)
		call	sub_127			; (9520)
loc_2197:
		pop	ax
		mov	byte ptr ds:[152Ah],ah	; (8A50:152A=0)
		mov	byte ptr ds:[2D93h],0	; (8A50:2D93=0AEh)
		mov	al,byte ptr ds:[3C73h]	; (8A50:3C73=58h)
		mov	byte ptr ds:[2F04h],al	; (8A50:2F04=4Fh)
		pop	word ptr ds:[2EF4h]	; (8A50:2EF4=4E4Fh)
		pop	word ptr ds:[3796h]	; (8A50:3796=5953h)
loc_2198:
		pop	si
		jmp	loc_2355		; (DA45)
sub_163		endp
  
;*		call	far ptr sub_227		;*(1548:1378)
		db	 9Ah, 78h, 13h, 48h, 15h
		mov	byte ptr ds:[2A5Ch],1	; (8A50:2A5C=20h)
		push	si
		sub	al,2
		xor	ah,ah			; Zero register
		add	si,ax
		mov	al,es:[si]
		pop	si
;*		call	far ptr sub_179		;*(1548:0034)
		db	 9Ah, 34h, 00h, 48h, 15h
		cmp	byte ptr ds:[2A75h],56h	; (8A50:2A75=2Eh) 'V'
		je	loc_2199		; Jump if equal
		cmp	al,20h			; ' '
		jb	loc_2199		; Jump if below
		cmp	al,7Fh
		jae	loc_2199		; Jump if above or =
		push	bp
		call	sub_89			; (7B44)
		mov	byte ptr ds:[bp],27h	; '''
		inc	bp
		mov	ds:[bp],al
		inc	bp
		mov	byte ptr ds:[bp],27h	; '''
		pop	bp
loc_2199:
		jmp	loc_2355		; (DA45)
		mov	byte ptr ds:[2A5Ch],1	; (94E8:2A5C=21h)
		push	si
		sub	al,0Ah
		xor	ah,ah			; Zero register
		add	si,ax
		mov	al,es:[si]
		cbw				; Convrt byte to word
		pop	si
		test	byte ptr ds:[2ECAh],1	; (94E8:2ECA=0C5h)
		jz	loc_2202		; Jump if zero
		xor	bx,bx			; Zero register
		test	ax,8000h
		jz	loc_2200		; Jump if zero
		mov	bx,0FFFFh
loc_2200:
		xchg	ax,bx
;*		call	far ptr sub_185		;*(1548:01E8)
		db	 9Ah,0E8h, 01h, 48h, 15h
		jmp	loc_2355		; (DA45)
loc_2202:
		jmp	loc_2228		; (D02D)
		sub	al,99h
		db	3Eh
		cwd				; Word to double word
		inc	di
		cwd				; Word to double word
		xor	ax,6299h
		cwd				; Word to double word
		db	6Bh
		cwd				; Word to double word
		push	ax
		cwd				; Word to double word
		pop	cx
		cwd				; Word to double word
		mov	byte ptr ds:[2A5Ch],2	; (94E8:2A5C=21h)
		cmp	byte ptr ds:[2A75h],77h	; (94E8:2A75=75h) 'w'
		je	loc_2203		; Jump if equal
		test	byte ptr ds:[2ECAh],1	; (94E8:2ECA=0C5h)
		jz	loc_2203		; Jump if zero
		add	al,8
		jmp	loc_2091		; (C378)
loc_2203:
;*		call	far ptr sub_227		;*(1548:1378)
		db	 9Ah, 78h, 13h, 48h, 15h
		push	si
		mov	cl,es:[si]
		sub	al,12h
		xor	ah,ah			; Zero register
		add	si,ax
		test	byte ptr ds:[42BFh],1	; (94E8:42BF=6)
		jz	loc_2205		; Jump if zero
		cmp	word ptr es:[si],7Fh
		jb	loc_2204		; Jump if below
		cmp	word ptr es:[si],0FF80h
		jb	loc_2205		; Jump if below
loc_2204:
		test	byte ptr ds:[42BEh],1	; (94E8:42BE=1Eh)
		jnz	loc_2205		; Jump if not zero
		inc	byte ptr ds:[42C0h]	; (94E8:42C0=1Fh)
loc_2205:
		mov	ax,es:[si]
		test	word ptr ds:[42F1h],1	; (94E8:42F1=2688h)
		jz	loc_2207		; Jump if zero
		cmp	byte ptr ds:[42F0h],8	; (94E8:42F0=2Eh)
		jae	loc_2207		; Jump if above or =
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		je	loc_2207		; Jump if equal
		cmp	byte ptr ds:[2638h],6	; (94E8:2638=0)
		jb	loc_2207		; Jump if below
		push	bx
		push	dx
		test	word ptr ds:[42CCh],4000h	; (94E8:42CC=71Fh)
		jnz	loc_2206		; Jump if not zero
		mov	dx,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		xor	bx,bx			; Zero register
		mov	bl,byte ptr ds:[42F0h]	; (94E8:42F0=2Eh)
		shl	bx,1			; Shift w/zeros fill
		jmp	word ptr cs:[989Ch][bx]	;*(020C:989C=0C601h)
		mov	word ptr ds:[42D2h],dx	; (94E8:42D2=0E802h)
		mov	word ptr ds:[42D0h],ax	; (94E8:42D0=0F8E8h)
		jmp	short loc_2206		; (CE82)
		mov	word ptr ds:[42D6h],dx	; (94E8:42D6=1F06h)
		mov	word ptr ds:[42D4h],ax	; (94E8:42D4=301h)
		jmp	short loc_2206		; (CE82)
		mov	word ptr ds:[42DAh],dx	; (94E8:42DA=0B803h)
		mov	word ptr ds:[42D8h],ax	; (94E8:42D8=33BAh)
		jmp	short loc_2206		; (CE82)
		mov	word ptr ds:[42DEh],dx	; (94E8:42DE=21CDh)
		mov	word ptr ds:[42DCh],ax	; (94E8:42DC=4300h)
		jmp	short loc_2206		; (CE82)
		mov	word ptr ds:[42E2h],dx	; (94E8:42E2=0C1F7h)
		mov	word ptr ds:[42E0h],ax	; (94E8:42E0=772h)
		jmp	short loc_2206		; (CE82)
		mov	word ptr ds:[42E6h],dx	; (94E8:42E6=175h)
		mov	word ptr ds:[42E4h],ax	; (94E8:42E4=10h)
		jmp	short loc_2206		; (CE82)
		mov	word ptr ds:[42EEh],dx	; (94E8:42EE=0B414h)
		mov	word ptr ds:[42ECh],ax	; (94E8:42EC=7307h)
		jmp	short loc_2206		; (CE82)
		mov	word ptr ds:[42EAh],dx	; (94E8:42EA=5F1Fh)
		mov	word ptr ds:[42E8h],ax	; (94E8:42E8=5EF9h)
loc_2206:
		pop	dx
		pop	bx
loc_2207:
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		jne	loc_2213		; Jump if not equal
		cmp	byte ptr ds:[1422h],0	; (94E8:1422=26h)
		je	loc_2208		; Jump if equal
		cmp	byte ptr ds:[2C40h],3	; (94E8:2C40=0)
		jne	loc_2213		; Jump if not equal
loc_2208:
		cmp	byte ptr ds:[2D90h],0	; (94E8:2D90=0E9h)
		jne	loc_2213		; Jump if not equal
		cmp	byte ptr ds:[2C3Fh],1	; (94E8:2C3F=3)
		jbe	loc_2209		; Jump if below or =
		jmp	loc_2221		; (CF9D)
loc_2209:
		cmp	ax,0
		je	loc_2213		; Jump if equal
		cmp	ax,0FFFFh
		je	loc_2213		; Jump if equal
		and	cl,0B8h
		cmp	cl,0B8h
		jne	loc_2213		; Jump if not equal
loc_2210:
		pop	si
		push	si
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	bx
		mov	bx,si
		call	sub_106			; (80C5)
		mov	si,0
		mov	cl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		xor	ch,ch			; Zero register
  
locloop_2211:
		cmp	es:[si],ax
		je	loc_2214		; Jump if equal
		add	si,15h
		loop	locloop_2211		; Loop if cx > 0
  
		pop	bx
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2212		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2212		; Jump if equal
		call	sub_115			; (83A4)
loc_2212:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2213:
		jmp	loc_2227		; (D02C)
loc_2214:
		cmp	byte ptr [bx],0B9h
		jb	loc_2215		; Jump if below
		cmp	byte ptr [bx],0BFh
		ja	loc_2215		; Jump if above
		push	si
		mov	si,30B9h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		cmp	byte ptr [bx],0B9h
		je	loc_2215		; Jump if equal
		test	word ptr ds:[139Fh],2	; (94E8:139F=10E9h)
		jz	loc_2215		; Jump if zero
		push	si
		push	bp
		mov	si,30B9h
		mov	bp,27FDh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	bp
		pop	si
loc_2215:
		mov	ax,es:[si+0Ah]
		mov	bx,es:[si+0Ch]
		or	bl,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
		cmp	bh,20h			; ' '
		je	loc_2216		; Jump if equal
		or	bh,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
loc_2216:
		mov	si,30A1h
		and	al,3
		cmp	al,3
		jne	loc_2217		; Jump if not equal
		mov	si,30A6h
		jmp	short loc_2218		; (CF65)
loc_2217:
		cmp	byte ptr ds:[2C40h],3	; (94E8:2C40=0)
		je	loc_2218		; Jump if equal
		cmp	byte ptr ds:[1422h],0	; (94E8:1422=26h)
		jne	loc_2218		; Jump if not equal
		pop	bx
		jmp	loc_2227		; (D02C)
loc_2218:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	ds:[bp],bl
		inc	bp
		cmp	bh,20h			; ' '
		je	loc_2219		; Jump if equal
		mov	ds:[bp],bh
		inc	bp
loc_2219:
		pop	bx
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2220		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2220		; Jump if equal
		call	sub_115			; (83A4)
loc_2220:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	si
		jmp	loc_2355		; (DA45)
loc_2221:
		cmp	dl,51h			; 'Q'
		jne	loc_2222		; Jump if not equal
		xor	dx,dx			; Zero register
		jmp	short loc_2223		; (CFAB)
loc_2222:
		sub	dl,12h
		xor	dh,dh			; Zero register
loc_2223:
		push	ax
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_111			; (80D7)
		mov	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		add	ax,dx
		mov	bx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		mov	dl,byte ptr ds:[4204h]	; (94E8:4204=21h)
		push	dx
		mov	byte ptr ds:[4204h],1	; (94E8:4204=21h)
		mov	dx,40h
		call	sub_84			; (7498)
		pop	dx
		mov	byte ptr ds:[4204h],dl	; (A80C:4204=0)
		jnc	loc_2225		; Jump if carry=0
		mov	al,es:[di+4]
		and	al,5Fh			; '_'
		cmp	al,5Fh			; '_'
		jne	loc_2225		; Jump if not equal
		test	byte ptr es:[di+5],0Fh
		jnz	loc_2225		; Jump if not zero
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2224		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2224		; Jump if equal
		call	sub_115			; (83A4)
loc_2224:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	ax
		jmp	loc_2210		; (CEBC)
loc_2225:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2226		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2226		; Jump if equal
		call	sub_115			; (83A4)
loc_2226:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	ax
loc_2227:
		pop	si
loc_2228:
		cmp	byte ptr ds:[2D90h],0	; (A80C:2D90=0)
		jne	loc_2229		; Jump if not equal
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		jmp	loc_2355		; (DA45)
loc_2229:
		push	si
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	cx,24h
		mov	si,282Ah
		mov	di,29EEh
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2230		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2230		; Jump if equal
		call	sub_115			; (83A4)
loc_2230:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		pop	si
		cmp	byte ptr ds:[2D90h],44h	; (94E8:2D90=0E9h) 'D'
		jne	loc_2232		; Jump if not equal
		mov	byte ptr ds:[2D93h],2	; (94E8:2D93=0D0h)
		push	word ptr ds:[3796h]	; (94E8:3796=8A50h)
		push	word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
		mov	bl,byte ptr ds:[2A32h]	; (94E8:2A32=75h)
		push	bx
		mov	byte ptr ds:[2A32h],0	; (94E8:2A32=75h)
		mov	bl,byte ptr ds:[2F04h]	; (94E8:2F04=0)
		mov	byte ptr ds:[3C73h],bl	; (94E8:3C73=3Bh)
		mov	byte ptr ds:[2F04h],90h	; (94E8:2F04=0)
		xor	bx,bx			; Zero register
		mov	cx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		cmp	word ptr ds:[2D91h],0FFFFh	; (94E8:2D91=0E9D0h)
		je	loc_2231		; Jump if equal
		mov	cx,word ptr ds:[2D91h]	; (94E8:2D91=0E9D0h)
loc_2231:
		mov	word ptr ds:[3796h],cx	; (94E8:3796=8A50h)
		mov	word ptr ds:[2EF4h],cx	; (94E8:2EF4=6FFh)
		call	sub_127			; (9520)
		pop	ax
		mov	byte ptr ds:[2A32h],al	; (8A50:2A32=0EBh)
		pop	word ptr ds:[2EF4h]	; (8A50:2EF4=4E4Fh)
		pop	word ptr ds:[3796h]	; (8A50:3796=5953h)
		mov	byte ptr ds:[2D93h],0	; (8A50:2D93=0AEh)
		mov	al,byte ptr ds:[3C73h]	; (8A50:3C73=58h)
		mov	byte ptr ds:[2F04h],al	; (8A50:2F04=4Fh)
		jmp	short loc_2235		; (D11A)
loc_2232:
		push	si
		mov	si,30B1h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	ch,byte ptr ds:[2A75h]	; (8A50:2A75=2Eh)
		mov	cl,byte ptr ds:[2D8Dh]	; (8A50:2D8D=30h)
		push	cx
		mov	byte ptr ds:[2A75h],0	; (8A50:2A75=2Eh)
		cmp	byte ptr ds:[2D90h],40h	; (8A50:2D90=20h) '@'
		jne	loc_2233		; Jump if not equal
		mov	byte ptr ds:[2A75h],4Fh	; (8A50:2A75=2Eh) 'O'
loc_2233:
		mov	bx,word ptr ds:[2D82h]	; (8A50:2D82=300Ah)
		cmp	word ptr ds:[2D91h],0FFFFh	; (8A50:2D91=0ACE3h)
		je	loc_2234		; Jump if equal
		mov	bx,word ptr ds:[2D91h]	; (8A50:2D91=0ACE3h)
loc_2234:
		mov	cl,0
		mov	byte ptr ds:[2ECFh],2	; (8A50:2ECF=0A8h)
		call	sub_128			; (9AA4)
		pop	cx
		mov	byte ptr ds:[2D8Dh],cl	; (94E8:2D8D=0D1h)
		mov	byte ptr ds:[2A75h],ch	; (94E8:2A75=75h)
loc_2235:
		cmp	bp,282Ah
		jb	loc_2238		; Jump if below
		mov	byte ptr ds:[bp],20h	; ' '
		inc	bp
		push	si
		mov	si,29EEh
		mov	cx,24h
  
locloop_2236:
		mov	al,[si]
		mov	ds:[bp],al
		inc	si
		inc	bp
		cmp	bp,284Eh
		jae	loc_2237		; Jump if above or =
		loop	locloop_2236		; Loop if cx > 0
  
loc_2237:
		pop	si
loc_2238:
		jmp	loc_2355		; (DA45)
;*		call	far ptr sub_228		;*(1548:139C)
		db	 9Ah, 9Ch, 13h, 48h, 15h
		jmp	loc_2355		; (DA45)
		mov	cx,word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
		mov	word ptr ds:[3796h],cx	; (94E8:3796=8A50h)
		push	si
		mov	si,312Ch
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	byte ptr ds:[2D93h],2	; (94E8:2D93=0D0h)
		mov	byte ptr ds:[152Bh],1	; (94E8:152B=0E4h)
		pop	si
		push	si
		mov	byte ptr ds:[2A5Ch],1	; (94E8:2A5C=21h)
		add	si,word ptr ds:[2A84h]	; (94E8:2A84=83D1h)
		dec	si
;*		call	far ptr sub_200		;*(1548:06B0)
		db	 9Ah,0B0h, 06h, 48h, 15h
		inc	si
		jmp	loc_2245		; (D219)
		mov	cx,word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
		mov	word ptr ds:[3796h],cx	; (94E8:3796=8A50h)
		mov	byte ptr ds:[2A5Ch],1	; (94E8:2A5C=21h)
		cmp	al,31h			; '1'
		jne	loc_2239		; Jump if not equal
		jmp	short loc_2244		; (D206)
loc_2239:
		cmp	al,32h			; '2'
		je	loc_2244		; Jump if equal
		inc	byte ptr ds:[2A5Ch]	; (94E8:2A5C=21h)
		push	si
		inc	si
		cmp	al,35h			; '5'
		je	loc_2240		; Jump if equal
;*		call	far ptr sub_200		;*(1548:06B0)
		db	 9Ah,0B0h, 06h, 48h, 15h
		inc	si
loc_2240:
		mov	ax,es:[si]
		pop	si
		xor	bl,bl			; Zero register
		cmp	dl,36h			; '6'
		jne	loc_2242		; Jump if not equal
		mov	bl,es:[si+1]
		or	bl,8
		test	word ptr ds:[139Fh],8	; (94E8:139F=10E9h)
		jnz	loc_2242		; Jump if not zero
		cmp	ax,7Fh
		jb	loc_2241		; Jump if below
		cmp	ax,0FF80h
		jb	loc_2242		; Jump if below
loc_2241:
		or	byte ptr ds:[42BFh],40h	; (94E8:42BF=6) '@'
		cmp	ax,0
		jne	loc_2242		; Jump if not equal
		inc	byte ptr ds:[42C0h]	; (94E8:42C0=1Fh)
loc_2242:
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_2243		; Jump if zero
		mov	byte ptr ds:[2A5Ch],4	; (94E8:2A5C=21h)
		mov	ax,es:[si+3]
		cmp	ax,0
		je	loc_2243		; Jump if equal
;*		call	far ptr sub_230		;*(1548:14DC)
		db	 9Ah,0DCh, 14h, 48h, 15h
		mov	bx,es:[si+1]
		mov	byte ptr ds:[bp],5Bh	; '['
		inc	bp
;*		call	far ptr sub_185		;*(1548:01E8)
		db	 9Ah,0E8h, 01h, 48h, 15h
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
		jmp	loc_2355		; (DA45)
loc_2243:
		jmp	short loc_2250		; (D27C)
loc_2244:
		push	si
		inc	si
		cmp	al,31h			; '1'
		je	loc_2245		; Jump if equal
;*		call	far ptr sub_200		;*(1548:06B0)
		db	 9Ah,0B0h, 06h, 48h, 15h
		inc	si
		test	byte ptr ds:[42B3h],10h	; (94E8:42B3=1Eh)
		jnz	loc_2248		; Jump if not zero
loc_2245:
		mov	al,es:[si]
		pop	si
		push	word ptr ds:[2EC0h]	; (94E8:2EC0=8168h)
		push	word ptr ds:[2EC2h]	; (94E8:2EC2=8F3Eh)
		mov	word ptr ds:[2EC0h],0FF80h	; (94E8:2EC0=8168h)
		mov	word ptr ds:[2EC2h],7Fh	; (94E8:2EC2=8F3Eh)
		xor	bl,bl			; Zero register
		cmp	dl,32h			; '2'
		jne	loc_2246		; Jump if not equal
		mov	bl,es:[si+1]
		or	bl,8
loc_2246:
		cbw				; Convrt byte to word
		mov	byte ptr ds:[2A29h],1	; (94E8:2A29=83h)
		test	bl,8
		jnz	loc_2247		; Jump if not zero
		cmp	ax,word ptr ds:[2A33h]	; (94E8:2A33=0A503h)
		jae	loc_2247		; Jump if above or =
		mov	word ptr ds:[2A33h],ax	; (94E8:2A33=0A503h)
loc_2247:
		mov	byte ptr ds:[2A53h],0	; (94E8:2A53=6)
		mov	bh,byte ptr ds:[2A62h]	; (94E8:2A62=56h)
		call	sub_127			; (9520)
		pop	word ptr ds:[2EC2h]	; (8A50:2EC2=0AEE2h)
		pop	word ptr ds:[2EC0h]	; (8A50:2EC0=20AAh)
		jmp	short loc_2252		; (D2AA)
loc_2248:
		mov	al,es:[si]
		pop	si
		xor	bl,bl			; Zero register
		cmp	dl,32h			; '2'
		jne	loc_2249		; Jump if not equal
		mov	bl,es:[si+1]
		or	bl,8
loc_2249:
		cbw				; Convrt byte to word
loc_2250:
		mov	byte ptr ds:[2A29h],1	; (8A50:2A29=0A0h)
		test	byte ptr ds:[42B3h],10h	; (8A50:42B3=14h)
		jnz	loc_2255		; Jump if not zero
		test	bl,8
		jnz	loc_2251		; Jump if not zero
		cmp	ax,word ptr ds:[2A33h]	; (8A50:2A33=4D20h)
		jae	loc_2251		; Jump if above or =
		mov	word ptr ds:[2A33h],ax	; (8A50:2A33=4D20h)
loc_2251:
		mov	byte ptr ds:[2A53h],0	; (8A50:2A53=0A4h)
		call	sub_127			; (9520)
		test	byte ptr ds:[42BFh],40h	; (8A50:42BF=0) '@'
		jz	loc_2252		; Jump if zero
		or	byte ptr ds:[42BFh],80h	; (8A50:42BF=0)
loc_2252:
		cmp	byte ptr ds:[42B6h],1	; (8A50:42B6=6)
		je	loc_2253		; Jump if equal
		test	byte ptr ds:[2A53h],2	; (8A50:2A53=0A4h)
		jnz	loc_2253		; Jump if not zero
		mov	ax,word ptr ds:[2EF4h]	; (8A50:2EF4=4E4Fh)
		cmp	ax,word ptr ds:[3796h]	; (8A50:3796=5953h)
		jne	loc_2253		; Jump if not equal
		cmp	ax,word ptr ds:[2A50h]	; (8A50:2A50=0E0E1h)
		je	loc_2253		; Jump if equal
		mov	byte ptr ds:[2A53h],1	; (8A50:2A53=0A4h)
		mov	word ptr ds:[2A50h],ax	; (8A50:2A50=0E0E1h)
loc_2253:
		cmp	dl,32h			; '2'
		je	loc_2254		; Jump if equal
		cmp	dl,36h			; '6'
		je	loc_2254		; Jump if equal
		jmp	loc_2355		; (DA45)
loc_2254:
		jmp	loc_2265		; (D3CF)
loc_2255:
		test	byte ptr ds:[42B3h],0Fh	; (8A50:42B3=14h)
		jnz	loc_2259		; Jump if not zero
		and	byte ptr ds:[42B3h],0EFh	; (8A50:42B3=14h)
		cmp	dl,32h			; '2'
		je	loc_2256		; Jump if equal
		cmp	dl,36h			; '6'
		jne	loc_2258		; Jump if not equal
loc_2256:
		mov	bl,es:[si+1]
		and	bl,0C7h
		cmp	bl,6
		je	loc_2258		; Jump if equal
		test	byte ptr ds:[42BFh],40h	; (8A50:42BF=0) '@'
		jz	loc_2257		; Jump if zero
		or	byte ptr ds:[42BFh],80h	; (8A50:42BF=0)
loc_2257:
		and	byte ptr ds:[42BFh],0FBh	; (8A50:42BF=0)
		mov	word ptr ds:[37A4h],ax	; (8A50:37A4=5952h)
		mov	byte ptr ds:[42B6h],1	; (8A50:42B6=6)
		jmp	loc_2265		; (D3CF)
loc_2258:
		or	byte ptr ds:[42BFh],10h	; (8A50:42BF=0)
		push	si
		mov	si,3118h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
		jmp	loc_2355		; (DA45)
loc_2259:
		mov	cx,word ptr ds:[2D82h]	; (8A50:2D82=300Ah)
		cmp	word ptr ds:[42B1h],0FFFFh	; (8A50:42B1=1F06h)
		je	loc_2260		; Jump if equal
		mov	cx,word ptr ds:[42B1h]	; (8A50:42B1=1F06h)
loc_2260:
		cmp	byte ptr ds:[42B3h],1Ah	; (8A50:42B3=14h)
		jne	loc_2261		; Jump if not equal
		push	word ptr ds:[3796h]	; (8A50:3796=5953h)
		push	word ptr ds:[2EF4h]	; (8A50:2EF4=4E4Fh)
		mov	word ptr ds:[3796h],cx	; (8A50:3796=5953h)
		mov	word ptr ds:[2EF4h],cx	; (8A50:2EF4=4E4Fh)
		xor	bh,bh			; Zero register
		call	sub_127			; (9520)
		pop	word ptr ds:[2EF4h]	; (8A50:2EF4=4E4Fh)
		pop	word ptr ds:[3796h]	; (8A50:3796=5953h)
		mov	byte ptr ds:[2D93h],0	; (8A50:2D93=0AEh)
		jmp	loc_2253		; (D2CF)
loc_2261:
		mov	bx,cx
		mov	cl,byte ptr ds:[2A75h]	; (8A50:2A75=2Eh)
		push	cx
		mov	cl,2
		cmp	byte ptr ds:[42B3h],18h	; (8A50:42B3=14h)
		jne	loc_2262		; Jump if not equal
		mov	byte ptr ds:[2A75h],4Fh	; (8A50:2A75=2Eh) 'O'
loc_2262:
		call	sub_128			; (9AA4)
		pop	cx
		mov	byte ptr ds:[2A75h],cl	; (94E8:2A75=75h)
		jmp	loc_2253		; (D2CF)
		mov	cx,word ptr ds:[2EF4h]	; (94E8:2EF4=6FFh)
		mov	word ptr ds:[3796h],cx	; (94E8:3796=8A50h)
		test	byte ptr ds:[2D8Ch],80h	; (94E8:2D8C=0E9h)
		jnz	loc_2263		; Jump if not zero
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
loc_2263:
		test	byte ptr ds:[2ECCh],8	; (94E8:2ECC=91h)
		jz	loc_2264		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_2264:
		mov	bl,es:[si+1]
;*		call	far ptr sub_232		;*(1548:1650)
		db	 9Ah, 50h, 16h, 48h, 15h
		mov	byte ptr ds:[2F08h],1	; (94E8:2F08=3Eh)
		cmp	byte ptr ds:[2F06h],4	; (94E8:2F06=17h)
		jne	loc_2265		; Jump if not equal
		mov	byte ptr ds:[2F06h],0	; (94E8:2F06=17h)
loc_2265:
		mov	bl,es:[si+1]
;*		call	far ptr sub_208		;*(1548:0FA8)
		db	 9Ah,0A8h, 0Fh, 48h, 15h
		jnc	loc_2266		; Jump if carry=0
		mov	byte ptr ds:[2F0Ah],1	; (94E8:2F0A=9Bh)
loc_2266:
		mov	bl,es:[si+1]
loc_2267:
		and	bl,0C7h
		cmp	bl,6
		jne	loc_2268		; Jump if not equal
		jmp	loc_2355		; (DA45)
loc_2268:
		and	bl,7
		mov	cx,8
		test	bl,4
		jz	loc_2269		; Jump if zero
		mov	cx,5
loc_2269:
		mov	al,bl
		and	al,3
		mul	cl			; ax = reg * al
		test	bl,4
		jz	loc_2270		; Jump if zero
		push	cx
		mov	cx,2FE9h
		sub	cx,2FC9h
		add	ax,cx
		pop	cx
loc_2270:
		push	bx
		mov	bx,ax
		dec	cx
  
locloop_2271:
		mov	al,byte ptr ds:[2FC9h][bx]	; (94E8:2FC9=74h)
		mov	ds:[bp],al
		inc	bx
		inc	bp
		loop	locloop_2271		; Loop if cx > 0
  
		mov	al,byte ptr ds:[2FC9h][bx]	; (94E8:2FC9=74h)
		mov	byte ptr ds:[2F09h],al	; (94E8:2F09=64h)
		cmp	dl,32h			; '2'
		je	loc_2272		; Jump if equal
		cmp	dl,36h			; '6'
		jne	loc_2277		; Jump if not equal
loc_2272:
		cmp	byte ptr ds:[42B6h],0	; (94E8:42B6=0FEh)
		je	loc_2274		; Jump if equal
		dec	bp
		mov	byte ptr ds:[bp],2Bh	; '+'
		mov	ax,word ptr ds:[37A4h]	; (94E8:37A4=8A12h)
		test	ax,8000h
		jz	loc_2273		; Jump if zero
		mov	byte ptr ds:[bp],2Dh	; '-'
		not	ax
		inc	ax
loc_2273:
		inc	bp
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],5Dh	; ']'
		inc	bp
		mov	byte ptr ds:[42B6h],0	; (94E8:42B6=0FEh)
		jmp	short loc_2277		; (D4A5)
loc_2274:
		test	byte ptr ds:[2F09h],1	; (94E8:2F09=64h)
		jz	loc_2275		; Jump if zero
		cmp	word ptr ds:[37A4h],0	; (94E8:37A4=8A12h)
		je	loc_2277		; Jump if equal
loc_2275:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	bx,word ptr ds:[3796h]	; (94E8:3796=8A50h)
		call	sub_116			; (83D8)
		mov	bx,data_334		; (020C:2A8F=0E3E2h)
		or	byte ptr es:[bx],80h
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2276		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2276		; Jump if equal
		call	sub_115			; (83A4)
loc_2276:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2277:
		pop	bx
		xor	ax,ax			; Zero register
		test	byte ptr ds:[2F09h],8	; (020C:2F09=4Eh)
		jz	loc_2278		; Jump if zero
		call	sub_153			; (BF4C)
		add	ax,data_397		; (020C:2EE8=5357h)
loc_2278:
		test	byte ptr ds:[2F09h],4	; (020C:2F09=4Eh)
		jz	loc_2279		; Jump if zero
		call	sub_154			; (BF7C)
		add	ax,data_396		; (020C:2EE4=4E49h)
		jc	loc_2283		; Jump if carry Set
loc_2279:
		test	byte ptr ds:[2F09h],2	; (020C:2F09=4Eh)
		jz	loc_2280		; Jump if zero
		call	sub_152			; (BEBC)
		add	ax,data_394		; (020C:2ED8=4554h)
		jc	loc_2283		; Jump if carry Set
loc_2280:
		test	byte ptr ds:[2F09h],1	; (020C:2F09=4Eh)
		jz	loc_2281		; Jump if zero
		call	sub_155			; (BFD0)
		add	ax,word ptr ds:[2EECh]	; (020C:2EEC=4D45h)
		jc	loc_2283		; Jump if carry Set
loc_2281:
		cmp	dl,3Dh			; '='
		je	loc_2282		; Jump if equal
		add	ax,data_430		; (020C:37A4=0B8h)
		jc	loc_2283		; Jump if carry Set
loc_2282:
		test	bh,20h			; ' '
		jz	loc_2286		; Jump if zero
		cmp	ax,0FFFDh
		jb	loc_2284		; Jump if below
loc_2283:
		mov	byte ptr ds:[2F06h],0	; (020C:2F06=5Ch)
		jmp	loc_2355		; (DA45)
loc_2284:
		cmp	data_428,0		; (020C:3796=2A78h)
		je	loc_2286		; Jump if equal
		cmp	byte ptr ds:[2A75h],4Fh	; (020C:2A75=0ADh) 'O'
		je	loc_2285		; Jump if equal
		cmp	byte ptr ds:[2A75h],79h	; (020C:2A75=0ADh) 'y'
		jne	loc_2286		; Jump if not equal
loc_2285:
		test	data_480,20h		; (020C:42CC=0D323h)
		jnz	loc_2286		; Jump if not zero
		call	sub_119			; (8690)
loc_2286:
		jmp	loc_2355		; (DA45)
		cmp	al,40h			; '@'
		jne	loc_2288		; Jump if not equal
		mov	data_388,1		; (020C:2ECF=56h)
		cmp	byte ptr ds:[2A75h],78h	; (020C:2A75=0ADh) 'x'
		je	loc_2287		; Jump if equal
		cmp	byte ptr ds:[2A75h],0F5h	; (020C:2A75=0ADh)
		je	loc_2287		; Jump if equal
		test	data_323,0E0h		; (020C:2A77=0A5h)
		jz	loc_2288		; Jump if zero
		test	byte ptr es:[si+1],80h
		jnz	loc_2288		; Jump if not zero
loc_2287:
		push	si
		mov	si,30BEh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
loc_2288:
		push	si
		mov	byte ptr ds:[2A5Eh],0	; (020C:2A5E=0E9h)
		mov	dl,al
		inc	si
		test	dl,1
		jz	loc_2289		; Jump if zero
		inc	si
		mov	byte ptr ds:[2A5Eh],1	; (020C:2A5E=0E9h)
loc_2289:
		inc	byte ptr ds:[2A5Ch]	; (020C:2A5C=8Eh)
		cmp	dl,41h			; 'A'
		ja	loc_2291		; Jump if above
		mov	al,es:[si]
		cbw				; Convrt byte to word
		mov	data_388,1		; (020C:2ECF=56h)
		jmp	loc_2298		; (D67A)
loc_2290:
		jmp	loc_2304		; (D6CB)
loc_2291:
		mov	data_388,2		; (020C:2ECF=56h)
		inc	byte ptr ds:[2A5Ch]	; (020C:2A5C=8Eh)
		cmp	dl,46h			; 'F'
		ja	loc_2290		; Jump if above
		jz	loc_2292		; Jump if zero
		jmp	loc_2295		; (D61B)
loc_2292:
		mov	data_388,2		; (020C:2ECF=56h)
		test	data_385,4		; (020C:2ECA=45h)
		jz	loc_2293		; Jump if zero
		mov	data_388,4		; (020C:2ECF=56h)
		mov	ax,es:[si]
		mov	data_389,ax		; (020C:2ED0=3D45h)
		mov	ax,es:[si+2]
		mov	data_391,ax		; (020C:2ED2=3A43h)
		add	byte ptr ds:[2A5Ch],2	; (020C:2A5C=8Eh)
		cmp	ax,0
		je	loc_2293		; Jump if equal
		cmp	ax,0FFFFh
		je	loc_2293		; Jump if equal
		jmp	short loc_2294		; (D5F6)
loc_2293:
		mov	bx,data_354		; (020C:2D82=4152h)
		mov	ax,es:[si]
		mov	data_389,ax		; (020C:2ED0=3D45h)
		pop	si
		push	si
		mov	dl,data_388		; (020C:2ECF=56h)
		xor	dh,dh			; Zero register
		add	ax,dx
		inc	ax
		add	al,data_326		; (020C:2A7A=0A5h)
		adc	ah,0
		mov	dx,ax
		add	ax,data_355		; (020C:2D84=4C4Ch)
		cmp	ax,data_308		; (020C:2A42=0A720h)
		jb	loc_2294		; Jump if below
		cmp	ax,data_309		; (020C:2A44=0AFA0h)
		ja	loc_2294		; Jump if above
		xor	dh,dh			; Zero register
		jmp	loc_2313		; (D799)
loc_2294:
		mov	byte ptr ds:[bp],24h	; '$'
		inc	bp
		xor	ax,ax			; Zero register
		mov	al,data_388		; (020C:2ECF=56h)
		inc	ax
		add	al,data_326		; (020C:2A7A=0A5h)
		adc	ah,0
		add	data_389,ax		; (020C:2ED0=3D45h)
		adc	data_391,0		; (020C:2ED2=3A43h)
		call	sub_143			; (B768)
		pop	si
		xor	dx,dx			; Zero register
		jmp	loc_2355		; (DA45)
loc_2295:
		cmp	dl,44h			; 'D'
		jne	loc_2297		; Jump if not equal
		test	byte ptr ds:[2ECAh],4	; (0000:2ECA=59h)
		jz	loc_2297		; Jump if zero
		mov	ax,es:[si]
		mov	word ptr ds:[2ED0h],ax	; (0000:2ED0=0E17h)
		mov	ax,es:[si+2]
		mov	word ptr ds:[2ED2h],ax	; (0000:2ED2=2AE8h)
		mov	byte ptr ds:[2ECFh],4	; (0000:2ECF=75h)
		mov	byte ptr ds:[2A5Ch],4	; (0000:2A5C=0FFh)
		cmp	ax,0
		je	loc_2296		; Jump if equal
		cmp	ax,0FFFFh
		je	loc_2296		; Jump if equal
		jmp	short loc_2294		; (D5F6)
loc_2296:
		jmp	loc_2293		; (D5C3)
loc_2297:
		mov	byte ptr ds:[3BEAh],1	; (0000:3BEA=0A8h)
		mov	ax,es:[si]
		cmp	byte ptr ds:[263Eh],1	; (0000:263E=26h)
		jne	loc_2298		; Jump if not equal
		cmp	dl,44h			; 'D'
		jne	loc_2298		; Jump if not equal
		test	word ptr ds:[139Fh],4	; (0000:139F=0)
		jnz	loc_2298		; Jump if not zero
		cmp	ax,0FF80h
		jb	loc_2298		; Jump if below
		cmp	byte ptr ds:[2A75h],4Fh	; (0000:2A75=0FCh) 'O'
		je	loc_2298		; Jump if equal
		mov	byte ptr ds:[42C4h],1	; (0000:42C4=75h)
loc_2298:
		mov	bx,word ptr ds:[2A3Ch]	; (0000:2A3C=575h)
		cmp	dl,45h			; 'E'
		jae	loc_2299		; Jump if above or =
		cmp	dl,41h			; 'A'
		jne	loc_2300		; Jump if not equal
loc_2299:
		jmp	loc_2313		; (D799)
loc_2300:
		pop	si
		push	si
		xor	dh,dh			; Zero register
		mov	dl,byte ptr ds:[2A5Ch]	; (0000:2A5C=0FFh)
		mov	word ptr ds:[2ED0h],ax	; (0000:2ED0=0E17h)
		add	ax,dx
		inc	ax
		add	al,byte ptr ds:[2A7Ah]	; (0000:2A7A=0)
		adc	ah,0
		mov	dx,ax
		add	ax,word ptr ds:[2D84h]	; (0000:2D84=0F986h)
		cmp	ax,word ptr ds:[2A42h]	; (0000:2A42=2EF1h)
		jb	loc_2303		; Jump if below
		push	bx
		mov	bx,word ptr ds:[2A44h]	; (0000:2A44=3E80h)
		cmp	bx,0FFF1h
		jae	loc_2301		; Jump if above or =
		add	bx,0Fh
		jmp	short loc_2302		; (D6BE)
loc_2301:
		mov	bx,0FFFFh
loc_2302:
		cmp	ax,bx
		pop	bx
		ja	loc_2303		; Jump if above
		xor	dh,dh			; Zero register
		jmp	loc_2313		; (D799)
loc_2303:
		jmp	loc_2294		; (D5F6)
loc_2304:
		mov	byte ptr ds:[2A5Ch],4	; (0000:2A5C=0FFh)
		mov	ax,es:[si]
		inc	si
		inc	si
		test	byte ptr ds:[2ECAh],1	; (0000:2ECA=59h)
		jz	loc_2305		; Jump if zero
		add	byte ptr ds:[2A5Ch],2	; (0000:2A5C=0FFh)
		inc	si
		inc	si
		cmp	word ptr es:[si-2],0
		je	loc_2305		; Jump if equal
		push	ax
		mov	al,46h			; 'F'
		call	sub_52			; (6380)
		pop	ax
loc_2305:
		mov	bx,es:[si]
		cmp	bx,6Fh
		ja	loc_2306		; Jump if above
		push	cx
		mov	cx,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		inc	cx
		add	cl,byte ptr ds:[2A5Ch]	; (94E8:2A5C=21h)
		adc	ch,0
		cmp	cx,ax
		pop	cx
		jnz	loc_2306		; Jump if not zero
		mov	bx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		push	ax
		mov	al,47h			; 'G'
		call	sub_52			; (6380)
		pop	ax
loc_2306:
		cmp	byte ptr ds:[2638h],4	; (94E8:2638=0)
		jne	loc_2312		; Jump if not equal
		cmp	ax,0Fh
		ja	loc_2312		; Jump if above
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	si
		push	bx
		push	ax
		call	sub_106			; (80C5)
		mov	si,0
		mov	cl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		xor	ch,ch			; Zero register
  
locloop_2307:
		cmp	es:[si],bx
		jne	loc_2308		; Jump if not equal
		cmp	es:[si+2],ax
		ja	loc_2308		; Jump if above
		cmp	es:[si+4],ax
		jae	loc_2309		; Jump if above or =
loc_2308:
		add	si,15h
		loop	locloop_2307		; Loop if cx > 0
  
		jmp	short loc_2310		; (D769)
loc_2309:
		mov	bl,es:[si+0Bh]
		and	bl,1Eh
		ror	bl,1			; Rotate
		cmp	al,bl
		ja	loc_2310		; Jump if above
		rol	al,1			; Rotate
		or	al,20h			; ' '
		and	byte ptr es:[si+0Bh],0E1h
		or	es:[si+0Bh],al
loc_2310:
		pop	ax
		pop	bx
		pop	si
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2311		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2311		; Jump if equal
		call	sub_115			; (83A4)
loc_2311:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2312:
		push	si
		mov	si,3088h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	cl,1
		jmp	short loc_2314		; (D79B)
loc_2313:
		mov	cl,0
loc_2314:
		cmp	byte ptr ds:[2A75h],2Ah	; (94E8:2A75=75h) '*'
		jb	loc_2316		; Jump if below
		cmp	byte ptr ds:[2A75h],2Ch	; (94E8:2A75=75h) ','
		jbe	loc_2315		; Jump if below or =
		cmp	byte ptr ds:[2A75h],0F2h	; (94E8:2A75=75h)
		jb	loc_2316		; Jump if below
		cmp	byte ptr ds:[2A75h],0F4h	; (94E8:2A75=75h)
		ja	loc_2316		; Jump if above
loc_2315:
		or	cl,8
loc_2316:
		cmp	cl,1
		je	loc_2317		; Jump if equal
		cmp	ax,word ptr ds:[2A33h]	; (94E8:2A33=0A503h)
		jae	loc_2317		; Jump if above or =
		mov	word ptr ds:[2A33h],ax	; (94E8:2A33=0A503h)
loc_2317:
		call	sub_166			; (DA78)
		call	sub_128			; (9AA4)
		mov	byte ptr ds:[3BEAh],0	; (94E8:3BEA=0B9h)
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		jne	loc_2320		; Jump if not equal
		cmp	byte ptr ds:[42B9h],1	; (94E8:42B9=3)
		jne	loc_2321		; Jump if not equal
		cmp	byte ptr ds:[2A5Ch],2	; (94E8:2A5C=21h)
		jne	loc_2320		; Jump if not equal
		mov	ax,word ptr ds:[37A4h]	; (94E8:37A4=8A12h)
		sub	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		dec	ax
		sub	al,byte ptr ds:[2A7Ah]	; (94E8:2A7A=56h)
		sbb	ah,0
		sub	al,byte ptr ds:[2A5Ch]	; (94E8:2A5C=21h)
		sbb	ah,0
		test	ax,8000h
		jz	loc_2318		; Jump if zero
		not	ax
loc_2318:
		cmp	ax,7Fh
		jbe	loc_2319		; Jump if below or =
		jmp	loc_2329		; (D89F)
loc_2319:
		mov	byte ptr ds:[2EB7h],1	; (94E8:2EB7=3Dh)
		mov	byte ptr ds:[42B7h],1	; (94E8:42B7=6)
loc_2320:
		jmp	loc_2329		; (D89F)
loc_2321:
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_164		proc	near
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	si,word ptr ds:[42BCh]	; (94E8:42BC=561Eh)
		mov	bx,word ptr ds:[37A2h]	; (94E8:37A2=753Ah)
		cmp	byte ptr ds:[2A75h],4Fh	; (94E8:2A75=75h) 'O'
		jne	loc_2322		; Jump if not equal
		call	sub_118			; (84C0)
		jmp	short loc_2323		; (D837)
loc_2322:
		call	sub_117			; (844C)
loc_2323:
		test	byte ptr es:[si+5],40h	; '@'
		jnz	loc_2327		; Jump if not zero
		mov	ax,es:[si]
		cmp	ax,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		ja	loc_2324		; Jump if above
		jc	loc_2326		; Jump if carry Set
		mov	ax,es:[si+2]
		cmp	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		jb	loc_2326		; Jump if below
loc_2324:
		cmp	byte ptr ds:[263Dh],0Ah	; (94E8:263D=86h)
		jb	loc_2327		; Jump if below
		cmp	byte ptr ds:[2A75h],4Fh	; (94E8:2A75=75h) 'O'
		je	loc_2325		; Jump if equal
		test	byte ptr es:[si+4],80h
		jz	loc_2326		; Jump if zero
		jmp	short loc_2327		; (D880)
loc_2325:
		test	byte ptr es:[si+4],20h	; ' '
		jnz	loc_2327		; Jump if not zero
loc_2326:
		mov	byte ptr ds:[2EB7h],1	; (94E8:2EB7=3Dh)
		mov	byte ptr ds:[42B7h],1	; (94E8:42B7=6)
		and	byte ptr ds:[42C4h],0FEh	; (94E8:42C4=0E8h)
loc_2327:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2328		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2328		; Jump if equal
		call	sub_115			; (83A4)
loc_2328:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2329:
		pop	si
		jmp	loc_2355		; (DA45)
loc_2330:
		push	si
		push	di
		call	sub_141			; (B4F0)
		mov	al,byte ptr ds:[2ECAh]	; (94E8:2ECA=0C5h)
		and	al,7
		test	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
		jz	loc_2331		; Jump if zero
		cmp	al,6
		je	loc_2332		; Jump if equal
		cmp	al,7
		je	loc_2332		; Jump if equal
		jmp	short loc_2333		; (D8CA)
loc_2331:
		cmp	al,0
		je	loc_2332		; Jump if equal
		cmp	al,1
		je	loc_2332		; Jump if equal
		jmp	short loc_2333		; (D8CA)
loc_2332:
		jmp	short loc_2336		; (D8F8)
loc_2333:
		mov	si,3052h
		mov	di,30EAh
		test	dl,1
		jz	loc_2334		; Jump if zero
		mov	si,3048h
		test	byte ptr ds:[2ECAh],1	; (94E8:2ECA=0C5h)
		jz	loc_2334		; Jump if zero
		mov	si,305Ch
loc_2334:
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_2335		; Jump if zero
		mov	di,30F9h
loc_2335:
		push	di
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2336:
		pop	di
		pop	si
		jmp	loc_2355		; (DA45)
		cmp	byte ptr ds:[2638h],6	; (94E8:2638=0)
		jb	loc_2337		; Jump if below
		test	byte ptr ds:[2ECAh],7	; (94E8:2ECA=0C5h)
		jnz	loc_2337		; Jump if not zero
		call	sub_152			; (BEBC)
loc_2337:
		jmp	short loc_2340		; (D965)
		cmp	byte ptr ds:[2638h],6	; (94E8:2638=0)
		jb	loc_2338		; Jump if below
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jnz	loc_2338		; Jump if not zero
		mov	word ptr ds:[42F5h],0FFFFh	; (94E8:42F5=2688h)
		call	sub_154			; (BF7C)
		cmp	dl,76h			; 'v'
		jae	loc_2338		; Jump if above or =
		mov	al,dl
		or	al,1
		cmp	al,73h			; 's'
		je	loc_2338		; Jump if equal
		mov	ax,word ptr ds:[2EF2h]	; (94E8:2EF2=35EBh)
		mov	word ptr ds:[42F5h],ax	; (94E8:42F5=2688h)
		call	sub_153			; (BF4C)
loc_2338:
		mov	word ptr ds:[42F5h],0FFFFh	; (94E8:42F5=2688h)
		jmp	short loc_2340		; (D965)
		cmp	byte ptr ds:[2638h],6	; (94E8:2638=0)
		jb	loc_2339		; Jump if below
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jnz	loc_2339		; Jump if not zero
		mov	ax,word ptr ds:[2EF2h]	; (94E8:2EF2=35EBh)
		mov	word ptr ds:[42F5h],ax	; (94E8:42F5=2688h)
		call	sub_153			; (BF4C)
loc_2339:
		mov	word ptr ds:[42F5h],0FFFFh	; (94E8:42F5=2688h)
		jmp	loc_2330		; (D8A3)
loc_2340:
		call	sub_141			; (B4F0)
		test	byte ptr ds:[2ECCh],8	; (94E8:2ECC=91h)
		jnz	loc_2343		; Jump if not zero
		mov	al,byte ptr ds:[2ECAh]	; (94E8:2ECA=0C5h)
		and	al,7
		test	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
		jz	loc_2341		; Jump if zero
		cmp	al,6
		je	loc_2342		; Jump if equal
		cmp	al,7
		je	loc_2342		; Jump if equal
		jmp	short loc_2343		; (D997)
loc_2341:
		cmp	al,0
		je	loc_2342		; Jump if equal
		cmp	al,1
		je	loc_2342		; Jump if equal
		jmp	short loc_2343		; (D997)
loc_2342:
		cmp	dl,6Fh			; 'o'
		je	loc_2343		; Jump if equal
		jmp	loc_2355		; (DA45)
loc_2343:
		push	si
		cmp	dl,6Fh			; 'o'
		je	loc_2346		; Jump if equal
		cmp	dl,76h			; 'v'
		jb	loc_2344		; Jump if below
		mov	si,30E0h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2344:
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
		mov	al,dl
		or	al,1
		cmp	al,75h			; 'u'
		jne	loc_2346		; Jump if not equal
		mov	si,30CDh
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_2345		; Jump if zero
		mov	si,30D6h
loc_2345:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		test	bh,80h
		jz	loc_2346		; Jump if zero
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
loc_2346:
		test	byte ptr ds:[2ECCh],8	; (94E8:2ECC=91h)
		jz	loc_2347		; Jump if zero
;*		call	far ptr sub_211		;*(1548:102C)
		db	 9Ah, 2Ch, 10h, 48h, 15h
loc_2347:
		mov	si,310Dh
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_2348		; Jump if zero
		mov	si,3112h
loc_2348:
		cmp	dl,6Fh			; 'o'
		je	loc_2352		; Jump if equal
		mov	si,3102h
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_2349		; Jump if zero
		mov	si,3107h
loc_2349:
		mov	al,dl
		or	al,1
		cmp	al,71h			; 'q'
		jne	loc_2352		; Jump if not equal
		mov	si,30E4h
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_2350		; Jump if zero
		mov	si,30F2h
loc_2350:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	si,30EAh
		test	byte ptr ds:[2ECAh],2	; (94E8:2ECA=0C5h)
		jz	loc_2351		; Jump if zero
		mov	si,30F9h
loc_2351:
		test	bh,80h
		jz	loc_2352		; Jump if zero
;*		call	far ptr sub_191		;*(1548:0370)
		db	 9Ah, 70h, 03h, 48h, 15h
loc_2352:
		cmp	dl,6Fh			; 'o'
		jne	loc_2353		; Jump if not equal
		test	byte ptr ds:[2ECCh],8	; (94E8:2ECC=91h)
		jz	loc_2354		; Jump if zero
loc_2353:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2354:
		pop	si
		mov	dh,0
		jmp	short loc_2355		; (DA45)
loc_2355:
		mov	byte ptr ds:[2A29h],0	; (94E8:2A29=83h)
		mov	al,byte ptr ds:[2A5Ch]	; (94E8:2A5C=21h)
		retn
sub_164		endp
  
;*		call	far ptr sub_177		;*(1548:0000)
		db	 9Ah, 00h, 00h, 48h, 15h
		push	di
		mov	di,23B3h
		mov	[di],bx
		pop	di
		push	bp
		mov	bp,23BAh
		mov	ax,data_354		; (020C:2D82=4152h)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		inc	bp
		mov	ax,data_355		; (020C:2D84=4C4Ch)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		pop	bp
		mov	al,30h			; '0'
		call	sub_76			; (7090)
		jmp	short loc_2355		; (DA45)
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_166		proc	near
		cmp	byte ptr ds:[2A75h],78h	; (94E8:2A75=75h) 'x'
		jne	loc_2356		; Jump if not equal
		cmp	byte ptr ds:[2638h],4	; (94E8:2638=0)
		jb	loc_2356		; Jump if below
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		je	loc_2356		; Jump if equal
		cmp	bx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		jne	loc_2357		; Jump if not equal
		cmp	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		jb	loc_2357		; Jump if below
loc_2356:
		jmp	loc_2363		; (DB40)
loc_2357:
		push	ax
		push	bx
		push	cx
		push	dx
		push	di
		mov	byte ptr ds:[4204h],1	; (94E8:4204=21h)
		mov	dx,1
		call	sub_84			; (7498)
		mov	byte ptr ds:[4204h],0	; (A80C:4204=0)
		mov	cx,bx
		mov	dx,ax
		jnc	loc_2361		; Jump if carry=0
		mov	cx,es:[di]
		mov	dx,es:[di+2]
loc_2358:
		mov	al,es:[di+4]
		and	al,5Fh			; '_'
		cmp	al,5Fh			; '_'
		jne	loc_2359		; Jump if not equal
		cmp	byte ptr es:[di+9],7
		jne	loc_2359		; Jump if not equal
		jz	loc_2362		; Jump if zero
loc_2359:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2360		; Jump if not zero
		mov	al,es:[di+6]
loc_2360:
		add	di,ax
		cmp	es:[di],cx
		jne	loc_2361		; Jump if not equal
		cmp	es:[di+2],dx
		jne	loc_2361		; Jump if not equal
		jmp	short loc_2358		; (DABE)
loc_2361:
		mov	bx,cx
		mov	ax,dx
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],5Fh	; '_'
		mov	byte ptr [di+5],2
		mov	byte ptr [di+6],0
		mov	word ptr [di+7],203Fh
		mov	byte ptr [di+9],7
		mov	ax,word ptr ds:[2EF4h]	; (A80C:2EF4=0)
		mov	[di+0Ah],ax
		mov	ax,word ptr ds:[2EF2h]	; (A80C:2EF2=0)
		mov	[di+0Ch],ax
		mov	ax,word ptr ds:[2ED4h]	; (A80C:2ED4=0)
		mov	[di+0Eh],ax
		mov	ax,word ptr ds:[2ED8h]	; (A80C:2ED8=0)
		mov	[di+10h],ax
		mov	ax,word ptr ds:[2EE4h]	; (A80C:2EE4=0)
		mov	[di+12h],ax
		mov	ax,word ptr ds:[2EE8h]	; (A80C:2EE8=0)
		mov	[di+14h],ax
		call	sub_124			; (9120)
loc_2362:
		pop	di
		pop	dx
		pop	cx
		pop	bx
		pop	ax
loc_2363:
		retn
sub_166		endp
  
		xchg	bx,bx
		nop
		test	word ptr ds:[42C6h],4	; (A80C:42C6=0)
		jz	loc_2366		; Jump if zero
		mov	cx,3429h
		mov	di,2F0Ch
		sub	cx,di
		dec	di
  
locloop_2364:
		inc	di
		mov	bx,47DDh
		mov	al,[di]
		cmp	al,20h			; ' '
		jbe	loc_2365		; Jump if below or =
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2365		; Jump if not zero
		mov	byte ptr [di],20h	; ' '
loc_2365:
		loop	locloop_2364		; Loop if cx > 0
  
loc_2366:
		cld				; Clear direction
		mov	ax,55Dh
		mov	di,8E62h
		mov	es,ax
		mov	cx,2
		mov	si,0A66Bh
		rep	movs byte ptr es:[di],cs:[si]	; Rep when cx >0 Mov [si] to es:[di]
		mov	dh,0
		nop
		mov	si,42F0h
		retn
		db	14 dup (0)
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_167		proc	near
		push	ds
		call	sub_104			; (80B9)
		mov	al,33h			; '3'
		call	sub_52			; (6380)
		call	sub_106			; (80C5)
		mov	di,0
loc_2367:
		mov	bp,5BBAh
		mov	cx,5BFAh
		sub	cx,bp
		shr	cx,1			; Shift w/zeros fill
  
locloop_2368:
		mov	word ptr ds:[bp],2020h
		inc	bp
		inc	bp
		loop	locloop_2368		; Loop if cx > 0
  
		mov	bp,5BBAh
		mov	bx,es:[di]
		mov	ax,es:[di+2]
		call	sub_170			; (E818)
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	bp,5BC7h
		mov	ax,es:[di+4]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	cx,es:[di+0Ah]
		cmp	cl,2
		je	loc_2369		; Jump if equal
		cmp	cl,3
		je	loc_2369		; Jump if equal
		mov	bp,5BCFh
		mov	bx,es:[di+6]
		xor	ax,ax			; Zero register
		call	sub_171			; (E86C)
		mov	bp,5BD6h
		mov	bx,es:[di+8]
		xor	ax,ax			; Zero register
		call	sub_171			; (E86C)
		jmp	short loc_2370		; (DC13)
loc_2369:
		xor	ax,ax			; Zero register
		mov	bp,5BCFh
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		xor	ax,ax			; Zero register
		mov	bp,5BD6h
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_2370:
		mov	cx,es:[di+0Ah]
		mov	al,cl
		mov	bl,6
		mul	bl			; ax = reg * al
		mov	si,33C9h
		add	si,ax
		mov	bp,5BDDh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	bp,5BE3h
		mov	si,3417h
		test	byte ptr es:[di+0Eh],1
		jz	loc_2371		; Jump if zero
		mov	si,341Dh
loc_2371:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	bp,5BEBh
		mov	ax,es:[di]
		mov	word ptr ds:[bp],203Bh
		add	bp,2
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		cmp	word ptr ds:[2EC4h],2	; (94E8:2EC4=8BA4h)
		jae	loc_2372		; Jump if above or =
		test	byte ptr ds:[2EB1h],4	; (94E8:2EB1=0C9h)
		jnz	loc_2372		; Jump if not zero
		jmp	short loc_2373		; (DCB3)
loc_2372:
		cmp	byte ptr cs:[4860h],0	; (020C:4860=2Ah)
		je	loc_2373		; Jump if equal
		mov	byte ptr ds:[bp],20h	; ' '
		inc	bp
		mov	word ptr ds:[bp],3A44h
		add	bp,2
		mov	ax,es:[di+11h]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],20h	; ' '
		inc	bp
		mov	word ptr ds:[bp],3A4Ch
		add	bp,2
		mov	ax,es:[di+13h]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],20h	; ' '
		inc	bp
		mov	word ptr ds:[bp],3A53h
		add	bp,2
		mov	ax,es:[di+0Fh]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_2373:
		mov	al,34h			; '4'
		call	sub_52			; (6380)
		add	di,15h
		cmp	word ptr es:[di],0FFFFh
		je	loc_2374		; Jump if equal
		jmp	loc_2367		; (DB9F)
loc_2374:
		cmp	word ptr es:[di+2],0FFFFh
		je	loc_2375		; Jump if equal
		jmp	loc_2367		; (DB9F)
loc_2375:
		pop	ds
		retn
sub_167		endp
  
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_168		proc	near
		push	ds
		call	sub_104			; (80B9)
		mov	al,4Dh			; 'M'
		call	sub_52			; (6380)
		call	sub_106			; (80C5)
		mov	di,0
		add	di,15h
loc_2376:
		cmp	word ptr es:[di],0FFFFh
		je	loc_2377		; Jump if equal
		jmp	short loc_2378		; (DCF1)
loc_2377:
		cmp	word ptr es:[di+2],0FFFFh
		je	loc_2379		; Jump if equal
loc_2378:
		mov	ax,es:[di+0Ch]
		mov	word ptr ds:[6BA3h],ax	; (94E8:6BA3=0C706h)
		mov	word ptr ds:[6BC8h],ax	; (94E8:6BC8=0Ah)
		mov	al,4Eh			; 'N'
		call	sub_52			; (6380)
		add	di,15h
		jmp	short loc_2376		; (DCE2)
loc_2379:
		pop	ds
		retn
sub_168		endp
  
		nop
		call	sub_109			; (80CE)
		mov	al,byte ptr ds:[2EBAh]	; (94E8:2EBA=74h)
		mov	byte ptr ds:[2EBBh],al	; (94E8:2EBB=3Eh)
		mov	byte ptr ds:[2EBAh],2	; (94E8:2EBA=74h)
		mov	al,3Fh			; '?'
		call	sub_52			; (6380)
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,34B8h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,word ptr ds:[42CCh]	; (94E8:42CC=71Fh)
		mov	cx,10h
		mov	al,41h			; 'A'
		mov	bh,20h			; ' '
  
locloop_2380:
		mov	bl,al
		rcl	dx,1			; Rotate thru carry
		jc	loc_2381		; Jump if carry Set
		add	bl,20h			; ' '
loc_2381:
		mov	ds:[bp],bx
		inc	bp
		inc	bp
		inc	al
		loop	locloop_2380		; Loop if cx > 0
  
		mov	dl,byte ptr ds:[430Bh]	; (94E8:430B=21h)
		ror	dl,1			; Rotate
		ror	dl,1			; Rotate
		mov	cl,4
		mov	al,51h			; 'Q'
		mov	bh,20h			; ' '
  
locloop_2382:
		mov	bl,al
		test	dl,1
		jnz	loc_2383		; Jump if not zero
		add	bl,20h			; ' '
loc_2383:
		mov	ds:[bp],bx
		inc	bp
		inc	bp
		inc	al
		rol	dl,1			; Rotate
		loop	locloop_2382		; Loop if cx > 0
  
		mov	dx,word ptr ds:[42CEh]	; (94E8:42CE=0F78Bh)
		mov	cx,6
		mov	al,55h			; 'U'
		mov	bh,20h			; ' '
  
locloop_2384:
		mov	bl,al
		rcl	dl,1			; Rotate thru carry
		jc	loc_2385		; Jump if carry Set
		add	bl,20h			; ' '
loc_2385:
		mov	ds:[bp],bx
		inc	bp
		inc	bp
		inc	al
		loop	locloop_2384		; Loop if cx > 0
  
		mov	dx,27CAh
		call	sub_53			; (6418)
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,34CCh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[2A77h]	; (94E8:2A77=4Ah)
		mov	si,361Eh
		test	al,1
		jnz	loc_2387		; Jump if not zero
		mov	si,3623h
		test	al,2
		jnz	loc_2387		; Jump if not zero
		mov	si,362Bh
		test	al,4
		jnz	loc_2387		; Jump if not zero
		mov	si,3631h
		test	al,10h
		jnz	loc_2386		; Jump if not zero
		mov	si,3635h
		test	al,20h			; ' '
		jnz	loc_2386		; Jump if not zero
		mov	si,3639h
		test	al,40h			; '@'
		jnz	loc_2386		; Jump if not zero
		mov	si,363Dh
		test	al,80h
		jnz	loc_2386		; Jump if not zero
loc_2386:
		test	al,8
		jz	loc_2387		; Jump if zero
		mov	byte ptr ds:[bp],50h	; 'P'
		inc	bp
loc_2387:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
		test	byte ptr ds:[2A79h],0Fh	; (94E8:2A79=0BFh)
		jz	loc_2388		; Jump if zero
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,3641h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2388:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,34E0h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	ax,word ptr ds:[2C39h]	; (94E8:2C39=0FB8Bh)
		mov	ds:[bp],ax
		add	bp,2
		mov	al,byte ptr ds:[2C3Bh]	; (94E8:2C3B=83h)
		mov	ds:[bp],al
		mov	dx,27CAh
		call	sub_53			; (6418)
		cmp	byte ptr ds:[2EB8h],0	; (94E8:2EB8=0FFh)
		jne	loc_2389		; Jump if not equal
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,35E5h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2389:
		cmp	byte ptr ds:[2A1Fh],3	; (94E8:2A1F=32h)
		ja	loc_2391		; Jump if above
		cmp	byte ptr ds:[2A1Fh],0	; (94E8:2A1F=32h)
		je	loc_2391		; Jump if equal
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,3581h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[2A1Fh]	; (94E8:2A1F=32h)
		mov	si,367Bh
		cmp	al,1
		je	loc_2390		; Jump if equal
		mov	si,3684h
		cmp	al,2
		je	loc_2390		; Jump if equal
		mov	si,3680h
		cmp	al,3
		je	loc_2390		; Jump if equal
		mov	si,3735h
loc_2390:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2391:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,3595h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[14ADh]	; (94E8:14AD=1Eh)
		mov	si,3689h
		cmp	al,0
		je	loc_2392		; Jump if equal
		mov	si,3691h
		cmp	al,1
		je	loc_2392		; Jump if equal
		mov	si,369Bh
		cmp	al,2
		je	loc_2392		; Jump if equal
		mov	si,36ACh
loc_2392:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,35A9h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[152Ah]	; (94E8:152A=0EBh)
		mov	si,36C4h
		cmp	al,0
		je	loc_2393		; Jump if equal
		mov	si,36C9h
		cmp	al,1
		je	loc_2393		; Jump if equal
		mov	si,36D9h
		cmp	al,2
		je	loc_2393		; Jump if equal
		mov	si,3727h
		cmp	al,3
		je	loc_2393		; Jump if equal
		mov	si,36EEh
		cmp	al,4
		je	loc_2393		; Jump if equal
		mov	si,3710h
		cmp	al,5
		je	loc_2393		; Jump if equal
		mov	si,36FEh
		cmp	al,6
		je	loc_2393		; Jump if equal
		mov	si,36FAh
		cmp	al,7
		je	loc_2393		; Jump if equal
		mov	si,3735h
loc_2393:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
		cmp	byte ptr ds:[2EBCh],1	; (94E8:2EBC=3Dh)
		je	loc_2394		; Jump if equal
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,35F6h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2394:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,360Ah
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	si,13A1h
		mov	al,byte ptr ds:[139Eh]	; (94E8:139E=6)
		xor	cl,cl			; Zero register
loc_2395:
		cmp	al,[si]
		je	loc_2397		; Jump if equal
		inc	cl
		cmp	cl,8
		jae	loc_2396		; Jump if above or =
		add	si,0Fh
		jmp	short loc_2395		; (DF3F)
loc_2396:
		mov	si,13A1h
loc_2397:
		lea	cx,[si+0Dh]		; Load effective addr
		lea	si,[si+1]		; Load effective addr
		sub	cx,si
		cld				; Clear direction
  
locloop_2398:
		lodsb				; String [si] to al
		mov	ds:[bp],al
		inc	bp
		loop	locloop_2398		; Loop if cx > 0
  
		mov	dx,27CAh
		call	sub_53			; (6418)
		cmp	byte ptr ds:[2EBFh],3Bh	; (94E8:2EBF=75h) ';'
		jne	loc_2399		; Jump if not equal
		cmp	byte ptr ds:[2EBBh],2	; (94E8:2EBB=3Eh)
		je	loc_2401		; Jump if equal
loc_2399:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,35BDh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		xor	ah,ah			; Zero register
		mov	bl,ah
		mov	al,byte ptr ds:[2EBFh]	; (94E8:2EBF=75h)
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		cmp	byte ptr ds:[2EBBh],2	; (94E8:2EBB=3Eh)
		je	loc_2400		; Jump if equal
		mov	byte ptr ds:[bp],2Ch	; ','
		inc	bp
		mov	word ptr ds:[bp],6320h
		add	bp,2
		xor	ah,ah			; Zero register
		mov	bl,ah
		mov	al,byte ptr ds:[2EBBh]	; (94E8:2EBB=3Eh)
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
loc_2400:
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2401:
		cmp	word ptr ds:[2A22h],0	; (94E8:2A22=0BB9h)
		je	loc_2402		; Jump if equal
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,35D1h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	ax,word ptr ds:[2A22h]	; (94E8:2A22=0BB9h)
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2402:
		mov	di,2BB2h
		mov	al,2Eh			; '.'
		mov	cx,40h
		cld				; Clear direction
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		jcxz	loc_2405		; Jump if cx=0
		mov	ax,[di]
		and	ax,0DFDFh
		cmp	ax,4544h
		je	loc_2405		; Jump if equal
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,3559h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	si,2BB2h
		mov	di,bp
		mov	cx,40h
  
locloop_2403:
		lodsb				; String [si] to al
		cmp	al,0
		je	loc_2404		; Jump if equal
		stosb				; Store al to es:[di]
		loop	locloop_2403		; Loop if cx > 0
  
loc_2404:
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2405:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,351Dh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[2C40h]	; (94E8:2C40=0)
		mov	si,3649h
		cmp	al,1
		je	loc_2406		; Jump if equal
		mov	si,3652h
		cmp	al,2
		je	loc_2406		; Jump if equal
		mov	si,3656h
		cmp	al,3
		je	loc_2406		; Jump if equal
		mov	si,365Ah
		cmp	al,4
		je	loc_2406		; Jump if equal
		mov	si,3665h
		cmp	al,5
		je	loc_2406		; Jump if equal
		mov	si,3673h
		cmp	al,6
		je	loc_2406		; Jump if equal
loc_2406:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	di,358h
		mov	al,20h			; ' '
		mov	cx,20h
		cld				; Clear direction
		repe	scasb			; Rep zf=1+cx >0 Scan es:[di] for al
		jcxz	loc_2407		; Jump if cx=0
		mov	si,3531h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	cx,10h
		mov	si,358h
		mov	di,bp
		rep	movsw			; Rep when cx >0 Mov [si] to es:[di]
		add	bp,20h
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2407:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,3545h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[2A94h]	; (94E8:2A94=0C1h)
		add	al,41h			; 'A'
		mov	ds:[bp],al
		mov	dx,27CAh
		call	sub_53			; (6418)
		call	sub_91			; (7C34)
		mov	bp,27EAh
data_666	db	0BEh			; Data table (indexed access)
data_667	db	6Dh
		xor	ax,49Ah
		adc	[bx+si+15h],cl
		mov	si,2BF5h
		mov	di,bp
		mov	cx,29h
		cld				; Clear direction
  
locloop_2408:
		lodsb				; String [si] to al
		cmp	al,0
		je	loc_2409		; Jump if equal
		stosb				; Store al to es:[di]
		loop	locloop_2408		; Loop if cx > 0
  
loc_2409:
		mov	al,2Eh			; '.'
		mov	di,bp
		mov	cx,29h
		repne	scasb			; Rep zf=0+cx >0 Scan es:[di] for al
		mov	si,2C39h
		mov	cx,3
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	dx,27CAh
		call	sub_53			; (6418)
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,34F4h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		shr	al,1			; Shift w/zeros fill
		xor	bl,bl			; Zero register
		mov	ah,bl
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	dx,27CAh
		call	sub_53			; (6418)
		mov	al,byte ptr ds:[430Bh]	; (94E8:430B=21h)
		and	al,7
		cmp	al,0
		je	loc_2410		; Jump if equal
		cmp	al,7
		je	loc_2410		; Jump if equal
		jmp	short loc_2413		; (E140)
loc_2410:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	si,3508h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
data_668	db	0D0h
		call	sub_169			; (E660)
		jc	loc_2411		; Jump if carry Set
		test	byte ptr ds:[430Bh],7	; (94E8:430B=21h)
		jz	loc_2411		; Jump if zero
		mov	byte ptr ds:[bp],4Eh	; 'N'
		jmp	short loc_2412		; (E13A)
loc_2411:
		mov	word ptr ds:[bp],4646h
loc_2412:
		mov	dx,27CAh
		call	sub_53			; (6418)
loc_2413:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	dx,27CAh
		call	sub_53			; (6418)
		mov	bp,27EAh
		mov	dx,27CAh
		call	sub_53			; (6418)
		mov	al,byte ptr ds:[2EBBh]	; (94E8:2EBB=3Eh)
		mov	byte ptr ds:[2EBAh],al	; (94E8:2EBA=74h)
		retn
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		cld				; Clear direction
		mov	di,8
loc_2414:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_2415		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		jne	loc_2415		; Jump if not equal
		jmp	loc_2432		; (E2C8)
loc_2415:
		mov	al,es:[di+4]
		test	al,60h			; '`'
		jnz	loc_2416		; Jump if not zero
		jmp	loc_2430		; (E2B0)
loc_2416:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	bx,es:[di]
		mov	ax,es:[di+2]
		call	sub_170			; (E818)
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
data_669	db	8Bh			; Data table (indexed access)
		inc	bp
		add	bl,[bp+si+68h]
		nop				;*ASM fixup - displacement
		dec	ax
		adc	ax,0C58Bh
		sub	ax,27EAh
		cmp	ax,0Ch
		jae	loc_2417		; Jump if above or =
		mov	bp,27EAh
		add	bp,0Bh
loc_2417:
		inc	bp
		mov	si,3140h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		test	byte ptr es:[di+4],80h
		jz	loc_2418		; Jump if zero
		mov	si,317Fh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2418:
		test	byte ptr es:[di+4],18h
		jnz	loc_2419		; Jump if not zero
		mov	al,es:[di+32h]
		ror	al,1			; Rotate
		ror	al,1			; Rotate
		ror	al,1			; Rotate
		and	al,7
		cmp	al,7
		jne	loc_2420		; Jump if not equal
loc_2419:
		mov	si,3198h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2420:
		mov	al,es:[di+5]
		and	al,3
		cmp	al,3
		je	loc_2421		; Jump if equal
		mov	al,es:[di+6]
		or	al,al			; Zero ?
		jz	loc_2421		; Jump if zero
		mov	si,31A5h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
;*		call	far ptr sub_181		;*(1548:0078)
		db	 9Ah, 78h, 00h, 48h, 15h
loc_2421:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,1Fh
		jae	loc_2422		; Jump if above or =
		mov	bp,27EAh
		add	bp,1Eh
loc_2422:
		inc	bp
		mov	al,es:[di+5]
		test	al,2
		jz	loc_2423		; Jump if zero
		mov	cx,3Bh
		call	sub_81			; (71AC)
		jmp	short loc_2424		; (E248)
loc_2423:
		mov	bp,282Ah
		mov	word ptr ds:[bp],203Bh
		add	bp,2
		mov	cx,3Bh
		call	sub_81			; (71AC)
		jmp	short loc_2428		; (E283)
loc_2424:
		mov	al,es:[di+5]
		and	al,3
		cmp	al,3
		je	loc_2425		; Jump if equal
		jmp	short loc_2428		; (E283)
loc_2425:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,2Fh
		jae	loc_2426		; Jump if above or =
		mov	bp,27EAh
		add	bp,2Eh
loc_2426:
		inc	bp
		lea	si,[di+48h]		; Load effective addr
		xor	ch,ch			; Zero register
		mov	cl,es:[di+6]
		sub	cl,48h			; 'H'
		cmp	cx,40h
		jbe	locloop_2427		; Jump if below or =
		mov	cx,40h
		cld				; Clear direction
  
locloop_2427:
		lods byte ptr es:[si]		; String [si] to al
		mov	ds:[bp],al
		inc	bp
		loop	locloop_2427		; Loop if cx > 0
  
loc_2428:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	di
		mov	dx,27CAh
		call	sub_53			; (6418)
		pop	di
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2429		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2429		; Jump if equal
		call	sub_115			; (83A4)
loc_2429:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2430:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2431		; Jump if not zero
		mov	al,es:[di+6]
loc_2431:
		add	di,ax
		jmp	loc_2414		; (E173)
loc_2432:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2433		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2433		; Jump if equal
		call	sub_115			; (83A4)
loc_2433:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2434		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2434		; Jump if equal
		call	sub_115			; (83A4)
loc_2434:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
		xchg	bx,bx
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		cld				; Clear direction
		mov	di,8
loc_2435:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_2436		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		jne	loc_2436		; Jump if not equal
		jmp	loc_2466		; (E5A3)
loc_2436:
		mov	al,es:[di+4]
		test	al,40h			; '@'
		jnz	loc_2437		; Jump if not zero
		jmp	loc_2464		; (E58B)
loc_2437:
		test	byte ptr es:[di+5],0Fh
		jnz	loc_2438		; Jump if not zero
		jmp	loc_2464		; (E58B)
loc_2438:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	bx,es:[di]
		mov	ax,es:[di+2]
		call	sub_170			; (E818)
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
		mov	ax,es:[di+2]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	al,es:[di+4]
		cmp	al,5Fh			; '_'
		jne	loc_2439		; Jump if not equal
		jmp	short loc_2441		; (E3AD)
loc_2439:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,0Ch
		jae	loc_2440		; Jump if above or =
		mov	bp,27EAh
		add	bp,0Bh
loc_2440:
		inc	bp
		mov	si,3144h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,es:[di+5]
		mov	cl,4
		ror	al,cl			; Rotate
		and	ax,3
		shl	ax,1			; Shift w/zeros fill
		mov	bx,0AE95h
		add	bx,ax
		mov	bx,cs:[bx]
		jmp	bx			;*
		db	6Ah
		scasw				; Scan es:[di] for ax
		db	60h
		scasw				; Scan es:[di] for ax
		push	si
		scasw				; Scan es:[di] for ax
		dec	sp
		scasw				; Scan es:[di] for ax
loc_2441:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,0Ch
		jae	loc_2442		; Jump if above or =
		mov	bp,27EAh
		add	bp,0Bh
loc_2442:
		inc	bp
		mov	si,3148h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	al,es:[di+9]
		mov	si,461Dh
loc_2443:
		cmp	byte ptr [si],0FFh
		je	loc_2446		; Jump if equal
		cmp	al,[si]
		je	loc_2444		; Jump if equal
		add	si,5
		jmp	short loc_2443		; (E3CD)
loc_2444:
		push	si
		mov	si,[si+3]
		cmp	si,0
		je	loc_2445		; Jump if equal
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2445:
		pop	si
		mov	bx,[si+1]
		jmp	bx			;*Register jump
loc_2446:
		mov	si,316Eh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		jmp	loc_2458		; (E524)
		jmp	loc_2458		; (E524)
		jmp	loc_2464		; (E58B)
		cmp	word ptr es:[di+0Ah],0FFFFh
		jne	loc_2447		; Jump if not equal
		jmp	loc_2458		; (E524)
loc_2447:
		inc	bp
		mov	bx,es:[di+0Ah]
		call	sub_171			; (E86C)
		jmp	loc_2458		; (E524)
		inc	bp
		mov	bx,es:[di+0Ah]
		mov	ax,es:[di+0Ch]
;*		call	far ptr sub_186		;*(1548:0218)
		db	 9Ah, 18h, 02h, 48h, 15h
		jmp	loc_2458		; (E524)
		mov	ax,es:[di+0Ch]
		mov	bx,es:[di+0Ah]
		inc	bp
		call	sub_170			; (E818)
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
		mov	ax,es:[di+0Ch]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		inc	bp
		mov	al,es:[di+0Eh]
		xor	ah,ah			; Zero register
;*		call	far ptr sub_184		;*(1548:0184)
		db	 9Ah, 84h, 01h, 48h, 15h
		jmp	loc_2458		; (E524)
		mov	ax,es:[di+0Ah]
;*		call	far ptr sub_184		;*(1548:0184)
		db	 9Ah, 84h, 01h, 48h, 15h
		jmp	loc_2458		; (E524)
		mov	si,317Fh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		jmp	short loc_2454		; (E4CC)
		mov	si,3185h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		jmp	short loc_2454		; (E4CC)
		mov	si,3192h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		jmp	short loc_2454		; (E4CC)
		jmp	short loc_2454		; (E4CC)
		inc	bp
		mov	dx,es:[di+0Ah]
		mov	cx,10h
		mov	al,41h			; 'A'
  
locloop_2448:
		mov	bl,al
		rcl	word ptr es:[di+0Ah],1	; Rotate thru carry
		jnc	loc_2449		; Jump if carry=0
		mov	ds:[bp],bl
		inc	bp
loc_2449:
		add	bl,20h			; ' '
		rcl	word ptr es:[di+0Dh],1	; Rotate thru carry
		jc	loc_2450		; Jump if carry Set
		mov	ds:[bp],bl
		inc	bp
loc_2450:
		inc	al
		loop	locloop_2448		; Loop if cx > 0
  
		mov	cx,6
		mov	al,55h			; 'U'
  
locloop_2451:
		mov	bl,al
		rcl	byte ptr es:[di+0Ch],1	; Rotate thru carry
		jnc	loc_2452		; Jump if carry=0
		mov	ds:[bp],bl
		inc	bp
loc_2452:
		add	bl,20h			; ' '
		rcl	byte ptr es:[di+0Fh],1	; Rotate thru carry
		jc	loc_2453		; Jump if carry Set
		mov	ds:[bp],bl
		inc	bp
loc_2453:
		inc	al
		loop	locloop_2451		; Loop if cx > 0
  
		jmp	loc_2462		; (E55E)
loc_2454:
		mov	al,es:[di+5]
		and	al,3
		cmp	al,3
		je	loc_2455		; Jump if equal
		cmp	al,2
		jne	loc_2455		; Jump if not equal
		mov	al,es:[di+6]
		or	al,al			; Zero ?
		jz	loc_2455		; Jump if zero
		mov	si,31A5h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
;*		call	far ptr sub_181		;*(1548:0078)
		db	 9Ah, 78h, 00h, 48h, 15h
loc_2455:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,1Fh
		jae	loc_2456		; Jump if above or =
		mov	bp,27EAh
		add	bp,1Eh
loc_2456:
		inc	bp
		mov	al,es:[di+5]
		test	al,2
		jz	loc_2457		; Jump if zero
		mov	cx,7
		call	sub_81			; (71AC)
		jmp	short loc_2458		; (E524)
loc_2457:
		mov	bp,282Ah
		mov	word ptr ds:[bp],203Bh
		add	bp,2
		mov	cx,7
		call	sub_81			; (71AC)
		jmp	short loc_2462		; (E55E)
loc_2458:
		mov	al,es:[di+5]
		and	al,3
		cmp	al,3
		je	loc_2459		; Jump if equal
		jmp	short loc_2462		; (E55E)
loc_2459:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,2Fh
		jae	loc_2460		; Jump if above or =
		mov	bp,27EAh
		add	bp,2Eh
loc_2460:
		inc	bp
		lea	si,[di+16h]		; Load effective addr
		xor	ch,ch			; Zero register
		mov	cl,es:[di+6]
		sub	cl,16h
		cmp	cx,40h
		jbe	locloop_2461		; Jump if below or =
		mov	cx,40h
  
locloop_2461:
		lods byte ptr es:[si]		; String [si] to al
		mov	ds:[bp],al
		inc	bp
		loop	locloop_2461		; Loop if cx > 0
  
loc_2462:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	di
		mov	dx,27CAh
		call	sub_53			; (6418)
		pop	di
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2463		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2463		; Jump if equal
		call	sub_115			; (83A4)
loc_2463:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2464:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2465		; Jump if not zero
		mov	al,es:[di+6]
loc_2465:
		add	di,ax
		jmp	loc_2435		; (E327)
loc_2466:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2467		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2467		; Jump if equal
		call	sub_115			; (83A4)
loc_2467:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2468		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2468		; Jump if equal
		call	sub_115			; (83A4)
loc_2468:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
		xchg	bx,bx
data_675	db	90h
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	bp
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	ds
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		cld				; Clear direction
		mov	di,8
loc_2469:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_2470		; Jump if not equal
		cmp	word ptr es:[di+2],0FFFFh
		jne	loc_2470		; Jump if not equal
		jmp	loc_2496		; (E7CF)
loc_2470:
		test	byte ptr es:[di+5],80h
		jnz	loc_2471		; Jump if not zero
		mov	al,es:[di+4]
		test	al,40h			; '@'
		jnz	loc_2472		; Jump if not zero
loc_2471:
		jmp	loc_2494		; (E7B5)
loc_2472:
		call	sub_91			; (7C34)
		mov	bp,27EAh
		mov	bx,es:[di]
		mov	ax,es:[di+2]
		call	sub_170			; (E818)
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
		mov	ax,es:[di+2]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],20h	; ' '
		inc	bp
		mov	al,es:[di+4]
		and	al,3Fh			; '?'
		mov	si,46E5h
loc_2473:
		cmp	byte ptr [si],0FFh
		je	loc_2476		; Jump if equal
		cmp	al,[si]
		je	loc_2474		; Jump if equal
		add	si,5
		jmp	short loc_2473		; (E653)
loc_2474:
		push	si
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,0Ch
		jae	loc_2475		; Jump if above or =
		mov	bp,27EAh
		add	bp,0Bh
loc_2475:
		inc	bp
		mov	si,[si+3]
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	cx,es:[di+8]
		mov	bx,[si+1]
		jmp	bx			;*Register jump
loc_2476:
		mov	si,316Eh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		jmp	loc_2488		; (E74D)
		cmp	cx,1
		ja	loc_2477		; Jump if above
		xor	cx,cx			; Zero register
loc_2477:
		jmp	short loc_2480		; (E6B1)
		cmp	cx,2
		ja	loc_2478		; Jump if above
		xor	cx,cx			; Zero register
loc_2478:
		shr	cx,1			; Shift w/zeros fill
		jmp	short loc_2480		; (E6B1)
		cmp	cx,4
		ja	loc_2479		; Jump if above
		xor	cx,cx			; Zero register
loc_2479:
		shr	cx,1			; Shift w/zeros fill
		shr	cx,1			; Shift w/zeros fill
		jmp	short loc_2480		; (E6B1)
loc_2480:
		mov	ax,es:[di+6]
		test	ax,8000h
		jz	loc_2481		; Jump if zero
		mov	si,3275h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2481:
		test	ax,4000h
		jz	loc_2482		; Jump if zero
		mov	si,318Ch
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2482:
		test	ax,2000h
		jz	loc_2483		; Jump if zero
		mov	si,326Dh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
loc_2483:
		mov	al,es:[di+5]
		and	al,3
		cmp	al,3
		je	loc_2484		; Jump if equal
		cmp	al,2
		jne	loc_2484		; Jump if not equal
		mov	ax,es:[di+6]
		and	ax,3FFh
		or	ax,ax			; Zero ?
		jz	loc_2484		; Jump if zero
		mov	si,31A5h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
;*		call	far ptr sub_184		;*(1548:0184)
		db	 9Ah, 84h, 01h, 48h, 15h
loc_2484:
		or	cx,cx			; Zero ?
		jz	loc_2485		; Jump if zero
		mov	si,32ADh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		inc	bp
		mov	ax,cx
;*		call	far ptr sub_184		;*(1548:0184)
		db	 9Ah, 84h, 01h, 48h, 15h
		jmp	short loc_2485		; (E718)
loc_2485:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,1Fh
		jae	loc_2486		; Jump if above or =
		mov	bp,27EAh
		add	bp,1Eh
loc_2486:
		inc	bp
		mov	al,es:[di+5]
		test	al,2
		jz	loc_2487		; Jump if zero
		mov	cx,0Ah
		call	sub_81			; (71AC)
		jmp	short loc_2488		; (E74D)
loc_2487:
		mov	bp,282Ah
		mov	word ptr ds:[bp],203Bh
		add	bp,2
		mov	cx,0Ah
		call	sub_81			; (71AC)
		jmp	short loc_2492		; (E788)
loc_2488:
		mov	al,es:[di+5]
		and	al,3
		cmp	al,3
		je	loc_2489		; Jump if equal
		jmp	short loc_2492		; (E788)
loc_2489:
		mov	ax,bp
		sub	ax,27EAh
		cmp	ax,2Fh
		jae	loc_2490		; Jump if above or =
		mov	bp,27EAh
		add	bp,2Eh
loc_2490:
		inc	bp
		lea	si,[di+19h]		; Load effective addr
		mov	cx,es:[di+6]
		xor	ch,ch			; Zero register
		sub	cl,19h
		cmp	cx,40h
		jbe	locloop_2491		; Jump if below or =
		mov	cx,40h
		cld				; Clear direction
  
locloop_2491:
		lods byte ptr es:[si]		; String [si] to al
		mov	ds:[bp],al
		inc	bp
		loop	locloop_2491		; Loop if cx > 0
  
loc_2492:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	di
		mov	dx,27CAh
		call	sub_53			; (6418)
		pop	di
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2493		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2493		; Jump if equal
		call	sub_115			; (83A4)
loc_2493:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2494:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2495		; Jump if not zero
		mov	ax,es:[di+6]
		xor	ah,ah			; Zero register
loc_2495:
		add	di,ax
		jmp	loc_2469		; (E603)
loc_2496:
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2497		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2497		; Jump if equal
		call	sub_115			; (83A4)
loc_2497:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	ds,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2498		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2498		; Jump if equal
		call	sub_115			; (83A4)
loc_2498:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	bp
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
		xchg	bx,bx
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_170		proc	near
		push	ax
		push	bx
		push	cx
		push	si
		mov	cx,cs
		cmp	bx,cx
		jb	loc_2499		; Jump if below
		add	cx,word ptr ds:[263Fh]	; (94E8:263F=8005h)
		cmp	bx,cx
		ja	loc_2499		; Jump if above
		call	sub_96			; (7D28)
		cmp	ax,0
		je	loc_2499		; Jump if equal
		mov	si,30A1h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		xor	bx,bx			; Zero register
		mov	bl,al
		sub	bl,41h			; 'A'
		mov	al,byte ptr ds:[33FDh][bx]	; (94E8:33FD=0)
		mov	ds:[bp],al
		inc	bp
		cmp	ah,20h			; ' '
		je	loc_2500		; Jump if equal
		mov	bl,ah
		sub	bl,41h			; 'A'
		mov	al,byte ptr ds:[33FDh][bx]	; (94E8:33FD=0)
		mov	ds:[bp],al
		inc	bp
		jmp	short loc_2500		; (E866)
loc_2499:
		mov	ax,bx
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
loc_2500:
		pop	si
		pop	cx
		pop	bx
		pop	ax
		retn
sub_170		endp
  
		nop
  
;ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ
;			       SUBROUTINE
;ЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ
  
sub_171		proc	near
		mov	byte ptr cs:[4814h],1	; (020C:4814=57h)
		call	sub_170			; (E818)
		mov	byte ptr cs:[4814h],0	; (020C:4814=57h)
		retn
sub_171		endp
  
		mov	di,8
		mov	dl,cl
loc_2501:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_2502		; Jump if not equal
		jmp	loc_2511		; (E95B)
loc_2502:
		test	byte ptr es:[di+5],10h
		jnz	loc_2504		; Jump if not zero
		test	byte ptr es:[di+5],30h	; '0'
		jz	loc_2503		; Jump if zero
		test	byte ptr es:[di+5],2
		jnz	loc_2504		; Jump if not zero
loc_2503:
		jmp	loc_2509		; (E943)
loc_2504:
		or	dl,dl			; Zero ?
		jnz	loc_2506		; Jump if not zero
		mov	dl,1
		push	dx
		mov	ax,data_369		; (020C:2DBA=5C53h)
		xor	dx,dx			; Zero register
		mov	bl,data_382		; (020C:2EBF=6Fh)
		cmp	bl,0
		je	loc_2505		; Jump if equal
		xor	bh,bh			; Zero register
		div	bx			; ax,dx rem=dx:ax/reg
		sub	bx,dx
		add	data_369,bx		; (020C:2DBA=5C53h)
loc_2505:
		pop	dx
		mov	al,23h			; '#'
		call	sub_52			; (6380)
loc_2506:
		push	di
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_109			; (80CE)
		mov	di,557Ch
		mov	cx,0Fh
		mov	al,20h			; ' '
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2507		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2507		; Jump if equal
		call	sub_115			; (83A4)
loc_2507:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		pop	di
		mov	bp,5569h
		mov	ax,es:[di]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],3Ah	; ':'
		inc	bp
		mov	ax,es:[di+2]
;*		call	far ptr sub_180		;*(1548:0068)
		db	 9Ah, 68h, 00h, 48h, 15h
		mov	bp,5575h
		mov	al,es:[di+5]
		and	al,30h			; '0'
		mov	si,3132h
		cmp	al,30h			; '0'
		je	loc_2508		; Jump if equal
		mov	si,313Bh
		cmp	al,10h
		je	loc_2508		; Jump if equal
		mov	si,3136h
loc_2508:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	bp,557Ch
		mov	cx,7
		call	sub_81			; (71AC)
		mov	al,24h			; '$'
		call	sub_52			; (6380)
loc_2509:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2510		; Jump if not zero
		mov	al,es:[di+6]
loc_2510:
		add	di,ax
		jmp	loc_2501		; (E881)
loc_2511:
		mov	cl,dl
		retn
		xchg	bx,bx
		test	data_170,2		; (020C:152A=0)
		jnz	loc_2512		; Jump if not zero
		retn
loc_2512:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	ax,data_481		; (020C:42CE=1689h)
		push	ax
		and	data_481,0FFF7h		; (020C:42CE=1689h)
		xor	bx,bx			; Zero register
		mov	al,4Ah			; 'J'
		call	sub_52			; (6380)
		call	sub_91			; (7C34)
		mov	bp,27EAh
		add	bp,8
		call	sub_108			; (80CB)
		mov	si,1242h
loc_2513:
		test	byte ptr es:[si+2],4
		jz	loc_2516		; Jump if zero
		push	si
		mov	si,3450h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	ax,es:[si]
		push	bp
		push	bx
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		pop	bx
		pop	bp
		add	bp,6
		mov	word ptr ds:[bp],203Ah
		inc	bp
		inc	bp
		mov	cx,12h
		lea	di,[si+4]		; Load effective addr
  
locloop_2514:
		mov	al,es:[di]
		sub	al,2Bh			; '+'
		mov	ds:[bp],al
		inc	di
		inc	bp
		loop	locloop_2514		; Loop if cx > 0
  
		mov	dx,27CAh
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_53			; (6418)
		inc	bx
		call	sub_91			; (7C34)
		mov	bp,27EAh
		add	bp,8
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2515		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2515		; Jump if equal
		call	sub_115			; (83A4)
loc_2515:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2516:
		add	si,16h
		cmp	word ptr es:[si],0FFFFh
		je	loc_2517		; Jump if equal
		jmp	short loc_2513		; (E98D)
loc_2517:
		cmp	word ptr ds:[47DBh],0	; (94E8:47DB=0EB47h)
		je	loc_2518		; Jump if equal
		call	sub_91			; (7C34)
		mov	bp,27EAh
		add	bp,8
		mov	ax,word ptr ds:[47DBh]	; (94E8:47DB=0EB47h)
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		inc	bp
		mov	si,3461h
		jmp	short loc_2519		; (EA2E)
loc_2518:
		cmp	bx,0
		jne	loc_2521		; Jump if not equal
		mov	si,3429h
loc_2519:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_53			; (6418)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2520		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2520		; Jump if equal
		call	sub_115			; (83A4)
loc_2520:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2521:
		pop	ax
		mov	word ptr ds:[42CEh],ax	; (94E8:42CE=0F78Bh)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2522		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2522		; Jump if equal
		call	sub_115			; (83A4)
loc_2522:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
		xchg	bx,bx
		test	data_170,2		; (020C:152A=0)
		jnz	loc_2523		; Jump if not zero
		retn
loc_2523:
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		mov	ax,data_481		; (020C:42CE=1689h)
		push	ax
		and	data_481,0FFF7h		; (020C:42CE=1689h)
		xor	bx,bx			; Zero register
		mov	al,4Bh			; 'K'
		call	sub_52			; (6380)
		call	sub_91			; (7C34)
		mov	bp,27EAh
		add	bp,8
		call	sub_108			; (80CB)
		mov	si,3E04h
loc_2524:
		test	byte ptr es:[si+2],1
		jz	loc_2527		; Jump if zero
		push	si
		mov	si,3456h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	al,es:[si]
		push	bp
		push	bx
		xor	ah,ah			; Zero register
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		pop	bx
		pop	bp
		add	bp,4
		mov	word ptr ds:[bp],203Ah
		inc	bp
		inc	bp
		mov	cx,1Eh
		lea	di,[si+7]		; Load effective addr
  
locloop_2525:
		mov	al,es:[di]
		sub	al,27h			; '''
		mov	ds:[bp],al
		inc	di
		inc	bp
		loop	locloop_2525		; Loop if cx > 0
  
		mov	dx,27CAh
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		push	bx
		call	sub_53			; (6418)
		pop	bx
		inc	bx
		call	sub_91			; (7C34)
		mov	bp,27EAh
		add	bp,8
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2526		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2526		; Jump if equal
		call	sub_115			; (83A4)
loc_2526:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2527:
		add	si,25h
		cmp	byte ptr es:[si],0FFh
		je	loc_2528		; Jump if equal
		jmp	short loc_2524		; (EAB1)
loc_2528:
		cmp	word ptr ds:[47D9h],0	; (94E8:47D9=374h)
		je	loc_2529		; Jump if equal
		call	sub_91			; (7C34)
		mov	bp,27EAh
		add	bp,8
data_678	dw	0D9A1h			; Data table (indexed access)
		inc	di
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		inc	bp
		mov	si,348Ch
		jmp	short loc_2530		; (EB56)
loc_2529:
		cmp	bx,0
		jne	loc_2532		; Jump if not equal
		mov	si,343Ch
loc_2530:
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	dx,27CAh
		push	word ptr cs:[4863h]	; (020C:4863=7480h)
		push	es
		call	sub_53			; (6418)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2531		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2531		; Jump if equal
		call	sub_115			; (83A4)
loc_2531:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
loc_2532:
		pop	ax
		mov	word ptr ds:[42CEh],ax	; (94E8:42CE=0F78Bh)
		mov	word ptr cs:[92h],dx	; (020C:0092=4D00h)
		pop	dx
		mov	es,dx
		cmp	dx,word ptr cs:[4861h]	; (020C:4861=0A80Ch)
		pop	dx
		jnz	loc_2533		; Jump if not zero
		cmp	dx,word ptr cs:[4863h]	; (020C:4863=7480h)
		je	loc_2533		; Jump if equal
		call	sub_115			; (83A4)
loc_2533:
		mov	dx,word ptr cs:[92h]	; (020C:0092=4D00h)
		retn
		add	[bx+si],al
		add	[bx+si],al
		add	[bx+si],al
loc_2534:
		mov	data_232,10h		; (020C:263B=0B23Eh)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	bl,byte ptr ds:[2A2Dh]	; (020C:2A2D=0ADh)
		dec	bl
		mov	dx,0FFFFh
		mov	si,0
		call	sub_106			; (80C5)
loc_2535:
		cmp	si,28F3h
		jae	loc_2536		; Jump if above or =
		mov	ax,es:[si]
		cmp	ax,0FFFFh
		jne	loc_2537		; Jump if not equal
loc_2536:
		jmp	short loc_2546		; (EC2A)
loc_2537:
		mov	di,28F3h
		xor	cl,cl			; Zero register
loc_2538:
		cmp	word ptr es:[di],0FFFFh
		je	loc_2539		; Jump if equal
		cmp	ax,es:[di]
		je	loc_2541		; Jump if equal
		add	di,2
		inc	cl
		cmp	cl,0FAh
		jb	loc_2538		; Jump if below
loc_2539:
		cmp	ax,dx
		je	loc_2540		; Jump if equal
		inc	bl
loc_2540:
		mov	cl,bl
loc_2541:
		mov	byte ptr ds:[2A31h],cl	; (020C:2A31=0A1h)
		cmp	cl,19h
		ja	loc_2542		; Jump if above
		add	cl,41h			; 'A'
		mov	ch,20h			; ' '
		jmp	short loc_2545		; (EC1F)
loc_2542:
		mov	ch,41h			; 'A'
loc_2543:
		sub	cl,1Ah
		cmp	cl,19h
		jbe	loc_2544		; Jump if below or =
		inc	ch
		jmp	short loc_2543		; (EC0E)
loc_2544:
		add	cl,41h			; 'A'
		xchg	cl,ch
loc_2545:
		mov	es:[si+0Ch],cx
		mov	dx,ax
		add	si,15h
		jmp	short loc_2535		; (EBCA)
loc_2546:
		mov	si,0
loc_2547:
		mov	di,0
		cmp	word ptr es:[si],0FFFFh
		jne	loc_2548		; Jump if not equal
		jmp	loc_2561		; (ED2B)
loc_2548:
		test	byte ptr es:[si+0Bh],1
		jnz	loc_2550		; Jump if not zero
loc_2549:
		add	si,15h
		jmp	short loc_2547		; (EC2D)
loc_2550:
		mov	ax,es:[si]
		mov	bx,es:[si+2]
		mov	cx,es:[si+4]
loc_2551:
		test	byte ptr es:[di+0Bh],1
		jz	loc_2554		; Jump if zero
loc_2552:
		add	di,15h
loc_2553:
		cmp	word ptr es:[di],0FFFFh
		jne	loc_2551		; Jump if not equal
		jmp	short loc_2549		; (EC40)
loc_2554:
		cmp	ax,es:[di]
		jne	loc_2552		; Jump if not equal
		cmp	cx,es:[di+2]
		jb	loc_2552		; Jump if below
		cmp	bx,es:[di+4]
		ja	loc_2552		; Jump if above
		cmp	bx,es:[di+2]
		jbe	loc_2555		; Jump if below or =
		cmp	cx,es:[di+4]
		jb	loc_2558		; Jump if below
		mov	dx,bx
		dec	dx
		cmp	dx,es:[di+2]
		je	loc_2557		; Jump if equal
		mov	es:[di+4],dx
		jmp	short loc_2552		; (EC57)
loc_2555:
		cmp	cx,es:[di+4]
		jae	loc_2557		; Jump if above or =
loc_2556:
		mov	dx,cx
		inc	dx
		cmp	dx,es:[di+4]
		je	loc_2557		; Jump if equal
		mov	es:[di+2],dx
		jmp	short loc_2552		; (EC57)
loc_2557:
		push	es
		pop	ds
		push	si
		push	di
		mov	si,di
		add	si,15h
		mov	cx,28F3h
		sub	cx,si
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		pop	di
		pop	si
		call	sub_104			; (80B9)
		dec	byte ptr ds:[2A2Bh]	; (020C:2A2B=0A5h)
		jmp	short loc_2553		; (EC5A)
loc_2558:
		mov	dx,bx
		dec	dx
		cmp	dx,es:[di+2]
		je	loc_2556		; Jump if equal
		xchg	dx,es:[di+4]
		cmp	byte ptr ds:[2A2Bh],0FAh	; (020C:2A2B=0A5h)
		jae	loc_2560		; Jump if above or =
		push	si
		push	bx
		push	ax
		mov	ax,15h
		mov	bl,byte ptr ds:[2A2Bh]	; (020C:2A2B=0A5h)
		mul	bl			; ax = reg * al
		add	ax,0
		mov	si,ax
		mov	bx,cx
		inc	bx
		cmp	bx,dx
		je	loc_2559		; Jump if equal
		mov	es:[si+2],bx
		pop	ax
		mov	es:[si],ax
		mov	es:[si+4],dx
		mov	dx,es:[di+6]
		mov	es:[si+6],dx
		mov	dx,es:[di+8]
		mov	es:[si+8],dx
		mov	dx,es:[di+0Ah]
		mov	es:[si+0Ah],dx
		mov	dx,es:[di+0Ch]
		mov	es:[si+0Ch],dx
		mov	dl,es:[di+0Eh]
		and	dl,0FEh
		mov	es:[si+0Eh],dl
		inc	byte ptr ds:[2A2Bh]	; (020C:2A2B=0A5h)
loc_2559:
		pop	bx
		pop	si
loc_2560:
		jmp	loc_2552		; (EC57)
loc_2561:
;*		call	sub_31			;*(2C50)
		db	0E8h, 22h, 3Fh
		test	data_372,4		; (020C:2EB1=0)
		jz	loc_2563		; Jump if zero
;*		call	far ptr sub_194		;*(1548:0470)
		db	 9Ah, 70h, 04h, 48h, 15h
		mov	data_381,0		; (020C:2EBD=3Dh)
		call	sub_167			; (DB90)
		mov	bx,data_433		; (020C:37EA=0C9E8h)
		call	sub_130			; (A8A0)
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		jne	loc_2562		; Jump if not equal
		mov	bx,word ptr ds:[37EAh]	; (94E8:37EA=7400h)
		call	sub_130			; (A8A0)
loc_2562:
;*		jmp	loc_178			;*(1F92)
		db	0E9h, 38h, 32h
loc_2563:
		cmp	byte ptr ds:[2C40h],2	; (94E8:2C40=0)
		je	loc_2564		; Jump if equal
		jmp	loc_2570		; (EE14)
loc_2564:
		cmp	byte ptr ds:[3BE9h],1	; (94E8:3BE9=0)
		je	loc_2565		; Jump if equal
		jmp	loc_2576		; (EE88)
loc_2565:
		mov	bx,word ptr ds:[2A20h]	; (94E8:2A20=0AAC0h)
		mov	ax,110h
		mov	dx,2
		call	sub_84			; (7498)
		jnc	loc_2566		; Jump if carry=0
		jmp	loc_2576		; (EE88)
loc_2566:
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],42h	; 'B'
		mov	byte ptr [di+5],0Ah
		mov	ds,bx
		mov	ax,word ptr ds:[118h]	; (AAC0:0118=0)
		mov	cl,4
		shl	ax,cl			; Shift w/zeros fill
		call	sub_104			; (80B9)
		mov	[di+8],ax
		mov	word ptr [di+6],0
		mov	ax,0Ah
		mov	si,330Ah
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
		mov	es,word ptr ds:[2A20h]	; (AAC0:2A20=0)
		mov	ax,word ptr es:[124h]	; (0000:0124=0FF53h)
		add	ax,110h
		mov	bx,word ptr es:[118h]	; (0000:0118=6320h)
		mov	cl,4
		shl	bx,cl			; Shift w/zeros fill
		add	ax,bx
		mov	bx,word ptr es:[126h]	; (0000:0126=0F000h)
		test	bx,0F000h
		jz	loc_2567		; Jump if zero
		jmp	loc_2576		; (EE88)
loc_2567:
		mov	cl,4
		shl	bx,cl			; Shift w/zeros fill
		add	ax,bx
		jnc	loc_2568		; Jump if carry=0
		jmp	loc_2576		; (EE88)
loc_2568:
		mov	bx,word ptr ds:[2A20h]	; (AAC0:2A20=0)
		mov	dx,1
		call	sub_84			; (7498)
		jnc	loc_2569		; Jump if carry=0
		jmp	loc_2576		; (EE88)
loc_2569:
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],40h	; '@'
		mov	byte ptr [di+5],32h	; '2'
		mov	byte ptr [di+6],0
		mov	ax,7
		mov	si,331Dh
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
		jmp	short loc_2576		; (EE88)
loc_2570:
		cmp	byte ptr ds:[2C40h],3	; (A80C:2C40=0)
		je	loc_2573		; Jump if equal
		cmp	byte ptr ds:[1422h],0	; (A80C:1422=0)
		jne	loc_2573		; Jump if not equal
		cmp	byte ptr ds:[2C40h],4	; (A80C:2C40=0)
		je	loc_2571		; Jump if equal
		cmp	byte ptr ds:[2C40h],6	; (A80C:2C40=0)
		je	loc_2571		; Jump if equal
		cmp	byte ptr ds:[2C40h],5	; (A80C:2C40=0)
		je	loc_2572		; Jump if equal
		jmp	loc_2593		; (F10B)
loc_2571:
		jmp	short loc_2576		; (EE88)
loc_2572:
		jmp	loc_2580		; (EEED)
loc_2573:
		mov	bx,word ptr ds:[2A37h]	; (A80C:2A37=0)
		mov	ax,word ptr ds:[2A39h]	; (A80C:2A39=0)
		cmp	ax,bx
		jne	loc_2574		; Jump if not equal
		cmp	ax,0FFFFh
		jne	loc_2574		; Jump if not equal
		jmp	loc_2593		; (F10B)
loc_2574:
		push	ax
		mov	dx,1
		call	sub_84			; (7498)
		pop	ax
		jc	loc_2575		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],40h	; '@'
		mov	byte ptr [di+5],32h	; '2'
		mov	byte ptr [di+6],0
		mov	ax,7
		mov	si,3316h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
loc_2575:
		cmp	byte ptr ds:[1422h],0	; (A80C:1422=0)
		jne	loc_2580		; Jump if not equal
		jmp	loc_2593		; (F10B)
loc_2576:
		mov	dx,16h
		mov	bx,word ptr ds:[2A20h]	; (A80C:2A20=0)
		call	sub_106			; (80C5)
		cmp	bx,word ptr es:[0]	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		je	loc_2577		; Jump if equal
		add	bx,10h
		cmp	bx,word ptr es:[0]	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		je	loc_2577		; Jump if equal
		sub	bx,20h
		cmp	bx,word ptr es:[0]	; (A80C:0000=0)
		nop				;*ASM fixup - sign extn byte
		jne	loc_2579		; Jump if not equal
loc_2577:
		xor	ax,ax			; Zero register
		cmp	byte ptr ds:[2C40h],2	; (A80C:2C40=0)
		jne	loc_2578		; Jump if not equal
		mov	ax,100h
loc_2578:
		mov	dx,1
		call	sub_84			; (7498)
		jc	loc_2579		; Jump if carry Set
		cmp	byte ptr ds:[3BD9h],1	; (A80C:3BD9=0)
		je	loc_2579		; Jump if equal
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],40h	; '@'
		mov	byte ptr [di+5],32h	; '2'
		mov	byte ptr [di+6],0
		mov	ax,7
		mov	si,3316h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
loc_2579:
		jmp	loc_2593		; (F10B)
loc_2580:
		mov	word ptr ds:[4D8Fh],2020h	; (A80C:4D8F=0)
		mov	word ptr ds:[4D91h],2020h	; (A80C:4D91=0)
		mov	byte ptr ds:[4D93h],20h	; (A80C:4D93=0) ' '
		mov	byte ptr ds:[47D6h],31h	; (A80C:47D6=0) '1'
		mov	word ptr ds:[47D7h],0	; (A80C:47D7=0)
loc_2581:
		mov	ax,word ptr ds:[2A20h]	; (A80C:2A20=0)
		mov	si,word ptr ds:[47D7h]	; (A80C:47D7=0)
		mov	bx,ax
		mov	es,ax
		mov	ax,es:[si+6]
		mov	dx,1
		call	sub_84			; (7498)
		jc	loc_2582		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],40h	; '@'
		mov	byte ptr [di+5],32h	; '2'
		mov	byte ptr [di+6],0
		mov	ax,7
		push	si
		mov	si,3329h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		mov	ah,byte ptr ds:[47D6h]	; (A80C:47D6=0)
		mov	al,5Fh			; '_'
		mov	[si-3],ax
		pop	si
		call	sub_124			; (9120)
loc_2582:
		mov	ax,word ptr ds:[2A20h]	; (A80C:2A20=0)
		mov	bx,ax
		mov	es,ax
		mov	ax,es:[si+8]
		mov	dx,1
		call	sub_84			; (7498)
		jc	loc_2583		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],40h	; '@'
		mov	byte ptr [di+5],32h	; '2'
		mov	byte ptr [di+6],0
		mov	ax,7
		push	si
		mov	si,3335h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		mov	ah,byte ptr ds:[47D6h]	; (A80C:47D6=0)
		mov	al,5Fh			; '_'
		mov	[si-3],ax
		pop	si
		call	sub_124			; (9120)
loc_2583:
		mov	bx,word ptr ds:[2A20h]	; (A80C:2A20=0)
		mov	ax,si
		mov	dx,2
		call	sub_84			; (7498)
		jc	loc_2586		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],44h	; 'D'
		mov	word ptr [di+5],6
data_682	db	0C7h
data_683	db	45h
		or	[si],al
		add	bh,al
		inc	bp
		push	es
		add	[bx+si],al
		mov	ax,0Ah
		push	si
		mov	si,3341h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		mov	ah,byte ptr ds:[47D6h]	; (A80C:47D6=0)
		mov	al,5Fh			; '_'
		mov	[si-3],ax
		pop	si
		mov	es,word ptr ds:[2A20h]	; (A80C:2A20=0)
		cmp	word ptr es:[si],0FFFFh
		jne	loc_2584		; Jump if not equal
		cmp	word ptr es:[si+2],0FFFFh
		je	loc_2585		; Jump if equal
loc_2584:
		mov	byte ptr [di+4],54h	; 'T'
		mov	word ptr [di+8],2
loc_2585:
		call	sub_124			; (9120)
loc_2586:
		mov	ax,si
		add	ax,4
		mov	dx,2
		call	sub_84			; (7498)
		jc	loc_2587		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],42h	; 'B'
		mov	word ptr [di+5],6
		mov	word ptr [di+8],2
		mov	word ptr [di+6],0
		mov	ax,0Ah
		push	si
		mov	si,334Bh
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		mov	ah,byte ptr ds:[47D6h]	; (A80C:47D6=0)
		mov	al,5Fh			; '_'
		mov	[si-3],ax
		pop	si
		call	sub_124			; (9120)
loc_2587:
		mov	ax,si
		add	ax,6
		mov	dx,2
		call	sub_84			; (7498)
		jc	loc_2588		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	byte ptr [di+4],52h	; 'R'
		mov	word ptr [di+5],6
		mov	word ptr [di+8],4
		mov	word ptr [di+6],0
		mov	ax,0Ah
		push	si
		mov	si,3359h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		mov	ah,byte ptr ds:[47D6h]	; (A80C:47D6=0)
		mov	al,5Fh			; '_'
		mov	[si-3],ax
		pop	si
		call	sub_124			; (9120)
loc_2588:
		mov	ax,si
		add	ax,0Ah
		mov	dx,2
		call	sub_84			; (7498)
		jnc	loc_2589		; Jump if carry=0
		jmp	short loc_2591		; (F0E1)
loc_2589:
		mov	di,472Bh
		mov	[di],bx
		mov	[di+2],ax
		mov	word ptr [di+5],6
		mov	word ptr [di+6],0
		mov	word ptr [di+8],1
		push	es
		mov	ax,bx
		mov	es,ax
		mov	ax,es:[si+4]
		pop	es
		test	ax,8000h
		jz	loc_2590		; Jump if zero
		mov	byte ptr [di+4],60h	; '`'
		mov	word ptr [di+8],8
		mov	ax,0Ah
		push	si
		mov	si,3365h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		mov	ah,byte ptr ds:[47D6h]	; (A80C:47D6=0)
		mov	al,5Fh			; '_'
		mov	[si-3],ax
		pop	si
		call	sub_124			; (9120)
		jmp	short loc_2591		; (F0E1)
loc_2590:
		mov	byte ptr [di+4],41h	; 'A'
		mov	ax,0Ah
		push	si
		mov	si,3371h
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		mov	ah,byte ptr ds:[47D6h]	; (A80C:47D6=0)
		mov	al,5Fh			; '_'
		mov	[si-3],ax
		pop	si
		call	sub_124			; (9120)
loc_2591:
		mov	es,word ptr ds:[2A20h]	; (A80C:2A20=0)
		cmp	word ptr es:[si],0FFFFh
		jne	loc_2592		; Jump if not equal
		cmp	word ptr es:[si+2],0FFFFh
		je	loc_2593		; Jump if equal
loc_2592:
		mov	es,word ptr ds:[2A20h]	; (A80C:2A20=0)
		mov	si,es:[si]
		mov	word ptr ds:[47D7h],si	; (A80C:47D7=0)
		inc	byte ptr ds:[47D6h]	; (A80C:47D6=0)
		cmp	byte ptr ds:[47D6h],35h	; (A80C:47D6=0) '5'
		ja	loc_2593		; Jump if above
		jmp	loc_2581		; (EF09)
loc_2593:
		cmp	byte ptr ds:[48DDh],0	; (A80C:48DD=0)
		jne	loc_2594		; Jump if not equal
		jmp	loc_2596		; (F1A1)
loc_2594:
		mov	bx,word ptr ds:[2A20h]	; (A80C:2A20=0)
		cmp	byte ptr ds:[2C40h],2	; (A80C:2C40=0)
		je	loc_2595		; Jump if equal
		cmp	byte ptr ds:[2C40h],3	; (A80C:2C40=0)
		jne	loc_2596		; Jump if not equal
		sub	bx,10h
loc_2595:
		mov	ax,80h
		mov	dx,2
		call	sub_84			; (7498)
		jc	loc_2596		; Jump if carry Set
		mov	di,472Bh
		mov	[di],bx
		mov	word ptr [di+2],80h
		mov	byte ptr [di+4],1
		mov	byte ptr [di+5],6
		mov	word ptr [di+8],1
		mov	word ptr [di+6],0
		mov	ax,0Ah
		mov	si,337Eh
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
		mov	ax,81h
		mov	dx,2
		call	sub_84			; (7498)
		jc	loc_2596		; Jump if carry Set
		mov	di,472Bh
		mov	word ptr [di+2],81h
		mov	ax,0Ah
		mov	si,338Ch
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
		mov	ax,82h
		mov	dx,2
		call	sub_84			; (7498)
		jc	loc_2596		; Jump if carry Set
		mov	di,472Bh
		mov	word ptr [di+2],82h
		mov	ax,0Ah
		mov	si,339Ah
;*		call	far ptr sub_210		;*(1548:1018)
		db	 9Ah, 18h, 10h, 48h, 15h
		call	sub_124			; (9120)
loc_2596:
		mov	byte ptr ds:[2638h],2	; (A80C:2638=0)
		mov	al,byte ptr ds:[263Dh]	; (A80C:263D=0)
		ror	al,1			; Rotate
		mov	byte ptr ds:[2639h],al	; (A80C:2639=0)
		mov	byte ptr ds:[2A2Ah],0	; (A80C:2A2A=0)
		mov	ax,0FFF0h
		cmp	word ptr ds:[2A4Ah],ax	; (A80C:2A4A=0)
		jbe	loc_2597		; Jump if below or =
		mov	word ptr ds:[2A4Ah],ax	; (A80C:2A4A=0)
loc_2597:
		mov	al,byte ptr ds:[2A2Ah]	; (A80C:2A2A=0)
		call	sub_106			; (80C5)
		mov	bl,15h
		mul	bl			; ax = reg * al
		add	ax,0
		mov	si,ax
		mov	ax,es:[si+0Ch]
		mov	word ptr ds:[172Fh],ax	; (A80C:172F=0)
		and	byte ptr ds:[2ECAh],0FBh	; (A80C:2ECA=0)
		test	byte ptr es:[si+0Eh],1
		jz	loc_2598		; Jump if zero
		or	byte ptr ds:[2ECAh],4	; (A80C:2ECA=0)
loc_2598:
		mov	ax,es:[si+0Fh]
		mov	cs:data_548,ax		; (020C:4877=0DB33h)
		mov	ax,es:[si+11h]
		mov	cs:data_546,ax		; (020C:4873=5590h)
		mov	ax,es:[si+13h]
		mov	cs:data_547,ax		; (020C:4875=0EB8Bh)
		mov	ah,5
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
		call	sub_106			; (80C5)
;*		call	far ptr sub_234		;*(1548:16B4)
		db	 9Ah,0B4h, 16h, 48h, 15h
		call	sub_140			; (B4AC)
		mov	byte ptr ds:[2E7Eh],0	; (A80C:2E7E=0)
		mov	byte ptr ds:[2A75h],0	; (A80C:2A75=0)
		mov	word ptr ds:[379Ah],0FFFFh	; (A80C:379A=0)
		mov	dl,0FFh
;*		call	sub_30			;*(23F0)
		db	0E8h,0CAh, 31h
		mov	ax,word ptr ds:[2A3Eh]	; (A80C:2A3E=0)
		mov	word ptr ds:[2D84h],ax	; (A80C:2D84=0)
		mov	ax,word ptr ds:[2A3Ch]	; (A80C:2A3C=0)
		mov	word ptr ds:[2D82h],ax	; (A80C:2D82=0)
		test	byte ptr ds:[2A30h],40h	; (A80C:2A30=0) '@'
		jz	loc_2599		; Jump if zero
		jmp	loc_2674		; (F81F)
loc_2599:
		mov	ah,0Bh
		int	21h			; DOS Services  ah=function 0Bh
						;  if keybd char available,al=FF
		or	al,al			; Zero ?
		jz	loc_2602		; Jump if zero
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		cmp	al,1Bh
		je	loc_2600		; Jump if equal
		or	al,20h			; ' '
		cmp	al,71h			; 'q'
		je	loc_2600		; Jump if equal
		cmp	al,6Ah			; 'j'
		je	loc_2601		; Jump if equal
		jmp	short loc_2602		; (F26A)
loc_2600:
		jmp	loc_205			; (224A)
loc_2601:
		mov	ax,word ptr ds:[2EC4h]	; (A80C:2EC4=0)
		mov	bx,word ptr ds:[2EC6h]	; (A80C:2EC6=0)
		mov	word ptr ds:[2EC6h],ax	; (A80C:2EC6=0)
		mov	word ptr ds:[2EC4h],bx	; (A80C:2EC4=0)
loc_2602:
		call	sub_67			; (6D80)
;*		call	far ptr sub_220		;*(1548:1268)
		db	 9Ah, 68h, 12h, 48h, 15h
		xor	ax,ax			; Zero register
		mov	byte ptr ds:[2F0Ah],al	; (A80C:2F0A=0)
		mov	byte ptr ds:[42B3h],al	; (A80C:42B3=0)
		mov	byte ptr ds:[2A81h],al	; (A80C:2A81=0)
		mov	byte ptr ds:[2A7Eh],0	; (A80C:2A7E=0)
		mov	al,byte ptr ds:[47B1h]	; (A80C:47B1=0)
		mov	byte ptr ds:[47B2h],al	; (A80C:47B2=0)
		call	sub_80			; (7190)
		mov	ax,word ptr ds:[2D84h]	; (3A16:2D84=0FFFFh)
		mov	bx,word ptr ds:[2D82h]	; (3A16:2D82=0FFFFh)
		mov	byte ptr ds:[4204h],1	; (3A16:4204=0Ch)
		mov	dx,1
		call	sub_84			; (7498)
		mov	byte ptr ds:[4204h],0	; (A80C:4204=0)
		jc	loc_2603		; Jump if carry Set
		jmp	loc_2612		; (F32D)
loc_2603:
		mov	cl,es:[di+4]
		and	cl,1Fh
		cmp	cl,1Fh
		jne	loc_2609		; Jump if not equal
		call	sub_123			; (8E94)
loc_2604:
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2605		; Jump if not zero
		mov	al,es:[di+6]
loc_2605:
		add	di,ax
		mov	bx,word ptr ds:[37A2h]	; (A80C:37A2=0)
		cmp	bx,es:[di]
		jne	loc_2608		; Jump if not equal
		mov	ax,word ptr ds:[37A4h]	; (A80C:37A4=0)
		cmp	ax,es:[di+2]
		jne	loc_2608		; Jump if not equal
		push	ax
		push	bx
		mov	bx,377Fh
		mov	al,es:[di+5]
		and	ax,0Fh
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2606		; Jump if not zero
		mov	al,es:[di+6]
loc_2606:
		mov	bp,ax
		pop	bx
		pop	ax
		mov	dx,0FFFFh
		cmp	bx,es:[bp+di]
		jne	loc_2607		; Jump if not equal
		mov	dx,es:[bp+di+2]
loc_2607:
		mov	word ptr ds:[4315h],dx	; (A80C:4315=0)
		jmp	short loc_2603		; (F2A7)
loc_2608:
		jmp	short loc_2612		; (F32D)
loc_2609:
		push	di
		push	es
		test	byte ptr es:[di+5],30h	; '0'
		jz	loc_2610		; Jump if zero
		mov	byte ptr ds:[2A75h],0	; (A80C:2A75=0)
		mov	dl,0FFh
;*		call	sub_30			;*(23F0)
		db	0E8h,0D3h, 30h
		jmp	short loc_2611		; (F329)
loc_2610:
		db	0F6h			; Data table (indexed access)
		inc	bp
		add	al,1Fh
		jz	loc_2611		; Jump if zero
		call	sub_121			; (8CB4)
loc_2611:
		pop	es
		pop	di
		jmp	short loc_2604		; (F2B6)
loc_2612:
		mov	word ptr ds:[263Bh],11h	; (A80C:263B=0)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		mov	bx,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	dx,2
		call	sub_84			; (7498)
		pushf				; Push flags
		cmp	byte ptr ds:[2D8Fh],1	; (A80C:2D8F=0)
		jne	loc_2613		; Jump if not equal
		popf				; Pop flags
		jmp	loc_2636		; (F4CA)
loc_2613:
		popf				; Pop flags
		jnc	loc_2620		; Jump if carry=0
		or	ax,ax			; Zero ?
		jz	loc_2614		; Jump if zero
		dec	ax
		add	ax,es:[di+8]
		jnc	loc_2614		; Jump if carry=0
		inc	ax
		sub	es:[di+8],ax
		and	byte ptr es:[di+4],0C0h
		or	byte ptr es:[di+4],1
loc_2614:
		mov	ax,es:[di+8]
		mov	word ptr ds:[2A82h],ax	; (A80C:2A82=0)
		mov	word ptr ds:[2A84h],ax	; (A80C:2A84=0)
		mov	dl,es:[di+4]
		mov	di,4513h
		and	dl,3Fh			; '?'
		cmp	dl,0
		je	loc_2617		; Jump if equal
		cmp	dl,1
		je	loc_2618		; Jump if equal
		cmp	dl,2
		je	loc_2619		; Jump if equal
		cmp	dl,4
		je	loc_2616		; Jump if equal
		test	dl,10h
		jnz	loc_2619		; Jump if not zero
		cmp	dl,21h			; '!'
		jb	loc_2615		; Jump if below
		jmp	loc_2635		; (F4C4)
loc_2615:
		cmp	dl,20h			; ' '
		jne	loc_2618		; Jump if not equal
		mov	di,4526h
		jmp	short loc_2618		; (F3BD)
loc_2616:
		test	ax,3
		jnz	loc_2618		; Jump if not zero
		mov	di,45E4h
		jmp	loc_2661		; (F6A7)
loc_2617:
		cmp	ax,2
		je	loc_2619		; Jump if equal
loc_2618:
		jmp	loc_2661		; (F6A7)
loc_2619:
		test	ax,1
		jnz	loc_2618		; Jump if not zero
		mov	di,455Fh
		jmp	loc_2661		; (F6A7)
loc_2620:
		cmp	word ptr ds:[2A40h],0	; (A80C:2A40=0)
		jne	loc_2621		; Jump if not equal
		jmp	loc_2631		; (F47C)
loc_2621:
		mov	es,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	di,word ptr ds:[2D84h]	; (A80C:2D84=0)
		cmp	byte ptr es:[di],0
		je	loc_2629		; Jump if equal
		mov	di,word ptr ds:[2D84h]	; (A80C:2D84=0)
		mov	cx,word ptr ds:[2A40h]	; (A80C:2A40=0)
		cmp	cx,word ptr ds:[4315h]	; (A80C:4315=0)
		jbe	loc_2622		; Jump if below or =
		mov	cx,word ptr ds:[4315h]	; (A80C:4315=0)
		dec	cx
loc_2622:
		sub	cx,di
		mov	ax,cx
		cmp	cx,0FFFFh
		je	loc_2623		; Jump if equal
		inc	cx
loc_2623:
		cmp	cx,20h
		jbe	loc_2629		; Jump if below or =
		mov	dx,cx
		mov	bx,47DDh
		mov	ax,cx
		add	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		jnc	loc_2624		; Jump if carry=0
		dec	cx
		jmp	short loc_2625		; (F41A)
loc_2624:
		cmp	ax,0FFFFh
		jne	loc_2626		; Jump if not equal
loc_2625:
		dec	cx
loc_2626:
		mov	dx,cx
  
locloop_2627:
		mov	ax,es:[di]
		or	ax,ax			; Zero ?
		jz	loc_2628		; Jump if zero
		xlat				; al=[al+[bx]] table
		or	al,al			; Zero ?
		jnz	loc_2628		; Jump if not zero
		inc	di
		loop	locloop_2627		; Loop if cx > 0
  
loc_2628:
		sub	dx,cx
		cmp	dx,20h
		jbe	loc_2629		; Jump if below or =
		mov	di,472Bh
		mov	ax,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	[di],ax
		mov	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		mov	[di+2],ax
		mov	byte ptr [di+4],20h	; ' '
		mov	bx,dx
		jmp	short loc_2633		; (F496)
loc_2629:
		mov	es,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	di,word ptr ds:[2D84h]	; (A80C:2D84=0)
		mov	cx,word ptr ds:[2A40h]	; (A80C:2A40=0)
		sub	cx,di
		cmp	cx,0FFFEh
		jae	loc_2630		; Jump if above or =
		add	cx,2
loc_2630:
		mov	bx,cx
		mov	ax,es:[di]
		cld				; Clear direction
		repe	scasb			; Rep zf=1+cx >0 Scan es:[di] for al
		sub	bx,cx
		dec	bx
		cmp	bx,7
		jae	loc_2632		; Jump if above or =
		mov	di,4513h
		cmp	byte ptr ds:[2A2Fh],2	; (A80C:2A2F=0)
		jb	loc_2631		; Jump if below
		jmp	loc_2618		; (F3BD)
loc_2631:
		jmp	short loc_2636		; (F4CA)
loc_2632:
		cmp	word ptr ds:[2791h],ax	; (A80C:2791=0)
		jne	loc_2636		; Jump if not equal
		mov	di,472Bh
		mov	ax,word ptr ds:[2D82h]	; (A80C:2D82=0)
		mov	[di],ax
		mov	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		mov	[di+2],ax
		mov	byte ptr [di+4],21h	; '!'
loc_2633:
		mov	byte ptr [di+5],5
		test	byte ptr ds:[14ADh],2	; (A80C:14AD=0)
		jz	loc_2634		; Jump if zero
		mov	byte ptr [di+5],4
loc_2634:
		mov	[di+8],bx
		mov	word ptr [di+6],0
		call	sub_124			; (9120)
		mov	word ptr ds:[2A82h],bx	; (A80C:2A82=0)
		mov	word ptr ds:[2A84h],bx	; (A80C:2A84=0)
		cmp	byte ptr [di+4],21h	; '!'
		je	loc_2635		; Jump if equal
		mov	di,4526h
		jmp	loc_2661		; (F6A7)
loc_2635:
		mov	di,4539h
		jmp	loc_2661		; (F6A7)
loc_2636:
		mov	word ptr ds:[263Bh],12h	; (A80C:263B=0)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		call	sub_93			; (7CCC)
		jc	loc_2637		; Jump if carry Set
		jmp	loc_2653		; (F5E1)
loc_2637:
		mov	dl,es:[di+1]
		cmp	dl,0FFh
		je	loc_2638		; Jump if equal
		xchg	al,ah
		mov	bl,al
		mov	dh,dl
		and	dh,7
		cmp	dh,0
		je	loc_2641		; Jump if equal
		cmp	dh,1
		je	loc_2642		; Jump if equal
		cmp	dh,2
		je	loc_2643		; Jump if equal
		cmp	dh,3
		je	loc_2638		; Jump if equal
		cmp	dh,4
		je	loc_2644		; Jump if equal
		cmp	dh,5
		je	loc_2645		; Jump if equal
		cmp	dh,6
		je	loc_2647		; Jump if equal
		mov	bx,5
		jmp	loc_190			; (215F)
loc_2638:
		mov	al,es:[di+0Dh]
		and	al,7
		and	al,data_325		; (020C:2A79=0E0h)
		jnz	loc_2639		; Jump if not zero
		mov	al,es:[di+0Ch]
		and	al,data_323		; (020C:2A77=0A5h)
		jnz	loc_2639		; Jump if not zero
		jmp	loc_2652		; (F5C5)
loc_2639:
		call	sub_139			; (B3F8)
		jc	loc_2640		; Jump if carry Set
		call	sub_95			; (7D04)
		jmp	loc_2657		; (F61D)
loc_2640:
		jmp	loc_2653		; (F5E1)
loc_2641:
		and	dl,38h			; '8'
		and	bl,38h			; '8'
		jmp	short loc_2649		; (F595)
loc_2642:
		and	dl,0C0h
		and	bl,0C0h
		jmp	short loc_2649		; (F595)
loc_2643:
		and	dl,0F8h
		and	bl,0F8h
		jmp	short loc_2649		; (F595)
loc_2644:
		mov	dl,0Ah
		jmp	short loc_2649		; (F595)
loc_2645:
		test	dl,10h
		jz	loc_2646		; Jump if zero
		mov	al,[si+2]
		cmp	al,es:[di+0Ah]
		jne	loc_2652		; Jump if not equal
		mov	byte ptr ds:[2A81h],bl	; (94E8:2A81=75h)
loc_2646:
		test	dl,8
		jz	loc_2648		; Jump if zero
		and	dl,0C0h
		mov	al,[si+2]
		and	al,0C0h
		cmp	al,dl
		jne	loc_2652		; Jump if not equal
		jmp	short loc_2648		; (F58C)
loc_2647:
		and	dl,0F8h
		mov	al,[si+2]
		and	al,0F8h
		cmp	al,dl
		jne	loc_2652		; Jump if not equal
loc_2648:
		mov	byte ptr ds:[2A7Ah],1	; (94E8:2A7A=56h)
		mov	dl,es:[di+11h]
loc_2649:
		cmp	dl,bl
		jne	loc_2652		; Jump if not equal
		mov	al,es:[di+0Dh]
		and	al,7
		and	al,byte ptr ds:[2A79h]	; (94E8:2A79=0BFh)
		jnz	loc_2650		; Jump if not zero
		mov	al,es:[di+0Ch]
		and	al,byte ptr ds:[2A77h]	; (94E8:2A77=4Ah)
		jz	loc_2652		; Jump if zero
		call	sub_139			; (B3F8)
		jc	loc_2651		; Jump if carry Set
		call	sub_95			; (7D04)
		jmp	short loc_2656		; (F619)
loc_2650:
		call	sub_139			; (B3F8)
data_686	db	72h
data_687	db	5
		call	sub_95			; (7D04)
		jmp	short loc_2655		; (F614)
loc_2651:
		jmp	short loc_2653		; (F5E1)
loc_2652:
		mov	byte ptr ds:[2A7Ah],0	; (94E8:2A7A=56h)
		mov	byte ptr ds:[2A81h],0	; (94E8:2A81=75h)
		mov	ax,7474h
		sub	ax,7460h
		add	di,ax
		mov	ax,[si]
		cmp	al,es:[di]
		jne	loc_2653		; Jump if not equal
		jmp	loc_2637		; (F4DD)
loc_2653:
		test	byte ptr ds:[2ECCh],7Fh	; (94E8:2ECC=91h)
		jz	loc_2654		; Jump if zero
		mov	ax,word ptr ds:[2ECDh]	; (94E8:2ECD=80A4h)
		mov	word ptr ds:[2D84h],ax	; (94E8:2D84=268Fh)
		mov	byte ptr ds:[2ECCh],0	; (94E8:2ECC=91h)
		mov	byte ptr ds:[2F01h],0	; (94E8:2F01=9Ch)
		mov	word ptr ds:[2ECDh],0FFFFh	; (94E8:2ECD=80A4h)
		mov	word ptr ds:[2A16h],0	; (94E8:2A16=9AB8h)
		mov	byte ptr ds:[2A7Ah],0	; (94E8:2A7A=56h)
		call	sub_80			; (7190)
loc_2654:
		call	sub_109			; (80CE)
		mov	di,4513h
		jmp	short loc_2657		; (F61D)
loc_2655:
		mov	byte ptr ds:[2A7Ah],0	; (94E8:2A7A=56h)
loc_2656:
		inc	byte ptr ds:[2A5Eh]	; (94E8:2A5E=0B8h)
loc_2657:
		mov	word ptr ds:[263Bh],13h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	ax,word ptr ds:[2D84h]	; (94E8:2D84=268Fh)
		mov	bx,word ptr ds:[2D82h]	; (94E8:2D82=3A16h)
		push	di
		mov	dx,4
		call	sub_84			; (7498)
		jnc	loc_2660		; Jump if carry=0
		mov	ax,word ptr ds:[379Eh]	; (A80C:379E=0)
		mov	word ptr ds:[37A0h],ax	; (A80C:37A0=0)
		mov	ax,word ptr ds:[379Ch]	; (A80C:379C=0)
		mov	word ptr ds:[379Eh],ax	; (A80C:379E=0)
		mov	ax,word ptr ds:[379Ah]	; (A80C:379A=0)
		mov	word ptr ds:[379Ch],ax	; (A80C:379C=0)
		mov	ax,es:[di+2]
		mov	word ptr ds:[379Ah],ax	; (A80C:379A=0)
		mov	al,es:[di+4]
		add	di,9
		and	al,7
		jnz	loc_2658		; Jump if not zero
		push	bx
		push	cx
		mov	cx,2ED4h
		mov	bx,2EF4h
		sub	bx,cx
		add	bx,di
		mov	ax,word ptr ds:[2A46h]	; (A80C:2A46=0)
		mov	es:[bx],ax
		mov	bx,2EF2h
		sub	bx,cx
		add	bx,di
		mov	ax,word ptr ds:[2A48h]	; (A80C:2A48=0)
		mov	es:[bx],ax
		mov	bx,2EFAh
		sub	bx,cx
		add	bx,di
		mov	ax,word ptr ds:[2A4Ch]	; (A80C:2A4C=0)
		mov	es:[bx],ax
		mov	bx,2EF0h
		sub	bx,cx
		add	bx,di
		mov	ax,word ptr ds:[2A4Ah]	; (A80C:2A4A=0)
		mov	es:[bx],ax
		pop	cx
		pop	bx
loc_2658:
		mov	bx,2ED4h
		mov	cx,29h
  
locloop_2659:
		mov	al,es:[di]
		mov	[bx],al
		inc	di
		inc	bx
		loop	locloop_2659		; Loop if cx > 0
  
loc_2660:
		pop	di
loc_2661:
		mov	word ptr ds:[2A8Ch],di	; (A80C:2A8C=0)
		mov	al,[di+0Fh]
		mov	byte ptr ds:[2A75h],al	; (A80C:2A75=0)
		cmp	al,25h			; '%'
		jne	loc_2662		; Jump if not equal
		or	byte ptr ds:[42B3h],10h	; (A80C:42B3=0)
loc_2662:
		mov	al,[di+0Ch]
		mov	byte ptr ds:[2F07h],al	; (A80C:2F07=0)
		mov	al,[di+10h]
		mov	byte ptr ds:[2F06h],al	; (A80C:2F06=0)
		mov	al,[di+0Eh]
		mov	byte ptr ds:[2F03h],al	; (A80C:2F03=0)
		mov	word ptr ds:[263Bh],14h	; (A80C:263B=0)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		call	sub_109			; (80CE)
		mov	si,2791h
		cmp	byte ptr ds:[2A7Ah],1	; (94E8:2A7A=56h)
		jne	loc_2663		; Jump if not equal
		inc	si
loc_2663:
		cmp	byte ptr ds:[47B1h],0	; (94E8:47B1=0E8h)
		je	loc_2664		; Jump if equal
		dec	byte ptr ds:[47B2h]	; (94E8:47B2=0A2h)
		jnz	loc_2664		; Jump if not zero
		mov	dl,byte ptr ds:[47B1h]	; (94E8:47B1=0E8h)
		mov	byte ptr ds:[47B2h],dl	; (94E8:47B2=0A2h)
		call	sub_50			; (52A0)
loc_2664:
		mov	byte ptr ds:[2F05h],1	; (94E8:2F05=75h)
		mov	bp,2802h
		mov	dl,[di+9]
		cmp	dl,0
		je	loc_2665		; Jump if equal
		mov	bh,[di+0Dh]
		mov	byte ptr ds:[2D8Ch],0	; (94E8:2D8C=0E9h)
		push	di
		lea	di,[di+9]		; Load effective addr
		call	sub_157			; (C364)
		pop	di
		inc	byte ptr ds:[2F05h]	; (94E8:2F05=75h)
		mov	byte ptr ds:[2A5Fh],al	; (94E8:2A5F=9Ah)
		cmp	byte ptr ds:[2A81h],0	; (94E8:2A81=75h)
		jne	loc_2665		; Jump if not equal
		mov	dl,[di+0Ah]
		cmp	dl,0
		je	loc_2665		; Jump if equal
		add	dl,dh
		mov	bh,[di+0Dh]
		push	di
		lea	di,[di+0Ah]		; Load effective addr
		call	sub_157			; (C364)
		pop	di
		inc	byte ptr ds:[2F05h]	; (94E8:2F05=75h)
		mov	byte ptr ds:[2A60h],al	; (94E8:2A60=0F8h)
		mov	dl,[di+0Bh]
		cmp	dl,0
		je	loc_2665		; Jump if equal
		add	dl,dh
		mov	bh,[di+0Dh]
		push	di
		lea	di,[di+0Bh]		; Load effective addr
		add	dl,byte ptr ds:[2A7Bh]	; (94E8:2A7B=92h)
		mov	byte ptr ds:[2A7Bh],0	; (94E8:2A7B=92h)
		call	sub_157			; (C364)
		pop	di
		mov	byte ptr ds:[2A61h],al	; (94E8:2A61=0C3h)
loc_2665:
		cmp	byte ptr ds:[2A7Ah],1	; (94E8:2A7A=56h)
		jne	loc_2666		; Jump if not equal
		dec	si
		inc	byte ptr ds:[2A5Eh]	; (94E8:2A5E=0B8h)
		mov	byte ptr ds:[2A7Ah],0	; (94E8:2A7A=56h)
loc_2666:
		mov	ax,word ptr ds:[2A84h]	; (94E8:2A84=83D1h)
		cmp	ax,0
		ja	loc_2667		; Jump if above
		mov	ax,1
		add	al,byte ptr ds:[2A5Eh]	; (94E8:2A5E=0B8h)
		add	al,byte ptr ds:[2A5Fh]	; (94E8:2A5F=9Ah)
		add	al,byte ptr ds:[2A60h]	; (94E8:2A60=0F8h)
		add	al,byte ptr ds:[2A61h]	; (94E8:2A61=0C3h)
loc_2667:
		mov	word ptr ds:[263Bh],15h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	bx,si
		add	bx,ax
		push	bx
		mov	word ptr ds:[2A5Ah],ax	; (94E8:2A5A=0D0F7h)
		mov	cx,ax
		mov	dl,byte ptr ds:[2F06h]	; (94E8:2F06=17h)
;*		call	sub_30			;*(23F0)
		db	0E8h, 40h, 2Ch
		cmp	byte ptr ds:[2A75h],56h	; (94E8:2A75=75h) 'V'
		jne	loc_2668		; Jump if not equal
		call	sub_122			; (8D04)
loc_2668:
		mov	word ptr ds:[263Bh],18h	; (A80C:263B=0)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		pop	si
		cmp	byte ptr ds:[2F06h],5	; (A80C:2F06=0)
		je	loc_2671		; Jump if equal
		cmp	byte ptr ds:[2F06h],0Dh	; (A80C:2F06=0)
		ja	loc_2669		; Jump if above
		cmp	byte ptr ds:[2F06h],8	; (A80C:2F06=0)
		ja	loc_2671		; Jump if above
loc_2669:
		cmp	byte ptr ds:[2F06h],33h	; (A80C:2F06=0) '3'
		ja	loc_2670		; Jump if above
		cmp	byte ptr ds:[2F06h],30h	; (A80C:2F06=0) '0'
		jae	loc_2671		; Jump if above or =
loc_2670:
		call	sub_140			; (B4AC)
		jmp	short loc_2672		; (F7F5)
loc_2671:
		mov	al,byte ptr ds:[27D4h]	; (A80C:27D4=0)
		or	byte ptr ds:[4201h],al	; (A80C:4201=0)
loc_2672:
		mov	ax,word ptr ds:[2D84h]	; (A80C:2D84=0)
		add	ax,word ptr ds:[2A5Ah]	; (A80C:2A5A=0)
		jc	loc_2674		; Jump if carry Set
		cmp	word ptr ds:[2A40h],0	; (A80C:2A40=0)
		je	loc_2674		; Jump if equal
		cmp	ax,word ptr ds:[2A40h]	; (A80C:2A40=0)
		ja	loc_2674		; Jump if above
		jnz	loc_2673		; Jump if not zero
		mov	word ptr ds:[2A40h],0	; (A80C:2A40=0)
loc_2673:
		mov	word ptr ds:[2D84h],ax	; (A80C:2D84=0)
		call	sub_109			; (80CE)
		call	sub_82			; (73AC)
		jmp	loc_2599		; (F23C)
loc_2674:
		inc	byte ptr ds:[2A2Ah]	; (94E8:2A2A=0C6h)
		mov	al,byte ptr ds:[2A2Ah]	; (94E8:2A2A=0C6h)
		cmp	al,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		jae	loc_2675		; Jump if above or =
		jmp	loc_2597		; (F1BF)
loc_2675:
		mov	word ptr ds:[263Bh],20h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		inc	byte ptr ds:[2638h]	; (94E8:2638=0)
		dec	byte ptr ds:[2639h]	; (94E8:2639=74h)
		mov	ah,25h			; '%'
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
		call	sub_90			; (7BA0)
		call	sub_138			; (B390)
		cmp	byte ptr ds:[263Dh],0Ah	; (94E8:263D=86h)
		jb	loc_2676		; Jump if below
		cmp	byte ptr ds:[2639h],2	; (94E8:2639=74h)
		jne	loc_2676		; Jump if not equal
		mov	dx,2
		mov	bx,7890h
		call	sub_32			; (2D80)
loc_2676:
		mov	word ptr ds:[263Bh],21h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	al,byte ptr ds:[2638h]	; (94E8:2638=0)
		inc	al
		cmp	al,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		jb	loc_2677		; Jump if below
		mov	ah,1Fh
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
		mov	dx,7
		mov	bx,0F7ECh
		call	sub_32			; (2D80)
loc_2677:
		call	sub_109			; (80CE)
		mov	di,68Eh
		mov	al,20h			; ' '
		mov	cx,5
		cld				; Clear direction
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	di,72Eh
		mov	cx,5
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		mov	di,6DEh
		mov	cx,5
		rep	stosb			; Rep when cx >0 Store al to es:[di]
		call	sub_66			; (6C9C)
		mov	word ptr ds:[263Bh],22h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		inc	byte ptr ds:[2638h]	; (94E8:2638=0)
		mov	ax,word ptr ds:[42C8h]	; (94E8:42C8=1F72h)
		mov	word ptr ds:[42CCh],ax	; (94E8:42CC=71Fh)
		mov	ax,word ptr ds:[42CAh]	; (94E8:42CA=61Eh)
		mov	word ptr ds:[42CEh],ax	; (94E8:42CE=0F78Bh)
		mov	byte ptr ds:[2A2Ah],0	; (94E8:2A2A=0C6h)
		mov	word ptr ds:[2A33h],0FFFFh	; (94E8:2A33=0A503h)
		mov	bl,byte ptr ds:[2638h]	; (94E8:2638=0)
		cmp	bl,byte ptr ds:[263Dh]	; (94E8:263D=86h)
		jne	loc_2678		; Jump if not equal
		mov	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		mov	byte ptr ds:[2A53h],0	; (94E8:2A53=6)
		mov	dx,2
		mov	bx,0D00h
		call	sub_32			; (2D80)
		mov	dx,2
		mov	bx,7968h
		call	sub_32			; (2D80)
;*		call	sub_43			;*(4180)
		db	0E8h, 82h, 48h
loc_2678:
		mov	bl,byte ptr ds:[2638h]	; (94E8:2638=0)
		shr	bl,1			; Shift w/zeros fill
		add	bl,30h			; '0'
		mov	byte ptr ds:[17BCh],bl	; (94E8:17BC=9)
		call	sub_50			; (52A0)
		mov	al,byte ptr ds:[2A2Ah]	; (94E8:2A2A=0C6h)
		mov	cl,15h
		mul	cl			; ax = reg * al
		mov	si,0
		add	si,ax
		call	sub_106			; (80C5)
		mov	ax,es:[si+0Ch]
		mov	word ptr ds:[17C3h],ax	; (94E8:17C3=0EB41h)
		or	al,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
		cmp	ah,20h			; ' '
		je	loc_2679		; Jump if equal
		or	ah,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
loc_2679:
		mov	word ptr ds:[4DE7h],ax	; (94E8:4DE7=0C7F6h)
		mov	word ptr ds:[4DDAh],ax	; (94E8:4DDA=899Ch)
		mov	word ptr ds:[4E14h],ax	; (94E8:4E14=0A74h)
		mov	word ptr ds:[4EE4h],ax	; (94E8:4EE4=0E800h)
		mov	word ptr ds:[57B5h],ax	; (94E8:57B5=80C7h)
		mov	word ptr ds:[57A8h],ax	; (94E8:57A8=93Ch)
		and	byte ptr ds:[2ECAh],0FBh	; (94E8:2ECA=0C5h)
		test	byte ptr es:[si+0Eh],1
		jz	loc_2680		; Jump if zero
		or	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
loc_2680:
		mov	ax,es:[si+0Fh]
		mov	cs:data_548,ax		; (020C:4877=0DB33h)
		mov	ax,es:[si+11h]
		mov	cs:data_546,ax		; (020C:4873=5590h)
		mov	ax,es:[si+13h]
		mov	cs:data_547,ax		; (020C:4875=0EB8Bh)
		mov	al,byte ptr ds:[47B1h]	; (94E8:47B1=0E8h)
		mov	byte ptr ds:[47B2h],al	; (94E8:47B2=0A2h)
		mov	ah,7
		call	sub_65			; (6C58)
		call	sub_57			; (699C)
		call	sub_109			; (80CE)
		cmp	byte ptr ds:[2A2Ah],0	; (94E8:2A2A=0C6h)
		je	loc_2681		; Jump if equal
		jmp	loc_2694		; (FA7C)
loc_2681:
		call	sub_106			; (80C5)
		mov	cl,byte ptr ds:[2A2Bh]	; (94E8:2A2B=0Ah)
		xor	ch,ch			; Zero register
		mov	si,0
  
locloop_2682:
		cmp	byte ptr es:[si+0Ah],3
		je	loc_2683		; Jump if equal
		add	si,15h
		loop	locloop_2682		; Loop if cx > 0
  
		jmp	short loc_2685		; (F9B5)
loc_2683:
		mov	ax,es:[si+0Ch]
		or	al,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
		cmp	ah,20h			; ' '
		je	loc_2684		; Jump if equal
		or	ah,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
loc_2684:
		mov	word ptr ds:[2A4Eh],ax	; (94E8:2A4E=0C7F7h)
loc_2685:
		call	sub_109			; (80CE)
		mov	ah,2Ah			; '*'
		int	21h			; DOS Services  ah=function 2Ah
						;  get date, cx=year, dx=mon/day
		mov	bp,2D19h
		mov	al,dl
		xor	ah,ah			; Zero register
		test	word ptr ds:[2EC4h],2	; (94E8:2EC4=8BA4h)
		jz	loc_2686		; Jump if zero
		mov	al,0Ah
loc_2686:
		mov	bl,1
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		sub	cx,76Ch
		cmp	cx,64h
		jb	loc_2687		; Jump if below
		sub	cx,64h
loc_2687:
		mov	bp,2D20h
		mov	al,cl
		xor	ah,ah			; Zero register
		test	word ptr ds:[2EC4h],2	; (94E8:2EC4=8BA4h)
		jz	loc_2688		; Jump if zero
		mov	al,3Ah			; ':'
loc_2688:
		mov	bl,1
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		call	sub_109			; (80CE)
		mov	di,2D1Fh
		mov	al,dh
		dec	al
		test	word ptr ds:[2EC4h],2	; (94E8:2EC4=8BA4h)
		jz	loc_2689		; Jump if zero
		mov	al,5
loc_2689:
		mov	cl,2
		rol	al,cl			; Rotate
		xor	ah,ah			; Zero register
		add	ax,2E81h
		mov	si,ax
		mov	cx,4
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	ah,2Ch			; ','
		int	21h			; DOS Services  ah=function 2Ch
						;  get time, cx=hrs/min, dh=sec
		test	word ptr ds:[2EC4h],2	; (94E8:2EC4=8BA4h)
		jz	loc_2690		; Jump if zero
		mov	ch,0Ch
		mov	cl,1
loc_2690:
		mov	al,ch
		mov	bl,61h			; 'a'
		cmp	al,0Ch
		jb	loc_2691		; Jump if below
		mov	bl,70h			; 'p'
loc_2691:
		mov	bp,2D2Dh
		mov	ds:[bp],bl
		cmp	al,0
		jne	loc_2692		; Jump if not equal
		mov	al,0Ch
loc_2692:
		cmp	al,0Ch
		jbe	loc_2693		; Jump if below or =
		sub	al,0Ch
loc_2693:
		xor	ah,ah			; Zero register
		mov	bp,2D24h
		mov	bl,1
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		xor	ah,ah			; Zero register
		mov	al,cl
		mov	bp,2D27h
		mov	bl,1
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		cmp	byte ptr ds:[bp-2],20h	; ' '
		jne	loc_2694		; Jump if not equal
		mov	byte ptr ds:[bp-2],30h	; '0'
		cmp	byte ptr ds:[bp-1],20h	; ' '
		jne	loc_2694		; Jump if not equal
		mov	byte ptr ds:[bp-1],30h	; '0'
loc_2694:
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		jne	loc_2699		; Jump if not equal
		cmp	byte ptr ds:[2A2Ah],0	; (94E8:2A2A=0C6h)
		jne	loc_2699		; Jump if not equal
		mov	ah,3Ch			; '<'
		mov	dx,2BF5h
		cmp	byte ptr ds:[2BF6h],3Ah	; (94E8:2BF6=9Ah) ':'
		je	loc_2695		; Jump if equal
		mov	dx,2BF3h
loc_2695:
		mov	cx,0
		int	21h			; DOS Services  ah=function 3Ch
						;  create/truncate file @ ds:dx
		jnc	loc_2696		; Jump if carry=0
;*		jmp	loc_196			;*(21FA)
		db	0E9h, 57h, 27h
loc_2696:
		mov	word ptr ds:[2C3Ch],ax	; (94E8:2C3C=0BC7h)
		cmp	byte ptr ds:[38B7h],0	; (94E8:38B7=0Ah)
		je	loc_2699		; Jump if equal
		mov	ah,3Dh			; '='
		mov	al,0
		mov	dx,3903h
		cmp	byte ptr ds:[3906h],3Ah	; (94E8:3906=33h) ':'
		jne	loc_2697		; Jump if not equal
		mov	dx,3905h
loc_2697:
		mov	cx,0
		int	21h			; DOS Services  ah=function 3Dh
						;  open file, al=mode,name@ds:dx
		jnc	loc_2698		; Jump if carry=0
		jmp	loc_197			; (2203)
loc_2698:
		mov	word ptr ds:[37EAh],ax	; (94E8:37EA=7400h)
loc_2699:
		call	sub_109			; (80CE)
		cmp	byte ptr ds:[263Eh],1	; (94E8:263E=99h)
		je	loc_2700		; Jump if equal
		jmp	loc_2758		; (FF14)
loc_2700:
		cmp	byte ptr ds:[2A2Ah],0	; (94E8:2A2A=0C6h)
		je	loc_2701		; Jump if equal
		jmp	loc_2733		; (FD31)
loc_2701:
		cmp	byte ptr ds:[2C3Fh],0	; (94E8:2C3F=3)
		je	loc_2702		; Jump if equal
		cmp	byte ptr ds:[2C40h],2	; (94E8:2C40=0)
		jae	loc_2703		; Jump if above or =
loc_2702:
		jmp	loc_2758		; (FF14)
loc_2703:
		cmp	byte ptr ds:[2C40h],2	; (94E8:2C40=0)
		jne	loc_2704		; Jump if not equal
		mov	word ptr ds:[4D53h],3031h	; (94E8:4D53=9BCBh)
data_688	dw	6C7h			; Data table (indexed access)
		push	bp
		dec	bp
		xor	[bx+si-47h],ch
		or	[bx+si],al
		mov	si,26DAh
		mov	di,4D59h
		mov	bx,4CB2h
		mov	bp,4F0Dh
		mov	dx,4F2Bh
  
locloop_2705:
		mov	al,[si]
		cmp	al,0
		je	loc_2708		; Jump if equal
		cmp	al,2Eh			; '.'
		je	loc_2708		; Jump if equal
		cmp	al,41h			; 'A'
		jb	loc_2706		; Jump if below
		and	al,0DFh
loc_2706:
		mov	[bx],al
		inc	bx
		test	byte ptr ds:[2EB8h],60h	; (94E8:2EB8=0FFh) '`'
		jz	loc_2707		; Jump if zero
		mov	al,[si]
loc_2707:
		mov	ds:[bp],al
		inc	bp
		mov	[di],al
		inc	di
		xchg	bx,dx
		mov	[bx],al
		xchg	dx,bx
		inc	dx
		inc	si
		loop	locloop_2705		; Loop if cx > 0
  
loc_2708:
		test	byte ptr ds:[2A77h],0E0h	; (94E8:2A77=4Ah)
		jz	loc_2710		; Jump if zero
		push	bp
		push	si
		mov	si,3417h
		test	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
		jz	loc_2709		; Jump if zero
		mov	si,341Dh
loc_2709:
		mov	bp,4D03h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		pop	bp
loc_2710:
		mov	al,4
		call	sub_52			; (6380)
		mov	bp,509Dh
		mov	ax,word ptr ds:[2D7Bh]	; (94E8:2D7B=0F286h)
		cmp	ax,0
		je	loc_2711		; Jump if equal
		mov	cx,word ptr ds:[2D7Dh]	; (94E8:2D7D=0E89h)
		cmp	cx,0
		je	loc_2711		; Jump if equal
		cmp	cx,0Ch
		ja	loc_2711		; Jump if above
		mov	dx,word ptr ds:[2D7Fh]	; (94E8:2D7F=8F38h)
		cmp	dx,64h
		ja	loc_2711		; Jump if above
		xor	bl,bl			; Zero register
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
		mov	byte ptr ds:[bp],2Dh	; '-'
		inc	bp
		mov	di,bp
		dec	cx
		mov	si,cx
		mov	cl,2
		shl	si,cl			; Shift w/zeros fill
		add	si,2E81h
		mov	cx,4
		cld				; Clear direction
		rep	movsb			; Rep when cx >0 Mov [si] to es:[di]
		mov	ax,dx
		mov	bp,di
		xor	bl,bl			; Zero register
;*		call	far ptr sub_183		;*(1548:00D4)
		db	 9Ah,0D4h, 00h, 48h, 15h
loc_2711:
		mov	al,13h
		call	sub_52			; (6380)
		cmp	word ptr ds:[50A1h],20h	; (94E8:50A1=9C26h)
		je	loc_2712		; Jump if equal
		mov	al,14h
		call	sub_52			; (6380)
loc_2712:
		cmp	word ptr ds:[50E9h],20h	; (94E8:50E9=997Fh)
		je	loc_2713		; Jump if equal
		mov	al,15h
		call	sub_52			; (6380)
loc_2713:
		cmp	byte ptr ds:[2C40h],4	; (94E8:2C40=0)
		jb	loc_2714		; Jump if below
		mov	al,27h			; '''
		call	sub_52			; (6380)
loc_2714:
		mov	di,5826h
		mov	ax,word ptr ds:[42CCh]	; (94E8:42CC=71Fh)
		mov	bl,41h			; 'A'
		mov	cx,10h
  
locloop_2715:
		test	ax,8000h
		jz	loc_2716		; Jump if zero
		mov	[di],bl
		inc	di
loc_2716:
		rol	ax,1			; Rotate
		inc	bl
		loop	locloop_2715		; Loop if cx > 0
  
		mov	al,byte ptr ds:[430Bh]	; (94E8:430B=21h)
		mov	cx,4
  
locloop_2717:
		test	al,4
		jz	loc_2718		; Jump if zero
		mov	[di],bl
		inc	di
loc_2718:
		rol	al,1			; Rotate
		inc	bl
		loop	locloop_2717		; Loop if cx > 0
  
		mov	ax,word ptr ds:[42CEh]	; (94E8:42CE=0F78Bh)
		mov	cx,6
  
locloop_2719:
		test	ax,80h
		jz	loc_2720		; Jump if zero
		mov	[di],bl
		inc	di
loc_2720:
		rol	ax,1			; Rotate
		inc	bl
		loop	locloop_2719		; Loop if cx > 0
  
		cmp	di,5826h
		jne	loc_2721		; Jump if not equal
		mov	word ptr ds:[5826h],6F6Eh	; (94E8:5826=9506h)
		mov	word ptr ds:[5828h],656Eh	; (94E8:5828=9Ch)
loc_2721:
		mov	al,2Dh			; '-'
		call	sub_52			; (6380)
		cmp	byte ptr ds:[42B4h],1	; (94E8:42B4=5Fh)
		jne	loc_2722		; Jump if not equal
		mov	al,30h			; '0'
		call	sub_52			; (6380)
loc_2722:
		cmp	byte ptr ds:[26D5h],1	; (94E8:26D5=7)
		jne	loc_2723		; Jump if not equal
		mov	al,31h			; '1'
		call	sub_52			; (6380)
loc_2723:
		cmp	word ptr ds:[512Ah],20h	; (94E8:512A=0B8h)
		je	loc_2724		; Jump if equal
		mov	al,16h
		call	sub_52			; (6380)
loc_2724:
		mov	al,17h
		call	sub_52			; (6380)
		cmp	byte ptr ds:[139Eh],7	; (94E8:139E=6)
		jne	loc_2725		; Jump if not equal
		mov	al,4Ch			; 'L'
		call	sub_52			; (6380)
loc_2725:
		test	word ptr ds:[139Fh],1	; (94E8:139F=10E9h)
		jz	loc_2727		; Jump if zero
		mov	al,48h			; 'H'
		call	sub_52			; (6380)
loc_2727:
		test	word ptr ds:[139Fh],2	; (94E8:139F=10E9h)
		jz	loc_2728		; Jump if zero
		mov	al,49h			; 'I'
		call	sub_52			; (6380)
loc_2728:
		test	byte ptr ds:[2A77h],1	; (94E8:2A77=4Ah)
		jnz	loc_2731		; Jump if not zero
		mov	al,12h
		test	byte ptr ds:[2A77h],6	; (94E8:2A77=4Ah)
		jnz	loc_2729		; Jump if not zero
		mov	al,18h
		cmp	byte ptr ds:[2A77h],10h	; (94E8:2A77=4Ah)
		je	loc_2729		; Jump if equal
		mov	al,11h
		cmp	byte ptr ds:[2A77h],18h	; (94E8:2A77=4Ah)
		je	loc_2729		; Jump if equal
		mov	al,39h			; '9'
		cmp	byte ptr ds:[2A77h],20h	; (94E8:2A77=4Ah) ' '
		je	loc_2729		; Jump if equal
		mov	al,3Ah			; ':'
		cmp	byte ptr ds:[2A77h],28h	; (94E8:2A77=4Ah) '('
		je	loc_2729		; Jump if equal
		mov	al,3Bh			; ';'
		cmp	byte ptr ds:[2A77h],40h	; (94E8:2A77=4Ah) '@'
		je	loc_2729		; Jump if equal
		mov	al,3Ch			; '<'
		cmp	byte ptr ds:[2A77h],48h	; (94E8:2A77=4Ah) 'H'
		je	loc_2729		; Jump if equal
		mov	al,3Dh			; '='
		cmp	byte ptr ds:[2A77h],80h	; (94E8:2A77=4Ah)
		je	loc_2729		; Jump if equal
		mov	al,3Eh			; '>'
		cmp	byte ptr ds:[2A77h],88h	; (94E8:2A77=4Ah)
		je	loc_2729		; Jump if equal
loc_2729:
		call	sub_52			; (6380)
		mov	al,1Dh
		test	byte ptr ds:[2A79h],1	; (94E8:2A79=0BFh)
		jnz	loc_2730		; Jump if not zero
		mov	al,1Eh
		test	byte ptr ds:[2A79h],2	; (94E8:2A79=0BFh)
		jnz	loc_2730		; Jump if not zero
		mov	al,38h			; '8'
		test	byte ptr ds:[2A79h],4	; (94E8:2A79=0BFh)
		jz	loc_2731		; Jump if zero
loc_2730:
		call	sub_52			; (6380)
loc_2731:
		call	sub_87			; (789C)
		cmp	byte ptr ds:[2C40h],3	; (94E8:2C40=0)
		je	loc_2732		; Jump if equal
		cmp	byte ptr ds:[1422h],0	; (94E8:1422=26h)
		jne	loc_2732		; Jump if not equal
		mov	byte ptr ds:[2A36h],1	; (94E8:2A36=0C3h)
		mov	al,5
		call	sub_52			; (6380)
		jmp	loc_2758		; (FF14)
		jmp	loc_191			; (2176)
loc_2732:
		mov	byte ptr ds:[2A36h],2	; (94E8:2A36=0C3h)
		test	word ptr ds:[139Fh],20h	; (94E8:139F=10E9h)
		jz	loc_2733		; Jump if zero
		call	sub_168			; (DCD0)
loc_2733:
		cmp	byte ptr ds:[2C40h],3	; (94E8:2C40=0)
		je	loc_2734		; Jump if equal
		cmp	byte ptr ds:[1422h],0	; (94E8:1422=26h)
		jne	loc_2734		; Jump if not equal
		jmp	loc_2758		; (FF14)
loc_2734:
		call	sub_106			; (80C5)
		mov	al,byte ptr ds:[2A2Ah]	; (94E8:2A2A=0C6h)
		mov	bl,15h
		mul	bl			; ax = reg * al
		add	ax,0
		mov	si,ax
		mov	dx,es:[si+0Ah]
		and	dl,3
		cmp	byte ptr ds:[2A2Ah],0	; (94E8:2A2A=0C6h)
		je	loc_2736		; Jump if equal
		xor	bh,bh			; Zero register
		sub	si,bx
		mov	ax,es:[si]
		add	si,bx
		cmp	ax,es:[si]
		jne	loc_2736		; Jump if not equal
loc_2735:
		jmp	loc_2758		; (FF14)
loc_2736:
		mov	al,7
		test	byte ptr ds:[2A77h],0E0h	; (94E8:2A77=4Ah)
		jz	loc_2738		; Jump if zero
		push	bp
		push	si
		mov	si,3417h
		test	byte ptr ds:[2ECAh],4	; (94E8:2ECA=0C5h)
		jz	loc_2737		; Jump if zero
		mov	si,341Dh
loc_2737:
		push	si
		mov	bp,4E07h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		mov	bp,57C9h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	si
		pop	bp
loc_2738:
		push	si
		push	bp
		test	word ptr es:[si],0Fh
		jz	loc_2739		; Jump if zero
		mov	si,33F8h
		jmp	short loc_2740		; (FDAD)
loc_2739:
		mov	si,33F3h
loc_2740:
		mov	bp,4DFBh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		pop	bp
		pop	si
		cmp	dl,3
		jne	loc_2742		; Jump if not equal
		mov	ax,es:[si+0Ch]
		or	al,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
		cmp	ah,20h			; ' '
		je	loc_2741		; Jump if equal
		or	ah,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
loc_2741:
		mov	word ptr ds:[4E83h],ax	; (94E8:4E83=0B75h)
		mov	word ptr ds:[4E95h],ax	; (94E8:4E95=8D21h)
		mov	word ptr ds:[4EBAh],ax	; (94E8:4EBA=0C7ABh)
		mov	al,0Ah
		jmp	short loc_2743		; (FDED)
loc_2742:
		cmp	word ptr es:[si],50h
		ja	loc_2743		; Jump if above
		mov	ax,es:[si]
		mov	bp,57D2h
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		mov	al,2Bh			; '+'
loc_2743:
		call	sub_52			; (6380)
		cmp	dl,3
		jne	loc_2744		; Jump if not equal
		jmp	loc_2735		; (FD6D)
loc_2744:
		test	dh,40h			; '@'
		jz	loc_2745		; Jump if zero
		jmp	loc_2756		; (FED4)
loc_2745:
		mov	di,si
		cmp	dl,2
		jne	loc_2748		; Jump if not equal
		mov	ax,es:[si]
loc_2746:
		add	di,15h
		cmp	ax,es:[di]
		je	loc_2747		; Jump if equal
		jmp	loc_2756		; (FED4)
loc_2747:
		mov	bx,es:[di+0Ah]
		and	bx,3
		cmp	bx,2
		jae	loc_2746		; Jump if above or =
loc_2748:
		mov	bx,0
		mov	ax,es:[di+6]
loc_2749:
		cmp	word ptr es:[bx],0FFFFh
		je	loc_2750		; Jump if equal
		cmp	ax,es:[bx]
		je	loc_2751		; Jump if equal
		add	bx,15h
		jmp	short loc_2749		; (FE28)
loc_2750:
		mov	ax,es:[si]
		mov	word ptr ds:[2A50h],ax	; (94E8:2A50=2)
		push	si
		mov	si,30A1h
		mov	dx,word ptr ds:[4EE4h]	; (94E8:4EE4=0E800h)
		jmp	short loc_2753		; (FE6F)
loc_2751:
		mov	ax,es:[si+6]
		mov	word ptr ds:[2A50h],ax	; (94E8:2A50=2)
		push	si
		mov	si,30A1h
		mov	dx,es:[bx+0Ch]
		or	dl,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
		cmp	dh,20h			; ' '
		je	loc_2752		; Jump if equal
		or	dh,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
loc_2752:
		mov	ax,es:[bx+0Ah]
		cmp	al,3
		jne	loc_2753		; Jump if not equal
		mov	si,30A6h
loc_2753:
		mov	bp,4EEBh
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	ds:[bp],dx
		add	bp,2
		cmp	byte ptr ds:[2A26h],1	; (94E8:2A26=0A4h)
		jne	loc_2754		; Jump if not equal
		cmp	word ptr ds:[2A4Eh],2020h	; (94E8:2A4E=0C7F7h)
		je	loc_2754		; Jump if equal
		mov	word ptr ds:[bp],202Ch
		mov	ax,5353h
		or	al,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
		or	ah,byte ptr ds:[2EB8h]	; (94E8:2EB8=0FFh)
		mov	ds:[bp+2],ax
		mov	byte ptr ds:[bp+4],3Ah	; ':'
		add	bp,5
		mov	si,30A6h
;*		call	far ptr sub_209		;*(1548:1004)
		db	 9Ah, 04h, 10h, 48h, 15h
		mov	ax,word ptr ds:[2A4Eh]	; (94E8:2A4E=0C7F7h)
		mov	ds:[bp],ax
		add	bp,2
loc_2754:
		mov	cx,4F0Ah
		sub	cx,bp
  
locloop_2755:
		mov	byte ptr ds:[bp],20h	; ' '
		inc	bp
		loop	locloop_2755		; Loop if cx > 0
  
		pop	si
		mov	byte ptr ds:[2A52h],1	; (94E8:2A52=74h)
		mov	al,0Ch
		call	sub_52			; (6380)
loc_2756:
		mov	al,3
		call	sub_52			; (6380)
		cmp	word ptr es:[si+2],0
		je	loc_2757		; Jump if equal
		mov	bp,4F59h
		mov	word ptr ds:[bp],2020h
		mov	word ptr ds:[bp+2],2020h
		mov	word ptr ds:[bp+4],2020h
		mov	ax,es:[si+2]
;*		call	far ptr sub_182		;*(1548:0088)
		db	 9Ah, 88h, 00h, 48h, 15h
		mov	al,0Fh
		call	sub_52			; (6380)
loc_2757:
		cmp	byte ptr ds:[2A36h],2	; (94E8:2A36=0C3h)
		jb	loc_2758		; Jump if below
		mov	byte ptr ds:[42B5h],1	; (94E8:42B5=99h)
		jmp	short loc_2758		; (FF14)
		jmp	loc_191			; (2176)
loc_2758:
		mov	word ptr ds:[263Bh],23h	; (94E8:263B=6C6h)
;*		call	far ptr sub_201		;*(1548:0704)
		db	 9Ah, 04h, 07h, 48h, 15h
		mov	byte ptr ds:[2E7Eh],0	; (94E8:2E7E=0C0h)
		call	sub_106			; (80C5)
;*		call	far ptr sub_234		;*(1548:16B4)
		db	 9Ah,0B4h, 16h, 48h, 15h
		call	sub_109			; (80CE)
		mov	byte ptr ds:[2A75h],0	; (94E8:2A75=75h)
		mov	word ptr ds:[379Ah],0FFFFh	; (94E8:379A=147h)
		mov	dl,0FFh
;*		call	sub_30			;*(23F0)
		db	0E8h,0B1h, 24h
		mov	byte ptr ds:[2D8Dh],0	; (94E8:2D8D=0D1h)
		cmp	byte ptr ds:[2C40h],1	; (94E8:2C40=0)
		je	loc_2759		; Jump if equal
		cmp	byte ptr ds:[2A2Fh],1	; (94E8:2A2F=46h)
		je	loc_2759		; Jump if equal
		mov	byte ptr ds:[2D8Dh],5	; (94E8:2D8D=0D1h)
loc_2759:
		call	sub_140			; (B4AC)
		call	sub_150			; (BBF4)
		mov	byte ptr ds:[2A7Eh],0	; (94E8:2A7E=0)
		test	byte ptr ds:[2ECCh],7Fh	; (94E8:2ECC=91h)
		jnz	loc_2760		; Jump if not zero
		mov	byte ptr cs:[0F5BAh],90h	; (020C:F5BA=3Ch)
		mov	byte ptr cs:[0F5BBh],90h	; (020C:F5BB=0BEh)
		mov	cs:data_686,90h		; (020C:F5BC=72h)
		mov	cs:data_687,90h		; (020C:F5BD=5)
loc_2760:
;*		call	far ptr sub_218		;*(1548:1210)
		db	 9Ah, 10h, 12h, 48h, 15h
		mov	ax,0FFFFh
		mov	word ptr ds:[2DB2h],ax	; (94E8:2DB2=0A100h)
		mov	word ptr ds:[2DB4h],ax	; (94E8:2DB4=9989h)
		mov	word ptr ds:[379Ah],ax	; (94E8:379A=147h)
		xor	ax,ax			; Zero register
		mov	word ptr ds:[2E7Fh],ax	; (94E8:2E7F=674h)
		mov	word ptr ds:[2A88h],ax	; (94E8:2A88=1B0h)
		mov	word ptr ds:[2A16h],ax	; (94E8:2A16=9AB8h)
		mov	word ptr ds:[2DB6h],ax	; (94E8:2DB6=52A3h)
		mov	word ptr ds:[2DB8h],ax	; (94E8:2DB8=0BA9Bh)
		mov	byte ptr ds:[2F04h],90h	; (94E8:2F04=0)
		test	byte ptr ds:[2A30h],40h	; (94E8:2A30=24h) '@'
		jz	loc_2761		; Jump if zero
;*		jmp	loc_177			;*(1D34)
		db	0E9h, 82h, 1Dh
loc_2761:
		mov	ah,0Bh
		int	21h			; DOS Services  ah=function 0Bh
						;  if keybd char available,al=FF
		or	al,al			; Zero ?
		jz	loc_2764		; Jump if zero
;*		call	far ptr sub_189		;*(1548:0340)
		db	 9Ah, 40h, 03h, 48h, 15h
		cmp	al,1Bh
		je	loc_2762		; Jump if equal
		or	al,20h			; ' '
		cmp	al,71h			; 'q'
		je	loc_2762		; Jump if equal
		cmp	al,6Ah			; 'j'
		je	loc_2763		; Jump if equal
		jmp	short loc_2764		; (FFE0)
loc_2762:
;*		jmp	loc_204			;*(2241)
		db	0E9h, 6Fh, 22h
loc_2763:
		mov	ax,word ptr ds:[2EC4h]	; (94E8:2EC4=8BA4h)
		mov	bx,word ptr ds:[2EC6h]	; (94E8:2EC6=7492h)
		mov	word ptr ds:[2EC6h],ax	; (94E8:2EC6=7492h)
		mov	word ptr ds:[2EC4h],bx	; (94E8:2EC4=8BA4h)
loc_2764:
;*		call	far ptr sub_220		;*(1548:1268)
		db	 9Ah, 68h, 12h, 48h, 15h
		xor	ax,ax			; Zero register
		mov	byte ptr ds:[2A75h],al	; (94E8:2A75=75h)
		mov	byte ptr ds:[2A76h],al	; (94E8:2A76=2)
		mov	byte ptr ds:[38BAh],4	; (94E8:38BA=0F7h)
		mov	byte ptr ds:[2F0Ah],al	; (94E8:2F0A=9Bh)
		test	byte ptr ds:[2ECCh],7Fh	; (94E8:2ECC=91h)
		jnz	$+17h			; Jump if not zero
		mov	byte ptr ds:[42B3h],al	; (94E8:42B3=1Eh)
		mov	byte ptr ds:[1828h],al	; (94E8:1828=5Bh)
  
