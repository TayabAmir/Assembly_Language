; AddTwo.asm - adds two 32-bit integers.
INCLUDE Irvine32.inc  

.data
	array WORD 10,43,0, 23,23,76,32,56
	sentinel WORD 0FFFFh
.code
main PROC
	mov esi,OFFSET array
	mov ecx,LENGTHOF array

	L1: 
		cmp WORD PTR [esi],0 ; check for zero
		jz quit
		add esi, TYPE array
		loop L1

		movzx EAX, sentinel
	jmp valPrint
	quit:
		mov EAX, LengthOf array
		sub EAX, ECX
		
	valPrint:
		call WriteInt
	exit
main ENDP
END main