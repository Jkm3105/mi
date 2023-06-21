
;<Program title>
; program 7
;Write an 8085 assembly language program to count the number
; of bytes that are greater than 25 and lesser than 65
 ;from an array of twenty bytes stored on memory locations 
;2000H onwards. Store such numbers on memory locations 2100H
; onwards.
jmp start

start:  LXI H , 2000h
LXI D , 2100h
MVI C , 10h ; counter 
; logic for checking the bit 
Loop: MOV A , M 
	CPI 19h
	JC skip
	CPI 41h
	JnC skip
	STAX D
	INX D	
skip: INX H
DCR C 
JNZ Loop	
hlt