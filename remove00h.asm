
;<Program title>
;10
;Write a program to remove all 00H from given block of
; 15 data bytes.After that perform addition of all the
; numbers.If carry is generated then maintain the carry also

jmp start
start: nop
LXI H , 1000h ;starting address
LXI D , 2000h
;PUSH D
MVI C , 0fH ; counter
loop: MOV A , M 
CPI  00h
JZ skip
STAX D 
INX D
skip: INX H 
DCR C 
JNZ loop
;; now adding that result
Addition: XRA A ; clearing the accumulator
LXI H , 2000h
;MVI D , 00h ; result 
MVI E , 00h ; 
loop1: MOV A , M 
CPI 00h ;; check if data is there or not
JZ end
XRA A
addition: ADD M 
JNC noadd
INR E
noadd: STA 0001h
MOV A , E
STA 0002h
INX H
jmp loop1
end: hlt