include irvine32.inc
ExitProcess proto,dwExitCode:dword

.data
	a DWORD 10
	b DWORD 7
.code
main proc
	mov	EAX, a
	sub EAX, b
	mov a, 5
	add a, 6
	imul EAX, a
	imul EAX, 9
	call WriteInt


	mov EAX, +5
	imul EAX, +4
	mov EBX, +3
	add EBX, +7
	imul EBX, +21
	sub EAX, EBX
	call WriteINt
		
	invoke ExitProcess,0
main endp
end main