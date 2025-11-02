INCLUDE Irvine32.inc
.code
main4 PROC
	mov ax, 0001h 
	mov bx, 1234h
	mov cx, ax
	and cx, 1 
	shl cx, 15 
	and bx, 7FFFh 
	or bx, cx 
	call DumpRegs
	mov ax, 0001h
	mov bx, 1234h
	shrd bx, ax, 1 
	call DumpRegs
	exit
main4 ENDP
END main4