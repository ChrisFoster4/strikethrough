%include "equ.include"
%include "macros.include"

section .text
    global _start

section .bss
    ;Reserving bytes of space for the user input
    userInput resb USER_STRING_LENGTH

section .data
        lineThrough db `\314\266`
        buffer db ``

_start:
    call _getInput
    call _printString
    exit 0 ;Macro from macros.include

_printString:
    mov r8,0 ;Set the loop counter to 0
    .loop:
        strikeChar r8
        _printBufferChar
        inc r8                 ;Increment loop counter
        mov r9b,[userInput+r8] ;Moving one byte of the user input. One byte contains one char.
        cmp r9b,0
        jne .loop
    ret

_getInput:
    mov rax,SYS_IN
    mov rdi,STDIN
    mov rsi,userInput
    mov rdx,USER_STRING_LENGTH
    syscall
    ret
