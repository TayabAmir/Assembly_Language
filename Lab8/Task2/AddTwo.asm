INCLUDE Irvine32.inc
.data
    myArray DWORD -8, 6, 5, 10, -22, 0, 87, 6, 9, -90
    largest DWORD ?

.code
Main PROC
    mov ECX, LENGTHOF myArray
    mov EAX, -2147483648
    mov ESI, 0

L1:
    cmp myArray[ESI * 4], EAX
    jle L2
    mov EAX, myArray[ESI * 4]

L2:
    inc ESI
    loop L1

    call WriteInt
    call CrLf
    mov largest, EAX
    mov ECX, LENGTHOF myArray

L3:
    dec ESI
    mov EAX,  [myArray + (ESI * 4)]
    inc ESI
    mov myArray[ESI * 4], EAX
    dec ESI
    loop L3

    mov EAX, largest
    mov myArray[0], EAX

    mov ECX, LengthOF myArray
    mov ESI, 1
L4:
    mov EAX, myArray[ESI * 4]
    call WriteInt
    call CrLf
    inc ESI
    loop L4

    Invoke ExitProcess, 0

Main ENDP
END Main
