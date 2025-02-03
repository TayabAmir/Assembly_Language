; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

Include Irvine32.inc
ExitProcess proto,dwExitCode:dword

str1 TEXTEQU <"Hello World">
str2 TEXTEQU <"Assembly Language">
mon TEXTEQU <"Monday">
tues TEXTEQU <"Tuesday">
wed TEXTEQU <"Wednesday">
thurs TEXTEQU <"Thursday">
fri TEXTEQU <"Friday">
sat TEXTEQU <"Saturday">
sun TEXTEQU <"Sunday">

.data
	aA DWORD 17
	bB DWORD 6
	cC DWORD 9
	ddD DWORD 3

	helStr BYTE str1, 0
	helSize = ($ - helStr) - 1

	assemStr BYTE str2, 0
	assemSize = ($ - assemStr) - 1

	daysOfWeek BYTE mon, 0, tues, 0, wed, 0, thurs, 0, fri, 0, sat,0, sun, 0
.code
main proc
	mov	EAX,aA		
	mov	EBX,bB				
	mov	ECX,cC				
	mov	EDX,ddD
	
	add EAX, EBX
	add ECX, EDX
	sub EAX, ECX
	call WriteInt

	;mov aA, EAX
	mov EAX, helSize
	call WriteInt
	mov EAX, assemSize
	call WriteInt


	invoke ExitProcess,0
main endp
end main