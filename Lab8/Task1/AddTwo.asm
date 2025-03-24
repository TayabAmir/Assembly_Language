INCLUDE Irvine32.inc
.DATA
    prom BYTE "Enter your marks: ",0
A_G BYTE "Grade: A", 0
B_G BYTE "Grade: B", 0
C_G BYTE "Grade: C", 0
F_G BYTE "Grade: F", 0
error BYTE "Marks cannot be greater than 100", 0


.CODE
_Main PROC
    mov EDX, OFFSET prom
call WriteString
call ReadInt

cmp EAX, 100
ja Err_Label

cmp EAX, 90
jae A_Grade

cmp EAX, 80
jae B_Grade

cmp EAX, 70
jae C_Grade

jmp F_Grade

A_Grade:
   mov EDX, OFFSET A_G
   jmp Ans

B_Grade:
   mov EDX, OFFSET B_G
   jmp Ans

C_Grade:
   mov EDX, OFFSET C_G
   jmp Ans

F_Grade:
   mov EDX, OFFSET F_G
   jmp Ans

Err_Label:
   mov EDX, OFFSET error
    
Ans:
   call WriteString
    CALL ExitProcess

_Main ENDP
END _Main