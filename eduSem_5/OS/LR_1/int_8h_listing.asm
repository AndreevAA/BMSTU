		; -- Вызов sub_04
		call	sub_4			; (07B9)
		
		; -- Сохранение регистров es, ds, ax, dx
		push	es
		push	ds
		push	ax
		push	dx

		; -- Загрузка в DS 0040h
		mov	ax,40h
		mov	ds,ax

		; -- AX = ES = 0
		xor	ax,ax			; Zero register
		mov	es,ax

		; -- Инкремент счетчика таймера по адресу 0040:006C
		inc	word ptr ds:[6Ch]	; (0040:006C=22A7h)
		jnz	loc_3			; Jump if not zero

		; -- Инкремент старших двух байта счетчика таймера
		inc	word ptr ds:[6Eh]	; (0040:006E=16h)

; -- Проверка на то, что прошло 24 часа
; 0040H:006EH == 18H и 0040H:006H = 00B0H
; 24 * 60 * 60 * t == 18H << 16 + B0H, где количество вызовов таймера в секунду - это t
loc_3:
		cmp	word ptr ds:[6Eh],18h	; (0040:006E=16h)
		jne	loc_4			; Jump if not equal
		cmp	word ptr ds:[6Ch],0B0h	; (0040:006C=22A7h)
		jne	loc_4			; Jump if not equal

		; -- Зануление счетчика таймера и занесение 1 в 0040H:0070 тогда, когда прошло 24 часа
		mov	word ptr ds:[6Eh],ax	; (0040:006E=16h)
		mov	word ptr ds:[6Ch],ax	; (0040:006C=22A7h)
		mov	byte ptr ds:[70h],1	; (0040:0070=0)

		; -- Ранее AL = 0, теперь AL = 8
		or	al,8
loc_4:
		; -- Сохранение регистра AX
		push	ax

		; -- Декрементирование счетчика отключения моторчика
		dec	byte ptr ds:[40h]	; (0040:0040=35h)
		jnz	loc_5			; Jump if not zero

		; -- Установка флагов, отвечающих за отключение моторчика дисковода
		and	byte ptr ds:[3Fh],0F0h	; (0040:003F=0)
		mov	al,0Ch
		mov	dx,3F2h
		out	dx,al			; port 3F2h, dsk0 contrl output
loc_5:
		; -- Восстановление регистра AX
		pop	ax

		; -- Проверка 2 бита, Parity Flag
		test	word ptr ds:[314h],4	; (0040:0314=3200h)
		jnz	loc_6			; Jump if not zero

		; -- Загрузка младшего байта FLAGS в регистр AH
		lahf				; Load ah from flags

		xchg	ah,al
		push	ax

		; -- Выхов 1CH с помощью адреса в таблице векторов. При вызове call на месте регистра будет лежать AX, который по выходу из 1CH будет установлен в FLAGS с помощью IRET
		call	dword ptr es:[70h]	; (0000:0070=6ADh)
		jmp	short loc_7		; (07A5)
		nop
loc_6:
		int	1Ch			; Timer break (call each 18.2ms)
loc_7:
		call	sub_4			; (07B9)

		; -- Сброс котроллера прерываний
		mov	al,20h			; ' '
		out	20h,al			; port 20h, 8259-1 int command
						;  al = 20h, end of interrupt

		; -- Восстановление регистров dx, ax, ds, es
		pop	dx
		pop	ax
		pop	ds
		pop	es

		jmp	$-164h ; (020F:07B0H - 164h = 020A:064Ch)

		db	0C4h
		
		les	cx,dword ptr ds:[93E9h]	; (0000:93E9=0E181h) Load 32 bit ptr
		
		db	0FEh
  