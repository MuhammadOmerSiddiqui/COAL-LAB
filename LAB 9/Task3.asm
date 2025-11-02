INCLUDE Irvine32.inc
.data
timestamp DWORD 0A3F15h
bMinutes BYTE 0
msg BYTE "Minutes = ",0
.code
main3 PROC
	mov eax, timestamp
	shr eax, 5
	and al, 3Fh
	mov bMinutes, al
	mov edx, OFFSET msg
	call WriteString
	movzx eax, bMinutes
	call WriteInt
	call Crlf
	exit
main3 ENDP
END main3