org 100h

jmp main

string db 16, ?, 16 dup(' ')
newline db 13, 10, '$'

main:
    mov dx, offset string
    mov ah, 0ah
    int 21h

    mov bx, 0
    mov bl, string[1]
    mov string[bx+2], '$'  

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset string+2

    int 21h
ret
