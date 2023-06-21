
;<Program title>
;5 
;An array of ten data bytes is stored on memory locations 2100H
; onwards. Write an 8085 assembly language program to find the
; bytes having complemented nibbles (e.g. 2DH, 3CH, 78H etc.) 
;and store them on a new array starting from memory locations
; 2200H onwards. 


;; logic here first we take ani as f0h to get the upper bit
;; than RLC 4 times with to convert it in lower bit than  add with
;lower bit 
;again anding with 0fh to get the lower bit and compare it with
; if 0f than store else skip

jmp start
start: lxi h , 2100h ; data 
LXI D , 2200h
MVI C , 0Ah ; counter
loop: MOV A , M 
ANI 0fh ; masking the lower bit
MOV B , A
MOV A , M ; taking again the data 
ANI 0F0h ;
RLC
RLC
RLC
RLC
ADD B
CPI 0fh ; checking the result 
JNZ SKIP
; restoring the value back
MOV A , M
STAX D 
INX D 
SKIP: INX H 
DCR C 
JNZ loop
hlt


