%include "equ.include"
%include "macros.include"

section .text
    global _start


section .data
        fizz db `f`
        lineThrough db `\314\266`
        buffer db ``

_start:
    mov eax, [fizz]
    mov [buffer], eax
    mov eax, [lineThrough]
    mov [buffer+1], eax

    mov rax,1
    mov rdi,1
    mov rsi,buffer
    mov rdx,3
    syscall

    exit 0 ;Defined in macros.include

