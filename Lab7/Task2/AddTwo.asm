; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

Include Irvine32.inc
ExitProcess proto,dwExitCode:dword

.data
	msg BYTE 50 DUP(?)
	;len DWORD LENGTHOF msg
	sss BYTE "INFINITE LOOP" ,0
	idx1 BYTE 0
.code
main proc
	mov EDX, OFFSET msg
	mov ECX, 50
	call ReadString

	mov AH, 'h'
	call arrayFind
	mov idx1, DL

	
	mov EDX, OFFSET msg
	mov ECX, 50
	call ReadString

	mov ECX, LENGTHOF msg
	mov ESI, 0
L3:
	and msg[ESI], 11011111b
	inc ESI
	loop L3

	mov AH, 'R'
	call arrayFind
	add idx1, DL

	cmp idx1, 25
	jg L5

	mov EDX, OFFSET sss
L4:
	call WriteString
	jmp L4

L5:
	invoke ExitProcess,0
main endp

arrayFind proc uses ECX ESI
	mov ECX, LENGTHOF msg
	mov ESI, 0
L1:
	cmp msg[ESI], AH
	je L2
	inc ESI
	loop L1

	mov DL, 0
	ret
L2:
	mov EDX, ESI
	ret
arrayFind endp
end main