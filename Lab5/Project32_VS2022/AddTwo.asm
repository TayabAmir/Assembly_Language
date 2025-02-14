; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

Include Irvine32.inc
ExitProcess proto, dwExitCode:dword

.data
	arr WORD 50 dup(5)
	len DWORD LENGTHOF arr

str1   byte   "Hello World", 0
str2   byte   "ABC GHI XYZ", 0
temp     byte   12 dup(0)

.code
main proc
	mov	EAX, SIZEOF arr  ; Number Of Bytes
	call writeInt

	mov ESI, 49
	mov AX, arr[ESI*2]
	call WriteInt

	mov EAX, 0
	mov ECX, len
	L1: 
		add AX, arr[ECX*2-2]
		Loop L1

	mov EDX, 0
	mov ECX, len
	div ECX
	call WriteInt
	
	 ; Exchange contents of str1 and str2
    mov     esi, OFFSET str1
    mov     edi, OFFSET str2
    mov     ebx, OFFSET temp

    ; Copy str1 to temp
    mov     ecx, 12
L2:
    mov     al, [esi]
    mov     [ebx], al
    inc     esi
    inc     ebx
    loop    L2

    ; Copy str2 to str1
    mov     esi, OFFSET str2
    mov     ebx, OFFSET str1
    mov     ecx, 12
L3:
    mov     al, [esi]
    mov     [ebx], al
    inc     esi
    inc     ebx
    loop    L3

    ; Copy temp to str2
    mov     esi, OFFSET temp
    mov     ebx, OFFSET str2
    mov     ecx, 12
L4:
    mov     al, [esi]
    mov     [ebx], al
    inc     esi
    inc     ebx
    loop    L4

    ; Print str2 using str1's name
    mov esi, OFFSET str1
    mov ecx, 12
L5:
    mov al, [esi]
    call WriteChar
    inc esi
    loop L5

	invoke ExitProcess, 0
main endp
end main
