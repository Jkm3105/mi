
;<Program title>
; program 9 
;A set of ten BCD numbers are stored in memory locations 
;starting from 2500H. Write an ALP to convert each BCD number
; to binary hex number and store the result in memory locations 
;starting from address 4000H. 

jmp start
start: nop

LXI H , 2500h
LXI D , 4000h
LXI SP ,0A000h
MVI C , 0Ah
 
; conversion bcd to bin hex;
Again: 	PUSH B
	PUSH D
	MOV A , M
	ANI 0Fh ; getting lower bit
	MOV B , A  ; storing it in b register
	MOV A , M 
	ANI 0F0H 
	RRC
	RRC
	RRC
	RRC ; convert higher bit to lower bit 
	MOV D , A
	MVI C , 0Ah
	XRA A ; clearing the ACC.
	Loop: ADD D 
	DCR C 
	JNZ Loop
	ADD B
	POP D
	STAX D 
	INX D 
	INX H
	POP B
DCR C 
JNZ Again
hlt