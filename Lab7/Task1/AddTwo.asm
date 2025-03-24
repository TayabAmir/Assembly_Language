; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

Include Irvine32.inc
ExitProcess proto,dwExitCode:dword

.data
	dataArray DWORD 5 dup(?)
	arraySum DWORD 0
	greaterMsg BYTE "Sum is greater than EAX", 0
	lesserMsg BYTE "Sum is lesser than EAX", 0

.code
main proc
	mov ECX, 5
	mov ESI, 0
L1:
	Call ReadInt
	mov dataArray[ESI], EAX
	add ESI, 4
	loop L1

	mov ECX, 5
	mov ESI, 0
L2:
	mov EAX, dataArray[ESI]
	add arraySum, EAX
	add ESI, 4
	loop L2

	call ReadInt

	cmp EAX, arraySum
	JG L3
	JL L4
	JE L5

L3:
	call msg1
	invoke ExitProcess,0

L4:
	call msg2
	invoke ExitProcess,0

L5:
	invoke ExitProcess,0
main endp 
	
msg1 proc uses EDX
	mov EDX, OFFSET lesserMsg
	call MsgBox
	ret
msg1 endp

msg2 proc uses EDX
	mov EDX, OFFSET greaterMsg
	call MsgBox
	ret
msg2 endp

end main