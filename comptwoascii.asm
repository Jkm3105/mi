
;<Program title>
; program 8 
; Two ASCII strings start at memory locations 1042H and 1052H
; respectively. Memory location 1041H contains the length of
; the strings. The program sets the memory location 1040H to
; 00H, if the strings are equal and to FFH if they are not.
jmp start

start: LXI H , 1042h ; one ascii start address
LXI D , 1052h ; second ascii start address
LDA 1041h ; length of ascii
MOV C , A ;counter
;; logic to check two string are equal or not

loop: MOV A , M 
XCHG
MOV B , M ; storing second string value
CMP B 
JNZ nomatch
XCHG
INX H 
INX D
dcr C
JZ loop
MVI A , 00h
STA 1040h
hlt
nomatch: MVI A , 0FFH
sta 1040h
hlt
 