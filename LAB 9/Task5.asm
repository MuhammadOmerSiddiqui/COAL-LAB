INCLUDE Irvine32.inc
.data
val1 SDWORD 100 
val2 SDWORD 20
val3 SDWORD 3
.code
main5 PROC
	mov eax, val2
	cdq
	idiv val3
	push eax 
	mov eax, val1
	cdq
	idiv val2 
	mov ecx, eax 
	pop eax 
	imul eax, ecx 
	mov val1, eax 
	call DumpRegs
	exit
main5 ENDP
END main5