
;<Program title>
; 6 remove the duplicate entries from an array
;An array of twenty data bytes is stored on memory locations 
;4100H onwards. Write an 8085 assembly language program 
;to remove the duplicate entries from the array and
; store the compressed array on a new array starting from
; memory locations 4200H onwards. 

jmp start

start: LXI H , 4100h ; source array
;LXI D , 5300h ; dest array
MVI C , 0Ah ; counter
outer: LXI D , 5300h
MOV B , C ; same array to iterate in dest array
MOV A , M 
;inx H 
inner: xchg
CMP M
JnZ store
inx H
;INX H 
XCHG 
dcr B 
JNZ inner ;; here it will check from all destination array
inx H
DCR C 
JNZ outer
hlt

store: MOV M , A
DCR B 
JNZ outer
