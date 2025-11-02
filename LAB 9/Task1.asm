INCLUDE Irvine32.inc
.data
msg BYTE "Result = ",0
num DWORD ?
.code
main PROC
	mov eax, 7 ; 
	mov ebx, eax ; 
	shl eax, 4 ; 
	mov ecx, ebx
	shl ecx, 2 ; 
	add eax, ecx 
	add eax, ebx 
	mov num, eax
	mov edx, OFFSET msg
	call WriteString
	mov eax, num
	call WriteInt
	call Crlf
	exit
main ENDP
END main