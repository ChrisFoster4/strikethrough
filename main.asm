%include "equ.include"
%include "macros.include"

section .text
    global _start


section .data
        string db `fooo?`,0
        lineThrough db `\314\266`
        buffer db ``

_start:
    mov r8,0
    call _printString
    exit 0

_printString:
    strikeChar r8
    _printChar
    inc r8
    mov r9b,[string+r8]
    cmp r9b,0
    jne _printString
    ret
