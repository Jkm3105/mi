
;<Program title>

jmp start
;Five data bytes are stored in memory location C001H to C005H.
; Count number of ones in each byte and store this count in
; corresponding memory locations D001H to D005H.
;data


;code
start: LXI  H, 0c001h
lXI SP , 0f000h
MVI C , 05H
LXI D , 0d001h ; storing the destination address
LOOP1: PUSH B
	MVI C , 00h
	MVI B , 08h
MOV A , M 
LOOP2: 	RLC 
	JNC Nocount
	inr C
Nocount: dcr b 
	jnz LOOP2
	MOV A , C
	STAX D
	inx H 
	inx D 
POP B
DCR c
jnz LOOP1
hlt