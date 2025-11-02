INCLUDE Irvine32.inc
.data
msg BYTE "Product = ",0
.code
BitwiseMultiply PROC
	push ecx
	push edx
	xor edx,edx
	xor ecx,ecx
	mov ecx,ebx
	xor ebx,ebx
	mov ebx,eax
	xor eax,eax
	L1:
	test ecx,1
	jz skip
	add eax,ebx
	skip:
	shl ebx,1
	shr ecx,1
	jnz L1
	pop edx
	pop ecx
	ret
BitwiseMultiply ENDP
main9 PROC
	mov eax,7
	mov ebx,9
	call BitwiseMultiply
	mov edx,OFFSET msg
	call WriteString
	call WriteInt
	call Crlf
	exit
main9 ENDP
END main9