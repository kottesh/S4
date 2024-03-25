org 100h

.data

str db "I am Martian $"
char db "s"

.code
; for display the string use ah - 09h and int 21h
mov dx, offset str
mov ah, 09h
int 21h

; for reading a char input use ah - 01h and int 21
; and the read input will get stored in the al.
mov ah, 01h
int 21h

; to output a character on the console use ah - 02h and int 21h

mov dl, char
mov ah, 02h
int 21h

; for clearing the consle use ax 00h and int 10h

mov ax, 00h
int 10h


ret
