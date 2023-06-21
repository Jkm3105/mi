
;<Program title>

jmp start
;An array of data bytes is stored beginning from memory location
; 2001H. Length of this array is stored in location 2000H.
; Find largest number of the array and store it in
; memory location 3000H. 
;data


;code
start: LXI H , 2000h
MOV C , M ; length of the array
inx H 
;; logic for the largest number
MOV A , M
Loop: INX H 
CMP M 
JNC Skip
MOV A , M 
Skip: DCR C 
JNZ Loop
STA 3000h
hlt