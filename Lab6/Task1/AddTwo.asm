INCLUDE Irvine32.inc 

.data
    myArray1 BYTE 1,2,3,4,5  
    arrSize  = ($ - myArray1)
    sum DWORD ?              

    prompt  BYTE "Enter the number of times: ", 0
    randMsg BYTE "Random Number: ", 0
    sumMsg  BYTE "Sum of reversed array: ", 0

.code
main PROC
    call Randomize  

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov ecx, eax 

L1:
    call intSum

    mov eax, 100
    call RandomRange

    mov edx, OFFSET randMsg
    call WriteString
    call WriteDec
    call Crlf

    loop L1

    call ExitProcess
main ENDP


intSum PROC uses ECX ESI EAX EBX EDX
    mov ecx, arrSize
    mov esi, 0
L2:
    movzx eax, myArray1[esi]  
    push eax                 
    inc esi
    loop L2

    mov ecx, arrSize
    mov esi, 0
    mov eax, 0              
L3:
    pop ebx                   
    mov myArray1[esi], bl      
    add eax, ebx              
    inc esi
    loop L3

    mov sum, eax              

    mov edx, OFFSET sumMsg
    call WriteString

    mov eax, sum
    call WriteHex             
    call Crlf
    call WriteBin             
    call Crlf
    call WriteDec             
    call Crlf
    ret
intSum ENDP

END main