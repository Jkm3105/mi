
;<Program title>
;4 
;Ten 8-bit signed numbers are stored in memory locations
; beginning from 8000H. Move all negative numbers in memory 
;locations beginning from 9000H.Count all positive numbers.
jmp start

start: LXI H , 8000h
LXI D , 9000H ; for storing the negative number 
MVI C , 0Ah ; counter 
MVI B , 00h ; for storing the postive number
loop: MOV A , M 
RLC  ;rotate it to left 
JNC pos ; checking the d7 bir for positive or negative
STAX D 
INX D
JMP cont
pos: INR B 
cont: INX H
DCR C 
JNZ loop

hlt