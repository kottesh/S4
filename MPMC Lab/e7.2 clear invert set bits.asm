org 100h

.data
num db 56

set db 1     ; (0000 0001) for set, do OR operation
clear db 254 ; (1111 1110) for clear, do AND operation
invert db 1  ; (0000 0001) for invert, do XOR operation

.code

mov al, num

mov dl, set
rol dl, 0
or al, dl

mov dl, clear
rol dl, 5
and al, dl

mov dl, invert
rol dl, 1
xor al, dl

ret
