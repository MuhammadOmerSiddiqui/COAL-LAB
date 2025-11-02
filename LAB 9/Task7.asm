INCLUDE Irvine32.inc
.data
prompt  BYTE "Enter integer (1 to stop): ",0
primeMsg BYTE " is PRIME",0
notMsg   BYTE " is NOT prime",0
.code
IsPrime PROC
	push ebx
	push ecx
	push edx
	mov ebx,eax
	cmp eax,2
	je Prime
	jl NotPrime
	test eax,1
	jz NotPrime
	mov ecx,3
	LoopCheck:
	mov eax,ebx
	cdq
	idiv ecx
	cmp edx,0
	je NotPrime
	cmp ecx,eax
	jg Prime
	add ecx,2
	jmp LoopCheck
	NotPrime:
	mov eax,0
	pop edx
	pop ecx
	pop ebx
	ret
	Prime:
	mov eax,1
	pop edx
	pop ecx
	pop ebx
	ret
IsPrime ENDP
main7 PROC
	ReadAgain:
	mov edx,OFFSET prompt
	call WriteString
	call ReadInt
	cmp eax,1
	je Done
	push eax
	call IsPrime
	mov ecx,eax
	pop eax
	call WriteInt
	cmp ecx,1
	je ShowPrime
	mov edx,OFFSET notMsg
	call WriteString
	call Crlf
	jmp ReadAgain
	ShowPrime:
	mov edx,OFFSET primeMsg
	call WriteString
	call Crlf
	jmp ReadAgain
	Done:
	exit
main7 ENDP
END main7