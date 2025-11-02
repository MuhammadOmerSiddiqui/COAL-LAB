INCLUDE irvine32.inc
.data
A_low  DWORD 0FFFFFFFFh
A_high DWORD 0FFFFFFFFh
B_low  DWORD 00000001h
B_high DWORD 00000000h
msgA BYTE "Result (A after addition):",0
.code
Extended_Add PROC
    push ebp
    mov  ebp, esp
    mov  esi, [ebp+8]    
    mov  edi, [ebp+12]
    mov  eax, [esi]
    add  eax, [edi]
    mov  [esi], eax
    mov  eax, [esi+4]
    adc  eax, [edi+4]
    mov  [esi+4], eax
    pop  ebp
    ret 8
Extended_Add ENDP
main6 PROC
    push OFFSET B_low
    push OFFSET A_low
    call Extended_Add
    mov  edx, OFFSET msgA
    call WriteString
    call Crlf
    mov  eax, [A_high]
    call WriteHex
    mov  eax, [A_low]
    call WriteHex
    call Crlf
    exit
main6 ENDP
END main6