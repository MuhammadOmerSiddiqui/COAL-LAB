INCLUDE Irvine32.inc
.data
decimal_one BYTE "100123456789765"
len DWORD 15
offset_val DWORD 5
msg BYTE "Scaled number: ",0
.code
WriteScaled PROC
	push ebp
	mov ebp,esp
	push esi
	push ebx
	mov esi,[ebp+8]
	mov ecx,[ebp+12]
	mov ebx,[ebp+16]
	L1:
	cmp ecx,ebx
	je dot
	mov al,[esi]
	call WriteChar
	inc esi
	dec ecx
	cmp ecx,0
	jg L1
	jmp done
	dot:
	mov al,'.'
	call WriteChar
	jmp L1
	done:
	pop ebx
	pop esi
	pop ebp
	ret 12
WriteScaled ENDP
main11 PROC
	mov edx,OFFSET msg
	call WriteString
	push offset_val
	push len
	push OFFSET decimal_one
	call WriteScaled
	call Crlf
	exit
main11 ENDP
END main11