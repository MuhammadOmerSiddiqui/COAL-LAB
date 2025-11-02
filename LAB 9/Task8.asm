INCLUDE irvine32.inc
.data
plain BYTE "HELLO WORLD",0
key BYTE 2,4,1,0,3,5,2,4,4,6,1,2
len DWORD 11
msg BYTE "Encrypted text: ",0
.code
main8 PROC
	mov esi,OFFSET plain
	mov edi,OFFSET key
	mov ecx,len
	L1:
	cmp BYTE PTR [esi],0
	je done
	mov al,[esi]
	mov bl,[edi]
	test bl,80h
	jz right
	mov cl,bl
	and cl,7
	rol al,cl
	jmp store
	right:
	mov cl,bl
	and cl,7
	ror al,cl
	store:
	mov [esi],al
	inc esi
	inc edi
	dec ecx
	jnz L1
	done:
	mov edx,OFFSET msg
	call WriteString
	mov edx,OFFSET plain
	call WriteString
	call Crlf
	exit
main8 ENDP
END main8