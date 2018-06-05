%include "equ.include"
%include "macros.include"

%macro _printChar 0
    mov rax,1
    mov rdi,1
    mov rsi,buffer
    mov rdx,3 ;unicode UTF-8 characters take 3 bytes
    syscall
%endmacro

section .text
    global _start


section .data
        fizz db `fab`
        lineThrough db `\314\266`
        buffer db ``

_start:
    call _printSetup
    ;mov eax, [fizz]
    ;mov [buffer], eax
    ;mov eax, [lineThrough]
    ;mov [buffer+1], eax
    ;
    ;call _printChar

    ;mov eax, [fizz+1]
    ;mov [buffer], eax
    ;mov eax, [lineThrough]
    ;mov [buffer+1], eax

    ;call _printChar
    exit 0 ;Defined in macros.include


_printSetup:
    mov r8,0 ;Storing loop counter in r8
    call _printLoop
    ret

_printLoop:
    mov rax,[fizz+r8]
    mov [buffer], eax
    mov eax, [lineThrough]
    mov [buffer+1], eax
    _printChar
    inc r8
    cmp r8,3 ;Length of string here. TODO compare current char with 0
    jne _printLoop
    ret
