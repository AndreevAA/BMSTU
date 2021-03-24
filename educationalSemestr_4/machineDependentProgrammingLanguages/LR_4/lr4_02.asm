PUBLIC OUTPUT
EXTRN STRING: word

;---------------------
Code1 SEGMENT PARA PUBLIC 'Code' 
   		ASSUME CS:Code1, ES:Code1
;---------------------
OUTPUT: 
		.386
		MOV STRING+1, 0AH
	    LEA DX, STRING+1
	    MOV AH, 9
	    INT 21H

	    RET
;---------------------    
Code1 	ENDS
		END
