INCLUDE Irvine32.inc
.data
msg BYTE "GCD = ",0
xVals DWORD 48,270,100,56
yVals DWORD 18,192,85,42
count DWORD 4
.code
GCD PROC
	push ebx
	push edx
	mov ebx,[esp+12]
	mov eax,[esp+8]
	cdq
	xor eax,edx
	sub eax,edx
	mov edx,ebx
	cdq
	xor ebx,edx
	sub ebx,edx
	L1:
	cmp ebx,0
	je L2
	mov edx,0
	div ebx
	mov eax,ebx
	mov ebx,edx
	jmp L1
	L2:
	pop edx
	pop ebx
	ret 8
GCD ENDP
main10 PROC
	mov ecx,count
	mov esi,0
	L3:
	push yVals[esi*4]
	push xVals[esi*4]
	call GCD
	mov edx,OFFSET msg
	call WriteString
	call WriteInt
	call Crlf
	inc esi
	loop L3
	exit
main10 ENDP
END main10