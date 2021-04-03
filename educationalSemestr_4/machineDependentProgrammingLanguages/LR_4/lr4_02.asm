PUBLIC OUTPUT
EXTRN STRING: far

;---------------------
Code1 SEGMENT PARA PUBLIC 'Code' 
   		ASSUME CS:Code1, ES:Code1
;---------------------
OUTPUT: 
		mov AH,9
		int 21h
		
		mov AH,4Ch
		int 21h

		RET
;---------------------    
Code1 	ENDS
		END
