INCLUDE Irvine32.inc
.code
main2 PROC
	mov ax, -128 
	shl eax, 16 
	sar eax, 16 
	call DumpRegs
	exit
main2 ENDP
END main2