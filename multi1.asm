
;<Program title>
;Write an ALP to multiply the contents of memory location 3040H
; by the contents of memory location 3041H and store the result 
;in memory locations 3042H 
;and 3043H with LS byte of the product at memory location 3042H
;
jmp start
;code
start: lxi H , 3040H
mov B , M ; 1 st number ; act as counter for the first 
INX H
MVI A , 00h ; for sum 
mvi d , 00h; for carry
MOV C ,M ; 2 nd number 
loop: Add C
	jnc skip
	inr D 
skip: dcr b 
jnz loop;
sta 3042h ; storing the result 
mov A , D
Sta 3033h  ;storing the carry part 

hlt