org 100h

start:
    mov ah, 00 ; for input
    int 16h

    mov dl, al ; for output
    mov ah, 02
    int 21h
exit:
    int 20h
ret

