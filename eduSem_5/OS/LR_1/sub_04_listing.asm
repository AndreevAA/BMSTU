sub_4		proc	near

		; -- Сохранение регистров ds, dx
		push	ds
		push	ax

		; -- AX = DS = 0040H
		mov	ax,40h
		mov	ds,ax

		; -- Сохранение младшего байта FLAGS в AH
		lahf				; Load ah from flags

		; -- Проверка флага DF либо старшего бита IOPL
		test	word ptr ds:[314h],2400h	; (0040:0314=3200h)
		jnz	loc_9			; Jump if not zero

		; -- Сброс Interrput Enable Flag, 9 бит занулить
           lock	and	word ptr ds:[314h],0FDFFh	; (0040:0314=3200h)
loc_8:
		; -- Загрузка AH в младший байт FLAGS
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