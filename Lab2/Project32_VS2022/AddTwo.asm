Include Irvine32.inc

ExitProcess proto,dwExitCode:dword

.code
main proc
	; CY Flag
	mov AL,230 
	add AL,44
	add AL, -150

	;SF Flag
	mov AL, 0
	add AL, -10
	add AL, 20

	;OV Flag
	mov AL, +70
	add AL, +80
	add AL, -140

	;ZR Flag
	mov AH, 20
	add AH, -20
	add AH, 30

	;Reset PF Flag
	mov AL, 0
	add AL, 8


	
	invoke ExitProcess,0
main endp

end main